CREATE TABLE "public"."statuses" ("id" serial NOT NULL, "text" text NOT NULL DEFAULT 'Unpaid', "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("text"));COMMENT ON TABLE "public"."statuses" IS E'Represents the statuses of invoices';
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_statuses_updated_at"
BEFORE UPDATE ON "public"."statuses"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_statuses_updated_at" ON "public"."statuses"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
