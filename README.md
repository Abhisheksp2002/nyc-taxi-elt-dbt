Welcome to your new dbt project!

Traditional ETL transforms data before loading it (in a separate processing engine like Spark). Modern ELT loads raw data into the warehouse first, then transforms it inside the warehouse using SQL — which is what dbt orchestrates. This shift happened because cloud warehouses (Snowflake, BigQuery, Redshift) became powerful enough to do transformation work themselves, and doing it there means one less system to manage, and better use of the warehouse's built-in compute.
The data flow you'll build:

## Architecture

```
NYC TLC Public Data (Parquet files)
        │
        │  EXTRACT + LOAD (raw, untransformed)
        ▼
Snowflake: RAW schema  (landing zone — exact copy of source)
        │
        │  dbt staging models (light cleanup: rename, cast types)
        ▼
Snowflake: STAGING schema  (stg_trips, stg_vendors...)
        │
        │  dbt intermediate models (joins, dedup, business logic)
        ▼
Snowflake: INTERMEDIATE schema  (int_trips_enriched...)
        │
        │  dbt mart models (star schema: facts + dimensions)
        ▼
Snowflake: MARTS schema  (fct_trips, dim_vendor, dim_date...)
        │
        ▼
   BI tool / analysis
```
### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
