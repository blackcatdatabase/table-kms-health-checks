-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  kms_health_checks

CREATE INDEX idx_kms_hc_provider_time ON kms_health_checks (provider_id, checked_at);

CREATE INDEX idx_kms_hc_key_time ON kms_health_checks (kms_key_id, checked_at);
