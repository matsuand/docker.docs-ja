%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ �Ή�

@x
title: PostgreSQL specific guide
linkTitle: PostgreSQL
description: Containerize PostgreSQL databases using Docker
keywords: Docker, getting started, postgresql, language
summary: |
  This guide explains how to containerize PostgreSQL databases using
  Docker.
@y
title: PostgreSQL specific guide
linkTitle: PostgreSQL
description: Containerize PostgreSQL databases using Docker
keywords: Docker, getting started, postgresql, language
summary: |
  This guide explains how to containerize PostgreSQL databases using
  Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 ��
@z

@x
## Immediate setup & data persistence
@y
## Immediate setup & data persistence
@z

@x
This guide gets you from zero to a running PostgreSQL container in under five minutes, then explains how to keep your data safe across container restarts and removals.
@y
This guide gets you from zero to a running PostgreSQL container in under five minutes, then explains how to keep your data safe across container restarts and removals.
@z

@x
### Overview
@y
### Overview
@z

@x
Running PostgreSQL in Docker requires understanding one critical concept: containers are ephemeral, but your data shouldn't be. This guide covers:
@y
Running PostgreSQL in Docker requires understanding one critical concept: containers are ephemeral, but your data shouldn't be. This guide covers:
@z

@x
- Starting PostgreSQL with a single command
- Understanding why containers lose data by default
- Configuring volumes for persistent storage
- Translating your setup to Docker Compose
@y
- Starting PostgreSQL with a single command
- Understanding why containers lose data by default
- Configuring volumes for persistent storage
- Translating your setup to Docker Compose
@z

@x
### Quick start (minimal viable container)
@y
### Quick start (minimal viable container)
@z

@x
> [!NOTE]
>
> [Docker Hardened Images (DHIs)](https://docs.docker.com/dhi/) are minimal, secure, and production-ready container base and application images maintained by Docker. DHIs are recommended whenever it is possible for better security. They are designed to reduce vulnerabilities and simplify compliance, freely available to everyone with no subscription required, no usage restrictions, and no vendor lock-in.
@y
> [!NOTE]
>
> [Docker Hardened Images (DHIs)](https://docs.docker.com/dhi/) are minimal, secure, and production-ready container base and application images maintained by Docker. DHIs are recommended whenever it is possible for better security. They are designed to reduce vulnerabilities and simplify compliance, freely available to everyone with no subscription required, no usage restrictions, and no vendor lock-in.
@z

@x
Run PostgreSQL immediately with this single command:
@y
Run PostgreSQL immediately with this single command:
@z

@x
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@y
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@z

@x
You must authenticate to dhi.io before you can pull Docker Hardened Images. Run `docker login dhi.io` to authenticate.
@y
You must authenticate to dhi.io before you can pull Docker Hardened Images. Run `docker login dhi.io` to authenticate.
@z

@x
```console
docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d dhi.io/postgres:18
```
@y
```console
docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d dhi.io/postgres:18
```
@z

@x
{{< /tab >}}
@y
{{< /tab >}}
@z

@x
{{< tab name="Using DOIs" >}}
@y
{{< tab name="Using DOIs" >}}
@z

@x
```console
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d postgres:18
```
@y
```console
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d postgres:18
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
#### Understanding the flags
@y
#### Understanding the flags
@z

@x
| Flag | Purpose |
|------|---------|
| `--rm` | Automatically removes the container when it stops |
| `--name postgres-dev` | Assigns a memorable name instead of a random string |
| `-e POSTGRES_PASSWORD=...` | Sets the superuser password (required) |
| `-p 5432:5432` | Maps host port 5432 to container port 5432 |
| `-d` | Runs the container in the background (detached mode) |
@y
| Flag | Purpose |
|------|---------|
| `--rm` | Automatically removes the container when it stops |
| `--name postgres-dev` | Assigns a memorable name instead of a random string |
| `-e POSTGRES_PASSWORD=...` | Sets the superuser password (required) |
| `-p 5432:5432` | Maps host port 5432 to container port 5432 |
| `-d` | Runs the container in the background (detached mode) |
@z

@x
Verify the container is running:
@y
Verify the container is running:
@z

@x
```console
$ docker ps --filter name=postgres-dev
CONTAINER ID   IMAGE         COMMAND                  STATUS         PORTS                    NAMES
a1b2c3d4e5f6   postgres:18   "docker-entrypoint.s…"   Up 2 seconds   0.0.0.0:5432->5432/tcp   postgres-dev
```
@y
```console
$ docker ps --filter name=postgres-dev
CONTAINER ID   IMAGE         COMMAND                  STATUS         PORTS                    NAMES
a1b2c3d4e5f6   postgres:18   "docker-entrypoint.s…"   Up 2 seconds   0.0.0.0:5432->5432/tcp   postgres-dev
```
@z

@x
Connect using `psql` from inside the container:
@y
Connect using `psql` from inside the container:
@z

@x
```console
$ docker exec -it postgres-dev psql -U postgres
psql (18.0)
Type "help" for help.
@y
```console
$ docker exec -it postgres-dev psql -U postgres
psql (18.0)
Type "help" for help.
@z

@x
postgres=#
```
@y
postgres=#
```
@z

@x
You now have a working PostgreSQL instance. But there's a problem—stop this container and your data disappears.
@y
You now have a working PostgreSQL instance. But there's a problem—stop this container and your data disappears.
@z

@x
### The data persistence problem
@y
### The data persistence problem
@z

@x
Containers use an ephemeral filesystem. When a container is removed, everything inside it, including your database files, is deleted.
@y
Containers use an ephemeral filesystem. When a container is removed, everything inside it, including your database files, is deleted.
@z

@x
Demonstrate this yourself:
@y
Demonstrate this yourself:
@z

@x
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@y
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@z

@x
```console
$ docker exec postgres-dev psql -U postgres -c "CREATE DATABASE testdb;"
CREATE DATABASE
@y
```console
$ docker exec postgres-dev psql -U postgres -c "CREATE DATABASE testdb;"
CREATE DATABASE
@z

@x
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
 testdb    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
@y
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
 testdb    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
@z

@x
$ docker stop postgres-dev
postgres-dev
@y
$ docker stop postgres-dev
postgres-dev
@z

@x
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d dhi.io/postgres:18
@y
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d dhi.io/postgres:18
@z

@x
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
(no output - database is gone)
```
@y
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
(no output - database is gone)
```
@z

@x
{{< /tab >}}
@y
{{< /tab >}}
@z

@x
{{< tab name="Using DOIs" >}}
@y
{{< tab name="Using DOIs" >}}
@z

@x
```console
$ docker exec postgres-dev psql -U postgres -c "CREATE DATABASE testdb;"
CREATE DATABASE
@y
```console
$ docker exec postgres-dev psql -U postgres -c "CREATE DATABASE testdb;"
CREATE DATABASE
@z

@x
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
 testdb    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
@y
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
 testdb    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
@z

@x
$ docker stop postgres-dev
postgres-dev
@y
$ docker stop postgres-dev
postgres-dev
@z

@x
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d postgres:18
@y
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -d postgres:18
@z

@x
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
(no output - database is gone)
```
@y
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
(no output - database is gone)
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Your `testdb` database vanished because the new container started with a fresh filesystem. This is expected behavior—and exactly why volumes exist.
@y
Your `testdb` database vanished because the new container started with a fresh filesystem. This is expected behavior—and exactly why volumes exist.
@z

@x
### Named volumes
@y
### Named volumes
@z

@x
Named volumes are Docker-managed storage locations that persist independently of containers. Docker handles the filesystem location, permissions, and lifecycle.
@y
Named volumes are Docker-managed storage locations that persist independently of containers. Docker handles the filesystem location, permissions, and lifecycle.
@z

@x
Create a container with a named volume:
@y
Create a container with a named volume:
@z

@x
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@y
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@z

@x
You must authenticate to dhi.io before you can pull Docker Hardened Images. Run `docker login dhi.io` to authenticate.
@y
You must authenticate to dhi.io before you can pull Docker Hardened Images. Run `docker login dhi.io` to authenticate.
@z

@x
```console
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  -d dhi.io/postgres:18
```
@y
```console
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  -d dhi.io/postgres:18
```
@z

@x
{{< /tab >}}
@y
{{< /tab >}}
@z

@x
{{< tab name="Using DOIs" >}}
@y
{{< tab name="Using DOIs" >}}
@z

@x
```console
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  -d postgres:18
```
@y
```console
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  -d postgres:18
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
The `-v postgres_data:/var/lib/postgresql` flag mounts a named volume called `postgres_data` to PostgreSQL's data directory. If the volume doesn't exist, Docker creates it automatically.
@y
The `-v postgres_data:/var/lib/postgresql` flag mounts a named volume called `postgres_data` to PostgreSQL's data directory. If the volume doesn't exist, Docker creates it automatically.
@z

@x
> [!NOTE]
>
> PostgreSQL 18+ stores data in a version-specific subdirectory under `/var/lib/postgresql`. Mounting at this level (rather than `/var/lib/postgresql/data`) allows for easier upgrades using `pg_upgrade --link`.
@y
> [!NOTE]
>
> PostgreSQL 18+ stores data in a version-specific subdirectory under `/var/lib/postgresql`. Mounting at this level (rather than `/var/lib/postgresql/data`) allows for easier upgrades using `pg_upgrade --link`.
@z

@x
#### Verify persistence works
@y
#### Verify persistence works
@z

@x
To verify data persistence, repeat the previous test, but this time with the named volume attached in place.
@y
To verify data persistence, repeat the previous test, but this time with the named volume attached in place.
@z

@x
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@y
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@z

@x
```console
$ docker exec postgres-dev psql -U postgres -c "CREATE DATABASE testdb;"
CREATE DATABASE
@y
```console
$ docker exec postgres-dev psql -U postgres -c "CREATE DATABASE testdb;"
CREATE DATABASE
@z

@x
$ docker stop postgres-dev
postgres-dev
@y
$ docker stop postgres-dev
postgres-dev
@z

@x
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  -d dhi.io/postgres:18
@y
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  -d dhi.io/postgres:18
@z

@x
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
 testdb    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
```
@y
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
 testdb    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
```
@z

@x
{{< /tab >}}
@y
{{< /tab >}}
@z

@x
{{< tab name="Using DOIs" >}}
@y
{{< tab name="Using DOIs" >}}
@z

@x
```console
$ docker exec postgres-dev psql -U postgres -c "CREATE DATABASE testdb;"
CREATE DATABASE
@y
```console
$ docker exec postgres-dev psql -U postgres -c "CREATE DATABASE testdb;"
CREATE DATABASE
@z

@x
$ docker stop postgres-dev
postgres-dev
@y
$ docker stop postgres-dev
postgres-dev
@z

@x
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  -d postgres:18
@y
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  -d postgres:18
@z

@x
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
 testdb    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
```
@y
$ docker exec postgres-dev psql -U postgres -c "\l" | grep testdb
 testdb    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
```
@z

@x
{{< /tab >}}
@y
{{< /tab >}}
@z

@x
{{< /tabs >}}
@y
{{< /tabs >}}
@z

@x
If you see `testdb` in the output, persistence works: The database survived because the volume preserved the data directory.
@y
If you see `testdb` in the output, persistence works: The database survived because the volume preserved the data directory.
@z

@x
#### Managing volumes
@y
#### Managing volumes
@z

@x
List all volumes:
@y
List all volumes:
@z

@x
```console
$ docker volume ls --filter name=postgres_data
DRIVER    VOLUME NAME
local     postgres_data
```
@y
```console
$ docker volume ls --filter name=postgres_data
DRIVER    VOLUME NAME
local     postgres_data
```
@z

@x
Inspect a volume to see its details:
@y
Inspect a volume to see its details:
@z

@x
```console
$ docker volume inspect postgres_data
[
    {
        "CreatedAt": "2025-01-05T10:30:00Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/postgres_data/_data",
        "Name": "postgres_data",
        "Options": null,
        "Scope": "local"
    }
]
```
@y
```console
$ docker volume inspect postgres_data
[
    {
        "CreatedAt": "2025-01-05T10:30:00Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/postgres_data/_data",
        "Name": "postgres_data",
        "Options": null,
        "Scope": "local"
    }
]
```
@z

@x
Remove an unused volume (warning: this deletes all data):
@y
Remove an unused volume (warning: this deletes all data):
@z

@x
```console
$ docker volume rm postgres_data
```
@y
```console
$ docker volume rm postgres_data
```
@z

@x
### Bind mounts (alternative)
@y
### Bind mounts (alternative)
@z

@x
Bind mounts map a specific host directory to a container path. Unlike named volumes, you control exactly where data lives on the host filesystem.
@y
Bind mounts map a specific host directory to a container path. Unlike named volumes, you control exactly where data lives on the host filesystem.
@z

@x
Create a directory on your host machine to store Postgres data.
@y
Create a directory on your host machine to store Postgres data.
@z

@x
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@y
{{< tabs >}}
{{< tab name="Using DHIs" >}}
@z

@x
```console
mkdir -p ~/postgres-data && sudo chown -R 999:999 ~/postgres-data
```
@y
```console
mkdir -p ~/postgres-data && sudo chown -R 999:999 ~/postgres-data
```
@z

@x
Run Postgres using a bind mount.
@y
Run Postgres using a bind mount.
@z

@x
```console
docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v ~/postgres-data:/var/lib/postgresql \
  -d dhi.io/postgres:18
```
@y
```console
docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v ~/postgres-data:/var/lib/postgresql \
  -d dhi.io/postgres:18
```
@z

@x
{{< /tab >}}
@y
{{< /tab >}}
@z

@x
{{< tab name="Using DOIs" >}}
@y
{{< tab name="Using DOIs" >}}
@z

@x
```console
$ mkdir -p ~/postgres-data
```
@y
```console
$ mkdir -p ~/postgres-data
```
@z

@x
Run Postgres using a bind mount.
@y
Run Postgres using a bind mount.
@z

@x
```console
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v ~/postgres-data:/var/lib/postgresql \
  -d postgres:18
```
@y
```console
$ docker run --rm --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v ~/postgres-data:/var/lib/postgresql \
  -d postgres:18
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
#### When to use bind mounts
@y
#### When to use bind mounts
@z

@x
Bind mounts are useful when you need direct filesystem access to the data directory for backup scripts that read files directly, when integrating with host-level monitoring tools, or when specific permission requirements exist. For most development and production scenarios, named volumes are simpler and less error-prone.
@y
Bind mounts are useful when you need direct filesystem access to the data directory for backup scripts that read files directly, when integrating with host-level monitoring tools, or when specific permission requirements exist. For most development and production scenarios, named volumes are simpler and less error-prone.
@z

@x
#### Common bind mount issues
@y
#### Common bind mount issues
@z

@x
Permission errors are the most frequent problem with bind mounts. PostgreSQL runs as user `postgres` (UID 999) inside the container. If your host directory has restrictive permissions, the container fails to start.
@y
Permission errors are the most frequent problem with bind mounts. PostgreSQL runs as user `postgres` (UID 999) inside the container. If your host directory has restrictive permissions, the container fails to start.
@z

@x
Check logs if the container exits immediately:
@y
Check logs if the container exits immediately:
@z

@x
```console
$ docker logs postgres-dev
```
@y
```console
$ docker logs postgres-dev
```
@z

@x
### Docker Compose configuration
@y
### Docker Compose configuration
@z

@x
Docker Compose captures your entire configuration in a file, making setups reproducible and easier to manage as complexity grows.
@y
Docker Compose captures your entire configuration in a file, making setups reproducible and easier to manage as complexity grows.
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
    container_name: postgres-dev
    environment:
      POSTGRES_PASSWORD: mysecretpassword
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql
@y
```yaml
services:
  db:
    image: postgres:18
    container_name: postgres-dev
    environment:
      POSTGRES_PASSWORD: mysecretpassword
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql
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
Start the database:
@y
Start the database:
@z

@x
```console
$ docker compose up -d
```
@y
```console
$ docker compose up -d
```
@z

@x
Stop and remove containers (volume persists):
@y
Stop and remove containers (volume persists):
@z

@x
```console
$ docker compose down
```
@y
```console
$ docker compose down
```
@z

@x
Alternatively, you can stop, remove containers, and delete the volume:
@y
Alternatively, you can stop, remove containers, and delete the volume:
@z

@x
```console
$ docker compose down -v
```
@y
```console
$ docker compose down -v
```
@z

@x
This compose file becomes the foundation for adding initialization scripts, performance tuning, and companion services covered in subsequent guides.
@y
This compose file becomes the foundation for adding initialization scripts, performance tuning, and companion services covered in subsequent guides.
@z

@x
#### Environment variables reference
@y
#### Environment variables reference
@z

@x
The official PostgreSQL image supports these environment variables:
@y
The official PostgreSQL image supports these environment variables:
@z

@x
| Variable | Required | Description |
|----------|----------|-------------|
| `POSTGRES_PASSWORD` | Yes | Superuser password |
| `POSTGRES_USER` | No | Superuser name (default: `postgres`) |
| `POSTGRES_DB` | No | Default database name (default: value of `POSTGRES_USER`) |
@y
| Variable | Required | Description |
|----------|----------|-------------|
| `POSTGRES_PASSWORD` | Yes | Superuser password |
| `POSTGRES_USER` | No | Superuser name (default: `postgres`) |
| `POSTGRES_DB` | No | Default database name (default: value of `POSTGRES_USER`) |
@z

@x
### Next steps
@y
### Next steps
@z

@x
With persistent storage configured, you're ready to customize PostgreSQL further. The next chapter of the guide covers:
@y
With persistent storage configured, you're ready to customize PostgreSQL further. The next chapter of the guide covers:
@z

@x
- Automated schema creation with initialization scripts
- Performance tuning for containerized workloads
- Timezone and locale configuration
@y
- Automated schema creation with initialization scripts
- Performance tuning for containerized workloads
- Timezone and locale configuration
@z

@x
## Advanced Configuration and Initialization
@y
## Advanced Configuration and Initialization
@z

@x
With persistent storage configured in the previous section, you're ready to customize PostgreSQL for real-world use. This guide covers advanced configuration techniques for running PostgreSQL in Docker containers, including automated database initialization, performance tuning, and timezone configuration.
@y
With persistent storage configured in the previous section, you're ready to customize PostgreSQL for real-world use. This guide covers advanced configuration techniques for running PostgreSQL in Docker containers, including automated database initialization, performance tuning, and timezone configuration.
@z

@x
### Overview
@y
### Overview
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
### Initialization scripts
@y
### Initialization scripts
@z

@x
The official PostgreSQL Docker image supports running initialization scripts automatically when the container starts for the first time. Any files placed in the `/docker-entrypoint-initdb.d/` directory are executed in alphabetical order.
@y
The official PostgreSQL Docker image supports running initialization scripts automatically when the container starts for the first time. Any files placed in the `/docker-entrypoint-initdb.d/` directory are executed in alphabetical order.
@z

@x
#### How initialization works
@y
#### How initialization works
@z

@x
When the container starts, it checks whether the PostgreSQL data directory is empty. If the directory already contains data, PostgreSQL starts immediately without running any initialization. If the directory is empty, the container runs `initdb` to create a new database cluster, then executes all scripts in `/docker-entrypoint-initdb.d/` in alphabetical order before starting PostgreSQL.
@y
When the container starts, it checks whether the PostgreSQL data directory is empty. If the directory already contains data, PostgreSQL starts immediately without running any initialization. If the directory is empty, the container runs `initdb` to create a new database cluster, then executes all scripts in `/docker-entrypoint-initdb.d/` in alphabetical order before starting PostgreSQL.
@z

@x
#### Supported file formats
@y
#### Supported file formats
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
### Mounting initialization scripts
@y
### Mounting initialization scripts
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
### Initialization script example
@y
### Initialization script example
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
### Performance tuning
@y
### Performance tuning
@z

@x
Default PostgreSQL settings are conservative to work on systems with limited resources. For production workloads, you should tune these parameters based on your container's allocated resources.
@y
Default PostgreSQL settings are conservative to work on systems with limited resources. For production workloads, you should tune these parameters based on your container's allocated resources.
@z

@x
#### Method 1: Custom configuration file
@y
#### Method 1: Custom configuration file
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
### Key configuration parameters
@y
### Key configuration parameters
@z

@x
The following tables list important `postgresql.conf` parameters for containerized PostgreSQL deployments.
@y
The following tables list important `postgresql.conf` parameters for containerized PostgreSQL deployments.
@z

@x
#### Connection settings
@y
#### Connection settings
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
#### Memory settings
@y
#### Memory settings
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
##### Docker memory limits
@y
##### Docker memory limits
@z

@x
When tuning memory parameters, set explicit memory limits on your container using `deploy.resources.limits.memory` in Compose or `--memory` with `docker run`. Without limits, PostgreSQL sees the host's total RAM and may allocate more than intended. For example, if your container should use 4GB maximum, set `shared_buffers` to approximately 1GB (25%).
@y
When tuning memory parameters, set explicit memory limits on your container using `deploy.resources.limits.memory` in Compose or `--memory` with `docker run`. Without limits, PostgreSQL sees the host's total RAM and may allocate more than intended. For example, if your container should use 4GB maximum, set `shared_buffers` to approximately 1GB (25%).
@z

@x
#### I/O settings
@y
#### I/O settings
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
#### Timeout settings
@y
#### Timeout settings
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
### Timezone and locale configuration
@y
### Timezone and locale configuration
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
#### Setting the locale
@y
#### Setting the locale
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
### Connecting to the database
@y
### Connecting to the database
@z

@x
You can interact with PostgreSQL running in a container even without `psql` installed on your host machine.
@y
You can interact with PostgreSQL running in a container even without `psql` installed on your host machine.
@z

@x
#### Interactive shell
@y
#### Interactive shell
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

@x
## Networking and connectivity
@y
## Networking and connectivity
@z

@x
This guide covers two common ways to connect to PostgreSQL running in Docker:
@y
This guide covers two common ways to connect to PostgreSQL running in Docker:
@z

@x
- Container-to-container: Connect from your application container to PostgreSQL over a private Docker network. No ports need to be exposed to the host.
- Host-to-container: Connect from your laptop or development machine using `localhost` and a published port.
@y
- Container-to-container: Connect from your application container to PostgreSQL over a private Docker network. No ports need to be exposed to the host.
- Host-to-container: Connect from your laptop or development machine using `localhost` and a published port.
@z

@x
Prerequisite: This guide assumes you have PostgreSQL running with persistent storage. If you don't, follow the [Immediate Setup & Data Persistence](/guides/postgresql/immediate-setup-and-data-persistence/) guide first.
@y
Prerequisite: This guide assumes you have PostgreSQL running with persistent storage. If you don't, follow the [Immediate Setup & Data Persistence](__SUBDIR__/guides/postgresql/immediate-setup-and-data-persistence/) guide first.
@z

@x
### Internal network access (container-to-container)
@y
### Internal network access (container-to-container)
@z

@x
When your application runs in another container, connecting to PostgreSQL through a user-defined bridge network is the recommended approach. This setup provides automatic DNS resolution, so your application can connect to PostgreSQL using the container name as the hostname, without needing to track IP addresses.
@y
When your application runs in another container, connecting to PostgreSQL through a user-defined bridge network is the recommended approach. This setup provides automatic DNS resolution, so your application can connect to PostgreSQL using the container name as the hostname, without needing to track IP addresses.
@z

@x
> [!NOTE]
> Why not use the default bridge network? While containers on the default bridge network can communicate, they can only do so by IP address. Since container IP addresses change when containers restart, this would require updating your PostgreSQL connection strings each time. User-defined bridge networks solve this by providing automatic DNS resolution, ensuring your PostgreSQL connection strings remain stable even if containers restart and receive new IP addresses.
@y
> [!NOTE]
> Why not use the default bridge network? While containers on the default bridge network can communicate, they can only do so by IP address. Since container IP addresses change when containers restart, this would require updating your PostgreSQL connection strings each time. User-defined bridge networks solve this by providing automatic DNS resolution, ensuring your PostgreSQL connection strings remain stable even if containers restart and receive new IP addresses.
@z

@x
Here's a quick comparison:
@y
Here's a quick comparison:
@z

@x
> [!NOTE]
>
> The following examples show the difference in approach. To actually test this, follow the steps in this guide to set up containers on the appropriate networks first.
@y
> [!NOTE]
>
> The following examples show the difference in approach. To actually test this, follow the steps in this guide to set up containers on the appropriate networks first.
@z

@x
With the default bridge network, you'd need to find the IP address first:
```bash
# Get the container's IP address (changes on restart)
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres-dev
# Output: 172.17.0.2
@y
With the default bridge network, you'd need to find the IP address first:
```bash
# Get the container's IP address (changes on restart)
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres-dev
# Output: 172.17.0.2
@z

@x
# Then connect using that IP address from another container
# (No --network flag needed - containers default to bridge network)
docker run --rm -it \
  -e PGPASSWORD=mysecretpassword \
  postgres:18 \
  psql -h 172.17.0.2 -U postgres
```
@y
# Then connect using that IP address from another container
# (No --network flag needed - containers default to bridge network)
docker run --rm -it \
  -e PGPASSWORD=mysecretpassword \
  postgres:18 \
  psql -h 172.17.0.2 -U postgres
```
@z

@x
With a user-defined network, you simply use the container name:
```bash
# Container name works directly - no IP lookup needed
docker run --rm -it \
  --network my-app-net \
  -e PGPASSWORD=mysecretpassword \
  postgres:18 \
  psql -h postgres-dev -U postgres
```
@y
With a user-defined network, you simply use the container name:
```bash
# Container name works directly - no IP lookup needed
docker run --rm -it \
  --network my-app-net \
  -e PGPASSWORD=mysecretpassword \
  postgres:18 \
  psql -h postgres-dev -U postgres
```
@z

@x
#### Step 1: Create a user-defined network
@y
#### Step 1: Create a user-defined network
@z

@x
```bash
docker network create my-app-net
@y
```bash
docker network create my-app-net
@z

@x
# Example Output
ab7f984be43a0ca15534a9ee568716ddbe869a5875077fad3ef3192e3af7d288
@y
# Example Output
ab7f984be43a0ca15534a9ee568716ddbe869a5875077fad3ef3192e3af7d288
@z

@x
docker network ls
# Output
ab7f984be43a   my-app-net    bridge    local
@y
docker network ls
# Output
ab7f984be43a   my-app-net    bridge    local
@z

@x
```
@y
```
@z

@x
#### Step 2: Run PostgreSQL on that network (no port publishing)
@y
#### Step 2: Run PostgreSQL on that network (no port publishing)
@z

@x
Notice there is no `-p 5432:5432` here. This keeps PostgreSQL internal to Docker and not accessible from the host machine, which is more secure for production environments.
@y
Notice there is no `-p 5432:5432` here. This keeps PostgreSQL internal to Docker and not accessible from the host machine, which is more secure for production environments.
@z

@x
```bash
docker run -d --name postgres-dev \
  --network my-app-net \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -v postgres_data:/var/lib/postgresql \
  postgres:18
@y
```bash
docker run -d --name postgres-dev \
  --network my-app-net \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -v postgres_data:/var/lib/postgresql \
  postgres:18
@z

@x
  # Output
CONTAINER ID  IMAGE        COMMAND                 CREATED         STATUS        PORTS     NAMES
6d351ed89efc  postgres:18  "docker-entrypoint.s…"  9 seconds ago   Up 8 seconds  5432/tcp  postgres-dev
@y
  # Output
CONTAINER ID  IMAGE        COMMAND                 CREATED         STATUS        PORTS     NAMES
6d351ed89efc  postgres:18  "docker-entrypoint.s…"  9 seconds ago   Up 8 seconds  5432/tcp  postgres-dev
@z

@x
```
@y
```
@z

@x
#### Step 3: Connect from another container using the Postgres container name
@y
#### Step 3: Connect from another container using the Postgres container name
@z

@x
You can test connectivity with a temporary `psql` client container:
@y
You can test connectivity with a temporary `psql` client container:
@z

@x
```bash
docker run --rm -it \
  --network my-app-net \
  -e PGPASSWORD=mysecretpassword \
  postgres:18 \
  psql -h postgres-dev -U postgres
```
@y
```bash
docker run --rm -it \
  --network my-app-net \
  -e PGPASSWORD=mysecretpassword \
  postgres:18 \
  psql -h postgres-dev -U postgres
```
@z

@x
Key point: `-h postgres-dev` works because Docker DNS resolves the container name on a user-defined network. The container name acts as the hostname.
@y
Key point: `-h postgres-dev` works because Docker DNS resolves the container name on a user-defined network. The container name acts as the hostname.
@z

@x
#### Connection string examples
@y
#### Connection string examples
@z

@x
When connecting from your application container, use these PostgreSQL connection strings:
@y
When connecting from your application container, use these PostgreSQL connection strings:
@z

@x
- PostgreSQL URI format:
  This is the standard PostgreSQL connection URI format that combines all connection parameters into a single string, widely supported by PostgreSQL clients and libraries.
@y
- PostgreSQL URI format:
  This is the standard PostgreSQL connection URI format that combines all connection parameters into a single string, widely supported by PostgreSQL clients and libraries.
@z

@x
  ```bash
  postgresql://postgres:mysecretpassword@postgres-dev:5432/postgres
  ```
@y
  ```bash
  postgresql://postgres:mysecretpassword@postgres-dev:5432/postgres
  ```
@z

@x
  This command demonstrates passing a PostgreSQL URI connection string as an environment variable to a container, which your application can then read to connect to the database.
@y
  This command demonstrates passing a PostgreSQL URI connection string as an environment variable to a container, which your application can then read to connect to the database.
@z

@x
  Example usage in a Docker run command:
  ```bash
  docker run --rm -it \
    --network my-app-net \
    -e DATABASE_URL="postgresql://postgres:mysecretpassword@postgres-dev:5432/postgres" \
    alpine:latest \
    sh -c 'echo "DATABASE_URL is set to: $DATABASE_URL"'
  ```
@y
  Example usage in a Docker run command:
  ```bash
  docker run --rm -it \
    --network my-app-net \
    -e DATABASE_URL="postgresql://postgres:mysecretpassword@postgres-dev:5432/postgres" \
    alpine:latest \
    sh -c 'echo "DATABASE_URL is set to: $DATABASE_URL"'
  ```
@z

@x
- PostgreSQL connection parameters:
  This format uses key-value pairs separated by spaces, which many PostgreSQL client libraries accept as an alternative to URI format.
  ```bash
  host=postgres-dev
  port=5432
  user=postgres
  password=mysecretpassword
  dbname=postgres
  ```
@y
- PostgreSQL connection parameters:
  This format uses key-value pairs separated by spaces, which many PostgreSQL client libraries accept as an alternative to URI format.
  ```bash
  host=postgres-dev
  port=5432
  user=postgres
  password=mysecretpassword
  dbname=postgres
  ```
@z

@x
  Example usage in application code (Python with psycopg2):
  ```python
  conn = psycopg2.connect(
      host="postgres-dev",
      port=5432,
      user="postgres",
      password="mysecretpassword",
      dbname="postgres"
  )
  ```
@y
  Example usage in application code (Python with psycopg2):
  ```python
  conn = psycopg2.connect(
      host="postgres-dev",
      port=5432,
      user="postgres",
      password="mysecretpassword",
      dbname="postgres"
  )
  ```
@z

@x
- Connecting to a specific database:
  Replace the database name in the connection string to connect to a specific database instead of the default `postgres` database.
  If you created a custom database (e.g., `testdb`), use:
  ```bash
  postgresql://postgres:mysecretpassword@postgres-dev:5432/testdb
  ```
@y
- Connecting to a specific database:
  Replace the database name in the connection string to connect to a specific database instead of the default `postgres` database.
  If you created a custom database (e.g., `testdb`), use:
  ```bash
  postgresql://postgres:mysecretpassword@postgres-dev:5432/testdb
  ```
@z

@x
  Example with SSL disabled (common in Docker networks):
  Add `?sslmode=disable` to the connection string when connecting within a private Docker network where SSL encryption isn't required.
  ```bash
  postgresql://postgres:mysecretpassword@postgres-dev:5432/testdb?sslmode=disable
  ```
@y
  Example with SSL disabled (common in Docker networks):
  Add `?sslmode=disable` to the connection string when connecting within a private Docker network where SSL encryption isn't required.
  ```bash
  postgresql://postgres:mysecretpassword@postgres-dev:5432/testdb?sslmode=disable
  ```
@z

@x
> [!NOTE]
>
> The default port `5432` is used in these examples. If you're connecting to a different PostgreSQL instance or have changed the port, update the connection string accordingly. The container name (`postgres-dev`) is resolved by Docker DNS to the container's IP address on the network.
@y
> [!NOTE]
>
> The default port `5432` is used in these examples. If you're connecting to a different PostgreSQL instance or have changed the port, update the connection string accordingly. The container name (`postgres-dev`) is resolved by Docker DNS to the container's IP address on the network.
@z

@x
### Connecting from the host (external access)
@y
### Connecting from the host (external access)
@z

@x
To connect to PostgreSQL from your host machine using tools like `psql`, `pgAdmin`, `DBeaver`, or database management scripts, you need to publish PostgreSQL's port (`5432`) to the host. This allows external tools to reach the PostgreSQL container.
@y
To connect to PostgreSQL from your host machine using tools like `psql`, `pgAdmin`, `DBeaver`, or database management scripts, you need to publish PostgreSQL's port (`5432`) to the host. This allows external tools to reach the PostgreSQL container.
@z

@x
#### Expose Postgres to localhost only (recommended for development)
@y
#### Expose Postgres to localhost only (recommended for development)
@z

@x
This binds to `127.0.0.1` so it's only reachable from your local machine, not from other devices on your network. This is the most secure option for development.
@y
This binds to `127.0.0.1` so it's only reachable from your local machine, not from other devices on your network. This is the most secure option for development.
@z

@x
```bash
docker run -d --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 127.0.0.1:5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  postgres:18
```
@y
```bash
docker run -d --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 127.0.0.1:5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  postgres:18
```
@z

@x
Now connect from your host:
@y
Now connect from your host:
@z

@x
- Host: `localhost` or `127.0.0.1`
- Port: `5432`
@y
- Host: `localhost` or `127.0.0.1`
- Port: `5432`
@z

@x
If you have `psql` installed on your host:
```bash
psql -h localhost -p 5432 -U postgres
```
@y
If you have `psql` installed on your host:
```bash
psql -h localhost -p 5432 -U postgres
```
@z

@x
You'll be prompted for the password. Alternatively, you can use the `PGPASSWORD` environment variable:
```bash
PGPASSWORD=mysecretpassword psql -h localhost -p 5432 -U postgres
```
@y
You'll be prompted for the password. Alternatively, you can use the `PGPASSWORD` environment variable:
```bash
PGPASSWORD=mysecretpassword psql -h localhost -p 5432 -U postgres
```
@z

@x
#### Connecting with PostgreSQL GUI tools
@y
#### Connecting with PostgreSQL GUI tools
@z

@x
Popular PostgreSQL GUI tools can connect using these common connection details: Host: `localhost`, Port: `5432`, User: `postgres`, Database: `postgres` (or your database name).
@y
Popular PostgreSQL GUI tools can connect using these common connection details: Host: `localhost`, Port: `5432`, User: `postgres`, Database: `postgres` (or your database name).
@z

@x
- pgAdmin: A web-based PostgreSQL administration and development platform
- DBeaver: A universal database tool that supports PostgreSQL and many other databases. Select PostgreSQL as the connection type
- TablePlus: A modern, native database management tool for macOS and Windows with a clean interface
@y
- pgAdmin: A web-based PostgreSQL administration and development platform
- DBeaver: A universal database tool that supports PostgreSQL and many other databases. Select PostgreSQL as the connection type
- TablePlus: A modern, native database management tool for macOS and Windows with a clean interface
@z

@x
All tools will prompt for the password you set with `POSTGRES_PASSWORD`.
@y
All tools will prompt for the password you set with `POSTGRES_PASSWORD`.
@z

@x
#### Expose Postgres to all network interfaces (use with caution)
@y
#### Expose Postgres to all network interfaces (use with caution)
@z

@x
To allow connections from other devices on your network, use `-p 5432:5432` instead of `-p 127.0.0.1:5432:5432`. This binds PostgreSQL to all network interfaces on your host, making it accessible from any device that can reach your host, not just localhost.
@y
To allow connections from other devices on your network, use `-p 5432:5432` instead of `-p 127.0.0.1:5432:5432`. This binds PostgreSQL to all network interfaces on your host, making it accessible from any device that can reach your host, not just localhost.
@z

@x
```bash
docker run -d --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  postgres:18
```
@y
```bash
docker run -d --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql \
  postgres:18
```
@z

@x
> [!WARNING]
>
> Exposing PostgreSQL to all network interfaces (`0.0.0.0:5432`) makes it accessible from any device that can reach your host. Only use this in trusted network environments or behind a firewall. For production, consider using a reverse proxy or VPN instead.
@y
> [!WARNING]
>
> Exposing PostgreSQL to all network interfaces (`0.0.0.0:5432`) makes it accessible from any device that can reach your host. Only use this in trusted network environments or behind a firewall. For production, consider using a reverse proxy or VPN instead.
@z

@x
#### PostgreSQL security considerations for external access
@y
#### PostgreSQL security considerations for external access
@z

@x
When exposing PostgreSQL to external access, follow these PostgreSQL-specific security practices:
@y
When exposing PostgreSQL to external access, follow these PostgreSQL-specific security practices:
@z

@x
- Avoid using the `postgres` superuser: The default `postgres` user has full database privileges. Create dedicated users with only the permissions your application needs.
- Use strong passwords: PostgreSQL passwords should be complex. Consider using environment variables or secrets management instead of `hardcoding` passwords.
- Limit network exposure: Binding to `127.0.0.1` (localhost only) is safer than exposing to all interfaces (`0.0.0.0`).
- Consider SSL/TLS: For production, configure PostgreSQL to require SSL connections. The [Advanced Configuration and Initialization](/guides/postgresql/advanced-configuration-and-initialization/) guide shows how to configure PostgreSQL settings.
- Create application-specific users: Use initialization scripts to create users with limited privileges. For example, a read-only user for reporting or a user that can only access specific databases.
@y
- Avoid using the `postgres` superuser: The default `postgres` user has full database privileges. Create dedicated users with only the permissions your application needs.
- Use strong passwords: PostgreSQL passwords should be complex. Consider using environment variables or secrets management instead of `hardcoding` passwords.
- Limit network exposure: Binding to `127.0.0.1` (localhost only) is safer than exposing to all interfaces (`0.0.0.0`).
- Consider SSL/TLS: For production, configure PostgreSQL to require SSL connections. The [Advanced Configuration and Initialization](__SUBDIR__/guides/postgresql/advanced-configuration-and-initialization/) guide shows how to configure PostgreSQL settings.
- Create application-specific users: Use initialization scripts to create users with limited privileges. For example, a read-only user for reporting or a user that can only access specific databases.
@z

@x
The [Advanced configuration and initialization](/guides/postgresql/advanced-configuration-and-initialization/) guide shows how to use initialization scripts to create users and roles automatically.
@y
The [Advanced configuration and initialization](__SUBDIR__/guides/postgresql/advanced-configuration-and-initialization/) guide shows how to use initialization scripts to create users and roles automatically.
@z

@x
### Using Docker Compose for networking
@y
### Using Docker Compose for networking
@z

@x
Docker Compose automatically creates a network for your services, making networking configuration simpler. Here's an example that combines both internal and external access:
@y
Docker Compose automatically creates a network for your services, making networking configuration simpler. Here's an example that combines both internal and external access:
@z

@x
```yaml
services:
  db:
    image: postgres:18
    container_name: postgres-dev
    environment:
      POSTGRES_PASSWORD: mysecretpassword
    volumes:
      - postgres_data:/var/lib/postgresql
    ports:
      - "127.0.0.1:5432:5432"  # Expose to localhost only
    networks:
      - app-network
@y
```yaml
services:
  db:
    image: postgres:18
    container_name: postgres-dev
    environment:
      POSTGRES_PASSWORD: mysecretpassword
    volumes:
      - postgres_data:/var/lib/postgresql
    ports:
      - "127.0.0.1:5432:5432"  # Expose to localhost only
    networks:
      - app-network
@z

@x
  app:
    build: ./my-app
    environment:
      DATABASE_URL: postgresql://postgres:mysecretpassword@db:5432/mydb
    networks:
      - app-network
    depends_on:
      - db
@y
  app:
    build: ./my-app
    environment:
      DATABASE_URL: postgresql://postgres:mysecretpassword@db:5432/mydb
    networks:
      - app-network
    depends_on:
      - db
@z

@x
volumes:
  postgres_data:
@y
volumes:
  postgres_data:
@z

@x
networks:
  app-network:
    driver: bridge
```
@y
networks:
  app-network:
    driver: bridge
```
@z

@x
In this PostgreSQL-focused setup:
- The `app` service connects to PostgreSQL using the service name (`db`) as the hostname in the connection string
- PostgreSQL is accessible from your host at `localhost:5432` for external tools
- Both services are isolated on a custom network, providing network-level security
- The `depends_on` directive ensures PostgreSQL starts before your application
@y
In this PostgreSQL-focused setup:
- The `app` service connects to PostgreSQL using the service name (`db`) as the hostname in the connection string
- PostgreSQL is accessible from your host at `localhost:5432` for external tools
- Both services are isolated on a custom network, providing network-level security
- The `depends_on` directive ensures PostgreSQL starts before your application
@z

@x
PostgreSQL connection details for the app service:
- Hostname: `db` (resolved by Docker DNS)
- Port: `5432` (PostgreSQL default port)
- Database: `mydb` (as specified in the connection string)
- User: `postgres` (or a custom user you've created)
@y
PostgreSQL connection details for the app service:
- Hostname: `db` (resolved by Docker DNS)
- Port: `5432` (PostgreSQL default port)
- Database: `mydb` (as specified in the connection string)
- User: `postgres` (or a custom user you've created)
@z

@x
> [!NOTE]
>
> Docker Compose automatically creates a network for your project. Services can reach each other by service name without explicit network configuration, but defining a custom network gives you more control. For PostgreSQL, this means your application can always connect using the service name, regardless of container restarts or IP changes.
@y
> [!NOTE]
>
> Docker Compose automatically creates a network for your project. Services can reach each other by service name without explicit network configuration, but defining a custom network gives you more control. For PostgreSQL, this means your application can always connect using the service name, regardless of container restarts or IP changes.
@z

@x
### Troubleshooting
@y
### Troubleshooting
@z

@x
This section covers common PostgreSQL connection issues and their solutions when working with Docker networking.
@y
This section covers common PostgreSQL connection issues and their solutions when working with Docker networking.
@z

@x
#### "Could not translate host name postgres-dev"
@y
#### "Could not translate host name postgres-dev"
@z

@x
- Both containers must be on the same Docker network (`my-app-net`).
- Verify the network exists: `docker network ls`
- Check which network a container is on: `docker inspect postgres-dev | grep NetworkMode`
- Ensure you're using a user-defined network, not the default bridge network
@y
- Both containers must be on the same Docker network (`my-app-net`).
- Verify the network exists: `docker network ls`
- Check which network a container is on: `docker inspect postgres-dev | grep NetworkMode`
- Ensure you're using a user-defined network, not the default bridge network
@z

@x
#### "Connection refused" or "could not connect to server"
@y
#### "Connection refused" or "could not connect to server"
@z

@x
- PostgreSQL may still be initializing: PostgreSQL takes a few seconds to start and initialize the database cluster. Wait 5-10 seconds after container start and retry.
- Check if the PostgreSQL container is running:
@y
- PostgreSQL may still be initializing: PostgreSQL takes a few seconds to start and initialize the database cluster. Wait 5-10 seconds after container start and retry.
- Check if the PostgreSQL container is running:
@z

@x
  ```bash
  docker ps --filter name=postgres-dev
  ```
@y
  ```bash
  docker ps --filter name=postgres-dev
  ```
@z

@x
- Check PostgreSQL logs for initialization or connection errors:
@y
- Check PostgreSQL logs for initialization or connection errors:
@z

@x
  ```bash
  docker logs postgres-dev
  ```
@y
  ```bash
  docker logs postgres-dev
  ```
@z

@x
  Look for messages like "database system is ready to accept connections" to confirm PostgreSQL is fully started.
@y
  Look for messages like "database system is ready to accept connections" to confirm PostgreSQL is fully started.
@z

@x
- Verify the port mapping is correct:
@y
- Verify the port mapping is correct:
@z

@x
  ```bash
  docker port postgres-dev
  ```
@y
  ```bash
  docker port postgres-dev
  ```
@z

@x
  This should show `5432/tcp -> 127.0.0.1:5432` (or `0.0.0.0:5432` if bound to all interfaces).
@y
  This should show `5432/tcp -> 127.0.0.1:5432` (or `0.0.0.0:5432` if bound to all interfaces).
@z

@x
- Test PostgreSQL connectivity from inside the container:
@y
- Test PostgreSQL connectivity from inside the container:
@z

@x
  ```bash
  docker exec -it postgres-dev psql -U postgres -c "SELECT version();"
  ```
@y
  ```bash
  docker exec -it postgres-dev psql -U postgres -c "SELECT version();"
  ```
@z

@x
  If this works but external connections fail, the issue is with port publishing, not PostgreSQL itself.
@y
  If this works but external connections fail, the issue is with port publishing, not PostgreSQL itself.
@z

@x
#### "Password authentication failed" or "FATAL: password authentication failed for user"
@y
#### "Password authentication failed" or "FATAL: password authentication failed for user"
@z

@x
- Confirm the password: Verify you're using the same password set in `POSTGRES_PASSWORD` when you started the container.
- Existing volume with old credentials: If you reused an existing volume, the password from the original initialization is still in effect. The `POSTGRES_PASSWORD` environment variable only sets the password during the first database initialization. To reset:
  - Remove the volume: `docker volume rm postgres_data`
  - Or connect with the old password
  - Or change the password after connecting: `ALTER USER postgres WITH PASSWORD 'newpassword';`
- Try connecting with password prompt: `psql -h localhost -U postgres -W` (the `-W` flag forces a password prompt)
- Use PGPASSWORD environment variable: `PGPASSWORD=mysecretpassword psql -h localhost -U postgres`
- Check PostgreSQL authentication configuration: If you've customized `pg_hba.conf`, verify the authentication method allows password authentication
@y
- Confirm the password: Verify you're using the same password set in `POSTGRES_PASSWORD` when you started the container.
- Existing volume with old credentials: If you reused an existing volume, the password from the original initialization is still in effect. The `POSTGRES_PASSWORD` environment variable only sets the password during the first database initialization. To reset:
  - Remove the volume: `docker volume rm postgres_data`
  - Or connect with the old password
  - Or change the password after connecting: `ALTER USER postgres WITH PASSWORD 'newpassword';`
- Try connecting with password prompt: `psql -h localhost -U postgres -W` (the `-W` flag forces a password prompt)
- Use PGPASSWORD environment variable: `PGPASSWORD=mysecretpassword psql -h localhost -U postgres`
- Check PostgreSQL authentication configuration: If you've customized `pg_hba.conf`, verify the authentication method allows password authentication
@z

@x
#### "Network not found"
@y
#### "Network not found"
@z

@x
- Ensure the network exists before starting containers: `docker network create my-app-net`
- If using Docker Compose, the network is created automatically when you run `docker compose up`
@y
- Ensure the network exists before starting containers: `docker network create my-app-net`
- If using Docker Compose, the network is created automatically when you run `docker compose up`
@z

@x
## Companions for PostgreSQL
@y
## Companions for PostgreSQL
@z

@x
### PostgreSQL ecosystem companions: pgAdmin, PgBouncer, and performance testing
@y
### PostgreSQL ecosystem companions: pgAdmin, PgBouncer, and performance testing
@z

@x
Running a standalone PostgreSQL container is often just the beginning. What happens when thousands of connections arrive, or when you need a visual interface to manage your database?
@y
Running a standalone PostgreSQL container is often just the beginning. What happens when thousands of connections arrive, or when you need a visual interface to manage your database?
@z

@x
This is where **companion tools** come into play. These applications extend PostgreSQL with capabilities the core database engine doesn't provide natively: visual administration, connection pooling, and performance benchmarking. This guide covers how to deploy pgAdmin 4, PgBouncer, Pgpool-II, and `pgbench` in Docker, when to use each tool, and real-world benchmark results demonstrating their performance impact.
@y
This is where **companion tools** come into play. These applications extend PostgreSQL with capabilities the core database engine doesn't provide natively: visual administration, connection pooling, and performance benchmarking. This guide covers how to deploy pgAdmin 4, PgBouncer, Pgpool-II, and `pgbench` in Docker, when to use each tool, and real-world benchmark results demonstrating their performance impact.
@z

@x
### pgAdmin 4: Visual management platform
@y
### pgAdmin 4: Visual management platform
@z

@x
pgAdmin 4 is the industry-standard open source management tool for PostgreSQL. When deployed in Docker, it typically runs in **Server Mode**, providing a multi-user web interface to manage one or more database instances.
@y
pgAdmin 4 is the industry-standard open source management tool for PostgreSQL. When deployed in Docker, it typically runs in **Server Mode**, providing a multi-user web interface to manage one or more database instances.
@z

@x
While you can accomplish everything from the command line using `psql`, a visual interface significantly simplifies writing complex queries, visualizing table structures, and exploring database objects.
@y
While you can accomplish everything from the command line using `psql`, a visual interface significantly simplifies writing complex queries, visualizing table structures, and exploring database objects.
@z

@x
#### Key considerations
@y
#### Key considerations
@z

@x
When running pgAdmin in Docker, keep these points in mind:
@y
When running pgAdmin in Docker, keep these points in mind:
@z

@x
- **Image**: Use the official `dpage/pgadmin4` image
- **Networking**: In a Docker Compose environment, pgAdmin connects to the database using the internal service name (for example, `db:5432`) rather than `localhost`
@y
- **Image**: Use the official `dpage/pgadmin4` image
- **Networking**: In a Docker Compose environment, pgAdmin connects to the database using the internal service name (for example, `db:5432`) rather than `localhost`
@z

@x
#### Docker Compose configuration
@y
#### Docker Compose configuration
@z

@x
To quickly deploy pgAdmin:
@y
To quickly deploy pgAdmin:
@z

@x
```yaml
pgadmin:
  image: dpage/pgadmin4:8.14
  environment:
    PGADMIN_DEFAULT_EMAIL: admin@example.com
    PGADMIN_DEFAULT_PASSWORD: secure_password
  volumes:
    - pgadmin_data:/var/lib/pgadmin
  ports:
    - "8080:80"
```
@y
```yaml
pgadmin:
  image: dpage/pgadmin4:8.14
  environment:
    PGADMIN_DEFAULT_EMAIL: admin@example.com
    PGADMIN_DEFAULT_PASSWORD: secure_password
  volumes:
    - pgadmin_data:/var/lib/pgadmin
  ports:
    - "8080:80"
```
@z

@x
With this configuration, access the pgAdmin interface at `http://localhost:8080`. Use the email and password specified in the environment variables for initial sign in.
@y
With this configuration, access the pgAdmin interface at `http://localhost:8080`. Use the email and password specified in the environment variables for initial sign in.
@z

@x
> [!IMPORTANT]
>
> In production environments, pass `PGADMIN_DEFAULT_PASSWORD` as an external environment variable or use Docker secrets. Storing passwords in plain text within `docker-compose.yml` poses a security risk.
@y
> [!IMPORTANT]
>
> In production environments, pass `PGADMIN_DEFAULT_PASSWORD` as an external environment variable or use Docker secrets. Storing passwords in plain text within `docker-compose.yml` poses a security risk.
@z

@x
Now that you have visual database management in place, the next challenge in production environments is handling connection load. The following section explains how to manage high-volume database traffic.
@y
Now that you have visual database management in place, the next challenge in production environments is handling connection load. The following section explains how to manage high-volume database traffic.
@z

@x
### PgBouncer: Lightweight connection pooling
@y
### PgBouncer: Lightweight connection pooling
@z

@x
PostgreSQL creates a new process for every client connection, which consumes significant RAM. What happens when you have 1,000 concurrent users? PgBouncer solves exactly this problem.
@y
PostgreSQL creates a new process for every client connection, which consumes significant RAM. What happens when you have 1,000 concurrent users? PgBouncer solves exactly this problem.
@z

@x
PgBouncer is a lightweight proxy that pools connections, allowing thousands of applications to share a small number of actual database backends. Think of it as a traffic controller: everyone wants to pass through simultaneously, but the controller regulates the flow to prevent congestion.
@y
PgBouncer is a lightweight proxy that pools connections, allowing thousands of applications to share a small number of actual database backends. Think of it as a traffic controller: everyone wants to pass through simultaneously, but the controller regulates the flow to prevent congestion.
@z

@x
#### Pooling modes
@y
#### Pooling modes
@z

@x
PgBouncer offers three distinct pooling modes:
@y
PgBouncer offers three distinct pooling modes:
@z

@x
| Mode | Description | Use case |
|------|-------------|----------|
| **Session** | Connection assigned for entire session duration | Long-lived connections, session variables |
| **Transaction** | Connection returned after each transaction ends | Web applications, microservices (most common) |
| **Statement** | Connection returned after every SQL statement | Simple queries, no multi-statement transactions |
@y
| Mode | Description | Use case |
|------|-------------|----------|
| **Session** | Connection assigned for entire session duration | Long-lived connections, session variables |
| **Transaction** | Connection returned after each transaction ends | Web applications, microservices (most common) |
| **Statement** | Connection returned after every SQL statement | Simple queries, no multi-statement transactions |
@z

@x
#### When to use PgBouncer
@y
#### When to use PgBouncer
@z

@x
PgBouncer becomes essential when you encounter:
@y
PgBouncer becomes essential when you encounter:
@z

@x
- "too many connections" errors
- High memory consumption due to connection overhead
- Many short-lived connections (web applications, serverless functions)
- Need to serve thousands of clients with limited database connections
@y
- "too many connections" errors
- High memory consumption due to connection overhead
- Many short-lived connections (web applications, serverless functions)
- Need to serve thousands of clients with limited database connections
@z

@x
#### Complete Docker Compose setup
@y
#### Complete Docker Compose setup
@z

@x
To run PostgreSQL and PgBouncer together, you need three files: `docker-compose.yml`, `pgbouncer.ini`, and `userlist.txt`.
@y
To run PostgreSQL and PgBouncer together, you need three files: `docker-compose.yml`, `pgbouncer.ini`, and `userlist.txt`.
@z

@x
First, create the PgBouncer configuration file (`pgbouncer.ini`):
@y
First, create the PgBouncer configuration file (`pgbouncer.ini`):
@z

@x
```bash
[databases]
benchmark = host=postgres port=5432 dbname=benchmark user=postgres
@y
```bash
[databases]
benchmark = host=postgres port=5432 dbname=benchmark user=postgres
@z

@x
[pgbouncer]
listen_addr = 0.0.0.0
listen_port = 6432
auth_type = trust
auth_file = /etc/pgbouncer/userlist.txt
admin_users = postgres
pool_mode = transaction
max_client_conn = 1000
default_pool_size = 50
min_pool_size = 10
reserve_pool_size = 10
max_db_connections = 100
```
@y
[pgbouncer]
listen_addr = 0.0.0.0
listen_port = 6432
auth_type = trust
auth_file = /etc/pgbouncer/userlist.txt
admin_users = postgres
pool_mode = transaction
max_client_conn = 1000
default_pool_size = 50
min_pool_size = 10
reserve_pool_size = 10
max_db_connections = 100
```
@z

@x
Next, create the user authentication file (`userlist.txt`):
@y
Next, create the user authentication file (`userlist.txt`):
@z

@x
```bash
"postgres" "postgres"
```
@y
```bash
"postgres" "postgres"
```
@z

@x
Finally, create the Docker Compose file (`docker-compose.yml`):
@y
Finally, create the Docker Compose file (`docker-compose.yml`):
@z

@x
```yaml
services:
  postgres:
    image: postgres:18
    container_name: postgres
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: benchmark
      POSTGRES_HOST_AUTH_METHOD: trust
    volumes:
      - postgres_data:/var/lib/postgresql
    ports:
      - "5432:5432"
    networks:
      - pgnet
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 5s
      timeout: 5s
      retries: 5
@y
```yaml
services:
  postgres:
    image: postgres:18
    container_name: postgres
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: benchmark
      POSTGRES_HOST_AUTH_METHOD: trust
    volumes:
      - postgres_data:/var/lib/postgresql
    ports:
      - "5432:5432"
    networks:
      - pgnet
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 5s
      timeout: 5s
      retries: 5
@z

@x
  pgbouncer:
    image: percona/percona-pgbouncer:1.25.0
    container_name: pgbouncer
    volumes:
      - ./pgbouncer.ini:/etc/pgbouncer/pgbouncer.ini
      - ./userlist.txt:/etc/pgbouncer/userlist.txt
    ports:
      - "6432:6432"
    networks:
      - pgnet
    depends_on:
      postgres:
        condition: service_healthy
@y
  pgbouncer:
    image: percona/percona-pgbouncer:1.25.0
    container_name: pgbouncer
    volumes:
      - ./pgbouncer.ini:/etc/pgbouncer/pgbouncer.ini
      - ./userlist.txt:/etc/pgbouncer/userlist.txt
    ports:
      - "6432:6432"
    networks:
      - pgnet
    depends_on:
      postgres:
        condition: service_healthy
@z

@x
volumes:
  postgres_data:
@y
volumes:
  postgres_data:
@z

@x
networks:
  pgnet:
    driver: bridge
```
@y
networks:
  pgnet:
    driver: bridge
```
@z

@x
Key configuration notes:
@y
Key configuration notes:
@z

@x
- `PgBouncer` listens on port **6432**, avoiding confusion with the direct PostgreSQL connection on port 5432
- The `depends_on` directive with `service_healthy` condition ensures PgBouncer starts only after PostgreSQL is ready
- `pool_mode = transaction` is the optimal choice for most web applications
- The [Percona PgBouncer image](https://hub.docker.com/r/percona/percona-pgbouncer) requires mounted configuration files (without the `:ro` flag, as the entrypoint script needs to modify them)
- This example uses `trust` authentication for simplicity. In production, configure proper SCRAM-SHA-256 authentication
@y
- `PgBouncer` listens on port **6432**, avoiding confusion with the direct PostgreSQL connection on port 5432
- The `depends_on` directive with `service_healthy` condition ensures PgBouncer starts only after PostgreSQL is ready
- `pool_mode = transaction` is the optimal choice for most web applications
- The [Percona PgBouncer image](https://hub.docker.com/r/percona/percona-pgbouncer) requires mounted configuration files (without the `:ro` flag, as the entrypoint script needs to modify them)
- This example uses `trust` authentication for simplicity. In production, configure proper SCRAM-SHA-256 authentication
@z

@x
> [!NOTE]
>
> The `Percona PgBouncer` entrypoint script processes the configuration files on startup. Mount them without the read-only flag to avoid permission errors.
@y
> [!NOTE]
>
> The `Percona PgBouncer` entrypoint script processes the configuration files on startup. Mount them without the read-only flag to avoid permission errors.
@z

@x
### `pgbench`: Performance benchmarking
@y
### `pgbench`: Performance benchmarking
@z

@x
`pgbench` is a benchmarking utility included with the official PostgreSQL image. It allows you to simulate heavy workloads and verify how your Docker configuration performs under pressure.
@y
`pgbench` is a benchmarking utility included with the official PostgreSQL image. It allows you to simulate heavy workloads and verify how your Docker configuration performs under pressure.
@z

@x
#### Initialize benchmark tables
@y
#### Initialize benchmark tables
@z

@x
First, create the test tables. The `-s` (scale) parameter determines data size—scale factor 50 creates approximately 5 million rows:
@y
First, create the test tables. The `-s` (scale) parameter determines data size—scale factor 50 creates approximately 5 million rows:
@z

@x
```bash
docker exec postgres pgbench -i -s 50 -U postgres benchmark
```
@y
```bash
docker exec postgres pgbench -i -s 50 -U postgres benchmark
```
@z

@x
#### Run stress tests
@y
#### Run stress tests
@z

@x
Key parameters:
@y
Key parameters:
@z

@x
- `-c`: Number of simulated clients
- `-j`: Number of threads
- `-T`: Duration in seconds
@y
- `-c`: Number of simulated clients
- `-j`: Number of threads
- `-T`: Duration in seconds
@z

@x
Test with direct PostgreSQL connection:
@y
Test with direct PostgreSQL connection:
@z

@x
```bash
docker exec postgres pgbench -h localhost -U postgres -c 50 -j 4 -T 60 benchmark
```
@y
```bash
docker exec postgres pgbench -h localhost -U postgres -c 50 -j 4 -T 60 benchmark
```
@z

@x
Test through PgBouncer:
@y
Test through PgBouncer:
@z

@x
```bash
docker exec postgres pgbench -h pgbouncer -p 6432 -U postgres -c 50 -j 4 -T 60 benchmark
```
@y
```bash
docker exec postgres pgbench -h pgbouncer -p 6432 -U postgres -c 50 -j 4 -T 60 benchmark
```
@z

@x
### Understanding benchmark results
@y
### Understanding benchmark results
@z

@x
Does PgBouncer actually make a difference? Run the benchmarks yourself to find out. Your results will vary based on your hardware, Docker configuration, network setup, and system load.
@y
Does PgBouncer actually make a difference? Run the benchmarks yourself to find out. Your results will vary based on your hardware, Docker configuration, network setup, and system load.
@z

@x
#### What to expect
@y
#### What to expect
@z

@x
When you run these benchmarks, you'll observe patterns rather than specific numbers. Think of it like comparing two different routes to work: the "faster" route depends on traffic conditions, time of day, and your vehicle.
@y
When you run these benchmarks, you'll observe patterns rather than specific numbers. Think of it like comparing two different routes to work: the "faster" route depends on traffic conditions, time of day, and your vehicle.
@z

@x
#### Key observations
@y
#### Key observations
@z

@x
When comparing direct connections versus PgBouncer, you'll typically notice:
@y
When comparing direct connections versus PgBouncer, you'll typically notice:
@z

@x
##### 1. Connection overhead differs significantly
@y
##### 1. Connection overhead differs significantly
@z

@x
Direct connections require PostgreSQL to spawn a new process for each client. PgBouncer reuses existing connections. Watch the "initial connection time" metric in your results—PgBouncer often shows dramatically faster connection setup.
@y
Direct connections require PostgreSQL to spawn a new process for each client. PgBouncer reuses existing connections. Watch the "initial connection time" metric in your results—PgBouncer often shows dramatically faster connection setup.
@z

@x
##### 2. Behavior under pressure reveals the real difference
@y
##### 2. Behavior under pressure reveals the real difference
@z

@x
Try increasing the client count (`-c` parameter) gradually: 50, 100, 150, 200. At some point, direct connections will fail with "too many clients already" while PgBouncer continues handling requests. This is PgBouncer's primary value: **it prevents connection exhaustion**.
@y
Try increasing the client count (`-c` parameter) gradually: 50, 100, 150, 200. At some point, direct connections will fail with "too many clients already" while PgBouncer continues handling requests. This is PgBouncer's primary value: **it prevents connection exhaustion**.
@z

@x
##### 3. Throughput varies by environment
@y
##### 3. Throughput varies by environment
@z

@x
On some systems, direct connections show higher transactions per second (TPS) at low concurrency. On others, PgBouncer wins even with few clients. The difference depends on:
- CPU and memory available
- Docker networking overhead
- Disk I/O speed
- Whether connections are being rapidly opened and closed
@y
On some systems, direct connections show higher transactions per second (TPS) at low concurrency. On others, PgBouncer wins even with few clients. The difference depends on:
- CPU and memory available
- Docker networking overhead
- Disk I/O speed
- Whether connections are being rapidly opened and closed
@z
