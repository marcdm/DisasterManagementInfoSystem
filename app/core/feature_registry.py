"""
Feature Access Registry for DRIMS

This module provides centralized feature-to-role mapping for the entire application.
It controls access to features across dashboards, navigation, profiles, and backend routes.

Role Codes:
- LO: Logistics Officer  
- LM: Logistics Manager
- DG: Director General (ODPEM)
- DDG: Deputy Director General (ODPEM)
- DIR: Director (ODPEM)
- PEOD: PEOD role (ODPEM)
- AGENCY_USER: Relief agency staff
- INVENTORY_CLERK: Warehouse/inventory staff
- SYSTEM_ADMIN: System administrator

Feature Categories:
- Relief Request Management
- Eligibility Review
- Package Fulfillment
- Inventory Management
- Master Data Management
- Reporting & Analytics
- User & Account Management
- System Notifications

Usage:
    from app.core.feature_registry import FeatureRegistry
    
    if FeatureRegistry.has_access(current_user, 'relief_request_creation'):
        # Show create request button
    
    features = FeatureRegistry.get_dashboard_features(current_user)
    # Returns list of features for user's dashboard
"""

from typing import List, Dict, Optional, Set
from flask import url_for


class FeatureRegistry:
    """
    Centralized registry mapping features to roles, URLs, and UI components.
    This is the single source of truth for feature access control.
    
    Updated: 2025-11-14 - Aligned with actual blueprint routes and RBAC patterns
    """
    
    FEATURES = {
        # =================================================================
        # RELIEF REQUEST MANAGEMENT (Agency Users)
        # =================================================================
        'relief_request_creation': {
            'name': 'Create Relief Requests',
            'description': 'Submit new relief requests for disaster events',
            'roles': ['AGENCY_USER'],
            'url': '/relief-requests/create',
            'icon': 'bi-plus-circle',
            'category': 'relief_requests',
            'dashboard_widget': 'create_request_card',
            'navigation_group': 'relief_requests',
            'priority': 10
        },
        'relief_request_tracking': {
            'name': 'Track My Requests',
            'description': 'View and track status of submitted relief requests',
            'roles': ['AGENCY_USER'],
            'url': '/relief-requests',
            'icon': 'bi-list-check',
            'category': 'relief_requests',
            'dashboard_widget': 'my_requests_widget',
            'navigation_group': 'relief_requests',
            'priority': 9
        },
        
        # =================================================================
        # ELIGIBILITY REVIEW (ODPEM Directors)
        # =================================================================
        'eligibility_review': {
            'name': 'Review Relief Requests',
            'description': 'Review and approve/deny relief request eligibility',
            'roles': ['DG', 'DDG', 'DIR', 'PEOD'],
            'url': '/eligibility/pending',
            'icon': 'bi-clipboard-check',
            'category': 'eligibility',
            'dashboard_widget': 'pending_eligibility_widget',
            'navigation_group': 'eligibility',
            'priority': 20
        },
        'director_dashboard': {
            'name': 'Director Dashboard',
            'description': 'Unified dashboard for ODPEM directors',
            'roles': ['DG', 'DDG', 'DIR', 'PEOD'],
            'url': '/director/dashboard',
            'icon': 'bi-speedometer2',
            'category': 'eligibility',
            'dashboard_widget': 'director_overview',
            'navigation_group': 'dashboard',
            'priority': 25
        },
        
        # =================================================================
        # PACKAGE FULFILLMENT (Logistics Officers & Managers)
        # =================================================================
        'package_preparation': {
            'name': 'Prepare Fulfillment Packages',
            'description': 'Allocate inventory and prepare relief packages',
            'roles': ['LO', 'LM'],
            'url': '/packaging/pending-fulfillment',
            'icon': 'bi-box-seam',
            'category': 'packaging',
            'dashboard_widget': 'pending_fulfillment_widget',
            'navigation_group': 'packaging',
            'priority': 15
        },
        'package_approval': {
            'name': 'Approve Packages',
            'description': 'Review and approve prepared packages for dispatch',
            'roles': ['LM'],
            'url': '/packaging/pending-approval',
            'icon': 'bi-check-circle',
            'category': 'packaging',
            'dashboard_widget': 'approval_queue_widget',
            'navigation_group': 'packaging',
            'priority': 18
        },
        
        # =================================================================
        # INVENTORY MANAGEMENT
        # =================================================================
        'inventory_view': {
            'name': 'View Inventory',
            'description': 'View current stock levels across warehouses',
            'roles': ['LO', 'LM', 'INVENTORY_CLERK', 'DG', 'DDG', 'DIR', 'PEOD', 'SYSTEM_ADMIN'],
            'url': '/inventory',
            'icon': 'bi-boxes',
            'category': 'inventory',
            'dashboard_widget': 'inventory_summary_widget',
            'navigation_group': 'inventory',
            'priority': 12
        },
        'inventory_intake': {
            'name': 'Receive Inventory',
            'description': 'Process incoming inventory and donations',
            'roles': ['LO', 'LM', 'INVENTORY_CLERK', 'SYSTEM_ADMIN'],
            'url': '/intake/list',
            'icon': 'bi-arrow-down-circle',
            'category': 'inventory',
            'dashboard_widget': 'pending_intake_widget',
            'navigation_group': 'inventory',
            'priority': 14
        },
        'inventory_transfers': {
            'name': 'Transfer Inventory',
            'description': 'Transfer items between warehouses',
            'roles': ['LO', 'LM', 'INVENTORY_CLERK', 'SYSTEM_ADMIN'],
            'url': '/transfers',
            'icon': 'bi-arrow-left-right',
            'category': 'inventory',
            'navigation_group': 'inventory',
            'priority': 11
        },
        
        # =================================================================
        # MASTER DATA MANAGEMENT (Admin/System)
        # =================================================================
        'warehouse_management': {
            'name': 'Manage Warehouses',
            'description': 'Create and manage warehouse locations',
            'roles': ['SYSTEM_ADMIN', 'LM'],
            'url': '/warehouses',
            'icon': 'bi-building',
            'category': 'master_data',
            'navigation_group': 'master_data',
            'priority': 5
        },
        'item_catalog': {
            'name': 'Manage Items',
            'description': 'Manage relief item catalog',
            'roles': ['SYSTEM_ADMIN', 'LM'],
            'url': '/items',
            'icon': 'bi-tag',
            'category': 'master_data',
            'navigation_group': 'master_data',
            'priority': 4
        },
        'location_management': {
            'name': 'Manage Locations',
            'description': 'Manage storage locations within warehouses',
            'roles': ['LO', 'LM', 'INVENTORY_CLERK', 'SYSTEM_ADMIN'],
            'url': '/locations',
            'icon': 'bi-geo-alt',
            'category': 'master_data',
            'navigation_group': 'master_data',
            'priority': 3
        },
        'event_management': {
            'name': 'Manage Events',
            'description': 'Manage disaster events',
            'roles': ['SYSTEM_ADMIN', 'DG', 'DDG', 'DIR', 'PEOD'],
            'url': '/events',
            'icon': 'bi-calendar-event',
            'category': 'master_data',
            'navigation_group': 'master_data',
            'priority': 8
        },
        'agency_management': {
            'name': 'Manage Agencies',
            'description': 'Manage relief agencies',
            'roles': ['SYSTEM_ADMIN'],
            'url': '/agencies',
            'icon': 'bi-building',
            'category': 'master_data',
            'navigation_group': 'master_data',
            'priority': 6
        },
        'donor_management': {
            'name': 'Manage Donors',
            'description': 'Manage donor information',
            'roles': ['SYSTEM_ADMIN', 'INVENTORY_CLERK', 'LM'],
            'url': '/donors',
            'icon': 'bi-people',
            'category': 'master_data',
            'navigation_group': 'master_data',
            'priority': 7
        },
        'custodian_management': {
            'name': 'Manage Custodians',
            'description': 'Manage custodian records (ODPEM, etc.)',
            'roles': ['SYSTEM_ADMIN'],
            'url': '/custodians',
            'icon': 'bi-shield-check',
            'category': 'master_data',
            'navigation_group': 'master_data',
            'priority': 6
        },
        'donation_management': {
            'name': 'Manage Donations',
            'description': 'Record and track donations',
            'roles': ['LO', 'LM', 'INVENTORY_CLERK', 'SYSTEM_ADMIN'],
            'url': '/donations',
            'icon': 'bi-gift',
            'category': 'master_data',
            'navigation_group': 'master_data',
            'priority': 7
        },
        
        # =================================================================
        # REPORTING & ANALYTICS
        # =================================================================
        'reports_main': {
            'name': 'Reports',
            'description': 'Access system reports',
            'roles': ['LO', 'LM', 'INVENTORY_CLERK', 'DG', 'DDG', 'DIR', 'PEOD', 'SYSTEM_ADMIN'],
            'url': '/reports',
            'icon': 'bi-file-earmark-bar-graph',
            'category': 'reports',
            'navigation_group': 'reports',
            'priority': 2
        },
        'reports_inventory': {
            'name': 'Inventory Reports',
            'description': 'View inventory summary reports',
            'roles': ['LO', 'LM', 'INVENTORY_CLERK', 'DG', 'DDG', 'DIR', 'PEOD', 'SYSTEM_ADMIN'],
            'url': '/reports/inventory_summary',
            'icon': 'bi-bar-chart',
            'category': 'reports',
            'dashboard_widget': 'inventory_report_link',
            'priority': 2
        },
        'reports_donations': {
            'name': 'Donation Reports',
            'description': 'View donations summary reports',
            'roles': ['INVENTORY_CLERK', 'LM', 'DG', 'DDG', 'DIR', 'PEOD', 'SYSTEM_ADMIN'],
            'url': '/reports/donations_summary',
            'icon': 'bi-graph-up',
            'category': 'reports',
            'dashboard_widget': 'donation_report_link',
            'priority': 2
        },
        
        # =================================================================
        # USER & ACCOUNT MANAGEMENT
        # =================================================================
        'user_management': {
            'name': 'Manage Users',
            'description': 'Create and manage user accounts',
            'roles': ['SYSTEM_ADMIN'],
            'url': '/users',
            'icon': 'bi-person-gear',
            'category': 'admin',
            'navigation_group': 'admin',
            'priority': 1
        },
        'account_requests': {
            'name': 'Review Account Requests',
            'description': 'Review and approve agency account requests',
            'roles': ['SYSTEM_ADMIN'],
            'url': '/account-requests',
            'icon': 'bi-person-plus',
            'category': 'admin',
            'dashboard_widget': 'pending_account_requests',
            'navigation_group': 'admin',
            'priority': 1
        },
        
        # =================================================================
        # NOTIFICATIONS
        # =================================================================
        'notifications': {
            'name': 'Notifications',
            'description': 'View system notifications',
            'roles': ['LO', 'LM', 'DG', 'DDG', 'DIR', 'PEOD', 'AGENCY_USER', 'INVENTORY_CLERK', 'SYSTEM_ADMIN'],
            'url': '/notifications',
            'icon': 'bi-bell',
            'category': 'notifications',
            'navigation_group': 'user',
            'priority': 30
        },
        
        # =================================================================
        # DASHBOARD VIEWS (Role-specific landing pages)
        # =================================================================
        'logistics_dashboard': {
            'name': 'Logistics Dashboard',
            'description': 'Logistics operations overview',
            'roles': ['LO', 'LM'],
            'url': '/dashboard',
            'icon': 'bi-speedometer2',
            'category': 'dashboard',
            'is_dashboard': True,
            'priority': 100
        },
        'agency_dashboard': {
            'name': 'Agency Dashboard',
            'description': 'Agency relief request overview',
            'roles': ['AGENCY_USER'],
            'url': '/dashboard',
            'icon': 'bi-speedometer2',
            'category': 'dashboard',
            'is_dashboard': True,
            'priority': 100
        },
        'admin_dashboard': {
            'name': 'Admin Dashboard',
            'description': 'System administration overview',
            'roles': ['SYSTEM_ADMIN'],
            'url': '/dashboard',
            'icon': 'bi-speedometer2',
            'category': 'dashboard',
            'is_dashboard': True,
            'priority': 100
        },
    }
    
    @classmethod
    def get_user_role_codes(cls, user) -> Set[str]:
        """
        Extract role codes from a user object.
        
        Args:
            user: User object with roles relationship
            
        Returns:
            Set of role code strings
        """
        if not user or not hasattr(user, 'roles'):
            return set()
        return {role.code for role in user.roles}
    
    @classmethod
    def has_access(cls, user, feature_key: str) -> bool:
        """
        Check if a user has access to a specific feature.
        
        Args:
            user: User object with roles
            feature_key: Feature identifier from FEATURES dict
            
        Returns:
            True if user has any role that grants access to the feature
        """
        if feature_key not in cls.FEATURES:
            return False
        
        user_roles = cls.get_user_role_codes(user)
        feature_roles = set(cls.FEATURES[feature_key]['roles'])
        
        return bool(user_roles & feature_roles)
    
    @classmethod
    def get_accessible_features(cls, user) -> List[Dict]:
        """
        Get all features accessible to a user.
        
        Args:
            user: User object with roles
            
        Returns:
            List of feature dictionaries the user can access
        """
        user_roles = cls.get_user_role_codes(user)
        accessible = []
        
        for key, feature in cls.FEATURES.items():
            feature_roles = set(feature['roles'])
            if user_roles & feature_roles:
                accessible.append({
                    'key': key,
                    **feature
                })
        
        return accessible
    
    @classmethod
    def get_dashboard_features(cls, user) -> List[Dict]:
        """
        Get features that should appear on user's dashboard.
        
        Args:
            user: User object with roles
            
        Returns:
            List of features with dashboard widgets, sorted by priority
        """
        accessible = cls.get_accessible_features(user)
        dashboard_features = [
            f for f in accessible 
            if 'dashboard_widget' in f and f['dashboard_widget']
        ]
        
        return sorted(dashboard_features, key=lambda x: x.get('priority', 999), reverse=True)
    
    @classmethod
    def get_navigation_features(cls, user, group: Optional[str] = None) -> List[Dict]:
        """
        Get features for navigation menu.
        
        Args:
            user: User object with roles
            group: Optional navigation group filter
            
        Returns:
            List of features for navigation, sorted by priority
        """
        accessible = cls.get_accessible_features(user)
        
        if group:
            nav_features = [
                f for f in accessible 
                if f.get('navigation_group') == group
            ]
        else:
            nav_features = [f for f in accessible if 'navigation_group' in f]
        
        return sorted(nav_features, key=lambda x: x.get('priority', 999), reverse=True)
    
    @classmethod
    def get_features_by_category(cls, user, category: str) -> List[Dict]:
        """
        Get features by category.
        
        Args:
            user: User object with roles
            category: Feature category
            
        Returns:
            List of features in the category
        """
        accessible = cls.get_accessible_features(user)
        return [f for f in accessible if f.get('category') == category]
    
    @classmethod
    def get_primary_role(cls, user) -> Optional[str]:
        """
        Determine user's primary role based on priority.
        
        Priority order (highest to lowest):
        1. SYSTEM_ADMIN
        2. DG, DDG, DIR, PEOD (Directors)
        3. LM (Logistics Manager)
        4. LO (Logistics Officer)
        5. INVENTORY_CLERK
        6. AGENCY_USER
        
        Args:
            user: User object with roles
            
        Returns:
            Primary role code or None
        """
        ROLE_PRIORITY = [
            'SYSTEM_ADMIN',
            'DG',
            'DDG',
            'DIR',
            'PEOD',
            'LM',
            'LO',
            'INVENTORY_CLERK',
            'AGENCY_USER'
        ]
        
        user_roles = cls.get_user_role_codes(user)
        
        for role in ROLE_PRIORITY:
            if role in user_roles:
                return role
        
        return list(user_roles)[0] if user_roles else None
    
    @classmethod
    def get_role_display_name(cls, role_code: str) -> str:
        """
        Get human-readable name for a role code.
        
        Args:
            role_code: Role code string
            
        Returns:
            Display name for the role
        """
        ROLE_NAMES = {
            'SYSTEM_ADMIN': 'System Administrator',
            'DG': 'Director General',
            'DDG': 'Deputy Director General',
            'DIR': 'Director',
            'PEOD': 'PEOD',
            'LM': 'Logistics Manager',
            'LO': 'Logistics Officer',
            'INVENTORY_CLERK': 'Inventory Clerk',
            'AGENCY_USER': 'Agency User'
        }
        return ROLE_NAMES.get(role_code, role_code)
