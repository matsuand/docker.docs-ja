%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Companions for PostgreSQL
linkTitle: Companions for PostgreSQL
description: This module explains how to customize PostgreSQL for real-world use in Docker, covering automated database initialization, performance tuning, and timezone configuration once persistent storage is in place.
keywords:
  - PostgreSQL Docker
  - Docker Compose PostgreSQL
  - container database
@y
title: Companions for PostgreSQL
linkTitle: Companions for PostgreSQL
description: This module explains how to customize PostgreSQL for real-world use in Docker, covering automated database initialization, performance tuning, and timezone configuration once persistent storage is in place.
keywords:
  - PostgreSQL Docker
  - Docker Compose PostgreSQL
  - container database
@z

@x
## PostgreSQL Ecosystem companions: pgAdmin, PgBouncer, and Performance Testing
@y
## PostgreSQL Ecosystem companions: pgAdmin, PgBouncer, and Performance Testing
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
## pgAdmin 4: Visual management platform
@y
## pgAdmin 4: Visual management platform
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
### Key considerations
@y
### Key considerations
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
### Docker Compose configuration
@y
### Docker Compose configuration
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
## PgBouncer: Lightweight connection pooling
@y
## PgBouncer: Lightweight connection pooling
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
### Pooling modes
@y
### Pooling modes
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
### When to use PgBouncer
@y
### When to use PgBouncer
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
### Complete Docker Compose setup
@y
### Complete Docker Compose setup
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
## `pgbench`: Performance benchmarking
@y
## `pgbench`: Performance benchmarking
@z

@x
`pgbench` is a benchmarking utility included with the official PostgreSQL image. It allows you to simulate heavy workloads and verify how your Docker configuration performs under pressure.
@y
`pgbench` is a benchmarking utility included with the official PostgreSQL image. It allows you to simulate heavy workloads and verify how your Docker configuration performs under pressure.
@z

@x
### Initialize benchmark tables
@y
### Initialize benchmark tables
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
### Run stress tests
@y
### Run stress tests
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
## Understanding benchmark results
@y
## Understanding benchmark results
@z

@x
Does PgBouncer actually make a difference? Run the benchmarks yourself to find out. Your results will vary based on your hardware, Docker configuration, network setup, and system load.
@y
Does PgBouncer actually make a difference? Run the benchmarks yourself to find out. Your results will vary based on your hardware, Docker configuration, network setup, and system load.
@z

@x
### What to expect
@y
### What to expect
@z

@x
When you run these benchmarks, you'll observe patterns rather than specific numbers. Think of it like comparing two different routes to work: the "faster" route depends on traffic conditions, time of day, and your vehicle.
@y
When you run these benchmarks, you'll observe patterns rather than specific numbers. Think of it like comparing two different routes to work: the "faster" route depends on traffic conditions, time of day, and your vehicle.
@z

@x
### Key observations
@y
### Key observations
@z

@x
When comparing direct connections versus PgBouncer, you'll typically notice:
@y
When comparing direct connections versus PgBouncer, you'll typically notice:
@z

@x
#### 1. Connection overhead differs significantly
@y
#### 1. Connection overhead differs significantly
@z

@x
Direct connections require PostgreSQL to spawn a new process for each client. PgBouncer reuses existing connections. Watch the "initial connection time" metric in your results—PgBouncer often shows dramatically faster connection setup.
@y
Direct connections require PostgreSQL to spawn a new process for each client. PgBouncer reuses existing connections. Watch the "initial connection time" metric in your results—PgBouncer often shows dramatically faster connection setup.
@z

@x
#### 2. Behavior under pressure reveals the real difference
@y
#### 2. Behavior under pressure reveals the real difference
@z

@x
Try increasing the client count (`-c` parameter) gradually: 50, 100, 150, 200. At some point, direct connections will fail with "too many clients already" while PgBouncer continues handling requests. This is PgBouncer's primary value: **it prevents connection exhaustion**.
@y
Try increasing the client count (`-c` parameter) gradually: 50, 100, 150, 200. At some point, direct connections will fail with "too many clients already" while PgBouncer continues handling requests. This is PgBouncer's primary value: **it prevents connection exhaustion**.
@z

@x
#### 3. Throughput varies by environment
@y
#### 3. Throughput varies by environment
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
