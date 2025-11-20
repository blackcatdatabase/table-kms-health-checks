-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  kms_health_checks_latest
-- Latest health sample per provider/key
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_kms_health_latest AS
WITH ranked AS (
  SELECT
    id,
    provider_id,
    kms_key_id,
    status,
    latency_ms,
    error,
    checked_at,
    ROW_NUMBER() OVER (
      PARTITION BY COALESCE(kms_key_id, -1), COALESCE(provider_id, -1)
      ORDER BY checked_at DESC
    ) AS rn
  FROM kms_health_checks
)
SELECT
  id,
  provider_id,
  kms_key_id,
  status,
  latency_ms,
  error,
  checked_at
FROM ranked
WHERE rn = 1
ORDER BY COALESCE(kms_key_id, -1), COALESCE(provider_id, -1);

-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  kms_health_checks
-- Contract view for [kms_health_checks]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_kms_health_checks AS
SELECT
  id,
  provider_id,
  kms_key_id,
  status,
  latency_ms,
  error,
  checked_at
FROM kms_health_checks;

