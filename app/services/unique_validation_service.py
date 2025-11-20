"""
Centralized unique field validation service.

Provides pre-save validation for all unique database constraints across DRIMS.
Validates uniqueness before attempting to create or update records, providing
user-friendly error messages instead of raw database constraint errors.
"""

from typing import Optional, Tuple, List
from sqlalchemy import and_
from app import db


class UniqueValidationService:
    """Service for validating unique constraints before database operations."""
    
    @staticmethod
    def validate_unique_field(
        model_class,
        field_name: str,
        value: str,
        current_id: Optional[int] = None,
        id_field_name: str = None,
        friendly_name: str = None
    ) -> Tuple[bool, Optional[str]]:
        """
        Validate that a field value is unique within a model.
        
        Args:
            model_class: SQLAlchemy model class to check
            field_name: Name of the field to validate
            value: Value to check for uniqueness
            current_id: If editing, the ID of the current record (to exclude from check)
            id_field_name: Name of the ID field (defaults to primary key column name)
            friendly_name: Human-readable field name for error messages
        
        Returns:
            Tuple of (is_valid, error_message)
            - (True, None) if unique or valid
            - (False, error_message) if duplicate found
        """
        if not value:
            return True, None
        
        # Get the field attribute from the model
        try:
            field_attr = getattr(model_class, field_name)
        except AttributeError:
            # Field doesn't exist on model, skip validation
            return True, None
        
        # Build query to check for existing value
        query = model_class.query.filter(field_attr == value)
        
        # If editing (current_id provided), exclude the current record
        if current_id is not None:
            if id_field_name is None:
                # Try to get primary key column name
                id_field_name = model_class.__mapper__.primary_key[0].name
            
            id_attr = getattr(model_class, id_field_name)
            query = query.filter(id_attr != current_id)
        
        # Check if any matching record exists
        existing = query.first()
        
        if existing:
            display_name = friendly_name or field_name.replace('_', ' ').title()
            return False, f'{display_name} "{value}" is already in use. Please use a different value.'
        
        return True, None
    
    @staticmethod
    def validate_composite_unique(
        model_class,
        field_values: dict,
        current_id: Optional[int] = None,
        id_field_name: str = None,
        friendly_names: dict = None
    ) -> Tuple[bool, Optional[str]]:
        """
        Validate composite unique constraint (multiple fields together must be unique).
        
        Args:
            model_class: SQLAlchemy model class
            field_values: Dict of field_name: value pairs that form composite key
            current_id: If editing, the ID of the current record
            id_field_name: Name of the ID field
            friendly_names: Dict mapping field names to friendly display names
        
        Returns:
            Tuple of (is_valid, error_message)
        """
        if not field_values:
            return True, None
        
        # Build query with all field conditions
        conditions = []
        for field_name, value in field_values.items():
            if value is None:
                continue
            try:
                field_attr = getattr(model_class, field_name)
                conditions.append(field_attr == value)
            except AttributeError:
                continue
        
        if not conditions:
            return True, None
        
        query = model_class.query.filter(and_(*conditions))
        
        # Exclude current record if editing
        if current_id is not None:
            if id_field_name is None:
                id_field_name = model_class.__mapper__.primary_key[0].name
            id_attr = getattr(model_class, id_field_name)
            query = query.filter(id_attr != current_id)
        
        existing = query.first()
        
        if existing:
            # Build friendly error message
            if friendly_names:
                field_desc = ' + '.join(
                    friendly_names.get(k, k.replace('_', ' ').title())
                    for k in field_values.keys()
                )
            else:
                field_desc = ' + '.join(k.replace('_', ' ').title() for k in field_values.keys())
            
            return False, f'This combination of {field_desc} already exists. Please use different values.'
        
        return True, None
    
    # Convenience methods for common unique validations
    
    @staticmethod
    def validate_warehouse_name(warehouse_name: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate warehouse name uniqueness."""
        from app.db.models import Warehouse
        return UniqueValidationService.validate_unique_field(
            Warehouse, 'warehouse_name', warehouse_name, current_id,
            id_field_name='warehouse_id', friendly_name='Warehouse name'
        )
    
    @staticmethod
    def validate_agency_name(agency_name: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate agency name uniqueness."""
        from app.db.models import Agency
        return UniqueValidationService.validate_unique_field(
            Agency, 'agency_name', agency_name, current_id,
            id_field_name='agency_id', friendly_name='Agency name'
        )
    
    @staticmethod
    def validate_custodian_name(custodian_name: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate custodian name uniqueness."""
        from app.db.models import Custodian
        return UniqueValidationService.validate_unique_field(
            Custodian, 'custodian_name', custodian_name, current_id,
            id_field_name='custodian_id', friendly_name='Custodian name'
        )
    
    @staticmethod
    def validate_item_code(item_code: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate item code uniqueness."""
        from app.db.models import Item
        return UniqueValidationService.validate_unique_field(
            Item, 'item_code', item_code, current_id,
            id_field_name='item_id', friendly_name='Item code'
        )
    
    @staticmethod
    def validate_item_name(item_name: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate item name uniqueness."""
        from app.db.models import Item
        return UniqueValidationService.validate_unique_field(
            Item, 'item_name', item_name, current_id,
            id_field_name='item_id', friendly_name='Item name'
        )
    
    @staticmethod
    def validate_sku_code(sku_code: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate SKU code uniqueness."""
        from app.db.models import Item
        return UniqueValidationService.validate_unique_field(
            Item, 'sku_code', sku_code, current_id,
            id_field_name='item_id', friendly_name='SKU code'
        )
    
    @staticmethod
    def validate_donor_name(donor_name: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate donor name uniqueness."""
        from app.db.models import Donor
        return UniqueValidationService.validate_unique_field(
            Donor, 'donor_name', donor_name, current_id,
            id_field_name='donor_id', friendly_name='Donor name'
        )
    
    @staticmethod
    def validate_donor_code(donor_code: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate donor code uniqueness."""
        from app.db.models import Donor
        return UniqueValidationService.validate_unique_field(
            Donor, 'donor_code', donor_code, current_id,
            id_field_name='donor_id', friendly_name='Donor code'
        )
    
    @staticmethod
    def validate_category_code(category_code: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate item category code uniqueness."""
        from app.db.models import ItemCategory
        return UniqueValidationService.validate_unique_field(
            ItemCategory, 'category_code', category_code, current_id,
            id_field_name='category_id', friendly_name='Category code'
        )
    
    @staticmethod
    def validate_uom_code(uom_code: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate unit of measure code uniqueness."""
        from app.db.models import UnitOfMeasure
        return UniqueValidationService.validate_unique_field(
            UnitOfMeasure, 'uom_code', uom_code, current_id,
            id_field_name='uom_id', friendly_name='UOM code'
        )
    
    @staticmethod
    def validate_user_email(email: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate user email uniqueness."""
        from app.db.models import User
        return UniqueValidationService.validate_unique_field(
            User, 'email', email, current_id,
            id_field_name='user_id', friendly_name='Email'
        )
    
    @staticmethod
    def validate_user_username(username: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate username uniqueness."""
        from app.db.models import User
        return UniqueValidationService.validate_unique_field(
            User, 'username', username, current_id,
            id_field_name='user_id', friendly_name='Username'
        )
    
    @staticmethod
    def validate_role_code(role_code: str, current_id: Optional[int] = None) -> Tuple[bool, Optional[str]]:
        """Validate role code uniqueness."""
        from app.db.models import Role
        return UniqueValidationService.validate_unique_field(
            Role, 'code', role_code, current_id,
            id_field_name='id', friendly_name='Role code'
        )


# Create singleton instance for easy imports
unique_validator = UniqueValidationService()
