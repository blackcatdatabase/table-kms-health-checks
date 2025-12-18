-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  kms_health_checks

ALTER TABLE kms_health_checks ADD CONSTRAINT fk_kms_hc_provider FOREIGN KEY (provider_id) REFERENCES kms_providers(id) ON DELETE SET NULL;

ALTER TABLE kms_health_checks ADD CONSTRAINT fk_kms_hc_key      FOREIGN KEY (kms_key_id)  REFERENCES kms_keys(id) ON DELETE SET NULL;
