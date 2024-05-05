%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked questions for Docker Compose
keywords: documentation, docs,  docker, compose, faq, docker compose vs docker-compose
title: Compose FAQs
tags: [FAQ]
---
@y
---
description: Frequently asked questions for Docker Compose
keywords: documentation, docs,  docker, compose, faq, docker compose vs docker-compose
title: Compose FAQs
tags: [FAQ]
---
@z

@x
### What is the difference between `docker compose` and `docker-compose`
@y
### What is the difference between `docker compose` and `docker-compose`
@z

@x
Version one of the Docker Compose command-line binary was first released in 2014. It was written in Python, and is invoked with `docker-compose`. Typically, Compose V1 projects include a top-level version element in the compose.yml file, with values ranging from 2.0 to 3.8, which refer to the specific file formats.
@y
Version one of the Docker Compose command-line binary was first released in 2014. It was written in Python, and is invoked with `docker-compose`. Typically, Compose V1 projects include a top-level version element in the compose.yml file, with values ranging from 2.0 to 3.8, which refer to the specific file formats.
@z

@x
Version two of the Docker Compose command-line binary was announced in 2020, is written in Go, and is invoked with `docker compose`. Compose V2 ignores the version top-level element in the compose.yml file.
@y
Version two of the Docker Compose command-line binary was announced in 2020, is written in Go, and is invoked with `docker compose`. Compose V2 ignores the version top-level element in the compose.yml file.
@z

@x
For further information, see [History and development of Compose](intro/history.md).
@y
For further information, see [History and development of Compose](intro/history.md).
@z

@x
### What's the difference between `up`, `run`, and `start`?
@y
### What's the difference between `up`, `run`, and `start`?
@z

@x
Typically, you want `docker compose up`. Use `up` to start or restart all the
services defined in a `compose.yml`. In the default "attached"
mode, you see all the logs from all the containers. In "detached" mode (`-d`),
Compose exits after starting the containers, but the containers continue to run
in the background.
@y
Typically, you want `docker compose up`. Use `up` to start or restart all the
services defined in a `compose.yml`. In the default "attached"
mode, you see all the logs from all the containers. In "detached" mode (`-d`),
Compose exits after starting the containers, but the containers continue to run
in the background.
@z

@x
The `docker compose run` command is for running "one-off" or "adhoc" tasks. It
requires the service name you want to run and only starts containers for services
that the running service depends on. Use `run` to run tests or perform
an administrative task such as removing or adding data to a data volume
container. The `run` command acts like `docker run -ti` in that it opens an
interactive terminal to the container and returns an exit status matching the
exit status of the process in the container.
@y
The `docker compose run` command is for running "one-off" or "adhoc" tasks. It
requires the service name you want to run and only starts containers for services
that the running service depends on. Use `run` to run tests or perform
an administrative task such as removing or adding data to a data volume
container. The `run` command acts like `docker run -ti` in that it opens an
interactive terminal to the container and returns an exit status matching the
exit status of the process in the container.
@z

@x
The `docker compose start` command is useful only to restart containers
that were previously created but were stopped. It never creates new
containers.
@y
The `docker compose start` command is useful only to restart containers
that were previously created but were stopped. It never creates new
containers.
@z

@x
### Why do my services take 10 seconds to recreate or stop?
@y
### Why do my services take 10 seconds to recreate or stop?
@z

@x
The `docker compose stop` command attempts to stop a container by sending a `SIGTERM`. It then waits
for a [default timeout of 10 seconds](../reference/cli/docker/compose/stop.md). After the timeout,
a `SIGKILL` is sent to the container to forcefully kill it. If you
are waiting for this timeout, it means that your containers aren't shutting down
when they receive the `SIGTERM` signal.
@y
The `docker compose stop` command attempts to stop a container by sending a `SIGTERM`. It then waits
for a [default timeout of 10 seconds](../reference/cli/docker/compose/stop.md). After the timeout,
a `SIGKILL` is sent to the container to forcefully kill it. If you
are waiting for this timeout, it means that your containers aren't shutting down
when they receive the `SIGTERM` signal.
@z

@x
There has already been a lot written about this problem of
[processes handling signals](https://medium.com/@gchudnov/trapping-signals-in-docker-containers-7a57fdda7d86)
in containers.
@y
There has already been a lot written about this problem of
[processes handling signals](https://medium.com/@gchudnov/trapping-signals-in-docker-containers-7a57fdda7d86)
in containers.
@z

@x
To fix this problem, try the following:
@y
To fix this problem, try the following:
@z

@x
- Make sure you're using the exec form of `CMD` and `ENTRYPOINT`
in your Dockerfile.
@y
- Make sure you're using the exec form of `CMD` and `ENTRYPOINT`
in your Dockerfile.
@z

@x
  For example use `["program", "arg1", "arg2"]` not `"program arg1 arg2"`.
  Using the string form causes Docker to run your process using `bash` which
  doesn't handle signals properly. Compose always uses the JSON form, so don't
  worry if you override the command or entrypoint in your Compose file.
@y
  For example use `["program", "arg1", "arg2"]` not `"program arg1 arg2"`.
  Using the string form causes Docker to run your process using `bash` which
  doesn't handle signals properly. Compose always uses the JSON form, so don't
  worry if you override the command or entrypoint in your Compose file.
@z

@x
- If you are able, modify the application that you're running to
add an explicit signal handler for `SIGTERM`.
@y
- If you are able, modify the application that you're running to
add an explicit signal handler for `SIGTERM`.
@z

@x
- Set the `stop_signal` to a signal which the application knows how to handle:
@y
- Set the `stop_signal` to a signal which the application knows how to handle:
@z

@x
  ```yaml
  services:
    web:
      build: .
      stop_signal: SIGINT
  ```
@y
  ```yaml
  services:
    web:
      build: .
      stop_signal: SIGINT
  ```
@z

@x
- If you can't modify the application, wrap the application in a lightweight init
system (like [s6](https://skarnet.org/software/s6/)) or a signal proxy (like
[dumb-init](https://github.com/Yelp/dumb-init) or
[tini](https://github.com/krallin/tini)).  Either of these wrappers takes care of
handling `SIGTERM` properly.
@y
- If you can't modify the application, wrap the application in a lightweight init
system (like [s6](https://skarnet.org/software/s6/)) or a signal proxy (like
[dumb-init](https://github.com/Yelp/dumb-init) or
[tini](https://github.com/krallin/tini)).  Either of these wrappers takes care of
handling `SIGTERM` properly.
@z

@x
### How do I run multiple copies of a Compose file on the same host?
@y
### How do I run multiple copies of a Compose file on the same host?
@z

@x
Compose uses the project name to create unique identifiers for all of a
project's containers and other resources. To run multiple copies of a project,
set a custom project name using the [`-p` command line option](reference/index.md)
or the [`COMPOSE_PROJECT_NAME` environment variable](environment-variables/envvars.md#compose_project_name).
@y
Compose uses the project name to create unique identifiers for all of a
project's containers and other resources. To run multiple copies of a project,
set a custom project name using the [`-p` command line option](reference/index.md)
or the [`COMPOSE_PROJECT_NAME` environment variable](environment-variables/envvars.md#compose_project_name).
@z

@x
### Can I use JSON instead of YAML for my Compose file?
@y
### Can I use JSON instead of YAML for my Compose file?
@z

@x
Yes. [YAML is a superset of JSON](https://stackoverflow.com/a/1729545/444646) so
any JSON file should be valid YAML. To use a JSON file with Compose,
specify the filename to use, for example:
@y
Yes. [YAML is a superset of JSON](https://stackoverflow.com/a/1729545/444646) so
any JSON file should be valid YAML. To use a JSON file with Compose,
specify the filename to use, for example:
@z

@x
```console
$ docker compose -f docker-compose.json up
```
@y
```console
$ docker compose -f docker-compose.json up
```
@z

@x
### Should I include my code with `COPY`/`ADD` or a volume?
@y
### Should I include my code with `COPY`/`ADD` or a volume?
@z

@x
You can add your code to the image using `COPY` or `ADD` directive in a
`Dockerfile`.  This is useful if you need to relocate your code along with the
Docker image, for example when you're sending code to another environment
(production, CI, etc).
@y
You can add your code to the image using `COPY` or `ADD` directive in a
`Dockerfile`.  This is useful if you need to relocate your code along with the
Docker image, for example when you're sending code to another environment
(production, CI, etc).
@z

@x
Use a `volume` if you want to make changes to your code and see them
reflected immediately, for example when you're developing code and your server
supports hot code reloading or live-reload.
@y
Use a `volume` if you want to make changes to your code and see them
reflected immediately, for example when you're developing code and your server
supports hot code reloading or live-reload.
@z

@x
There may be cases where you want to use both. You can have the image
include the code using a `COPY`, and use a `volume` in your Compose file to
include the code from the host during development. The volume overrides
the directory contents of the image.
@y
There may be cases where you want to use both. You can have the image
include the code using a `COPY`, and use a `volume` in your Compose file to
include the code from the host during development. The volume overrides
the directory contents of the image.
@z
