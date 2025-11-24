# DMIS - Disaster Management Information System

## Overview
DMIS (Disaster Management Information System) is a web-based platform for the Government of Jamaica's ODPEM, designed to manage the entire lifecycle of disaster relief supplies. This includes inventory tracking, donation management, relief request processing, and distribution across multiple warehouses. The system aims to ensure compliance with government processes, support disaster event coordination, supply allocation, and provide robust user administration with Role-Based Access Control (RBAC). Its core purpose is to deliver a modern, efficient, and user-friendly solution for disaster preparedness and response, emphasizing security and comprehensive management capabilities such as inventory transfers, location tracking, analytics, and reporting.

## Recent Changes (November 24, 2025)
- **Donation Intake Table Schema Migration**:
  - Updated dnintake table to match target schema definition
  - Made update_dtime and verify_dtime nullable (matches workflow where they're set later)
  - Renamed constraints to standard naming: c_dnintake_1 (intake_date check), c_dnintake_2 (status_code check), fk_dnintake_donation
  - Confirmed inventory_id FK points to warehouse(warehouse_id) as per target schema
  - Updated DonationIntake model to reflect correct FK relationships
  - Zero functional regression: Existing donation intake code works unchanged
  - Architect reviewed: No code accesses removed inventory relationship; warehouse FK correct

- **Donation Item Table Schema Migration**:
  - Added new columns to support enhanced donation tracking:
    - `donation_type` (CHAR(5), default 'GOODS'): Tracks whether donation is GOODS or FUNDS
    - `item_cost` (DECIMAL(10,2), default 0.00): Purchase cost for goods or donated value for funds
    - `addon_cost` (DECIMAL(10,2), default 0.00): Total add-on costs (shipping, etc.)
    - `update_by_id` (VARCHAR(20)): User who last updated the record
    - `update_dtime` (TIMESTAMP): Last update timestamp
  - Added validation constraints:
    - c_donation_item_0: donation_type must be 'GOODS' or 'FUNDS'
    - c_donation_item_1a: item_qty >= 0.00 (renamed from c_donation_item_1)
    - c_donation_item_1b: item_cost >= 0.00
    - c_donation_item_1c: addon_cost >= 0.00 (relaxed constraint for current app compatibility)
  - Maintained nullable verify_by_id/verify_dtime to preserve existing verification workflow
  - All defaults ensure backward compatibility with existing donation creation code
  - Updated DonationItem model in models.py to reflect new schema
  - Zero functional regression: All existing donation workflows work unchanged
  - Architect reviewed: Compatible with current application behavior, no security issues

- **Donation Intake Item Table Schema Migration**:
  - Changed primary key from autoincrement intake_item_id to composite PK (donation_id, inventory_id, item_id, batch_no)
  - Made batch_no, batch_date, expiry_date NOT NULL (all donation intake items must have batch tracking)
  - Removed intake_item_id autoincrement column (no longer needed with composite PK)
  - Enforced strict check constraints without NULL allowances:
    - c_dnintake_item_1a: batch_no = UPPER(batch_no)
    - c_dnintake_item_1b: batch_date <= CURRENT_DATE
    - c_dnintake_item_1c: expiry_date >= CURRENT_DATE
    - c_dnintake_item_1d: avg_unit_value > 0.00
    - c_dnintake_item_2: usable_qty >= 0.00
    - c_dnintake_item_3: defective_qty >= 0.00
    - c_dnintake_item_4: expired_qty >= 0.00 (fixed from checking defective_qty)
    - c_dnintake_item_5: status_code IN ('P', 'V')
  - Created indexes dk_dnintake_item_1 (inventory_id, item_id) and dk_dnintake_item_2 (item_id)
  - All foreign key relationships maintained: fk_dnintake_item_intake, fk_dnintake_item_donation_item, fk_dnintake_item_unitofmeasure
  - Updated DonationIntakeItem model to reflect composite PK and strict NOT NULL constraints
  - Zero security regression: All CSP, CSRF, cache-control, cookies, SRI protections maintained
  - Architect reviewed: Schema matches target structure, no breaking changes, all referential integrity intact

- **Master Records Disappearing Fix**:
  - Fixed intermittent issue where newly created warehouses/users appeared briefly then disappeared from list views
  - **Warehouse Fix**: After creation, now redirects to list with `filter='all'` instead of detail view, ensuring new records are immediately visible regardless of previous filter state
  - **User List Fix**: Added pageshow event listener to reset client-side filters when page is restored from browser back/forward cache
  - Root cause: Browser back button preserved previous filter URLs (warehouses) or cached JavaScript state (users), causing new records to be filtered out
  - Zero security regression: All CSP, CSRF, cache-control protections maintained
  - Architect reviewed: No regressions, all security controls intact

- **Duplicate Donation Items Fix**:
  - Fixed bug where same item could be added multiple times to a single donation
  - Added server-side validation to detect and prevent duplicate item_ids in donation form submissions
  - Displays user-friendly error message showing item name when duplicates are detected
  - Prevents database IntegrityError on donation_item table's composite primary key (donation_id, item_id)
  - Zero regression; all existing donation functionality preserved

## User Preferences
- **Communication style**: Simple, everyday language.
- **UI/UX Requirements**:
  - All pages MUST have consistent look and feel with Relief Package preparation pages
  - Modern, polished design with summary cards, filter tabs, and clean layouts
  - Easy to use and user-friendly across all features
  - Consistent navigation patterns throughout the application

## System Architecture
The application employs a modular blueprint architecture with a database-first approach, built upon a pre-existing ODPEM `aidmgmt-3.sql` schema.

### Technology Stack
- **Backend**: Python 3.11, Flask 3.0.3
- **Database ORM**: SQLAlchemy 2.0.32 with Flask-SQLAlchemy
- **Authentication**: Flask-Login 0.6.3 with Werkzeug
- **Frontend**: Server-side rendering with Jinja2, Bootstrap 5.3.3, Bootstrap Icons
- **Data Processing**: Pandas 2.2.2

### System Design
- **UI/UX Design**: Emphasizes a consistent modern UI, comprehensive design system, shared Jinja2 components, GOJ branding, accessibility (WCAG 2.1 AA), and standardized workflow patterns. Features role-specific dashboards and complete management modules for various entities with CRUD operations, validation, and optimistic locking.
- **Donation Processing**: Manages the full workflow for donations, including intake, verification, batch-level tracking, expiry date management, and integration with warehouse inventory. Includes features for preventing duplicate donation items, and tracking donation origin and value.
- **Database Architecture**: Based on a 40-table ODPEM schema, ensuring data consistency, auditability, precision, and optimistic locking. Features an enhanced `public.user` table, a new `itembatch` table for batch-level inventory (FEFO/FIFO), and a composite primary key for the `inventory` table. Includes tables for currency and country data.
- **Relief Package Cancellation Workflow**: Implemented safe cancellation workflow for relief packages with full reservation rollback, using optimistic locking and transactional integrity.
- **Role-Based Access Control (RBAC)**: Implemented through a centralized feature registry, dynamic navigation, security decorators, smart routing based on primary roles, and a defined role hierarchy. Features secure user management with role assignment restrictions and both client-side and server-side validation.
- **Content Security Policy (CSP)**: Strict nonce-based CSP implementation protects against XSS attacks, data injection, UI hijacking, and phishing. Uses cryptographically secure per-request nonces and whitelists only necessary external resources.
- **Cross-Site Request Forgery (CSRF) Protection**: Comprehensive Flask-WTF CSRFProtect implementation with per-session cryptographic tokens on all state-changing requests. Includes defense-in-depth Origin/Referer validation and custom error handling.
- **Secure Cookie Configuration**: Session and authentication cookies implement modern security standards with Secure, HttpOnly, and SameSite=Lax attributes.
- **Subresource Integrity (SRI)**: All third-party CDN assets are protected with SHA-384 integrity hashes and crossorigin attributes.
- **Cache Control**: Global no-cache headers applied to all authenticated and sensitive pages to prevent caching of sensitive data.
- **HTTP Header Sanitization**: Removes or neutralizes info-leaking HTTP response headers.
- **Production-Safe Error Handling**: Environment-aware error handling ensures technical details are not exposed to users in production, providing custom user-friendly error pages and server-side logging.
- **Query String Protection**: Middleware blocks sensitive parameters from appearing in query strings across all HTTP methods.
- **Timezone Standardization**: All datetime operations and displays consistently use Jamaica Standard Time (UTC-05:00).
- **Key Features**: Universal visibility for approved relief requests, accurate inventory validation, batch-level reservation synchronization for draft packages, and automatic inventory table updates on dispatch.

## External Dependencies

### Required Database
- **PostgreSQL 16+** (production) with `citext` extension.
- **SQLite3** (development fallback).

### Python Packages
- Flask
- Flask-SQLAlchemy
- Flask-Login
- SQLAlchemy
- psycopg2-binary
- Werkzeug
- pandas
- python-dotenv

### Frontend CDN Resources
- Bootstrap 5.3.3 CSS/JS
- Bootstrap Icons 1.11.3
- Flatpickr (latest)