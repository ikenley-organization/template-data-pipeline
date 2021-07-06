# template-data-pipeline

Sample ELT, data pipeline process. Data is fake. Pipeline process is real(ish). This is largely a demo of DBT, and as such uses a Posgres instance as the data warehouse to minimize cost. Snowflake or Redshift would be more robust (and expensive), would for the most part only require profile configuration changes.

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
