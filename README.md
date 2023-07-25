# Data Transformation with DBT 🧙

Welcome to the land of data transformation via [dbt](https://www.getdbt.com/)! This repository contains modelling of personal social media data, leaning loosely on data vault and dimensional modelling principals.

## Project layout

The project essentially follows the standard dbt project layout. See the [dbt project documentation](https://docs.getdbt.com/docs/build/projects) for more details.

Aside from the dbt specific directories, here's some directories scattered throughout the project and what they're used for:
* Data Vault -> Data models for data storage
    * Raw Stage -> Reformatted raw data
    * Prime Stage -> Raw stage with data vault specific columns
    * Hub -> Entities in the data (e.g. people, messages)
    * Link -> Relationships in the data (e.g. message authors)
    * Sat -> Contextual information about entities and relationships
    * Ref -> External reference data
* Information Mart -> Data models for data analysis
    * Dim -> Entities in the data (e.g. people, messages)
    * Fact -> Measurements about the entities (e.g. Total messages sent per day, per person)

## Running dbt

There are a lot of ways you can run dbt models. The [dbt docs](https://docs.getdbt.com/reference/dbt-commands) has more info on all the commands you can run to interact with your dbt resources.

The following commands will get the project set up and all the dbt resources built.

```
# Setup the virtual environment
poetry shell

# Install dbt dependencies
dbt deps

# Build all dbt objects
dbt build
```

If you're interested in viewing the dependencies between tables, try running the following:

```
# Setup the virtual environment
poetry shell

# Generate documentation
dbt docs generate

# Host the documentation locally
dbt docs serve
```