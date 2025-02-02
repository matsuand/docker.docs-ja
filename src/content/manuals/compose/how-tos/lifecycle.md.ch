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
desription: How to use lifecycle hooks with Docker Compose
keywords: cli, compose, lifecycle, hooks reference
@y
desription: How to use lifecycle hooks with Docker Compose
keywords: cli, compose, lifecycle, hooks reference
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
[ENTRYPOINT and COMMAND](https://github.com/manuals//engine/containers/run.md#default-command-and-options), 
to manage what happens when the container starts and stops.
@y
When Docker Compose runs a container, it uses two elements, 
[ENTRYPOINT and COMMAND](https://github.com/manuals//engine/containers/run.md#default-command-and-options), 
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
In the example provided:
@y
In the example provided:
@z

@x
- The hook is used to change the ownership of a volume to a non-root user (because volumes 
are created with root ownership by default).
- After the container starts, the `chown` command changes the ownership of the `/data` directory to user `1001`.
@y
- The hook is used to change the ownership of a volume to a non-root user (because volumes 
are created with root ownership by default).
- After the container starts, the `chown` command changes the ownership of the `/data` directory to user `1001`.
@z

@x
```yaml
services:
  app:
    image: backend
    user: 1001
    volumes:
      - data:/data    
    post_start:
      - command: chown -R /data 1001:1001
        user: root
@y
```yaml
services:
  app:
    image: backend
    user: 1001
    volumes:
      - data:/data    
    post_start:
      - command: chown -R /data 1001:1001
        user: root
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
In the following example, before the container stops, the `./data_flush.sh` script is 
run to perform any necessary cleanup.
@y
In the following example, before the container stops, the `./data_flush.sh` script is 
run to perform any necessary cleanup.
@z

@x
```yaml
services:
  app:
    image: backend
    pre_stop:
      - command: ./data_flush.sh
```
@y
```yaml
services:
  app:
    image: backend
    pre_stop:
      - command: ./data_flush.sh
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
