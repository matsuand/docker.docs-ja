%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Find the latest recommended version of the Docker Compose file format
  for defining multi-container applications.
keywords: docker compose file, docker compose yml, docker compose reference, docker
  compose cmd, docker compose user, docker compose image, yaml spec, docker compose
  syntax, yaml specification, docker compose specification
title: Compose file reference
@y
description: Find the latest recommended version of the Docker Compose file format
  for defining multi-container applications.
keywords: docker compose file, docker compose yml, docker compose reference, docker
  compose cmd, docker compose user, docker compose image, yaml spec, docker compose
  syntax, yaml specification, docker compose specification
title: Compose ファイルリファレンス
@z

% grid:

@x
- title: Version and name top-level element
  description: Understand version and name attributes for Compose.
  icon: text_snippet
  link: /reference/compose-file/version-and-name/
@y
- title: Version and name top-level element
  description: Understand version and name attributes for Compose.
  icon: text_snippet
  link: __SUBDIR__/reference/compose-file/version-and-name/
@z

@x
- title: Services top-level element
  description: Explore all services attributes for Compose.
  icon: construction
  link: /reference/compose-file/services/
@y
- title: Services top-level element
  description: Explore all services attributes for Compose.
  icon: construction
  link: __SUBDIR__/reference/compose-file/services/
@z

@x
- title: Networks top-level element
  description: Find all networks attributes for Compose.
  icon: lan
  link: /reference/compose-file/networks/
@y
- title: Networks top-level element
  description: Find all networks attributes for Compose.
  icon: lan
  link: __SUBDIR__/reference/compose-file/networks/
@z

@x
- title: Volumes top-level element
  description: Explore all volumes attributes for Compose.
  icon: database
  link: /reference/compose-file/volumes/
@y
- title: Volumes top-level element
  description: Explore all volumes attributes for Compose.
  icon: database
  link: __SUBDIR__/reference/compose-file/volumes/
@z

@x
- title: Configs top-level element
  description: Find out about configs in Compose.
  icon: settings
  link: /reference/compose-file/configs/
@y
- title: Configs top-level element
  description: Find out about configs in Compose.
  icon: settings
  link: __SUBDIR__/reference/compose-file/configs/
@z

@x
- title: Secrets top-level element
  description: Learn about secrets in Compose.
  icon: lock
  link: /reference/compose-file/secrets/
@y
- title: Secrets top-level element
  description: Learn about secrets in Compose.
  icon: lock
  link: __SUBDIR__/reference/compose-file/secrets/
@z

% snip aliases...

@x
>**New to Docker Compose?**
>
> Find more information about the [key features and use cases of Docker Compose](/manuals/compose/intro/features-uses.md) or [try the quickstart guide](/manuals/compose/gettingstarted.md).
@y
>**New to Docker Compose?**
>
> Find more information about the [key features and use cases of Docker Compose](manuals/compose/intro/features-uses.md) or [try the quickstart guide](manuals/compose/gettingstarted.md).
@z

@x
The Compose Specification is the latest and recommended version of the Compose file format. It helps you define a [Compose file](/manuals/compose/intro/compose-application-model.md) which is used to configure your Docker application’s services, networks, volumes, and more.
@y
The Compose Specification is the latest and recommended version of the Compose file format. It helps you define a [Compose file](manuals/compose/intro/compose-application-model.md) which is used to configure your Docker application’s services, networks, volumes, and more.
@z

@x
Legacy versions 2.x and 3.x of the Compose file format were merged into the Compose Specification. It is implemented in versions 1.27.0 and above (also known as Compose V2) of the Docker Compose CLI.
@y
Legacy versions 2.x and 3.x of the Compose file format were merged into the Compose Specification. It is implemented in versions 1.27.0 and above (also known as Compose V2) of the Docker Compose CLI.
@z

@x
The Compose Specification on Docker Docs is the Docker Compose implementation. If you wish to implement your own version of the Compose Specification, see the [Compose Specification repository](https://github.com/compose-spec/compose-spec).
@y
The Compose Specification on Docker Docs is the Docker Compose implementation. If you wish to implement your own version of the Compose Specification, see the [Compose Specification repository](https://github.com/compose-spec/compose-spec).
@z

@x
Use the following links to navigate key sections of the Compose Specification. 
@y
Use the following links to navigate key sections of the Compose Specification. 
@z

% snip grid...
