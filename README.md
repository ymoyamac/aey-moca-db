# Docker

### Create docker container
```bash
$ docker run --name papersandnotes-dev -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres
```
### Execute psql
```bash
$ docker exec -it papersandnotes-dev psql -U postgres  
```

# Postgres

### Create postgres user

* Create user and role: https://www.digitalocean.com/community/tutorials/how-to-use-roles-and-manage-grant-permissions-in-postgresql-on-a-vps-2

```sql
postgres=# CREATE USER ymoyamac;
```
### Create password
```sql
postgres=# CREATE USER ymoyamac WITH PASSWORD ymoyamac;
```
### Create database
```sql
postgres=# CREATE DATABASE pandb;
```

### Grant privileges

* First start as user ***postgres*** into the DB ***postgres***
```bash
docker exec -it papersandnotes-dev psql -U postgres
```
* Second connect to target DB
```sql
postgres=#\c pandb
```
* Finally grant privileges
```sql
pandb=# GRANT USAGE ON SCHEMA public TO ymoyamac;
```
```sql
pandb=# GRANT ALL ON SCHEMA public TO ymoyamac;
```
```sql
pandb=# GRANT ALL PRIVILEGES ON DATABASE pandb TO ymoyamac;
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
postgres=# \c pandb ymoyamac 127.0.0.1 5432
```

* Psql commands
    - link: https://www.postgresql.org/docs/current/app-psql.html
