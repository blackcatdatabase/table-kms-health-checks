-- Auto-generated from schema-map-mysql.yaml (map@sha1:09DF9CA612D1573E058190CC207FA257C05AEC1F)
-- engine: mysql
-- table:  kms_health_checks

CREATE INDEX idx_kms_hc_provider_time ON kms_health_checks (provider_id, checked_at);

CREATE INDEX idx_kms_hc_key_time ON kms_health_checks (kms_key_id, checked_at);
