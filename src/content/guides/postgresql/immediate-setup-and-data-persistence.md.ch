%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Immediate setup & data persistence
description: Get PostgreSQL running in Docker in under five minutes. Learn how to configure named volumes and bind mounts to persist your database across container restarts.
keywords:
  - PostgreSQL Docker
  - Docker Compose PostgreSQL
  - container database
@y
title: Immediate setup & data persistence
description: Get PostgreSQL running in Docker in under five minutes. Learn how to configure named volumes and bind mounts to persist your database across container restarts.
keywords:
  - PostgreSQL Docker
  - Docker Compose PostgreSQL
  - container database
@z

@x
This guide gets you from zero to a running PostgreSQL container in under five minutes, then explains how to keep your data safe across container restarts and removals.
@y
This guide gets you from zero to a running PostgreSQL container in under five minutes, then explains how to keep your data safe across container restarts and removals.
@z

@x
## Overview
@y
## Overview
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
## Quick start (minimal viable container)
@y
## Quick start (minimal viable container)
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
### Understanding the flags
@y
### Understanding the flags
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
## The data persistence problem
@y
## The data persistence problem
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
## Named volumes
@y
## Named volumes
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
### Verify persistence works
@y
### Verify persistence works
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
### Managing volumes
@y
### Managing volumes
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
## Bind mounts (alternative)
@y
## Bind mounts (alternative)
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
### When to use bind mounts
@y
### When to use bind mounts
@z

@x
Bind mounts are useful when you need direct filesystem access to the data directory for backup scripts that read files directly, when integrating with host-level monitoring tools, or when specific permission requirements exist. For most development and production scenarios, named volumes are simpler and less error-prone.
@y
Bind mounts are useful when you need direct filesystem access to the data directory for backup scripts that read files directly, when integrating with host-level monitoring tools, or when specific permission requirements exist. For most development and production scenarios, named volumes are simpler and less error-prone.
@z

@x
### Common bind mount issues
@y
### Common bind mount issues
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
## Docker Compose configuration
@y
## Docker Compose configuration
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
### Environment variables reference
@y
### Environment variables reference
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
## Next steps
@y
## Next steps
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
