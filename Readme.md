# Data Engineering Job Switch Preparation

This repository contains structured learning material, practice code, and design notes
for preparing for a **Data Engineer** role.

The goal is to build **strong fundamentals**, write **production-quality code**, and
maintain **clear revision notes** alongside hands-on practice.

---

## 🐍 PYTHON
- Basics recap (data types, loops, conditions)
- Functions, `*args`, `**kwargs`
- List / dict / set comprehensions
- File handling (`pathlib`)
- Exception handling (`try / except`)
- Custom exceptions
- Logging (`logging` module)
- Config-driven code (`yaml` / `json`)
- Type hints & docstrings
- Modular project structure
- Virtual environments & dependencies
- Writing reusable, clean functions
- Basic unit testing (conceptual)

---

## 🗄 SQL
- `SELECT`, `WHERE`, `ORDER BY`
- Aggregations (`COUNT`, `SUM`, `AVG`)
- `GROUP BY` vs `HAVING`
- Joins (`INNER`, `LEFT`, `RIGHT`, `FULL`)
- Subqueries
- CTEs (`WITH`)
- Window functions (`ROW_NUMBER`, `RANK`, `LAG`, `LEAD`)
- Date & time functions
- Case statements
- Deduplication queries
- Query optimization basics
- Handling `NULL`s
- Writing analytics queries (business-oriented)

---

## 🐼 PANDAS
- Reading/writing data (CSV, Parquet)
- Data inspection (`head`, `info`, `describe`)
- Handling missing values
- Data type conversions
- Filtering & sorting
- `groupby` operations
- Aggregations & metrics
- Merging / joining DataFrames
- Datetime operations
- Feature engineering
- Vectorization vs loops
- When **NOT** to use Pandas
- Converting Pandas logic to SQL / Spark

---

## ⚡ PYSPARK
- Spark architecture (Driver, Executor)
- `SparkSession` & DataFrames
- Reading/writing large datasets
- Schema definition & inference
- Transformations vs actions
- Joins & shuffles
- Partitioning & repartitioning
- Window functions
- Aggregations at scale
- Caching & persistence
- Handling skewed data (conceptual)
- Performance tuning basics
- Pandas vs Spark decision making

---

## ☁️ GCP (OVERVIEW LEVEL)
- GCP core services overview
- Google Cloud Storage (GCS)
- BigQuery architecture
- BigQuery partitions & clustering
- IAM basics (roles, service accounts)
- Cost optimization basics
- Batch vs streaming (conceptual)
- How Spark fits into GCP
- Data pipeline design on GCP

---

## ❄️ SNOWFLAKE (OVERVIEW + SQL)
- Snowflake architecture (compute vs storage)
- Warehouses & scaling
- Databases, schemas, tables
- Data loading concepts
- Clustering vs partitioning
- Time Travel & Fail-safe (conceptual)
- Writing Snowflake SQL
- Cost control strategies
- Snowflake vs BigQuery comparison

---

## 🔁 DATA PIPELINE DESIGN
- Raw → staging → curated layers
- Idempotent pipelines
- Handling late & bad data
- Re-runnable pipelines
- Logging & monitoring strategy
- Error handling approach
- Schema evolution strategy
- Batch pipeline design
- High-level orchestration (Airflow concept)

---

## 📓 Learning Approach
- **Code** is written and maintained in this repository
- **Concepts, reasoning, and revision notes** are maintained separately in a personal diary
- Each topic focuses on:
  - Why the concept is needed
  - Where it is used in real systems
  - Common mistakes
  - Interview relevance

---

## 🎯 Objective
To be confident in:
- Designing scalable data pipelines
- Writing clean and maintainable code
- Explaining design choices in interviews
