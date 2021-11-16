--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA pg_catalog;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: discoveryteam
--

CREATE TABLE public.employee (
    id character varying PRIMARY KEY DEFAULT uuid_generate_v4(),
    name character varying,
    identification_number character varying,
    role character varying,
    email character varying,
    phone character varying
);


ALTER TABLE public.employee OWNER TO discoveryteam;

--
-- Name: COLUMN employee.id; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.employee.id IS 'Employee Identificator';


--
-- Name: COLUMN employee.name; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.employee.name IS 'Employee Name';


--
-- Name: COLUMN employee.identification_number; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.employee.identification_number IS 'Employee identification number';


--
-- Name: COLUMN employee.role; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.employee.role IS 'Employee Role';


--
-- Name: COLUMN employee.email; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.employee.email IS 'Employee Email';


--
-- Name: COLUMN employee.phone; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.employee.phone IS 'Employee Phone';


--
-- Name: inspection; Type: TABLE; Schema: public; Owner: discoveryteam
--

CREATE TABLE public.inspection (
    id character varying PRIMARY KEY DEFAULT uuid_generate_v4(),
    supervisor_id character varying,
    location_id character varying,
    employee_id character varying,
    type character varying,
    date character varying,
    title character varying,
    description character varying,
    approved boolean,
    novelty boolean,
    novelty_description character varying,
    improvement_action boolean,
    improvement_action_description character varying,
    comment character varying
);


ALTER TABLE public.inspection OWNER TO discoveryteam;

--
-- Name: COLUMN inspection.id; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.id IS 'Inspection Identifier';


--
-- Name: COLUMN inspection.supervisor_id; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.supervisor_id IS 'Supervisor Identifier';


--
-- Name: COLUMN inspection.location_id; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.location_id IS 'Location Identifier';


--
-- Name: COLUMN inspection.employee_id; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.employee_id IS 'Employee Identifier';


--
-- Name: COLUMN inspection.type; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.type IS 'Type of inspection';


--
-- Name: COLUMN inspection.date; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.date IS 'Date of inspection';


--
-- Name: COLUMN inspection.title; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.title IS 'Title of inspection';


--
-- Name: COLUMN inspection.description; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.description IS 'Description of inspection';


--
-- Name: COLUMN inspection.approved; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.approved IS 'Is the inspection approved?';


--
-- Name: COLUMN inspection.novelty; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.novelty IS 'The inspection have a novelty';


--
-- Name: COLUMN inspection.novelty_description; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.novelty_description IS 'Novelty description';


--
-- Name: COLUMN inspection.improvement_action; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.improvement_action IS 'Improvement action';


--
-- Name: COLUMN inspection.improvement_action_description; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.improvement_action_description IS 'Improvement action description';


--
-- Name: COLUMN inspection.comment; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.inspection.comment IS 'Comment';


--
-- Name: location; Type: TABLE; Schema: public; Owner: discoveryteam
--

CREATE TABLE public.location (
    id character varying PRIMARY KEY DEFAULT uuid_generate_v4(),
    name character varying,
    address character varying,
    neighborhood character varying,
    area character varying,
    representative character varying,
    email character varying,
    phone character varying
);


ALTER TABLE public.location OWNER TO discoveryteam;

--
-- Name: COLUMN location.id; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.location.id IS 'Location Identifier';


--
-- Name: COLUMN location.name; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.location.name IS 'Location Name';


--
-- Name: COLUMN location.address; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.location.address IS 'Location Address';


--
-- Name: COLUMN location.neighborhood; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.location.neighborhood IS 'Location Neighborhood';


--
-- Name: COLUMN location.area; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.location.area IS 'Location Area';


--
-- Name: COLUMN location.representative; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.location.representative IS 'Location Representative';


--
-- Name: COLUMN location.email; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.location.email IS 'Location email';


--
-- Name: COLUMN location.phone; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.location.phone IS 'LocationPhone';


--
-- Name: supervisor; Type: TABLE; Schema: public; Owner: discoveryteam
--

CREATE TABLE public.supervisor (
    id character varying PRIMARY KEY DEFAULT uuid_generate_v4(),
    name character varying,
    identification_number character varying,
    email character varying,
    phone character varying,
    username character varying,
    password character varying
);


ALTER TABLE public.supervisor OWNER TO discoveryteam;

--
-- Name: COLUMN supervisor.id; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.supervisor.id IS 'Supervisor identificator';


--
-- Name: COLUMN supervisor.name; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.supervisor.name IS 'Supervisor name';


--
-- Name: COLUMN supervisor.identification_number; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.supervisor.identification_number IS 'Supervisor Identification Number';


--
-- Name: COLUMN supervisor.email; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.supervisor.email IS 'Supervisor Email';


--
-- Name: COLUMN supervisor.phone; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.supervisor.phone IS 'Supervisor Phone';


--
-- Name: COLUMN supervisor.username; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.supervisor.username IS 'Supervisor Username';


--
-- Name: COLUMN supervisor.password; Type: COMMENT; Schema: public; Owner: discoveryteam
--

COMMENT ON COLUMN public.supervisor.password IS 'Supervisor Password';


--
-- Name: inspection employee_fk; Type: FK CONSTRAINT; Schema: public; Owner: discoveryteam
--

ALTER TABLE ONLY public.inspection
    ADD CONSTRAINT employee_fk FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- Name: inspection location_fk; Type: FK CONSTRAINT; Schema: public; Owner: discoveryteam
--

ALTER TABLE ONLY public.inspection
    ADD CONSTRAINT location_fk FOREIGN KEY (id) REFERENCES public.location(id);


--
-- Name: inspection supervisor_fk; Type: FK CONSTRAINT; Schema: public; Owner: discoveryteam
--

ALTER TABLE ONLY public.inspection
    ADD CONSTRAINT supervisor_fk FOREIGN KEY (supervisor_id) REFERENCES public.supervisor(id);


--
-- PostgreSQL database dump complete
--

