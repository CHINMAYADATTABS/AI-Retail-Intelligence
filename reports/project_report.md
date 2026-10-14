# AI-Powered Retail Sales & Customer Intelligence Platform
## Project report — work in progress
Last updated: 2026-10-13

### Objective
Build a reproducible retail analytics portfolio project using PostgreSQL, Alteryx, Power BI, Python, and an AI insights component. Support sales analysis, customer understanding, and business reporting.

### Data
Source: dunnhumby **The Complete Journey** CSV dataset. Obtain original files from the dataset provider and follow its license/usage conditions. Raw data is not committed to this repository.

### Implemented work
- Created PostgreSQL database `retail_intelligence`.
- Loaded product and transaction data into `stg_products` and `stg_transactions`.
- Checked missing keys, missing sales values, nonpositive quantities, and negative sales.
- Created `vw_clean_sales` by joining products to transactions and retaining `quantity > 0`.
- Analyzed sales by department and week, customer reach, baskets, and average basket value.

### Validated results (from pgAdmin, 2026-10-12)
| Metric | Value |
|---|---:|
| Raw transaction records | 2,595,732 |
| Zero-quantity records | 14,466 |
| Cleaned sales records | 2,581,266 |
| Cleaned sales value | $8,057,443.80 |
| Unique households | 2,500 |
| Unique baskets | 275,889 |
| Weeks covered | 102 |

The 14,466 zero-quantity records are retained in staging but excluded from initial sales reporting. Their business meaning is not yet confirmed.

### Early insights
- Grocery department revenue: **$4,093,810.84**, approximately 50.8% of cleaned sales.
- Weeks 1–10: average weekly sales **$22,466.66**, average **391** active households.
- Weeks 11–102: average weekly sales **$85,138.88**, average **1,304** active households.

**Caution:** Differences between early and later weeks may reflect dataset coverage/ramp-up rather than true organic growth. Unit counts for some departments may have nonstandard meanings.

### Next milestones
1. Build and validate an Alteryx ETL workflow.
2. Build Power BI sales and customer dashboards.
3. Add Python segmentation and analytics.
4. Add an AI-powered insight feature with validation.
5. Capture screenshots, architecture, setup instructions, and final findings.

### Reproducibility notes
The existing `sql/01_create_tables.sql` is an initial generic schema; it is not the dunnhumby staging-table DDL. Staging-table creation and import instructions must still be documented before this is a complete reproducible pipeline.
