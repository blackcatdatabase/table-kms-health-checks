-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  kms_health_checks

CREATE INDEX IF NOT EXISTS idx_kms_hc_provider_time ON kms_health_checks (provider_id, checked_at);

CREATE INDEX IF NOT EXISTS idx_kms_hc_key_time ON kms_health_checks (kms_key_id, checked_at);
