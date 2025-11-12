# DRIMS - Disaster Relief Inventory Management System

## Overview

DRIMS (Disaster Relief Inventory Management System) is a comprehensive web-based platform for the Government of Jamaica's ODPEM. It manages the full lifecycle of disaster relief supplies, from inventory tracking and donation management to relief request processing and distribution.

The system integrates a **dual workflow architecture**, combining the authoritative ODPEM `aidmgmt-3.sql` schema with modern DRIMS workflow enhancements for compliance and improved user experience.

Key capabilities include:
- **Multi-warehouse inventory management** with real-time and bin-level tracking.
- **Disaster event coordination** and supply allocation.
- **Dual relief workflows**: AIDMGMT (Request → Package → Intake) and DRIMS (Needs List → Fulfilment → Dispatch → Receipt).
- **Comprehensive management suite**: User administration with RBAC, donor, agency, custodian management, inventory transfers, and location tracking.
- **Analytics & reporting**: Dashboard with KPIs, notifications, and exportable reports.
- **Donation and transfer management** with audit trails.
- **Robust security**: Role-based access control, warehouse-level permissions, and full audit logging.

## User Preferences

Preferred communication style: Simple, everyday language.

## Recent Changes

### November 12, 2025 - Official Government Branding Implementation
- **Login Screen**: Integrated Jamaica Coat of Arms and ODPEM logo with proper hierarchy
- **Navigation Header**: ODPEM logo with DRIMS branding in top navigation bar
- **Footer**: Professional government footer with both official logos and copyright information
- **Static Assets**: Organized logos in `/static/images/` directory
- **Accessibility**: All logos include proper alt text for screen readers
- **Responsive Design**: Logo sizing adapts to different screen sizes
- **Best Practices**: Follows international standards for government web applications

### November 12, 2025 - Agency Table Referential Integrity Enhancement
- **Database Schema Update**: Added `warehouse_id` field to agency table with full referential integrity
  - Foreign key constraint to `warehouse(warehouse_id)`
  - Complex CHECK constraint (`c_agency_5`): SHELTER agencies must have NULL warehouse_id, DISTRIBUTOR agencies must have non-NULL warehouse_id
  - Ensures business rules are enforced at database level
- **Model Update**: Agency model now includes `warehouse_id` field and relationship to Warehouse
- **Form Enhancements**: Dynamic warehouse field visibility based on agency type
  - JavaScript-based toggle: shows warehouse selector only for DISTRIBUTOR agencies
  - Client-side and server-side validation
- **UI Improvements**: Agency view page displays associated warehouse with clickable link
- **Validation**: Backend validation ensures DISTRIBUTOR agencies must select a warehouse

### November 12, 2025 - Agency Management Enhancement
- **Updated Agency Forms**: Added new AIDMGMT-3.1 fields to agency management
  - `agency_type`: Categorize as DISTRIBUTOR or SHELTER
  - `status_code`: Track Active (A) or Inactive (I) status
  - `ineligible_event_id`: Link to events the agency cannot participate in
- **Updated Templates**: All agency forms (create, edit, view, index) now display new fields with badges
- **Backend Integration**: Routes updated to handle new fields with proper validation
- **UI Enhancement**: Status and type badges for visual clarity in agency listings

## System Architecture

### Technology Stack
- **Backend**: Python 3.11 + Flask 3.0.3
- **Database ORM**: SQLAlchemy 2.0.32 with Flask-SQLAlchemy
- **Authentication**: Flask-Login 0.6.3 with Werkzeug
- **Frontend**: Server-side rendering with Jinja2, Bootstrap 5.3.3, Bootstrap Icons
- **Data Processing**: Pandas 2.2.2

### Application Structure
- **Modular Blueprint Architecture**: `app.py` for main application, `app/features/*` for feature-specific blueprints (AIDMGMT workflow, DRIMS workflow, core entities, management features, system features).
- `app/db/models.py`: SQLAlchemy models mapping to a pre-existing database schema (database-first approach).
- `app/core/*`: Shared utilities.
- `templates/`: Jinja2 templates with consistent GOJ branding.

### UI/UX Design
- **Global CSS Utilities**: Reusable classes (`.drims-card`, `.drims-table`) for consistent styling (rounded corners, subtle shadows, specific header/row styles).
- **Row-Click Navigation**: `table-clickable` class enables navigation on row click via `data-href` attributes, ignoring nested buttons.
- **Standard Button Classes**: Consistent `btn-sm` styling for view (outline-primary), edit (warning), and delete (danger) actions.
- **Responsive Design**: Fixed header, collapsible sidebar (260px to 70px on mobile), dynamic main content margins, touch-friendly interactions.
- **GOJ Branding**: Consistent use of primary green (`#009639`) and gold accent (`#FDB913`).
- **Empty States**: Icon-based empty states for improved user experience.

### Database Architecture
- **Hybrid Schema Strategy**: 51 tables total, combining 26 core ODPEM tables (`aidmgmt-3.sql`) and 16 DRIMS extension tables.
- **Key Design Decisions**:
    - **UPPERCASE Enforcement**: All `varchar` fields stored in uppercase.
    - **Audit Fields**: `create_by_id`, `create_dtime`, `update_by_id`, `update_dtime`, `version_nbr` on ODPEM tables.
    - **DECIMAL Quantities**: `DECIMAL(15,4)` for all quantity fields.
    - **Status Codes**: Integer/character codes for various entities.
    - **Composite Keys**: Used in many tables.

### Data Flow Patterns
- **AIDMGMT Relief Workflow**: Relief Request Creation → Package Preparation → Distribution & Intake.
- **DRIMS Modern Workflow**: Needs Assessment (Draft → Submitted → Approved → Completed) → Fulfilment Processing (In Preparation → Ready → Dispatched → Received → Completed) → Dispatch Tracking → Receipt Confirmation.
- **Inventory Management**: Central `inventory` table tracks stock by warehouse and item, with `usable_qty`, `reserved_qty`, `defective_qty`, `expired_qty`. `location` table provides bin-level tracking.

## External Dependencies

### Required Database
- **PostgreSQL 16+** (production) with `citext` extension.
- **SQLite3** (development fallback).

### Python Packages
- Flask 3.0.3
- Flask-SQLAlchemy 3.1.1
- Flask-Login 0.6.3
- SQLAlchemy 2.0.32
- psycopg2-binary 2.9.9
- Werkzeug 3.0.3
- pandas 2.2.2
- python-dotenv 1.0.1

### Frontend CDN Resources
- Bootstrap 5.3.3 CSS/JS
- Bootstrap Icons 1.11.3

### Database Schema and Initialization
- **DRIMS_Complete_Schema.sql**: Must be executed to set up all tables and seed reference data.
- `scripts/init_db.py`: Executes the complete schema.
- `scripts/seed_demo.py`: Populates minimal test data.