# SymmetricDS

SymetricDS Setup

- [Mysql to Postgres](./mysql2postgres)
- [Postgres to Postgres](./postgres2postgres)

## Show me the code

```bash
./symadmin --engine heroku-00 create-sym-tables
./dbimport --engine heroku-00 ../scripts/setup.sql
./sym_service start
./sym_service stop
./symadmin --engine heroku-00 uninstall
./symadmin --engine postgres-01 uninstall
```