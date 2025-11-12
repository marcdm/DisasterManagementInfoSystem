"""
Warehouse Management Routes
"""
from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user

from app.db import db
from app.db.models import Warehouse, Parish, Custodian
from app.core.audit import add_audit_fields

warehouses_bp = Blueprint('warehouses', __name__, url_prefix='/warehouses')

@warehouses_bp.route('/')
@login_required
def list_warehouses():
    """List all warehouses"""
    status_filter = request.args.get('status', 'active')
    
    query = Warehouse.query
    if status_filter == 'active':
        query = query.filter_by(status_code='A')
    elif status_filter == 'inactive':
        query = query.filter_by(status_code='I')
    
    warehouses = query.order_by(Warehouse.warehouse_name).all()
    return render_template('warehouses/list.html', warehouses=warehouses, status_filter=status_filter)

@warehouses_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create_warehouse():
    """Create new warehouse"""
    if request.method == 'POST':
        warehouse = Warehouse()
        warehouse.warehouse_name = request.form.get('warehouse_name').upper()
        warehouse.warehouse_type = request.form.get('warehouse_type')
        warehouse.address1_text = request.form.get('address1_text')
        warehouse.address2_text = request.form.get('address2_text')
        warehouse.parish_code = request.form.get('parish_code')
        warehouse.contact_name = request.form.get('contact_name').upper()
        warehouse.phone_no = request.form.get('phone_no')
        warehouse.email_text = request.form.get('email_text')
        warehouse.status_code = 'A'
        
        custodian = Custodian.query.first()
        if custodian:
            warehouse.custodian_id = custodian.custodian_id
        
        add_audit_fields(warehouse, current_user.email, is_new=True)
        
        db.session.add(warehouse)
        db.session.commit()
        
        flash(f'Warehouse "{warehouse.warehouse_name}" created successfully', 'success')
        return redirect(url_for('warehouses.list_warehouses'))
    
    parishes = Parish.query.order_by(Parish.parish_name).all()
    warehouse_types = ['MAIN', 'HUB', 'SUB-HUB', 'AGENCY']
    return render_template('warehouses/create.html', parishes=parishes, warehouse_types=warehouse_types)
