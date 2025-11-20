<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – kms_health_checks

Periodic health probes for KMS providers/keys.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| provider_id | BIGINT | YES | — | KMS provider being checked (FK kms_providers.id). |  |
| kms_key_id | BIGINT | YES | — | Specific key being checked (FK kms_keys.id), optional. |  |
| status | TEXT | NO | — | Probe result. | enum: up, degraded, down |
| error | TEXT | YES | — | Error string when degraded/down. |  |
| checked_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp of the check (UTC). |  |