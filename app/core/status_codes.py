"""
Relief Request Status Codes - Canonical Mapping
Based on ODPEM AIDMGMT-3 Schema
Database constraint: c_reliefrqst_3 CHECK (status_code BETWEEN 1 AND 7)

Status Code Mapping (as per aidmgmt-3.sql):
0 = Draft (preparing request, not yet submitted)
1 = Awaiting approval (submitted to ODPEM, pending review)
2 = Cancelled (request cancelled by agency or ODPEM)
3 = Submitted (formally submitted, under ODPEM review)
4 = Denied (request denied by ODPEM)
5 = Part filled (partially fulfilled, some items allocated)
6 = Closed (request closed/completed)
7 = Filled (fully fulfilled, all items allocated)
"""

class ReliefRequestStatus:
    DRAFT = 0
    AWAITING_APPROVAL = 1
    CANCELLED = 2
    SUBMITTED = 3
    DENIED = 4
    PART_FILLED = 5
    CLOSED = 6
    FILLED = 7
    
    STATUS_CHOICES = {
        DRAFT: 'Draft',
        AWAITING_APPROVAL: 'Awaiting Approval',
        CANCELLED: 'Cancelled',
        SUBMITTED: 'Submitted',
        DENIED: 'Denied',
        PART_FILLED: 'Partially Filled',
        CLOSED: 'Closed',
        FILLED: 'Filled'
    }
    
    BADGE_CLASSES = {
        DRAFT: 'bg-secondary',
        AWAITING_APPROVAL: 'bg-info',
        CANCELLED: 'bg-dark',
        SUBMITTED: 'bg-primary',
        DENIED: 'bg-danger',
        PART_FILLED: 'bg-warning',
        CLOSED: 'bg-success',
        FILLED: 'bg-success'
    }
    
    @classmethod
    def get_label(cls, status_code):
        """Get human-readable label for a status code"""
        return cls.STATUS_CHOICES.get(status_code, 'Unknown')
    
    @classmethod
    def get_badge_class(cls, status_code):
        """Get Bootstrap badge class for a status code"""
        return cls.BADGE_CLASSES.get(status_code, 'bg-secondary')
    
    @classmethod
    def is_editable(cls, status_code):
        """Check if request is in an editable state"""
        return status_code == cls.DRAFT
    
    @classmethod
    def can_submit(cls, status_code):
        """Check if request can be submitted"""
        return status_code == cls.DRAFT
    
    @classmethod
    def can_cancel(cls, status_code):
        """Check if request can be cancelled"""
        return status_code in [cls.DRAFT, cls.AWAITING_APPROVAL, cls.SUBMITTED]


class UrgencyLevel:
    HIGH = 'H'
    MEDIUM = 'M'
    LOW = 'L'
    
    URGENCY_CHOICES = {
        HIGH: 'High',
        MEDIUM: 'Medium',
        LOW: 'Low'
    }
    
    BADGE_CLASSES = {
        HIGH: 'bg-danger',
        MEDIUM: 'bg-warning text-dark',
        LOW: 'bg-info text-dark'
    }
    
    @classmethod
    def get_label(cls, urgency_ind):
        """Get human-readable label for urgency indicator"""
        return cls.URGENCY_CHOICES.get(urgency_ind, 'Unknown')
    
    @classmethod
    def get_badge_class(cls, urgency_ind):
        """Get Bootstrap badge class for urgency indicator"""
        return cls.BADGE_CLASSES.get(urgency_ind, 'bg-secondary')
