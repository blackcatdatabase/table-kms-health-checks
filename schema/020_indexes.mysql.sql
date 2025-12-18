-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  kms_health_checks

CREATE INDEX idx_kms_hc_provider_time ON kms_health_checks (provider_id, checked_at);

CREATE INDEX idx_kms_hc_key_time ON kms_health_checks (kms_key_id, checked_at);
