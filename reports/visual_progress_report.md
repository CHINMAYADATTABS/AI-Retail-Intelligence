# AI Retail Intelligence — Visual Progress Report

**Updated:** October 14, 2026  
**Status:** SQL analysis completed; sample Alteryx ETL run succeeded; dashboard and AI phases pending.

> **Screenshot status:** This report includes a screenshot register and descriptive captions. The original screenshots are held in the ChatGPT conversation and have **not yet been uploaded into this GitHub repository**. The image links below will work after those screenshot files are added under `reports/screenshots/`. Do not mistake the placeholders for uploaded images.

## 1. PostgreSQL — data ingestion and quality checks

- Dataset: dunnhumby *The Complete Journey*.
- Imported `product.csv` and `transaction_data.csv` into staging tables `stg_products` and `stg_transactions`.
- Transaction rows: **2,595,732**.
- Quantity-zero rows: **14,466**; no negative quantity rows reported.
- Clean view `vw_clean_sales` keeps `quantity > 0` and joins product attributes.
- Clean transaction rows: **2,581,266**.
- Clean sales value: **$8,057,443.80**.
- Unique households: **2,500**.
- Unique baskets: **275,889**.

### Sales exploration
- Highest sales department: **GROCERY — $4,093,810.84**.
- Top week: **week 92 — $113,192.87**.
- First 10 weeks averaged **$22,466.66** weekly sales and **391** active households.
- Weeks 11–102 averaged **$85,138.88** weekly sales and **1,304** active households.
- Differences may reflect coverage/ramp-up, not necessarily organic growth.

## 2. Alteryx One Designer Cloud — sample ETL

![Alteryx workflow canvas](screenshots/01_alteryx_workflow.png)

*Screenshot 1 (pending upload):* Input Data → Filter → Select → Data Cleansing, branching to overall KPI and weekly sales summarization.

- Input: `alteryx_transactions_sample_100k.csv` (**100,000** rows).
- Filter `ToNumber([quantity]) > 0`: **99,454** pass; **546** excluded.
- Weekly aggregation: **102** groups.
- Output: `weekly_sales_1.csv`.
- Job **4817973** completed successfully after approximately **12 minutes**.

![Alteryx successful job](screenshots/02_alteryx_job_success.png)

*Screenshot 2 (pending upload):* Alteryx cloud job details showing Success and output CSV.

![Alteryx weekly results](screenshots/03_alteryx_weekly_results.png)

*Screenshot 3 (pending upload):* Weekly output preview with `week_no`, summed sales, distinct basket counts and weekly average basket value.

## 3. Local processed file and GitHub

![Local processed file](screenshots/04_local_processed_file.png)

*Screenshot 4 (pending upload):* `data/processed/weekly_sales_sample.csv` saved locally.

![GitHub processed file](screenshots/05_github_processed_file.png)

*Screenshot 5 (pending upload):* The processed CSV committed to the GitHub repository.

- Committed sample output: [`data/processed/weekly_sales_sample.csv`](../data/processed/weekly_sales_sample.csv).
- Alteryx implementation notes: [`docs/alteryx_workflow.md`](../docs/alteryx_workflow.md).
- Repository: [AI-Retail-Intelligence](https://github.com/CHINMAYADATTABS/AI-Retail-Intelligence).

## 4. Next stages
1. Upload the five **actual screenshots** to `reports/screenshots/` using the filenames above.
2. Export the editable cloud workflow, if Alteryx One permits, and commit the native file without credentials.
3. Build a Power BI dashboard from the **sample** CSV and clearly label sample-only metrics.
4. Develop a full-dataset analytics output from PostgreSQL, then extend to customer segmentation and AI insights.

## Dataset and privacy
Do not upload the raw dunnhumby dataset or any credentials unless distribution rights and security have been verified. This report documents the project's own work and sample results.
