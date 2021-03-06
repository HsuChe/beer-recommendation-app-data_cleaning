-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.brewery
(
    brewery_id integer,
    brewery_name "char",
    PRIMARY KEY (brewery_id)
);

COMMENT ON TABLE public.brewery
    IS 'brewery_id as primary key';

CREATE TABLE public.beer
(
    beer_beerid bigint,
    beer_name text,
    beer_style text,
    beer_abv double precision,
    PRIMARY KEY (beer_beerid)
);

CREATE TABLE public.beer_brewery
(
    beer_beerid bigint,
    brewery_id bigint
);

CREATE TABLE public.review
(
    beer_beerid bigint,
    review_overall double precision,
    review_aroma double precision,
    review_appearance double precision,
    review_palate double precision,
    review_taste double precision
);

ALTER TABLE public.brewery
    ADD FOREIGN KEY (brewery_id)
    REFERENCES public.beer_brewery (brewery_id)
    NOT VALID;


ALTER TABLE public.beer
    ADD FOREIGN KEY (beer_beerid)
    REFERENCES public.review (beer_beerid)
    NOT VALID;


ALTER TABLE public.beer
    ADD FOREIGN KEY (beer_beerid)
    REFERENCES public.beer_brewery (beer_beerid)
    NOT VALID;

END;