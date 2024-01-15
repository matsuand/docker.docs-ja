%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Version and name top-level elements
description: Understand when and if to set the version and name top-level element
keywords: compose, compose specification, services, compose file reference
---
@y
---
title: Version and name top-level elements
description: Understand when and if to set the version and name top-level element
keywords: compose, compose specification, services, compose file reference
---
@z

@x
## Version top-level element
@y
## Version top-level element
@z

@x
The top-level `version` property is defined by the Compose Specification for backward compatibility. It is only informative.
@y
The top-level `version` property is defined by the Compose Specification for backward compatibility. It is only informative.
@z

@x
Compose doesn't use `version` to select an exact schema to validate the Compose file, but
prefers the most recent schema when it's implemented.
@y
Compose doesn't use `version` to select an exact schema to validate the Compose file, but
prefers the most recent schema when it's implemented.
@z

@x
Compose validates whether it can fully parse the Compose file. If some fields are unknown, typically
because the Compose file was written with fields defined by a newer version of the Specification, you'll receive a warning message. 
@y
Compose validates whether it can fully parse the Compose file. If some fields are unknown, typically
because the Compose file was written with fields defined by a newer version of the Specification, you'll receive a warning message. 
@z

@x
## Name top-level element
@y
## Name top-level element
@z

@x
The top-level `name` property is defined by the Specification as the project name to be used if you don't set one explicitly.
Compose offers a way for you to override this name, and sets a
default project name to be used if the top-level `name` element is not set.
@y
The top-level `name` property is defined by the Specification as the project name to be used if you don't set one explicitly.
Compose offers a way for you to override this name, and sets a
default project name to be used if the top-level `name` element is not set.
@z

@x
Whenever a project name is defined by top-level `name` or by some custom mechanism, it is exposed for
[interpolation](12-interpolation.md) and environment variable resolution as `COMPOSE_PROJECT_NAME`
@y
Whenever a project name is defined by top-level `name` or by some custom mechanism, it is exposed for
[interpolation](12-interpolation.md) and environment variable resolution as `COMPOSE_PROJECT_NAME`
@z

@x
```yml
services:
  foo:
    image: busybox
    environment:
      - COMPOSE_PROJECT_NAME
    command: echo "I'm running ${COMPOSE_PROJECT_NAME}"
```
@y
```yml
services:
  foo:
    image: busybox
    environment:
      - COMPOSE_PROJECT_NAME
    command: echo "I'm running ${COMPOSE_PROJECT_NAME}"
```
@z
