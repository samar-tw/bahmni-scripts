--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 9.6.24

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ae; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ae (
    pk bigint NOT NULL,
    aet text NOT NULL,
    hostname text NOT NULL,
    port integer NOT NULL,
    cipher_suites text,
    pat_id_issuer text,
    acc_no_issuer text,
    user_id text,
    passwd text,
    fs_group_id text,
    ae_group text,
    ae_desc text,
    wado_url text,
    station_name text,
    institution text,
    department text,
    installed boolean NOT NULL,
    vendor_data bytea
);


ALTER TABLE public.ae OWNER TO postgres;

--
-- Name: ae_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ae_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ae_pk_seq OWNER TO postgres;

--
-- Name: ae_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ae_pk_seq OWNED BY public.ae.pk;


--
-- Name: code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.code (
    pk bigint NOT NULL,
    code_value text NOT NULL,
    code_designator text NOT NULL,
    code_version text,
    code_meaning text
);


ALTER TABLE public.code OWNER TO postgres;

--
-- Name: code_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.code_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.code_pk_seq OWNER TO postgres;

--
-- Name: code_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.code_pk_seq OWNED BY public.code.pk;


--
-- Name: content_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_item (
    pk bigint NOT NULL,
    instance_fk bigint,
    name_fk bigint,
    code_fk bigint,
    rel_type text,
    text_value text
);


ALTER TABLE public.content_item OWNER TO postgres;

--
-- Name: content_item_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_item_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_item_pk_seq OWNER TO postgres;

--
-- Name: content_item_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_item_pk_seq OWNED BY public.content_item.pk;


--
-- Name: device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device (
    pk bigint NOT NULL,
    station_name text NOT NULL,
    station_aet text NOT NULL,
    modality text NOT NULL
);


ALTER TABLE public.device OWNER TO postgres;

--
-- Name: device_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_pk_seq OWNER TO postgres;

--
-- Name: device_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_pk_seq OWNED BY public.device.pk;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    pk bigint NOT NULL,
    instance_fk bigint,
    filesystem_fk bigint,
    filepath text NOT NULL,
    file_tsuid text NOT NULL,
    file_md5 text,
    file_size bigint,
    file_status integer,
    md5_check_time timestamp without time zone,
    created_time timestamp without time zone
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_pk_seq OWNER TO postgres;

--
-- Name: files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_pk_seq OWNED BY public.files.pk;


--
-- Name: filesystem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filesystem (
    pk bigint NOT NULL,
    next_fk bigint,
    dirpath text NOT NULL,
    fs_group_id text NOT NULL,
    retrieve_aet text NOT NULL,
    availability integer NOT NULL,
    fs_status integer NOT NULL,
    user_info text
);


ALTER TABLE public.filesystem OWNER TO postgres;

--
-- Name: filesystem_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filesystem_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filesystem_pk_seq OWNER TO postgres;

--
-- Name: filesystem_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filesystem_pk_seq OWNED BY public.filesystem.pk;


--
-- Name: gppps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gppps (
    pk bigint NOT NULL,
    patient_fk bigint,
    pps_iuid text NOT NULL,
    pps_start timestamp without time zone,
    pps_status integer NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    pps_attrs bytea
);


ALTER TABLE public.gppps OWNER TO postgres;

--
-- Name: gppps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gppps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gppps_pk_seq OWNER TO postgres;

--
-- Name: gppps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gppps_pk_seq OWNED BY public.gppps.pk;


--
-- Name: gpsps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gpsps (
    pk bigint NOT NULL,
    patient_fk bigint,
    code_fk bigint,
    gpsps_iuid text NOT NULL,
    gpsps_tuid text,
    start_datetime timestamp without time zone NOT NULL,
    end_datetime timestamp without time zone,
    gpsps_status integer,
    gpsps_prior integer,
    in_availability integer,
    item_attrs bytea
);


ALTER TABLE public.gpsps OWNER TO postgres;

--
-- Name: gpsps_perf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gpsps_perf (
    pk bigint NOT NULL,
    gpsps_fk bigint,
    code_fk bigint,
    human_perf_name text,
    hum_perf_fn_sx text,
    hum_perf_gn_sx text,
    hum_perf_i_name text,
    hum_perf_p_name text
);


ALTER TABLE public.gpsps_perf OWNER TO postgres;

--
-- Name: gpsps_perf_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gpsps_perf_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpsps_perf_pk_seq OWNER TO postgres;

--
-- Name: gpsps_perf_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gpsps_perf_pk_seq OWNED BY public.gpsps_perf.pk;


--
-- Name: gpsps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gpsps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpsps_pk_seq OWNER TO postgres;

--
-- Name: gpsps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gpsps_pk_seq OWNED BY public.gpsps.pk;


--
-- Name: gpsps_req; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gpsps_req (
    pk bigint NOT NULL,
    gpsps_fk bigint,
    req_proc_id text,
    accession_no text
);


ALTER TABLE public.gpsps_req OWNER TO postgres;

--
-- Name: gpsps_req_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gpsps_req_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpsps_req_pk_seq OWNER TO postgres;

--
-- Name: gpsps_req_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gpsps_req_pk_seq OWNED BY public.gpsps_req.pk;


--
-- Name: hp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hp (
    pk bigint NOT NULL,
    user_fk bigint,
    hp_iuid text NOT NULL,
    hp_cuid text,
    hp_name text,
    hp_group text,
    hp_level integer,
    num_priors integer,
    num_screens integer,
    hp_attrs bytea
);


ALTER TABLE public.hp OWNER TO postgres;

--
-- Name: hp_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hp_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hp_pk_seq OWNER TO postgres;

--
-- Name: hp_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hp_pk_seq OWNED BY public.hp.pk;


--
-- Name: hpdef; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hpdef (
    pk bigint NOT NULL,
    hp_fk bigint,
    modality text,
    laterality text
);


ALTER TABLE public.hpdef OWNER TO postgres;

--
-- Name: hpdef_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hpdef_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hpdef_pk_seq OWNER TO postgres;

--
-- Name: hpdef_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hpdef_pk_seq OWNED BY public.hpdef.pk;


--
-- Name: instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instance (
    pk bigint NOT NULL,
    series_fk bigint,
    srcode_fk bigint,
    media_fk bigint,
    sop_iuid text NOT NULL,
    sop_cuid text NOT NULL,
    inst_no text,
    content_datetime timestamp without time zone,
    sr_complete text,
    sr_verified text,
    inst_custom1 text,
    inst_custom2 text,
    inst_custom3 text,
    ext_retr_aet text,
    retrieve_aets text,
    availability integer NOT NULL,
    inst_status integer NOT NULL,
    all_attrs boolean NOT NULL,
    commitment boolean NOT NULL,
    archived boolean NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    inst_attrs bytea
);


ALTER TABLE public.instance OWNER TO postgres;

--
-- Name: instance_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instance_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instance_pk_seq OWNER TO postgres;

--
-- Name: instance_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instance_pk_seq OWNED BY public.instance.pk;


--
-- Name: issuer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issuer (
    pk bigint NOT NULL,
    entity_id text,
    entity_uid text,
    entity_uid_type text
);


ALTER TABLE public.issuer OWNER TO postgres;

--
-- Name: issuer_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issuer_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issuer_pk_seq OWNER TO postgres;

--
-- Name: issuer_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issuer_pk_seq OWNED BY public.issuer.pk;


--
-- Name: jbm_counter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_counter (
    name character varying(255) NOT NULL,
    next_id bigint
);


ALTER TABLE public.jbm_counter OWNER TO postgres;

--
-- Name: jbm_dual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_dual (
    dummy integer NOT NULL
);


ALTER TABLE public.jbm_dual OWNER TO postgres;

--
-- Name: jbm_id_cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_id_cache (
    node_id integer NOT NULL,
    cntr integer NOT NULL,
    jbm_id character varying(255)
);


ALTER TABLE public.jbm_id_cache OWNER TO postgres;

--
-- Name: jbm_msg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_msg (
    message_id bigint NOT NULL,
    reliable character(1),
    expiration bigint,
    "timestamp" bigint,
    priority smallint,
    type smallint,
    headers bytea,
    payload bytea
);


ALTER TABLE public.jbm_msg OWNER TO postgres;

--
-- Name: jbm_msg_ref; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_msg_ref (
    message_id bigint NOT NULL,
    channel_id bigint NOT NULL,
    transaction_id bigint,
    state character(1),
    ord bigint,
    page_ord bigint,
    delivery_count integer,
    sched_delivery bigint
);


ALTER TABLE public.jbm_msg_ref OWNER TO postgres;

--
-- Name: jbm_postoffice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_postoffice (
    postoffice_name character varying(255) NOT NULL,
    node_id integer NOT NULL,
    queue_name character varying(255) NOT NULL,
    cond character varying(1023),
    selector character varying(1023),
    channel_id bigint,
    clustered character(1),
    all_nodes character(1)
);


ALTER TABLE public.jbm_postoffice OWNER TO postgres;

--
-- Name: jbm_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_role (
    role_id character varying(32) NOT NULL,
    user_id character varying(32) NOT NULL
);


ALTER TABLE public.jbm_role OWNER TO postgres;

--
-- Name: jbm_tx; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_tx (
    node_id integer,
    transaction_id bigint NOT NULL,
    branch_qual bytea,
    format_id integer,
    global_txid bytea
);


ALTER TABLE public.jbm_tx OWNER TO postgres;

--
-- Name: jbm_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jbm_user (
    user_id character varying(32) NOT NULL,
    passwd character varying(32) NOT NULL,
    clientid character varying(128)
);


ALTER TABLE public.jbm_user OWNER TO postgres;

--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    pk bigint NOT NULL,
    fileset_iuid text NOT NULL,
    fileset_id text,
    media_rq_iuid text,
    media_status integer NOT NULL,
    media_status_info text,
    media_usage bigint NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_pk_seq OWNER TO postgres;

--
-- Name: media_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_pk_seq OWNED BY public.media.pk;


--
-- Name: mpps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mpps (
    pk bigint NOT NULL,
    patient_fk bigint,
    drcode_fk bigint,
    mpps_iuid text NOT NULL,
    pps_start timestamp without time zone,
    station_aet text,
    modality text,
    accession_no text,
    mpps_status integer NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    mpps_attrs bytea
);


ALTER TABLE public.mpps OWNER TO postgres;

--
-- Name: mpps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mpps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mpps_pk_seq OWNER TO postgres;

--
-- Name: mpps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mpps_pk_seq OWNED BY public.mpps.pk;


--
-- Name: mwl_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mwl_item (
    pk bigint NOT NULL,
    patient_fk bigint,
    sps_status integer,
    sps_id text,
    start_datetime timestamp without time zone NOT NULL,
    station_aet text NOT NULL,
    station_name text,
    modality text NOT NULL,
    perf_physician text,
    perf_phys_fn_sx text,
    perf_phys_gn_sx text,
    perf_phys_i_name text,
    perf_phys_p_name text,
    req_proc_id text NOT NULL,
    accession_no text,
    study_iuid text NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    item_attrs bytea
);


ALTER TABLE public.mwl_item OWNER TO postgres;

--
-- Name: mwl_item_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mwl_item_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mwl_item_pk_seq OWNER TO postgres;

--
-- Name: mwl_item_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mwl_item_pk_seq OWNED BY public.mwl_item.pk;


--
-- Name: other_pid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.other_pid (
    pk bigint NOT NULL,
    pat_id text NOT NULL,
    pat_id_issuer text NOT NULL
);


ALTER TABLE public.other_pid OWNER TO postgres;

--
-- Name: other_pid_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.other_pid_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_pid_pk_seq OWNER TO postgres;

--
-- Name: other_pid_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.other_pid_pk_seq OWNED BY public.other_pid.pk;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    pk bigint NOT NULL,
    merge_fk bigint,
    pat_id text,
    pat_id_issuer text,
    pat_name text,
    pat_fn_sx text,
    pat_gn_sx text,
    pat_i_name text,
    pat_p_name text,
    pat_birthdate text,
    pat_sex text,
    pat_custom1 text,
    pat_custom2 text,
    pat_custom3 text,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    pat_attrs bytea
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: patient_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patient_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_pk_seq OWNER TO postgres;

--
-- Name: patient_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patient_pk_seq OWNED BY public.patient.pk;


--
-- Name: priv_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priv_file (
    pk bigint NOT NULL,
    instance_fk bigint,
    filesystem_fk bigint,
    filepath text NOT NULL,
    file_tsuid text NOT NULL,
    file_md5 text,
    file_size bigint,
    file_status integer
);


ALTER TABLE public.priv_file OWNER TO postgres;

--
-- Name: priv_file_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priv_file_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_file_pk_seq OWNER TO postgres;

--
-- Name: priv_file_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priv_file_pk_seq OWNED BY public.priv_file.pk;


--
-- Name: priv_instance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priv_instance (
    pk bigint NOT NULL,
    series_fk bigint,
    priv_type integer NOT NULL,
    sop_iuid text NOT NULL,
    created_time timestamp without time zone,
    inst_attrs bytea
);


ALTER TABLE public.priv_instance OWNER TO postgres;

--
-- Name: priv_instance_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priv_instance_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_instance_pk_seq OWNER TO postgres;

--
-- Name: priv_instance_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priv_instance_pk_seq OWNED BY public.priv_instance.pk;


--
-- Name: priv_patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priv_patient (
    pk bigint NOT NULL,
    priv_type integer NOT NULL,
    pat_id text,
    pat_id_issuer text,
    pat_name text,
    pat_attrs bytea
);


ALTER TABLE public.priv_patient OWNER TO postgres;

--
-- Name: priv_patient_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priv_patient_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_patient_pk_seq OWNER TO postgres;

--
-- Name: priv_patient_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priv_patient_pk_seq OWNED BY public.priv_patient.pk;


--
-- Name: priv_series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priv_series (
    pk bigint NOT NULL,
    study_fk bigint,
    priv_type integer NOT NULL,
    series_iuid text NOT NULL,
    src_aet text,
    series_attrs bytea
);


ALTER TABLE public.priv_series OWNER TO postgres;

--
-- Name: priv_series_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priv_series_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_series_pk_seq OWNER TO postgres;

--
-- Name: priv_series_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priv_series_pk_seq OWNED BY public.priv_series.pk;


--
-- Name: priv_study; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priv_study (
    pk bigint NOT NULL,
    patient_fk bigint,
    priv_type integer NOT NULL,
    study_iuid text NOT NULL,
    accession_no text,
    study_attrs bytea
);


ALTER TABLE public.priv_study OWNER TO postgres;

--
-- Name: priv_study_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priv_study_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_study_pk_seq OWNER TO postgres;

--
-- Name: priv_study_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priv_study_pk_seq OWNED BY public.priv_study.pk;


--
-- Name: published_study; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.published_study (
    pk bigint NOT NULL,
    study_fk bigint,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    doc_uid text,
    docentry_uid text,
    repository_uid text,
    status integer NOT NULL
);


ALTER TABLE public.published_study OWNER TO postgres;

--
-- Name: published_study_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.published_study_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.published_study_pk_seq OWNER TO postgres;

--
-- Name: published_study_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.published_study_pk_seq OWNED BY public.published_study.pk;


--
-- Name: rel_dev_proto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_dev_proto (
    device_fk bigint,
    prcode_fk bigint
);


ALTER TABLE public.rel_dev_proto OWNER TO postgres;

--
-- Name: rel_gpsps_appcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_gpsps_appcode (
    gpsps_fk bigint,
    appcode_fk bigint
);


ALTER TABLE public.rel_gpsps_appcode OWNER TO postgres;

--
-- Name: rel_gpsps_devclass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_gpsps_devclass (
    gpsps_fk bigint,
    devclass_fk bigint
);


ALTER TABLE public.rel_gpsps_devclass OWNER TO postgres;

--
-- Name: rel_gpsps_devloc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_gpsps_devloc (
    gpsps_fk bigint,
    devloc_fk bigint
);


ALTER TABLE public.rel_gpsps_devloc OWNER TO postgres;

--
-- Name: rel_gpsps_devname; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_gpsps_devname (
    gpsps_fk bigint,
    devname_fk bigint
);


ALTER TABLE public.rel_gpsps_devname OWNER TO postgres;

--
-- Name: rel_gpsps_gppps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_gpsps_gppps (
    gpsps_fk bigint,
    gppps_fk bigint
);


ALTER TABLE public.rel_gpsps_gppps OWNER TO postgres;

--
-- Name: rel_hpdef_proc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_hpdef_proc (
    hpdef_fk bigint,
    proc_fk bigint
);


ALTER TABLE public.rel_hpdef_proc OWNER TO postgres;

--
-- Name: rel_hpdef_reason; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_hpdef_reason (
    hpdef_fk bigint,
    reason_fk bigint
);


ALTER TABLE public.rel_hpdef_reason OWNER TO postgres;

--
-- Name: rel_hpdef_region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_hpdef_region (
    hpdef_fk bigint,
    region_fk bigint
);


ALTER TABLE public.rel_hpdef_region OWNER TO postgres;

--
-- Name: rel_pat_other_pid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_pat_other_pid (
    patient_fk bigint,
    other_pid_fk bigint
);


ALTER TABLE public.rel_pat_other_pid OWNER TO postgres;

--
-- Name: rel_study_pcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_study_pcode (
    study_fk bigint,
    pcode_fk bigint
);


ALTER TABLE public.rel_study_pcode OWNER TO postgres;

--
-- Name: rel_ups_appcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_ups_appcode (
    ups_fk bigint,
    appcode_fk bigint
);


ALTER TABLE public.rel_ups_appcode OWNER TO postgres;

--
-- Name: rel_ups_devclass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_ups_devclass (
    ups_fk bigint,
    devclass_fk bigint
);


ALTER TABLE public.rel_ups_devclass OWNER TO postgres;

--
-- Name: rel_ups_devloc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_ups_devloc (
    ups_fk bigint,
    devloc_fk bigint
);


ALTER TABLE public.rel_ups_devloc OWNER TO postgres;

--
-- Name: rel_ups_devname; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_ups_devname (
    ups_fk bigint,
    devname_fk bigint
);


ALTER TABLE public.rel_ups_devname OWNER TO postgres;

--
-- Name: rel_ups_performer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_ups_performer (
    ups_fk bigint,
    performer_fk bigint
);


ALTER TABLE public.rel_ups_performer OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    user_id text,
    roles text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.series (
    pk bigint NOT NULL,
    study_fk bigint,
    mpps_fk bigint,
    inst_code_fk bigint,
    series_iuid text NOT NULL,
    series_no text,
    modality text,
    body_part text,
    laterality text,
    series_desc text,
    institution text,
    station_name text,
    department text,
    perf_physician text,
    perf_phys_fn_sx text,
    perf_phys_gn_sx text,
    perf_phys_i_name text,
    perf_phys_p_name text,
    pps_start timestamp without time zone,
    pps_iuid text,
    series_custom1 text,
    series_custom2 text,
    series_custom3 text,
    num_instances integer NOT NULL,
    src_aet text,
    ext_retr_aet text,
    retrieve_aets text,
    fileset_iuid text,
    fileset_id text,
    availability integer NOT NULL,
    series_status integer NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    series_attrs bytea
);


ALTER TABLE public.series OWNER TO postgres;

--
-- Name: series_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.series_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_pk_seq OWNER TO postgres;

--
-- Name: series_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.series_pk_seq OWNED BY public.series.pk;


--
-- Name: series_req; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.series_req (
    pk bigint NOT NULL,
    series_fk bigint,
    accno_issuer_fk bigint,
    accession_no text,
    study_iuid text,
    req_proc_id text,
    sps_id text,
    req_service text,
    req_physician text,
    req_phys_fn_sx text,
    req_phys_gn_sx text,
    req_phys_i_name text,
    req_phys_p_name text
);


ALTER TABLE public.series_req OWNER TO postgres;

--
-- Name: series_req_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.series_req_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_req_pk_seq OWNER TO postgres;

--
-- Name: series_req_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.series_req_pk_seq OWNED BY public.series_req.pk;


--
-- Name: study; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.study (
    pk bigint NOT NULL,
    patient_fk bigint,
    accno_issuer_fk bigint,
    study_iuid text NOT NULL,
    study_id text,
    study_datetime timestamp without time zone,
    accession_no text,
    ref_physician text,
    ref_phys_fn_sx text,
    ref_phys_gn_sx text,
    ref_phys_i_name text,
    ref_phys_p_name text,
    study_desc text,
    study_custom1 text,
    study_custom2 text,
    study_custom3 text,
    study_status_id text,
    mods_in_study text,
    cuids_in_study text,
    num_series integer NOT NULL,
    num_instances integer NOT NULL,
    ext_retr_aet text,
    retrieve_aets text,
    fileset_iuid text,
    fileset_id text,
    availability integer NOT NULL,
    study_status integer NOT NULL,
    checked_time timestamp without time zone,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    study_attrs bytea
);


ALTER TABLE public.study OWNER TO postgres;

--
-- Name: study_on_fs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.study_on_fs (
    pk bigint NOT NULL,
    study_fk bigint,
    filesystem_fk bigint,
    access_time timestamp without time zone NOT NULL,
    mark_to_delete boolean NOT NULL
);


ALTER TABLE public.study_on_fs OWNER TO postgres;

--
-- Name: study_on_fs_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.study_on_fs_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.study_on_fs_pk_seq OWNER TO postgres;

--
-- Name: study_on_fs_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.study_on_fs_pk_seq OWNED BY public.study_on_fs.pk;


--
-- Name: study_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.study_permission (
    pk bigint NOT NULL,
    study_iuid text NOT NULL,
    action text NOT NULL,
    roles text NOT NULL
);


ALTER TABLE public.study_permission OWNER TO postgres;

--
-- Name: study_permission_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.study_permission_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.study_permission_pk_seq OWNER TO postgres;

--
-- Name: study_permission_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.study_permission_pk_seq OWNED BY public.study_permission.pk;


--
-- Name: study_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.study_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.study_pk_seq OWNER TO postgres;

--
-- Name: study_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.study_pk_seq OWNED BY public.study.pk;


--
-- Name: timers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timers (
    timerid character varying(80) NOT NULL,
    targetid character varying(250) NOT NULL,
    initialdate timestamp without time zone NOT NULL,
    timerinterval bigint,
    instancepk bytea,
    info bytea
);


ALTER TABLE public.timers OWNER TO postgres;

--
-- Name: ups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ups (
    pk bigint NOT NULL,
    patient_fk bigint,
    code_fk bigint,
    ups_iuid text NOT NULL,
    ups_tuid text,
    adm_id text,
    adm_id_issuer_id text,
    adm_id_issuer_uid text,
    ups_label text NOT NULL,
    uwl_label text NOT NULL,
    ups_start_time timestamp without time zone NOT NULL,
    ups_compl_time timestamp without time zone,
    ups_state integer,
    ups_prior integer,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    ups_attrs bytea
);


ALTER TABLE public.ups OWNER TO postgres;

--
-- Name: ups_glob_subscr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ups_glob_subscr (
    pk bigint NOT NULL,
    aet text NOT NULL,
    deletion_lock boolean NOT NULL
);


ALTER TABLE public.ups_glob_subscr OWNER TO postgres;

--
-- Name: ups_glob_subscr_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ups_glob_subscr_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_glob_subscr_pk_seq OWNER TO postgres;

--
-- Name: ups_glob_subscr_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ups_glob_subscr_pk_seq OWNED BY public.ups_glob_subscr.pk;


--
-- Name: ups_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ups_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_pk_seq OWNER TO postgres;

--
-- Name: ups_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ups_pk_seq OWNED BY public.ups.pk;


--
-- Name: ups_rel_ps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ups_rel_ps (
    pk bigint NOT NULL,
    ups_fk bigint,
    sop_iuid text NOT NULL,
    sop_cuid text NOT NULL
);


ALTER TABLE public.ups_rel_ps OWNER TO postgres;

--
-- Name: ups_rel_ps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ups_rel_ps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_rel_ps_pk_seq OWNER TO postgres;

--
-- Name: ups_rel_ps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ups_rel_ps_pk_seq OWNED BY public.ups_rel_ps.pk;


--
-- Name: ups_repl_ps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ups_repl_ps (
    pk bigint NOT NULL,
    ups_fk bigint,
    sop_iuid text NOT NULL,
    sop_cuid text NOT NULL
);


ALTER TABLE public.ups_repl_ps OWNER TO postgres;

--
-- Name: ups_repl_ps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ups_repl_ps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_repl_ps_pk_seq OWNER TO postgres;

--
-- Name: ups_repl_ps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ups_repl_ps_pk_seq OWNED BY public.ups_repl_ps.pk;


--
-- Name: ups_req; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ups_req (
    pk bigint NOT NULL,
    ups_fk bigint,
    req_proc_id text,
    accession_no text,
    confidentiality text,
    req_service text
);


ALTER TABLE public.ups_req OWNER TO postgres;

--
-- Name: ups_req_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ups_req_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_req_pk_seq OWNER TO postgres;

--
-- Name: ups_req_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ups_req_pk_seq OWNED BY public.ups_req.pk;


--
-- Name: ups_subscr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ups_subscr (
    pk bigint NOT NULL,
    ups_fk bigint,
    aet text NOT NULL,
    deletion_lock boolean NOT NULL
);


ALTER TABLE public.ups_subscr OWNER TO postgres;

--
-- Name: ups_subscr_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ups_subscr_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_subscr_pk_seq OWNER TO postgres;

--
-- Name: ups_subscr_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ups_subscr_pk_seq OWNED BY public.ups_subscr.pk;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id text NOT NULL,
    passwd text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: verify_observer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verify_observer (
    pk bigint NOT NULL,
    instance_fk bigint,
    verify_datetime timestamp without time zone,
    observer_name text,
    observer_fn_sx text,
    observer_gn_sx text,
    observer_i_name text,
    observer_p_name text
);


ALTER TABLE public.verify_observer OWNER TO postgres;

--
-- Name: verify_observer_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verify_observer_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verify_observer_pk_seq OWNER TO postgres;

--
-- Name: verify_observer_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verify_observer_pk_seq OWNED BY public.verify_observer.pk;


--
-- Name: ae pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ae ALTER COLUMN pk SET DEFAULT nextval('public.ae_pk_seq'::regclass);


--
-- Name: code pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code ALTER COLUMN pk SET DEFAULT nextval('public.code_pk_seq'::regclass);


--
-- Name: content_item pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_item ALTER COLUMN pk SET DEFAULT nextval('public.content_item_pk_seq'::regclass);


--
-- Name: device pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device ALTER COLUMN pk SET DEFAULT nextval('public.device_pk_seq'::regclass);


--
-- Name: files pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN pk SET DEFAULT nextval('public.files_pk_seq'::regclass);


--
-- Name: filesystem pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filesystem ALTER COLUMN pk SET DEFAULT nextval('public.filesystem_pk_seq'::regclass);


--
-- Name: gppps pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gppps ALTER COLUMN pk SET DEFAULT nextval('public.gppps_pk_seq'::regclass);


--
-- Name: gpsps pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps ALTER COLUMN pk SET DEFAULT nextval('public.gpsps_pk_seq'::regclass);


--
-- Name: gpsps_perf pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps_perf ALTER COLUMN pk SET DEFAULT nextval('public.gpsps_perf_pk_seq'::regclass);


--
-- Name: gpsps_req pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps_req ALTER COLUMN pk SET DEFAULT nextval('public.gpsps_req_pk_seq'::regclass);


--
-- Name: hp pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hp ALTER COLUMN pk SET DEFAULT nextval('public.hp_pk_seq'::regclass);


--
-- Name: hpdef pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hpdef ALTER COLUMN pk SET DEFAULT nextval('public.hpdef_pk_seq'::regclass);


--
-- Name: instance pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instance ALTER COLUMN pk SET DEFAULT nextval('public.instance_pk_seq'::regclass);


--
-- Name: issuer pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer ALTER COLUMN pk SET DEFAULT nextval('public.issuer_pk_seq'::regclass);


--
-- Name: media pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN pk SET DEFAULT nextval('public.media_pk_seq'::regclass);


--
-- Name: mpps pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mpps ALTER COLUMN pk SET DEFAULT nextval('public.mpps_pk_seq'::regclass);


--
-- Name: mwl_item pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mwl_item ALTER COLUMN pk SET DEFAULT nextval('public.mwl_item_pk_seq'::regclass);


--
-- Name: other_pid pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_pid ALTER COLUMN pk SET DEFAULT nextval('public.other_pid_pk_seq'::regclass);


--
-- Name: patient pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient ALTER COLUMN pk SET DEFAULT nextval('public.patient_pk_seq'::regclass);


--
-- Name: priv_file pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_file ALTER COLUMN pk SET DEFAULT nextval('public.priv_file_pk_seq'::regclass);


--
-- Name: priv_instance pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_instance ALTER COLUMN pk SET DEFAULT nextval('public.priv_instance_pk_seq'::regclass);


--
-- Name: priv_patient pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_patient ALTER COLUMN pk SET DEFAULT nextval('public.priv_patient_pk_seq'::regclass);


--
-- Name: priv_series pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_series ALTER COLUMN pk SET DEFAULT nextval('public.priv_series_pk_seq'::regclass);


--
-- Name: priv_study pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_study ALTER COLUMN pk SET DEFAULT nextval('public.priv_study_pk_seq'::regclass);


--
-- Name: published_study pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.published_study ALTER COLUMN pk SET DEFAULT nextval('public.published_study_pk_seq'::regclass);


--
-- Name: series pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series ALTER COLUMN pk SET DEFAULT nextval('public.series_pk_seq'::regclass);


--
-- Name: series_req pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_req ALTER COLUMN pk SET DEFAULT nextval('public.series_req_pk_seq'::regclass);


--
-- Name: study pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study ALTER COLUMN pk SET DEFAULT nextval('public.study_pk_seq'::regclass);


--
-- Name: study_on_fs pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_on_fs ALTER COLUMN pk SET DEFAULT nextval('public.study_on_fs_pk_seq'::regclass);


--
-- Name: study_permission pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_permission ALTER COLUMN pk SET DEFAULT nextval('public.study_permission_pk_seq'::regclass);


--
-- Name: ups pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups ALTER COLUMN pk SET DEFAULT nextval('public.ups_pk_seq'::regclass);


--
-- Name: ups_glob_subscr pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_glob_subscr ALTER COLUMN pk SET DEFAULT nextval('public.ups_glob_subscr_pk_seq'::regclass);


--
-- Name: ups_rel_ps pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_rel_ps ALTER COLUMN pk SET DEFAULT nextval('public.ups_rel_ps_pk_seq'::regclass);


--
-- Name: ups_repl_ps pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_repl_ps ALTER COLUMN pk SET DEFAULT nextval('public.ups_repl_ps_pk_seq'::regclass);


--
-- Name: ups_req pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_req ALTER COLUMN pk SET DEFAULT nextval('public.ups_req_pk_seq'::regclass);


--
-- Name: ups_subscr pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_subscr ALTER COLUMN pk SET DEFAULT nextval('public.ups_subscr_pk_seq'::regclass);


--
-- Name: verify_observer pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verify_observer ALTER COLUMN pk SET DEFAULT nextval('public.verify_observer_pk_seq'::regclass);


--
-- Data for Name: ae; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ae (pk, aet, hostname, port, cipher_suites, pat_id_issuer, acc_no_issuer, user_id, passwd, fs_group_id, ae_group, ae_desc, wado_url, station_name, institution, department, installed, vendor_data) FROM stdin;
1	DCM4CHEE	localhost	11112	\N	DCM4CHEE	\N	\N	\N	\N	\N	This dcm4chee archive instance	\N	\N	\N	\N	t	\N
2	CDRECORD	localhost	10104	\N	\N	\N	\N	\N	\N	\N	Media Creation Server (part of dcm4chee)	\N	\N	\N	\N	t	\N
\.


--
-- Name: ae_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ae_pk_seq', 2, true);


--
-- Data for Name: code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.code (pk, code_value, code_designator, code_version, code_meaning) FROM stdin;
\.


--
-- Name: code_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.code_pk_seq', 1, false);


--
-- Data for Name: content_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_item (pk, instance_fk, name_fk, code_fk, rel_type, text_value) FROM stdin;
\.


--
-- Name: content_item_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_item_pk_seq', 1, false);


--
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device (pk, station_name, station_aet, modality) FROM stdin;
\.


--
-- Name: device_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_pk_seq', 1, false);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (pk, instance_fk, filesystem_fk, filepath, file_tsuid, file_md5, file_size, file_status, md5_check_time, created_time) FROM stdin;
\.


--
-- Name: files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_pk_seq', 1, false);


--
-- Data for Name: filesystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filesystem (pk, next_fk, dirpath, fs_group_id, retrieve_aet, availability, fs_status, user_info) FROM stdin;
\.


--
-- Name: filesystem_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filesystem_pk_seq', 1, false);


--
-- Data for Name: gppps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gppps (pk, patient_fk, pps_iuid, pps_start, pps_status, created_time, updated_time, pps_attrs) FROM stdin;
\.


--
-- Name: gppps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gppps_pk_seq', 1, false);


--
-- Data for Name: gpsps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gpsps (pk, patient_fk, code_fk, gpsps_iuid, gpsps_tuid, start_datetime, end_datetime, gpsps_status, gpsps_prior, in_availability, item_attrs) FROM stdin;
\.


--
-- Data for Name: gpsps_perf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gpsps_perf (pk, gpsps_fk, code_fk, human_perf_name, hum_perf_fn_sx, hum_perf_gn_sx, hum_perf_i_name, hum_perf_p_name) FROM stdin;
\.


--
-- Name: gpsps_perf_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gpsps_perf_pk_seq', 1, false);


--
-- Name: gpsps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gpsps_pk_seq', 1, false);


--
-- Data for Name: gpsps_req; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gpsps_req (pk, gpsps_fk, req_proc_id, accession_no) FROM stdin;
\.


--
-- Name: gpsps_req_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gpsps_req_pk_seq', 1, false);


--
-- Data for Name: hp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hp (pk, user_fk, hp_iuid, hp_cuid, hp_name, hp_group, hp_level, num_priors, num_screens, hp_attrs) FROM stdin;
\.


--
-- Name: hp_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hp_pk_seq', 1, false);


--
-- Data for Name: hpdef; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hpdef (pk, hp_fk, modality, laterality) FROM stdin;
\.


--
-- Name: hpdef_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hpdef_pk_seq', 1, false);


--
-- Data for Name: instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instance (pk, series_fk, srcode_fk, media_fk, sop_iuid, sop_cuid, inst_no, content_datetime, sr_complete, sr_verified, inst_custom1, inst_custom2, inst_custom3, ext_retr_aet, retrieve_aets, availability, inst_status, all_attrs, commitment, archived, created_time, updated_time, inst_attrs) FROM stdin;
\.


--
-- Name: instance_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instance_pk_seq', 1, false);


--
-- Data for Name: issuer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issuer (pk, entity_id, entity_uid, entity_uid_type) FROM stdin;
\.


--
-- Name: issuer_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issuer_pk_seq', 1, false);


--
-- Data for Name: jbm_counter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_counter (name, next_id) FROM stdin;
MESSAGE_ID	4096
CHANNEL_ID	30
\.


--
-- Data for Name: jbm_dual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_dual (dummy) FROM stdin;
1
\.


--
-- Data for Name: jbm_id_cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_id_cache (node_id, cntr, jbm_id) FROM stdin;
\.


--
-- Data for Name: jbm_msg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_msg (message_id, reliable, expiration, "timestamp", priority, type, headers, payload) FROM stdin;
\.


--
-- Data for Name: jbm_msg_ref; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_msg_ref (message_id, channel_id, transaction_id, state, ord, page_ord, delivery_count, sched_delivery) FROM stdin;
\.


--
-- Data for Name: jbm_postoffice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_postoffice (postoffice_name, node_id, queue_name, cond, selector, channel_id, clustered, all_nodes) FROM stdin;
JMS post office	0	DLQ	queue.DLQ	\N	0	N	N
JMS post office	0	ExpiryQueue	queue.ExpiryQueue	\N	1	N	N
JMS post office	0	AttributesModificationScu	queue.AttributesModificationScu	\N	2	N	N
JMS post office	0	DeleteStudy	queue.DeleteStudy	\N	3	N	N
JMS post office	0	ExportManager	queue.ExportManager	\N	4	N	N
JMS post office	0	FileCopy	queue.FileCopy	\N	5	N	N
JMS post office	0	FileMove	queue.FileMove	\N	6	N	N
JMS post office	0	HL7Send	queue.HL7Send	\N	7	N	N
JMS post office	0	IANScu	queue.IANScu	\N	8	N	N
JMS post office	0	MCMScu	queue.MCMScu	\N	9	N	N
JMS post office	0	MoveScu	queue.MoveScu	\N	10	N	N
JMS post office	0	MPPSScu	queue.MPPSScu	\N	11	N	N
JMS post office	0	PPSExceptionMgt	queue.PPSExceptionMgt	\N	12	N	N
JMS post office	0	PPSScu	queue.PPSScu	\N	13	N	N
JMS post office	0	Prefetch	queue.Prefetch	\N	14	N	N
JMS post office	0	RejectionNoteStored	queue.RejectionNoteStored	\N	15	N	N
JMS post office	0	Sendmail	queue.Sendmail	\N	16	N	N
JMS post office	0	StgCmtScuScp	queue.StgCmtScuScp	\N	17	N	N
JMS post office	0	StudyMgtScu	queue.StudyMgtScu	\N	18	N	N
JMS post office	0	UpgradeToEnhancedMF	queue.UpgradeToEnhancedMF	\N	19	N	N
JMS post office	0	UPSScp	queue.UPSScp	\N	20	N	N
JMS post office	0	WadoPrefetch	queue.WadoPrefetch	\N	21	N	N
JMS post office	0	HL7SendV2	queue.HL7SendV2	\N	22	N	N
JMS post office	0	IANSCU_web	queue.IANSCU_web	\N	23	N	N
JMS post office	0	AttributesModification_web	queue.AttributesModification_web	\N	24	N	N
JMS post office	0	MoveScu_web	queue.MoveScu_web	\N	25	N	N
JMS post office	0	RejectionNoteSCU	queue.RejectionNoteSCU	\N	26	N	N
JMS post office	0	TCStoreScu	queue.TCStoreScu	\N	27	N	N
\.


--
-- Data for Name: jbm_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_role (role_id, user_id) FROM stdin;
subscriber	john
john	guest
noacc	nobody
j2ee	guest
durpublisher	dynsub
guest	guest
durpublisher	john
publisher	dynsub
publisher	john
\.


--
-- Data for Name: jbm_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_tx (node_id, transaction_id, branch_qual, format_id, global_txid) FROM stdin;
\.


--
-- Data for Name: jbm_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jbm_user (user_id, passwd, clientid) FROM stdin;
dynsub	dynsub	\N
nobody	nobody	\N
john	needle	DurableSubscriberExample
j2ee	j2ee	\N
guest	guest	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (pk, fileset_iuid, fileset_id, media_rq_iuid, media_status, media_status_info, media_usage, created_time, updated_time) FROM stdin;
\.


--
-- Name: media_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_pk_seq', 1, false);


--
-- Data for Name: mpps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mpps (pk, patient_fk, drcode_fk, mpps_iuid, pps_start, station_aet, modality, accession_no, mpps_status, created_time, updated_time, mpps_attrs) FROM stdin;
\.


--
-- Name: mpps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mpps_pk_seq', 1, false);


--
-- Data for Name: mwl_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mwl_item (pk, patient_fk, sps_status, sps_id, start_datetime, station_aet, station_name, modality, perf_physician, perf_phys_fn_sx, perf_phys_gn_sx, perf_phys_i_name, perf_phys_p_name, req_proc_id, accession_no, study_iuid, created_time, updated_time, item_attrs) FROM stdin;
\.


--
-- Name: mwl_item_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mwl_item_pk_seq', 1, false);


--
-- Data for Name: other_pid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.other_pid (pk, pat_id, pat_id_issuer) FROM stdin;
\.


--
-- Name: other_pid_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.other_pid_pk_seq', 1, false);


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (pk, merge_fk, pat_id, pat_id_issuer, pat_name, pat_fn_sx, pat_gn_sx, pat_i_name, pat_p_name, pat_birthdate, pat_sex, pat_custom1, pat_custom2, pat_custom3, created_time, updated_time, pat_attrs) FROM stdin;
\.


--
-- Name: patient_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_pk_seq', 1, false);


--
-- Data for Name: priv_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priv_file (pk, instance_fk, filesystem_fk, filepath, file_tsuid, file_md5, file_size, file_status) FROM stdin;
\.


--
-- Name: priv_file_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priv_file_pk_seq', 1, false);


--
-- Data for Name: priv_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priv_instance (pk, series_fk, priv_type, sop_iuid, created_time, inst_attrs) FROM stdin;
\.


--
-- Name: priv_instance_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priv_instance_pk_seq', 1, false);


--
-- Data for Name: priv_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priv_patient (pk, priv_type, pat_id, pat_id_issuer, pat_name, pat_attrs) FROM stdin;
\.


--
-- Name: priv_patient_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priv_patient_pk_seq', 1, false);


--
-- Data for Name: priv_series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priv_series (pk, study_fk, priv_type, series_iuid, src_aet, series_attrs) FROM stdin;
\.


--
-- Name: priv_series_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priv_series_pk_seq', 1, false);


--
-- Data for Name: priv_study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priv_study (pk, patient_fk, priv_type, study_iuid, accession_no, study_attrs) FROM stdin;
\.


--
-- Name: priv_study_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priv_study_pk_seq', 1, false);


--
-- Data for Name: published_study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.published_study (pk, study_fk, created_time, updated_time, doc_uid, docentry_uid, repository_uid, status) FROM stdin;
\.


--
-- Name: published_study_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.published_study_pk_seq', 1, false);


--
-- Data for Name: rel_dev_proto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_dev_proto (device_fk, prcode_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_appcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_gpsps_appcode (gpsps_fk, appcode_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_devclass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_gpsps_devclass (gpsps_fk, devclass_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_devloc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_gpsps_devloc (gpsps_fk, devloc_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_devname; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_gpsps_devname (gpsps_fk, devname_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_gppps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_gpsps_gppps (gpsps_fk, gppps_fk) FROM stdin;
\.


--
-- Data for Name: rel_hpdef_proc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_hpdef_proc (hpdef_fk, proc_fk) FROM stdin;
\.


--
-- Data for Name: rel_hpdef_reason; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_hpdef_reason (hpdef_fk, reason_fk) FROM stdin;
\.


--
-- Data for Name: rel_hpdef_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_hpdef_region (hpdef_fk, region_fk) FROM stdin;
\.


--
-- Data for Name: rel_pat_other_pid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_pat_other_pid (patient_fk, other_pid_fk) FROM stdin;
\.


--
-- Data for Name: rel_study_pcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_study_pcode (study_fk, pcode_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_appcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_ups_appcode (ups_fk, appcode_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_devclass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_ups_devclass (ups_fk, devclass_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_devloc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_ups_devloc (ups_fk, devloc_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_devname; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_ups_devname (ups_fk, devname_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_performer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_ups_performer (ups_fk, performer_fk) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (user_id, roles) FROM stdin;
admin	JBossAdmin
admin	WebAdmin
admin	WebUser
admin	McmUser
admin	AuditLogUser
admin	Doctor
user	WebUser
user	McmUser
user	Doctor
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.series (pk, study_fk, mpps_fk, inst_code_fk, series_iuid, series_no, modality, body_part, laterality, series_desc, institution, station_name, department, perf_physician, perf_phys_fn_sx, perf_phys_gn_sx, perf_phys_i_name, perf_phys_p_name, pps_start, pps_iuid, series_custom1, series_custom2, series_custom3, num_instances, src_aet, ext_retr_aet, retrieve_aets, fileset_iuid, fileset_id, availability, series_status, created_time, updated_time, series_attrs) FROM stdin;
\.


--
-- Name: series_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.series_pk_seq', 1, false);


--
-- Data for Name: series_req; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.series_req (pk, series_fk, accno_issuer_fk, accession_no, study_iuid, req_proc_id, sps_id, req_service, req_physician, req_phys_fn_sx, req_phys_gn_sx, req_phys_i_name, req_phys_p_name) FROM stdin;
\.


--
-- Name: series_req_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.series_req_pk_seq', 1, false);


--
-- Data for Name: study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.study (pk, patient_fk, accno_issuer_fk, study_iuid, study_id, study_datetime, accession_no, ref_physician, ref_phys_fn_sx, ref_phys_gn_sx, ref_phys_i_name, ref_phys_p_name, study_desc, study_custom1, study_custom2, study_custom3, study_status_id, mods_in_study, cuids_in_study, num_series, num_instances, ext_retr_aet, retrieve_aets, fileset_iuid, fileset_id, availability, study_status, checked_time, created_time, updated_time, study_attrs) FROM stdin;
\.


--
-- Data for Name: study_on_fs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.study_on_fs (pk, study_fk, filesystem_fk, access_time, mark_to_delete) FROM stdin;
\.


--
-- Name: study_on_fs_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.study_on_fs_pk_seq', 1, false);


--
-- Data for Name: study_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.study_permission (pk, study_iuid, action, roles) FROM stdin;
\.


--
-- Name: study_permission_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.study_permission_pk_seq', 1, false);


--
-- Name: study_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.study_pk_seq', 1, false);


--
-- Data for Name: timers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timers (timerid, targetid, initialdate, timerinterval, instancepk, info) FROM stdin;
\.


--
-- Data for Name: ups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ups (pk, patient_fk, code_fk, ups_iuid, ups_tuid, adm_id, adm_id_issuer_id, adm_id_issuer_uid, ups_label, uwl_label, ups_start_time, ups_compl_time, ups_state, ups_prior, created_time, updated_time, ups_attrs) FROM stdin;
\.


--
-- Data for Name: ups_glob_subscr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ups_glob_subscr (pk, aet, deletion_lock) FROM stdin;
\.


--
-- Name: ups_glob_subscr_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ups_glob_subscr_pk_seq', 1, false);


--
-- Name: ups_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ups_pk_seq', 1, false);


--
-- Data for Name: ups_rel_ps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ups_rel_ps (pk, ups_fk, sop_iuid, sop_cuid) FROM stdin;
\.


--
-- Name: ups_rel_ps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ups_rel_ps_pk_seq', 1, false);


--
-- Data for Name: ups_repl_ps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ups_repl_ps (pk, ups_fk, sop_iuid, sop_cuid) FROM stdin;
\.


--
-- Name: ups_repl_ps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ups_repl_ps_pk_seq', 1, false);


--
-- Data for Name: ups_req; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ups_req (pk, ups_fk, req_proc_id, accession_no, confidentiality, req_service) FROM stdin;
\.


--
-- Name: ups_req_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ups_req_pk_seq', 1, false);


--
-- Data for Name: ups_subscr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ups_subscr (pk, ups_fk, aet, deletion_lock) FROM stdin;
\.


--
-- Name: ups_subscr_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ups_subscr_pk_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, passwd) FROM stdin;
admin	0DPiKuNIrrVmD8IUCuw1hQxNqZc=
user	Et6pb+wgWTVmq3VpLJlJWWgzrck=
\.


--
-- Data for Name: verify_observer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verify_observer (pk, instance_fk, verify_datetime, observer_name, observer_fn_sx, observer_gn_sx, observer_i_name, observer_p_name) FROM stdin;
\.


--
-- Name: verify_observer_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.verify_observer_pk_seq', 1, false);


--
-- Name: ae ae_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ae
    ADD CONSTRAINT ae_pk PRIMARY KEY (pk);


--
-- Name: code code_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.code
    ADD CONSTRAINT code_pk PRIMARY KEY (pk);


--
-- Name: content_item content_item_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_item
    ADD CONSTRAINT content_item_pk PRIMARY KEY (pk);


--
-- Name: device device_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pk PRIMARY KEY (pk);


--
-- Name: files files_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pk PRIMARY KEY (pk);


--
-- Name: filesystem filesystem_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filesystem
    ADD CONSTRAINT filesystem_pk PRIMARY KEY (pk);


--
-- Name: gppps gppps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gppps
    ADD CONSTRAINT gppps_pk PRIMARY KEY (pk);


--
-- Name: gpsps_perf gpsps_perf_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps_perf
    ADD CONSTRAINT gpsps_perf_pk PRIMARY KEY (pk);


--
-- Name: gpsps gpsps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps
    ADD CONSTRAINT gpsps_pk PRIMARY KEY (pk);


--
-- Name: gpsps_req gpsps_req_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps_req
    ADD CONSTRAINT gpsps_req_pk PRIMARY KEY (pk);


--
-- Name: hp hp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hp
    ADD CONSTRAINT hp_pk PRIMARY KEY (pk);


--
-- Name: hpdef hpdef_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hpdef
    ADD CONSTRAINT hpdef_pk PRIMARY KEY (pk);


--
-- Name: instance instance_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instance
    ADD CONSTRAINT instance_pk PRIMARY KEY (pk);


--
-- Name: issuer issuer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issuer
    ADD CONSTRAINT issuer_pk PRIMARY KEY (pk);


--
-- Name: jbm_counter jbm_counter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_counter
    ADD CONSTRAINT jbm_counter_pkey PRIMARY KEY (name);


--
-- Name: jbm_dual jbm_dual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_dual
    ADD CONSTRAINT jbm_dual_pkey PRIMARY KEY (dummy);


--
-- Name: jbm_id_cache jbm_id_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_id_cache
    ADD CONSTRAINT jbm_id_cache_pkey PRIMARY KEY (node_id, cntr);


--
-- Name: jbm_msg jbm_msg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_msg
    ADD CONSTRAINT jbm_msg_pkey PRIMARY KEY (message_id);


--
-- Name: jbm_msg_ref jbm_msg_ref_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_msg_ref
    ADD CONSTRAINT jbm_msg_ref_pkey PRIMARY KEY (message_id, channel_id);


--
-- Name: jbm_postoffice jbm_postoffice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_postoffice
    ADD CONSTRAINT jbm_postoffice_pkey PRIMARY KEY (postoffice_name, node_id, queue_name);


--
-- Name: jbm_role jbm_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_role
    ADD CONSTRAINT jbm_role_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: jbm_tx jbm_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_tx
    ADD CONSTRAINT jbm_tx_pkey PRIMARY KEY (transaction_id);


--
-- Name: jbm_user jbm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jbm_user
    ADD CONSTRAINT jbm_user_pkey PRIMARY KEY (user_id);


--
-- Name: media media_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pk PRIMARY KEY (pk);


--
-- Name: mpps mpps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mpps
    ADD CONSTRAINT mpps_pk PRIMARY KEY (pk);


--
-- Name: mwl_item mwl_item_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mwl_item
    ADD CONSTRAINT mwl_item_pk PRIMARY KEY (pk);


--
-- Name: other_pid other_pid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_pid
    ADD CONSTRAINT other_pid_pk PRIMARY KEY (pk);


--
-- Name: patient patient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pk PRIMARY KEY (pk);


--
-- Name: priv_file priv_file_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_file
    ADD CONSTRAINT priv_file_pk PRIMARY KEY (pk);


--
-- Name: priv_instance priv_instance_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_instance
    ADD CONSTRAINT priv_instance_pk PRIMARY KEY (pk);


--
-- Name: priv_patient priv_patient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_patient
    ADD CONSTRAINT priv_patient_pk PRIMARY KEY (pk);


--
-- Name: priv_series priv_series_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_series
    ADD CONSTRAINT priv_series_pk PRIMARY KEY (pk);


--
-- Name: priv_study priv_study_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_study
    ADD CONSTRAINT priv_study_pk PRIMARY KEY (pk);


--
-- Name: published_study published_study_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.published_study
    ADD CONSTRAINT published_study_pk PRIMARY KEY (pk);


--
-- Name: series series_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pk PRIMARY KEY (pk);


--
-- Name: series_req series_req_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_req
    ADD CONSTRAINT series_req_pk PRIMARY KEY (pk);


--
-- Name: study_on_fs study_on_fs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_on_fs
    ADD CONSTRAINT study_on_fs_pk PRIMARY KEY (pk);


--
-- Name: study_permission study_permission_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_permission
    ADD CONSTRAINT study_permission_pk PRIMARY KEY (pk);


--
-- Name: study study_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT study_pk PRIMARY KEY (pk);


--
-- Name: timers timers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timers
    ADD CONSTRAINT timers_pk PRIMARY KEY (timerid, targetid);


--
-- Name: ups_glob_subscr ups_glob_subscr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_glob_subscr
    ADD CONSTRAINT ups_glob_subscr_pk PRIMARY KEY (pk);


--
-- Name: ups ups_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups
    ADD CONSTRAINT ups_pk PRIMARY KEY (pk);


--
-- Name: ups_rel_ps ups_rel_ps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_rel_ps
    ADD CONSTRAINT ups_rel_ps_pk PRIMARY KEY (pk);


--
-- Name: ups_repl_ps ups_repl_ps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_repl_ps
    ADD CONSTRAINT ups_repl_ps_pk PRIMARY KEY (pk);


--
-- Name: ups_req ups_req_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_req
    ADD CONSTRAINT ups_req_pk PRIMARY KEY (pk);


--
-- Name: ups_subscr ups_subscr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_subscr
    ADD CONSTRAINT ups_subscr_pk PRIMARY KEY (pk);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_id);


--
-- Name: verify_observer verify_observer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verify_observer
    ADD CONSTRAINT verify_observer_pk PRIMARY KEY (pk);


--
-- Name: access_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX access_time ON public.study_on_fs USING btree (access_time);


--
-- Name: accession_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accession_no ON public.study USING btree (accession_no);


--
-- Name: accno_issuer_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accno_issuer_fk ON public.study USING btree (accno_issuer_fk);


--
-- Name: ae_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ae_group ON public.ae USING btree (ae_group);


--
-- Name: aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX aet ON public.ae USING btree (aet);


--
-- Name: appcode_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX appcode_gpsps_fk ON public.rel_gpsps_appcode USING btree (gpsps_fk);


--
-- Name: appcode_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX appcode_ups_fk ON public.rel_ups_appcode USING btree (ups_fk);


--
-- Name: body_part; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX body_part ON public.series USING btree (body_part);


--
-- Name: code_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX code_value ON public.code USING btree (code_value, code_designator, code_version);


--
-- Name: commitment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX commitment ON public.instance USING btree (commitment);


--
-- Name: content_datetime; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_datetime ON public.instance USING btree (content_datetime);


--
-- Name: content_item_code_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_item_code_fk ON public.content_item USING btree (code_fk);


--
-- Name: content_item_inst_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_item_inst_fk ON public.content_item USING btree (instance_fk);


--
-- Name: content_item_name_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_item_name_fk ON public.content_item USING btree (name_fk);


--
-- Name: content_item_rel_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_item_rel_type ON public.content_item USING btree (rel_type);


--
-- Name: content_item_text_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_item_text_value ON public.content_item USING btree (text_value);


--
-- Name: department; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX department ON public.series USING btree (department);


--
-- Name: dev_station_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dev_station_name ON public.device USING btree (station_name);


--
-- Name: devclass_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX devclass_gpsps_fk ON public.rel_gpsps_devclass USING btree (gpsps_fk);


--
-- Name: devclass_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX devclass_ups_fk ON public.rel_ups_devclass USING btree (ups_fk);


--
-- Name: device_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX device_fk ON public.rel_dev_proto USING btree (device_fk);


--
-- Name: devloc_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX devloc_gpsps_fk ON public.rel_gpsps_devloc USING btree (gpsps_fk);


--
-- Name: devloc_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX devloc_ups_fk ON public.rel_ups_devloc USING btree (ups_fk);


--
-- Name: devname_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX devname_gpsps_fk ON public.rel_gpsps_devname USING btree (gpsps_fk);


--
-- Name: devname_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX devname_ups_fk ON public.rel_ups_devname USING btree (ups_fk);


--
-- Name: entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX entity_id ON public.issuer USING btree (entity_id);


--
-- Name: entity_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX entity_uid ON public.issuer USING btree (entity_uid, entity_uid_type);


--
-- Name: ext_retr_aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ext_retr_aet ON public.instance USING btree (ext_retr_aet);


--
-- Name: file_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_created ON public.files USING btree (created_time);


--
-- Name: file_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_status ON public.files USING btree (file_status);


--
-- Name: file_tsuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_tsuid ON public.files USING btree (file_tsuid);


--
-- Name: filepath; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filepath ON public.files USING btree (filepath);


--
-- Name: fileset_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX fileset_iuid ON public.media USING btree (fileset_iuid);


--
-- Name: filesystem_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filesystem_fk ON public.files USING btree (filesystem_fk);


--
-- Name: fs_availability; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fs_availability ON public.filesystem USING btree (availability);


--
-- Name: fs_dirpath; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX fs_dirpath ON public.filesystem USING btree (dirpath);


--
-- Name: fs_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fs_group_id ON public.filesystem USING btree (fs_group_id);


--
-- Name: fs_next_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fs_next_fk ON public.filesystem USING btree (next_fk);


--
-- Name: fs_of_study; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fs_of_study ON public.study_on_fs USING btree (filesystem_fk);


--
-- Name: fs_retrieve_aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fs_retrieve_aet ON public.filesystem USING btree (retrieve_aet);


--
-- Name: fs_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fs_status ON public.filesystem USING btree (fs_status);


--
-- Name: gppps_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gppps_gpsps_fk ON public.rel_gpsps_gppps USING btree (gpsps_fk);


--
-- Name: gppps_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gppps_iuid ON public.gppps USING btree (pps_iuid);


--
-- Name: gppps_patient_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gppps_patient_fk ON public.gppps USING btree (patient_fk);


--
-- Name: gppps_pps_start; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gppps_pps_start ON public.gppps USING btree (pps_start);


--
-- Name: gpsps_appcode_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_appcode_fk ON public.rel_gpsps_appcode USING btree (appcode_fk);


--
-- Name: gpsps_code_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_code_fk ON public.gpsps USING btree (code_fk);


--
-- Name: gpsps_devclass_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_devclass_fk ON public.rel_gpsps_devclass USING btree (devclass_fk);


--
-- Name: gpsps_devloc_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_devloc_fk ON public.rel_gpsps_devloc USING btree (devloc_fk);


--
-- Name: gpsps_devname_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_devname_fk ON public.rel_gpsps_devname USING btree (devname_fk);


--
-- Name: gpsps_end_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_end_time ON public.gpsps USING btree (end_datetime);


--
-- Name: gpsps_gppps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_gppps_fk ON public.rel_gpsps_gppps USING btree (gppps_fk);


--
-- Name: gpsps_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gpsps_iuid ON public.gpsps USING btree (gpsps_iuid);


--
-- Name: gpsps_patient_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_patient_fk ON public.gpsps USING btree (patient_fk);


--
-- Name: gpsps_perf_code_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_perf_code_fk ON public.gpsps_perf USING btree (code_fk);


--
-- Name: gpsps_perf_fn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_perf_fn_sx ON public.gpsps_perf USING btree (hum_perf_fn_sx);


--
-- Name: gpsps_perf_gn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_perf_gn_sx ON public.gpsps_perf USING btree (hum_perf_gn_sx);


--
-- Name: gpsps_perf_i_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_perf_i_name ON public.gpsps_perf USING btree (hum_perf_i_name);


--
-- Name: gpsps_perf_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_perf_name ON public.gpsps_perf USING btree (human_perf_name);


--
-- Name: gpsps_perf_p_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_perf_p_name ON public.gpsps_perf USING btree (hum_perf_p_name);


--
-- Name: gpsps_perf_sps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_perf_sps_fk ON public.gpsps_perf USING btree (gpsps_fk);


--
-- Name: gpsps_prior; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_prior ON public.gpsps USING btree (gpsps_prior);


--
-- Name: gpsps_req_acc_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_req_acc_no ON public.gpsps_req USING btree (accession_no);


--
-- Name: gpsps_req_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_req_gpsps_fk ON public.gpsps_req USING btree (gpsps_fk);


--
-- Name: gpsps_req_proc_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_req_proc_id ON public.gpsps_req USING btree (req_proc_id);


--
-- Name: gpsps_start_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_start_time ON public.gpsps USING btree (start_datetime);


--
-- Name: gpsps_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_status ON public.gpsps USING btree (gpsps_status);


--
-- Name: gpsps_tuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gpsps_tuid ON public.gpsps USING btree (gpsps_tuid);


--
-- Name: hostname; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hostname ON public.ae USING btree (hostname);


--
-- Name: hp_cuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hp_cuid ON public.hp USING btree (hp_cuid);


--
-- Name: hp_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hp_fk ON public.hpdef USING btree (hp_fk);


--
-- Name: hp_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX hp_iuid ON public.hp USING btree (hp_iuid);


--
-- Name: hp_level; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hp_level ON public.hp USING btree (hp_level);


--
-- Name: hp_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hp_name ON public.hp USING btree (hp_name);


--
-- Name: hp_user_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hp_user_fk ON public.hp USING btree (user_fk);


--
-- Name: hpdef_laterality; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hpdef_laterality ON public.hpdef USING btree (laterality);


--
-- Name: hpdef_modality; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hpdef_modality ON public.hpdef USING btree (modality);


--
-- Name: hpdef_proc_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hpdef_proc_fk ON public.rel_hpdef_proc USING btree (proc_fk);


--
-- Name: hpdef_reason_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hpdef_reason_fk ON public.rel_hpdef_reason USING btree (reason_fk);


--
-- Name: hpdef_region_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hpdef_region_fk ON public.rel_hpdef_region USING btree (region_fk);


--
-- Name: i_study_on_fs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX i_study_on_fs ON public.study_on_fs USING btree (study_fk, filesystem_fk);


--
-- Name: in_availability; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX in_availability ON public.gpsps USING btree (in_availability);


--
-- Name: inst_archived; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inst_archived ON public.instance USING btree (archived);


--
-- Name: inst_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inst_created ON public.instance USING btree (created_time);


--
-- Name: inst_custom1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inst_custom1 ON public.instance USING btree (inst_custom1);


--
-- Name: inst_custom2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inst_custom2 ON public.instance USING btree (inst_custom2);


--
-- Name: inst_custom3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inst_custom3 ON public.instance USING btree (inst_custom3);


--
-- Name: inst_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inst_no ON public.instance USING btree (inst_no);


--
-- Name: instance_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX instance_fk ON public.files USING btree (instance_fk);


--
-- Name: instance_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX instance_status ON public.instance USING btree (inst_status);


--
-- Name: institution; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institution ON public.series USING btree (institution);


--
-- Name: jbm_msg_ref_tx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jbm_msg_ref_tx ON public.jbm_msg_ref USING btree (transaction_id, state);


--
-- Name: laterality; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX laterality ON public.series USING btree (laterality);


--
-- Name: mark_to_delete; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mark_to_delete ON public.study_on_fs USING btree (mark_to_delete);


--
-- Name: md5_check_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX md5_check_time ON public.files USING btree (md5_check_time);


--
-- Name: media_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_fk ON public.instance USING btree (media_fk);


--
-- Name: media_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_status ON public.media USING btree (media_status);


--
-- Name: modality; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX modality ON public.series USING btree (modality);


--
-- Name: mpps_accession_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mpps_accession_no ON public.mpps USING btree (accession_no);


--
-- Name: mpps_drcode_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mpps_drcode_fk ON public.mpps USING btree (drcode_fk);


--
-- Name: mpps_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX mpps_iuid ON public.mpps USING btree (mpps_iuid);


--
-- Name: mpps_modality; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mpps_modality ON public.mpps USING btree (modality);


--
-- Name: mpps_patient_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mpps_patient_fk ON public.mpps USING btree (patient_fk);


--
-- Name: mpps_pps_start; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mpps_pps_start ON public.mpps USING btree (pps_start);


--
-- Name: mpps_station_aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mpps_station_aet ON public.mpps USING btree (station_aet);


--
-- Name: mwl_accession_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_accession_no ON public.mwl_item USING btree (accession_no);


--
-- Name: mwl_modality; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_modality ON public.mwl_item USING btree (modality);


--
-- Name: mwl_patient_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_patient_fk ON public.mwl_item USING btree (patient_fk);


--
-- Name: mwl_perf_phys_fn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_perf_phys_fn_sx ON public.mwl_item USING btree (perf_phys_fn_sx);


--
-- Name: mwl_perf_phys_gn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_perf_phys_gn_sx ON public.mwl_item USING btree (perf_phys_gn_sx);


--
-- Name: mwl_perf_phys_i_nm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_perf_phys_i_nm ON public.mwl_item USING btree (perf_phys_i_name);


--
-- Name: mwl_perf_phys_p_nm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_perf_phys_p_nm ON public.mwl_item USING btree (perf_phys_p_name);


--
-- Name: mwl_perf_physician; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_perf_physician ON public.mwl_item USING btree (perf_physician);


--
-- Name: mwl_req_proc_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_req_proc_id ON public.mwl_item USING btree (req_proc_id);


--
-- Name: mwl_sps_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX mwl_sps_id ON public.mwl_item USING btree (sps_id, req_proc_id);


--
-- Name: mwl_start_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_start_time ON public.mwl_item USING btree (start_datetime);


--
-- Name: mwl_station_aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_station_aet ON public.mwl_item USING btree (station_aet);


--
-- Name: mwl_station_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_station_name ON public.mwl_item USING btree (station_name);


--
-- Name: mwl_study_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mwl_study_iuid ON public.mwl_item USING btree (study_iuid);


--
-- Name: num_priors; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX num_priors ON public.hp USING btree (num_priors);


--
-- Name: num_screens; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX num_screens ON public.hp USING btree (num_screens);


--
-- Name: observer_fn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX observer_fn_sx ON public.verify_observer USING btree (observer_fn_sx);


--
-- Name: observer_gn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX observer_gn_sx ON public.verify_observer USING btree (observer_gn_sx);


--
-- Name: observer_i_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX observer_i_name ON public.verify_observer USING btree (observer_i_name);


--
-- Name: observer_inst_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX observer_inst_fk ON public.verify_observer USING btree (instance_fk);


--
-- Name: observer_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX observer_name ON public.verify_observer USING btree (observer_name);


--
-- Name: observer_p_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX observer_p_name ON public.verify_observer USING btree (observer_p_name);


--
-- Name: other_pat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX other_pat_id ON public.other_pid USING btree (pat_id, pat_id_issuer);


--
-- Name: other_pid_pat_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX other_pid_pat_fk ON public.rel_pat_other_pid USING btree (patient_fk);


--
-- Name: pat_birthdate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_birthdate ON public.patient USING btree (pat_birthdate);


--
-- Name: pat_custom1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_custom1 ON public.patient USING btree (pat_custom1);


--
-- Name: pat_custom2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_custom2 ON public.patient USING btree (pat_custom2);


--
-- Name: pat_custom3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_custom3 ON public.patient USING btree (pat_custom3);


--
-- Name: pat_fn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_fn_sx ON public.patient USING btree (pat_fn_sx);


--
-- Name: pat_gn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_gn_sx ON public.patient USING btree (pat_gn_sx);


--
-- Name: pat_i_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_i_name ON public.patient USING btree (pat_i_name);


--
-- Name: pat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_id ON public.patient USING btree (pat_id, pat_id_issuer);


--
-- Name: pat_merge_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_merge_fk ON public.patient USING btree (merge_fk);


--
-- Name: pat_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_name ON public.patient USING btree (pat_name);


--
-- Name: pat_other_pid_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_other_pid_fk ON public.rel_pat_other_pid USING btree (other_pid_fk);


--
-- Name: pat_p_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_p_name ON public.patient USING btree (pat_p_name);


--
-- Name: pat_sex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pat_sex ON public.patient USING btree (pat_sex);


--
-- Name: patient_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patient_fk ON public.study USING btree (patient_fk);


--
-- Name: pcode_study_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pcode_study_fk ON public.rel_study_pcode USING btree (study_fk);


--
-- Name: perf_phys_fn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perf_phys_fn_sx ON public.series USING btree (perf_phys_fn_sx);


--
-- Name: perf_phys_gn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perf_phys_gn_sx ON public.series USING btree (perf_phys_gn_sx);


--
-- Name: perf_phys_i_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perf_phys_i_name ON public.series USING btree (perf_phys_i_name);


--
-- Name: perf_phys_p_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perf_phys_p_name ON public.series USING btree (perf_phys_p_name);


--
-- Name: perf_physician; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perf_physician ON public.series USING btree (perf_physician);


--
-- Name: performer_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX performer_ups_fk ON public.rel_ups_performer USING btree (ups_fk);


--
-- Name: prcode_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX prcode_fk ON public.rel_dev_proto USING btree (prcode_fk);


--
-- Name: priv_fs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_fs_fk ON public.priv_file USING btree (filesystem_fk);


--
-- Name: priv_inst_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_inst_created ON public.priv_instance USING btree (created_time);


--
-- Name: priv_inst_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_inst_type ON public.priv_instance USING btree (priv_type);


--
-- Name: priv_instance_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_instance_fk ON public.priv_file USING btree (instance_fk);


--
-- Name: priv_pat_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_pat_id ON public.patient USING btree (pat_id, pat_id_issuer);


--
-- Name: priv_pat_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_pat_type ON public.priv_patient USING btree (priv_type);


--
-- Name: priv_patient_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_patient_fk ON public.priv_study USING btree (patient_fk);


--
-- Name: priv_patient_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_patient_name ON public.priv_patient USING btree (pat_name);


--
-- Name: priv_ser_src_aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_ser_src_aet ON public.priv_series USING btree (src_aet);


--
-- Name: priv_series_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_series_fk ON public.priv_instance USING btree (series_fk);


--
-- Name: priv_series_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_series_iuid ON public.priv_series USING btree (series_iuid);


--
-- Name: priv_series_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_series_type ON public.priv_series USING btree (priv_type);


--
-- Name: priv_sop_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_sop_iuid ON public.priv_instance USING btree (sop_iuid);


--
-- Name: priv_study_accs_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_study_accs_no ON public.priv_study USING btree (accession_no);


--
-- Name: priv_study_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_study_fk ON public.priv_series USING btree (study_fk);


--
-- Name: priv_study_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_study_iuid ON public.priv_study USING btree (study_iuid);


--
-- Name: priv_study_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX priv_study_type ON public.priv_study USING btree (priv_type);


--
-- Name: proc_hpdef_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX proc_hpdef_fk ON public.rel_hpdef_proc USING btree (hpdef_fk);


--
-- Name: published_study_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX published_study_status ON public.published_study USING btree (status);


--
-- Name: reason_hpdef_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reason_hpdef_fk ON public.rel_hpdef_reason USING btree (hpdef_fk);


--
-- Name: ref_phys_fn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ref_phys_fn_sx ON public.study USING btree (ref_phys_fn_sx);


--
-- Name: ref_phys_gn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ref_phys_gn_sx ON public.study USING btree (ref_phys_gn_sx);


--
-- Name: ref_phys_i_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ref_phys_i_name ON public.study USING btree (ref_phys_i_name);


--
-- Name: ref_phys_p_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ref_phys_p_name ON public.study USING btree (ref_phys_p_name);


--
-- Name: ref_physician; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ref_physician ON public.study USING btree (ref_physician);


--
-- Name: region_hpdef_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX region_hpdef_fk ON public.rel_hpdef_region USING btree (hpdef_fk);


--
-- Name: repository_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repository_uid ON public.published_study USING btree (repository_uid);


--
-- Name: ser_req_phys; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_phys ON public.series_req USING btree (req_physician);


--
-- Name: ser_req_phys_fn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_phys_fn_sx ON public.series_req USING btree (req_phys_fn_sx);


--
-- Name: ser_req_phys_gn_sx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_phys_gn_sx ON public.series_req USING btree (req_phys_gn_sx);


--
-- Name: ser_req_phys_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_phys_i ON public.series_req USING btree (req_phys_i_name);


--
-- Name: ser_req_phys_p; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_phys_p ON public.series_req USING btree (req_phys_p_name);


--
-- Name: ser_req_proc_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_proc_id ON public.series_req USING btree (req_proc_id);


--
-- Name: ser_req_series_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_series_fk ON public.series_req USING btree (series_fk);


--
-- Name: ser_req_service; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_service ON public.series_req USING btree (req_service);


--
-- Name: ser_req_sps_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_sps_id ON public.series_req USING btree (sps_id);


--
-- Name: ser_req_study_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ser_req_study_iuid ON public.series_req USING btree (study_iuid);


--
-- Name: series_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_created ON public.series USING btree (created_time);


--
-- Name: series_custom1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_custom1 ON public.series USING btree (series_custom1);


--
-- Name: series_custom2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_custom2 ON public.series USING btree (series_custom2);


--
-- Name: series_custom3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_custom3 ON public.series USING btree (series_custom3);


--
-- Name: series_desc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_desc ON public.series USING btree (series_desc);


--
-- Name: series_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_fk ON public.instance USING btree (series_fk);


--
-- Name: series_inst_code_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_inst_code_fk ON public.series USING btree (inst_code_fk);


--
-- Name: series_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX series_iuid ON public.series USING btree (series_iuid);


--
-- Name: series_mpps_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_mpps_fk ON public.series USING btree (mpps_fk);


--
-- Name: series_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_no ON public.series USING btree (series_no);


--
-- Name: series_pps_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_pps_iuid ON public.series USING btree (pps_iuid);


--
-- Name: series_pps_start; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_pps_start ON public.series USING btree (pps_start);


--
-- Name: series_src_aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_src_aet ON public.series USING btree (src_aet);


--
-- Name: series_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_status ON public.series USING btree (series_status);


--
-- Name: series_updated; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX series_updated ON public.series USING btree (updated_time);


--
-- Name: sop_cuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sop_cuid ON public.instance USING btree (sop_cuid);


--
-- Name: sop_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX sop_iuid ON public.instance USING btree (sop_iuid);


--
-- Name: sps_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sps_status ON public.mwl_item USING btree (sps_status);


--
-- Name: sr_complete; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sr_complete ON public.instance USING btree (sr_complete);


--
-- Name: sr_verified; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sr_verified ON public.instance USING btree (sr_verified);


--
-- Name: srcode_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX srcode_fk ON public.instance USING btree (srcode_fk);


--
-- Name: station_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX station_name ON public.series USING btree (station_name);


--
-- Name: study_checked; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_checked ON public.study USING btree (checked_time);


--
-- Name: study_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_created ON public.study USING btree (created_time);


--
-- Name: study_custom1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_custom1 ON public.study USING btree (study_custom1);


--
-- Name: study_custom2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_custom2 ON public.study USING btree (study_custom2);


--
-- Name: study_custom3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_custom3 ON public.study USING btree (study_custom3);


--
-- Name: study_datetime; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_datetime ON public.study USING btree (study_datetime);


--
-- Name: study_desc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_desc ON public.study USING btree (study_desc);


--
-- Name: study_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_fk ON public.series USING btree (study_fk);


--
-- Name: study_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_id ON public.study USING btree (study_id);


--
-- Name: study_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX study_iuid ON public.study USING btree (study_iuid);


--
-- Name: study_pcode_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_pcode_fk ON public.rel_study_pcode USING btree (pcode_fk);


--
-- Name: study_perm_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX study_perm_idx ON public.study_permission USING btree (study_iuid, action, roles);


--
-- Name: study_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_status ON public.study USING btree (study_status);


--
-- Name: study_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_status_id ON public.study USING btree (study_status_id);


--
-- Name: study_updated; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX study_updated ON public.study USING btree (updated_time);


--
-- Name: ups_adm_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_adm_id ON public.ups USING btree (adm_id);


--
-- Name: ups_adm_id_issuer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_adm_id_issuer_id ON public.ups USING btree (adm_id_issuer_id);


--
-- Name: ups_adm_id_issuer_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_adm_id_issuer_uid ON public.ups USING btree (adm_id_issuer_uid);


--
-- Name: ups_appcode_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_appcode_fk ON public.rel_ups_appcode USING btree (appcode_fk);


--
-- Name: ups_code_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_code_fk ON public.ups USING btree (code_fk);


--
-- Name: ups_compl_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_compl_time ON public.ups USING btree (ups_compl_time);


--
-- Name: ups_confidentiality; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_confidentiality ON public.ups_req USING btree (confidentiality);


--
-- Name: ups_deletion_lock; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_deletion_lock ON public.ups_subscr USING btree (deletion_lock);


--
-- Name: ups_devclass_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_devclass_fk ON public.rel_ups_devclass USING btree (devclass_fk);


--
-- Name: ups_devloc_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_devloc_fk ON public.rel_ups_devloc USING btree (devloc_fk);


--
-- Name: ups_devname_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_devname_fk ON public.rel_ups_devname USING btree (devname_fk);


--
-- Name: ups_glob_subscr_aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ups_glob_subscr_aet ON public.ups_glob_subscr USING btree (aet);


--
-- Name: ups_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ups_iuid ON public.ups USING btree (ups_iuid);


--
-- Name: ups_label; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_label ON public.ups USING btree (ups_label);


--
-- Name: ups_patient_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_patient_fk ON public.ups USING btree (patient_fk);


--
-- Name: ups_performer_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_performer_fk ON public.rel_ups_performer USING btree (performer_fk);


--
-- Name: ups_prior; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_prior ON public.ups USING btree (ups_prior);


--
-- Name: ups_rel_ps_cuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_rel_ps_cuid ON public.ups_rel_ps USING btree (sop_cuid);


--
-- Name: ups_rel_ps_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_rel_ps_iuid ON public.ups_rel_ps USING btree (sop_iuid);


--
-- Name: ups_rel_ps_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_rel_ps_ups_fk ON public.ups_rel_ps USING btree (ups_fk);


--
-- Name: ups_repl_ps_cuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_repl_ps_cuid ON public.ups_repl_ps USING btree (sop_cuid);


--
-- Name: ups_repl_ps_iuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_repl_ps_iuid ON public.ups_repl_ps USING btree (sop_iuid);


--
-- Name: ups_repl_ps_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_repl_ps_ups_fk ON public.ups_repl_ps USING btree (ups_fk);


--
-- Name: ups_req_acc_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_req_acc_no ON public.ups_req USING btree (accession_no);


--
-- Name: ups_req_proc_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_req_proc_id ON public.ups_req USING btree (req_proc_id);


--
-- Name: ups_req_service; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_req_service ON public.ups_req USING btree (req_service);


--
-- Name: ups_req_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_req_ups_fk ON public.ups_req USING btree (ups_fk);


--
-- Name: ups_start_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_start_time ON public.ups USING btree (ups_start_time);


--
-- Name: ups_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_state ON public.ups USING btree (ups_state);


--
-- Name: ups_subscr_aet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_subscr_aet ON public.ups_subscr USING btree (aet);


--
-- Name: ups_subscr_ups_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_subscr_ups_fk ON public.ups_subscr USING btree (ups_fk);


--
-- Name: ups_tuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_tuid ON public.ups USING btree (ups_tuid);


--
-- Name: ups_updated_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ups_updated_time ON public.ups USING btree (updated_time);


--
-- Name: user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_id ON public.roles USING btree (user_id);


--
-- Name: uwl_label; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX uwl_label ON public.ups USING btree (uwl_label);


--
-- Name: verify_datetime; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX verify_datetime ON public.verify_observer USING btree (verify_datetime);


--
-- Name: content_item content_item_code_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_item
    ADD CONSTRAINT content_item_code_fk_fkey FOREIGN KEY (code_fk) REFERENCES public.code(pk);


--
-- Name: content_item content_item_instance_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_item
    ADD CONSTRAINT content_item_instance_fk_fkey FOREIGN KEY (instance_fk) REFERENCES public.instance(pk);


--
-- Name: content_item content_item_name_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_item
    ADD CONSTRAINT content_item_name_fk_fkey FOREIGN KEY (name_fk) REFERENCES public.code(pk);


--
-- Name: files files_filesystem_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_filesystem_fk_fkey FOREIGN KEY (filesystem_fk) REFERENCES public.filesystem(pk);


--
-- Name: files files_instance_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_instance_fk_fkey FOREIGN KEY (instance_fk) REFERENCES public.instance(pk);


--
-- Name: filesystem filesystem_next_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filesystem
    ADD CONSTRAINT filesystem_next_fk_fkey FOREIGN KEY (next_fk) REFERENCES public.filesystem(pk);


--
-- Name: gppps gppps_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gppps
    ADD CONSTRAINT gppps_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES public.patient(pk);


--
-- Name: gpsps gpsps_code_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps
    ADD CONSTRAINT gpsps_code_fk_fkey FOREIGN KEY (code_fk) REFERENCES public.code(pk);


--
-- Name: gpsps gpsps_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps
    ADD CONSTRAINT gpsps_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES public.patient(pk);


--
-- Name: gpsps_perf gpsps_perf_code_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps_perf
    ADD CONSTRAINT gpsps_perf_code_fk_fkey FOREIGN KEY (code_fk) REFERENCES public.code(pk);


--
-- Name: gpsps_perf gpsps_perf_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps_perf
    ADD CONSTRAINT gpsps_perf_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES public.gpsps(pk);


--
-- Name: gpsps_req gpsps_req_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gpsps_req
    ADD CONSTRAINT gpsps_req_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES public.gpsps(pk);


--
-- Name: hp hp_user_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hp
    ADD CONSTRAINT hp_user_fk_fkey FOREIGN KEY (user_fk) REFERENCES public.code(pk);


--
-- Name: hpdef hpdef_hp_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hpdef
    ADD CONSTRAINT hpdef_hp_fk_fkey FOREIGN KEY (hp_fk) REFERENCES public.hp(pk);


--
-- Name: instance instance_media_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instance
    ADD CONSTRAINT instance_media_fk_fkey FOREIGN KEY (media_fk) REFERENCES public.media(pk);


--
-- Name: instance instance_series_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instance
    ADD CONSTRAINT instance_series_fk_fkey FOREIGN KEY (series_fk) REFERENCES public.series(pk);


--
-- Name: instance instance_srcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instance
    ADD CONSTRAINT instance_srcode_fk_fkey FOREIGN KEY (srcode_fk) REFERENCES public.code(pk);


--
-- Name: mpps mpps_drcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mpps
    ADD CONSTRAINT mpps_drcode_fk_fkey FOREIGN KEY (drcode_fk) REFERENCES public.code(pk);


--
-- Name: mpps mpps_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mpps
    ADD CONSTRAINT mpps_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES public.patient(pk);


--
-- Name: mwl_item mwl_item_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mwl_item
    ADD CONSTRAINT mwl_item_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES public.patient(pk);


--
-- Name: patient patient_merge_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_merge_fk_fkey FOREIGN KEY (merge_fk) REFERENCES public.patient(pk);


--
-- Name: priv_file priv_file_filesystem_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_file
    ADD CONSTRAINT priv_file_filesystem_fk_fkey FOREIGN KEY (filesystem_fk) REFERENCES public.filesystem(pk);


--
-- Name: priv_file priv_file_instance_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_file
    ADD CONSTRAINT priv_file_instance_fk_fkey FOREIGN KEY (instance_fk) REFERENCES public.priv_instance(pk);


--
-- Name: priv_instance priv_instance_series_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_instance
    ADD CONSTRAINT priv_instance_series_fk_fkey FOREIGN KEY (series_fk) REFERENCES public.priv_series(pk);


--
-- Name: priv_series priv_series_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_series
    ADD CONSTRAINT priv_series_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES public.priv_study(pk);


--
-- Name: priv_study priv_study_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priv_study
    ADD CONSTRAINT priv_study_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES public.priv_patient(pk);


--
-- Name: published_study published_study_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.published_study
    ADD CONSTRAINT published_study_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES public.study(pk);


--
-- Name: rel_dev_proto rel_dev_proto_device_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_dev_proto
    ADD CONSTRAINT rel_dev_proto_device_fk_fkey FOREIGN KEY (device_fk) REFERENCES public.device(pk);


--
-- Name: rel_dev_proto rel_dev_proto_prcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_dev_proto
    ADD CONSTRAINT rel_dev_proto_prcode_fk_fkey FOREIGN KEY (prcode_fk) REFERENCES public.code(pk);


--
-- Name: rel_gpsps_appcode rel_gpsps_appcode_appcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_appcode
    ADD CONSTRAINT rel_gpsps_appcode_appcode_fk_fkey FOREIGN KEY (appcode_fk) REFERENCES public.code(pk);


--
-- Name: rel_gpsps_appcode rel_gpsps_appcode_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_appcode
    ADD CONSTRAINT rel_gpsps_appcode_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES public.gpsps(pk);


--
-- Name: rel_gpsps_devclass rel_gpsps_devclass_devclass_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_devclass
    ADD CONSTRAINT rel_gpsps_devclass_devclass_fk_fkey FOREIGN KEY (devclass_fk) REFERENCES public.code(pk);


--
-- Name: rel_gpsps_devclass rel_gpsps_devclass_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_devclass
    ADD CONSTRAINT rel_gpsps_devclass_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES public.gpsps(pk);


--
-- Name: rel_gpsps_devloc rel_gpsps_devloc_devloc_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_devloc
    ADD CONSTRAINT rel_gpsps_devloc_devloc_fk_fkey FOREIGN KEY (devloc_fk) REFERENCES public.code(pk);


--
-- Name: rel_gpsps_devloc rel_gpsps_devloc_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_devloc
    ADD CONSTRAINT rel_gpsps_devloc_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES public.gpsps(pk);


--
-- Name: rel_gpsps_devname rel_gpsps_devname_devname_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_devname
    ADD CONSTRAINT rel_gpsps_devname_devname_fk_fkey FOREIGN KEY (devname_fk) REFERENCES public.code(pk);


--
-- Name: rel_gpsps_devname rel_gpsps_devname_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_devname
    ADD CONSTRAINT rel_gpsps_devname_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES public.gpsps(pk);


--
-- Name: rel_gpsps_gppps rel_gpsps_gppps_gppps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_gppps
    ADD CONSTRAINT rel_gpsps_gppps_gppps_fk_fkey FOREIGN KEY (gppps_fk) REFERENCES public.gppps(pk);


--
-- Name: rel_gpsps_gppps rel_gpsps_gppps_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_gpsps_gppps
    ADD CONSTRAINT rel_gpsps_gppps_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES public.gpsps(pk);


--
-- Name: rel_hpdef_proc rel_hpdef_proc_hpdef_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_hpdef_proc
    ADD CONSTRAINT rel_hpdef_proc_hpdef_fk_fkey FOREIGN KEY (hpdef_fk) REFERENCES public.hpdef(pk);


--
-- Name: rel_hpdef_proc rel_hpdef_proc_proc_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_hpdef_proc
    ADD CONSTRAINT rel_hpdef_proc_proc_fk_fkey FOREIGN KEY (proc_fk) REFERENCES public.code(pk);


--
-- Name: rel_hpdef_reason rel_hpdef_reason_hpdef_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_hpdef_reason
    ADD CONSTRAINT rel_hpdef_reason_hpdef_fk_fkey FOREIGN KEY (hpdef_fk) REFERENCES public.hpdef(pk);


--
-- Name: rel_hpdef_reason rel_hpdef_reason_reason_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_hpdef_reason
    ADD CONSTRAINT rel_hpdef_reason_reason_fk_fkey FOREIGN KEY (reason_fk) REFERENCES public.code(pk);


--
-- Name: rel_hpdef_region rel_hpdef_region_hpdef_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_hpdef_region
    ADD CONSTRAINT rel_hpdef_region_hpdef_fk_fkey FOREIGN KEY (hpdef_fk) REFERENCES public.hpdef(pk);


--
-- Name: rel_hpdef_region rel_hpdef_region_region_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_hpdef_region
    ADD CONSTRAINT rel_hpdef_region_region_fk_fkey FOREIGN KEY (region_fk) REFERENCES public.code(pk);


--
-- Name: rel_pat_other_pid rel_pat_other_pid_other_pid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_pat_other_pid
    ADD CONSTRAINT rel_pat_other_pid_other_pid_fk_fkey FOREIGN KEY (other_pid_fk) REFERENCES public.other_pid(pk);


--
-- Name: rel_pat_other_pid rel_pat_other_pid_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_pat_other_pid
    ADD CONSTRAINT rel_pat_other_pid_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES public.patient(pk);


--
-- Name: rel_study_pcode rel_study_pcode_pcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_study_pcode
    ADD CONSTRAINT rel_study_pcode_pcode_fk_fkey FOREIGN KEY (pcode_fk) REFERENCES public.code(pk);


--
-- Name: rel_study_pcode rel_study_pcode_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_study_pcode
    ADD CONSTRAINT rel_study_pcode_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES public.study(pk);


--
-- Name: rel_ups_appcode rel_ups_appcode_appcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_appcode
    ADD CONSTRAINT rel_ups_appcode_appcode_fk_fkey FOREIGN KEY (appcode_fk) REFERENCES public.code(pk);


--
-- Name: rel_ups_appcode rel_ups_appcode_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_appcode
    ADD CONSTRAINT rel_ups_appcode_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: rel_ups_devclass rel_ups_devclass_devclass_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_devclass
    ADD CONSTRAINT rel_ups_devclass_devclass_fk_fkey FOREIGN KEY (devclass_fk) REFERENCES public.code(pk);


--
-- Name: rel_ups_devclass rel_ups_devclass_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_devclass
    ADD CONSTRAINT rel_ups_devclass_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: rel_ups_devloc rel_ups_devloc_devloc_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_devloc
    ADD CONSTRAINT rel_ups_devloc_devloc_fk_fkey FOREIGN KEY (devloc_fk) REFERENCES public.code(pk);


--
-- Name: rel_ups_devloc rel_ups_devloc_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_devloc
    ADD CONSTRAINT rel_ups_devloc_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: rel_ups_devname rel_ups_devname_devname_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_devname
    ADD CONSTRAINT rel_ups_devname_devname_fk_fkey FOREIGN KEY (devname_fk) REFERENCES public.code(pk);


--
-- Name: rel_ups_devname rel_ups_devname_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_devname
    ADD CONSTRAINT rel_ups_devname_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: rel_ups_performer rel_ups_performer_performer_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_performer
    ADD CONSTRAINT rel_ups_performer_performer_fk_fkey FOREIGN KEY (performer_fk) REFERENCES public.code(pk);


--
-- Name: rel_ups_performer rel_ups_performer_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_ups_performer
    ADD CONSTRAINT rel_ups_performer_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: roles roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: series series_inst_code_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_inst_code_fk_fkey FOREIGN KEY (inst_code_fk) REFERENCES public.code(pk);


--
-- Name: series series_mpps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_mpps_fk_fkey FOREIGN KEY (mpps_fk) REFERENCES public.mpps(pk);


--
-- Name: series_req series_req_accno_issuer_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_req
    ADD CONSTRAINT series_req_accno_issuer_fk_fkey FOREIGN KEY (accno_issuer_fk) REFERENCES public.issuer(pk);


--
-- Name: series_req series_req_series_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series_req
    ADD CONSTRAINT series_req_series_fk_fkey FOREIGN KEY (series_fk) REFERENCES public.series(pk);


--
-- Name: series series_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES public.study(pk);


--
-- Name: study study_accno_issuer_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT study_accno_issuer_fk_fkey FOREIGN KEY (accno_issuer_fk) REFERENCES public.issuer(pk);


--
-- Name: study_on_fs study_on_fs_filesystem_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_on_fs
    ADD CONSTRAINT study_on_fs_filesystem_fk_fkey FOREIGN KEY (filesystem_fk) REFERENCES public.filesystem(pk);


--
-- Name: study_on_fs study_on_fs_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_on_fs
    ADD CONSTRAINT study_on_fs_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES public.study(pk);


--
-- Name: study study_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT study_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES public.patient(pk);


--
-- Name: ups ups_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups
    ADD CONSTRAINT ups_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES public.patient(pk);


--
-- Name: ups_rel_ps ups_rel_ps_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_rel_ps
    ADD CONSTRAINT ups_rel_ps_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: ups_repl_ps ups_repl_ps_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_repl_ps
    ADD CONSTRAINT ups_repl_ps_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: ups_req ups_req_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_req
    ADD CONSTRAINT ups_req_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: ups_subscr ups_subscr_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ups_subscr
    ADD CONSTRAINT ups_subscr_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES public.ups(pk);


--
-- Name: verify_observer verify_observer_instance_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verify_observer
    ADD CONSTRAINT verify_observer_instance_fk_fkey FOREIGN KEY (instance_fk) REFERENCES public.instance(pk);


--
-- PostgreSQL database dump complete
--

