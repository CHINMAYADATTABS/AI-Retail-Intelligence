# Project progress log

## 2026-10-12 — PostgreSQL data foundation
- Imported dunnhumby products and transactions into PostgreSQL staging tables.
- Verified 2,595,732 raw transactions.
- Identified 14,466 zero-quantity records; preserved them in staging.
- Created and checked `vw_clean_sales` (2,581,266 records).
- Analyzed department sales, 102 weeks of sales, and early-versus-later week activity.

## 2026-10-13 — GitHub documentation
- Published cleaned sales view, data quality queries, department and weekly sales SQL.
- Started a living project report.
- Next: Alteryx Designer workflow and data pipeline documentation.

## Open questions
- Determine meaning of zero-quantity transactions.
- Document exact staging DDL and import commands.
- Verify source data terms and avoid committing raw dataset.
- Validate dashboard totals against PostgreSQL baseline.
