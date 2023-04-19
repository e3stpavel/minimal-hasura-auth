CREATE DOMAIN seed_float AS FLOAT CHECK (value <= 1)
CHECK (value >= - 1);

CREATE OR REPLACE FUNCTION public.list_companies_random (seed seed_float DEFAULT 0 ::seed_float)
  RETURNS SETOF public.companies
  AS $$
  SELECT
    SETSEED(seed);

  SELECT
    *
  FROM
    public.companies
  ORDER BY
    random();

$$
LANGUAGE sql
STABLE;
