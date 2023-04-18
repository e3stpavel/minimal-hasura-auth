comment on column "public"."invoices"."status" is E'Keeps the track of companies bills';
alter table "public"."invoices" alter column "status" drop not null;
alter table "public"."invoices" add column "status" int4;
