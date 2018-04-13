--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
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
-- Name: albaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albaran (
    id bigint NOT NULL,
    codigo character varying(255),
    fecha_albaran date,
    observaciones character varying(255),
    envio_id bigint
);


ALTER TABLE public.albaran OWNER TO postgres;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    activo boolean,
    nombre character varying(255),
    codigo character varying(255),
    cif character varying(255),
    observaciones character varying(255),
    contacto_id bigint,
    direccion_facturacion_id bigint,
    direccion_envio_id bigint
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacto (
    id bigint NOT NULL,
    tipo_contacto character varying(255),
    activo boolean,
    nombre character varying(255),
    telefono character varying(255),
    email character varying(255),
    observaciones character varying(255)
);


ALTER TABLE public.contacto OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: direccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direccion (
    id bigint NOT NULL,
    tipo_direccion character varying(255),
    activo boolean,
    nombre character varying(255),
    direccion character varying(255),
    cp character varying(255),
    observaciones character varying(255)
);


ALTER TABLE public.direccion OWNER TO postgres;

--
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrada (
    id bigint NOT NULL,
    fecha_entrada date,
    peso_bruto integer,
    bultos integer,
    peso_neto integer,
    observaciones character varying(255),
    lote_id bigint
);


ALTER TABLE public.entrada OWNER TO postgres;

--
-- Name: envio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.envio (
    id bigint NOT NULL,
    codigo character varying(255),
    tipo_ecologico character varying(255),
    estado character varying(255),
    fecha_hora_solicitud timestamp without time zone,
    fecha_hora_enviado timestamp without time zone,
    fecha_hora_recibido timestamp without time zone,
    observaciones character varying(255),
    cliente_id bigint,
    pedido_id bigint,
    transportista_id bigint,
    contacto_id bigint,
    direccion_envio_id bigint
);


ALTER TABLE public.envio OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1000
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: historico_palet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_palet (
    id bigint NOT NULL,
    fecha_hora timestamp without time zone,
    estado_palet character varying(255),
    observaciones character varying(255),
    palet_id bigint
);


ALTER TABLE public.historico_palet OWNER TO postgres;

--
-- Name: historico_partida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_partida (
    id bigint NOT NULL,
    fecha_hora timestamp without time zone,
    estado_partida character varying(255),
    observaciones character varying(255),
    partida_id bigint
);


ALTER TABLE public.historico_partida OWNER TO postgres;

--
-- Name: jhi_authority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_authority (
    name character varying(50) NOT NULL
);


ALTER TABLE public.jhi_authority OWNER TO postgres;

--
-- Name: jhi_persistent_audit_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_persistent_audit_event (
    event_id bigint NOT NULL,
    principal character varying(50) NOT NULL,
    event_date timestamp without time zone,
    event_type character varying(255)
);


ALTER TABLE public.jhi_persistent_audit_event OWNER TO postgres;

--
-- Name: jhi_persistent_audit_evt_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_persistent_audit_evt_data (
    event_id bigint NOT NULL,
    name character varying(150) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.jhi_persistent_audit_evt_data OWNER TO postgres;

--
-- Name: jhi_persistent_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_persistent_token (
    series character varying(20) NOT NULL,
    user_id bigint,
    token_value character varying(20) NOT NULL,
    token_date date,
    ip_address character varying(39),
    user_agent character varying(255)
);


ALTER TABLE public.jhi_persistent_token OWNER TO postgres;

--
-- Name: jhi_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_user (
    id bigint NOT NULL,
    login character varying(50) NOT NULL,
    password_hash character varying(60),
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    image_url character varying(256),
    activated boolean NOT NULL,
    lang_key character varying(6),
    activation_key character varying(20),
    reset_key character varying(20),
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    reset_date timestamp without time zone,
    last_modified_by character varying(50),
    last_modified_date timestamp without time zone
);


ALTER TABLE public.jhi_user OWNER TO postgres;

--
-- Name: jhi_user_authority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_user_authority (
    user_id bigint NOT NULL,
    authority_name character varying(50) NOT NULL
);


ALTER TABLE public.jhi_user_authority OWNER TO postgres;

--
-- Name: lote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lote (
    id bigint NOT NULL,
    codigo character varying(255),
    fecha_recogida date,
    tipo_ecologico character varying(255),
    observaciones character varying(255),
    socio_id bigint,
    variedad_id bigint
);


ALTER TABLE public.lote OWNER TO postgres;

--
-- Name: palet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.palet (
    id bigint NOT NULL,
    codigo character varying(255),
    estado character varying(255),
    tipo_ecologico character varying(255),
    fecha_hora_preparacion timestamp without time zone,
    observaciones character varying(255),
    envio_id bigint
);


ALTER TABLE public.palet OWNER TO postgres;

--
-- Name: partida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partida (
    id bigint NOT NULL,
    codigo character varying(255),
    estado character varying(255),
    peso integer,
    fecha_hora_creacion timestamp without time zone,
    observaciones character varying(255),
    lote_id bigint,
    palet_id bigint
);


ALTER TABLE public.partida OWNER TO postgres;

--
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    id bigint NOT NULL,
    codigo character varying(255),
    estado character varying(255),
    fecha_hora_solicitud timestamp without time zone,
    fecha_hora_atendido timestamp without time zone,
    fecha_hora_preparado timestamp without time zone,
    fecha_hora_enviado timestamp without time zone,
    observaciones character varying(255),
    cliente_id bigint,
    contacto_id bigint,
    direccion_envio_id bigint
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincia (
    id bigint NOT NULL,
    codigo character varying(255),
    nombre character varying(255)
);


ALTER TABLE public.provincia OWNER TO postgres;

--
-- Name: socio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socio (
    id bigint NOT NULL,
    activo boolean,
    nombre character varying(255),
    codigo character varying(255),
    cif character varying(255),
    observaciones character varying(255),
    contacto_id bigint,
    direccion_facturacion_id bigint,
    direccion_envio_id bigint
);


ALTER TABLE public.socio OWNER TO postgres;

--
-- Name: transportista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transportista (
    id bigint NOT NULL,
    activo boolean,
    nombre character varying(255),
    cif character varying(255),
    observaciones character varying(255),
    contacto_id bigint,
    direccion_facturacion_id bigint,
    direccion_envio_id bigint
);


ALTER TABLE public.transportista OWNER TO postgres;

--
-- Name: variedad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variedad (
    id bigint NOT NULL,
    codigo character varying(255),
    nombre character varying(255)
);


ALTER TABLE public.variedad OWNER TO postgres;

--
-- Name: albaran albaran_envio_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albaran
    ADD CONSTRAINT albaran_envio_id_key UNIQUE (envio_id);


--
-- Name: cliente cliente_contacto_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_contacto_id_key UNIQUE (contacto_id);


--
-- Name: jhi_persistent_audit_evt_data jhi_persistent_audit_evt_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_evt_data
    ADD CONSTRAINT jhi_persistent_audit_evt_data_pkey PRIMARY KEY (event_id, name);


--
-- Name: jhi_user_authority jhi_user_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user_authority
    ADD CONSTRAINT jhi_user_authority_pkey PRIMARY KEY (user_id, authority_name);


--
-- Name: albaran pk_albaran; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albaran
    ADD CONSTRAINT pk_albaran PRIMARY KEY (id);


--
-- Name: cliente pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (id);


--
-- Name: contacto pk_contacto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT pk_contacto PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: direccion pk_direccion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT pk_direccion PRIMARY KEY (id);


--
-- Name: entrada pk_entrada; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT pk_entrada PRIMARY KEY (id);


--
-- Name: envio pk_envio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envio
    ADD CONSTRAINT pk_envio PRIMARY KEY (id);


--
-- Name: historico_palet pk_historico_palet; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_palet
    ADD CONSTRAINT pk_historico_palet PRIMARY KEY (id);


--
-- Name: historico_partida pk_historico_partida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_partida
    ADD CONSTRAINT pk_historico_partida PRIMARY KEY (id);


--
-- Name: jhi_authority pk_jhi_authority; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_authority
    ADD CONSTRAINT pk_jhi_authority PRIMARY KEY (name);


--
-- Name: jhi_persistent_audit_event pk_jhi_persistent_audit_event; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_event
    ADD CONSTRAINT pk_jhi_persistent_audit_event PRIMARY KEY (event_id);


--
-- Name: jhi_persistent_token pk_jhi_persistent_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_token
    ADD CONSTRAINT pk_jhi_persistent_token PRIMARY KEY (series);


--
-- Name: jhi_user pk_jhi_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user
    ADD CONSTRAINT pk_jhi_user PRIMARY KEY (id);


--
-- Name: lote pk_lote; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lote
    ADD CONSTRAINT pk_lote PRIMARY KEY (id);


--
-- Name: palet pk_palet; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palet
    ADD CONSTRAINT pk_palet PRIMARY KEY (id);


--
-- Name: partida pk_partida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partida
    ADD CONSTRAINT pk_partida PRIMARY KEY (id);


--
-- Name: pedido pk_pedido; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pk_pedido PRIMARY KEY (id);


--
-- Name: provincia pk_provincia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT pk_provincia PRIMARY KEY (id);


--
-- Name: socio pk_socio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT pk_socio PRIMARY KEY (id);


--
-- Name: transportista pk_transportista; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportista
    ADD CONSTRAINT pk_transportista PRIMARY KEY (id);


--
-- Name: variedad pk_variedad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variedad
    ADD CONSTRAINT pk_variedad PRIMARY KEY (id);


--
-- Name: socio socio_contacto_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT socio_contacto_id_key UNIQUE (contacto_id);


--
-- Name: transportista transportista_contacto_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportista
    ADD CONSTRAINT transportista_contacto_id_key UNIQUE (contacto_id);


--
-- Name: jhi_user ux_user_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user
    ADD CONSTRAINT ux_user_email UNIQUE (email);


--
-- Name: jhi_user ux_user_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user
    ADD CONSTRAINT ux_user_login UNIQUE (login);


--
-- Name: idx_persistent_audit_event; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_persistent_audit_event ON public.jhi_persistent_audit_event USING btree (principal, event_date);


--
-- Name: idx_persistent_audit_evt_data; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_persistent_audit_evt_data ON public.jhi_persistent_audit_evt_data USING btree (event_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_user_email ON public.jhi_user USING btree (email);


--
-- Name: idx_user_login; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_user_login ON public.jhi_user USING btree (login);


--
-- Name: albaran fk_albaran_envio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albaran
    ADD CONSTRAINT fk_albaran_envio_id FOREIGN KEY (envio_id) REFERENCES public.envio(id);


--
-- Name: jhi_user_authority fk_authority_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user_authority
    ADD CONSTRAINT fk_authority_name FOREIGN KEY (authority_name) REFERENCES public.jhi_authority(name);


--
-- Name: cliente fk_cliente_contacto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_contacto_id FOREIGN KEY (contacto_id) REFERENCES public.contacto(id);


--
-- Name: cliente fk_cliente_direccion_envio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_direccion_envio_id FOREIGN KEY (direccion_envio_id) REFERENCES public.direccion(id);


--
-- Name: cliente fk_cliente_direccion_facturacion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_direccion_facturacion_id FOREIGN KEY (direccion_facturacion_id) REFERENCES public.direccion(id);


--
-- Name: entrada fk_entrada_lote_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT fk_entrada_lote_id FOREIGN KEY (lote_id) REFERENCES public.lote(id);


--
-- Name: envio fk_envio_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envio
    ADD CONSTRAINT fk_envio_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);


--
-- Name: envio fk_envio_contacto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envio
    ADD CONSTRAINT fk_envio_contacto_id FOREIGN KEY (contacto_id) REFERENCES public.contacto(id);


--
-- Name: envio fk_envio_direccion_envio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envio
    ADD CONSTRAINT fk_envio_direccion_envio_id FOREIGN KEY (direccion_envio_id) REFERENCES public.direccion(id);


--
-- Name: envio fk_envio_pedido_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envio
    ADD CONSTRAINT fk_envio_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedido(id);


--
-- Name: envio fk_envio_transportista_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envio
    ADD CONSTRAINT fk_envio_transportista_id FOREIGN KEY (transportista_id) REFERENCES public.transportista(id);


--
-- Name: jhi_persistent_audit_evt_data fk_evt_pers_audit_evt_data; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_evt_data
    ADD CONSTRAINT fk_evt_pers_audit_evt_data FOREIGN KEY (event_id) REFERENCES public.jhi_persistent_audit_event(event_id);


--
-- Name: historico_palet fk_historico_palet_palet_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_palet
    ADD CONSTRAINT fk_historico_palet_palet_id FOREIGN KEY (palet_id) REFERENCES public.palet(id);


--
-- Name: historico_partida fk_historico_partida_partida_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_partida
    ADD CONSTRAINT fk_historico_partida_partida_id FOREIGN KEY (partida_id) REFERENCES public.partida(id);


--
-- Name: lote fk_lote_socio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lote
    ADD CONSTRAINT fk_lote_socio_id FOREIGN KEY (socio_id) REFERENCES public.socio(id);


--
-- Name: lote fk_lote_variedad_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lote
    ADD CONSTRAINT fk_lote_variedad_id FOREIGN KEY (variedad_id) REFERENCES public.variedad(id);


--
-- Name: palet fk_palet_envio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palet
    ADD CONSTRAINT fk_palet_envio_id FOREIGN KEY (envio_id) REFERENCES public.envio(id);


--
-- Name: partida fk_partida_lote_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partida
    ADD CONSTRAINT fk_partida_lote_id FOREIGN KEY (lote_id) REFERENCES public.lote(id);


--
-- Name: partida fk_partida_palet_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partida
    ADD CONSTRAINT fk_partida_palet_id FOREIGN KEY (palet_id) REFERENCES public.palet(id);


--
-- Name: pedido fk_pedido_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pedido_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);


--
-- Name: pedido fk_pedido_contacto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pedido_contacto_id FOREIGN KEY (contacto_id) REFERENCES public.contacto(id);


--
-- Name: pedido fk_pedido_direccion_envio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pedido_direccion_envio_id FOREIGN KEY (direccion_envio_id) REFERENCES public.direccion(id);


--
-- Name: socio fk_socio_contacto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT fk_socio_contacto_id FOREIGN KEY (contacto_id) REFERENCES public.contacto(id);


--
-- Name: socio fk_socio_direccion_envio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT fk_socio_direccion_envio_id FOREIGN KEY (direccion_envio_id) REFERENCES public.direccion(id);


--
-- Name: socio fk_socio_direccion_facturacion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT fk_socio_direccion_facturacion_id FOREIGN KEY (direccion_facturacion_id) REFERENCES public.direccion(id);


--
-- Name: transportista fk_transportista_contacto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportista
    ADD CONSTRAINT fk_transportista_contacto_id FOREIGN KEY (contacto_id) REFERENCES public.contacto(id);


--
-- Name: transportista fk_transportista_direccion_envio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportista
    ADD CONSTRAINT fk_transportista_direccion_envio_id FOREIGN KEY (direccion_envio_id) REFERENCES public.direccion(id);


--
-- Name: transportista fk_transportista_direccion_facturacion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportista
    ADD CONSTRAINT fk_transportista_direccion_facturacion_id FOREIGN KEY (direccion_facturacion_id) REFERENCES public.direccion(id);


--
-- Name: jhi_user_authority fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user_authority
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.jhi_user(id);


--
-- Name: jhi_persistent_token fk_user_persistent_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_token
    ADD CONSTRAINT fk_user_persistent_token FOREIGN KEY (user_id) REFERENCES public.jhi_user(id);


--
-- PostgreSQL database dump complete
--

