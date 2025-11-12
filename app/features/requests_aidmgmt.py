"""
Relief Request Management Routes (AIDMGMT Workflow)
"""
from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime, date
from decimal import Decimal

from app.db import db
from app.db.models import ReliefRqst, ReliefRqstItem, Agency, Item
from app.core.audit import add_audit_fields

requests_bp = Blueprint('requests', __name__, url_prefix='/requests')

@requests_bp.route('/')
@login_required
def list_requests():
    """List all relief requests"""
    status_filter = request.args.get('status', 'all')
    
    query = ReliefRqst.query
    if status_filter == 'pending':
        query = query.filter(ReliefRqst.status_code.in_([0, 1, 3]))
    elif status_filter == 'completed':
        query = query.filter(ReliefRqst.status_code.in_([6, 7]))
    
    requests = query.order_by(ReliefRqst.request_date.desc()).all()
    return render_template('requests/list.html', requests=requests, status_filter=status_filter)

@requests_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create_request():
    """Create new relief request"""
    if request.method == 'POST':
        relief_request = ReliefRqst()
        relief_request.agency_id = int(request.form.get('agency_id'))
        relief_request.request_date = datetime.strptime(request.form.get('request_date'), '%Y-%m-%d').date()
        relief_request.urgency_ind = request.form.get('urgency_ind')
        relief_request.status_code = 0
        
        add_audit_fields(relief_request, current_user.email, is_new=True)
        
        db.session.add(relief_request)
        db.session.flush()
        
        item_ids = request.form.getlist('item_id[]')
        item_qtys = request.form.getlist('item_qty[]')
        item_urgencies = request.form.getlist('item_urgency[]')
        
        for item_id, qty, urgency in zip(item_ids, item_qtys, item_urgencies):
            if item_id and qty:
                item = ReliefRqstItem()
                item.reliefrqst_id = relief_request.reliefrqst_id
                item.item_id = int(item_id)
                item.request_qty = Decimal(qty)
                item.urgency_ind = urgency
                item.status_code = 'R'
                item.version_nbr = 1
                db.session.add(item)
        
        db.session.commit()
        
        flash(f'Relief request #{relief_request.reliefrqst_id} created successfully', 'success')
        return redirect(url_for('requests.list_requests'))
    
    agencies = Agency.query.order_by(Agency.agency_name).all()
    items = Item.query.filter_by(status_code='A').order_by(Item.item_name).all()
    urgency_levels = ['L', 'M', 'H', 'C']
    
    return render_template('requests/create.html', 
                         agencies=agencies, 
                         items=items,
                         urgency_levels=urgency_levels,
                         today=date.today().isoformat())

@requests_bp.route('/<int:request_id>')
@login_required
def view_request(request_id):
    """View relief request details"""
    relief_request = ReliefRqst.query.get_or_404(request_id)
    return render_template('requests/view.html', request=relief_request)
