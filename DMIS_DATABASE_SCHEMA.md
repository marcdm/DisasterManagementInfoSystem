# DMIS Database Schema Documentation

**Disaster Management Information System (DMIS)**  
**Government of Jamaica - ODPEM**  
**Generated**: November 22, 2025

---

## Overview

The DMIS database consists of **47 tables** organized into the following categories:

1. **Master Data & Reference Tables** (11 tables)
2. **User Management & Security** (7 tables)
3. **Inventory Management** (5 tables)
4. **Donation Management** (6 tables)
5. **Relief Request & Distribution** (8 tables)
6. **Transfer Management** (7 tables)
7. **System & Audit Tables** (3 tables)

---

## 1. Master Data & Reference Tables

### 1.1 `item` - Item Master
Master catalog of all relief items managed in the system.

**Primary Key**: `item_id` (serial)

**Key Columns**:
- `item_id` - Unique item identifier
- `item_code` - Business item code (unique)
- `item_name` - Item name
- `itemcatg_code` - Category code (FK → itemcatg)
- `uom_code` - Unit of measure (FK → unitofmeasure)
- `is_active` - Active status flag

**Constraints**:
- Unique constraint on `item_code`
- Check: `item_code = UPPER(item_code)`
- Check: `item_name length >= 3`

---

### 1.2 `itemcatg` - Item Category
Categories for classifying relief items.

**Primary Key**: `itemcatg_code` (varchar)

**Key Columns**:
- `itemcatg_code` - Category code (uppercase)
- `itemcatg_name` - Category name
- `parent_catg_code` - Parent category for hierarchical structure

**Constraints**:
- Check: `itemcatg_code = UPPER(itemcatg_code)`
- Self-referencing FK for parent category

---

### 1.3 `unitofmeasure` - Unit of Measure
Standard units for measuring quantities.

**Primary Key**: `uom_code` (varchar)

**Key Columns**:
- `uom_code` - UOM code (uppercase)
- `uom_name` - UOM name
- `uom_type` - Type (COUNT, WEIGHT, VOLUME, etc.)

**Constraints**:
- Check: `uom_code = UPPER(uom_code)`
- Check: `uom_type IN ('COUNT', 'WEIGHT', 'VOLUME', 'LENGTH', 'AREA')`

---

### 1.4 `warehouse` - Warehouse Master
Physical warehouses for storing relief supplies.

**Primary Key**: `warehouse_id` (serial)

**Key Columns**:
- `warehouse_id` - Unique warehouse identifier
- `warehouse_code` - Business warehouse code
- `warehouse_name` - Warehouse name
- `parish_code` - Parish location (FK → parish)
- `is_active` - Active status flag

**Audit Fields**: create_by_id, create_dtime, update_by_id, update_dtime, version_nbr

---

### 1.5 `location` - Storage Locations
Specific storage locations within warehouses.

**Primary Key**: `location_id` (serial)

**Key Columns**:
- `location_id` - Unique location identifier
- `location_code` - Business location code
- `warehouse_id` - Parent warehouse (FK → warehouse)
- `location_type` - Type (SHELF, BIN, ZONE, etc.)
- `is_active` - Active status flag

---

### 1.6 `agency` - Relief Agencies
Organizations requesting or distributing relief supplies.

**Primary Key**: `agency_id` (serial)

**Key Columns**:
- `agency_id` - Unique agency identifier
- `agency_code` - Business agency code
- `agency_name` - Agency name
- `parish_code` - Parish (FK → parish)
- `is_active` - Active status flag

---

### 1.7 `donor` - Donor Master
Individuals or organizations donating relief supplies.

**Primary Key**: `donor_id` (serial)

**Key Columns**:
- `donor_id` - Unique donor identifier
- `donor_code` - Business donor code
- `donor_name` - Donor name
- `country_code` - Country (FK → country)
- `is_active` - Active status flag

---

### 1.8 `custodian` - Warehouse Custodians
Personnel responsible for warehouse management.

**Primary Key**: `custodian_id` (serial)

**Key Columns**:
- `custodian_id` - Unique custodian identifier
- `custodian_code` - Business custodian code
- `first_name`, `last_name` - Custodian name
- `warehouse_id` - Assigned warehouse (FK → warehouse)
- `is_active` - Active status flag

---

### 1.9 `parish` - Jamaica Parishes
Administrative divisions in Jamaica.

**Primary Key**: `parish_code` (varchar)

**Key Columns**:
- `parish_code` - Parish code (2-char uppercase)
- `parish_name` - Parish name

---

### 1.10 `country` - Country Master
Countries for international donors.

**Primary Key**: `country_code` (varchar)

**Key Columns**:
- `country_code` - ISO country code
- `country_name` - Country name

---

### 1.11 `event` - Disaster Events
Disaster events triggering relief operations.

**Primary Key**: `event_id` (serial)

**Key Columns**:
- `event_id` - Unique event identifier
- `event_code` - Business event code
- `event_name` - Event name/description
- `event_date` - Date of disaster event
- `is_active` - Active status flag

---

## 2. User Management & Security

### 2.1 `user` - System Users
Application users with authentication and profile information.

**Primary Key**: `user_id` (varchar, 20)

**Key Columns**:
- `user_id` - Unique user identifier (username)
- `email` - Email address (unique)
- `password_hash` - Hashed password
- `first_name`, `last_name` - User name
- `primary_role_code` - Primary role (FK → role)
- `is_active` - Active status flag
- `last_login_dtime` - Last login timestamp

**Security**: Passwords stored as bcrypt hashes

**Audit Fields**: create_by_id, create_dtime, update_by_id, update_dtime, version_nbr

---

### 2.2 `role` - User Roles
System roles for access control.

**Primary Key**: `role_code` (varchar)

**Key Columns**:
- `role_code` - Role code (uppercase)
- `role_name` - Role name
- `role_level` - Hierarchy level (1=highest)
- `is_active` - Active status flag

**Standard Roles**: SA (System Admin), ED (Executive Director), LM (Logistics Manager), LO (Logistics Officer), WC (Warehouse Clerk)

---

### 2.3 `permission` - System Permissions
Granular permissions for features and actions.

**Primary Key**: `permission_code` (varchar)

**Key Columns**:
- `permission_code` - Permission code
- `permission_name` - Permission name
- `feature_code` - Feature area
- `is_active` - Active status flag

---

### 2.4 `role_permission` - Role-Permission Mapping
Many-to-many relationship between roles and permissions.

**Primary Key**: Composite (`role_code`, `permission_code`)

**Foreign Keys**:
- `role_code` → role
- `permission_code` → permission

---

### 2.5 `user_role` - User-Role Assignments
Many-to-many relationship assigning roles to users.

**Primary Key**: Composite (`user_id`, `role_code`)

**Foreign Keys**:
- `user_id` → user
- `role_code` → role

---

### 2.6 `user_warehouse` - User-Warehouse Access
Warehouse access permissions for users.

**Primary Key**: Composite (`user_id`, `warehouse_id`)

**Foreign Keys**:
- `user_id` → user
- `warehouse_id` → warehouse

---

### 2.7 `agency_account_request` - External Account Requests
Requests from agencies for system access.

**Primary Key**: `request_id` (serial)

**Key Columns**:
- `request_id` - Unique request identifier
- `agency_id` - Requesting agency (FK → agency)
- `first_name`, `last_name` - Requestor name
- `email` - Email address
- `status_code` - Request status (P=Pending, A=Approved, R=Rejected)
- `reviewed_by_id` - Reviewer user (FK → user)

**Audit Table**: `agency_account_request_audit` tracks all changes

---

## 3. Inventory Management

### 3.1 `inventory` - Warehouse Inventory
Aggregate inventory quantities by warehouse and item.

**Primary Key**: Composite (`inventory_id`, `item_id`)

**Key Columns**:
- `inventory_id` - Warehouse ID (FK → warehouse)
- `item_id` - Item ID (FK → item)
- `usable_qty` - Available usable quantity
- `reserved_qty` - Reserved for packages
- `defective_qty` - Defective quantity
- `expired_qty` - Expired quantity

**Constraints**:
- Check: All quantities >= 0
- Unique constraint on (`inventory_id`, `item_id`)

**Audit Fields**: version_nbr for optimistic locking

---

### 3.2 `itembatch` - Batch-Level Inventory
Detailed batch tracking with expiry dates (FEFO/FIFO).

**Primary Key**: `batch_id` (serial)

**Key Columns**:
- `batch_id` - Unique batch identifier
- `inventory_id` - Warehouse (FK → inventory)
- `item_id` - Item (FK → item)
- `batch_no` - Batch number (nullable for non-tracked items)
- `batch_date` - Manufacturing/receipt date (nullable)
- `expiry_date` - Expiration date (nullable)
- `usable_qty` - Available quantity
- `reserved_qty` - Reserved quantity
- `defective_qty`, `expired_qty` - Non-usable quantities

**Batch Tracking**:
- Items WITH batch tracking: batch_no and batch_date populated
- Items WITHOUT batch tracking: batch_no and batch_date are NULL

**Constraints**:
- Partial unique index on (`inventory_id`, `item_id`, `batch_no`) WHERE batch_no IS NOT NULL
- Partial unique index on (`inventory_id`, `item_id`) WHERE batch_no IS NULL

---

### 3.3 `batchlocation` - Batch Storage Locations
Physical locations where batches are stored.

**Primary Key**: Composite (`batch_id`, `location_id`)

**Key Columns**:
- `batch_id` - Batch (FK → itembatch)
- `location_id` - Storage location (FK → location)
- `quantity` - Quantity at this location

---

### 3.4 `item_location` - Item-Location Assignments
Designated storage locations for items.

**Primary Key**: Composite (`item_id`, `location_id`)

**Foreign Keys**:
- `item_id` → item
- `location_id` → location

---

### 3.5 `transaction` - Inventory Transactions
Audit trail of all inventory movements.

**Primary Key**: `transaction_id` (serial)

**Key Columns**:
- `transaction_id` - Unique transaction identifier
- `transaction_type` - Type (INTAKE, DISPATCH, TRANSFER, ADJUSTMENT)
- `inventory_id` - Warehouse
- `item_id` - Item
- `batch_id` - Batch (nullable)
- `quantity` - Transaction quantity
- `reference_type` - Source document type
- `reference_id` - Source document ID
- `transaction_dtime` - Transaction timestamp

---

## 4. Donation Management

### 4.1 `donation` - Donation Records
Donations of relief supplies from donors.

**Primary Key**: `donation_id` (serial)

**Key Columns**:
- `donation_id` - Unique donation identifier
- `donor_id` - Donor (FK → donor)
- `donation_date` - Date of donation
- `status_code` - Status (D=Draft, S=Submitted, R=Received, C=Cancelled)
- `event_id` - Related event (FK → event, nullable)
- `comments_text` - Notes

**Audit Fields**: create_by_id, create_dtime, update_by_id, update_dtime, version_nbr

---

### 4.2 `donation_item` - Donation Line Items
Items included in donations.

**Primary Key**: Composite (`donation_id`, `item_id`)

**Key Columns**:
- `donation_id` - Parent donation (FK → donation)
- `item_id` - Item (FK → item)
- `total_qty` - Total donated quantity
- `uom_code` - Unit of measure (FK → unitofmeasure)
- `estimated_value` - Estimated value

**Constraints**:
- UOM must match item master UOM (enforced in application)

---

### 4.3 `dnintake` - Donation Intake Headers
Physical receipt of donations into warehouses.

**Primary Key**: Composite (`donation_id`, `inventory_id`)

**Key Columns**:
- `donation_id` - Source donation (FK → donation)
- `inventory_id` - Receiving warehouse (FK → inventory)
- `intake_date` - Date received
- `status_code` - Status (P=Processed, V=Verified)
- `verify_by_id` - Verification user
- `verify_dtime` - Verification timestamp

---

### 4.4 `dnintake_item` - Donation Intake Items (Batch-Level)
**NEW SCHEMA**: Batch-level tracking with nullable batch support.

**Primary Key**: `intake_item_id` (serial) - **Surrogate key**

**Key Columns**:
- `intake_item_id` - Unique intake item identifier
- `donation_id` - Parent intake (FK → dnintake)
- `inventory_id` - Warehouse
- `item_id` - Item (FK → item)
- `batch_no` - Batch number (**nullable**)
- `batch_date` - Batch date (**nullable**)
- `expiry_date` - Expiration date (nullable)
- `uom_code` - Unit of measure (FK → unitofmeasure)
- `avg_unit_value` - Average unit value
- `usable_qty` - Usable quantity received
- `defective_qty` - Defective quantity
- `expired_qty` - Expired quantity
- `status_code` - Status (P=Processed, V=Verified)

**Batch Tracking Support**:
- Items WITH batches: Both batch_no and batch_date populated
- Items WITHOUT batches: Both batch_no and batch_date are NULL
- Validation enforces pairing: both filled or both empty

**Unique Constraints**:
- `uk_dnintake_item_batch`: Unique (`donation_id`, `inventory_id`, `item_id`, `batch_no`) WHERE batch_no IS NOT NULL
- `uk_dnintake_item_null_batch`: Unique (`donation_id`, `inventory_id`, `item_id`) WHERE batch_no IS NULL

**Check Constraints**:
- `batch_no IS NULL OR batch_no = UPPER(batch_no)`
- `batch_date IS NULL OR batch_date <= CURRENT_DATE`
- All quantities >= 0

**Audit Fields**: create_by_id, create_dtime, update_by_id, update_dtime, version_nbr

---

### 4.5 `dbintake` - Debris Intake Headers
Receipt of returned/defective items.

**Primary Key**: Composite (`inventory_id`, `intake_id`)

---

### 4.6 `dbintake_item` - Debris Intake Items
Items from debris returns.

**Primary Key**: Composite (`inventory_id`, `intake_id`, `item_id`)

---

## 5. Relief Request & Distribution

### 5.1 `reliefrqst` - Relief Requests
Requests for relief supplies from agencies.

**Primary Key**: `request_id` (serial)

**Key Columns**:
- `request_id` - Unique request identifier
- `agency_id` - Requesting agency (FK → agency)
- `event_id` - Related disaster event (FK → event)
- `request_date` - Date of request
- `status_code` - Status (D=Draft, S=Submitted, A=Approved, E=Eligible, F=Fulfilled, R=Rejected)
- `approved_by_id` - Approval user
- `approved_dtime` - Approval timestamp

**Universal Visibility**: All Logistics Officers and Managers see ALL approved/eligible requests

**Audit Fields**: create_by_id, create_dtime, update_by_id, update_dtime, version_nbr

---

### 5.2 `reliefrqst_item` - Relief Request Items
Items requested in relief requests.

**Primary Key**: Composite (`request_id`, `item_id`)

**Key Columns**:
- `request_id` - Parent request (FK → reliefrqst)
- `item_id` - Item requested (FK → item)
- `requested_qty` - Quantity requested
- `approved_qty` - Quantity approved (nullable)
- `uom_code` - Unit of measure (FK → unitofmeasure)

---

### 5.3 `reliefrqst_status` - Request Status History
Audit trail of request status changes.

**Primary Key**: `status_id` (serial)

**Key Columns**:
- `status_id` - Unique status record
- `request_id` - Parent request (FK → reliefrqst)
- `status_code` - New status
- `status_dtime` - Timestamp of change
- `changed_by_id` - User making change
- `comments_text` - Notes

---

### 5.4 `reliefrqstitem_status` - Request Item Status History
Audit trail of item-level status changes.

**Primary Key**: `item_status_id` (serial)

---

### 5.5 `reliefpkg` - Relief Packages
Prepared packages for distribution.

**Primary Key**: `package_id` (serial)

**Key Columns**:
- `package_id` - Unique package identifier
- `request_id` - Fulfilling request (FK → reliefrqst)
- `inventory_id` - Source warehouse (FK → inventory)
- `package_date` - Preparation date
- `status_code` - Status (D=Draft, P=Prepared, X=Dispatched)
- `dispatch_dtime` - Dispatch timestamp

**Draft Packages**: Reserve inventory in itembatch.reserved_qty

**Audit Fields**: create_by_id, create_dtime, update_by_id, update_dtime, version_nbr

---

### 5.6 `reliefpkg_item` - Relief Package Items (Batch-Level)
Items allocated to packages with batch tracking.

**Primary Key**: Composite (`package_id`, `batch_id`)

**Key Columns**:
- `package_id` - Parent package (FK → reliefpkg)
- `batch_id` - Source batch (FK → itembatch)
- `item_id` - Item (for denormalization)
- `allocated_qty` - Quantity allocated from this batch

**Batch Allocation**:
- Uses FEFO (First Expiry, First Out) allocation
- Supports batch-level editing and re-allocation
- Synchronizes with itembatch.reserved_qty

---

### 5.7 `distribution_package` - Distribution Headers
Logical grouping of packages for distribution.

**Primary Key**: `distribution_id` (serial)

---

### 5.8 `distribution_package_item` - Distribution Package Items
Items in distribution packages.

**Primary Key**: Composite (`distribution_id`, `package_id`)

---

### 5.9 `relief_request_fulfillment_lock` - Concurrency Control
Pessimistic locks for package creation to prevent double-fulfillment.

**Primary Key**: `request_id` (int)

**Key Columns**:
- `request_id` - Locked request (FK → reliefrqst)
- `locked_by_user_id` - User holding lock
- `locked_at` - Lock timestamp
- `expires_at` - Lock expiration

---

## 6. Transfer Management

### 6.1 `transfer` - Warehouse Transfers
Transfers of inventory between warehouses.

**Primary Key**: `transfer_id` (serial)

**Key Columns**:
- `transfer_id` - Unique transfer identifier
- `from_inventory_id` - Source warehouse (FK → inventory)
- `to_inventory_id` - Destination warehouse (FK → inventory)
- `transfer_date` - Transfer date
- `status_code` - Status (D=Draft, S=Submitted, T=In-Transit, R=Received)
- `event_id` - Related event (FK → event, nullable)

**Audit Fields**: create_by_id, create_dtime, update_by_id, update_dtime, version_nbr

---

### 6.2 `transfer_item` - Transfer Line Items
Items being transferred with batch tracking.

**Primary Key**: Composite (`transfer_id`, `batch_id`)

**Key Columns**:
- `transfer_id` - Parent transfer (FK → transfer)
- `batch_id` - Source batch (FK → itembatch)
- `item_id` - Item
- `transfer_qty` - Quantity transferred

---

### 6.3 `transfer_request` - Transfer Requests
Requests for inventory transfers.

**Primary Key**: `transfer_request_id` (serial)

---

### 6.4 `rtintake` - Return/Transfer Intake Headers
Receipt of returns or transfers.

**Primary Key**: Composite (`inventory_id`, `intake_id`)

---

### 6.5 `rtintake_item` - Return/Transfer Intake Items
Items from returns/transfers.

**Primary Key**: Composite (`inventory_id`, `intake_id`, `item_id`)

---

### 6.6 `xfreturn` - Transfer Return Headers
Returns of transferred items.

**Primary Key**: Composite (`transfer_id`, `inventory_id`)

---

### 6.7 `xfreturn_item` - Transfer Return Items
Items being returned from transfers.

**Primary Key**: Composite (`transfer_id`, `inventory_id`, `item_id`)

---

## 7. System & Audit Tables

### 7.1 `notification` - User Notifications
In-app notification system.

**Primary Key**: `notification_id` (serial)

**Key Columns**:
- `notification_id` - Unique notification identifier
- `user_id` - Target user (FK → user)
- `notification_type` - Type (INFO, WARNING, ACTION_REQUIRED, etc.)
- `title` - Notification title
- `message` - Notification message
- `reference_type` - Related entity type
- `reference_id` - Related entity ID
- `is_read` - Read status flag
- `read_dtime` - Read timestamp
- `created_dtime` - Creation timestamp

**Features**:
- Real-time badge counters
- Offcanvas panel display
- Deep-linking to related entities
- Bulk mark-as-read operations

---

### 7.2 `agency_account_request_audit` - Account Request Audit Trail
Audit trail for agency account requests.

**Primary Key**: `audit_id` (serial)

**Key Columns**:
- `audit_id` - Unique audit record
- `request_id` - Parent request (FK → agency_account_request)
- `action` - Action performed (CREATED, APPROVED, REJECTED, etc.)
- `changed_by_id` - User performing action
- `changed_dtime` - Timestamp
- `old_status`, `new_status` - Status change tracking

---

### 7.3 Standard Audit Fields
Most transactional tables include these audit fields:

- `create_by_id` (varchar, 20) - Creating user
- `create_dtime` (timestamp) - Creation timestamp (Jamaica time)
- `update_by_id` (varchar, 20) - Last updating user
- `update_dtime` (timestamp) - Last update timestamp (Jamaica time)
- `version_nbr` (int) - Optimistic locking version

**Timezone**: All timestamps use Jamaica Standard Time (UTC-05:00)

---

## Key Relationships

### Foreign Key Summary

**User Management**:
- user → role (primary_role_code)
- user_role → user, role
- role_permission → role, permission
- user_warehouse → user, warehouse

**Inventory**:
- inventory → warehouse, item
- itembatch → inventory, item
- batchlocation → itembatch, location
- item_location → item, location

**Donations**:
- donation → donor, event
- donation_item → donation, item, unitofmeasure
- dnintake → donation, inventory
- dnintake_item → dnintake, donation_item, item, unitofmeasure

**Relief Requests**:
- reliefrqst → agency, event
- reliefrqst_item → reliefrqst, item, unitofmeasure
- reliefpkg → reliefrqst, inventory
- reliefpkg_item → reliefpkg, itembatch, item

**Transfers**:
- transfer → inventory (from), inventory (to), event
- transfer_item → transfer, itembatch, item

---

## Database Constraints & Validation

### Check Constraints
- All code fields: UPPER case enforcement
- All quantity fields: >= 0
- Date validations: batch_date <= CURRENT_DATE, expiry_date >= CURRENT_DATE
- Status codes: IN ('D', 'S', 'A', ...) with specific allowed values per table

### Unique Constraints
- Business code fields: warehouse_code, item_code, donor_code, etc.
- Composite natural keys where appropriate
- Partial unique indexes for nullable batch tracking

### Optimistic Locking
All transactional tables use `version_nbr` for concurrent update detection.

---

## Indexing Strategy

### Primary Indexes
- All primary keys (serial or composite)

### Foreign Key Indexes
- Automatic indexes on all foreign key columns

### Business Indexes
- `dk_*` prefixed indexes for data key lookups
- Composite indexes on frequently joined columns

### Partial Indexes
- `uk_dnintake_item_batch`: For non-NULL batch tracking
- `uk_dnintake_item_null_batch`: For NULL batch aggregation

---

## Data Integrity Rules

### Cascade Behaviors
Most foreign keys use `ON DELETE RESTRICT` to prevent orphaned data.

### Business Rules Enforcement
1. **Batch Pairing**: batch_no and batch_date must both be filled or both empty
2. **UOM Consistency**: All transactions must use item master UOM
3. **Status Progression**: Specific allowed status transitions per workflow
4. **Quantity Validation**: usable_qty + reserved_qty <= total quantities

---

## Special Features

### 1. Nullable Batch Support (dnintake_item, itembatch)
- Supports items with and without batch tracking
- Partial unique indexes prevent duplicate entries for both cases
- Aggregation logic for NULL batch items

### 2. FEFO/FIFO Allocation
- Batch allocation prioritizes earliest expiry dates
- Supports batch-level editing in relief packages
- Real-time reservation synchronization

### 3. Universal Visibility
- Approved/eligible relief requests visible to all LO/LM roles
- No user-based filtering for collaborative fulfillment

### 4. Optimistic Locking
- All transactional tables use version_nbr
- Prevents lost updates in concurrent scenarios

### 5. Jamaica Standard Time
- All timestamps in UTC-05:00
- Consistent timezone across application and database

---

## Table Count by Category

| Category | Tables | Percentage |
|----------|--------|------------|
| Master Data & Reference | 11 | 23% |
| User Management & Security | 7 | 15% |
| Inventory Management | 5 | 11% |
| Donation Management | 6 | 13% |
| Relief Request & Distribution | 9 | 19% |
| Transfer Management | 7 | 15% |
| System & Audit | 3 | 6% |
| **TOTAL** | **47** | **100%** |

---

## Schema Version History

### Current Version (November 2025)
- Added surrogate primary key to `dnintake_item` (intake_item_id)
- Made `batch_no` and `batch_date` nullable in `dnintake_item`
- Added partial unique indexes for batch tracking
- Updated check constraints for nullable batch fields

### Previous Updates
- Enhanced `itembatch` with nullable batch support
- Added `relief_request_fulfillment_lock` for concurrency
- Implemented notification system
- Added agency account request workflow

---

## Database Size & Statistics

**Total Tables**: 47  
**Total Sequences**: 28  
**Total Indexes**: 150+  
**Total Foreign Keys**: 80+  
**Schema Size**: ~269 KB (DDL only)

---

**End of Schema Documentation**
