%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use init containers in Compose
linkTitle: Use init containers
@y
title: Use init containers in Compose
linkTitle: Use init containers
@z

@x
description: Use pre_start init containers to run setup tasks before a service starts in Docker Compose.
keywords: docker compose init containers, pre_start, docker compose migrations, volume permissions, docker compose lifecycle
@y
description: Use pre_start init containers to run setup tasks before a service starts in Docker Compose.
keywords: docker compose init containers, pre_start, docker compose migrations, volume permissions, docker compose lifecycle
@z

@x
{{< summary-bar feature_name="Compose pre_start" >}}
@y
{{< summary-bar feature_name="Compose pre_start" >}}
@z

@x
Init containers are short-lived containers that run before a service's main container starts. They execute sequentially, each running to completion before the next begins. If any step exits with a non-zero code, the service will not start.
@y
Init containers are short-lived containers that run before a service's main container starts. They execute sequentially, each running to completion before the next begins. If any step exits with a non-zero code, the service will not start.
@z

@x
Use them for setup work that must finish before the application boots: running database migrations, fixing volume permissions, generating dynamic configuration, or executing any ordered sequence of prerequisites.
@y
Use them for setup work that must finish before the application boots: running database migrations, fixing volume permissions, generating dynamic configuration, or executing any ordered sequence of prerequisites.
@z

@x
Compose models init containers as [`pre_start`](/reference/compose-file/services.md#pre_start) lifecycle hooks. Unlike [`post_start`](/reference/compose-file/services.md#post_start) and [`pre_stop`](/reference/compose-file/services.md#pre_stop), which run a command inside the running service container, each `pre_start` step runs in its own ephemeral container created after the service container is created but before it is started.
@y
Compose models init containers as [`pre_start`](reference/compose-file/services.md#pre_start) lifecycle hooks. Unlike [`post_start`](reference/compose-file/services.md#post_start) and [`pre_stop`](reference/compose-file/services.md#pre_stop), which run a command inside the running service container, each `pre_start` step runs in its own ephemeral container created after the service container is created but before it is started.
@z

@x
## When not to use init containers
@y
## When not to use init containers
@z

@x
For static files and secrets, use the native [`configs`](/reference/compose-file/configs.md) and [`secrets`](/reference/compose-file/secrets.md) top-level elements instead. Compose mounts them directly into containers with a configurable target path, mode, UID, and GID. No init container required.
@y
For static files and secrets, use the native [`configs`](reference/compose-file/configs.md) and [`secrets`](reference/compose-file/secrets.md) top-level elements instead. Compose mounts them directly into containers with a configurable target path, mode, UID, and GID. No init container required.
@z

@x
For background tasks with their own lifecycle - scheduled backups, post-exit cleanup, periodic maintenance — init containers are the wrong tool. Those tasks run independently of service startup, not before it.
@y
For background tasks with their own lifecycle - scheduled backups, post-exit cleanup, periodic maintenance — init containers are the wrong tool. Those tasks run independently of service startup, not before it.
@z

@x
## How `pre_start` containers run
@y
## How `pre_start` containers run
@z

@x
Each step in a service's `pre_start` list:
@y
Each step in a service's `pre_start` list:
@z

@x
- Runs in its own ephemeral container, created after the service container is created but before it starts.
- Inherits the service's image by default. Set `image` to override. The hook image follows the parent service's `pull_policy`, including refresh interval (`daily`, `weekly`, `every_<duration>`). This applies when starting services and when running `docker compose pull`.
- Joins the same networks as the service, so it can reach services declared in [`depends_on`](/reference/compose-file/services.md#depends_on).
- Shares the service's volume mounts, so files written to a shared volume are immediately visible to the service.
- Must exit `0` for the next step, and the service itself, to start. A non-zero exit aborts startup for the service and anything that depends on it.
@y
- Runs in its own ephemeral container, created after the service container is created but before it starts.
- Inherits the service's image by default. Set `image` to override. The hook image follows the parent service's `pull_policy`, including refresh interval (`daily`, `weekly`, `every_<duration>`). This applies when starting services and when running `docker compose pull`.
- Joins the same networks as the service, so it can reach services declared in [`depends_on`](reference/compose-file/services.md#depends_on).
- Shares the service's volume mounts, so files written to a shared volume are immediately visible to the service.
- Must exit `0` for the next step, and the service itself, to start. A non-zero exit aborts startup for the service and anything that depends on it.
@z

@x
A `pre_start` step is skipped on subsequent `docker compose up` runs if it previously succeeded, its definition hasn't changed, or when the service container restarts under its `restart` policy. It reruns if the definition changes, the previous run failed, or the service is recreated with `--force-recreate`.
@y
A `pre_start` step is skipped on subsequent `docker compose up` runs if it previously succeeded, its definition hasn't changed, or when the service container restarts under its `restart` policy. It reruns if the definition changes, the previous run failed, or the service is recreated with `--force-recreate`.
@z

@x
## Examples
@y
## Examples
@z

@x
### Run a database migration before the app starts
@y
### Run a database migration before the app starts
@z

@x
In the following example, `app` waits for `db` to be healthy, then runs
`./manage.py migrate` in an ephemeral container that reuses the app's
image. The service container only starts once the migration exits `0`.
@y
In the following example, `app` waits for `db` to be healthy, then runs
`./manage.py migrate` in an ephemeral container that reuses the app's
image. The service container only starts once the migration exits `0`.
@z

@x
```yaml
services:
  app:
    image: myapp:latest
    depends_on:
      db:
        condition: service_healthy
    pre_start:
      - command: ["./manage.py", "migrate"]
@y
```yaml
services:
  app:
    image: myapp:latest
    depends_on:
      db:
        condition: service_healthy
    pre_start:
      - command: ["./manage.py", "migrate"]
@z

@x
  db:
    image: postgres:18
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U $${POSTGRES_USER} -d $${POSTGRES_DB}"]
      interval: 10s
      retries: 5
      start_period: 30s
      timeout: 10s
```
@y
  db:
    image: postgres:18
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U $${POSTGRES_USER} -d $${POSTGRES_DB}"]
      interval: 10s
      retries: 5
      start_period: 30s
      timeout: 10s
```
@z

@x
If the migration fails, `app` does not start and the failure is reported in
the `docker compose up` output.
@y
If the migration fails, `app` does not start and the failure is reported in
the `docker compose up` output.
@z

@x
### Fix volume ownership before a non-root service starts
@y
### Fix volume ownership before a non-root service starts
@z

@x
Named volumes are created with root ownership. When the service runs as a
non-root user, you can use a `pre_start` step to adjust ownership before
the service mounts the volume.
@y
Named volumes are created with root ownership. When the service runs as a
non-root user, you can use a `pre_start` step to adjust ownership before
the service mounts the volume.
@z

@x
```yaml
services:
  app:
    image: myapp:latest
    user: "1000:1000"
    volumes:
      - data:/data
    pre_start:
      - image: busybox
        user: root
        command: sh -c 'chown -R 1000:1000 /data'
@y
```yaml
services:
  app:
    image: myapp:latest
    user: "1000:1000"
    volumes:
      - data:/data
    pre_start:
      - image: busybox
        user: root
        command: sh -c 'chown -R 1000:1000 /data'
@z

@x
volumes:
  data:
```
@y
volumes:
  data:
```
@z

@x
The `pre_start` step uses a different image (`busybox`) and runs as `root`,
even though the service itself runs as user `1000`.
@y
The `pre_start` step uses a different image (`busybox`) and runs as `root`,
even though the service itself runs as user `1000`.
@z

@x
### Chain multiple setup steps
@y
### Chain multiple setup steps
@z

@x
`pre_start` steps run in declared order. The next step only starts once the
previous one exits `0`. In the following example, the application waits
for migrations to finish, then for seed data to load, before starting.
@y
`pre_start` steps run in declared order. The next step only starts once the
previous one exits `0`. In the following example, the application waits
for migrations to finish, then for seed data to load, before starting.
@z

@x
```yaml
services:
  app:
    image: myapp:latest
    depends_on:
      db:
        condition: service_healthy
    pre_start:
      - command: ["./manage.py", "migrate"]
      - command: ["./manage.py", "loaddata", "fixtures.json"]
@y
```yaml
services:
  app:
    image: myapp:latest
    depends_on:
      db:
        condition: service_healthy
    pre_start:
      - command: ["./manage.py", "migrate"]
      - command: ["./manage.py", "loaddata", "fixtures.json"]
@z

@x
  db:
    image: postgres:18
```
@y
  db:
    image: postgres:18
```
@z

@x
Each step runs in its own ephemeral container. If the second step fails,
the first step is not rolled back, but `app` does not start.
@y
Each step runs in its own ephemeral container. If the second step fails,
the first step is not rolled back, but `app` does not start.
@z

@x
### Replace the one-shot service pattern
@y
### Replace the one-shot service pattern
@z

@x
Before `pre_start`, the common way to express "run X before Y starts" was
to model the setup work as a service with `restart: "no"` and have the main
service `depends_on` it with `condition: service_completed_successfully`:
@y
Before `pre_start`, the common way to express "run X before Y starts" was
to model the setup work as a service with `restart: "no"` and have the main
service `depends_on` it with `condition: service_completed_successfully`:
@z

@x
```yaml
services:
  migrate:
    image: myapp:latest
    command: ["./manage.py", "migrate"]
    restart: "no"
@y
```yaml
services:
  migrate:
    image: myapp:latest
    command: ["./manage.py", "migrate"]
    restart: "no"
@z

@x
  app:
    image: myapp:latest
    depends_on:
      migrate:
        condition: service_completed_successfully
```
@y
  app:
    image: myapp:latest
    depends_on:
      migrate:
        condition: service_completed_successfully
```
@z

@x
The equivalent expressed with `pre_start`:
@y
The equivalent expressed with `pre_start`:
@z

@x
```yaml
services:
  app:
    image: myapp:latest
    pre_start:
      - command: ["./manage.py", "migrate"]
```
@y
```yaml
services:
  app:
    image: myapp:latest
    pre_start:
      - command: ["./manage.py", "migrate"]
```
@z

@x
`pre_start` is preferable because:
@y
`pre_start` is preferable because:
@z

@x
- The setup work is modeled as a subordinate step of the service, not as a peer service that exits immediately.
- Completed steps do not appear as exited services in `docker compose ps`.
- Chaining several setup steps does not require a web of `depends_on` edges between one-shot services.
- The ephemeral container inherits the service's image by default, so no duplicate `image:` declaration is needed.
@y
- The setup work is modeled as a subordinate step of the service, not as a peer service that exits immediately.
- Completed steps do not appear as exited services in `docker compose ps`.
- Chaining several setup steps does not require a web of `depends_on` edges between one-shot services.
- The ephemeral container inherits the service's image by default, so no duplicate `image:` declaration is needed.
@z

@x
The one-shot service pattern still has its place when the setup work is a shared concern that multiple services depend on, or when it needs to be addressable independently of any single service.
@y
The one-shot service pattern still has its place when the setup work is a shared concern that multiple services depend on, or when it needs to be addressable independently of any single service.
@z

@x
## Limitations
@y
## Limitations
@z

@x
- `pre_start` runs once for the service as a whole, not once per replica (`per_replica: false`). Per-replica execution (`per_replica: true`) is not yet supported.
- Volume mounts shared across replicas (named volumes, bind mounts) are accessible from a `pre_start` step. Per-instance mounts such as `tmpfs`
  or anonymous volumes cannot be addressed by a single shared run.
- `pre_start` does not re-trigger when you scale a service up. A step runs again only on definition change, prior failure, or `--force-recreate`.
@y
- `pre_start` runs once for the service as a whole, not once per replica (`per_replica: false`). Per-replica execution (`per_replica: true`) is not yet supported.
- Volume mounts shared across replicas (named volumes, bind mounts) are accessible from a `pre_start` step. Per-instance mounts such as `tmpfs`
  or anonymous volumes cannot be addressed by a single shared run.
- `pre_start` does not re-trigger when you scale a service up. A step runs again only on definition change, prior failure, or `--force-recreate`.
@z

@x
## Reference and additional information
@y
## Reference and additional information
@z

@x
- [`pre_start`](/reference/compose-file/services.md#pre_start)
- [`post_start`](/reference/compose-file/services.md#post_start)
- [`pre_stop`](/reference/compose-file/services.md#pre_stop)
- [`depends_on`](/reference/compose-file/services.md#depends_on)
- [Use lifecycle hooks](/manuals/compose/how-tos/lifecycle.md)
- [Control startup order](/manuals/compose/how-tos/startup-order.md)
@y
- [`pre_start`](reference/compose-file/services.md#pre_start)
- [`post_start`](reference/compose-file/services.md#post_start)
- [`pre_stop`](reference/compose-file/services.md#pre_stop)
- [`depends_on`](reference/compose-file/services.md#depends_on)
- [Use lifecycle hooks](manuals/compose/how-tos/lifecycle.md)
- [Control startup order](manuals/compose/how-tos/startup-order.md)
@z
