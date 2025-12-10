# kms_health_checks

Periodic health probes for KMS providers/keys.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| checked_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp of the check (UTC). |
| error | TEXT | YES |  | Error string when degraded/down. |
| id | BIGINT | NO |  | Surrogate primary key. |
| kms_key_id | BIGINT | YES |  | Specific key being checked (FK kms_keys.id), optional. |
| latency_ms | mysql: INT / postgres: INTEGER | YES |  | Measured latency in milliseconds. |
| provider_id | BIGINT | YES |  | KMS provider being checked (FK kms_providers.id). |
| status | mysql: ENUM('up','degraded','down') / postgres: TEXT | NO |  | Probe result. (enum: up, degraded, down) |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_kms_hc_key_time | kms_key_id,checked_at | CREATE INDEX idx_kms_hc_key_time ON kms_health_checks (kms_key_id, checked_at) |
| idx_kms_hc_provider_time | provider_id,checked_at | CREATE INDEX idx_kms_hc_provider_time ON kms_health_checks (provider_id, checked_at) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_kms_hc_key | kms_key_id | kms_keys(id) | ON DELETE SET |
| fk_kms_hc_provider | provider_id | kms_providers(id) | ON DELETE SET |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_kms_hc_key_time | kms_key_id,checked_at | CREATE INDEX IF NOT EXISTS idx_kms_hc_key_time ON kms_health_checks (kms_key_id, checked_at) |
| idx_kms_hc_provider_time | provider_id,checked_at | CREATE INDEX IF NOT EXISTS idx_kms_hc_provider_time ON kms_health_checks (provider_id, checked_at) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_kms_hc_key | kms_key_id | kms_keys(id) | ON DELETE SET |
| fk_kms_hc_provider | provider_id | kms_providers(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_kms_health_checks | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_kms_health_latest | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_kms_health_checks | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
| vw_kms_health_latest | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
