--
-- PostgreSQL database dump
--

\restrict PRq9hX58qlP0czki0MzTC6MrVRPhwgxwVfj6y37aV5rzgOURALdHhRxkmjF1yAj

-- Dumped from database version 16.9 (415ebe8)
-- Dumped by pg_dump version 16.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.xfreturn_item DROP CONSTRAINT IF EXISTS xfreturn_item_xfreturn_id_fkey;
ALTER TABLE IF EXISTS ONLY public.xfreturn_item DROP CONSTRAINT IF EXISTS xfreturn_item_uom_code_fkey;
ALTER TABLE IF EXISTS ONLY public.warehouse DROP CONSTRAINT IF EXISTS warehouse_parish_code_fkey;
ALTER TABLE IF EXISTS ONLY public.warehouse DROP CONSTRAINT IF EXISTS warehouse_custodian_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_warehouse DROP CONSTRAINT IF EXISTS user_warehouse_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_warehouse DROP CONSTRAINT IF EXISTS user_warehouse_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_warehouse DROP CONSTRAINT IF EXISTS user_warehouse_assigned_by_fkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_role_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_assigned_by_fkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_assigned_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_agency_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_to_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_reviewed_by_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_requested_by_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_item_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_from_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_item_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_event_id_fkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_donor_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake DROP CONSTRAINT IF EXISTS rtintake_xfreturn_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS rtintake_item_uom_code_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS rtintake_item_location3_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS rtintake_item_location2_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS rtintake_item_location1_id_fkey;
ALTER TABLE IF EXISTS ONLY public.reliefpkg DROP CONSTRAINT IF EXISTS reliefpkg_reliefrqst_id_fkey;
ALTER TABLE IF EXISTS ONLY public.relief_request_fulfillment_lock DROP CONSTRAINT IF EXISTS relief_request_fulfillment_lock_reliefrqst_id_fkey;
ALTER TABLE IF EXISTS ONLY public.relief_request_fulfillment_lock DROP CONSTRAINT IF EXISTS relief_request_fulfillment_lock_fulfiller_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_reliefrqst_id_fkey;
ALTER TABLE IF EXISTS ONLY public.item_location DROP CONSTRAINT IF EXISTS item_location_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.xfreturn DROP CONSTRAINT IF EXISTS fk_xfreturn_to_warehouse;
ALTER TABLE IF EXISTS ONLY public.xfreturn_item DROP CONSTRAINT IF EXISTS fk_xfreturn_item_inventory;
ALTER TABLE IF EXISTS ONLY public.xfreturn DROP CONSTRAINT IF EXISTS fk_xfreturn_fr_warehouse;
ALTER TABLE IF EXISTS ONLY public.transfer DROP CONSTRAINT IF EXISTS fk_transfer_warehouse2;
ALTER TABLE IF EXISTS ONLY public.transfer DROP CONSTRAINT IF EXISTS fk_transfer_warehouse1;
ALTER TABLE IF EXISTS ONLY public.transfer DROP CONSTRAINT IF EXISTS fk_transfer_event;
ALTER TABLE IF EXISTS ONLY public.rtintake DROP CONSTRAINT IF EXISTS fk_rtintake_warehouse;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS fk_rtintake_item_intake;
ALTER TABLE IF EXISTS ONLY public.role_permission DROP CONSTRAINT IF EXISTS fk_role_permission_role;
ALTER TABLE IF EXISTS ONLY public.role_permission DROP CONSTRAINT IF EXISTS fk_role_permission_perm;
ALTER TABLE IF EXISTS ONLY public.reliefrqst DROP CONSTRAINT IF EXISTS fk_reliefrqst_reliefrqst_status;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_item DROP CONSTRAINT IF EXISTS fk_reliefrqst_item_reliefrqstitem_status;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_item DROP CONSTRAINT IF EXISTS fk_reliefrqst_item_reliefrqst;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_item DROP CONSTRAINT IF EXISTS fk_reliefrqst_item_item;
ALTER TABLE IF EXISTS ONLY public.reliefrqst DROP CONSTRAINT IF EXISTS fk_reliefrqst_event;
ALTER TABLE IF EXISTS ONLY public.reliefrqst DROP CONSTRAINT IF EXISTS fk_reliefrqst_agency;
ALTER TABLE IF EXISTS ONLY public.reliefpkg DROP CONSTRAINT IF EXISTS fk_reliefpkg_warehouse;
ALTER TABLE IF EXISTS ONLY public.reliefpkg_item DROP CONSTRAINT IF EXISTS fk_reliefpkg_item_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.reliefpkg_item DROP CONSTRAINT IF EXISTS fk_reliefpkg_item_reliefpkg;
ALTER TABLE IF EXISTS ONLY public.reliefpkg_item DROP CONSTRAINT IF EXISTS fk_reliefpkg_item_itembatch;
ALTER TABLE IF EXISTS ONLY public.reliefpkg DROP CONSTRAINT IF EXISTS fk_reliefpkg_event;
ALTER TABLE IF EXISTS ONLY public.reliefpkg DROP CONSTRAINT IF EXISTS fk_reliefpkg_agency;
ALTER TABLE IF EXISTS ONLY public.location DROP CONSTRAINT IF EXISTS fk_location_warehouse;
ALTER TABLE IF EXISTS ONLY public.itembatch DROP CONSTRAINT IF EXISTS fk_itembatch_warehouse;
ALTER TABLE IF EXISTS ONLY public.itembatch DROP CONSTRAINT IF EXISTS fk_itembatch_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.itembatch DROP CONSTRAINT IF EXISTS fk_itembatch_item;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS fk_item_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.item_location DROP CONSTRAINT IF EXISTS fk_item_location_inventory;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS fk_item_itemcatg;
ALTER TABLE IF EXISTS ONLY public.inventory DROP CONSTRAINT IF EXISTS fk_inventory_warehouse;
ALTER TABLE IF EXISTS ONLY public.inventory DROP CONSTRAINT IF EXISTS fk_inventory_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.inventory DROP CONSTRAINT IF EXISTS fk_inventory_item;
ALTER TABLE IF EXISTS ONLY public.donation_item DROP CONSTRAINT IF EXISTS fk_donation_item_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.donation_item DROP CONSTRAINT IF EXISTS fk_donation_item_item;
ALTER TABLE IF EXISTS ONLY public.donation_item DROP CONSTRAINT IF EXISTS fk_donation_item_donation;
ALTER TABLE IF EXISTS ONLY public.donation DROP CONSTRAINT IF EXISTS fk_donation_event;
ALTER TABLE IF EXISTS ONLY public.donation DROP CONSTRAINT IF EXISTS fk_donation_donor;
ALTER TABLE IF EXISTS ONLY public.donation DROP CONSTRAINT IF EXISTS fk_donation_custodian;
ALTER TABLE IF EXISTS ONLY public.dnintake DROP CONSTRAINT IF EXISTS fk_dnintake_warehouse;
ALTER TABLE IF EXISTS ONLY public.dnintake_item DROP CONSTRAINT IF EXISTS fk_dnintake_item_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.dnintake_item DROP CONSTRAINT IF EXISTS fk_dnintake_item_intake;
ALTER TABLE IF EXISTS ONLY public.dnintake_item DROP CONSTRAINT IF EXISTS fk_dnintake_item_donation_item;
ALTER TABLE IF EXISTS ONLY public.dbintake DROP CONSTRAINT IF EXISTS fk_dbintake_warehouse;
ALTER TABLE IF EXISTS ONLY public.custodian DROP CONSTRAINT IF EXISTS fk_custodian_parish;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS fk_batchlocation_warehouse;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS fk_batchlocation_location;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS fk_batchlocation_itembatch;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS fk_batchlocation_inventory;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS fk_agency_warehouse;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS fk_aar_user;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS fk_aar_updated_by;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS fk_aar_created_by;
ALTER TABLE IF EXISTS ONLY public.agency_account_request_audit DROP CONSTRAINT IF EXISTS fk_aar_audit_req;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS fk_aar_agency;
ALTER TABLE IF EXISTS ONLY public.agency_account_request_audit DROP CONSTRAINT IF EXISTS fk_aar_actor;
ALTER TABLE IF EXISTS ONLY public.donor DROP CONSTRAINT IF EXISTS donor_country_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dnintake DROP CONSTRAINT IF EXISTS dnintake_donation_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_recipient_agency_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package_item DROP CONSTRAINT IF EXISTS distribution_package_item_package_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package_item DROP CONSTRAINT IF EXISTS distribution_package_item_item_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_event_id_fkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_assigned_warehouse_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake DROP CONSTRAINT IF EXISTS dbintake_reliefpkg_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_uom_code_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_reliefpkg_id_inventory_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_location3_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_location2_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_location1_id_fkey;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS agency_parish_code_fkey;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS agency_ineligible_event_id_fkey;
DROP TRIGGER IF EXISTS trg_user_set_updated_at ON public."user";
DROP TRIGGER IF EXISTS trg_aar_set_updated_at ON public.agency_account_request;
DROP INDEX IF EXISTS public.uk_user_username;
DROP INDEX IF EXISTS public.uk_itembatch_inventory_batch_item;
DROP INDEX IF EXISTS public.uk_itembatch_inventory_batch;
DROP INDEX IF EXISTS public.uk_itembatch_1;
DROP INDEX IF EXISTS public.uk_inventory_1;
DROP INDEX IF EXISTS public.uk_aar_active_email;
DROP INDEX IF EXISTS public.ix_user_role_user_id;
DROP INDEX IF EXISTS public.ix_user_role_role_id;
DROP INDEX IF EXISTS public.ix_role_permission_role_id;
DROP INDEX IF EXISTS public.ix_role_permission_perm_id;
DROP INDEX IF EXISTS public.idx_role_code;
DROP INDEX IF EXISTS public.idx_notification_warehouse;
DROP INDEX IF EXISTS public.idx_notification_user_status;
DROP INDEX IF EXISTS public.idx_itemcatg_status_code;
DROP INDEX IF EXISTS public.idx_fulfillment_lock_user;
DROP INDEX IF EXISTS public.idx_fulfillment_lock_expires;
DROP INDEX IF EXISTS public.idx_distribution_package_warehouse;
DROP INDEX IF EXISTS public.idx_distribution_package_item_package;
DROP INDEX IF EXISTS public.idx_distribution_package_item_item;
DROP INDEX IF EXISTS public.idx_distribution_package_event;
DROP INDEX IF EXISTS public.idx_distribution_package_agency;
DROP INDEX IF EXISTS public.dk_xfreturn_3;
DROP INDEX IF EXISTS public.dk_xfreturn_2;
DROP INDEX IF EXISTS public.dk_xfreturn_1;
DROP INDEX IF EXISTS public.dk_user_agency_id;
DROP INDEX IF EXISTS public.dk_transfer_3;
DROP INDEX IF EXISTS public.dk_transfer_2;
DROP INDEX IF EXISTS public.dk_transfer_1;
DROP INDEX IF EXISTS public.dk_rtintake_item_2;
DROP INDEX IF EXISTS public.dk_rtintake_item_1;
DROP INDEX IF EXISTS public.dk_reliefrqst_item_2;
DROP INDEX IF EXISTS public.dk_reliefrqst_3;
DROP INDEX IF EXISTS public.dk_reliefrqst_2;
DROP INDEX IF EXISTS public.dk_reliefrqst_1;
DROP INDEX IF EXISTS public.dk_reliefpkg_item_3;
DROP INDEX IF EXISTS public.dk_reliefpkg_item_2;
DROP INDEX IF EXISTS public.dk_reliefpkg_item_1;
DROP INDEX IF EXISTS public.dk_reliefpkg_3;
DROP INDEX IF EXISTS public.dk_reliefpkg_1;
DROP INDEX IF EXISTS public.dk_location_1;
DROP INDEX IF EXISTS public.dk_itembatch_4;
DROP INDEX IF EXISTS public.dk_itembatch_3;
DROP INDEX IF EXISTS public.dk_itembatch_2;
DROP INDEX IF EXISTS public.dk_itembatch_1;
DROP INDEX IF EXISTS public.dk_item_location_1;
DROP INDEX IF EXISTS public.dk_item_3;
DROP INDEX IF EXISTS public.dk_item_2;
DROP INDEX IF EXISTS public.dk_item_1;
DROP INDEX IF EXISTS public.dk_inventory_1;
DROP INDEX IF EXISTS public.dk_dnintake_item_2;
DROP INDEX IF EXISTS public.dk_dnintake_item_1;
DROP INDEX IF EXISTS public.dk_dbintake_item_2;
DROP INDEX IF EXISTS public.dk_dbintake_item_1;
DROP INDEX IF EXISTS public.dk_batchlocation_1;
DROP INDEX IF EXISTS public.dk_aar_status_created;
DROP INDEX IF EXISTS public.dk_aar_audit_req_time;
ALTER TABLE IF EXISTS ONLY public.xfreturn DROP CONSTRAINT IF EXISTS xfreturn_pkey;
ALTER TABLE IF EXISTS ONLY public.warehouse DROP CONSTRAINT IF EXISTS warehouse_pkey;
ALTER TABLE IF EXISTS ONLY public.user_warehouse DROP CONSTRAINT IF EXISTS user_warehouse_pkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_email_key;
ALTER TABLE IF EXISTS ONLY public.permission DROP CONSTRAINT IF EXISTS uq_permission_resource_action;
ALTER TABLE IF EXISTS ONLY public.itemcatg DROP CONSTRAINT IF EXISTS uk_itemcatg_1;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS uk_item_3;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS uk_item_2;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS uk_item_1;
ALTER TABLE IF EXISTS ONLY public.donor DROP CONSTRAINT IF EXISTS uk_donor_1;
ALTER TABLE IF EXISTS ONLY public.custodian DROP CONSTRAINT IF EXISTS uk_custodian_1;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS uk_agency_1;
ALTER TABLE IF EXISTS ONLY public.transfer_request DROP CONSTRAINT IF EXISTS transfer_request_pkey;
ALTER TABLE IF EXISTS ONLY public.transaction DROP CONSTRAINT IF EXISTS transaction_pkey;
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS role_pkey;
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS role_code_key;
ALTER TABLE IF EXISTS ONLY public.reliefpkg DROP CONSTRAINT IF EXISTS reliefpkg_pkey;
ALTER TABLE IF EXISTS ONLY public.relief_request_fulfillment_lock DROP CONSTRAINT IF EXISTS relief_request_fulfillment_lock_pkey;
ALTER TABLE IF EXISTS ONLY public.xfreturn_item DROP CONSTRAINT IF EXISTS pk_xfreturn_item;
ALTER TABLE IF EXISTS ONLY public.unitofmeasure DROP CONSTRAINT IF EXISTS pk_unitofmeasure;
ALTER TABLE IF EXISTS ONLY public.transfer DROP CONSTRAINT IF EXISTS pk_transfer;
ALTER TABLE IF EXISTS ONLY public.rtintake_item DROP CONSTRAINT IF EXISTS pk_rtintake_item;
ALTER TABLE IF EXISTS ONLY public.rtintake DROP CONSTRAINT IF EXISTS pk_rtintake;
ALTER TABLE IF EXISTS ONLY public.role_permission DROP CONSTRAINT IF EXISTS pk_role_permission;
ALTER TABLE IF EXISTS ONLY public.reliefrqstitem_status DROP CONSTRAINT IF EXISTS pk_reliefrqstitem_status;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_status DROP CONSTRAINT IF EXISTS pk_reliefrqst_status;
ALTER TABLE IF EXISTS ONLY public.reliefrqst_item DROP CONSTRAINT IF EXISTS pk_reliefrqst_item;
ALTER TABLE IF EXISTS ONLY public.reliefrqst DROP CONSTRAINT IF EXISTS pk_reliefrqst;
ALTER TABLE IF EXISTS ONLY public.reliefpkg_item DROP CONSTRAINT IF EXISTS pk_reliefpkg_item;
ALTER TABLE IF EXISTS ONLY public.itemcatg DROP CONSTRAINT IF EXISTS pk_itemcatg;
ALTER TABLE IF EXISTS ONLY public.itembatch DROP CONSTRAINT IF EXISTS pk_itembatch;
ALTER TABLE IF EXISTS ONLY public.item DROP CONSTRAINT IF EXISTS pk_item;
ALTER TABLE IF EXISTS ONLY public.inventory DROP CONSTRAINT IF EXISTS pk_inventory;
ALTER TABLE IF EXISTS ONLY public.event DROP CONSTRAINT IF EXISTS pk_event;
ALTER TABLE IF EXISTS ONLY public.donation_item DROP CONSTRAINT IF EXISTS pk_donation_item;
ALTER TABLE IF EXISTS ONLY public.donation DROP CONSTRAINT IF EXISTS pk_donation;
ALTER TABLE IF EXISTS ONLY public.dnintake_item DROP CONSTRAINT IF EXISTS pk_dnintake_item;
ALTER TABLE IF EXISTS ONLY public.custodian DROP CONSTRAINT IF EXISTS pk_custodian;
ALTER TABLE IF EXISTS ONLY public.batchlocation DROP CONSTRAINT IF EXISTS pk_batchlocation;
ALTER TABLE IF EXISTS ONLY public.permission DROP CONSTRAINT IF EXISTS permission_pkey;
ALTER TABLE IF EXISTS ONLY public.parish DROP CONSTRAINT IF EXISTS parish_pkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_pkey;
ALTER TABLE IF EXISTS ONLY public.location DROP CONSTRAINT IF EXISTS location_pkey;
ALTER TABLE IF EXISTS ONLY public.item_location DROP CONSTRAINT IF EXISTS item_location_pkey;
ALTER TABLE IF EXISTS ONLY public.donor DROP CONSTRAINT IF EXISTS donor_pkey;
ALTER TABLE IF EXISTS ONLY public.dnintake DROP CONSTRAINT IF EXISTS dnintake_pkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_pkey;
ALTER TABLE IF EXISTS ONLY public.distribution_package DROP CONSTRAINT IF EXISTS distribution_package_package_number_key;
ALTER TABLE IF EXISTS ONLY public.distribution_package_item DROP CONSTRAINT IF EXISTS distribution_package_item_pkey;
ALTER TABLE IF EXISTS ONLY public.dbintake DROP CONSTRAINT IF EXISTS dbintake_pkey;
ALTER TABLE IF EXISTS ONLY public.dbintake_item DROP CONSTRAINT IF EXISTS dbintake_item_pkey;
ALTER TABLE IF EXISTS ONLY public.country DROP CONSTRAINT IF EXISTS country_pkey;
ALTER TABLE IF EXISTS ONLY public.agency DROP CONSTRAINT IF EXISTS agency_pkey;
ALTER TABLE IF EXISTS ONLY public.agency_account_request DROP CONSTRAINT IF EXISTS agency_account_request_pkey;
ALTER TABLE IF EXISTS ONLY public.agency_account_request_audit DROP CONSTRAINT IF EXISTS agency_account_request_audit_pkey;
ALTER TABLE IF EXISTS public.xfreturn ALTER COLUMN xfreturn_id DROP DEFAULT;
ALTER TABLE IF EXISTS public."user" ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.transfer_request ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.transaction ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.notification ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.distribution_package_item ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.distribution_package ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.xfreturn_xfreturn_id_seq;
DROP TABLE IF EXISTS public.xfreturn_item;
DROP TABLE IF EXISTS public.xfreturn;
DROP TABLE IF EXISTS public.warehouse;
DROP VIEW IF EXISTS public.v_status4reliefrqst_processed;
DROP VIEW IF EXISTS public.v_status4reliefrqst_create;
DROP VIEW IF EXISTS public.v_status4reliefrqst_action;
DROP TABLE IF EXISTS public.user_warehouse;
DROP TABLE IF EXISTS public.user_role;
DROP SEQUENCE IF EXISTS public.user_id_seq;
DROP TABLE IF EXISTS public."user";
DROP TABLE IF EXISTS public.unitofmeasure;
DROP SEQUENCE IF EXISTS public.transfer_request_id_seq;
DROP TABLE IF EXISTS public.transfer_request;
DROP TABLE IF EXISTS public.transfer;
DROP SEQUENCE IF EXISTS public.transaction_id_seq;
DROP TABLE IF EXISTS public.transaction;
DROP TABLE IF EXISTS public.rtintake_item;
DROP TABLE IF EXISTS public.rtintake;
DROP TABLE IF EXISTS public.role_permission;
DROP SEQUENCE IF EXISTS public.role_id_seq;
DROP TABLE IF EXISTS public.role;
DROP TABLE IF EXISTS public.reliefrqstitem_status;
DROP TABLE IF EXISTS public.reliefrqst_status;
DROP TABLE IF EXISTS public.reliefrqst_item;
DROP TABLE IF EXISTS public.reliefrqst;
DROP TABLE IF EXISTS public.reliefpkg_item;
DROP TABLE IF EXISTS public.reliefpkg;
DROP TABLE IF EXISTS public.relief_request_fulfillment_lock;
DROP TABLE IF EXISTS public.permission;
DROP TABLE IF EXISTS public.parish;
DROP SEQUENCE IF EXISTS public.notification_id_seq;
DROP TABLE IF EXISTS public.notification;
DROP TABLE IF EXISTS public.location;
DROP TABLE IF EXISTS public.itemcatg;
DROP TABLE IF EXISTS public.itembatch;
DROP TABLE IF EXISTS public.item_location;
DROP TABLE IF EXISTS public.item;
DROP TABLE IF EXISTS public.inventory;
DROP TABLE IF EXISTS public.event;
DROP TABLE IF EXISTS public.donor;
DROP TABLE IF EXISTS public.donation_item;
DROP TABLE IF EXISTS public.donation;
DROP TABLE IF EXISTS public.dnintake_item;
DROP TABLE IF EXISTS public.dnintake;
DROP SEQUENCE IF EXISTS public.distribution_package_item_id_seq;
DROP TABLE IF EXISTS public.distribution_package_item;
DROP SEQUENCE IF EXISTS public.distribution_package_id_seq;
DROP TABLE IF EXISTS public.distribution_package;
DROP TABLE IF EXISTS public.dbintake_item;
DROP TABLE IF EXISTS public.dbintake;
DROP TABLE IF EXISTS public.custodian;
DROP TABLE IF EXISTS public.country;
DROP TABLE IF EXISTS public.batchlocation;
DROP TABLE IF EXISTS public.agency_account_request_audit;
DROP TABLE IF EXISTS public.agency_account_request;
DROP TABLE IF EXISTS public.agency;
DROP FUNCTION IF EXISTS public.set_updated_at();
DROP EXTENSION IF EXISTS pgcrypto;
DROP EXTENSION IF EXISTS citext;
--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.update_dtime := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: agency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agency (
    agency_id integer NOT NULL,
    agency_name character varying(120) NOT NULL,
    address1_text character varying(255) NOT NULL,
    address2_text character varying(255),
    parish_code character(2) NOT NULL,
    contact_name character varying(50) NOT NULL,
    phone_no character varying(20) NOT NULL,
    email_text character varying(100),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    agency_type character varying(16) NOT NULL,
    ineligible_event_id integer,
    status_code character(1) NOT NULL,
    warehouse_id integer,
    CONSTRAINT agency_agency_name_check CHECK (((agency_name)::text = upper((agency_name)::text))),
    CONSTRAINT agency_contact_name_check CHECK (((contact_name)::text = upper((contact_name)::text))),
    CONSTRAINT c_agency_3 CHECK (((agency_type)::text = ANY ((ARRAY['DISTRIBUTOR'::character varying, 'SHELTER'::character varying])::text[]))),
    CONSTRAINT c_agency_5 CHECK (((((agency_type)::text = 'SHELTER'::text) AND (warehouse_id IS NULL)) OR (((agency_type)::text <> 'SHELTER'::text) AND (warehouse_id IS NOT NULL)))),
    CONSTRAINT c_agency_6 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar])))
);


--
-- Name: agency_account_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agency_account_request (
    request_id integer NOT NULL,
    agency_name character varying(120) NOT NULL,
    contact_name character varying(80) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    contact_email public.citext NOT NULL,
    reason_text character varying(255) NOT NULL,
    agency_id integer,
    user_id integer,
    status_code character(1) NOT NULL,
    status_reason character varying(255),
    created_by_id integer NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_by_id integer NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_aar_status CHECK ((status_code = ANY (ARRAY['S'::bpchar, 'R'::bpchar, 'A'::bpchar, 'D'::bpchar])))
);


--
-- Name: agency_account_request_audit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agency_account_request_audit (
    audit_id integer NOT NULL,
    request_id integer NOT NULL,
    event_type character varying(24) NOT NULL,
    event_notes character varying(255),
    actor_user_id integer NOT NULL,
    event_dtime timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL
);


--
-- Name: agency_account_request_audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.agency_account_request_audit ALTER COLUMN audit_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agency_account_request_audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: agency_account_request_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.agency_account_request ALTER COLUMN request_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agency_account_request_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: agency_agency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.agency ALTER COLUMN agency_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.agency_agency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: batchlocation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.batchlocation (
    inventory_id integer NOT NULL,
    location_id integer NOT NULL,
    batch_id integer NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL
);


--
-- Name: country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country (
    country_id smallint NOT NULL,
    country_name character varying(80) NOT NULL
);


--
-- Name: custodian; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custodian (
    custodian_id integer NOT NULL,
    custodian_name character varying(120) DEFAULT 'OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)'::character varying NOT NULL,
    address1_text character varying(255) NOT NULL,
    address2_text character varying(255),
    parish_code character(2) NOT NULL,
    contact_name character varying(50) NOT NULL,
    phone_no character varying(20) NOT NULL,
    email_text character varying(100),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_custodian_1 CHECK (((custodian_name)::text = upper((custodian_name)::text))),
    CONSTRAINT c_custodian_3 CHECK (((contact_name)::text = upper((contact_name)::text)))
);


--
-- Name: custodian_custodian_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.custodian ALTER COLUMN custodian_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.custodian_custodian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dbintake; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dbintake (
    reliefpkg_id integer NOT NULL,
    inventory_id integer NOT NULL,
    intake_date date NOT NULL,
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT dbintake_intake_date_check CHECK ((intake_date <= CURRENT_DATE)),
    CONSTRAINT dbintake_status_code_check CHECK ((status_code = ANY (ARRAY['I'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- Name: dbintake_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dbintake_item (
    reliefpkg_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    location1_id integer,
    defective_qty numeric(12,2) NOT NULL,
    location2_id integer,
    expired_qty numeric(12,2) NOT NULL,
    location3_id integer,
    uom_code character varying(25) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT dbintake_item_defective_qty_check CHECK ((defective_qty >= 0.00)),
    CONSTRAINT dbintake_item_expired_qty_check CHECK ((expired_qty >= 0.00)),
    CONSTRAINT dbintake_item_status_code_check CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar]))),
    CONSTRAINT dbintake_item_usable_qty_check CHECK ((usable_qty >= 0.00))
);


--
-- Name: distribution_package; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.distribution_package (
    id integer NOT NULL,
    package_number character varying(64) NOT NULL,
    recipient_agency_id integer NOT NULL,
    assigned_warehouse_id integer,
    event_id integer,
    status character varying(50) DEFAULT 'Draft'::character varying NOT NULL,
    is_partial boolean DEFAULT false NOT NULL,
    created_by character varying(200) NOT NULL,
    approved_by character varying(200),
    approved_at timestamp without time zone,
    dispatched_by character varying(200),
    dispatched_at timestamp without time zone,
    delivered_at timestamp without time zone,
    notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: distribution_package_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.distribution_package_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.distribution_package_id_seq OWNED BY public.distribution_package.id;


--
-- Name: distribution_package_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.distribution_package_item (
    id integer NOT NULL,
    package_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(12,2) NOT NULL,
    notes text
);


--
-- Name: distribution_package_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.distribution_package_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_package_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.distribution_package_item_id_seq OWNED BY public.distribution_package_item.id;


--
-- Name: dnintake; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dnintake (
    donation_id integer NOT NULL,
    inventory_id integer NOT NULL,
    intake_date date NOT NULL,
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT dnintake_intake_date_check CHECK ((intake_date <= CURRENT_DATE)),
    CONSTRAINT dnintake_status_code_check CHECK ((status_code = ANY (ARRAY['I'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- Name: dnintake_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dnintake_item (
    donation_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    batch_no character varying(20) NOT NULL,
    batch_date date NOT NULL,
    expiry_date date,
    uom_code character varying(25) NOT NULL,
    avg_unit_value numeric(10,2) NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    defective_qty numeric(12,2) NOT NULL,
    expired_qty numeric(12,2) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_dnintake_item_1a CHECK (((batch_no)::text = upper((batch_no)::text))),
    CONSTRAINT c_dnintake_item_1b CHECK ((batch_date <= CURRENT_DATE)),
    CONSTRAINT c_dnintake_item_1c CHECK (((expiry_date >= CURRENT_DATE) OR (expiry_date IS NULL))),
    CONSTRAINT c_dnintake_item_1d CHECK ((avg_unit_value > 0.00)),
    CONSTRAINT c_dnintake_item_2 CHECK ((usable_qty >= 0.00)),
    CONSTRAINT c_dnintake_item_3 CHECK ((defective_qty >= 0.00)),
    CONSTRAINT c_dnintake_item_4 CHECK ((expired_qty >= 0.00)),
    CONSTRAINT c_dnintake_item_5 CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar])))
);


--
-- Name: donation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donation (
    donation_id integer NOT NULL,
    donor_id integer NOT NULL,
    donation_desc text NOT NULL,
    event_id integer NOT NULL,
    custodian_id integer NOT NULL,
    received_date date NOT NULL,
    status_code character(1) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    verify_by_id character varying(20),
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    update_by_id character varying(20),
    update_dtime timestamp without time zone,
    CONSTRAINT c_donation_1 CHECK ((received_date <= CURRENT_DATE)),
    CONSTRAINT c_donation_2 CHECK ((status_code = ANY (ARRAY['E'::bpchar, 'V'::bpchar, 'P'::bpchar])))
);


--
-- Name: donation_donation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.donation ALTER COLUMN donation_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.donation_donation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: donation_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donation_item (
    donation_id integer NOT NULL,
    item_id integer NOT NULL,
    item_qty numeric(12,2) NOT NULL,
    uom_code character varying(25) NOT NULL,
    location_name text NOT NULL,
    status_code character(1) DEFAULT 'V'::bpchar NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    verify_by_id character varying(20),
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT c_donation_item_1 CHECK ((item_qty >= 0.00)),
    CONSTRAINT c_donation_item_2 CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar])))
);


--
-- Name: donor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donor (
    donor_id integer NOT NULL,
    donor_name character varying(255) NOT NULL,
    org_type_desc character varying(30),
    address1_text character varying(255) NOT NULL,
    address2_text character varying(255),
    country_id smallint DEFAULT 388 NOT NULL,
    phone_no character varying(20) NOT NULL,
    email_text character varying(100),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    donor_code character varying(16) NOT NULL,
    CONSTRAINT c_donor_1 CHECK (((donor_code)::text = upper((donor_code)::text))),
    CONSTRAINT c_donor_2 CHECK (((donor_name)::text = upper((donor_name)::text))),
    CONSTRAINT donor_donor_name_check CHECK (((donor_name)::text = upper((donor_name)::text)))
);


--
-- Name: donor_donor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.donor ALTER COLUMN donor_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.donor_donor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event (
    event_id integer NOT NULL,
    event_type character varying(16) NOT NULL,
    start_date date NOT NULL,
    event_name character varying(60) NOT NULL,
    event_desc character varying(255) NOT NULL,
    impact_desc text NOT NULL,
    status_code character(1) NOT NULL,
    closed_date date,
    reason_desc character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_event_1 CHECK (((event_type)::text = ANY ((ARRAY['STORM'::character varying, 'HURRICANE'::character varying, 'TORNADO'::character varying, 'FLOOD'::character varying, 'TSUNAMI'::character varying, 'FIRE'::character varying, 'EARTHQUAKE'::character varying, 'WAR'::character varying, 'EPIDEMIC'::character varying, 'ADHOC'::character varying])::text[]))),
    CONSTRAINT c_event_2 CHECK ((start_date <= CURRENT_DATE)),
    CONSTRAINT c_event_3 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'C'::bpchar]))),
    CONSTRAINT c_event_4a CHECK ((((status_code = 'A'::bpchar) AND (closed_date IS NULL)) OR ((status_code = 'C'::bpchar) AND (closed_date IS NOT NULL)))),
    CONSTRAINT c_event_4b CHECK ((((reason_desc IS NULL) AND (closed_date IS NULL)) OR ((reason_desc IS NOT NULL) AND (closed_date IS NOT NULL))))
);


--
-- Name: event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.event ALTER COLUMN event_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.event_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    reserved_qty numeric(12,2) NOT NULL,
    defective_qty numeric(12,2) NOT NULL,
    expired_qty numeric(12,2) NOT NULL,
    uom_code character varying(25) NOT NULL,
    last_verified_by character varying(20),
    last_verified_date date,
    status_code character(1) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    reorder_qty numeric(12,2) DEFAULT 0.00 NOT NULL,
    CONSTRAINT c_inventory_1 CHECK ((usable_qty >= 0.00)),
    CONSTRAINT c_inventory_2 CHECK ((reserved_qty <= usable_qty)),
    CONSTRAINT c_inventory_3 CHECK ((defective_qty >= 0.00)),
    CONSTRAINT c_inventory_4 CHECK ((expired_qty >= 0.00)),
    CONSTRAINT c_inventory_5 CHECK ((reorder_qty >= 0.00)),
    CONSTRAINT c_inventory_6 CHECK ((((last_verified_by IS NULL) AND (last_verified_date IS NULL)) OR ((last_verified_by IS NOT NULL) AND (last_verified_date IS NOT NULL)))),
    CONSTRAINT c_inventory_7 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'U'::bpchar])))
);


--
-- Name: item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item (
    item_id integer NOT NULL,
    item_code character varying(16) NOT NULL,
    item_name character varying(60) NOT NULL,
    sku_code character varying(30) NOT NULL,
    category_id integer NOT NULL,
    item_desc public.citext NOT NULL,
    reorder_qty numeric(12,2) NOT NULL,
    default_uom_code character varying(25) NOT NULL,
    units_size_vary_flag boolean DEFAULT false NOT NULL,
    usage_desc text,
    storage_desc text,
    is_batched_flag boolean DEFAULT true NOT NULL,
    can_expire_flag boolean DEFAULT false NOT NULL,
    issuance_order character varying(20) DEFAULT 'FIFO'::character varying NOT NULL,
    comments_text text,
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_item_1a CHECK (((item_code)::text = upper((item_code)::text))),
    CONSTRAINT c_item_1b CHECK (((item_name)::text = upper((item_name)::text))),
    CONSTRAINT c_item_1c CHECK (((sku_code)::text = upper((sku_code)::text))),
    CONSTRAINT c_item_1d CHECK ((reorder_qty > 0.00)),
    CONSTRAINT c_item_3 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar])))
);


--
-- Name: item_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_location (
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    location_id integer NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL
);


--
-- Name: item_new_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.item ALTER COLUMN item_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.item_new_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: itembatch; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.itembatch (
    batch_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    batch_no character varying(20) NOT NULL,
    batch_date date NOT NULL,
    expiry_date date,
    usable_qty numeric(15,4) NOT NULL,
    reserved_qty numeric(15,4) DEFAULT 0 NOT NULL,
    defective_qty numeric(15,4) DEFAULT 0 NOT NULL,
    expired_qty numeric(15,4) DEFAULT 0 NOT NULL,
    uom_code character varying(25) NOT NULL,
    size_spec character varying(30),
    avg_unit_value numeric(10,2) DEFAULT 0.00 NOT NULL,
    last_verified_by character varying(20),
    last_verified_date date,
    status_code character(1) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_itembatch_1 CHECK (((batch_no)::text = upper((batch_no)::text))),
    CONSTRAINT c_itembatch_2a CHECK ((usable_qty >= 0.00)),
    CONSTRAINT c_itembatch_2b CHECK (((reserved_qty <= usable_qty) AND (reserved_qty >= 0.00))),
    CONSTRAINT c_itembatch_2c CHECK ((defective_qty >= 0.00)),
    CONSTRAINT c_itembatch_2d CHECK ((expired_qty >= 0.00)),
    CONSTRAINT c_itembatch_3 CHECK ((avg_unit_value >= 0.00)),
    CONSTRAINT c_itembatch_5 CHECK ((((last_verified_by IS NULL) AND (last_verified_date IS NULL)) OR ((last_verified_by IS NOT NULL) AND (last_verified_date IS NOT NULL)))),
    CONSTRAINT c_itembatch_6 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'U'::bpchar])))
);


--
-- Name: itembatch_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.itembatch ALTER COLUMN batch_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.itembatch_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: itemcatg; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.itemcatg (
    category_id integer NOT NULL,
    category_code character varying(30) NOT NULL,
    category_desc character varying(60) NOT NULL,
    comments_text text,
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_itemcatg_1 CHECK (((category_code)::text = upper((category_code)::text))),
    CONSTRAINT c_itemcatg_2 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar])))
);


--
-- Name: TABLE itemcatg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.itemcatg IS 'Item Category master data table - defines categories for relief items';


--
-- Name: COLUMN itemcatg.category_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.category_id IS 'Primary key - auto-generated category identifier';


--
-- Name: COLUMN itemcatg.category_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.category_code IS 'Unique category code (uppercase) - business key';


--
-- Name: COLUMN itemcatg.category_desc; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.category_desc IS 'Description of the item category';


--
-- Name: COLUMN itemcatg.comments_text; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.comments_text IS 'Additional comments or notes about this category';


--
-- Name: COLUMN itemcatg.status_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.status_code IS 'Status: A=Active, I=Inactive';


--
-- Name: COLUMN itemcatg.version_nbr; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.itemcatg.version_nbr IS 'Optimistic locking version number';


--
-- Name: itemcatg_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.itemcatg ALTER COLUMN category_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.itemcatg_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    inventory_id integer NOT NULL,
    location_desc character varying(255) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT location_status_code_check CHECK ((status_code = ANY (ARRAY['O'::bpchar, 'C'::bpchar])))
);


--
-- Name: location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.location ALTER COLUMN location_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.location_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification (
    id integer NOT NULL,
    user_id integer NOT NULL,
    warehouse_id integer,
    reliefrqst_id integer,
    title character varying(200) NOT NULL,
    message text NOT NULL,
    type character varying(50) NOT NULL,
    status character varying(20) DEFAULT 'unread'::character varying NOT NULL,
    link_url character varying(500),
    payload text,
    is_archived boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- Name: parish; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parish (
    parish_code character(2) NOT NULL,
    parish_name character varying(40) NOT NULL,
    CONSTRAINT parish_parish_code_check CHECK (((parish_code ~ similar_to_escape('[0-9]*'::text)) AND (((parish_code)::integer >= 1) AND ((parish_code)::integer <= 14))))
);


--
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permission (
    perm_id integer NOT NULL,
    resource character varying(40) NOT NULL,
    action character varying(32) NOT NULL,
    create_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    create_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    update_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    update_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL
);


--
-- Name: permission_perm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.permission ALTER COLUMN perm_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.permission_perm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: relief_request_fulfillment_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.relief_request_fulfillment_lock (
    reliefrqst_id integer NOT NULL,
    fulfiller_user_id integer NOT NULL,
    fulfiller_email character varying(100) NOT NULL,
    acquired_at timestamp without time zone DEFAULT now() NOT NULL,
    expires_at timestamp without time zone,
    CONSTRAINT chk_expires_after_acquired CHECK (((expires_at IS NULL) OR (expires_at > acquired_at)))
);


--
-- Name: TABLE relief_request_fulfillment_lock; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.relief_request_fulfillment_lock IS 'Tracks which user is currently preparing/packaging a relief request to ensure single fulfiller';


--
-- Name: COLUMN relief_request_fulfillment_lock.expires_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.relief_request_fulfillment_lock.expires_at IS 'Optional expiry time for automatic lock release';


--
-- Name: reliefpkg; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefpkg (
    reliefpkg_id integer NOT NULL,
    to_inventory_id integer NOT NULL,
    reliefrqst_id integer NOT NULL,
    start_date date DEFAULT CURRENT_DATE NOT NULL,
    dispatch_dtime timestamp(0) without time zone,
    transport_mode character varying(255),
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    received_by_id character varying(20) NOT NULL,
    received_dtime timestamp(0) without time zone,
    agency_id integer NOT NULL,
    tracking_no character(7) NOT NULL,
    eligible_event_id integer,
    CONSTRAINT c_reliefpkg_2 CHECK ((((dispatch_dtime IS NULL) AND (status_code <> 'D'::bpchar)) OR ((dispatch_dtime IS NOT NULL) AND (status_code = 'D'::bpchar)))),
    CONSTRAINT c_reliefpkg_3 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'P'::bpchar, 'C'::bpchar, 'V'::bpchar, 'D'::bpchar, 'R'::bpchar]))),
    CONSTRAINT reliefpkg_start_date_check CHECK ((start_date <= CURRENT_DATE))
);


--
-- Name: reliefpkg_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefpkg_item (
    reliefpkg_id integer NOT NULL,
    fr_inventory_id integer NOT NULL,
    batch_id integer NOT NULL,
    item_id integer NOT NULL,
    item_qty numeric(15,4) NOT NULL,
    uom_code character varying(25) NOT NULL,
    reason_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_reliefpkg_item_1 CHECK ((item_qty >= 0.00))
);


--
-- Name: reliefpkg_reliefpkg_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reliefpkg ALTER COLUMN reliefpkg_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reliefpkg_reliefpkg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reliefrqst; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefrqst (
    reliefrqst_id integer NOT NULL,
    agency_id integer NOT NULL,
    request_date date NOT NULL,
    urgency_ind character(1) NOT NULL,
    status_code smallint DEFAULT 0 NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    review_by_id character varying(20),
    review_dtime timestamp(0) without time zone,
    action_by_id character varying(20),
    action_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    eligible_event_id integer,
    rqst_notes_text text,
    review_notes_text text,
    tracking_no character varying(7) DEFAULT upper(substr(replace((gen_random_uuid())::text, '-'::text, ''::text), 1, 7)) NOT NULL,
    status_reason_desc character varying(255),
    receive_by_id character varying(20),
    receive_dtime timestamp(0) without time zone,
    CONSTRAINT c_reliefrqst_1 CHECK ((request_date <= CURRENT_DATE)),
    CONSTRAINT c_reliefrqst_2 CHECK ((urgency_ind = ANY (ARRAY['L'::bpchar, 'M'::bpchar, 'H'::bpchar, 'C'::bpchar]))),
    CONSTRAINT c_reliefrqst_3 CHECK (((status_reason_desc IS NOT NULL) OR ((status_reason_desc IS NULL) AND (status_code <> ALL (ARRAY[4, 6, 8]))))),
    CONSTRAINT c_reliefrqst_4a CHECK ((((review_by_id IS NULL) AND (status_code < 2)) OR ((review_by_id IS NOT NULL) AND (status_code >= 2)))),
    CONSTRAINT c_reliefrqst_4b CHECK ((((review_by_id IS NULL) AND (review_dtime IS NULL)) OR ((review_by_id IS NOT NULL) AND (review_dtime IS NOT NULL)))),
    CONSTRAINT c_reliefrqst_5a CHECK ((((action_by_id IS NULL) AND (status_code < 4)) OR ((action_by_id IS NOT NULL) AND (status_code >= 4)))),
    CONSTRAINT c_reliefrqst_5b CHECK ((((action_by_id IS NULL) AND (action_dtime IS NULL)) OR ((action_by_id IS NOT NULL) AND (action_dtime IS NOT NULL)))),
    CONSTRAINT c_reliefrqst_6a CHECK ((((receive_by_id IS NULL) AND (status_code <> 9)) OR ((receive_by_id IS NOT NULL) AND (status_code = 9)))),
    CONSTRAINT c_reliefrqst_6b CHECK ((((receive_by_id IS NULL) AND (receive_dtime IS NULL)) OR ((receive_by_id IS NOT NULL) AND (receive_dtime IS NOT NULL))))
);


--
-- Name: reliefrqst_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefrqst_item (
    reliefrqst_id integer NOT NULL,
    item_id integer NOT NULL,
    request_qty numeric(12,2) NOT NULL,
    issue_qty numeric(12,2) DEFAULT 0.00 NOT NULL,
    urgency_ind character(1) NOT NULL,
    rqst_reason_desc character varying(255),
    required_by_date date,
    status_code character(1) DEFAULT 'R'::bpchar NOT NULL,
    status_reason_desc character varying(255),
    action_by_id character varying(20),
    action_dtime timestamp(0) without time zone,
    version_nbr integer DEFAULT 1 NOT NULL,
    CONSTRAINT c_reliefrqst_item_1 CHECK ((request_qty > 0.00)),
    CONSTRAINT c_reliefrqst_item_2a CHECK ((((status_code = ANY (ARRAY['R'::bpchar, 'U'::bpchar, 'W'::bpchar, 'D'::bpchar])) AND (issue_qty = (0)::numeric)) OR ((status_code = ANY (ARRAY['P'::bpchar, 'L'::bpchar])) AND (issue_qty < request_qty)) OR ((status_code = 'F'::bpchar) AND (issue_qty = request_qty)))),
    CONSTRAINT c_reliefrqst_item_3 CHECK ((urgency_ind = ANY (ARRAY['L'::bpchar, 'M'::bpchar, 'H'::bpchar, 'C'::bpchar]))),
    CONSTRAINT c_reliefrqst_item_4 CHECK (((urgency_ind = ANY (ARRAY['L'::bpchar, 'M'::bpchar, 'C'::bpchar])) OR ((urgency_ind = 'H'::bpchar) AND (rqst_reason_desc IS NOT NULL) AND (TRIM(BOTH FROM rqst_reason_desc) <> ''::text)))),
    CONSTRAINT c_reliefrqst_item_5 CHECK (((required_by_date IS NOT NULL) OR ((required_by_date IS NULL) AND (urgency_ind = ANY (ARRAY['L'::bpchar, 'M'::bpchar]))))),
    CONSTRAINT c_reliefrqst_item_6a CHECK ((status_code = ANY (ARRAY['R'::bpchar, 'U'::bpchar, 'W'::bpchar, 'D'::bpchar, 'P'::bpchar, 'L'::bpchar, 'F'::bpchar]))),
    CONSTRAINT c_reliefrqst_item_6b CHECK (((status_reason_desc IS NOT NULL) OR ((status_reason_desc IS NULL) AND (status_code <> ALL (ARRAY['D'::bpchar, 'L'::bpchar]))))),
    CONSTRAINT c_reliefrqst_item_7 CHECK ((((action_by_id IS NULL) AND (status_code = 'R'::bpchar)) OR ((action_by_id IS NOT NULL) AND (status_code <> 'R'::bpchar)))),
    CONSTRAINT c_reliefrqst_item_8 CHECK ((((action_by_id IS NULL) AND (action_dtime IS NULL)) OR ((action_by_id IS NOT NULL) AND (action_dtime IS NOT NULL))))
);


--
-- Name: reliefrqst_reliefrqst_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reliefrqst ALTER COLUMN reliefrqst_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reliefrqst_reliefrqst_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reliefrqst_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefrqst_status (
    status_code smallint NOT NULL,
    status_desc character varying(30) NOT NULL,
    is_active_flag boolean DEFAULT true NOT NULL,
    reason_rqrd_flag boolean DEFAULT false NOT NULL
);


--
-- Name: reliefrqstitem_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reliefrqstitem_status (
    status_code character(1) NOT NULL,
    status_desc character varying(30) NOT NULL,
    item_qty_rule character(2) NOT NULL,
    active_flag boolean DEFAULT true NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT c_reliefrqstitem_status_2 CHECK ((item_qty_rule = ANY (ARRAY['EZ'::bpchar, 'GZ'::bpchar, 'ER'::bpchar])))
);


--
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: role_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_permission (
    role_id integer NOT NULL,
    perm_id integer NOT NULL,
    scope_json jsonb,
    create_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    create_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    update_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    update_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL
);


--
-- Name: rtintake; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rtintake (
    xfreturn_id integer NOT NULL,
    inventory_id integer NOT NULL,
    intake_date date NOT NULL,
    comments_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT rtintake_intake_date_check CHECK ((intake_date <= CURRENT_DATE)),
    CONSTRAINT rtintake_status_code_check CHECK ((status_code = ANY (ARRAY['I'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- Name: rtintake_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rtintake_item (
    xfreturn_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    location1_id integer,
    defective_qty numeric(12,2) NOT NULL,
    location2_id integer,
    expired_qty numeric(12,2) NOT NULL,
    location3_id integer,
    uom_code character varying(25) NOT NULL,
    status_code character(1) NOT NULL,
    comments_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT rtintake_item_defective_qty_check CHECK ((defective_qty >= 0.00)),
    CONSTRAINT rtintake_item_expired_qty_check CHECK ((expired_qty >= 0.00)),
    CONSTRAINT rtintake_item_status_code_check CHECK ((status_code = ANY (ARRAY['P'::bpchar, 'V'::bpchar]))),
    CONSTRAINT rtintake_item_usable_qty_check CHECK ((usable_qty >= 0.00))
);


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    item_id integer,
    ttype character varying(8) NOT NULL,
    qty numeric(12,2) NOT NULL,
    warehouse_id integer,
    donor_id integer,
    event_id integer,
    expiry_date date,
    notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying(200)
);


--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: transfer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transfer (
    transfer_id integer NOT NULL,
    fr_inventory_id integer NOT NULL,
    to_inventory_id integer NOT NULL,
    eligible_event_id integer,
    transfer_date date DEFAULT CURRENT_DATE NOT NULL,
    reason_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT c_transfer_1 CHECK ((transfer_date <= CURRENT_DATE)),
    CONSTRAINT c_transfer_2 CHECK ((status_code = ANY (ARRAY['D'::bpchar, 'C'::bpchar, 'V'::bpchar, 'P'::bpchar])))
);


--
-- Name: transfer_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transfer_request (
    id integer NOT NULL,
    from_warehouse_id integer NOT NULL,
    to_warehouse_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(12,2) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    requested_by integer,
    requested_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    reviewed_by integer,
    reviewed_at timestamp without time zone,
    notes text
);


--
-- Name: transfer_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transfer_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transfer_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transfer_request_id_seq OWNED BY public.transfer_request.id;


--
-- Name: transfer_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.transfer ALTER COLUMN transfer_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.transfer_transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: unitofmeasure; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unitofmeasure (
    uom_code character varying(25) NOT NULL,
    uom_desc character varying(60) NOT NULL,
    comments_text text,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    status_code character(1) DEFAULT 'A'::bpchar NOT NULL,
    CONSTRAINT c_unitofmeasure_1 CHECK (((uom_code)::text = upper((uom_code)::text))),
    CONSTRAINT c_unitofmeasure_2 CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar])))
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    email character varying(200) NOT NULL,
    password_hash character varying(256) NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    full_name character varying(200),
    is_active boolean DEFAULT true NOT NULL,
    organization character varying(200),
    job_title character varying(200),
    phone character varying(50),
    timezone character varying(50) DEFAULT 'America/Jamaica'::character varying NOT NULL,
    language character varying(10) DEFAULT 'en'::character varying NOT NULL,
    notification_preferences text,
    assigned_warehouse_id integer,
    last_login_at timestamp without time zone,
    create_dtime timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_dtime timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    username character varying(60),
    password_algo character varying(20) DEFAULT 'argon2id'::character varying NOT NULL,
    mfa_enabled boolean DEFAULT false NOT NULL,
    mfa_secret character varying(64),
    failed_login_count smallint DEFAULT 0 NOT NULL,
    lock_until_at timestamp(0) without time zone,
    password_changed_at timestamp(0) without time zone,
    agency_id integer,
    status_code character(1) DEFAULT 'A'::bpchar NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL,
    user_name character varying(20) NOT NULL,
    CONSTRAINT c_user_status_code CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar, 'L'::bpchar])))
);


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".user_id;


--
-- Name: user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    assigned_by integer,
    create_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    create_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    update_by_id character varying(20) DEFAULT 'system'::character varying NOT NULL,
    update_dtime timestamp(0) without time zone DEFAULT now() NOT NULL,
    version_nbr integer DEFAULT 1 NOT NULL
);


--
-- Name: user_warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_warehouse (
    user_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    assigned_by integer
);


--
-- Name: v_status4reliefrqst_action; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_status4reliefrqst_action AS
 SELECT status_code,
    status_desc,
    reason_rqrd_flag
   FROM public.reliefrqst_status
  WHERE ((status_code = ANY (ARRAY[4, 5, 6, 7, 8])) AND (is_active_flag = true));


--
-- Name: v_status4reliefrqst_create; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_status4reliefrqst_create AS
 SELECT status_code,
    status_desc,
    reason_rqrd_flag
   FROM public.reliefrqst_status
  WHERE ((status_code = ANY (ARRAY[0, 1, 2, 3])) AND (is_active_flag = true));


--
-- Name: v_status4reliefrqst_processed; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_status4reliefrqst_processed AS
 SELECT status_code,
    status_desc,
    reason_rqrd_flag
   FROM public.reliefrqst_status
  WHERE ((status_code = 9) AND (is_active_flag = true));


--
-- Name: warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.warehouse (
    warehouse_id integer NOT NULL,
    warehouse_name text NOT NULL,
    warehouse_type character varying(10) NOT NULL,
    address1_text character varying(255) NOT NULL,
    address2_text character varying(255),
    parish_code character(2) NOT NULL,
    contact_name character varying(50) NOT NULL,
    phone_no character varying(20) NOT NULL,
    email_text character varying(100),
    custodian_id integer NOT NULL,
    status_code character(1) NOT NULL,
    reason_desc character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT warehouse_check CHECK ((((reason_desc IS NULL) AND (status_code = 'A'::bpchar)) OR ((reason_desc IS NOT NULL) AND (status_code = 'I'::bpchar)))),
    CONSTRAINT warehouse_contact_name_check CHECK (((contact_name)::text = upper((contact_name)::text))),
    CONSTRAINT warehouse_status_code_check CHECK ((status_code = ANY (ARRAY['A'::bpchar, 'I'::bpchar]))),
    CONSTRAINT warehouse_warehouse_type_check CHECK (((warehouse_type)::text = ANY ((ARRAY['MAIN-HUB'::character varying, 'SUB-HUB'::character varying])::text[])))
);


--
-- Name: warehouse_warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.warehouse ALTER COLUMN warehouse_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.warehouse_warehouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: xfreturn; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xfreturn (
    xfreturn_id integer NOT NULL,
    fr_inventory_id integer NOT NULL,
    to_inventory_id integer NOT NULL,
    return_date date DEFAULT CURRENT_DATE NOT NULL,
    reason_text character varying(255),
    status_code character(1) NOT NULL,
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone,
    verify_by_id character varying(20) NOT NULL,
    verify_dtime timestamp(0) without time zone,
    version_nbr integer NOT NULL,
    CONSTRAINT xfreturn_return_date_check CHECK ((return_date <= CURRENT_DATE)),
    CONSTRAINT xfreturn_status_code_check CHECK ((status_code = ANY (ARRAY['D'::bpchar, 'C'::bpchar, 'V'::bpchar])))
);


--
-- Name: xfreturn_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xfreturn_item (
    xfreturn_id integer NOT NULL,
    inventory_id integer NOT NULL,
    item_id integer NOT NULL,
    usable_qty numeric(12,2) NOT NULL,
    defective_qty numeric(12,2) NOT NULL,
    expired_qty numeric(12,2) NOT NULL,
    uom_code character varying(25) NOT NULL,
    reason_text character varying(255),
    create_by_id character varying(20) NOT NULL,
    create_dtime timestamp(0) without time zone NOT NULL,
    update_by_id character varying(20) NOT NULL,
    update_dtime timestamp(0) without time zone NOT NULL,
    version_nbr integer NOT NULL,
    CONSTRAINT xfreturn_item_defective_qty_check CHECK ((defective_qty >= 0.00)),
    CONSTRAINT xfreturn_item_expired_qty_check CHECK ((expired_qty >= 0.00)),
    CONSTRAINT xfreturn_item_usable_qty_check CHECK ((usable_qty >= 0.00))
);


--
-- Name: xfreturn_xfreturn_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.xfreturn_xfreturn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: xfreturn_xfreturn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.xfreturn_xfreturn_id_seq OWNED BY public.xfreturn.xfreturn_id;


--
-- Name: distribution_package id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package ALTER COLUMN id SET DEFAULT nextval('public.distribution_package_id_seq'::regclass);


--
-- Name: distribution_package_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package_item ALTER COLUMN id SET DEFAULT nextval('public.distribution_package_item_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Name: transfer_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request ALTER COLUMN id SET DEFAULT nextval('public.transfer_request_id_seq'::regclass);


--
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: xfreturn xfreturn_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn ALTER COLUMN xfreturn_id SET DEFAULT nextval('public.xfreturn_xfreturn_id_seq'::regclass);


--
-- Data for Name: agency; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agency (agency_id, agency_name, address1_text, address2_text, parish_code, contact_name, phone_no, email_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr, agency_type, ineligible_event_id, status_code, warehouse_id) FROM stdin;
1	PORTMORE COMMUNITY CENTER	45 Community Lane, Portmore	\N	12	MARY JOHNSON	876-555-5678	\N	admin	2025-11-12 03:33:09	ADMIN@ODPEM.GOV.JM	2025-11-12 17:34:31	2	SHELTER	\N	A	\N
\.


--
-- Data for Name: agency_account_request; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agency_account_request (request_id, agency_name, contact_name, contact_phone, contact_email, reason_text, agency_id, user_id, status_code, status_reason, created_by_id, created_at, updated_by_id, updated_at, version_nbr) FROM stdin;
\.


--
-- Data for Name: agency_account_request_audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agency_account_request_audit (audit_id, request_id, event_type, event_notes, actor_user_id, event_dtime, version_nbr) FROM stdin;
\.


--
-- Data for Name: batchlocation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.batchlocation (inventory_id, location_id, batch_id, create_by_id, create_dtime) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.country (country_id, country_name) FROM stdin;
388	JAMAICA
\.


--
-- Data for Name: custodian; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.custodian (custodian_id, custodian_name, address1_text, address2_text, parish_code, contact_name, phone_no, email_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	2 Haining Road	\N	01	DIRECTOR GENERAL	876-928-5111	info@odpem.gov.jm	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1
\.


--
-- Data for Name: dbintake; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dbintake (reliefpkg_id, inventory_id, intake_date, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- Data for Name: dbintake_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dbintake_item (reliefpkg_id, inventory_id, item_id, usable_qty, location1_id, defective_qty, location2_id, expired_qty, location3_id, uom_code, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- Data for Name: distribution_package; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.distribution_package (id, package_number, recipient_agency_id, assigned_warehouse_id, event_id, status, is_partial, created_by, approved_by, approved_at, dispatched_by, dispatched_at, delivered_at, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: distribution_package_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.distribution_package_item (id, package_id, item_id, quantity, notes) FROM stdin;
\.


--
-- Data for Name: dnintake; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dnintake (donation_id, inventory_id, intake_date, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
3	1	2025-11-18	\N	V	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	1
4	8	2025-11-18	\N	V	LOGISTICS.MANAGER@GO	2025-11-18 18:06:15	LOGISTICS.MANAGER@GO	2025-11-18 18:06:15	LOGISTICS.MANAGER@GO	2025-11-18 18:06:15	1
5	8	2025-11-18	\N	V	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	1
7	1	2025-11-19	\N	V	LOGISTICS.MANAGER@GO	2025-11-19 16:59:13	LOGISTICS.MANAGER@GO	2025-11-19 16:59:13	LOGISTICS.MANAGER@GO	2025-11-19 16:59:13	1
8	8	2025-11-19	\N	V	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58	1
9	8	2025-11-19	\N	V	LOGISTICS.OFFICER@GO	2025-11-19 20:35:00	LOGISTICS.OFFICER@GO	2025-11-19 20:35:00	LOGISTICS.OFFICER@GO	2025-11-19 20:35:00	1
10	8	2025-11-19	\N	V	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58	1
11	1	2025-11-19	\N	V	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	1
\.


--
-- Data for Name: dnintake_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dnintake_item (donation_id, inventory_id, item_id, batch_no, batch_date, expiry_date, uom_code, avg_unit_value, usable_qty, defective_qty, expired_qty, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
3	1	8	B001	2025-11-17	2026-02-28	UNIT	100.00	1000.00	0.00	0.00	V	\N	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	1
3	1	7	B002	2025-11-17	2025-12-31	UNIT	5000.00	500.00	0.00	0.00	V	\N	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	1
4	8	7	B002	2025-11-18	2026-01-01	UNIT	5000.00	493.00	5.00	2.00	V	\N	LOGISTICS.MANAGER@GO	2025-11-18 18:06:15	LOGISTICS.MANAGER@GO	2025-11-18 18:06:15	1
5	8	7	MED-KIT-01	2025-11-18	2025-12-26	UNIT	10000.00	190.00	0.00	10.00	V	\N	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	1
5	8	8	NOBATCH-8	2025-11-18	2025-12-31	UNIT	5000.00	295.00	5.00	0.00	V	\N	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	1
7	1	8	NOBATCH-8	2025-11-19	2026-01-10	UNIT	1000.00	400.00	0.00	0.00	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 16:59:13	LOGISTICS.MANAGER@GO	2025-11-19 16:59:13	1
8	8	11	BATCH-WATA-01	2025-11-19	2025-12-31	BOTTLE	100.00	1000.00	0.00	0.00	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58	1
9	8	11	BATCH-WATA-02	2025-11-19	2025-11-20	BOTTLE	100.00	500.00	0.00	0.00	V	\N	LOGISTICS.OFFICER@GO	2025-11-19 20:35:00	LOGISTICS.OFFICER@GO	2025-11-19 20:35:00	1
10	8	11	BATCH-WATA-03	2025-11-19	2025-11-19	BOTTLE	100.00	50.00	0.00	0.00	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58	1
11	1	11	BATCH-WATA-05	2025-11-17	2025-11-20	BOTTLE	100.00	80.00	0.00	0.00	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	1
\.


--
-- Data for Name: donation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donation (donation_id, donor_id, donation_desc, event_id, custodian_id, received_date, status_code, comments_text, create_by_id, create_dtime, verify_by_id, verify_dtime, version_nbr, update_by_id, update_dtime) FROM stdin;
3	2	HYGIENE AND TOILETRY AND FIRST AID KITS	2	1	2025-11-14	P	\N	LOGISTICS.OFFICER@GO	2025-11-18 16:02:39	LOGISTICS.OFFICER@GO	2025-11-18 16:02:39	5	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37.318332
4	2	FIRST AID KITS	2	1	2025-11-17	P	\N	LOGISTICS.OFFICER@GO	2025-11-18 16:17:49	LOGISTICS.OFFICER@GO	2025-11-18 16:17:49	2	LOGISTICS.MANAGER@GO	2025-11-18 18:06:14.612524
5	2	FIRST AID KITS AND HYGIENE PRODUCTS	3	1	2025-11-14	P	INTENDED FOR CHILDREN'S HOME IN MAXFIELD	LOGISTICS.OFFICER@GO	2025-11-18 23:20:22	LOGISTICS.OFFICER@GO	2025-11-18 23:20:22	2	LOGISTICS.OFFICER@GO	2025-11-18 23:41:34.990649
2	2	FIRST AID KITS	2	1	2025-11-14	V	RECEIVED FROM RED CROSS	LOGISTICS.OFFICER@GO	2025-11-18 03:21:03	LOGISTICS.MANAGER@GO	2025-11-19 12:51:52	5	LOGISTICS.MANAGER@GO	2025-11-19 12:51:51.719327
6	2	WHITE RICE	2	1	2025-11-19	V	WHITE RICE	LOGISTICS.MANAGER@GO	2025-11-19 12:53:55	LOGISTICS.MANAGER@GO	2025-11-19 12:53:55	1	LOGISTICS.MANAGER@GO	2025-11-19 12:53:54.518004
7	2	HYGIENE STUFF	2	1	2025-11-18	P	\N	LOGISTICS.MANAGER@GO	2025-11-19 16:58:20	LOGISTICS.MANAGER@GO	2025-11-19 16:58:20	2	LOGISTICS.MANAGER@GO	2025-11-19 16:59:13.54098
8	2	BOTTLE WATER	3	1	2025-11-18	P	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:25:41	LOGISTICS.MANAGER@GO	2025-11-19 20:25:41	2	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58.030276
9	2	WATER	3	1	2025-11-19	P	\N	LOGISTICS.OFFICER@GO	2025-11-19 20:32:49	LOGISTICS.OFFICER@GO	2025-11-19 20:32:49	2	LOGISTICS.OFFICER@GO	2025-11-19 20:35:00.083929
10	2	MORE WATER	2	1	2025-11-19	P	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:36:21	LOGISTICS.MANAGER@GO	2025-11-19 20:36:21	2	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58.280388
11	2	WATER FOR KINGSTON	2	1	2025-11-19	P	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:39:47	LOGISTICS.MANAGER@GO	2025-11-19 20:39:47	2	LOGISTICS.MANAGER@GO	2025-11-19 20:40:49.605008
\.


--
-- Data for Name: donation_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donation_item (donation_id, item_id, item_qty, uom_code, location_name, status_code, comments_text, create_by_id, create_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
4	7	500.00	UNIT	DONATION RECEIVED	V	\N	LOGISTICS.OFFICER@GO	2025-11-18 16:17:49	LOGISTICS.OFFICER@GO	2025-11-18 16:17:49	1
3	8	1000.00	UNIT	DONATION RECEIVED	V	\N	LOGISTICS.OFFICER@GO	2025-11-18 16:02:39	LOGISTICS.OFFICER@GO	2025-11-18 16:02:39	2
3	7	500.00	UNIT	DONATION RECEIVED	V	\N	LOGISTICS.OFFICER@GO	2025-11-18 16:02:39	LOGISTICS.OFFICER@GO	2025-11-18 16:02:39	2
5	7	200.00	UNIT	DONATION RECEIVED	V	\N	LOGISTICS.OFFICER@GO	2025-11-18 23:20:22	LOGISTICS.OFFICER@GO	2025-11-18 23:20:22	1
5	8	300.00	UNIT	DONATION RECEIVED	V	\N	LOGISTICS.OFFICER@GO	2025-11-18 23:20:22	LOGISTICS.OFFICER@GO	2025-11-18 23:20:22	1
6	6	100.00	SACK	DONATION RECEIVED	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 12:53:55	LOGISTICS.MANAGER@GO	2025-11-19 12:53:55	1
7	8	400.00	UNIT	DONATION RECEIVED	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 16:58:20	LOGISTICS.MANAGER@GO	2025-11-19 16:58:20	1
8	11	1000.00	BOTTLE	DONATION RECEIVED	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:25:41	LOGISTICS.MANAGER@GO	2025-11-19 20:25:41	1
9	11	500.00	BOTTLE	DONATION RECEIVED	V	\N	LOGISTICS.OFFICER@GO	2025-11-19 20:32:49	LOGISTICS.OFFICER@GO	2025-11-19 20:32:49	1
10	11	50.00	BOTTLE	DONATION RECEIVED	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:36:21	LOGISTICS.MANAGER@GO	2025-11-19 20:36:21	1
11	11	80.00	BOTTLE	DONATION RECEIVED	V	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:39:47	LOGISTICS.MANAGER@GO	2025-11-19 20:39:47	1
\.


--
-- Data for Name: donor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.donor (donor_id, donor_name, org_type_desc, address1_text, address2_text, country_id, phone_no, email_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr, donor_code) FROM stdin;
2	RED CROSS JAMAICA	NGO	123 Main Street, Kingston	\N	388	876-555-1000	info@redcross.org.jm	ADMIN@ODPEM.GOV.JM	2025-11-12 04:40:08	ADMIN@ODPEM.GOV.JM	2025-11-12 04:40:08	1	ORG-00002
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event (event_id, event_type, start_date, event_name, event_desc, impact_desc, status_code, closed_date, reason_desc, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	STORM	2025-10-28	Hurricane Melissa	Hurricane Melissa CAT 5	All of western Jamaica was completely destroyed.	C	2025-11-16	This event is closed.	TEST.DIRECTOR@ODPEM.	2025-11-16 20:10:33	TEST.DIRECTOR@ODPEM.	2025-11-16 20:34:45	3
2	STORM	2025-11-17	Hurricane Melissa 2025	Hurricane Mellissa is a category 5 hurricane that hit landfall on October 28, 2025.	Devastating damages to the central and western of the country (St. Elizabeth, Westmoreland, St. James, Mandeville and Trelawny)	A	\N	\N	TEST.DIRECTOR@ODPEM.	2025-11-17 15:01:49	TEST.DIRECTOR@ODPEM.	2025-11-17 15:01:49	1
3	HURRICANE	2024-07-24	hurricane beryl	CAT 3 Hurricane across central Jamaica	Significant damages infrastructure.	A	\N	\N	EXECUTIVE@ODPEM.GOV.	2025-11-18 22:51:12	EXECUTIVE@ODPEM.GOV.	2025-11-18 22:51:12	1
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory (inventory_id, item_id, usable_qty, reserved_qty, defective_qty, expired_qty, uom_code, last_verified_by, last_verified_date, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr, reorder_qty) FROM stdin;
8	7	758.00	70.00	6.00	17.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	10	0.00
8	8	415.00	0.00	5.00	0.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	2	0.00
1	7	700.00	90.00	3.00	10.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	10	0.00
8	11	1500.00	0.00	0.00	0.00	BOTTLE	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58	6	0.00
1	11	30.00	30.00	0.00	0.00	BOTTLE	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	4	0.00
1	8	1750.00	60.00	0.00	0.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	LOGISTICS.MANAGER@GO	2025-11-19 16:59:14	9	0.00
1	6	500.00	0.00	5.00	0.00	SACK	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	1	0.00
1	9	150.00	0.00	8.00	0.00	SHEET	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	1	0.00
1	10	600.00	0.00	12.00	0.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:49	1	0.00
8	6	180.00	0.00	2.00	0.00	SACK	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	1	0.00
8	9	60.00	0.00	3.00	0.00	SHEET	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	1	0.00
8	10	250.00	0.00	5.00	0.00	UNIT	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	ADMIN@ODPEM.GOV.JM	2025-11-17 15:13:53	1	0.00
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item (item_id, item_code, item_name, sku_code, category_id, item_desc, reorder_qty, default_uom_code, units_size_vary_flag, usage_desc, storage_desc, is_batched_flag, can_expire_flag, issuance_order, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
8	ITM-HYG-001	HYGIENE KIT FAMILY	SKU-HYG-FAM-001	4	Family hygiene kit containing soap, toothpaste, sanitary items, and toiletries	75.00	UNIT	f	\N	\N	f	f	FIFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	1
9	ITM-SHT-001	TARPAULIN HEAVY DUTY	SKU-SHT-TARP-HD-12X16	5	Heavy duty waterproof tarpaulin 12ft x 16ft for emergency shelter	30.00	SHEET	t	\N	\N	f	f	FIFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	1
10	ITM-CLO-001	BLANKET EMERGENCY	SKU-CLO-BLNK-EMG	6	Emergency thermal blanket for disaster relief distribution	100.00	UNIT	f	\N	\N	f	f	FIFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	1
7	ITM-MED-001	FIRST AID KIT STANDARD	SKU-MED-FAK-STD	3	Standard first aid kit with bandages, antiseptic, and basic medical supplies	50.00	UNIT	f	\N	\N	t	t	FEFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	TEST.DIRECTOR@ODPEM.	2025-11-17 14:41:18	2
6	ITM-RICE-001	WHITE RICE PARBOILED	SKU-RICE-WP-50KG	1	Parboiled white rice in 50kg bags for emergency food distribution	100.00	SACK	f	\N	\N	t	f	FEFO	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	ADMIN@ODPEM.GOV.JM	2025-11-17 14:39:09	1
11	ITM-WAT-01	BOTTLE WATER 500ML	SKU-WAT-01	1	Bottle water	100.00	LITRE	f	\N	\N	t	t	FEFO	\N	A	EXECUTIVE@ODPEM.GOV.	2025-11-18 23:04:40	EXECUTIVE@ODPEM.GOV.	2025-11-18 23:04:40	1
\.


--
-- Data for Name: item_location; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_location (inventory_id, item_id, location_id, create_by_id, create_dtime) FROM stdin;
\.


--
-- Data for Name: itembatch; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.itembatch (batch_id, inventory_id, item_id, batch_no, batch_date, expiry_date, usable_qty, reserved_qty, defective_qty, expired_qty, uom_code, size_spec, avg_unit_value, last_verified_by, last_verified_date, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	1	6	RICE-2024-001	2024-09-01	2025-02-28	150.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
2	1	6	RICE-2024-002	2024-10-15	2025-05-31	200.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
3	1	6	RICE-2024-003	2024-11-01	2025-08-31	150.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
4	8	6	RICE-2024-MB-001	2024-10-20	2025-04-30	100.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
5	8	6	RICE-2024-MB-002	2024-11-10	2025-07-31	80.0000	0.0000	0.0000	0.0000	SACK	25kg	15.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:43	1
6	1	7	FAK-2024-001	2024-08-01	2026-08-01	80.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
7	1	7	FAK-2024-002	2024-09-15	2026-09-15	70.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
8	1	7	FAK-2024-003	2024-10-20	2026-10-20	50.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
9	8	7	FAK-2024-MB-001	2024-09-01	2026-09-01	40.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
10	8	7	FAK-2024-MB-002	2024-11-01	2026-11-01	35.0000	0.0000	0.0000	0.0000	UNIT	Standard 50-piece	25.00	\N	\N	A	\N	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	ADMIN@ODPEM.GOV.JM	2025-11-17 17:54:49	1
12	1	7	B002	2025-11-17	2025-12-31	500.0000	0.0000	0.0000	0.0000	UNIT	\N	5000.00	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	1
13	8	7	B003	2025-11-18	2026-01-01	493.0000	0.0000	5.0000	2.0000	UNIT	\N	5000.00	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-18 18:06:15	LOGISTICS.MANAGER@GO	2025-11-18 18:06:15	1
14	8	7	MED-KIT-01	2025-11-18	2025-12-26	190.0000	0.0000	0.0000	10.0000	UNIT	\N	10000.00	\N	\N	A	\N	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	1
15	8	8	NOBATCH-8	2025-11-18	2025-12-31	295.0000	0.0000	5.0000	0.0000	UNIT	\N	5000.00	\N	\N	A	\N	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	LOGISTICS.OFFICER@GO	2025-11-18 23:41:35	1
16	1	8	NOBATCH-8	2025-11-19	2026-01-10	400.0000	0.0000	0.0000	0.0000	UNIT	\N	1000.00	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-19 16:59:13	LOGISTICS.MANAGER@GO	2025-11-19 16:59:13	1
19	8	11	BATCH-WATA-01	2025-11-19	2025-12-31	1000.0000	0.0000	0.0000	0.0000	BOTTLE	\N	100.00	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58	LOGISTICS.MANAGER@GO	2025-11-19 20:30:58	1
21	8	11	BATCH-WATA-03	2025-11-19	2025-11-19	50.0000	0.0000	0.0000	0.0000	BOTTLE	\N	100.00	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58	LOGISTICS.MANAGER@GO	2025-11-19 20:36:58	1
20	8	11	BATCH-WATA-02	2025-11-19	2025-11-20	450.0000	0.0000	0.0000	0.0000	BOTTLE	\N	100.00	\N	\N	A	\N	LOGISTICS.OFFICER@GO	2025-11-19 20:35:00	LOGISTICS.OFFICER@GO	2025-11-19 20:35:00	2
22	1	11	BATCH-WATA-05	2025-11-17	2025-11-20	30.0000	0.0000	0.0000	0.0000	BOTTLE	\N	100.00	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	LOGISTICS.MANAGER@GO	2025-11-19 20:40:50	2
11	1	8	B001	2025-11-17	2026-02-28	990.0000	0.0000	0.0000	0.0000	UNIT	\N	100.00	\N	\N	A	\N	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	LOGISTICS.MANAGER@GO	2025-11-18 17:54:37	2
\.


--
-- Data for Name: itemcatg; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.itemcatg (category_id, category_code, category_desc, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
3	MEDICAL	Medical Supplies and Equipment	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	1
4	HYGIENE	Hygiene and Sanitation Products	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	1
5	SHELTER	Shelter and Construction Materials	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	1
6	CLOTHING	Clothing and Textiles	\N	A	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	ADMIN@ODPEM.GOV.JM	2025-11-17 14:38:18	1
1	FOOD	Food and Consumables	\N	A	TEST.DIRECTOR@ODPEM.	2025-11-17 00:50:18	EXECUTIVE@ODPEM.GOV.	2025-11-18 22:59:18	2
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.location (location_id, inventory_id, location_desc, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notification (id, user_id, warehouse_id, reliefrqst_id, title, message, type, status, link_url, payload, is_archived, created_at) FROM stdin;
38	8	\N	16	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000016 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/16	\N	f	2025-11-17 15:50:10.319793
39	9	\N	16	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000016 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/16	\N	f	2025-11-17 15:50:10.319827
53	6	\N	26	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000026 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	read	/eligibility/review/26	\N	f	2025-11-18 23:52:03.603941
41	2	\N	16	Relief Request Approved	Your relief request RR-000016 for Hurricane Melissa 2025 has been approved by Brian Custodian. Click to view details.	reliefrqst_approved	unread	/packaging/16/prepare	\N	f	2025-11-17 15:55:11.200154
45	8	\N	17	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000017 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/17	\N	f	2025-11-17 18:31:37.088198
46	9	\N	17	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000017 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/17	\N	f	2025-11-17 18:31:37.088244
48	2	\N	17	Relief Request Approved	RR-000017 from PORTMORE COMMUNITY CENTER (Event: Hurricane Melissa 2025) approved by Brian Custodian. Click to prepare fulfillment package.	reliefrqst_approved	unread	/packaging/17/prepare	\N	f	2025-11-17 18:31:58.07411
54	12	\N	26	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000026 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/26	\N	f	2025-11-18 23:52:03.60409
55	8	\N	26	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000026 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/26	\N	f	2025-11-18 23:52:03.604129
56	9	\N	26	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000026 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/26	\N	f	2025-11-18 23:52:03.604159
58	2	\N	26	Relief Request Approved	RR-000026 from PORTMORE COMMUNITY CENTER (Event: Hurricane Melissa 2025) approved by Sarah Johnson. Click to prepare fulfillment package.	reliefrqst_approved	unread	/packaging/26/prepare	\N	f	2025-11-18 23:55:07.928346
61	12	\N	28	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000028 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/28	\N	f	2025-11-19 20:23:24.480201
62	8	\N	28	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000028 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/28	\N	f	2025-11-19 20:23:24.480238
63	9	\N	28	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000028 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	unread	/eligibility/review/28	\N	f	2025-11-19 20:23:24.480268
60	6	\N	28	New Relief Request Submitted	Agency PORTMORE COMMUNITY CENTER submitted RR-000028 for event: Hurricane Melissa 2025. Click to review eligibility.	reliefrqst_submitted	read	/eligibility/review/28	\N	f	2025-11-19 20:23:24.480078
65	2	\N	28	Relief Request Approved	RR-000028 from PORTMORE COMMUNITY CENTER (Event: Hurricane Melissa 2025) approved by Sarah Johnson. Click to prepare fulfillment package.	reliefrqst_approved	unread	/packaging/28/prepare	\N	f	2025-11-19 20:23:45.983743
67	7	\N	28	Package Dispatched	Relief package for RR-000028 has been dispatched by Anthony Bailey. Click to track delivery.	package_dispatched	unread	/relief-requests/28	\N	f	2025-11-19 21:30:05.595115
69	7	\N	28	Package Dispatched	Relief package for RR-000028 has been dispatched by Anthony Bailey. Click to track delivery.	package_dispatched	unread	/relief-requests/28	\N	f	2025-11-19 21:35:49.552438
71	7	\N	17	Package Dispatched	Relief package for RR-000017 has been dispatched by Anthony Bailey. Click to track delivery.	package_dispatched	unread	/relief-requests/17	\N	f	2025-11-19 22:09:53.732639
72	4	\N	17	Package Dispatched	Relief package for RR-000017 has been dispatched by Anthony Bailey. Click to track delivery.	package_dispatched	read	/relief-requests/17	\N	f	2025-11-19 22:09:53.732777
\.


--
-- Data for Name: parish; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parish (parish_code, parish_name) FROM stdin;
01	Kingston
02	St. Andrew
03	St. Thomas
04	Portland
05	St. Mary
06	St. Ann
07	Trelawny
08	St. James
09	Hanover
10	Westmoreland
11	St. Elizabeth
12	Manchester
13	Clarendon
14	St. Catherine
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.permission (perm_id, resource, action, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
1	reliefrqst	create	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
2	reliefrqst	submit	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
3	reliefrqst	cancel	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
4	reliefrqst	view	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
5	reliefrqst	view_all	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
6	reliefrqst	approve_eligibility	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
7	reliefrqst	fill_plan_edit	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
8	reliefrqst	fill_plan_approve	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
9	reliefrqst	close	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
10	reliefrqst_item	view	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
11	reliefrqst_item	edit_fill	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
12	reliefpkg	create	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
13	reliefpkg	dispatch	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
14	reliefpkg	receive	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
15	reliefpkg	verify	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
16	inventory	view	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
17	inventory	reserve_for_request	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
18	inventory	reconcile_dispatch	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
19	agency_account	request	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
20	agency_account	review	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
21	agency_account	approve	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
22	agency_account	deny	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
23	agency_account	provision	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
24	users	manage	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
25	reports	view_own	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
26	reports	view_ops	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
27	reports	view_exec	system	2025-11-13 15:10:03	system	2025-11-13 15:10:03	1
28	EVENT	VIEW	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
29	EVENT	CREATE	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
30	EVENT	UPDATE	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
31	EVENT	CLOSE	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
32	EVENT	DELETE	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
\.


--
-- Data for Name: relief_request_fulfillment_lock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.relief_request_fulfillment_lock (reliefrqst_id, fulfiller_user_id, fulfiller_email, acquired_at, expires_at) FROM stdin;
16	4	logistics.manager@gov.jm	2025-11-19 15:23:18.903959	2025-11-20 15:23:18.903949
26	3	logistics.officer@gov.jm	2025-11-19 15:33:39.845915	2025-11-20 15:33:39.8459
\.


--
-- Data for Name: reliefpkg; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefpkg (reliefpkg_id, to_inventory_id, reliefrqst_id, start_date, dispatch_dtime, transport_mode, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr, received_by_id, received_dtime, agency_id, tracking_no, eligible_event_id) FROM stdin;
5	1	16	2025-11-17	\N	\N	\N	P	LOGISTICS.OFFICER@GO	2025-11-17 18:30:27	LOGISTICS.OFFICER@GO	2025-11-18 15:12:40	LOGISTICS.OFFICER@GO	\N	4	LOGISTICS.OFFICER@GO	\N	1	0000005	2
12	1	26	2025-11-19	\N	\N	\N	P	LOGISTICS.OFFICER@GO	2025-11-19 21:23:00	LOGISTICS.OFFICER@GO	2025-11-19 21:23:00	LOGISTICS.OFFICER@GO	\N	1	LOGISTICS.OFFICER@GO	\N	1	6552010	\N
11	1	28	2025-11-19	2025-11-19 21:35:49	\N	\N	D	LOGISTICS.OFFICER@GO	2025-11-19 20:50:06	LOGISTICS.MANAGER@GO	2025-11-19 21:35:49	LOGISTICS.MANAGER@GO	2025-11-19 21:35:49	4	LOGISTICS.OFFICER@GO	\N	1	1D5D4E3	\N
6	1	17	2025-11-17	2025-11-19 22:09:54	\N	\N	D	LOGISTICS.OFFICER@GO	2025-11-17 19:23:15	INVENTORY@ODPEM.GOV.	2025-11-20 01:25:45	LOGISTICS.MANAGER@GO	2025-11-19 22:09:54	4	INVENTORY@ODPEM.GOV.	2025-11-20 01:25:45	1	0000006	2
\.


--
-- Data for Name: reliefpkg_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefpkg_item (reliefpkg_id, fr_inventory_id, batch_id, item_id, item_qty, uom_code, reason_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
12	1	11	8	20.0000	UNIT	\N	LOGISTICS.OFFICER@GO	2025-11-19 21:24:14	LOGISTICS.OFFICER@GO	2025-11-19 21:24:14	1
6	1	11	8	10.0000	UNIT	\N	LOGISTICS.MANAGER@GO	2025-11-19 22:09:53	LOGISTICS.MANAGER@GO	2025-11-19 22:09:53	1
\.


--
-- Data for Name: reliefrqst; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefrqst (reliefrqst_id, agency_id, request_date, urgency_ind, status_code, create_by_id, create_dtime, review_by_id, review_dtime, action_by_id, action_dtime, version_nbr, eligible_event_id, rqst_notes_text, review_notes_text, tracking_no, status_reason_desc, receive_by_id, receive_dtime) FROM stdin;
16	1	2025-11-17	M	3	shelter_user@gmail.c	2025-11-17 15:35:35	TEST.DIRECTOR@ODPEM.	2025-11-17 15:55:11	\N	\N	3	2	Urgently needed at the shelter.	\N	49448B2	\N	\N	\N
18	1	2025-11-18	M	0	SHELTER_USER@GMAIL.C	2025-11-18 15:42:11	\N	\N	\N	\N	1	2		\N	7329DA6	\N	\N	\N
19	1	2025-11-18	M	0	LOGISTICS.OFFICER@GO	2025-11-18 20:18:15	\N	\N	\N	\N	1	2		\N	496BE9D	\N	\N	\N
20	1	2025-11-18	M	0	LOGISTICS.OFFICER@GO	2025-11-18 20:22:57	\N	\N	\N	\N	1	2		\N	9E0C02C	\N	\N	\N
21	1	2025-11-18	M	0	LOGISTICS.OFFICER@GO	2025-11-18 20:23:20	\N	\N	\N	\N	1	2		\N	4820405	\N	\N	\N
22	1	2025-11-18	M	0	SHELTER_USER@GMAIL.C	2025-11-18 20:23:51	\N	\N	\N	\N	1	2		\N	C987299	\N	\N	\N
23	1	2025-11-18	M	0	LOGISTICS.OFFICER@GO	2025-11-18 20:32:54	\N	\N	\N	\N	1	2		\N	D4A7C58	\N	\N	\N
24	1	2025-11-18	M	0	LOGISTICS.OFFICER@GO	2025-11-18 20:36:56	\N	\N	\N	\N	1	2		\N	6E86E9B	\N	\N	\N
25	1	2025-11-18	M	0	LOGISTICS.OFFICER@GO	2025-11-18 20:39:17	\N	\N	\N	\N	1	2		\N	5AE60BA	\N	\N	\N
26	1	2025-11-18	M	3	LOGISTICS.OFFICER@GO	2025-11-18 23:46:19	EXECUTIVE@ODPEM.GOV.	2025-11-18 23:55:08	\N	\N	3	2		\N	CBF15E8	\N	\N	\N
28	1	2025-11-19	L	5	LOGISTICS.OFFICER@GO	2025-11-19 20:23:08	EXECUTIVE@ODPEM.GOV.	2025-11-19 20:23:46	LOGISTICS.MANAGER@GO	2025-11-19 21:35:49	5	2		\N	E7C7CF7	\N	\N	\N
17	1	2025-11-17	M	5	SHELTER_USER@GMAIL.C	2025-11-17 18:30:54	TEST.DIRECTOR@ODPEM.	2025-11-17 18:31:58	LOGISTICS.MANAGER@GO	2025-11-19 22:09:54	4	2		\N	7D68A45	\N	\N	\N
\.


--
-- Data for Name: reliefrqst_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefrqst_item (reliefrqst_id, item_id, request_qty, issue_qty, urgency_ind, rqst_reason_desc, required_by_date, status_code, status_reason_desc, action_by_id, action_dtime, version_nbr) FROM stdin;
26	10	50.00	0.00	M		\N	R	\N	\N	\N	3
26	8	20.00	20.00	H	Out of toilet paper!!	2025-11-19	F	\N	LOGISTICS.OFFICER@GO	2025-11-19 21:24:14	3
28	11	100.00	100.00	L		\N	F	\N	LOGISTICS.MANAGER@GO	2025-11-19 21:35:49	5
17	10	20.00	0.00	M		\N	U	\N	LOGISTICS.MANAGER@GO	2025-11-19 22:09:53	6
17	8	10.00	10.00	L		\N	F	\N	LOGISTICS.MANAGER@GO	2025-11-19 22:09:53	6
18	10	200.00	0.00	M		\N	R	\N	\N	\N	1
23	10	10.00	0.00	M		\N	R	\N	\N	\N	1
16	8	10.00	0.00	H	Out of toilet paper.	2025-11-18	U	\N	LOGISTICS.MANAGER@GO	2025-11-19 13:22:13	13
16	7	20.00	20.00	M		\N	F	\N	LOGISTICS.MANAGER@GO	2025-11-19 13:22:13	13
\.


--
-- Data for Name: reliefrqst_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefrqst_status (status_code, status_desc, is_active_flag, reason_rqrd_flag) FROM stdin;
0	DRAFT	t	f
1	AWAITING APPROVAL	t	f
2	CANCELLED	t	f
3	SUBMITTED	t	f
5	PART FILLED	t	f
7	FILLED	t	f
4	DENIED	t	t
6	CLOSED	t	t
8	INELIGIBLE	t	t
9	PROCESSED	t	f
\.


--
-- Data for Name: reliefrqstitem_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reliefrqstitem_status (status_code, status_desc, item_qty_rule, active_flag, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
R	REQUESTED	EZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
U	UNAVAILABLE	EZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
W	AWAITING AVAILABILITY	EZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
D	DENIED	EZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
P	PARTLY FILLED	GZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
L	ALLOWED LIMIT	GZ	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
F	FILLED	ER	t	system	2025-11-17 15:10:13	system	2025-11-17 15:10:13	1
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.role (id, code, name, description, created_at) FROM stdin;
1	SYSTEM_ADMINISTRATOR	System Administrator	Full system access and configuration	2025-11-12 03:31:52.007644
2	LOGISTICS_MANAGER	Logistics Manager	Oversees all logistics operations	2025-11-12 03:31:52.007644
3	LOGISTICS_OFFICER	Logistics Officer	Manages inventory and fulfillment	2025-11-12 03:31:52.007644
7	INVENTORY_CLERK	Inventory Clerk	Stock management	2025-11-12 03:31:52.007644
8	AUDITOR	Auditor	Compliance and audit access	2025-11-12 03:31:52.007644
10	AGENCY_DISTRIBUTOR	Agency (Distributor)	Distributes relief items to beneficiaries	2025-11-13 14:23:48.666505
11	AGENCY_SHELTER	Agency (Shelter)	Manages shelter and evacuation operations	2025-11-13 14:23:48.666505
15	ODPEM_DIR_PEOD	Director, PEOD	Plans and coordinates emergency operations	2025-11-13 14:23:48.666505
16	ODPEM_DDG	Deputy Director General	Deputy head of disaster management	2025-11-13 14:23:48.666505
17	ODPEM_DG	Director General	Chief executive of disaster operations	2025-11-13 14:23:48.666505
19	CUSTODIAN	Custodian	Role responsible for managing disaster events and event lifecycle in DRIMS.	2025-11-16 18:45:44.964132
\.


--
-- Data for Name: role_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.role_permission (role_id, perm_id, scope_json, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
15	6	\N	system	2025-11-13 16:42:35	system	2025-11-13 16:42:35	1
17	6	\N	system	2025-11-13 16:42:48	system	2025-11-13 16:42:48	1
16	6	\N	system	2025-11-13 16:42:48	system	2025-11-13 16:42:48	1
19	28	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
19	29	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
19	30	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
19	31	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
19	32	{}	SYSTEM	2025-11-16 18:51:38	SYSTEM	2025-11-16 18:51:38	1
\.


--
-- Data for Name: rtintake; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rtintake (xfreturn_id, inventory_id, intake_date, comments_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- Data for Name: rtintake_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rtintake_item (xfreturn_id, inventory_id, item_id, usable_qty, location1_id, defective_qty, location2_id, expired_qty, location3_id, uom_code, status_code, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transaction (id, item_id, ttype, qty, warehouse_id, donor_id, event_id, expiry_date, notes, created_at, created_by) FROM stdin;
\.


--
-- Data for Name: transfer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transfer (transfer_id, fr_inventory_id, to_inventory_id, eligible_event_id, transfer_date, reason_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- Data for Name: transfer_request; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transfer_request (id, from_warehouse_id, to_warehouse_id, item_id, quantity, status, requested_by, requested_at, reviewed_by, reviewed_at, notes) FROM stdin;
\.


--
-- Data for Name: unitofmeasure; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unitofmeasure (uom_code, uom_desc, comments_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr, status_code) FROM stdin;
UNIT	Individual units	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
KG	Kilograms	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
LITRE	Litres	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
BOX	Boxes	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
SACK	Sacks	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
BOTTLE	Bottles	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
GALLON	Gallons	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
METRE	Metres	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
SHEET	Sheets	\N	SYSTEM	2025-11-12 03:31:52	SYSTEM	2025-11-12 03:31:52	1	A
BAG	Bag	\N	TEST.DIRECTOR@ODPEM.	2025-11-17 02:11:02	TEST.DIRECTOR@ODPEM.	2025-11-17 02:11:02	1	I
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" (user_id, email, password_hash, first_name, last_name, full_name, is_active, organization, job_title, phone, timezone, language, notification_preferences, assigned_warehouse_id, last_login_at, create_dtime, update_dtime, username, password_algo, mfa_enabled, mfa_secret, failed_login_count, lock_until_at, password_changed_at, agency_id, status_code, version_nbr, user_name) FROM stdin;
2	test.user@odpem.gov.jm	scrypt:32768:8:1$sqD9e0ANt6oD7Jlx$35bf7c14e18395535f4d6089462151b326036e163f7a27bd82ae9b4976a3b00311775c3bf5bef4a69200a5872ece2a67639de751f208dd7649d42213ce3a4c1a	Test	User	Test User	f	ODPEM	Test Officer	876-555-1234	America/Jamaica	en	\N	\N	\N	2025-11-12 04:37:13.113929	2025-11-19 22:13:13.414656	\N	argon2id	f	\N	0	\N	\N	\N	A	2	TEST.USER@ODPEM.GOV.
1	admin@odpem.gov.jm	scrypt:32768:8:1$0PuV6qs6LRiBTD7u$921f818d09bd67feaf84370eacdec9b80eb9c5722adc7ae8ef1a9c8310a6eebabe67001f1ac7d538880536b95d0f7f131e693247b8036a29fd3b4d94e60e20cd	SYSTEM	ADMINISTRATOR	SYSTEM ADMINISTRATOR	t	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 03:33:08.574171	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	ADMIN@ODPEM.GOV.JM
3	logistics.officer@gov.jm	scrypt:32768:8:1$fONJDxe4oj1F54Eo$e4136a2fd6d9f2414cc4832b4f710929e99965f7269b188f9c4a2f6deb6a5df9be4d58057c6d0f9cf8831a4a3d0381fe89d25ad532ef8656be9defe727aa77f4	Demar	Brown	Demar Brown	t	ODPEM	Logistics Officer	8764774108	America/Jamaica	en	\N	\N	\N	2025-11-12 14:50:31.22187	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	LOGISTICS.OFFICER@GO
7	shelter_user@gmail.com	scrypt:32768:8:1$mIXQdTZPkthL4Fiu$5b1c2ae661efa73eee1868226ea9bb19b73553ebcbfbb9d7ce5de24fe0d7136703fd4f77e2dd5e0147f91a03babf445bbc8c21b695cd55ac62ee49023f5743f2	Elton	John	Elton John	t	PORTMORE COMMUNITY CENTER	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 22:35:06.738396	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	1	A	1	SHELTER_USER@GMAIL.C
8	deputy_dg@odpem.gov.jm	scrypt:32768:8:1$ewjkJ5jSB0wICDtI$893138815b08b2dc6aad8c4af27d041199084b08e9db66717594e7a5972f04cdf365fbeaf71eac95393512544a0e1ed69b067a18630a971adfa1088e1b964c1d	Luke	Hall	Luke Hall	t	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	Deputy Director General	\N	America/Jamaica	en	\N	\N	\N	2025-11-13 16:28:42.440061	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	DEPUTY_DG@ODPEM.GOV.
9	director_general@odpem.gov.jm	scrypt:32768:8:1$AMiB02zzxJCiYNuH$ffa0ed725af1c20ba9e2c0a527d676578858392b717751f9ae538eac67dc2fbd3825929f99fcf198693ebe12cf1e646349c82e9193637bd022871ebb56d1291c	Michael	Graham	Michael Graham	t	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-13 16:30:19.338658	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	1	DIRECTOR_GENERAL@ODP
6	executive@odpem.gov.jm	scrypt:32768:8:1$TAlF4ihd3cus89dC$6d2eaa23be7ca1ac824a5dfe97f0dc545baf4fa2a63124c289f2b034299d96020595063e7e1c4f2aecd3f96acd4824eca747fe96e4d5f1a3efa0540b66654bc3	Sarah	Johnson	Sarah Johnson	t	\N	Director of PEOD	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 21:07:50.266216	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	2	EXECUTIVE@ODPEM.GOV.
13	test.inventory@odpem.gov.jm	scrypt:32768:8:1$pnQGDxLAVYfoDwXn$0f34b0fb89a17607df11c4f108419250869428b7fcd02cad037946dbd28997b2fe9ede18d32d167a90754cc387b7d3136ac5759342b8f5605d3c0af3db650742	Test	Inventory	TEST INVENTORY	f	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-14 16:45:50.995929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	4	TEST.INVENTORY@ODPEM
10	test.logistics@odpem.gov.jm	scrypt:32768:8:1$pnQGDxLAVYfoDwXn$0f34b0fb89a17607df11c4f108419250869428b7fcd02cad037946dbd28997b2fe9ede18d32d167a90754cc387b7d3136ac5759342b8f5605d3c0af3db650742	Test	Logistics	TEST LOGISTICS	f	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-14 16:45:50.995929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	2	TEST.LOGISTICS@ODPEM
11	test.agency@gmail.com	scrypt:32768:8:1$pnQGDxLAVYfoDwXn$0f34b0fb89a17607df11c4f108419250869428b7fcd02cad037946dbd28997b2fe9ede18d32d167a90754cc387b7d3136ac5759342b8f5605d3c0af3db650742	Test	Agency	TEST AGENCY	f	\N	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-14 16:45:50.995929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	1	A	2	TEST.AGENCY@GMAIL.CO
12	test.director@odpem.gov.jm	scrypt:32768:8:1$68bWjl9Gi03ikMW6$c9fc10b4f486946d97b2391ec3f96817e0f50c0cc890c6a3164ef061bbec393aaaa488fd30e99fbd13304e9de6c41cefb6d50428422b338660c2d55ea6dcaf1b	Brian	Custodian	Brian Custodian	t	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	\N	\N	America/Jamaica	en	\N	\N	\N	2025-11-14 16:45:50.995929	2025-11-16 20:11:24.925991	\N	argon2id	f	\N	0	\N	\N	\N	A	5	TEST.DIRECTOR@ODPEM.
5	inventory@odpem.gov.jm	scrypt:32768:8:1$9pwOdOF5dbaR6L1P$fe821d892b727199b45e1c49a2dbc03f818077244038469e0204bb3b110de0fccda92be943cd567efb08d12febce94c92fd435d65d0b537b6815745c27c254ea	Dale	Johnson	Dale Johnson	t	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	Inventory Clerk	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 21:06:10.280386	2025-11-19 22:11:30.062149	\N	argon2id	f	\N	0	\N	\N	\N	A	2	INVENTORY@ODPEM.GOV.
4	logistics.manager@gov.jm	scrypt:32768:8:1$ZTaPUnWLaFL0cG6c$2454040e9932d768d65cedbbb8472f793c9d0ba346ced95e20d2f919a1e19e538c285136ecc0ee77ded3d8154a22680ba85ed708ea139db22adcda3b4d2bacf4	Anthony	Bailey	Anthony Bailey	t	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	Logistics Manager	\N	America/Jamaica	en	\N	\N	\N	2025-11-12 14:51:28.952847	2025-11-19 22:12:28.802193	\N	argon2id	f	\N	0	\N	\N	\N	A	2	LOGISTICS.MANAGER@GO
18	inventory2@odpem.gov.jm	scrypt:32768:8:1$No9463zuRy06ytLC$4c453b3edc9c08aaabfd493bde80edb926ed577bc949e52a6215439146d015ecfd04d4716526e6142bd74a1306023a279321768ec27875acc8cd7c23eff5ba3e	Michael	Folks	Michael Folks	t	OFFICE OF DISASTER PREPAREDNESS AND EMERGENCY MANAGEMENT (ODPEM)	Inventory Clerk	\N	America/Jamaica	en	\N	\N	\N	2025-11-19 22:14:04.671103	2025-11-19 22:14:04.671107	\N	argon2id	f	\N	0	\N	\N	\N	A	1	INVENTORY2@ODPEM.GOV
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_role (user_id, role_id, assigned_at, assigned_by, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
2	3	2025-11-12 04:37:13.147794	\N	system	2025-11-13 14:06:16	system	2025-11-13 14:06:16	1
3	3	2025-11-12 14:50:31.272676	\N	system	2025-11-13 14:06:16	system	2025-11-13 14:06:16	1
1	1	2025-11-12 03:33:08.574171	\N	system	2025-11-13 14:06:16	system	2025-11-13 14:06:16	1
8	16	2025-11-13 16:28:42.495839	\N	system	2025-11-13 16:28:42	system	2025-11-13 16:28:42	1
9	17	2025-11-13 16:30:19.362036	\N	system	2025-11-13 16:30:19	system	2025-11-13 16:30:19	1
10	2	2025-11-14 16:49:30.875608	\N	system	2025-11-14 16:49:31	system	2025-11-14 16:49:31	1
11	11	2025-11-14 16:49:30.875608	\N	system	2025-11-14 16:49:31	system	2025-11-14 16:49:31	1
13	7	2025-11-14 16:49:30.875608	\N	system	2025-11-14 16:49:31	system	2025-11-14 16:49:31	1
7	11	2025-11-14 18:14:02.832752	\N	system	2025-11-14 18:14:03	system	2025-11-14 18:14:03	1
12	15	2025-11-16 19:15:39.788416	\N	system	2025-11-16 19:15:40	system	2025-11-16 19:15:40	1
12	19	2025-11-16 19:15:39.788423	\N	system	2025-11-16 19:15:40	system	2025-11-16 19:15:40	1
6	15	2025-11-18 22:43:46.495823	\N	system	2025-11-18 22:43:46	system	2025-11-18 22:43:46	1
6	19	2025-11-18 22:43:46.49583	\N	system	2025-11-18 22:43:46	system	2025-11-18 22:43:46	1
5	7	2025-11-19 22:11:30.293551	\N	system	2025-11-19 22:11:30	system	2025-11-19 22:11:30	1
4	2	2025-11-19 22:12:28.932718	\N	system	2025-11-19 22:12:29	system	2025-11-19 22:12:29	1
18	7	2025-11-19 22:14:04.69944	\N	system	2025-11-19 22:14:05	system	2025-11-19 22:14:05	1
\.


--
-- Data for Name: user_warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_warehouse (user_id, warehouse_id, assigned_at, assigned_by) FROM stdin;
2	1	2025-11-12 04:37:13.170464	\N
8	1	2025-11-13 16:28:42.521335	\N
9	1	2025-11-13 16:30:19.384624	\N
6	1	2025-11-18 22:43:46.55413	\N
5	1	2025-11-19 22:11:30.344513	\N
18	8	2025-11-19 22:14:04.719171	\N
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.warehouse (warehouse_id, warehouse_name, warehouse_type, address1_text, address2_text, parish_code, contact_name, phone_no, email_text, custodian_id, status_code, reason_desc, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
8	MONTEGO BAY RELIEF CENTER	SUB-HUB	15 BAY STREET	MONTEGO BAY	01	PATRICIA BROWN	+1 (876) 555-0199	patricia.brown@odpem.gov.jm	1	A	\N	system	2025-11-13 23:54:15	TEST.DIRECTOR@ODPEM.	2025-11-16 21:41:28	2
1	KINGSTON CENTRAL DEPOT	MAIN-HUB	123 Main Street, Kingston	\N	01	JOHN BROWN	+1 (876) 555-1234	\N	1	A	\N	admin	2025-11-12 03:33:09	TEST.DIRECTOR@ODPEM.	2025-11-16 21:44:26	9
\.


--
-- Data for Name: xfreturn; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.xfreturn (xfreturn_id, fr_inventory_id, to_inventory_id, return_date, reason_text, status_code, create_by_id, create_dtime, update_by_id, update_dtime, verify_by_id, verify_dtime, version_nbr) FROM stdin;
\.


--
-- Data for Name: xfreturn_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.xfreturn_item (xfreturn_id, inventory_id, item_id, usable_qty, defective_qty, expired_qty, uom_code, reason_text, create_by_id, create_dtime, update_by_id, update_dtime, version_nbr) FROM stdin;
\.


--
-- Name: agency_account_request_audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agency_account_request_audit_audit_id_seq', 1, false);


--
-- Name: agency_account_request_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agency_account_request_request_id_seq', 1, false);


--
-- Name: agency_agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agency_agency_id_seq', 2, true);


--
-- Name: custodian_custodian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.custodian_custodian_id_seq', 1, true);


--
-- Name: distribution_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.distribution_package_id_seq', 1, false);


--
-- Name: distribution_package_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.distribution_package_item_id_seq', 1, false);


--
-- Name: donation_donation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.donation_donation_id_seq', 11, true);


--
-- Name: donor_donor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.donor_donor_id_seq', 2, true);


--
-- Name: event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_event_id_seq', 3, true);


--
-- Name: item_new_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_new_item_id_seq', 11, true);


--
-- Name: itembatch_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.itembatch_batch_id_seq', 22, true);


--
-- Name: itemcatg_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.itemcatg_category_id_seq', 6, true);


--
-- Name: location_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.location_location_id_seq', 1, false);


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notification_id_seq', 72, true);


--
-- Name: permission_perm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.permission_perm_id_seq', 32, true);


--
-- Name: reliefpkg_reliefpkg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reliefpkg_reliefpkg_id_seq', 12, true);


--
-- Name: reliefrqst_reliefrqst_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reliefrqst_reliefrqst_id_seq', 28, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.role_id_seq', 20, true);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transaction_id_seq', 1, false);


--
-- Name: transfer_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transfer_request_id_seq', 1, false);


--
-- Name: transfer_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transfer_transfer_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_id_seq', 18, true);


--
-- Name: warehouse_warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.warehouse_warehouse_id_seq', 9, true);


--
-- Name: xfreturn_xfreturn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.xfreturn_xfreturn_id_seq', 1, false);


--
-- Name: agency_account_request_audit agency_account_request_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request_audit
    ADD CONSTRAINT agency_account_request_audit_pkey PRIMARY KEY (audit_id);


--
-- Name: agency_account_request agency_account_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT agency_account_request_pkey PRIMARY KEY (request_id);


--
-- Name: agency agency_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT agency_pkey PRIMARY KEY (agency_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: dbintake_item dbintake_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_pkey PRIMARY KEY (reliefpkg_id, inventory_id, item_id);


--
-- Name: dbintake dbintake_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake
    ADD CONSTRAINT dbintake_pkey PRIMARY KEY (reliefpkg_id, inventory_id);


--
-- Name: distribution_package_item distribution_package_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package_item
    ADD CONSTRAINT distribution_package_item_pkey PRIMARY KEY (id);


--
-- Name: distribution_package distribution_package_package_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_package_number_key UNIQUE (package_number);


--
-- Name: distribution_package distribution_package_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_pkey PRIMARY KEY (id);


--
-- Name: dnintake dnintake_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake
    ADD CONSTRAINT dnintake_pkey PRIMARY KEY (donation_id, inventory_id);


--
-- Name: donor donor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT donor_pkey PRIMARY KEY (donor_id);


--
-- Name: item_location item_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_location
    ADD CONSTRAINT item_location_pkey PRIMARY KEY (item_id, location_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: parish parish_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parish
    ADD CONSTRAINT parish_pkey PRIMARY KEY (parish_code);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (perm_id);


--
-- Name: batchlocation pk_batchlocation; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT pk_batchlocation PRIMARY KEY (inventory_id, location_id, batch_id);


--
-- Name: custodian pk_custodian; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custodian
    ADD CONSTRAINT pk_custodian PRIMARY KEY (custodian_id);


--
-- Name: dnintake_item pk_dnintake_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake_item
    ADD CONSTRAINT pk_dnintake_item PRIMARY KEY (donation_id, inventory_id, item_id, batch_no);


--
-- Name: donation pk_donation; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT pk_donation PRIMARY KEY (donation_id);


--
-- Name: donation_item pk_donation_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation_item
    ADD CONSTRAINT pk_donation_item PRIMARY KEY (donation_id, item_id);


--
-- Name: event pk_event; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT pk_event PRIMARY KEY (event_id);


--
-- Name: inventory pk_inventory; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT pk_inventory PRIMARY KEY (inventory_id, item_id);


--
-- Name: item pk_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT pk_item PRIMARY KEY (item_id);


--
-- Name: itembatch pk_itembatch; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itembatch
    ADD CONSTRAINT pk_itembatch PRIMARY KEY (batch_id);


--
-- Name: itemcatg pk_itemcatg; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itemcatg
    ADD CONSTRAINT pk_itemcatg PRIMARY KEY (category_id);


--
-- Name: reliefpkg_item pk_reliefpkg_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg_item
    ADD CONSTRAINT pk_reliefpkg_item PRIMARY KEY (reliefpkg_id, fr_inventory_id, batch_id, item_id);


--
-- Name: reliefrqst pk_reliefrqst; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst
    ADD CONSTRAINT pk_reliefrqst PRIMARY KEY (reliefrqst_id);


--
-- Name: reliefrqst_item pk_reliefrqst_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_item
    ADD CONSTRAINT pk_reliefrqst_item PRIMARY KEY (reliefrqst_id, item_id);


--
-- Name: reliefrqst_status pk_reliefrqst_status; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_status
    ADD CONSTRAINT pk_reliefrqst_status PRIMARY KEY (status_code);


--
-- Name: reliefrqstitem_status pk_reliefrqstitem_status; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqstitem_status
    ADD CONSTRAINT pk_reliefrqstitem_status PRIMARY KEY (status_code);


--
-- Name: role_permission pk_role_permission; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT pk_role_permission PRIMARY KEY (role_id, perm_id);


--
-- Name: rtintake pk_rtintake; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake
    ADD CONSTRAINT pk_rtintake PRIMARY KEY (xfreturn_id, inventory_id);


--
-- Name: rtintake_item pk_rtintake_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT pk_rtintake_item PRIMARY KEY (xfreturn_id, inventory_id, item_id);


--
-- Name: transfer pk_transfer; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT pk_transfer PRIMARY KEY (transfer_id);


--
-- Name: unitofmeasure pk_unitofmeasure; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unitofmeasure
    ADD CONSTRAINT pk_unitofmeasure PRIMARY KEY (uom_code);


--
-- Name: xfreturn_item pk_xfreturn_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn_item
    ADD CONSTRAINT pk_xfreturn_item PRIMARY KEY (xfreturn_id, inventory_id, item_id);


--
-- Name: relief_request_fulfillment_lock relief_request_fulfillment_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relief_request_fulfillment_lock
    ADD CONSTRAINT relief_request_fulfillment_lock_pkey PRIMARY KEY (reliefrqst_id);


--
-- Name: reliefpkg reliefpkg_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg
    ADD CONSTRAINT reliefpkg_pkey PRIMARY KEY (reliefpkg_id);


--
-- Name: role role_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_code_key UNIQUE (code);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: transfer_request transfer_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_pkey PRIMARY KEY (id);


--
-- Name: agency uk_agency_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT uk_agency_1 UNIQUE (agency_name);


--
-- Name: custodian uk_custodian_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custodian
    ADD CONSTRAINT uk_custodian_1 UNIQUE (custodian_name);


--
-- Name: donor uk_donor_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT uk_donor_1 UNIQUE (donor_name);


--
-- Name: item uk_item_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT uk_item_1 UNIQUE (item_code);


--
-- Name: item uk_item_2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT uk_item_2 UNIQUE (item_name);


--
-- Name: item uk_item_3; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT uk_item_3 UNIQUE (sku_code);


--
-- Name: itemcatg uk_itemcatg_1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itemcatg
    ADD CONSTRAINT uk_itemcatg_1 UNIQUE (category_code);


--
-- Name: permission uq_permission_resource_action; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT uq_permission_resource_action UNIQUE (resource, action);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: user_warehouse user_warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_warehouse
    ADD CONSTRAINT user_warehouse_pkey PRIMARY KEY (user_id, warehouse_id);


--
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehouse_id);


--
-- Name: xfreturn xfreturn_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn
    ADD CONSTRAINT xfreturn_pkey PRIMARY KEY (xfreturn_id);


--
-- Name: dk_aar_audit_req_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_aar_audit_req_time ON public.agency_account_request_audit USING btree (request_id, event_dtime);


--
-- Name: dk_aar_status_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_aar_status_created ON public.agency_account_request USING btree (status_code, created_at);


--
-- Name: dk_batchlocation_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_batchlocation_1 ON public.batchlocation USING btree (batch_id, location_id);


--
-- Name: dk_dbintake_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_dbintake_item_1 ON public.dbintake_item USING btree (inventory_id, item_id);


--
-- Name: dk_dbintake_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_dbintake_item_2 ON public.dbintake_item USING btree (item_id);


--
-- Name: dk_dnintake_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_dnintake_item_1 ON public.dnintake_item USING btree (inventory_id, item_id);


--
-- Name: dk_dnintake_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_dnintake_item_2 ON public.dnintake_item USING btree (item_id);


--
-- Name: dk_inventory_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_inventory_1 ON public.inventory USING btree (item_id);


--
-- Name: dk_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_item_1 ON public.item USING btree (item_desc);


--
-- Name: dk_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_item_2 ON public.item USING btree (category_id);


--
-- Name: dk_item_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_item_3 ON public.item USING btree (sku_code);


--
-- Name: dk_item_location_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_item_location_1 ON public.item_location USING btree (inventory_id, location_id);


--
-- Name: dk_itembatch_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_itembatch_1 ON public.itembatch USING btree (item_id, inventory_id);


--
-- Name: dk_itembatch_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_itembatch_2 ON public.itembatch USING btree (batch_no, inventory_id);


--
-- Name: dk_itembatch_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_itembatch_3 ON public.itembatch USING btree (item_id, expiry_date) WHERE ((status_code = 'A'::bpchar) AND (expiry_date IS NOT NULL));


--
-- Name: dk_itembatch_4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_itembatch_4 ON public.itembatch USING btree (item_id, batch_date) WHERE (status_code = 'A'::bpchar);


--
-- Name: dk_location_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_location_1 ON public.location USING btree (inventory_id);


--
-- Name: dk_reliefpkg_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_1 ON public.reliefpkg USING btree (start_date);


--
-- Name: dk_reliefpkg_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_3 ON public.reliefpkg USING btree (to_inventory_id);


--
-- Name: dk_reliefpkg_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_item_1 ON public.reliefpkg_item USING btree (fr_inventory_id, item_id);


--
-- Name: dk_reliefpkg_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_item_2 ON public.reliefpkg_item USING btree (item_id);


--
-- Name: dk_reliefpkg_item_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefpkg_item_3 ON public.reliefpkg_item USING btree (batch_id);


--
-- Name: dk_reliefrqst_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefrqst_1 ON public.reliefrqst USING btree (agency_id, request_date);


--
-- Name: dk_reliefrqst_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefrqst_2 ON public.reliefrqst USING btree (request_date, status_code);


--
-- Name: dk_reliefrqst_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefrqst_3 ON public.reliefrqst USING btree (status_code, urgency_ind);


--
-- Name: dk_reliefrqst_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_reliefrqst_item_2 ON public.reliefrqst_item USING btree (item_id, urgency_ind);


--
-- Name: dk_rtintake_item_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_rtintake_item_1 ON public.rtintake_item USING btree (inventory_id, item_id);


--
-- Name: dk_rtintake_item_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_rtintake_item_2 ON public.rtintake_item USING btree (item_id);


--
-- Name: dk_transfer_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_1 ON public.transfer USING btree (transfer_date);


--
-- Name: dk_transfer_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_2 ON public.transfer USING btree (fr_inventory_id);


--
-- Name: dk_transfer_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_transfer_3 ON public.transfer USING btree (to_inventory_id);


--
-- Name: dk_user_agency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_user_agency_id ON public."user" USING btree (agency_id);


--
-- Name: dk_xfreturn_1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_xfreturn_1 ON public.xfreturn USING btree (return_date);


--
-- Name: dk_xfreturn_2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_xfreturn_2 ON public.xfreturn USING btree (fr_inventory_id);


--
-- Name: dk_xfreturn_3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dk_xfreturn_3 ON public.xfreturn USING btree (to_inventory_id);


--
-- Name: idx_distribution_package_agency; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_agency ON public.distribution_package USING btree (recipient_agency_id);


--
-- Name: idx_distribution_package_event; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_event ON public.distribution_package USING btree (event_id);


--
-- Name: idx_distribution_package_item_item; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_item_item ON public.distribution_package_item USING btree (item_id);


--
-- Name: idx_distribution_package_item_package; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_item_package ON public.distribution_package_item USING btree (package_id);


--
-- Name: idx_distribution_package_warehouse; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_distribution_package_warehouse ON public.distribution_package USING btree (assigned_warehouse_id);


--
-- Name: idx_fulfillment_lock_expires; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fulfillment_lock_expires ON public.relief_request_fulfillment_lock USING btree (expires_at) WHERE (expires_at IS NOT NULL);


--
-- Name: idx_fulfillment_lock_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fulfillment_lock_user ON public.relief_request_fulfillment_lock USING btree (fulfiller_user_id);


--
-- Name: idx_itemcatg_status_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_itemcatg_status_code ON public.itemcatg USING btree (status_code);


--
-- Name: idx_notification_user_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notification_user_status ON public.notification USING btree (user_id, status, created_at);


--
-- Name: idx_notification_warehouse; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notification_warehouse ON public.notification USING btree (warehouse_id, created_at);


--
-- Name: idx_role_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_role_code ON public.role USING btree (code);


--
-- Name: ix_role_permission_perm_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_role_permission_perm_id ON public.role_permission USING btree (perm_id);


--
-- Name: ix_role_permission_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_role_permission_role_id ON public.role_permission USING btree (role_id);


--
-- Name: ix_user_role_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_user_role_role_id ON public.user_role USING btree (role_id);


--
-- Name: ix_user_role_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_user_role_user_id ON public.user_role USING btree (user_id);


--
-- Name: uk_aar_active_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_aar_active_email ON public.agency_account_request USING btree (lower((contact_email)::text)) WHERE (status_code = ANY (ARRAY['S'::bpchar, 'R'::bpchar]));


--
-- Name: uk_inventory_1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_inventory_1 ON public.inventory USING btree (item_id, inventory_id) WHERE (usable_qty > 0.00);


--
-- Name: uk_itembatch_1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_itembatch_1 ON public.itembatch USING btree (inventory_id, batch_no, item_id);


--
-- Name: uk_itembatch_inventory_batch; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_itembatch_inventory_batch ON public.itembatch USING btree (inventory_id, batch_id);


--
-- Name: uk_itembatch_inventory_batch_item; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_itembatch_inventory_batch_item ON public.itembatch USING btree (inventory_id, batch_id, item_id);


--
-- Name: uk_user_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_user_username ON public."user" USING btree (username);


--
-- Name: agency_account_request trg_aar_set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_aar_set_updated_at BEFORE UPDATE ON public.agency_account_request FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: user trg_user_set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_user_set_updated_at BEFORE UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: agency agency_ineligible_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT agency_ineligible_event_id_fkey FOREIGN KEY (ineligible_event_id) REFERENCES public.event(event_id);


--
-- Name: agency agency_parish_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT agency_parish_code_fkey FOREIGN KEY (parish_code) REFERENCES public.parish(parish_code);


--
-- Name: dbintake_item dbintake_item_location1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_location1_id_fkey FOREIGN KEY (location1_id) REFERENCES public.location(location_id);


--
-- Name: dbintake_item dbintake_item_location2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_location2_id_fkey FOREIGN KEY (location2_id) REFERENCES public.location(location_id);


--
-- Name: dbintake_item dbintake_item_location3_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_location3_id_fkey FOREIGN KEY (location3_id) REFERENCES public.location(location_id);


--
-- Name: dbintake_item dbintake_item_reliefpkg_id_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_reliefpkg_id_inventory_id_fkey FOREIGN KEY (reliefpkg_id, inventory_id) REFERENCES public.dbintake(reliefpkg_id, inventory_id);


--
-- Name: dbintake_item dbintake_item_uom_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake_item
    ADD CONSTRAINT dbintake_item_uom_code_fkey FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: dbintake dbintake_reliefpkg_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake
    ADD CONSTRAINT dbintake_reliefpkg_id_fkey FOREIGN KEY (reliefpkg_id) REFERENCES public.reliefpkg(reliefpkg_id);


--
-- Name: distribution_package distribution_package_assigned_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_assigned_warehouse_id_fkey FOREIGN KEY (assigned_warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: distribution_package distribution_package_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- Name: distribution_package_item distribution_package_item_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package_item
    ADD CONSTRAINT distribution_package_item_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- Name: distribution_package_item distribution_package_item_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package_item
    ADD CONSTRAINT distribution_package_item_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.distribution_package(id) ON DELETE CASCADE;


--
-- Name: distribution_package distribution_package_recipient_agency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_package
    ADD CONSTRAINT distribution_package_recipient_agency_id_fkey FOREIGN KEY (recipient_agency_id) REFERENCES public.agency(agency_id);


--
-- Name: dnintake dnintake_donation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake
    ADD CONSTRAINT dnintake_donation_id_fkey FOREIGN KEY (donation_id) REFERENCES public.donation(donation_id);


--
-- Name: donor donor_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT donor_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: agency_account_request_audit fk_aar_actor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request_audit
    ADD CONSTRAINT fk_aar_actor FOREIGN KEY (actor_user_id) REFERENCES public."user"(user_id);


--
-- Name: agency_account_request fk_aar_agency; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT fk_aar_agency FOREIGN KEY (agency_id) REFERENCES public.agency(agency_id);


--
-- Name: agency_account_request_audit fk_aar_audit_req; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request_audit
    ADD CONSTRAINT fk_aar_audit_req FOREIGN KEY (request_id) REFERENCES public.agency_account_request(request_id);


--
-- Name: agency_account_request fk_aar_created_by; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT fk_aar_created_by FOREIGN KEY (created_by_id) REFERENCES public."user"(user_id);


--
-- Name: agency_account_request fk_aar_updated_by; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT fk_aar_updated_by FOREIGN KEY (updated_by_id) REFERENCES public."user"(user_id);


--
-- Name: agency_account_request fk_aar_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency_account_request
    ADD CONSTRAINT fk_aar_user FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- Name: agency fk_agency_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT fk_agency_warehouse FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: batchlocation fk_batchlocation_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT fk_batchlocation_inventory FOREIGN KEY (inventory_id, batch_id) REFERENCES public.itembatch(inventory_id, batch_id);


--
-- Name: batchlocation fk_batchlocation_itembatch; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT fk_batchlocation_itembatch FOREIGN KEY (batch_id) REFERENCES public.itembatch(batch_id);


--
-- Name: batchlocation fk_batchlocation_location; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT fk_batchlocation_location FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- Name: batchlocation fk_batchlocation_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batchlocation
    ADD CONSTRAINT fk_batchlocation_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: custodian fk_custodian_parish; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custodian
    ADD CONSTRAINT fk_custodian_parish FOREIGN KEY (parish_code) REFERENCES public.parish(parish_code);


--
-- Name: dbintake fk_dbintake_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbintake
    ADD CONSTRAINT fk_dbintake_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: dnintake_item fk_dnintake_item_donation_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake_item
    ADD CONSTRAINT fk_dnintake_item_donation_item FOREIGN KEY (donation_id, item_id) REFERENCES public.donation_item(donation_id, item_id);


--
-- Name: dnintake_item fk_dnintake_item_intake; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake_item
    ADD CONSTRAINT fk_dnintake_item_intake FOREIGN KEY (donation_id, inventory_id) REFERENCES public.dnintake(donation_id, inventory_id);


--
-- Name: dnintake_item fk_dnintake_item_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake_item
    ADD CONSTRAINT fk_dnintake_item_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: dnintake fk_dnintake_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dnintake
    ADD CONSTRAINT fk_dnintake_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: donation fk_donation_custodian; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT fk_donation_custodian FOREIGN KEY (custodian_id) REFERENCES public.custodian(custodian_id);


--
-- Name: donation fk_donation_donor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT fk_donation_donor FOREIGN KEY (donor_id) REFERENCES public.donor(donor_id);


--
-- Name: donation fk_donation_event; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation
    ADD CONSTRAINT fk_donation_event FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- Name: donation_item fk_donation_item_donation; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation_item
    ADD CONSTRAINT fk_donation_item_donation FOREIGN KEY (donation_id) REFERENCES public.donation(donation_id);


--
-- Name: donation_item fk_donation_item_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation_item
    ADD CONSTRAINT fk_donation_item_item FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- Name: donation_item fk_donation_item_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donation_item
    ADD CONSTRAINT fk_donation_item_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: inventory fk_inventory_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fk_inventory_item FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- Name: inventory fk_inventory_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fk_inventory_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: inventory fk_inventory_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fk_inventory_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: item fk_item_itemcatg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_item_itemcatg FOREIGN KEY (category_id) REFERENCES public.itemcatg(category_id);


--
-- Name: item_location fk_item_location_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_location
    ADD CONSTRAINT fk_item_location_inventory FOREIGN KEY (inventory_id, item_id) REFERENCES public.inventory(inventory_id, item_id);


--
-- Name: item fk_item_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_item_unitofmeasure FOREIGN KEY (default_uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: itembatch fk_itembatch_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itembatch
    ADD CONSTRAINT fk_itembatch_item FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- Name: itembatch fk_itembatch_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itembatch
    ADD CONSTRAINT fk_itembatch_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: itembatch fk_itembatch_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itembatch
    ADD CONSTRAINT fk_itembatch_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: location fk_location_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT fk_location_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: reliefpkg fk_reliefpkg_agency; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg
    ADD CONSTRAINT fk_reliefpkg_agency FOREIGN KEY (agency_id) REFERENCES public.agency(agency_id);


--
-- Name: reliefpkg fk_reliefpkg_event; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg
    ADD CONSTRAINT fk_reliefpkg_event FOREIGN KEY (eligible_event_id) REFERENCES public.event(event_id);


--
-- Name: reliefpkg_item fk_reliefpkg_item_itembatch; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg_item
    ADD CONSTRAINT fk_reliefpkg_item_itembatch FOREIGN KEY (fr_inventory_id, batch_id, item_id) REFERENCES public.itembatch(inventory_id, batch_id, item_id);


--
-- Name: reliefpkg_item fk_reliefpkg_item_reliefpkg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg_item
    ADD CONSTRAINT fk_reliefpkg_item_reliefpkg FOREIGN KEY (reliefpkg_id) REFERENCES public.reliefpkg(reliefpkg_id);


--
-- Name: reliefpkg_item fk_reliefpkg_item_unitofmeasure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg_item
    ADD CONSTRAINT fk_reliefpkg_item_unitofmeasure FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: reliefpkg fk_reliefpkg_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg
    ADD CONSTRAINT fk_reliefpkg_warehouse FOREIGN KEY (to_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: reliefrqst fk_reliefrqst_agency; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst
    ADD CONSTRAINT fk_reliefrqst_agency FOREIGN KEY (agency_id) REFERENCES public.agency(agency_id);


--
-- Name: reliefrqst fk_reliefrqst_event; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst
    ADD CONSTRAINT fk_reliefrqst_event FOREIGN KEY (eligible_event_id) REFERENCES public.event(event_id);


--
-- Name: reliefrqst_item fk_reliefrqst_item_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_item
    ADD CONSTRAINT fk_reliefrqst_item_item FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- Name: reliefrqst_item fk_reliefrqst_item_reliefrqst; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_item
    ADD CONSTRAINT fk_reliefrqst_item_reliefrqst FOREIGN KEY (reliefrqst_id) REFERENCES public.reliefrqst(reliefrqst_id);


--
-- Name: reliefrqst_item fk_reliefrqst_item_reliefrqstitem_status; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst_item
    ADD CONSTRAINT fk_reliefrqst_item_reliefrqstitem_status FOREIGN KEY (status_code) REFERENCES public.reliefrqstitem_status(status_code);


--
-- Name: reliefrqst fk_reliefrqst_reliefrqst_status; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefrqst
    ADD CONSTRAINT fk_reliefrqst_reliefrqst_status FOREIGN KEY (status_code) REFERENCES public.reliefrqst_status(status_code);


--
-- Name: role_permission fk_role_permission_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT fk_role_permission_perm FOREIGN KEY (perm_id) REFERENCES public.permission(perm_id);


--
-- Name: role_permission fk_role_permission_role; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT fk_role_permission_role FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: rtintake_item fk_rtintake_item_intake; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT fk_rtintake_item_intake FOREIGN KEY (xfreturn_id, inventory_id) REFERENCES public.rtintake(xfreturn_id, inventory_id);


--
-- Name: rtintake fk_rtintake_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake
    ADD CONSTRAINT fk_rtintake_warehouse FOREIGN KEY (inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: transfer fk_transfer_event; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_event FOREIGN KEY (eligible_event_id) REFERENCES public.event(event_id);


--
-- Name: transfer fk_transfer_warehouse1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_warehouse1 FOREIGN KEY (fr_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: transfer fk_transfer_warehouse2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_warehouse2 FOREIGN KEY (to_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: xfreturn fk_xfreturn_fr_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn
    ADD CONSTRAINT fk_xfreturn_fr_warehouse FOREIGN KEY (fr_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: xfreturn_item fk_xfreturn_item_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn_item
    ADD CONSTRAINT fk_xfreturn_item_inventory FOREIGN KEY (inventory_id, item_id) REFERENCES public.inventory(inventory_id, item_id);


--
-- Name: xfreturn fk_xfreturn_to_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn
    ADD CONSTRAINT fk_xfreturn_to_warehouse FOREIGN KEY (to_inventory_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: item_location item_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_location
    ADD CONSTRAINT item_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- Name: notification notification_reliefrqst_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_reliefrqst_id_fkey FOREIGN KEY (reliefrqst_id) REFERENCES public.reliefrqst(reliefrqst_id);


--
-- Name: notification notification_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- Name: notification notification_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: relief_request_fulfillment_lock relief_request_fulfillment_lock_fulfiller_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relief_request_fulfillment_lock
    ADD CONSTRAINT relief_request_fulfillment_lock_fulfiller_user_id_fkey FOREIGN KEY (fulfiller_user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- Name: relief_request_fulfillment_lock relief_request_fulfillment_lock_reliefrqst_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relief_request_fulfillment_lock
    ADD CONSTRAINT relief_request_fulfillment_lock_reliefrqst_id_fkey FOREIGN KEY (reliefrqst_id) REFERENCES public.reliefrqst(reliefrqst_id) ON DELETE CASCADE;


--
-- Name: reliefpkg reliefpkg_reliefrqst_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reliefpkg
    ADD CONSTRAINT reliefpkg_reliefrqst_id_fkey FOREIGN KEY (reliefrqst_id) REFERENCES public.reliefrqst(reliefrqst_id);


--
-- Name: rtintake_item rtintake_item_location1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT rtintake_item_location1_id_fkey FOREIGN KEY (location1_id) REFERENCES public.location(location_id);


--
-- Name: rtintake_item rtintake_item_location2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT rtintake_item_location2_id_fkey FOREIGN KEY (location2_id) REFERENCES public.location(location_id);


--
-- Name: rtintake_item rtintake_item_location3_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT rtintake_item_location3_id_fkey FOREIGN KEY (location3_id) REFERENCES public.location(location_id);


--
-- Name: rtintake_item rtintake_item_uom_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake_item
    ADD CONSTRAINT rtintake_item_uom_code_fkey FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: rtintake rtintake_xfreturn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rtintake
    ADD CONSTRAINT rtintake_xfreturn_id_fkey FOREIGN KEY (xfreturn_id) REFERENCES public.xfreturn(xfreturn_id);


--
-- Name: transaction transaction_donor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_donor_id_fkey FOREIGN KEY (donor_id) REFERENCES public.donor(donor_id);


--
-- Name: transaction transaction_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- Name: transaction transaction_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- Name: transaction transaction_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: transfer_request transfer_request_from_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_from_warehouse_id_fkey FOREIGN KEY (from_warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: transfer_request transfer_request_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(item_id);


--
-- Name: transfer_request transfer_request_requested_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_requested_by_fkey FOREIGN KEY (requested_by) REFERENCES public."user"(user_id);


--
-- Name: transfer_request transfer_request_reviewed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES public."user"(user_id);


--
-- Name: transfer_request transfer_request_to_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_request
    ADD CONSTRAINT transfer_request_to_warehouse_id_fkey FOREIGN KEY (to_warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: user user_agency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_agency_id_fkey FOREIGN KEY (agency_id) REFERENCES public.agency(agency_id);


--
-- Name: user user_assigned_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_assigned_warehouse_id_fkey FOREIGN KEY (assigned_warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- Name: user_role user_role_assigned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_assigned_by_fkey FOREIGN KEY (assigned_by) REFERENCES public."user"(user_id);


--
-- Name: user_role user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id) ON DELETE CASCADE;


--
-- Name: user_role user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- Name: user_warehouse user_warehouse_assigned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_warehouse
    ADD CONSTRAINT user_warehouse_assigned_by_fkey FOREIGN KEY (assigned_by) REFERENCES public."user"(user_id);


--
-- Name: user_warehouse user_warehouse_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_warehouse
    ADD CONSTRAINT user_warehouse_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON DELETE CASCADE;


--
-- Name: user_warehouse user_warehouse_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_warehouse
    ADD CONSTRAINT user_warehouse_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id) ON DELETE CASCADE;


--
-- Name: warehouse warehouse_custodian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_custodian_id_fkey FOREIGN KEY (custodian_id) REFERENCES public.custodian(custodian_id);


--
-- Name: warehouse warehouse_parish_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_parish_code_fkey FOREIGN KEY (parish_code) REFERENCES public.parish(parish_code);


--
-- Name: xfreturn_item xfreturn_item_uom_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn_item
    ADD CONSTRAINT xfreturn_item_uom_code_fkey FOREIGN KEY (uom_code) REFERENCES public.unitofmeasure(uom_code);


--
-- Name: xfreturn_item xfreturn_item_xfreturn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xfreturn_item
    ADD CONSTRAINT xfreturn_item_xfreturn_id_fkey FOREIGN KEY (xfreturn_id) REFERENCES public.xfreturn(xfreturn_id);


--
-- PostgreSQL database dump complete
--

\unrestrict PRq9hX58qlP0czki0MzTC6MrVRPhwgxwVfj6y37aV5rzgOURALdHhRxkmjF1yAj

