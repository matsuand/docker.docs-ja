%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Advanced Configuration and Initialization
@y
title: Advanced Configuration and Initialization
@z

@x
description: Configure PostgreSQL initialization scripts, tune performance parameters, and set timezone and locale settings for containerized deployments.
keywords:
  - PostgreSQL Docker
  - Docker Compose PostgreSQL
  - container database
  - PostgreSQL performance tuning
@y
description: Configure PostgreSQL initialization scripts, tune performance parameters, and set timezone and locale settings for containerized deployments.
keywords:
  - PostgreSQL Docker
  - Docker Compose PostgreSQL
  - container database
  - PostgreSQL performance tuning
@z

@x
With persistent storage configured in the previous section, you're ready to customize PostgreSQL for real-world use. This guide covers advanced configuration techniques for running PostgreSQL in Docker containers, including automated database initialization, performance tuning, and timezone configuration.
@y
With persistent storage configured in the previous section, you're ready to customize PostgreSQL for real-world use. This guide covers advanced configuration techniques for running PostgreSQL in Docker containers, including automated database initialization, performance tuning, and timezone configuration.
@z

@x
## Overview
@y
## Overview
@z

@x
While PostgreSQL containers can be started quickly with default settings, production environments require customized configurations. This guide explains how to:
@y
While PostgreSQL containers can be started quickly with default settings, production environments require customized configurations. This guide explains how to:
@z

@x
- Automate database, schema, and user creation during container startup
- Tune PostgreSQL performance parameters for containerized workloads
- Configure timezone and locale settings
@y
- Automate database, schema, and user creation during container startup
- Tune PostgreSQL performance parameters for containerized workloads
- Configure timezone and locale settings
@z

@x
## Initialization scripts
@y
## Initialization scripts
@z

@x
The official PostgreSQL Docker image supports running initialization scripts automatically when the container starts for the first time. Any files placed in the `/docker-entrypoint-initdb.d/` directory are executed in alphabetical order.
@y
The official PostgreSQL Docker image supports running initialization scripts automatically when the container starts for the first time. Any files placed in the `/docker-entrypoint-initdb.d/` directory are executed in alphabetical order.
@z

@x
### How initialization works
@y
### How initialization works
@z

@x
When the container starts, it checks whether the PostgreSQL data directory is empty. If the directory already contains data, PostgreSQL starts immediately without running any initialization. If the directory is empty, the container runs `initdb` to create a new database cluster, then executes all scripts in `/docker-entrypoint-initdb.d/` in alphabetical order before starting PostgreSQL.
@y
When the container starts, it checks whether the PostgreSQL data directory is empty. If the directory already contains data, PostgreSQL starts immediately without running any initialization. If the directory is empty, the container runs `initdb` to create a new database cluster, then executes all scripts in `/docker-entrypoint-initdb.d/` in alphabetical order before starting PostgreSQL.
@z

@x
### Supported file formats
@y
### Supported file formats
@z

@x
| Format | Description |
|--------|-------------|
| `.sql` | SQL commands executed directly |
| `.sql.gz` | Gzip-compressed SQL files |
| `.sh` | Shell scripts executed with bash |
@y
| Format | Description |
|--------|-------------|
| `.sql` | SQL commands executed directly |
| `.sql.gz` | Gzip-compressed SQL files |
| `.sh` | Shell scripts executed with bash |
@z

@x
> [!IMPORTANT]
>
> Initialization scripts only run when the PostgreSQL data directory (`/var/lib/postgresql/data`) is empty. If you mount a volume containing existing data, initialization is skipped. This behavior prevents overwriting existing databases.
@y
> [!IMPORTANT]
>
> Initialization scripts only run when the PostgreSQL data directory (`/var/lib/postgresql/data`) is empty. If you mount a volume containing existing data, initialization is skipped. This behavior prevents overwriting existing databases.
@z

@x
## Mounting initialization scripts
@y
## Mounting initialization scripts
@z

@x
Use Docker Compose to mount initialization scripts into the container. First, create a project directory:
@y
Use Docker Compose to mount initialization scripts into the container. First, create a project directory:
@z

@x
```console
$ mkdir -p postgres-project/init-db
$ cd postgres-project
```
@y
```console
$ mkdir -p postgres-project/init-db
$ cd postgres-project
```
@z

@x
Create a `compose.yaml` file:
@y
Create a `compose.yaml` file:
@z

@x
```yaml
services:
  db:
    image: postgres:18
    volumes:
      - ./init-db:/docker-entrypoint-initdb.d
      - postgres_data:/var/lib/postgresql
    environment:
      POSTGRES_PASSWORD: mysecretpassword
@y
```yaml
services:
  db:
    image: postgres:18
    volumes:
      - ./init-db:/docker-entrypoint-initdb.d
      - postgres_data:/var/lib/postgresql
    environment:
      POSTGRES_PASSWORD: mysecretpassword
@z

@x
volumes:
  postgres_data:
```
@y
volumes:
  postgres_data:
```
@z

@x
All scripts in the `./init-db` directory execute when the container starts for the first time. This is great for bootstrapping databases.
@y
All scripts in the `./init-db` directory execute when the container starts for the first time. This is great for bootstrapping databases.
@z

@x
## Initialization script example
@y
## Initialization script example
@z

@x
Create a file named `init.sql` in your `init-db` directory:
@y
Create a file named `init.sql` in your `init-db` directory:
@z

@x
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
@y
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
@z

@x
This script runs automatically when the container starts for the first time, creating your initial database schema.
@y
This script runs automatically when the container starts for the first time, creating your initial database schema.
@z

@x
> [!NOTE]
>
> Ensure initialization scripts have proper read permissions. If you encounter "Permission denied" errors, run `chmod 644 init-db/*.sql` to make the files readable by the container.
@y
> [!NOTE]
>
> Ensure initialization scripts have proper read permissions. If you encounter "Permission denied" errors, run `chmod 644 init-db/*.sql` to make the files readable by the container.
@z

@x
## Performance tuning
@y
## Performance tuning
@z

@x
Default PostgreSQL settings are conservative to work on systems with limited resources. For production workloads, you should tune these parameters based on your container's allocated resources.
@y
Default PostgreSQL settings are conservative to work on systems with limited resources. For production workloads, you should tune these parameters based on your container's allocated resources.
@z

@x
### Method 1: Custom configuration file
@y
### Method 1: Custom configuration file
@z

@x
For complete control, mount a custom `postgresql.conf` file. First, extract the default configuration:
@y
For complete control, mount a custom `postgresql.conf` file. First, extract the default configuration:
@z

@x
```console
$ docker run -i --rm postgres:18 cat /usr/share/postgresql/postgresql.conf.sample > my-postgres.conf
```
@y
```console
$ docker run -i --rm postgres:18 cat /usr/share/postgresql/postgresql.conf.sample > my-postgres.conf
```
@z

@x
Edit `my-postgres.conf` with your desired settings, then mount it in your Compose file:
@y
Edit `my-postgres.conf` with your desired settings, then mount it in your Compose file:
@z

@x
```yaml
services:
  db:
    image: postgres:18
    volumes:
      - ./my-postgres.conf:/etc/postgresql/postgresql.conf
      - ./init-db:/docker-entrypoint-initdb.d
      - postgres_data:/var/lib/postgresql
    command: postgres -c config_file=/etc/postgresql/postgresql.conf
    environment:
      POSTGRES_PASSWORD: mysecretpassword
@y
```yaml
services:
  db:
    image: postgres:18
    volumes:
      - ./my-postgres.conf:/etc/postgresql/postgresql.conf
      - ./init-db:/docker-entrypoint-initdb.d
      - postgres_data:/var/lib/postgresql
    command: postgres -c config_file=/etc/postgresql/postgresql.conf
    environment:
      POSTGRES_PASSWORD: mysecretpassword
@z

@x
volumes:
  postgres_data:
```
@y
volumes:
  postgres_data:
```
@z

@x
## Key configuration parameters
@y
## Key configuration parameters
@z

@x
The following tables list important `postgresql.conf` parameters for containerized PostgreSQL deployments.
@y
The following tables list important `postgresql.conf` parameters for containerized PostgreSQL deployments.
@z

@x
### Connection settings
@y
### Connection settings
@z

@x
| Parameter | Description | Default |
|-----------|-------------|---------|
| `listen_addresses` | IP addresses to listen on | `localhost` |
| `port` | TCP port number | `5432` |
| `max_connections` | Maximum concurrent connections | `100` |
@y
| Parameter | Description | Default |
|-----------|-------------|---------|
| `listen_addresses` | IP addresses to listen on | `localhost` |
| `port` | TCP port number | `5432` |
| `max_connections` | Maximum concurrent connections | `100` |
@z

@x
### Memory settings
@y
### Memory settings
@z

@x
| Parameter | Description | Recommended starting value |
|-----------|-------------|---------------------------|
| `shared_buffers` | Shared memory for caching | 25% of container memory |
| `work_mem` | Memory per query operation | 4MB - 64MB |
| `maintenance_work_mem` | Memory for VACUUM, CREATE INDEX | 64MB - 256MB |
| `effective_cache_size` | Planner's cache size estimate | 50-75% of container memory |
@y
| Parameter | Description | Recommended starting value |
|-----------|-------------|---------------------------|
| `shared_buffers` | Shared memory for caching | 25% of container memory |
| `work_mem` | Memory per query operation | 4MB - 64MB |
| `maintenance_work_mem` | Memory for VACUUM, CREATE INDEX | 64MB - 256MB |
| `effective_cache_size` | Planner's cache size estimate | 50-75% of container memory |
@z

@x
#### Docker memory limits
@y
#### Docker memory limits
@z

@x
When tuning memory parameters, set explicit memory limits on your container using `deploy.resources.limits.memory` in Compose or `--memory` with `docker run`. Without limits, PostgreSQL sees the host's total RAM and may allocate more than intended. For example, if your container should use 4GB maximum, set `shared_buffers` to approximately 1GB (25%).
@y
When tuning memory parameters, set explicit memory limits on your container using `deploy.resources.limits.memory` in Compose or `--memory` with `docker run`. Without limits, PostgreSQL sees the host's total RAM and may allocate more than intended. For example, if your container should use 4GB maximum, set `shared_buffers` to approximately 1GB (25%).
@z

@x
### I/O settings
@y
### I/O settings
@z

@x
| Parameter | Description | Recommended starting value |
|-----------|-------------|---------------------------|
| `effective_io_concurrency` | Concurrent disk I/O operations | `200` for SSDs, `2` for HDDs |
@y
| Parameter | Description | Recommended starting value |
|-----------|-------------|---------------------------|
| `effective_io_concurrency` | Concurrent disk I/O operations | `200` for SSDs, `2` for HDDs |
@z

@x
### Timeout settings
@y
### Timeout settings
@z

@x
| Parameter | Description | Default |
|-----------|-------------|---------|
| `statement_timeout` | Max time for any statement | `0` (disabled) |
| `lock_timeout` | Max time to wait for a lock | `0` (disabled) |
| `deadlock_timeout` | Time before checking for deadlock | `1s` |
| `transaction_timeout` | Max time for a transaction | `0` (disabled) |
@y
| Parameter | Description | Default |
|-----------|-------------|---------|
| `statement_timeout` | Max time for any statement | `0` (disabled) |
| `lock_timeout` | Max time to wait for a lock | `0` (disabled) |
| `deadlock_timeout` | Time before checking for deadlock | `1s` |
| `transaction_timeout` | Max time for a transaction | `0` (disabled) |
@z

@x
> [!NOTE]
>
> Setting `shared_buffers` too high in a container can exceed kernel shared memory limits. Use no more than 25-30% of the container's memory limit.
@y
> [!NOTE]
>
> Setting `shared_buffers` too high in a container can exceed kernel shared memory limits. Use no more than 25-30% of the container's memory limit.
@z

@x
## Timezone and locale configuration
@y
## Timezone and locale configuration
@z

@x
Proper localization ensures timestamps and sorting behave correctly for your application's users.
@y
Proper localization ensures timestamps and sorting behave correctly for your application's users.
@z

@x
```yaml
services:
  db:
    image: postgres:18
    volumes:
      - postgres_data:/var/lib/postgresql
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro
    environment:
      POSTGRES_PASSWORD: mysecretpassword
      TZ: America/New_York
@y
```yaml
services:
  db:
    image: postgres:18
    volumes:
      - postgres_data:/var/lib/postgresql
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro
    environment:
      POSTGRES_PASSWORD: mysecretpassword
      TZ: America/New_York
@z

@x
volumes:
  postgres_data:
```
@y
volumes:
  postgres_data:
```
@z

@x
Alternatively, set the timezone using a PostgreSQL command-line parameter:
@y
Alternatively, set the timezone using a PostgreSQL command-line parameter:
@z

@x
```yaml
services:
  db:
    image: postgres:18
    command: ["postgres", "-c", "timezone=America/New_York"]
    environment:
      POSTGRES_PASSWORD: mysecretpassword
```
@y
```yaml
services:
  db:
    image: postgres:18
    command: ["postgres", "-c", "timezone=America/New_York"]
    environment:
      POSTGRES_PASSWORD: mysecretpassword
```
@z

@x
### Setting the locale
@y
### Setting the locale
@z

@x
Specify locale settings during database initialization using the `POSTGRES_INITDB_ARGS` environment variable:
@y
Specify locale settings during database initialization using the `POSTGRES_INITDB_ARGS` environment variable:
@z

@x
```yaml
services:
  db:
    image: postgres:18
    volumes:
      - postgres_data:/var/lib/postgresql
    environment:
      POSTGRES_PASSWORD: mysecretpassword
      POSTGRES_INITDB_ARGS: "--encoding=UTF8 --lc-collate=en_US.UTF-8 --lc-ctype=en_US.UTF-8"
@y
```yaml
services:
  db:
    image: postgres:18
    volumes:
      - postgres_data:/var/lib/postgresql
    environment:
      POSTGRES_PASSWORD: mysecretpassword
      POSTGRES_INITDB_ARGS: "--encoding=UTF8 --lc-collate=en_US.UTF-8 --lc-ctype=en_US.UTF-8"
@z

@x
volumes:
  postgres_data:
```
@y
volumes:
  postgres_data:
```
@z

@x
This affects collation (sorting) and character processing behavior. Changing this variable after database creation has no effect—it only applies during the first run when the data directory is initialized.
@y
This affects collation (sorting) and character processing behavior. Changing this variable after database creation has no effect—it only applies during the first run when the data directory is initialized.
@z

@x
## Connecting to the database
@y
## Connecting to the database
@z

@x
You can interact with PostgreSQL running in a container even without `psql` installed on your host machine.
@y
You can interact with PostgreSQL running in a container even without `psql` installed on your host machine.
@z

@x
### Interactive shell
@y
### Interactive shell
@z

@x
Open a `psql` session inside the container:
@y
Open a `psql` session inside the container:
@z

@x
```console
$ docker exec -it postgres-container psql -U postgres
```
@y
```console
$ docker exec -it postgres-container psql -U postgres
```
@z

@x
Connect to a specific database:
@y
Connect to a specific database:
@z

@x
```console
$ docker exec -it postgres-container psql -U postgres -d mydb
```
@y
```console
$ docker exec -it postgres-container psql -U postgres -d mydb
```
@z
