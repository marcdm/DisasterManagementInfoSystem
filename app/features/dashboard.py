from flask import Blueprint, render_template
from flask_login import login_required
from sqlalchemy import func, desc
from app.db.models import (
    db, Inventory, Item, Warehouse, NeedsList, Fulfilment, 
    Event, Donor, Agency, User
)
from datetime import datetime, timedelta

dashboard_bp = Blueprint('dashboard', __name__)

@dashboard_bp.route('/')
@login_required
def index():
    total_items = Item.query.filter_by(status_code='A').count()
    total_warehouses = Warehouse.query.filter_by(status_code='A').count()
    total_events = Event.query.filter_by(status_code='A').count()
    total_users = User.query.count()
    
    total_inventory_value = db.session.query(
        func.sum(Inventory.usable_qty * Item.unit_cost)
    ).join(Item).filter(
        Inventory.usable_qty > 0,
        Item.status_code == 'A'
    ).scalar() or 0
    
    low_stock_items = db.session.query(
        Item.item_id, 
        Item.item_name,
        func.sum(Inventory.usable_qty).label('total_qty'),
        Item.reorder_level
    ).join(Inventory).filter(
        Item.status_code == 'A'
    ).group_by(
        Item.item_id, Item.item_name, Item.reorder_level
    ).having(
        func.sum(Inventory.usable_qty) <= Item.reorder_level
    ).limit(10).all()
    
    warehouse_stock = db.session.query(
        Warehouse.warehouse_id,
        Warehouse.warehouse_name,
        func.count(Inventory.item_id).label('item_count'),
        func.sum(Inventory.usable_qty).label('total_qty')
    ).join(Inventory).filter(
        Warehouse.status_code == 'A',
        Inventory.usable_qty > 0
    ).group_by(
        Warehouse.warehouse_id, Warehouse.warehouse_name
    ).all()
    
    recent_needs = NeedsList.query.order_by(desc(NeedsList.create_dtime)).limit(5).all()
    recent_fulfilments = Fulfilment.query.order_by(desc(Fulfilment.create_dtime)).limit(5).all()
    active_events = Event.query.filter_by(status_code='A').order_by(desc(Event.event_start_date)).limit(5).all()
    
    needs_by_status = db.session.query(
        NeedsList.status,
        func.count(NeedsList.needs_list_id).label('count')
    ).group_by(NeedsList.status).all()
    
    fulfilment_by_status = db.session.query(
        Fulfilment.status,
        func.count(Fulfilment.fulfilment_id).label('count')
    ).group_by(Fulfilment.status).all()
    
    return render_template('dashboard/index.html',
        now=datetime.now(),
        total_items=total_items,
        total_warehouses=total_warehouses,
        total_events=total_events,
        total_users=total_users,
        total_inventory_value=total_inventory_value,
        low_stock_items=low_stock_items,
        warehouse_stock=warehouse_stock,
        recent_needs=recent_needs,
        recent_fulfilments=recent_fulfilments,
        active_events=active_events,
        needs_by_status=dict(needs_by_status),
        fulfilment_by_status=dict(fulfilment_by_status)
    )
