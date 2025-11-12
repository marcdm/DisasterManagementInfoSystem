"""
Item Management Routes
"""
from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from decimal import Decimal

from app.db import db
from app.db.models import Item, ItemCategory, UnitOfMeasure
from app.core.audit import add_audit_fields

items_bp = Blueprint('items', __name__, url_prefix='/items')

@items_bp.route('/')
@login_required
def list_items():
    """List all items"""
    status_filter = request.args.get('status', 'active')
    
    query = Item.query
    if status_filter == 'active':
        query = query.filter_by(status_code='A')
    elif status_filter == 'inactive':
        query = query.filter_by(status_code='I')
    
    items = query.order_by(Item.item_name).all()
    return render_template('items/list.html', items=items, status_filter=status_filter)

@items_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create_item():
    """Create new item"""
    if request.method == 'POST':
        item = Item()
        item.item_name = request.form.get('item_name').upper()
        item.sku_code = request.form.get('sku_code').upper()
        item.category_code = request.form.get('category_code')
        item.item_desc = request.form.get('item_desc')
        item.reorder_qty = Decimal(request.form.get('reorder_qty'))
        item.default_uom_code = request.form.get('default_uom_code')
        item.usage_desc = request.form.get('usage_desc')
        item.storage_desc = request.form.get('storage_desc')
        item.expiration_apply_flag = request.form.get('expiration_apply_flag') == 'on'
        item.comments_text = request.form.get('comments_text')
        item.status_code = 'A'
        
        add_audit_fields(item, current_user.email, is_new=True)
        
        db.session.add(item)
        db.session.commit()
        
        flash(f'Item "{item.item_name}" created successfully', 'success')
        return redirect(url_for('items.list_items'))
    
    categories = ItemCategory.query.order_by(ItemCategory.category_desc).all()
    uoms = UnitOfMeasure.query.order_by(UnitOfMeasure.uom_desc).all()
    return render_template('items/create.html', categories=categories, uoms=uoms)
