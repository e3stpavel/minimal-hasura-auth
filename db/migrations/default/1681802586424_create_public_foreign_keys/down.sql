
alter table "public"."users" drop constraint "users_role_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."users" add column "role" text
--  not null;

DROP TABLE "public"."user_role";

alter table "public"."users" drop constraint "users_company_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."users" add column "company_id" uuid
--  not null;

alter table "public"."invoices" drop constraint "invoices_company_id_fkey";

alter table "public"."invoices" drop constraint "invoices_status_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."invoices" add column "status" text
--  not null;

comment on column "public"."invoices"."status" is E'Keeps the track of companies bills';
alter table "public"."invoices" alter column "status" drop not null;
alter table "public"."invoices" add column "status" int4;
