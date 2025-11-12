"""
Inventory Management Routes
"""
from flask import Blueprint, render_template, request
from flask_login import login_required
from sqlalchemy import func

from app.db import db
from app.db.models import Inventory, Warehouse, Item

inventory_bp = Blueprint('inventory', __name__, url_prefix='/inventory')

@inventory_bp.route('/')
@login_required
def list_inventory():
    """List inventory summary"""
    warehouse_id = request.args.get('warehouse_id', type=int)
    
    query = db.session.query(
        Inventory,
        Item.item_name,
        Item.sku_code,
        Warehouse.warehouse_name
    ).join(Item).join(Warehouse)
    
    if warehouse_id:
        query = query.filter(Inventory.warehouse_id == warehouse_id)
    
    inventory_items = query.filter(Inventory.status_code == 'A').all()
    warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
    
    return render_template('inventory/list.html', 
                         inventory_items=inventory_items,
                         warehouses=warehouses,
                         selected_warehouse_id=warehouse_id)
