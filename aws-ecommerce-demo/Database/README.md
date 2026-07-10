# Database

This folder contains the SQL scripts used to define and populate the product catalog for the demo application.

## Files

- schema.sql: Creates the products, users, and orders tables.
- sample_data.sql: Inserts sample products, users, and orders.

## Usage

Run the scripts in order:

```bash
mysql -u <username> -p <database_name> < schema.sql
mysql -u <username> -p <database_name> < sample_data.sql
```

## Notes

The database layer is intentionally simple so beginners can focus on the core concepts of relational data and SQL.
