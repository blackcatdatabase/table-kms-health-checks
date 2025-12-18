-- Auto-generated from core/joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   kms_health_latest

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
WHERE rn = 1;
