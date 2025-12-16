-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  kms_health_checks

CREATE INDEX idx_kms_hc_provider_time ON kms_health_checks (provider_id, checked_at);

CREATE INDEX idx_kms_hc_key_time ON kms_health_checks (kms_key_id, checked_at);
