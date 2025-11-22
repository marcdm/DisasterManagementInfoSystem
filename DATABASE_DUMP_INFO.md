# DMIS Database Dump Information

Filename: dmis_current_database.sql
Created: 2025-11-21 22:13:04 UTC
Size: 285K
Tables: 47
Database: PostgreSQL (Neon)

## Table Summary:
47 tables exported

## Key Tables Included:
- agency, agency_account_request
- donation, donation_item, donor
- inventory, item, itembatch, item_location
- warehouse, user, user_role, user_warehouse
- reliefpkg, reliefpkg_item, reliefpkgrqst
- event, notification
- transfer_request, transaction
- batchlocation, custodian
- and 27 more...

## Usage:
To restore this database:
psql $DATABASE_URL < dmis_current_database.sql

## Notes:
- This dump includes all schema (DDL) and data (DML)
- Uses --clean flag to drop existing objects before creating
- Uses --if-exists to avoid errors if objects don't exist
- Excludes ownership and ACL information (--no-owner --no-acl)

