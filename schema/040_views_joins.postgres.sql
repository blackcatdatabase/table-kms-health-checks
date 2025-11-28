-- Auto-generated from joins-postgres.psd1 (map@mtime:2025-11-27T17:17:38Z)
-- engine: postgres
-- view:   kms_health_checks_latest

-- Latest health sample per provider/key
CREATE OR REPLACE VIEW vw_kms_health_latest AS
SELECT DISTINCT ON (COALESCE(kms_key_id,-1), COALESCE(provider_id,-1))
  id, provider_id, kms_key_id, status, latency_ms, error, checked_at
FROM kms_health_checks
ORDER BY COALESCE(kms_key_id,-1), COALESCE(provider_id,-1), checked_at DESC;
