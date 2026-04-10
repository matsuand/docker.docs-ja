%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Lab: Docker Compose Quickstart"
linkTitle: "Lab: Docker Compose Quickstart"
description: |
  Build a multi-container Flask and Redis application from scratch using Docker
  Compose. Learn health checks, watch mode, named volumes, and multi-file
  configurations.
summary: |
  Hands-on lab: Define and run a multi-container app with Docker Compose.
  Progress from a bare compose.yaml through health checks, live development
  with watch mode, data persistence, and modular Compose file composition.
keywords: Docker, Compose, multi-container, Flask, Redis, watch mode, volumes, lab, labspace
@y
title: "Lab: Docker Compose Quickstart"
linkTitle: "Lab: Docker Compose Quickstart"
description: |
  Build a multi-container Flask and Redis application from scratch using Docker
  Compose. Learn health checks, watch mode, named volumes, and multi-file
  configurations.
summary: |
  Hands-on lab: Define and run a multi-container app with Docker Compose.
  Progress from a bare compose.yaml through health checks, live development
  with watch mode, data persistence, and modular Compose file composition.
keywords: Docker, Compose, multi-container, Flask, Redis, watch mode, volumes, lab, labspace
@z

@x
  time: 45 minutes
@y
  time: 45 分
@z

@x
    - title: Docker Compose docs
      url: /compose/
    - title: Compose watch mode
      url: /compose/how-tos/file-watch/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-compose-quickstart
@y
    - title: Docker Compose docs
      url: __SUBDIR__/compose/
    - title: Compose watch mode
      url: __SUBDIR__/compose/how-tos/file-watch/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-compose-quickstart
@z

@x
Build a Python Flask and Redis hit-counter app using Docker Compose, starting
from a bare `compose.yaml` and progressively adding production-quality
features at each step.
@y
Build a Python Flask and Redis hit-counter app using Docker Compose, starting
from a bare `compose.yaml` and progressively adding production-quality
features at each step.
@z

@x
## Launch the lab
@y
## Launch the lab
@z

@x
{{< labspace-launch image="dockersamples/labspace-compose-quickstart" >}}
@y
{{< labspace-launch image="dockersamples/labspace-compose-quickstart" >}}
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
By the end of this Labspace, you will have completed the following:
@y
By the end of this Labspace, you will have completed the following:
@z

@x
- Define a multi-service application in a `compose.yaml` file and manage it with Compose commands
- Control service startup order using health checks and `depends_on` conditions
- Iterate on code without manual rebuilds using Compose watch mode
- Persist data across container restarts with named volumes
- Modularize a stack across multiple files using the `include` directive
- Use `config`, `logs`, and `exec` to inspect and debug a running stack
@y
- Define a multi-service application in a `compose.yaml` file and manage it with Compose commands
- Control service startup order using health checks and `depends_on` conditions
- Iterate on code without manual rebuilds using Compose watch mode
- Persist data across container restarts with named volumes
- Modularize a stack across multiple files using the `include` directive
- Use `config`, `logs`, and `exec` to inspect and debug a running stack
@z

@x
## Modules
@y
## Modules
@z

@x
| #   | Module                           | Description                                                           |
| --- | -------------------------------- | --------------------------------------------------------------------- |
| 1   | Introduction                     | Tour the starter app and verify the environment                       |
| 2   | Defining Services                | Write the first `compose.yaml` and bring up the Flask and Redis stack |
| 3   | Health Checks & Startup Order    | Add a Redis healthcheck and `depends_on` to eliminate race conditions |
| 4   | Live Development with Watch Mode | Configure watch mode to sync code changes without manual rebuilds     |
| 5   | Persistence & Debugging          | Add a named volume so Redis data survives `docker compose down`       |
| 6   | Using Multiple Compose Files     | Extract Redis into `infra.yaml` and compose files with `include`      |
| 7   | Additional Commands              | Use `config`, `logs -f`, and `exec` to inspect the running stack      |
| 8   | Recap                            | Review what was built and explore next steps                          |
@y
| #   | Module                           | Description                                                           |
| --- | -------------------------------- | --------------------------------------------------------------------- |
| 1   | Introduction                     | Tour the starter app and verify the environment                       |
| 2   | Defining Services                | Write the first `compose.yaml` and bring up the Flask and Redis stack |
| 3   | Health Checks & Startup Order    | Add a Redis healthcheck and `depends_on` to eliminate race conditions |
| 4   | Live Development with Watch Mode | Configure watch mode to sync code changes without manual rebuilds     |
| 5   | Persistence & Debugging          | Add a named volume so Redis data survives `docker compose down`       |
| 6   | Using Multiple Compose Files     | Extract Redis into `infra.yaml` and compose files with `include`      |
| 7   | Additional Commands              | Use `config`, `logs -f`, and `exec` to inspect the running stack      |
| 8   | Recap                            | Review what was built and explore next steps                          |
@z
