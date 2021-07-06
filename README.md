# template-data-pipeline

Sample ELT, data pipeline process. Data is fake. Pipeline process is real(ish). This is largely a demo of [DBT](https://docs.getdbt.com/tutorial/setting-up), and as such uses a Posgres instance as the data warehouse to minimize cost. Snowflake or Redshift would be more robust (and expensive), would for the most part only require profile configuration changes.

This assumes that you have (1) [dbt cli installed locally](https://docs.getdbt.com/dbt-cli/installation) (2) a data warehouse setup. Consider [local postgres](https://www.postgresql.org/download/) or [Google BigQuery](https://docs.getdbt.com/tutorial/setting-up#create-a-bigquery-project)

---

## Data

Sample data to upload to an S3 bucket. In the real world this data would arrive from other sources. These files would also not be checked into git.

```
# Upload all files in ./data to S3
aws s3 sync ./data s3://924586450630-data-lake/ --profile antigone-dev-tf --region us-east-1

# Check CVS schema
cd data/template-data-pipeline/raw
head customers.csv
```

---

## Load

Load raw data into data warehouse. This script loads S3 flat files into Postgres. In the real world this would likely be a 3rd party license of something like [Stitch](https://www.stitchdata.com/) or [Fivetran](https://fivetran.com/)

---

## Transform

### Creating a dbt project subdirectory

https://docs.getdbt.com/tutorial/create-a-project-dbt-cli

```
dbt init transform
cd transform
dbt run
dbt test
dbt docs generate
dbt docs serve
```

### Directory Structure

- [How we structure our dbt projects](https://discourse.getdbt.com/t/how-we-structure-our-dbt-projects/355)
- [Example repo](https://github.com/dbt-labs/jaffle_shop-dev)

- models: Contains the table creations
  - staging: Map 1-to-1 with raw data sources; Contain only data conversions, cleaning, and unions
  - marts: Tables that will actually be used for analysis or published to production

### Tests

[Coming soon](https://docs.getdbt.com/docs/building-a-dbt-project/tests)

### Variables

[Coming soon](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/using-variables)

### Seeding lookup tables

[Coming soon](https://docs.getdbt.com/docs/building-a-dbt-project/seeds)
