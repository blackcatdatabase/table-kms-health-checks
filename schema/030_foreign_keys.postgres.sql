-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  kms_health_checks

ALTER TABLE kms_health_checks ADD CONSTRAINT fk_kms_hc_provider FOREIGN KEY (provider_id) REFERENCES kms_providers(id) ON DELETE SET NULL;

ALTER TABLE kms_health_checks ADD CONSTRAINT fk_kms_hc_key      FOREIGN KEY (kms_key_id)  REFERENCES kms_keys(id) ON DELETE SET NULL;
