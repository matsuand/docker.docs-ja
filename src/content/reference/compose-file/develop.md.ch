%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Compose Develop Specification
description: Learn about the Compose Develop Specification
keywords: compose, compose specification, compose file reference, compose develop specification
@y
title: Compose Develop Specification
description: Learn about the Compose Develop Specification
keywords: compose, compose specification, compose file reference, compose develop specification
@z

@x
> **Note:** 
>
> Develop is an optional part of the Compose Specification. It is available with Docker Compose version 2.22.0 and later.
@y
> **Note:** 
>
> Develop is an optional part of the Compose Specification. It is available with Docker Compose version 2.22.0 and later.
@z

@x
{{< include "compose/develop.md" >}}
@y
{{< include "compose/develop.md" >}}
@z

@x
This page defines how Compose behaves to efficiently assist you and defines the development constraints and workflows set by Compose. Only a subset of
Compose file services may require a `develop` subsection.
@y
This page defines how Compose behaves to efficiently assist you and defines the development constraints and workflows set by Compose. Only a subset of
Compose file services may require a `develop` subsection.
@z

@x
## Illustrative example
@y
## Illustrative example
@z

@x
```yaml
services:
  frontend:
    image: example/webapp
    build: ./webapp
    develop:
      watch: 
        # sync static content
        - path: ./webapp/html
          action: sync
          target: /var/www
          ignore:
            - node_modules/
@y
```yaml
services:
  frontend:
    image: example/webapp
    build: ./webapp
    develop:
      watch: 
        # sync static content
        - path: ./webapp/html
          action: sync
          target: /var/www
          ignore:
            - node_modules/
@z

@x
  backend:
    image: example/backend
    build: ./backend
    develop:
      watch: 
        # rebuild image and recreate service
        - path: ./backend/src
          action: rebuild
```
@y
  backend:
    image: example/backend
    build: ./backend
    develop:
      watch: 
        # rebuild image and recreate service
        - path: ./backend/src
          action: rebuild
```
@z

@x
## Attributes
@y
## Attributes
@z

@x
The `develop` subsection defines configuration options that are applied by Compose to assist you during development of a service with optimized workflows.
@y
The `develop` subsection defines configuration options that are applied by Compose to assist you during development of a service with optimized workflows.
@z

@x
### watch
@y
### watch
@z

@x
The `watch` attribute defines a list of rules that control automatic service updates based on local file changes. `watch` is a sequence, each individual item in the sequence defines a rule to be applied by 
Compose to monitor source code for changes. For more information, see [Use Compose Watch](/manuals/compose/how-tos/file-watch.md).
@y
The `watch` attribute defines a list of rules that control automatic service updates based on local file changes. `watch` is a sequence, each individual item in the sequence defines a rule to be applied by 
Compose to monitor source code for changes. For more information, see [Use Compose Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
#### action
@y
#### action
@z

@x
`action` defines the action to take when changes are detected. If `action` is set to:
@y
`action` defines the action to take when changes are detected. If `action` is set to:
@z

@x
- `rebuild`, Compose rebuilds the service image based on the `build` section and recreates the service with the updated image.
- `sync`, Compose keeps the existing service container(s) running, but synchronizes source files with container content according to the `target` attribute.
- `sync+restart`, Compose synchronizes source files with container content according to the `target` attribute, and then restarts the container.
@y
- `rebuild`, Compose rebuilds the service image based on the `build` section and recreates the service with the updated image.
- `sync`, Compose keeps the existing service container(s) running, but synchronizes source files with container content according to the `target` attribute.
- `sync+restart`, Compose synchronizes source files with container content according to the `target` attribute, and then restarts the container.
@z

@x
> `sync+restart` attribute is available with Docker Compose version 2.23.0 and later.
@y
> `sync+restart` attribute is available with Docker Compose version 2.23.0 and later.
@z

@x
#### ignore
@y
#### ignore
@z

@x
The `ignore` attribute can be used to define a list of patterns for paths to be ignored. Any updated file
that matches a pattern, or belongs to a folder that matches a pattern, won't trigger services to be re-created. 
The syntax is the same as `.dockerignore` file: 
@y
The `ignore` attribute can be used to define a list of patterns for paths to be ignored. Any updated file
that matches a pattern, or belongs to a folder that matches a pattern, won't trigger services to be re-created. 
The syntax is the same as `.dockerignore` file: 
@z

@x
- `*` matches 0 or more characters in a file name. 
- `?` matches a single character in file name. 
- `*/*` matches two nested folders with arbitrary names
- `**` matches an arbitrary number of nested folders
@y
- `*` matches 0 or more characters in a file name. 
- `?` matches a single character in file name. 
- `*/*` matches two nested folders with arbitrary names
- `**` matches an arbitrary number of nested folders
@z

@x
If the build context includes a `.dockerignore` file, the patterns in this file is loaded as implicit content
for the `ignores` file, and values set in the Compose model are appended.
@y
If the build context includes a `.dockerignore` file, the patterns in this file is loaded as implicit content
for the `ignores` file, and values set in the Compose model are appended.
@z

@x
#### path
@y
#### path
@z

@x
`path` attribute defines the path to source code (relative to the project directory) to monitor for changes. Updates to any file
inside the path, which doesn't match any `ignore` rule, triggers the configured action.
@y
`path` attribute defines the path to source code (relative to the project directory) to monitor for changes. Updates to any file
inside the path, which doesn't match any `ignore` rule, triggers the configured action.
@z

@x
#### target
@y
#### target
@z

@x
`target` attribute only applies when `action` is configured for `sync`. Files within `path` with changes are synchronized
with container filesystem, so that the latter is always running with up-to-date content.
@y
`target` attribute only applies when `action` is configured for `sync`. Files within `path` with changes are synchronized
with container filesystem, so that the latter is always running with up-to-date content.
@z
