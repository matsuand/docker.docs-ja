%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

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
By default, Compose reads two files, a `compose.yaml` and an optional
`compose.override.yaml` file. By convention, the `compose.yaml`
contains your base configuration. The override file can
contain configuration overrides for existing services or entirely new
services.
@y
By default, Compose reads two files, a `compose.yaml` and an optional
`compose.override.yaml` file. By convention, the `compose.yaml`
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

% snip command...

@x
The `compose.yaml` file might specify a `webapp` service.
@y
The `compose.yaml` file might specify a `webapp` service.
@z

% snip code...

@x
The `compose.admin.yaml` may also specify this same service: 
@y
The `compose.admin.yaml` may also specify this same service: 
@z

% snip code...

@x
Any matching
fields override the previous file. New values, add to the `webapp` service
configuration:
@y
Any matching
fields override the previous file. New values, add to the `webapp` service
configuration:
@z

% snip code...

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

% snip code...

@x
      local service:
@y
      local service:
@z

% snip code...

@x
      result:
@y
      result:
@z

% snip code...

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

% snip code...

@x
      local service:
@y
      local service:
@z

% snip code...

@x
      result:
@y
      result:
@z

% snip code...

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

% snip code...

@x
      local service:
@y
      local service:
@z

% snip code...

@x
     result:
@y
     result:
@z

% snip code...

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

% snip code...

@x
      local service:
@y
      local service:
@z

% snip code...

@x
      result:
@y
      result:
@z

% snip code...

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
- Using `-f` is optional. If not provided, Compose searches the working directory and its parent directories for a `compose.yaml` and a `compose.override.yaml` file. You must supply at least the `compose.yaml` file. If both files exist on the same directory level, Compose combines them into a single configuration.
@y
- Using `-f` is optional. If not provided, Compose searches the working directory and its parent directories for a `compose.yaml` and a `compose.override.yaml` file. You must supply at least the `compose.yaml` file. If both files exist on the same directory level, Compose combines them into a single configuration.
@z

@x
- You can use a `-f` with `-` (dash) as the filename to read the configuration from `stdin`. For example: 
@y
- You can use a `-f` with `-` (dash) as the filename to read the configuration from `stdin`. For example: 
@z

% snip code...

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
   For example, if you are running the [Compose Rails sample](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/README.md), and have a `compose.yaml` file in a directory called `sandbox/rails`. You can use a command like [docker compose pull](/reference/cli/docker/compose/pull.md) to get the postgres image for the `db` service from anywhere by using the `-f` flag as follows: `docker compose -f ~/sandbox/rails/compose.yaml pull db`
@y
   For example, if you are running the [Compose Rails sample](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/README.md), and have a `compose.yaml` file in a directory called `sandbox/rails`. You can use a command like [docker compose pull](reference/cli/docker/compose/pull.md) to get the postgres image for the `db` service from anywhere by using the `-f` flag as follows: `docker compose -f ~/sandbox/rails/compose.yaml pull db`
@z

@x
   Here's the full example:
@y
   Here's the full example:
@z

% snip command...

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
`compose.yaml`
@y
`compose.yaml`
@z

% snip code...

@x
In this example the development configuration exposes some ports to the
host, mounts our code as a volume, and builds the web image.
@y
In this example the development configuration exposes some ports to the
host, mounts our code as a volume, and builds the web image.
@z

@x
`compose.override.yaml`
@y
`compose.override.yaml`
@z

% snip code...

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
`compose.prod.yaml`
@y
`compose.prod.yaml`
@z

% snip code...

@x
To deploy with this production Compose file you can run
@y
To deploy with this production Compose file you can run
@z

% snip command...

@x
This deploys all three services using the configuration in
`compose.yaml` and `compose.prod.yaml` but not the
dev configuration in `compose.override.yaml`.
@y
This deploys all three services using the configuration in
`compose.yaml` and `compose.prod.yaml` but not the
dev configuration in `compose.override.yaml`.
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
