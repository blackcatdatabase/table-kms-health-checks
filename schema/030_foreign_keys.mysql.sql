-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  kms_health_checks

ALTER TABLE kms_health_checks ADD CONSTRAINT fk_kms_hc_provider FOREIGN KEY (provider_id) REFERENCES kms_providers(id) ON DELETE SET NULL;

ALTER TABLE kms_health_checks ADD CONSTRAINT fk_kms_hc_key FOREIGN KEY (kms_key_id) REFERENCES kms_keys(id) ON DELETE SET NULL;
