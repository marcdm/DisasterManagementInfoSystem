"""
Test script for optimistic locking implementation.
Tests concurrent updates to ensure version_nbr prevents conflicts.
"""
import sys
import os

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from flask import Flask
from settings import Config
from app.db import db, init_db
from app.db.models import Item, Warehouse
from app.core.exceptions import OptimisticLockError

app = Flask(__name__)
app.config.from_object(Config)
init_db(app)


def test_optimistic_locking():
    """
    Test optimistic locking by simulating concurrent updates.
    """
    with app.app_context():
        print("=" * 60)
        print("Testing Optimistic Locking on DRIMS")
        print("=" * 60)
        
        # Test 1: Get a test warehouse
        print("\n1. Setting up test data...")
        warehouse = Warehouse.query.first()
        if not warehouse:
            print("   No warehouses found. Skipping test.")
            return
        
        print(f"   Found warehouse: {warehouse.warehouse_name}")
        print(f"   Current version: {warehouse.version_nbr}")
        
        # Test 2: Load the same warehouse in two "sessions"
        print("\n2. Simulating concurrent access...")
        session1_warehouse = Warehouse.query.get(warehouse.warehouse_id)
        session2_warehouse = Warehouse.query.get(warehouse.warehouse_id)
        
        original_version = session1_warehouse.version_nbr
        print(f"   Session 1 loaded warehouse (version {session1_warehouse.version_nbr})")
        print(f"   Session 2 loaded warehouse (version {session2_warehouse.version_nbr})")
        
        # Test 3: Update in session 1 (should succeed)
        print("\n3. Session 1 updates warehouse...")
        old_phone = session1_warehouse.phone_no
        new_phone_1 = "876-555-1111"
        session1_warehouse.phone_no = new_phone_1
        
        try:
            db.session.commit()
            print(f"   ✓ Session 1 update succeeded")
            print(f"   New version: {session1_warehouse.version_nbr}")
            print(f"   Phone changed: {old_phone} → {new_phone_1}")
        except OptimisticLockError as e:
            print(f"   ✗ Session 1 update failed unexpectedly: {e}")
            db.session.rollback()
            return
        
        # Test 4: Update in session 2 (should fail with stale version)
        print("\n4. Session 2 attempts update with stale version...")
        new_phone_2 = "876-555-2222"
        session2_warehouse.phone_no = new_phone_2
        
        try:
            db.session.commit()
            print(f"   ✗ Session 2 update succeeded (SHOULD HAVE FAILED!)")
            print(f"   This indicates optimistic locking is NOT working correctly")
            success = False
        except OptimisticLockError as e:
            print(f"   ✓ Session 2 update failed as expected!")
            print(f"   Error: {e}")
            db.session.rollback()
            success = True
        
        # Test 5: Verify final state
        print("\n5. Verifying final state...")
        final_warehouse = Warehouse.query.get(warehouse.warehouse_id)
        print(f"   Final version: {final_warehouse.version_nbr}")
        print(f"   Final phone: {final_warehouse.phone_no}")
        print(f"   Expected phone: {new_phone_1}")
        
        if final_warehouse.phone_no == new_phone_1 and success:
            print("\n" + "=" * 60)
            print("✓ OPTIMISTIC LOCKING TEST PASSED!")
            print("=" * 60)
        else:
            print("\n" + "=" * 60)
            print("✗ OPTIMISTIC LOCKING TEST FAILED!")
            print("=" * 60)
        
        # Clean up: restore original phone
        print("\n6. Cleaning up...")
        final_warehouse.phone_no = old_phone
        db.session.commit()
        print("   Restored original phone")


def test_item_update():
    """
    Test optimistic locking on Item table.
    """
    with app.app_context():
        print("\n" + "=" * 60)
        print("Testing Optimistic Locking on Item Table")
        print("=" * 60)
        
        item = Item.query.first()
        if not item:
            print("   No items found. Skipping test.")
            return
        
        print(f"\n1. Testing with item: {item.item_name}")
        print(f"   Current version: {item.version_nbr}")
        
        # Load in two sessions
        session1_item = Item.query.get(item.item_id)
        session2_item = Item.query.get(item.item_id)
        
        # Update in session 1
        print("\n2. Session 1 updating reorder level...")
        old_reorder = session1_item.reorder_level
        session1_item.reorder_level = (old_reorder or 0) + 50
        
        try:
            db.session.commit()
            print(f"   ✓ Session 1 update succeeded (version now {session1_item.version_nbr})")
        except OptimisticLockError as e:
            print(f"   ✗ Unexpected error: {e}")
            db.session.rollback()
            return
        
        # Update in session 2 with stale version
        print("\n3. Session 2 attempting update with stale version...")
        session2_item.reorder_level = (old_reorder or 0) + 100
        
        try:
            db.session.commit()
            print("   ✗ Session 2 succeeded (SHOULD HAVE FAILED!)")
            success = False
        except OptimisticLockError as e:
            print(f"   ✓ Session 2 failed as expected: {e}")
            db.session.rollback()
            success = True
        
        # Clean up
        final_item = Item.query.get(item.item_id)
        final_item.reorder_level = old_reorder
        db.session.commit()
        
        if success:
            print("\n✓ Item table optimistic locking test PASSED!")
        else:
            print("\n✗ Item table optimistic locking test FAILED!")


if __name__ == '__main__':
    try:
        test_optimistic_locking()
        test_item_update()
    except Exception as e:
        print(f"\n✗ Test failed with error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
