%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Using lifecycle hooks with Compose
linkTitle: Use lifecycle hooks
@y
title: Using lifecycle hooks with Compose
linkTitle: Use lifecycle hooks
@z

@x
description: Learn how to use Docker Compose lifecycle hooks like post_start and pre_stop to customize container behavior.
keywords: docker compose lifecycle hooks, post_start, pre_stop, docker compose entrypoint, docker container stop hooks, compose hook commands
@y
description: Learn how to use Docker Compose lifecycle hooks like post_start and pre_stop to customize container behavior.
keywords: docker compose lifecycle hooks, post_start, pre_stop, docker compose entrypoint, docker container stop hooks, compose hook commands
@z

@x
{{< summary-bar feature_name="Compose lifecycle hooks" >}}
@y
{{< summary-bar feature_name="Compose lifecycle hooks" >}}
@z

@x
## Services lifecycle hooks
@y
## Services lifecycle hooks
@z

@x
When Docker Compose runs a container, it uses two elements, 
[ENTRYPOINT and COMMAND](/manuals/engine/containers/run.md#default-command-and-options), 
to manage what happens when the container starts and stops.
@y
When Docker Compose runs a container, it uses two elements, 
[ENTRYPOINT and COMMAND](manuals/engine/containers/run.md#default-command-and-options), 
to manage what happens when the container starts and stops.
@z

@x
However, it can sometimes be easier to handle these tasks separately with lifecycle hooks - 
commands that run right after the container starts or just before it stops.
@y
However, it can sometimes be easier to handle these tasks separately with lifecycle hooks - 
commands that run right after the container starts or just before it stops.
@z

@x
Lifecycle hooks are particularly useful because they can have special privileges 
(like running as the root user), even when the container itself runs with lower privileges 
for security. This means that certain tasks requiring higher permissions can be done without 
compromising the overall security of the container.
@y
Lifecycle hooks are particularly useful because they can have special privileges 
(like running as the root user), even when the container itself runs with lower privileges 
for security. This means that certain tasks requiring higher permissions can be done without 
compromising the overall security of the container.
@z

@x
### Post-start hooks
@y
### Post-start hooks
@z

@x
Post-start hooks are commands that run after the container has started, but there's no 
set time for when exactly they will execute. The hook execution timing is not assured during 
the execution of the container's `entrypoint`.
@y
Post-start hooks are commands that run after the container has started, but there's no 
set time for when exactly they will execute. The hook execution timing is not assured during 
the execution of the container's `entrypoint`.
@z

@x
Because there is no ordering guarantee between the hook and the container's entrypoint,
post-start hooks are best suited for tasks that do not need to complete before the
application begins running, such as registering the container with an external system.
@y
Because there is no ordering guarantee between the hook and the container's entrypoint,
post-start hooks are best suited for tasks that do not need to complete before the
application begins running, such as registering the container with an external system.
@z

@x
In the following example, after the container starts, a root-level hook registers the
service with an internal service registry. The application does not depend on registration
being complete before it starts serving requests.
@y
In the following example, after the container starts, a root-level hook registers the
service with an internal service registry. The application does not depend on registration
being complete before it starts serving requests.
@z

@x
```yaml
services:
  app:
    image: backend
    user: 1001
    post_start:
      - command: /opt/scripts/register-service.sh
        user: root
```
@y
```yaml
services:
  app:
    image: backend
    user: 1001
    post_start:
      - command: /opt/scripts/register-service.sh
        user: root
```
@z

@x
### Pre-stop hooks
@y
### Pre-stop hooks
@z

@x
Pre-stop hooks are commands that run before the container is stopped by a specific 
command (like `docker compose down` or stopping it manually with `Ctrl+C`). 
These hooks won't run if the container stops by itself or gets killed suddenly.
@y
Pre-stop hooks are commands that run before the container is stopped by a specific 
command (like `docker compose down` or stopping it manually with `Ctrl+C`). 
These hooks won't run if the container stops by itself or gets killed suddenly.
@z

@x
Because the pre-stop hook runs before the stop signal is sent to the container, it is
suited for actions that must complete while the application is still fully running.
@y
Because the pre-stop hook runs before the stop signal is sent to the container, it is
suited for actions that must complete while the application is still fully running.
@z

@x
In the following example, the hook backs up a data file before the container receives the stop signal.
@y
In the following example, the hook backs up a data file before the container receives the stop signal.
@z

@x
```yaml
services:
  app:
    image: backend
    volumes:
      - data:/data
    pre_stop:
      - command: cp /data/app.db /data/app.db.bak
@y
```yaml
services:
  app:
    image: backend
    volumes:
      - data:/data
    pre_stop:
      - command: cp /data/app.db /data/app.db.bak
@z

@x
volumes:
  data: {} # a Docker volume is created with root ownership
```
@y
volumes:
  data: {} # a Docker volume is created with root ownership
```
@z

@x
## Reference information
@y
## Reference information
@z

@x
- [`post_start`](/reference/compose-file/services.md#post_start)
- [`pre_stop`](/reference/compose-file/services.md#pre_stop)
@y
- [`post_start`](reference/compose-file/services.md#post_start)
- [`pre_stop`](reference/compose-file/services.md#pre_stop)
@z
