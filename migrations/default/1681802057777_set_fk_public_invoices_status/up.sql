alter table "public"."invoices"
  add constraint "invoices_status_fkey"
  foreign key ("status")
  references "public"."invoice_status"
  ("value") on update restrict on delete restrict;
