%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Version and name top-level elements
description: Understand when and if to set the version and name top-level element
keywords: compose, compose specification, services, compose file reference
@y
title: Version and name top-level elements
description: Understand when and if to set the version and name top-level element
keywords: compose, compose specification, services, compose file reference
@z

@x
## Version top-level element (obsolete)
@y
## Version top-level element (obsolete)
@z

@x
> [!IMPORTANT]
>
> The top-level `version` property is defined by the Compose Specification for backward compatibility. It is only informative and you'll receive a warning message that it is obsolete if used. 
@y
> [!IMPORTANT]
>
> The top-level `version` property is defined by the Compose Specification for backward compatibility. It is only informative and you'll receive a warning message that it is obsolete if used. 
@z

@x
Compose always uses the most recent schema to validate the Compose file, regardless of the `version` field.
@y
Compose always uses the most recent schema to validate the Compose file, regardless of the `version` field.
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
The top-level `name` property is defined by the Compose Specification as the project name to be used if you don't set one explicitly.
@y
The top-level `name` property is defined by the Compose Specification as the project name to be used if you don't set one explicitly.
@z

@x
Compose offers a way for you to override this name, and sets a
default project name to be used if the top-level `name` element is not set.
@y
Compose offers a way for you to override this name, and sets a
default project name to be used if the top-level `name` element is not set.
@z

@x
Whenever a project name is defined by top-level `name` or by some custom mechanism, it is exposed for
[interpolation](interpolation.md) and environment variable resolution as `COMPOSE_PROJECT_NAME`
@y
Whenever a project name is defined by top-level `name` or by some custom mechanism, it is exposed for
[interpolation](interpolation.md) and environment variable resolution as `COMPOSE_PROJECT_NAME`
@z

@x
```yml
name: myapp
@y
```yml
name: myapp
@z

@x
services:
  foo:
    image: busybox
    command: echo "I'm running ${COMPOSE_PROJECT_NAME}"
```
@y
services:
  foo:
    image: busybox
    command: echo "I'm running ${COMPOSE_PROJECT_NAME}"
```
@z

@x
For more information on other ways to name Compose projects, see [Specify a project name](/manuals/compose/how-tos/project-name.md).
@y
For more information on other ways to name Compose projects, see [Specify a project name](manuals/compose/how-tos/project-name.md).
@z
