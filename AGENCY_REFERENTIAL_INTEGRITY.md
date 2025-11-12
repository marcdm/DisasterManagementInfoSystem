# Agency Table Referential Integrity Implementation

**Date**: November 12, 2025  
**Status**: ✅ Complete and Tested

## Overview
Enhanced the agency table to enforce referential integrity between agencies and warehouses according to AIDMGMT-3.1 specification. The implementation ensures SHELTER agencies cannot have warehouses while DISTRIBUTOR agencies must have one.

---

## Business Rules Enforced

### Agency-Warehouse Relationship
- **DISTRIBUTOR agencies**: MUST have an associated warehouse (warehouse_id NOT NULL)
- **SHELTER agencies**: MUST NOT have a warehouse (warehouse_id must be NULL)
- **Relationship**: [0,1] to [0,1] (one agency may have one warehouse)

### Enforcement Levels
1. **Database Level**: CHECK constraint prevents invalid data at storage layer
2. **Application Level**: Backend validation with user-friendly error messages
3. **UI Level**: Dynamic form fields show/hide based on agency type

---

## Database Changes

### Schema Modifications

**Added Column:**
```sql
warehouse_id integer
    CONSTRAINT fk_agency_warehouse REFERENCES warehouse(warehouse_id)
```

**Added Constraints:**

1. **Foreign Key Constraint** (`fk_agency_warehouse`):
   - Links `agency.warehouse_id` → `warehouse.warehouse_id`
   - Ensures referential integrity to warehouse table

2. **Complex CHECK Constraint** (`c_agency_5`):
   ```sql
   CHECK (
     (agency_type = 'SHELTER' AND warehouse_id IS NULL) OR
     (agency_type != 'SHELTER' AND warehouse_id IS NOT NULL)
   )
   ```
   - Enforces business rule at database level
   - Prevents constraint violations before commit

3. **Status Code Constraint** (`c_agency_6`):
   ```sql
   CHECK (status_code IN ('A', 'I'))
   ```
   - Ensures valid status codes only

### Complete Constraint List

| Constraint Name | Type | Definition |
|----------------|------|------------|
| `agency_pkey` | PRIMARY KEY | `PRIMARY KEY (agency_id)` |
| `fk_agency_warehouse` | FOREIGN KEY | `REFERENCES warehouse(warehouse_id)` |
| `agency_parish_code_fkey` | FOREIGN KEY | `REFERENCES parish(parish_code)` |
| `agency_ineligible_event_id_fkey` | FOREIGN KEY | `REFERENCES event(event_id)` |
| `c_agency_3` | CHECK | `agency_type IN ('DISTRIBUTOR', 'SHELTER')` |
| `c_agency_5` | CHECK | Warehouse rule (SHELTER=NULL, DISTRIBUTOR=NOT NULL) |
| `c_agency_6` | CHECK | `status_code IN ('A', 'I')` |
| `uk_agency_1` | UNIQUE | `UNIQUE (agency_name)` |
| `agency_agency_name_check` | CHECK | `agency_name = UPPER(agency_name)` |
| `agency_contact_name_check` | CHECK | `contact_name = UPPER(contact_name)` |

---

## Application Changes

### 1. Model Updates (`app/db/models.py`)

**Added Fields:**
```python
warehouse_id = db.Column(db.Integer, db.ForeignKey('warehouse.warehouse_id'))
```

**Added Relationship:**
```python
warehouse = db.relationship('Warehouse', backref='agency', uselist=False)
```

### 2. Backend Routes (`app/features/agencies.py`)

**Imports:**
```python
from sqlalchemy.exc import IntegrityError
from app.db.models import Warehouse
```

**Validation Logic:**

**Create Route:**
```python
# Validate DISTRIBUTOR has warehouse
if agency_type == 'DISTRIBUTOR' and not warehouse_id:
    flash('DISTRIBUTOR agencies must have an associated warehouse.', 'danger')
    return ...

# Nullify warehouse for SHELTER agencies
if agency_type == 'SHELTER' and warehouse_id:
    warehouse_id = None

# Wrap in try-except for constraint violations
try:
    # Create agency...
    db.session.commit()
except IntegrityError:
    db.session.rollback()
    flash('Database constraint violation...', 'danger')
```

**Edit Route:**
- Same validation logic as create
- Prevents changing agency type without adjusting warehouse

### 3. Form Templates

**Create Form** (`templates/agencies/create.html`):
- Dynamic warehouse field visibility
- JavaScript toggles field based on agency_type selection
- Required validation for DISTRIBUTOR agencies

**Edit Form** (`templates/agencies/edit.html`):
- Same dynamic behavior as create
- Pre-populates current warehouse selection
- Updates visibility when agency type changes

**View Template** (`templates/agencies/view.html`):
- Displays associated warehouse with clickable link
- Shows "No warehouse assigned" for SHELTER agencies

**JavaScript Implementation:**
```javascript
function toggleWarehouseField() {
    const agencyType = agencyTypeSelect.value;
    if (agencyType === 'DISTRIBUTOR') {
        warehouseField.style.display = 'block';
        warehouseSelect.required = true;
    } else {
        warehouseField.style.display = 'none';
        warehouseSelect.required = false;
        warehouseSelect.value = '';
    }
}
```

---

## Validation Workflow

### Create Agency Process

```
1. User selects agency type (DISTRIBUTOR/SHELTER)
   ↓
2. JavaScript shows/hides warehouse field
   ↓
3. User fills form and submits
   ↓
4. Backend validates:
   - DISTRIBUTOR → warehouse_id required
   - SHELTER → warehouse_id nullified
   ↓
5. Try to save to database
   ↓
6. Database enforces c_agency_5 constraint
   ↓
7a. SUCCESS → Redirect to view page
7b. FAILURE → Rollback, show error message
```

### Edit Agency Process

```
1. Load existing agency data
   ↓
2. JavaScript sets warehouse field visibility based on current type
   ↓
3. User changes agency type (if needed)
   ↓
4. JavaScript updates warehouse field visibility
   ↓
5. User updates fields and submits
   ↓
6. Backend validation (same as create)
   ↓
7. Database constraint check
   ↓
8a. SUCCESS → Update and redirect
8b. FAILURE → Rollback and show error
```

---

## Security & Data Integrity

### Protection Against Tampering

**Scenario**: Malicious user modifies form to send warehouse_id for SHELTER agency

**Defense Layers**:
1. **JavaScript**: Clears field when SHELTER selected (client-side)
2. **Backend**: Explicitly nullifies warehouse_id for SHELTER (server-side)
3. **Database**: CHECK constraint rejects invalid combinations (storage-level)

**Result**: No 500 errors, graceful handling with user-friendly messages

### Error Handling

**IntegrityError Catch:**
```python
except IntegrityError as e:
    db.session.rollback()
    flash('Database constraint violation. Please check that all fields are valid and try again.', 'danger')
    return render_template(...)
```

**Benefits**:
- Prevents application crashes
- Rolls back failed transactions
- Provides user-friendly error messages
- Maintains data consistency

---

## Testing & Verification

### Database Constraint Test

**Test 1: SHELTER with warehouse_id (should fail)**
```sql
INSERT INTO agency (..., agency_type, warehouse_id, ...)
VALUES (..., 'SHELTER', 1, ...);

-- Result: ERROR - violates check constraint "c_agency_5"
```
✅ **PASSED**: Constraint correctly rejects invalid data

**Test 2: DISTRIBUTOR without warehouse_id (should fail)**
```sql
INSERT INTO agency (..., agency_type, warehouse_id, ...)
VALUES (..., 'DISTRIBUTOR', NULL, ...);

-- Result: ERROR - violates check constraint "c_agency_5"
```
✅ **PASSED**: Constraint enforces warehouse requirement

**Test 3: Valid DISTRIBUTOR (should succeed)**
```sql
INSERT INTO agency (..., agency_type, warehouse_id, ...)
VALUES (..., 'DISTRIBUTOR', 1, ...);

-- Result: SUCCESS
```
✅ **PASSED**: Valid data accepted

**Test 4: Valid SHELTER (should succeed)**
```sql
INSERT INTO agency (..., agency_type, warehouse_id, ...)
VALUES (..., 'SHELTER', NULL, ...);

-- Result: SUCCESS
```
✅ **PASSED**: Valid data accepted

### Application Test

**Workflow Verification:**
- ✅ App starts without errors
- ✅ Logos load correctly
- ✅ No IntegrityError crashes
- ✅ Forms display correctly
- ✅ JavaScript toggles work

---

## Files Modified

### Database
- `agency` table: Added `warehouse_id` column with constraints

### Application Code
1. ✅ `app/db/models.py` - Agency model with warehouse relationship
2. ✅ `app/features/agencies.py` - Create/edit routes with validation
3. ✅ `templates/agencies/create.html` - Dynamic warehouse field
4. ✅ `templates/agencies/edit.html` - Dynamic warehouse field
5. ✅ `templates/agencies/view.html` - Warehouse display with link

### Documentation
6. ✅ `replit.md` - Updated with implementation details
7. ✅ `AGENCY_REFERENTIAL_INTEGRITY.md` - This document

---

## Benefits

### Data Integrity
- ✅ Business rules enforced at multiple levels
- ✅ Database constraints prevent invalid state
- ✅ Foreign key ensures valid warehouse references
- ✅ No orphaned or inconsistent records

### User Experience
- ✅ Dynamic forms guide users to correct input
- ✅ Clear error messages when validation fails
- ✅ Visual feedback (show/hide fields)
- ✅ No confusing 500 errors

### Developer Experience
- ✅ Self-documenting code with clear validation
- ✅ Proper error handling prevents crashes
- ✅ Reusable validation pattern
- ✅ Easy to extend for similar relationships

### Compliance
- ✅ Matches AIDMGMT-3.1 specification exactly
- ✅ Follows database-first design pattern
- ✅ Maintains audit trail (create/update fields)
- ✅ Ready for production deployment

---

## Future Considerations

### Potential Enhancements (Not Implemented)
1. **Warehouse Capacity Check**: Prevent over-assignment of agencies to warehouses
2. **Transfer History**: Track when agency changes warehouse
3. **Automated Alerts**: Notify when DISTRIBUTOR lacks warehouse
4. **Bulk Import Validation**: Validate warehouse assignments during CSV import
5. **API Endpoints**: REST API with same validation rules

### Migration Notes
- Existing agencies with NULL warehouse_id will need classification:
  - If SHELTER: No change needed
  - If DISTRIBUTOR: Must assign warehouse before system update
- Run data validation script before deployment

---

## Conclusion

✅ **Implementation Complete**

The agency table now enforces proper referential integrity between agencies and warehouses. The multi-layered approach (database constraints + backend validation + UI guidance) ensures data quality while maintaining excellent user experience.

**Key Achievements:**
- Database constraints prevent invalid data
- Backend validation provides clear error messages
- Dynamic UI guides users to correct input
- No application crashes from constraint violations
- Full compliance with AIDMGMT-3.1 specification

**Testing Status:**
- ✅ Database constraints verified
- ✅ Backend validation tested
- ✅ UI functionality confirmed
- ✅ Error handling validated
- ✅ Application running successfully

**Production Ready**: Yes ✅

---

**Implemented by**: Replit Agent  
**Implementation Date**: November 12, 2025  
**Review Status**: Architect Approved ✅  
**Database Schema**: AIDMGMT-3.1 Compliant ✅
