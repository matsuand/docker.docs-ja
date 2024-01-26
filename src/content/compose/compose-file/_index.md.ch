%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
description: Find the latest recommended version of the Docker Compose file format
  for defining multi-container applications.
keywords: docker compose file, docker compose yml, docker compose reference, docker
  compose cmd, docker compose user, docker compose image, yaml spec, docker compose
  syntax, yaml specification, docker compose specification
title: Overview
toc_max: 4
toc_min: 1
@y
---
description: Find the latest recommended version of the Docker Compose file format
  for defining multi-container applications.
keywords: docker compose file, docker compose yml, docker compose reference, docker
  compose cmd, docker compose user, docker compose image, yaml spec, docker compose
  syntax, yaml specification, docker compose specification
title: Overview
toc_max: 4
toc_min: 1
@z

@x
grid:
- title: Version and name top-level element
  description: Understand version and name attributes for Compose.
  icon: feed
  link: /compose/compose-file/04-version-and-name/
@y
grid:
- title: Version and name top-level element
  description: Understand version and name attributes for Compose.
  icon: feed
  link: __SUBDIR__/compose/compose-file/04-version-and-name/
@z

@x
- title: Services top-level element
  description: Explore all services attributes for Compose.
  icon: construction
  link: /compose/compose-file/05-services/
@y
- title: Services top-level element
  description: Explore all services attributes for Compose.
  icon: construction
  link: __SUBDIR__/compose/compose-file/05-services/
@z

@x
- title: Networks top-level element
  description: Find all networks attributes for Compose.
  icon: lan
  link: /compose/compose-file/06-networks/
@y
- title: Networks top-level element
  description: Find all networks attributes for Compose.
  icon: lan
  link: __SUBDIR__/compose/compose-file/06-networks/
@z

@x
- title: Volumes top-level element
  description: Explore all volumes attributes for Compose.
  icon: database
  link: /compose/compose-file/07-volumes/
@y
- title: Volumes top-level element
  description: Explore all volumes attributes for Compose.
  icon: database
  link: __SUBDIR__/compose/compose-file/07-volumes/
@z

@x
- title: Configs top-level element
  description: Find out about configs in Compose.
  icon: settings
  link: /compose/compose-file/08-configs/
@y
- title: Configs top-level element
  description: Find out about configs in Compose.
  icon: settings
  link: __SUBDIR__/compose/compose-file/08-configs/
@z

@x
- title: Secrets top-level element
  description: Learn about secrets in Compose.
  icon: lock
  link: /compose/compose-file/09-secrets/
@y
- title: Secrets top-level element
  description: Learn about secrets in Compose.
  icon: lock
  link: __SUBDIR__/compose/compose-file/09-secrets/
@z

@x
aliases:
- /compose/yaml/
- /compose/compose-file/compose-file-v1/
---
@y
aliases:
- /compose/yaml/
- /compose/compose-file/compose-file-v1/
---
@z

@x
>**New to Compose?**
>
> Find more information about the [key features and use cases of Docker Compose](../intro/features-uses.md) or [try the get started guide](../gettingstarted.md).
{ .tip }
@y
>**New to Compose?**
>
> Find more information about the [key features and use cases of Docker Compose](../intro/features-uses.md) or [try the get started guide](../gettingstarted.md).
{ .tip }
@z

@x
The Compose Specification is the latest and recommended version of the Compose file format. It helps you define a [Compose file](../compose-application-model.md) which is used to configure your Docker application’s services, networks, volumes, and more.
@y
The Compose Specification is the latest and recommended version of the Compose file format. It helps you define a [Compose file](../compose-application-model.md) which is used to configure your Docker application’s services, networks, volumes, and more.
@z

@x
Legacy versions 2.x and 3.x of the Compose file format were merged into the Compose Specification. It is implemented in versions 1.27.0 and above (also known as Compose V2) of the Docker Compose CLI.
@y
Legacy versions 2.x and 3.x of the Compose file format were merged into the Compose Specification. It is implemented in versions 1.27.0 and above (also known as Compose V2) of the Docker Compose CLI.
@z

@x
The Compose Specification on Docker Docs is the Docker Compose implementation. If you wish to implement your own version of the Compose Specification, see the [Compose Specication repository](https://github.com/compose-spec/compose-spec).
@y
The Compose Specification on Docker Docs is the Docker Compose implementation. If you wish to implement your own version of the Compose Specification, see the [Compose Specication repository](https://github.com/compose-spec/compose-spec).
@z

@x
> **Note**
>
> Compose V1 no longer receives updates and is not available in new releases of Docker Desktop.
>
> Compose V2 is included with all currently supported versions of Docker Desktop.
> For more information, see [Migrate to Compose V2](/compose/migrate).
@y
> **Note**
>
> Compose V1 no longer receives updates and is not available in new releases of Docker Desktop.
>
> Compose V2 is included with all currently supported versions of Docker Desktop.
> For more information, see [Migrate to Compose V2](/compose/migrate).
@z

@x
Use the following links to navigate key sections of the Compose Specification. 
@y
Use the following links to navigate key sections of the Compose Specification. 
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
