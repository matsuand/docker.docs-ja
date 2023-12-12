%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How merging Compose files works
keywords: compose, docker, merge, compose file
title: Merge Compose files
---
@y
---
description: How merging Compose files works
keywords: compose, docker, merge, compose file
title: Merge Compose files
---
@z

@x
Docker Compose lets you merge and override a set of Compose files together to create a composite Compose file.
@y
Docker Compose lets you merge and override a set of Compose files together to create a composite Compose file.
@z

@x
By default, Compose reads two files, a `compose.yml` and an optional
`compose.override.yml` file. By convention, the `compose.yml`
contains your base configuration. The override file can
contain configuration overrides for existing services or entirely new
services.
@y
By default, Compose reads two files, a `compose.yml` and an optional
`compose.override.yml` file. By convention, the `compose.yml`
contains your base configuration. The override file can
contain configuration overrides for existing services or entirely new
services.
@z

@x
If a service is defined in both files, Compose merges the configurations using
the rules described below and in the 
[Compose Specification](../compose-file/13-merge.md).
@y
If a service is defined in both files, Compose merges the configurations using
the rules described below and in the 
[Compose Specification](../compose-file/13-merge.md).
@z

@x
To use multiple override files, or an override file with a different name, you
can use the `-f` option to specify the list of files. Compose merges files in
the order they're specified on the command line. See the
[`docker compose` command reference](../reference/index.md) for more information
about using `-f`.
@y
To use multiple override files, or an override file with a different name, you
can use the `-f` option to specify the list of files. Compose merges files in
the order they're specified on the command line. See the
[`docker compose` command reference](../reference/index.md) for more information
about using `-f`.
@z

@x
> **Important**
>
> When you use multiple Compose files, you must make sure all paths in the
files are relative to the base Compose file (the first Compose file specified
with `-f`). This is required because override files need not be valid
Compose files. Override files can contain small fragments of configuration.
Tracking which fragment of a service is relative to which path is difficult and
confusing, so to keep paths easier to understand, all paths must be defined
relative to the base file.
{ .important }
@y
> **Important**
>
> When you use multiple Compose files, you must make sure all paths in the
files are relative to the base Compose file (the first Compose file specified
with `-f`). This is required because override files need not be valid
Compose files. Override files can contain small fragments of configuration.
Tracking which fragment of a service is relative to which path is difficult and
confusing, so to keep paths easier to understand, all paths must be defined
relative to the base file.
{ .important }
@z

@x
## Merging rules
@y
## Merging rules
@z

@x
Compose copies configurations from the original service over to the local one.
If a configuration option is defined in both the original service and the local
service, the local value replaces or extends the original value.
@y
Compose copies configurations from the original service over to the local one.
If a configuration option is defined in both the original service and the local
service, the local value replaces or extends the original value.
@z

@x
For single-value options like `image`, `command` or `mem_limit`, the new value
replaces the old value.
@y
For single-value options like `image`, `command` or `mem_limit`, the new value
replaces the old value.
@z

@x
original service:
@y
original service:
@z

@x
```yaml
services:
  myservice:
    # ...
    command: python app.py
```
@y
```yaml
services:
  myservice:
    # ...
    command: python app.py
```
@z

@x
local service:
@y
local service:
@z

@x
```yaml
services:
  myservice:
    # ...
    command: python otherapp.py
```
@y
```yaml
services:
  myservice:
    # ...
    command: python otherapp.py
```
@z

@x
result:
@y
result:
@z

@x
```yaml
services:
  myservice:
    # ...
    command: python otherapp.py
```
@y
```yaml
services:
  myservice:
    # ...
    command: python otherapp.py
```
@z

@x
For the multi-value options `ports`, `expose`, `external_links`, `dns`,
`dns_search`, and `tmpfs`, Compose concatenates both sets of values:
@y
For the multi-value options `ports`, `expose`, `external_links`, `dns`,
`dns_search`, and `tmpfs`, Compose concatenates both sets of values:
@z

@x
original service:
@y
original service:
@z

@x
```yaml
services:
  myservice:
    # ...
    expose:
      - "3000"
```
@y
```yaml
services:
  myservice:
    # ...
    expose:
      - "3000"
```
@z

@x
local service:
@y
local service:
@z

@x
```yaml
services:
  myservice:
    # ...
    expose:
      - "4000"
      - "5000"
```
@y
```yaml
services:
  myservice:
    # ...
    expose:
      - "4000"
      - "5000"
```
@z

@x
result:
@y
result:
@z

@x
```yaml
services:
  myservice:
    # ...
    expose:
      - "3000"
      - "4000"
      - "5000"
```
@y
```yaml
services:
  myservice:
    # ...
    expose:
      - "3000"
      - "4000"
      - "5000"
```
@z

@x
In the case of `environment`, `labels`, `volumes`, and `devices`, Compose
"merges" entries together with locally defined values taking precedence. For
`environment` and `labels`, the environment variable or label name determines
which value is used:
@y
In the case of `environment`, `labels`, `volumes`, and `devices`, Compose
"merges" entries together with locally defined values taking precedence. For
`environment` and `labels`, the environment variable or label name determines
which value is used:
@z

@x
original service:
@y
original service:
@z

@x
```yaml
services:
  myservice:
    # ...
    environment:
      - FOO=original
      - BAR=original
```
@y
```yaml
services:
  myservice:
    # ...
    environment:
      - FOO=original
      - BAR=original
```
@z

@x
local service:
@y
local service:
@z

@x
```yaml
services:
  myservice:
    # ...
    environment:
      - BAR=local
      - BAZ=local
```
@y
```yaml
services:
  myservice:
    # ...
    environment:
      - BAR=local
      - BAZ=local
```
@z

@x
result:
@y
result:
@z

@x
```yaml
services:
  myservice:
    # ...
    environment:
      - FOO=original
      - BAR=local
      - BAZ=local
```
@y
```yaml
services:
  myservice:
    # ...
    environment:
      - FOO=original
      - BAR=local
      - BAZ=local
```
@z

@x
Entries for `volumes` and `devices` are merged using the mount path in the
container:
@y
Entries for `volumes` and `devices` are merged using the mount path in the
container:
@z

@x
original service:
@y
original service:
@z

@x
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./original:/foo
      - ./original:/bar
```
@y
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./original:/foo
      - ./original:/bar
```
@z

@x
local service:
@y
local service:
@z

@x
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./local:/bar
      - ./local:/baz
```
@y
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./local:/bar
      - ./local:/baz
```
@z

@x
result:
@y
result:
@z

@x
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./original:/foo
      - ./local:/bar
      - ./local:/baz
```
@y
```yaml
services:
  myservice:
    # ...
    volumes:
      - ./original:/foo
      - ./local:/bar
      - ./local:/baz
```
@z

@x
For more merging rules, see [Merge and override](../compose-file/13-merge.md) in the Compose Specification. 
@y
For more merging rules, see [Merge and override](../compose-file/13-merge.md) in the Compose Specification. 
@z

@x
## Example
@y
## Example
@z

@x
A common use case for multiple files is changing a development Compose app
for a production-like environment (which may be production, staging or CI).
To support these differences, you can split your Compose configuration into
a few different files:
@y
A common use case for multiple files is changing a development Compose app
for a production-like environment (which may be production, staging or CI).
To support these differences, you can split your Compose configuration into
a few different files:
@z

@x
Start with a base file that defines the canonical configuration for the
services.
@y
Start with a base file that defines the canonical configuration for the
services.
@z

@x
`compose.yml`
@y
`compose.yml`
@z

@x
```yaml
services:
  web:
    image: example/my_web_app:latest
    depends_on:
      - db
      - cache
@y
```yaml
services:
  web:
    image: example/my_web_app:latest
    depends_on:
      - db
      - cache
@z

@x
  db:
    image: postgres:latest
@y
  db:
    image: postgres:latest
@z

@x
  cache:
    image: redis:latest
```
@y
  cache:
    image: redis:latest
```
@z

@x
In this example the development configuration exposes some ports to the
host, mounts our code as a volume, and builds the web image.
@y
In this example the development configuration exposes some ports to the
host, mounts our code as a volume, and builds the web image.
@z

@x
`compose.override.yml`
@y
`compose.override.yml`
@z

@x
```yaml
services:
  web:
    build: .
    volumes:
      - '.:/code'
    ports:
      - 8883:80
    environment:
      DEBUG: 'true'
@y
```yaml
services:
  web:
    build: .
    volumes:
      - '.:/code'
    ports:
      - 8883:80
    environment:
      DEBUG: 'true'
@z

@x
  db:
    command: '-d'
    ports:
     - 5432:5432
@y
  db:
    command: '-d'
    ports:
     - 5432:5432
@z

@x
  cache:
    ports:
      - 6379:6379
```
@y
  cache:
    ports:
      - 6379:6379
```
@z

@x
When you run `docker compose up` it reads the overrides automatically.
@y
When you run `docker compose up` it reads the overrides automatically.
@z

@x
To use this Compose app in a production environment, another override file is created, which might be stored in a different git
repo or managed by a different team.
@y
To use this Compose app in a production environment, another override file is created, which might be stored in a different git
repo or managed by a different team.
@z

@x
`compose.prod.yml`
@y
`compose.prod.yml`
@z

@x
```yaml
services:
  web:
    ports:
      - 80:80
    environment:
      PRODUCTION: 'true'
@y
```yaml
services:
  web:
    ports:
      - 80:80
    environment:
      PRODUCTION: 'true'
@z

@x
  cache:
    environment:
      TTL: '500'
```
@y
  cache:
    environment:
      TTL: '500'
```
@z

@x
To deploy with this production Compose file you can run
@y
To deploy with this production Compose file you can run
@z

@x
```console
$ docker compose -f compose.yml -f compose.prod.yml up -d
```
@y
```console
$ docker compose -f compose.yml -f compose.prod.yml up -d
```
@z

@x
This deploys all three services using the configuration in
`compose.yml` and `compose.prod.yml` but not the
dev configuration in `compose.override.yml`.
@y
This deploys all three services using the configuration in
`compose.yml` and `compose.prod.yml` but not the
dev configuration in `compose.override.yml`.
@z

@x
For more information, see [Using Compose in production](../production.md). 
@y
For more information, see [Using Compose in production](../production.md). 
@z

@x
## Limitations
@y
## Limitations
@z

@x
Docker Compose supports relative paths for the many resources to be included in the application model: build context for service images, location of file defining environment variables, path to a local directory used in a bind-mounted volume.
With such a constraint, code organization in a monorepo can become hard as a natural choice would be to have dedicated folders per team or component, but then the Compose files relative paths become irrelevant. 
@y
Docker Compose supports relative paths for the many resources to be included in the application model: build context for service images, location of file defining environment variables, path to a local directory used in a bind-mounted volume.
With such a constraint, code organization in a monorepo can become hard as a natural choice would be to have dedicated folders per team or component, but then the Compose files relative paths become irrelevant. 
@z

@x
## Reference information
@y
## Reference information
@z

@x
- [Merge rules](../compose-file/13-merge.md)
@y
- [Merge rules](../compose-file/13-merge.md)
@z
