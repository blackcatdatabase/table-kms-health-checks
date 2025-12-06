-- Auto-generated from schema-views-mysql.yaml (map@sha1:A4E10261DACB7519F6FEA44ED77A92163429CA5E)
-- engine: mysql
-- table:  kms_health_checks

-- Contract view for [kms_health_checks]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_kms_health_checks AS
SELECT
  id,
  provider_id,
  kms_key_id,
  status,
  latency_ms,
  error,
  checked_at
FROM kms_health_checks;
