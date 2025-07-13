# Docker

### Create docker container
```bash
$ docker run --name mocadb-dev -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres
```
### Execute psql
```bash
$ docker exec -it mocadb-dev psql -U postgres  
```

# Postgres

### Create postgres user

* Create user and role: https://www.digitalocean.com/community/tutorials/how-to-use-roles-and-manage-grant-permissions-in-postgresql-on-a-vps-2

```sql
postgres=# CREATE USER ymoyamac;
```
### Create password
```sql
postgres=# CREATE USER ymoyamac WITH PASSWORD 'ymoyamac';
```
### Create database
```sql
postgres=# CREATE DATABASE mocadev;
```

### Create schema

```sql
create schema if not exists moca authorization ymoyamac;
```

### Grant privileges

* First start as user ***postgres*** into the DB ***postgres***
```bash
docker exec -it mocadb-dev psql -U postgres
```
* Second connect to target DB
```sql
postgres=#\c mocadev
```
* Finally grant privileges
```sql
mocadev=# GRANT USAGE ON SCHEMA public TO ymoyamac;
```
```sql
mocadev=# GRANT ALL ON SCHEMA public TO ymoyamac;
```
```sql
mocadev=# GRANT ALL PRIVILEGES ON DATABASE mocadev TO ymoyamac;
```

### Create schema

```sql
create schema if not exists moca authorization ymoyamac;
```

* Finally grant privileges
```sql
mocadev=# GRANT USAGE ON SCHEMA moca TO ymoyamac;
```
```sql
mocadev=# GRANT ALL ON SCHEMA moca TO ymoyamac;
```
```sql
mocadev=# GRANT ALL PRIVILEGES ON DATABASE mocadev TO ymoyamac;
```

# Psql commands

### List all users
```sql
postgres=# \du
```
### Create password
```sql
postgres=#\password [user]
```
### List all databases
```sql
postgres=# \l
```
### Connectino
```sql
postgres=# \c mocadev ymoyamac 127.0.0.1 5432
```

* Psql commands
    - link: https://www.postgresql.org/docs/current/app-psql.html
