%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: History and development of Docker Compose
linkTitle: History and development
description: Explore the evolution of Docker Compose from v1 to v5, including CLI changes, YAML versioning, and the Compose Specification.
keywords: compose, compose yaml, swarm, migration, compatibility, docker compose vs docker-compose
@y
title: History and development of Docker Compose
linkTitle: History and development
description: Explore the evolution of Docker Compose from v1 to v5, including CLI changes, YAML versioning, and the Compose Specification.
keywords: compose, compose yaml, swarm, migration, compatibility, docker compose vs docker-compose
@z

@x
This page provides:
 - A brief history of the development of the Docker Compose CLI
 - A clear explanation of the major versions and file formats that make up Compose v1, v2, and v5
 - The main differences between Compose v1, v2, and v5
@y
This page provides:
 - A brief history of the development of the Docker Compose CLI
 - A clear explanation of the major versions and file formats that make up Compose v1, v2, and v5
 - The main differences between Compose v1, v2, and v5
@z

@x
## Introduction
@y
## Introduction
@z

@x
![Image showing the main differences between Compose v1, Compose v2, and Compose v5](../images/v1-versus-v2-versus-v5.png)
@y
![Image showing the main differences between Compose v1, Compose v2, and Compose v5](../images/v1-versus-v2-versus-v5.png)
@z

@x
The diagram above highlights the key differences between Docker Compose v1, v2, and v5. Today, the supported Docker Compose CLI versions are Compose v2 and Compose v5, both of which are defined by the [Compose Specification](/reference/compose-file/_index.md).
@y
The diagram above highlights the key differences between Docker Compose v1, v2, and v5. Today, the supported Docker Compose CLI versions are Compose v2 and Compose v5, both of which are defined by the [Compose Specification](/reference/compose-file/_index.md).
@z

@x
### Docker Compose CLI versioning
@y
### Docker Compose CLI versioning
@z

@x
Compose v1 was first released in 2014. It was written in Python and invoked with `docker-compose`.
Typically, Compose v1 projects include a top-level `version` element in the `compose.yaml` file, with values ranging from `2.0` to `3.8`, which refer to the specific [file formats](#compose-file-format-versioning).
@y
Compose v1 was first released in 2014. It was written in Python and invoked with `docker-compose`.
Typically, Compose v1 projects include a top-level `version` element in the `compose.yaml` file, with values ranging from `2.0` to `3.8`, which refer to the specific [file formats](#compose-file-format-versioning).
@z

@x
Compose v2, announced in 2020, is written in Go and is invoked with `docker compose`.
Unlike v1, Compose v2 ignores the `version` top-level element in the `compose.yaml` file and relies entirely on the Compose Specification to interpret the file.
@y
Compose v2, announced in 2020, is written in Go and is invoked with `docker compose`.
Unlike v1, Compose v2 ignores the `version` top-level element in the `compose.yaml` file and relies entirely on the Compose Specification to interpret the file.
@z

@x
Compose v5, released in 2025, is functionally identical to Compose v2. Its primary distinction is the introduction of an official [Go SDK](/manuals/compose/compose-sdk.md). This SDK provides a comprehensive API that lets you integrate Compose functionality directly into your applications, allowing you to load, validate, and manage multi-container environments without relying on the Compose CLI. To avoid confusion with the legacy Compose file formats labeled “v2” and “v3,” the versioning was advanced directly to v5.
@y
Compose v5, released in 2025, is functionally identical to Compose v2. Its primary distinction is the introduction of an official [Go SDK](/manuals/compose/compose-sdk.md). This SDK provides a comprehensive API that lets you integrate Compose functionality directly into your applications, allowing you to load, validate, and manage multi-container environments without relying on the Compose CLI. To avoid confusion with the legacy Compose file formats labeled “v2” and “v3,” the versioning was advanced directly to v5.
@z

@x
### Compose file format versioning
@y
### Compose file format versioning
@z

@x
The Docker Compose CLIs are defined by specific file formats. 
@y
The Docker Compose CLIs are defined by specific file formats. 
@z

@x
Three major versions of the Compose file format for Compose v1 were released:
- Compose file format 1 with Compose 1.0.0 in 2014
- Compose file format 2.x with Compose 1.6.0 in 2016
- Compose file format 3.x with Compose 1.10.0 in 2017
@y
Three major versions of the Compose file format for Compose v1 were released:
- Compose file format 1 with Compose 1.0.0 in 2014
- Compose file format 2.x with Compose 1.6.0 in 2016
- Compose file format 3.x with Compose 1.10.0 in 2017
@z

@x
Compose file format 1 is substantially different to all the following formats as it lacks a top-level `services` key.
Its usage is historical and files written in this format don't run with Compose v2.
@y
Compose file format 1 is substantially different to all the following formats as it lacks a top-level `services` key.
Its usage is historical and files written in this format don't run with Compose v2.
@z

@x
Compose file format 2.x and 3.x are very similar to each other, but the latter introduced many new options targeted at Swarm deployments.
@y
Compose file format 2.x and 3.x are very similar to each other, but the latter introduced many new options targeted at Swarm deployments.
@z

@x
To address confusion around Compose CLI versioning, Compose file format versioning, and feature parity depending on whether Swarm mode was in use, file format 2.x and 3.x were merged into the [Compose Specification](/reference/compose-file/_index.md). 
@y
To address confusion around Compose CLI versioning, Compose file format versioning, and feature parity depending on whether Swarm mode was in use, file format 2.x and 3.x were merged into the [Compose Specification](reference/compose-file/_index.md). 
@z

@x
Compose v2 and v5 uses the Compose Specification for project definition. Unlike the prior file formats, the Compose Specification is rolling and makes the `version` top-level element optional. Compose v2 and v5 also makes use of optional specifications - [Deploy](/reference/compose-file/deploy.md), [Develop](/reference/compose-file/develop.md), and [Build](/reference/compose-file/build.md).
@y
Compose v2 and v5 uses the Compose Specification for project definition. Unlike the prior file formats, the Compose Specification is rolling and makes the `version` top-level element optional. Compose v2 and v5 also makes use of optional specifications - [Deploy](reference/compose-file/deploy.md), [Develop](reference/compose-file/develop.md), and [Build](reference/compose-file/build.md).
@z

@x
To make migration easier, Compose v2 and v5 has backwards compatibility for certain elements that have been deprecated or changed between Compose file format 2.x/3.x and the Compose Specification.
@y
To make migration easier, Compose v2 and v5 has backwards compatibility for certain elements that have been deprecated or changed between Compose file format 2.x/3.x and the Compose Specification.
@z

@x
## What's next?
@y
## What's next?
@z

@x
- [How Compose works](compose-application-model.md)
- [Compose Specification reference](/reference/compose-file/_index.md)
@y
- [How Compose works](compose-application-model.md)
- [Compose Specification reference](reference/compose-file/_index.md)
@z
