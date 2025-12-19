-- Auto-generated from schema-views-postgres.yaml (map@sha1:5C6FE96DC2067A978A357A1DCB8631B46C71D429)
-- engine: postgres
-- table:  kms_health_checks

-- Contract view for [kms_health_checks]
CREATE OR REPLACE VIEW vw_kms_health_checks AS
SELECT
  id,
  provider_id,
  kms_key_id,
  status,
  latency_ms,
  error,
  checked_at
FROM kms_health_checks;
