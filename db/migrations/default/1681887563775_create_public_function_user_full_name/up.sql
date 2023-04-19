CREATE OR REPLACE FUNCTION public.user_full_name(user_row users)
RETURNS text AS $$
SELECT user_row.first_name || ' ' || user_row.last_name
$$
LANGUAGE sql
STABLE;
