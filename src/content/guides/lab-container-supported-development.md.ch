%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: "Lab: Container-Supported Development"
linkTitle: "Lab: Container-Supported Development"
description: |
  Learn to use containers for local development by running a PostgreSQL
  database, defining a Compose file, and adding a pgAdmin dev tool — no local
  installations required.
summary: |
  Hands-on lab: Run dependent services in containers during local development.
  Start a PostgreSQL database, write a compose.yaml, and add a database
  visualizer — all without installing anything on the host.
keywords: Docker, Compose, local development, PostgreSQL, pgAdmin, containers, lab, labspace
@y
title: "Lab: Container-Supported Development"
linkTitle: "Lab: Container-Supported Development"
description: |
  Learn to use containers for local development by running a PostgreSQL
  database, defining a Compose file, and adding a pgAdmin dev tool — no local
  installations required.
summary: |
  Hands-on lab: Run dependent services in containers during local development.
  Start a PostgreSQL database, write a compose.yaml, and add a database
  visualizer — all without installing anything on the host.
keywords: Docker, Compose, local development, PostgreSQL, pgAdmin, containers, lab, labspace
@z

@x
  time: 30 minutes
@y
  time: 30 分
@z

@x
    - title: Docker Compose docs
      url: /compose/
    - title: Bind mounts
      url: /engine/storage/bind-mounts/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-container-supported-development
@y
    - title: Docker Compose docs
      url: __SUBDIR__/compose/
    - title: Bind mounts
      url: __SUBDIR__/engine/storage/bind-mounts/
    - title: Labspace repository
      url: https://github.com/dockersamples/labspace-container-supported-development
@z

@x
Use containers to run the services your app depends on — databases, caches,
message queues — without installing anything locally. This lab walks through
running PostgreSQL in a container, writing a `compose.yaml` your whole team
can share, and adding a pgAdmin visualizer to the dev stack.
@y
Use containers to run the services your app depends on — databases, caches,
message queues — without installing anything locally. This lab walks through
running PostgreSQL in a container, writing a `compose.yaml` your whole team
can share, and adding a pgAdmin visualizer to the dev stack.
@z

@x
## Launch the lab
@y
## Launch the lab
@z

@x
{{< labspace-launch image="dockersamples/labspace-container-supported-development" >}}
@y
{{< labspace-launch image="dockersamples/labspace-container-supported-development" >}}
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
- Run a PostgreSQL database in a container with no local installation
- Use bind mounts to seed a database with schema and initial data at startup
- Write a `compose.yaml` that codifies the entire dev stack for the team
- Add a pgAdmin container to visualize and inspect the database
- Understand how containerized dev stacks reduce onboarding time and environment drift
@y
- Run a PostgreSQL database in a container with no local installation
- Use bind mounts to seed a database with schema and initial data at startup
- Write a `compose.yaml` that codifies the entire dev stack for the team
- Add a pgAdmin container to visualize and inspect the database
- Understand how containerized dev stacks reduce onboarding time and environment drift
@z

@x
## Modules
@y
## Modules
@z

@x
| #   | Module                           | Description                                                                     |
| --- | -------------------------------- | ------------------------------------------------------------------------------- |
| 1   | Introduction                     | Meet the sample app and understand the container-supported development approach |
| 2   | Running a Containerized Database | Start PostgreSQL, connect the app, and seed the database using bind mounts      |
| 3   | Making Life Easier with Compose  | Replace `docker run` commands with a shared `compose.yaml`                      |
| 4   | Adding Dev Tools                 | Add pgAdmin to the Compose stack for database visualization                     |
| 5   | Recap                            | Review key takeaways and explore related guides                                 |
@y
| #   | Module                           | Description                                                                     |
| --- | -------------------------------- | ------------------------------------------------------------------------------- |
| 1   | Introduction                     | Meet the sample app and understand the container-supported development approach |
| 2   | Running a Containerized Database | Start PostgreSQL, connect the app, and seed the database using bind mounts      |
| 3   | Making Life Easier with Compose  | Replace `docker run` commands with a shared `compose.yaml`                      |
| 4   | Adding Dev Tools                 | Add pgAdmin to the Compose stack for database visualization                     |
| 5   | Recap                            | Review key takeaways and explore related guides                                 |
@z
