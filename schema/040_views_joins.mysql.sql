-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   kms_health_checks_latest
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
;
