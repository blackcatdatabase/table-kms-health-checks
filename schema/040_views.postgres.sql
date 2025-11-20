-- Auto-generated from schema-views-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  kms_health_checks_latest
-- Latest health sample per provider/key
CREATE OR REPLACE VIEW vw_kms_health_latest AS
SELECT DISTINCT ON (COALESCE(kms_key_id,-1), COALESCE(provider_id,-1))
  id, provider_id, kms_key_id, status, latency_ms, error, checked_at
FROM kms_health_checks
ORDER BY COALESCE(kms_key_id,-1), COALESCE(provider_id,-1), checked_at DESC;

-- Auto-generated from schema-views-postgres.psd1 (map@62c9c93)
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

