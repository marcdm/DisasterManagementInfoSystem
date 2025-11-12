from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime
from sqlalchemy.exc import IntegrityError
from app.db.models import db, Agency, Parish, Event, Warehouse
from app.core.audit import add_audit_fields

agencies_bp = Blueprint('agencies', __name__)

@agencies_bp.route('/')
@login_required
def list_agencies():
    agencies = Agency.query.order_by(Agency.agency_name).all()
    return render_template('agencies/index.html', agencies=agencies)

@agencies_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create():
    if request.method == 'POST':
        agency_name = request.form.get('agency_name', '').strip().upper()
        agency_type = request.form.get('agency_type')
        address1_text = request.form.get('address1_text', '').strip()
        address2_text = request.form.get('address2_text', '').strip() or None
        parish_code = request.form.get('parish_code')
        contact_name = request.form.get('contact_name', '').strip().upper()
        phone_no = request.form.get('phone_no', '').strip()
        email_text = request.form.get('email_text', '').strip().lower() or None
        ineligible_event_id = request.form.get('ineligible_event_id') or None
        warehouse_id = request.form.get('warehouse_id') or None
        status_code = request.form.get('status_code')
        
        if not agency_name or not agency_type or not address1_text or not parish_code or not contact_name or not phone_no or not status_code:
            flash('Please fill in all required fields.', 'danger')
            parishes = Parish.query.all()
            events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
            warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
            return render_template('agencies/create.html', parishes=parishes, events=events, warehouses=warehouses)
        
        if agency_type == 'DISTRIBUTOR' and not warehouse_id:
            flash('DISTRIBUTOR agencies must have an associated warehouse.', 'danger')
            parishes = Parish.query.all()
            events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
            warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
            return render_template('agencies/create.html', parishes=parishes, events=events, warehouses=warehouses)
        
        if agency_type == 'SHELTER' and warehouse_id:
            warehouse_id = None
        
        if Agency.query.filter_by(agency_name=agency_name).first():
            flash(f'An agency with the name {agency_name} already exists.', 'danger')
            parishes = Parish.query.all()
            events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
            warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
            return render_template('agencies/create.html', parishes=parishes, events=events, warehouses=warehouses)
        
        try:
            new_agency = Agency(
                agency_name=agency_name,
                agency_type=agency_type,
                address1_text=address1_text,
                address2_text=address2_text,
                parish_code=parish_code,
                contact_name=contact_name,
                phone_no=phone_no,
                email_text=email_text,
                ineligible_event_id=int(ineligible_event_id) if ineligible_event_id else None,
                warehouse_id=int(warehouse_id) if warehouse_id else None,
                status_code=status_code
            )
            
            add_audit_fields(new_agency, current_user.email)
            
            db.session.add(new_agency)
            db.session.commit()
            
            flash(f'Agency {agency_name} created successfully.', 'success')
            return redirect(url_for('agencies.view', agency_id=new_agency.agency_id))
        except IntegrityError as e:
            db.session.rollback()
            flash('Database constraint violation. Please check that all fields are valid and try again.', 'danger')
            parishes = Parish.query.all()
            events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
            warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
            return render_template('agencies/create.html', parishes=parishes, events=events, warehouses=warehouses)
    
    parishes = Parish.query.all()
    events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
    warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
    return render_template('agencies/create.html', parishes=parishes, events=events, warehouses=warehouses)

@agencies_bp.route('/<int:agency_id>')
@login_required
def view(agency_id):
    agency = Agency.query.get_or_404(agency_id)
    return render_template('agencies/view.html', agency=agency)

@agencies_bp.route('/<int:agency_id>/edit', methods=['GET', 'POST'])
@login_required
def edit(agency_id):
    agency = Agency.query.get_or_404(agency_id)
    
    if request.method == 'POST':
        agency_type = request.form.get('agency_type')
        warehouse_id = request.form.get('warehouse_id') or None
        
        if agency_type == 'DISTRIBUTOR' and not warehouse_id:
            flash('DISTRIBUTOR agencies must have an associated warehouse.', 'danger')
            parishes = Parish.query.all()
            events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
            warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
            return render_template('agencies/edit.html', agency=agency, parishes=parishes, events=events, warehouses=warehouses)
        
        if agency_type == 'SHELTER' and warehouse_id:
            warehouse_id = None
        
        try:
            agency.agency_type = agency_type
            agency.address1_text = request.form.get('address1_text', '').strip()
            agency.address2_text = request.form.get('address2_text', '').strip() or None
            agency.parish_code = request.form.get('parish_code')
            agency.contact_name = request.form.get('contact_name', '').strip().upper()
            agency.phone_no = request.form.get('phone_no', '').strip()
            agency.email_text = request.form.get('email_text', '').strip().lower() or None
            ineligible_event_id = request.form.get('ineligible_event_id') or None
            agency.ineligible_event_id = int(ineligible_event_id) if ineligible_event_id else None
            agency.warehouse_id = int(warehouse_id) if warehouse_id else None
            agency.status_code = request.form.get('status_code')
            
            agency.update_by_id = current_user.email.upper()
            agency.update_dtime = datetime.utcnow()
            agency.version_nbr += 1
            
            db.session.commit()
            
            flash(f'Agency {agency.agency_name} updated successfully.', 'success')
            return redirect(url_for('agencies.view', agency_id=agency.agency_id))
        except IntegrityError as e:
            db.session.rollback()
            flash('Database constraint violation. Please check that all fields are valid and try again.', 'danger')
            parishes = Parish.query.all()
            events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
            warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
            return render_template('agencies/edit.html', agency=agency, parishes=parishes, events=events, warehouses=warehouses)
    
    parishes = Parish.query.all()
    events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
    warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
    return render_template('agencies/edit.html', agency=agency, parishes=parishes, events=events, warehouses=warehouses)
