# Alteryx Designer Cloud — Retail Sales Sample Workflow

## Status
Workflow built and successfully executed in Alteryx One Designer Cloud on October 13, 2026. This documentation describes the observed workflow from the project screenshots. The native Alteryx workflow has **not** yet been exported into this repository.

## Input and scope
- Source file: `alteryx_transactions_sample_100k.csv` (a 100,000-row sample of the dunnhumby *The Complete Journey* transaction data).
- Input rows: **100,000**.
- Filter: `ToNumber([quantity]) > 0`.
- Passing rows: **99,454**.
- Excluded rows: **546**.
- This workflow is **sample-based** and its output must not be presented as full-dataset results.

## Workflow stages
1. **Input Data (#1)** — read the transaction sample CSV.
2. **Filter (#2)** — retain records with positive quantity using `ToNumber([quantity]) > 0`.
3. **Select (#3)** — configure fields and types.
4. **Data Cleansing (#4)** — apply field cleaning.
5. **Summarize (#5)** — aggregate overall sales and distinct household/basket counts.
6. **Formula (#6)** — calculate `Average_Basket_Value` as total sales divided by distinct basket count, rounded to two decimals.
7. **Summarize (#7)** — group by `week_no`, sum `sales_value`, and count distinct `basket_id`.
8. **Formula (#8)** — calculate `Weekly_Avg_Basket_Value` from weekly sales divided by weekly distinct basket count, rounded to two decimals; guard against zero basket counts.
9. **Sort (#9)** — sort by `week_no` ascending.
10. **Output Data (#10)** — export weekly results to CSV in Alteryx Data Storage.

The overall KPI branch and weekly aggregation branch both start after Data Cleansing.

## Verified sample KPIs
- Sales value: approximately **311,273.24**
- Distinct households: **2,466**
- Distinct baskets: **68,705**
- Average basket value: **4.53**
- Weekly output: **102 rows** (one per week)

These are sample-only results. Full PostgreSQL data analysis uses a separate, larger dataset and must not be conflated with these values.

## Output
- Repository file: [`data/processed/weekly_sales_sample.csv`](../data/processed/weekly_sales_sample.csv)
- Original Alteryx cloud job output name: `weekly_sales_1.csv`
- Cloud job ID: `4817973`
- Job status: **Success**
- Reported runtime: **12 minutes**

## Reproducibility and next steps
- Export the native Alteryx workflow when available and add it under `alteryx/` (do not include credentials).
- Keep the original licensed dunnhumby CSV source files out of the repository unless its redistribution terms explicitly allow publication.
- Validate the processed CSV against the 102 weekly rows and four expected columns.
- Use the sample CSV for an initial Power BI prototype, clearly labeling sample metrics.
- Later, run a production pipeline on the full PostgreSQL dataset and publish separately named outputs.

## Notes
The workflow was built in **Alteryx One Designer Cloud**, rather than a locally saved Alteryx Designer `.yxmd` file. The screenshots do not establish that the cloud workflow can be exported as `.yxmd`, so the native format remains to be confirmed.
