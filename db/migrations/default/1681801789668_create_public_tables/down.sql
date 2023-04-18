
DROP TABLE "public"."invoice_status";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "public"."invoice_status";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE TABLE invoice_status (
--   value text PRIMARY KEY,
--   comment text
-- );

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "public"."invoice_status";

alter table "public"."invoice_status" rename to "statuses";

DROP TABLE "public"."statuses";

DROP TABLE "public"."invoices";

DROP TABLE "public"."companies";

DROP TABLE "public"."users";
