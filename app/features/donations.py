"""
Donation Management Routes
"""
from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime, date

from app.db import db
from app.db.models import Donation, Donor, Event, Custodian
from app.core.audit import add_audit_fields

donations_bp = Blueprint('donations', __name__, url_prefix='/donations')

@donations_bp.route('/')
@login_required
def list_donations():
    """List all donations"""
    donations = Donation.query.order_by(Donation.received_date.desc()).all()
    return render_template('donations/list.html', donations=donations)

@donations_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create_donation():
    """Create new donation"""
    if request.method == 'POST':
        donation = Donation()
        donation.donor_id = int(request.form.get('donor_id'))
        donation.event_id = int(request.form.get('event_id'))
        donation.donation_desc = request.form.get('donation_desc')
        donation.received_date = datetime.strptime(request.form.get('received_date'), '%Y-%m-%d').date()
        donation.status_code = 'E'
        
        custodian = Custodian.query.first()
        if custodian:
            donation.custodian_id = custodian.custodian_id
        
        add_audit_fields(donation, current_user.email, is_new=True)
        donation.verify_by_id = current_user.email
        donation.verify_dtime = datetime.now()
        
        db.session.add(donation)
        db.session.commit()
        
        flash(f'Donation #{donation.donation_id} created successfully', 'success')
        return redirect(url_for('donations.list_donations'))
    
    donors = Donor.query.order_by(Donor.donor_name).all()
    events = Event.query.filter_by(status_code='A').order_by(Event.event_name).all()
    
    return render_template('donations/create.html', 
                         donors=donors, 
                         events=events,
                         today=date.today().isoformat())
