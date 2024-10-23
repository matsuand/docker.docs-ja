%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: How merging Compose files works
keywords: compose, docker, merge, compose file
title: Merge Compose files
linkTitle: Merge
@y
description: How merging Compose files works
keywords: compose, docker, merge, compose file
title: Merge Compose files
linkTitle: Merge
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
[Compose Specification](/reference/compose-file/merge.md).
@y
If a service is defined in both files, Compose merges the configurations using
the rules described below and in the 
[Compose Specification](reference/compose-file/merge.md).
@z

@x
## How to merge multiple Compose files
@y
## How to merge multiple Compose files
@z

@x
To use multiple override files, or an override file with a different name, you
can either use the pre-defined [COMPOSE_FILE](../environment-variables/envvars.md#compose_file) environment variable, or use the `-f` option to specify the list of files. 
@y
To use multiple override files, or an override file with a different name, you
can either use the pre-defined [COMPOSE_FILE](../environment-variables/envvars.md#compose_file) environment variable, or use the `-f` option to specify the list of files. 
@z

@x
Compose merges files in
the order they're specified on the command line. Subsequent files may merge, override, or
add to their predecessors.
@y
Compose merges files in
the order they're specified on the command line. Subsequent files may merge, override, or
add to their predecessors.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker compose -f compose.yml -f compose.admin.yml run backup_db
```
@y
```console
$ docker compose -f compose.yml -f compose.admin.yml run backup_db
```
@z

@x
The `compose.yml` file might specify a `webapp` service.
@y
The `compose.yml` file might specify a `webapp` service.
@z

@x
```yaml
webapp:
  image: examples/web
  ports:
    - "8000:8000"
  volumes:
    - "/data"
```
@y
```yaml
webapp:
  image: examples/web
  ports:
    - "8000:8000"
  volumes:
    - "/data"
```
@z

@x
The `compose.admin.yml` may also specify this same service: 
@y
The `compose.admin.yml` may also specify this same service: 
@z

@x
```yaml
webapp:
  environment:
    - DEBUG=1
```
@y
```yaml
webapp:
  environment:
    - DEBUG=1
```
@z

@x
Any matching
fields override the previous file. New values, add to the `webapp` service
configuration:
@y
Any matching
fields override the previous file. New values, add to the `webapp` service
configuration:
@z

@x
```yaml
webapp:
  image: examples/web
  ports:
    - "8000:8000"
  volumes:
    - "/data"
  environment:
    - DEBUG=1
```
@y
```yaml
webapp:
  image: examples/web
  ports:
    - "8000:8000"
  volumes:
    - "/data"
  environment:
    - DEBUG=1
```
@z

@x
## Merging rules 
@y
## Merging rules 
@z

@x
- Paths are evaluated relative to the base file. When you use multiple Compose files, you must make sure all paths in the files are relative to the base Compose file (the first Compose file specified
with `-f`). This is required because override files need not be valid
Compose files. Override files can contain small fragments of configuration.
Tracking which fragment of a service is relative to which path is difficult and
confusing, so to keep paths easier to understand, all paths must be defined
relative to the base file.
@y
- Paths are evaluated relative to the base file. When you use multiple Compose files, you must make sure all paths in the files are relative to the base Compose file (the first Compose file specified
with `-f`). This is required because override files need not be valid
Compose files. Override files can contain small fragments of configuration.
Tracking which fragment of a service is relative to which path is difficult and
confusing, so to keep paths easier to understand, all paths must be defined
relative to the base file.
@z

@x
   >[!TIP]
   >
   > You can use `docker compose config` to review your merged configuration and avoid path-related issues.
@y
   >[!TIP]
   >
   > You can use `docker compose config` to review your merged configuration and avoid path-related issues.
@z

@x
- Compose copies configurations from the original service over to the local one.
If a configuration option is defined in both the original service and the local
service, the local value replaces or extends the original value.
@y
- Compose copies configurations from the original service over to the local one.
If a configuration option is defined in both the original service and the local
service, the local value replaces or extends the original value.
@z

@x
   - For single-value options like `image`, `command` or `mem_limit`, the new value replaces the old value.
@y
   - For single-value options like `image`, `command` or `mem_limit`, the new value replaces the old value.
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
   - For the multi-value options `ports`, `expose`, `external_links`, `dns`, `dns_search`, and `tmpfs`, Compose concatenates both sets of values:
@y
   - For the multi-value options `ports`, `expose`, `external_links`, `dns`, `dns_search`, and `tmpfs`, Compose concatenates both sets of values:
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
   - In the case of `environment`, `labels`, `volumes`, and `devices`, Compose "merges" entries together with locally defined values taking precedence. For `environment` and `labels`, the environment variable or label name determines which value is used:
@y
   - In the case of `environment`, `labels`, `volumes`, and `devices`, Compose "merges" entries together with locally defined values taking precedence. For `environment` and `labels`, the environment variable or label name determines which value is used:
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
   - Entries for `volumes` and `devices` are merged using the mount path in the container:
@y
   - Entries for `volumes` and `devices` are merged using the mount path in the container:
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
For more merging rules, see [Merge and override](/reference/compose-file/merge.md) in the Compose Specification. 
@y
For more merging rules, see [Merge and override](reference/compose-file/merge.md) in the Compose Specification. 
@z

@x
### Additional information
@y
### Additional information
@z

@x
- Using `-f` is optional. If not provided, Compose searches the working directory and its parent directories for a `compose.yml` and a `compose.override.yml` file. You must supply at least the `compose.yml` file. If both files exist on the same directory level, Compose combines them into a single configuration.
@y
- Using `-f` is optional. If not provided, Compose searches the working directory and its parent directories for a `compose.yml` and a `compose.override.yml` file. You must supply at least the `compose.yml` file. If both files exist on the same directory level, Compose combines them into a single configuration.
@z

@x
- You can use a `-f` with `-` (dash) as the filename to read the configuration from `stdin`. For example: 
   ```console
   $ docker compose -f - <<EOF
     webapp:
       image: examples/web
       ports:
        - "8000:8000"
       volumes:
        - "/data"
       environment:
        - DEBUG=1
     EOF
   ```
@y
- You can use a `-f` with `-` (dash) as the filename to read the configuration from `stdin`. For example: 
   ```console
   $ docker compose -f - <<EOF
     webapp:
       image: examples/web
       ports:
        - "8000:8000"
       volumes:
        - "/data"
       environment:
        - DEBUG=1
     EOF
   ```
@z

@x
   When `stdin` is used, all paths in the configuration are relative to the current working directory.
@y
   When `stdin` is used, all paths in the configuration are relative to the current working directory.
@z

@x
- You can use the `-f` flag to specify a path to a Compose file that is not located in the current directory, either from the command line or by setting up a [COMPOSE_FILE environment variable](../environment-variables/envvars.md#compose_file) in your shell or in an environment file.
@y
- You can use the `-f` flag to specify a path to a Compose file that is not located in the current directory, either from the command line or by setting up a [COMPOSE_FILE environment variable](../environment-variables/envvars.md#compose_file) in your shell or in an environment file.
@z

@x
   For example, if you are running the [Compose Rails sample](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/README.md), and have a `compose.yml` file in a directory called `sandbox/rails`. You can use a command like [docker compose pull](/reference/cli/docker/compose/pull.md) to get the postgres image for the `db` service from anywhere by using the `-f` flag as follows: `docker compose -f ~/sandbox/rails/compose.yml pull db`
@y
   For example, if you are running the [Compose Rails sample](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/README.md), and have a `compose.yml` file in a directory called `sandbox/rails`. You can use a command like [docker compose pull](reference/cli/docker/compose/pull.md) to get the postgres image for the `db` service from anywhere by using the `-f` flag as follows: `docker compose -f ~/sandbox/rails/compose.yml pull db`
@z

@x
   Here's the full example:
@y
   Here's the full example:
@z

@x
   ```console
   $ docker compose -f ~/sandbox/rails/compose.yml pull db
   Pulling db (postgres:latest)...
   latest: Pulling from library/postgres
   ef0380f84d05: Pull complete
   50cf91dc1db8: Pull complete
   d3add4cd115c: Pull complete
   467830d8a616: Pull complete
   089b9db7dc57: Pull complete
   6fba0a36935c: Pull complete
   81ef0e73c953: Pull complete
   338a6c4894dc: Pull complete
   15853f32f67c: Pull complete
   044c83d92898: Pull complete
   17301519f133: Pull complete
   dcca70822752: Pull complete
   cecf11b8ccf3: Pull complete
   Digest: sha256:1364924c753d5ff7e2260cd34dc4ba05ebd40ee8193391220be0f9901d4e1651
   Status: Downloaded newer image for postgres:latest
   ```
@y
   ```console
   $ docker compose -f ~/sandbox/rails/compose.yml pull db
   Pulling db (postgres:latest)...
   latest: Pulling from library/postgres
   ef0380f84d05: Pull complete
   50cf91dc1db8: Pull complete
   d3add4cd115c: Pull complete
   467830d8a616: Pull complete
   089b9db7dc57: Pull complete
   6fba0a36935c: Pull complete
   81ef0e73c953: Pull complete
   338a6c4894dc: Pull complete
   15853f32f67c: Pull complete
   044c83d92898: Pull complete
   17301519f133: Pull complete
   dcca70822752: Pull complete
   cecf11b8ccf3: Pull complete
   Digest: sha256:1364924c753d5ff7e2260cd34dc4ba05ebd40ee8193391220be0f9901d4e1651
   Status: Downloaded newer image for postgres:latest
   ```
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
repository or managed by a different team.
@y
To use this Compose app in a production environment, another override file is created, which might be stored in a different git
repository or managed by a different team.
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
- [Merge rules](/reference/compose-file/merge.md)
@y
- [Merge rules](reference/compose-file/merge.md)
@z
