alter table "public"."users"
  add constraint "users_company_id_fkey"
  foreign key ("company_id")
  references "public"."companies"
  ("id") on update restrict on delete restrict;
