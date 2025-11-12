"""
Status code helpers and mappings for DRIMS
"""

EVENT_STATUS = {
    'A': 'Active',
    'C': 'Closed'
}

ITEM_STATUS = {
    'A': 'Active',
    'I': 'Inactive'
}

WAREHOUSE_STATUS = {
    'A': 'Active',
    'I': 'Inactive'
}

INVENTORY_STATUS = {
    'A': 'Available',
    'U': 'Unavailable'
}

DONATION_STATUS = {
    'E': 'Entered',
    'V': 'Verified'
}

RELIEFRQST_STATUS = {
    0: 'Draft',
    1: 'Awaiting Approval',
    2: 'Cancelled',
    3: 'Submitted',
    4: 'Denied',
    5: 'Part Filled',
    6: 'Closed',
    7: 'Filled'
}

RELIEFRQST_ITEM_STATUS = {
    'R': 'Requested',
    'U': 'Unavailable',
    'W': 'Waiting Availability',
    'D': 'Denied',
    'P': 'Partly Filled',
    'L': 'Limit Allowed',
    'F': 'Filled'
}

RELIEFPKG_STATUS = {
    'P': 'Processing',
    'C': 'Completed',
    'V': 'Verified',
    'D': 'Dispatched'
}

INTAKE_STATUS = {
    'I': 'Incomplete',
    'C': 'Completed',
    'V': 'Verified'
}

URGENCY_IND = {
    'L': 'Low',
    'M': 'Medium',
    'H': 'High',
    'C': 'Critical'
}

URGENCY_BADGE_CLASS = {
    'L': 'secondary',
    'M': 'info',
    'H': 'warning',
    'C': 'danger'
}

def get_status_label(status_code, status_type='event'):
    """Get human-readable status label"""
    mappings = {
        'event': EVENT_STATUS,
        'item': ITEM_STATUS,
        'warehouse': WAREHOUSE_STATUS,
        'inventory': INVENTORY_STATUS,
        'donation': DONATION_STATUS,
        'reliefrqst': RELIEFRQST_STATUS,
        'reliefrqst_item': RELIEFRQST_ITEM_STATUS,
        'reliefpkg': RELIEFPKG_STATUS,
        'intake': INTAKE_STATUS,
        'urgency': URGENCY_IND
    }
    
    return mappings.get(status_type, {}).get(status_code, str(status_code))

def get_status_badge_class(status_code, status_type='event'):
    """Get Bootstrap badge class for status"""
    if status_type == 'urgency':
        return URGENCY_BADGE_CLASS.get(status_code, 'secondary')
    
    active_statuses = ['A', 0, 3, 'P', 'R']
    success_statuses = ['V', 7, 'F']
    danger_statuses = ['C', 'I', 2, 4, 'D', 'U']
    
    if status_code in active_statuses:
        return 'primary'
    elif status_code in success_statuses:
        return 'success'
    elif status_code in danger_statuses:
        return 'secondary'
    else:
        return 'warning'
