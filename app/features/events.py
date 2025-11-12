"""
Event Management Routes
"""
from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime, date

from app.db import db
from app.db.models import Event
from app.core.audit import add_audit_fields

events_bp = Blueprint('events', __name__, url_prefix='/events')

@events_bp.route('/')
@login_required
def list_events():
    """List all events"""
    status_filter = request.args.get('status', 'all')
    
    query = Event.query
    if status_filter == 'active':
        query = query.filter_by(status_code='A')
    elif status_filter == 'closed':
        query = query.filter_by(status_code='C')
    
    events = query.order_by(Event.start_date.desc()).all()
    return render_template('events/list.html', events=events, status_filter=status_filter)

@events_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create_event():
    """Create new event"""
    if request.method == 'POST':
        event = Event()
        event.event_type = request.form.get('event_type')
        event.start_date = datetime.strptime(request.form.get('start_date'), '%Y-%m-%d').date()
        event.event_name = request.form.get('event_name').upper()
        event.event_desc = request.form.get('event_desc')
        event.impact_desc = request.form.get('impact_desc')
        event.status_code = 'A'
        
        add_audit_fields(event, current_user.email, is_new=True)
        
        db.session.add(event)
        db.session.commit()
        
        flash(f'Event "{event.event_name}" created successfully', 'success')
        return redirect(url_for('events.list_events'))
    
    event_types = ['STORM', 'TORNADO', 'FLOOD', 'TSUNAMI', 'FIRE', 'EARTHQUAKE', 'WAR', 'EPIDEMIC']
    return render_template('events/create.html', event_types=event_types, today=date.today().isoformat())

@events_bp.route('/<int:event_id>/close', methods=['POST'])
@login_required
def close_event(event_id):
    """Close an event"""
    event = Event.query.get_or_404(event_id)
    
    if event.status_code == 'C':
        flash('Event is already closed', 'warning')
        return redirect(url_for('events.list_events'))
    
    event.status_code = 'C'
    event.closed_date = date.today()
    event.reason_desc = request.form.get('reason_desc', 'Closed by user')
    
    add_audit_fields(event, current_user.email, is_new=False)
    
    db.session.commit()
    
    flash(f'Event "{event.event_name}" closed successfully', 'success')
    return redirect(url_for('events.list_events'))
