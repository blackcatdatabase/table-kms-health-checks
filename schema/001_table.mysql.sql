-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  kms_health_checks

CREATE TABLE IF NOT EXISTS kms_health_checks (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  provider_id BIGINT UNSIGNED NULL,
  kms_key_id BIGINT UNSIGNED NULL,
  status ENUM('up','degraded','down') NOT NULL,
  latency_ms INT NULL,
  error TEXT NULL,
  checked_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
