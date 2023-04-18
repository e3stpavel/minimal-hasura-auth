
alter table "public"."invoices" drop column "status" cascade;

alter table "public"."invoices" add column "status" text
 not null;

alter table "public"."invoices"
  add constraint "invoices_status_fkey"
  foreign key ("status")
  references "public"."invoice_status"
  ("value") on update restrict on delete restrict;

alter table "public"."invoices"
  add constraint "invoices_company_id_fkey"
  foreign key ("company_id")
  references "public"."companies"
  ("id") on update restrict on delete restrict;

alter table "public"."users" add column "company_id" uuid
 not null;

alter table "public"."users"
  add constraint "users_company_id_fkey"
  foreign key ("company_id")
  references "public"."companies"
  ("id") on update restrict on delete restrict;

CREATE TABLE "public"."user_role" ("value" text NOT NULL, "comment" text, PRIMARY KEY ("value") );COMMENT ON TABLE "public"."user_role" IS E'The roles of authenticated users';

alter table "public"."users" add column "role" text
 not null;

alter table "public"."users"
  add constraint "users_role_fkey"
  foreign key ("role")
  references "public"."user_role"
  ("value") on update restrict on delete restrict;
