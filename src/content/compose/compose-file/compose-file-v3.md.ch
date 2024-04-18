%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
description: Find a quick reference for Docker Compose version 3, including Docker
  Engine compatibility, memory limitations, and more.
keywords: docker compose ports, docker compose version 3, docker-compose memory limit
  version 3, docker compose 3 memory limit
title: Compose file version 3 reference
@y
description: Find a quick reference for Docker Compose version 3, including Docker
  Engine compatibility, memory limitations, and more.
keywords: docker compose ports, docker compose version 3, docker-compose memory limit
  version 3, docker compose 3 memory limit
title: Compose ファイルバージョン 3 リファレンス
@z

@x
{{< include "compose-eol.md" >}}
@y
{{< include "compose-eol.md" >}}
@z

@x
## Reference and guidelines
@y
## Reference and guidelines
@z

@x
These topics describe version 3 of the Compose file format.
@y
These topics describe version 3 of the Compose file format.
@z

@x
## Compose and Docker compatibility matrix
@y
## Compose and Docker compatibility matrix
@z

@x
There are several versions of the Compose file format – 1, 2, 2.x, and 3.x. The
table below is a quick look. For full details on what each version includes and
how to upgrade, see **[About versions and upgrading](compose-versioning.md)**.
@y
There are several versions of the Compose file format – 1, 2, 2.x, and 3.x. The
table below is a quick look. For full details on what each version includes and
how to upgrade, see **[About versions and upgrading](compose-versioning.md)**.
@z

@x
{{< include "content/compose-matrix.md" >}}
@y
{{< include "content/compose-matrix.md" >}}
@z

@x
## Compose file structure and examples
@y
## Compose file structure and examples
@z

@x
Here is a sample Compose file from the voting app sample used in the
[Docker for Beginners lab](https://github.com/docker/labs/tree/master/beginner/)
topic on [Deploying an app to a Swarm](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md):
@y
Here is a sample Compose file from the voting app sample used in the
[Docker for Beginners lab](https://github.com/docker/labs/tree/master/beginner/)
topic on [Deploying an app to a Swarm](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md):
@z

@x
{{< accordion title="Example Compose file version 3" >}}
@y
{{< accordion title="Example Compose file version 3" >}}
@z

% snip code...

@x
The topics on this reference page are organized alphabetically by top-level key
to reflect the structure of the Compose file itself. Top-level keys that define
a section in the configuration file such as `build`, `deploy`, `depends_on`,
`networks`, and so on, are listed with the options that support them as
sub-topics. This maps to the `<key>: <option>: <value>` indent structure of the
Compose file.
@y
The topics on this reference page are organized alphabetically by top-level key
to reflect the structure of the Compose file itself. Top-level keys that define
a section in the configuration file such as `build`, `deploy`, `depends_on`,
`networks`, and so on, are listed with the options that support them as
sub-topics. This maps to the `<key>: <option>: <value>` indent structure of the
Compose file.
@z

@x
## Service configuration reference
@y
## Service configuration reference
@z

@x
The Compose file is a [YAML](https://yaml.org) file defining
[services](#service-configuration-reference),
[networks](#network-configuration-reference) and
[volumes](#volume-configuration-reference).
The default path for a Compose file is `./docker-compose.yml`.
@y
The Compose file is a [YAML](https://yaml.org) file defining
[services](#service-configuration-reference),
[networks](#network-configuration-reference) and
[volumes](#volume-configuration-reference).
The default path for a Compose file is `./docker-compose.yml`.
@z

@x
> **Tip**: You can use either a `.yml` or `.yaml` extension for this file.
> They both work.
@y
> **Tip**: You can use either a `.yml` or `.yaml` extension for this file.
> They both work.
@z

@x
A service definition contains configuration that is applied to each
container started for that service, much like passing command-line parameters to
`docker run`. Likewise, network and volume definitions are analogous to
`docker network create` and `docker volume create`.
@y
A service definition contains configuration that is applied to each
container started for that service, much like passing command-line parameters to
`docker run`. Likewise, network and volume definitions are analogous to
`docker network create` and `docker volume create`.
@z

@x
As with `docker run`, options specified in the Dockerfile, such as `CMD`,
`EXPOSE`, `VOLUME`, `ENV`, are respected by default - you don't need to
specify them again in `docker-compose.yml`.
@y
As with `docker run`, options specified in the Dockerfile, such as `CMD`,
`EXPOSE`, `VOLUME`, `ENV`, are respected by default - you don't need to
specify them again in `docker-compose.yml`.
@z

@x
You can use environment variables in configuration values with a Bash-like
`${VARIABLE}` syntax - see [variable substitution](#variable-substitution) for
full details.
@y
You can use environment variables in configuration values with a Bash-like
`${VARIABLE}` syntax - see [variable substitution](#variable-substitution) for
full details.
@z

@x
This section contains a list of all configuration options supported by a service
definition in version 3.
@y
This section contains a list of all configuration options supported by a service
definition in version 3.
@z

@x
### build
@y
### build
@z

@x
Configuration options that are applied at build time.
@y
Configuration options that are applied at build time.
@z

@x
`build` can be specified either as a string containing a path to the build
context:
@y
`build` can be specified either as a string containing a path to the build
context:
@z

% snip code...

@x
Or, as an object with the path specified under [context](#context) and
optionally [Dockerfile](#dockerfile) and [args](#args):
@y
Or, as an object with the path specified under [context](#context) and
optionally [Dockerfile](#dockerfile) and [args](#args):
@z

% snip code...

@x
If you specify `image` as well as `build`, then Compose names the built image
with the `webapp` and optional `tag` specified in `image`:
@y
If you specify `image` as well as `build`, then Compose names the built image
with the `webapp` and optional `tag` specified in `image`:
@z

% snip code...

@x
This results in an image named `webapp` and tagged `tag`, built from `./dir`.
@y
This results in an image named `webapp` and tagged `tag`, built from `./dir`.
@z

@x
> Note when using docker stack deploy
>
> The `build` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
> The `docker stack` command does not build images before deploying.
{ .important }
@y
> Note when using docker stack deploy
>
> The `build` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
> The `docker stack` command does not build images before deploying.
{ .important }
@z

@x
#### context
@y
#### context
@z

@x
Either a path to a directory containing a Dockerfile, or a url to a git repository.
@y
Either a path to a directory containing a Dockerfile, or a url to a git repository.
@z

@x
When the value supplied is a relative path, it is interpreted as relative to the
location of the Compose file. This directory is also the build context that is
sent to the Docker daemon.
@y
When the value supplied is a relative path, it is interpreted as relative to the
location of the Compose file. This directory is also the build context that is
sent to the Docker daemon.
@z

@x
Compose builds and tags it with a generated name, and uses that image
thereafter.
@y
Compose builds and tags it with a generated name, and uses that image
thereafter.
@z

% snip code...

@x
#### dockerfile
@y
#### dockerfile
@z

@x
Alternate Dockerfile.
@y
Alternate Dockerfile.
@z

@x
Compose uses an alternate file to build with. A build path must also be
specified.
@y
Compose uses an alternate file to build with. A build path must also be
specified.
@z

% snip code...

@x
#### args
@y
#### args
@z

@x
Add build arguments, which are environment variables accessible only during the
build process.
@y
Add build arguments, which are environment variables accessible only during the
build process.
@z

@x
First, specify the arguments in your Dockerfile:
@y
First, specify the arguments in your Dockerfile:
@z

% snip code...

@x
Then specify the arguments under the `build` key. You can pass a mapping
or a list:
@y
Then specify the arguments under the `build` key. You can pass a mapping
or a list:
@z

% snip code...

@x
> Scope of build-args
>
> In your Dockerfile, if you specify `ARG` before the `FROM` instruction,
> `ARG` is not available in the build instructions under `FROM`.
> If you need an argument to be available in both places, also specify it under
> the `FROM` instruction. Refer to the [understand how ARGS and FROM interact](../../reference/dockerfile.md#understand-how-arg-and-from-interact)
> section in the documentation for usage details.
@y
> Scope of build-args
>
> In your Dockerfile, if you specify `ARG` before the `FROM` instruction,
> `ARG` is not available in the build instructions under `FROM`.
> If you need an argument to be available in both places, also specify it under
> the `FROM` instruction. Refer to the [understand how ARGS and FROM interact](../../reference/dockerfile.md#understand-how-arg-and-from-interact)
> section in the documentation for usage details.
@z

@x
You can omit the value when specifying a build argument, in which case its value
at build time is the value in the environment where Compose is running.
@y
You can omit the value when specifying a build argument, in which case its value
at build time is the value in the environment where Compose is running.
@z

% snip code...

@x
> Tip when using boolean values
>
> YAML boolean values (`"true"`, `"false"`, `"yes"`, `"no"`, `"on"`,
> `"off"`) must be enclosed in quotes, so that the parser interprets them as
> strings.
@y
> Tip when using boolean values
>
> YAML boolean values (`"true"`, `"false"`, `"yes"`, `"no"`, `"on"`,
> `"off"`) must be enclosed in quotes, so that the parser interprets them as
> strings.
@z

@x
#### cache_from
@y
#### cache_from
@z

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format
@y
> Added in [version 3.2](compose-versioning.md#version-32) file format
@z

@x
A list of images that the engine uses for cache resolution.
@y
A list of images that the engine uses for cache resolution.
@z

% snip code...

@x
#### labels
@y
#### labels
@z

@x
> Added in [version 3.3](compose-versioning.md#version-33) file format
@y
> Added in [version 3.3](compose-versioning.md#version-33) file format
@z

@x
Add metadata to the resulting image using [Docker labels](../../config/labels-custom-metadata.md).
You can use either an array or a dictionary.
@y
Add metadata to the resulting image using [Docker labels](../../config/labels-custom-metadata.md).
You can use either an array or a dictionary.
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@y
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@z

% snip code...

@x
#### network
@y
#### network
@z

@x
> Added in [version 3.4](compose-versioning.md#version-34) file format
@y
> Added in [version 3.4](compose-versioning.md#version-34) file format
@z

@x
Set the network containers connect to for the `RUN` instructions during
build.
@y
Set the network containers connect to for the `RUN` instructions during
build.
@z

% snip code...

@x
Use `none` to disable networking during build:
@y
Use `none` to disable networking during build:
@z

% snip code...

@x
#### shm_size
@y
#### shm_size
@z

@x
> Added in [version 3.5](compose-versioning.md#version-35) file format
@y
> Added in [version 3.5](compose-versioning.md#version-35) file format
@z

@x
Set the size of the `/dev/shm` partition for this build's containers. Specify
as an integer value representing the number of bytes or as a string expressing
a [byte value](#specifying-byte-values).
@y
Set the size of the `/dev/shm` partition for this build's containers. Specify
as an integer value representing the number of bytes or as a string expressing
a [byte value](#specifying-byte-values).
@z

% snip code...

@x
#### target
@y
#### target
@z

@x
> Added in [version 3.4](compose-versioning.md#version-34) file format
@y
> Added in [version 3.4](compose-versioning.md#version-34) file format
@z

@x
Build the specified stage as defined inside the `Dockerfile`. See the
[multi-stage build docs](../../build/building/multi-stage.md) for
details.
@y
Build the specified stage as defined inside the `Dockerfile`. See the
[multi-stage build docs](../../build/building/multi-stage.md) for
details.
@z

% snip code...

@x
### cap_add, cap_drop
@y
### cap_add, cap_drop
@z

@x
Add or drop container capabilities.
See `man 7 capabilities` for a full list.
@y
Add or drop container capabilities.
See `man 7 capabilities` for a full list.
@z

% snip code...

@x
### cgroup_parent
@y
### cgroup_parent
@z

@x
Specify an optional parent cgroup for the container.
@y
Specify an optional parent cgroup for the container.
@z

% snip code...

@x
> Note when using docker stack deploy
>
> The `cgroup_parent` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@y
> Note when using docker stack deploy
>
> The `cgroup_parent` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@z

@x
### command
@y
### command
@z

@x
Override the default command.
@y
Override the default command.
@z

% snip code...

@x
The command can also be a list, in a manner similar to
[dockerfile](../../reference/dockerfile.md#cmd):
@y
The command can also be a list, in a manner similar to
[dockerfile](../../reference/dockerfile.md#cmd):
@z

% snip code...

@x
### configs
@y
### configs
@z

@x
Grant access to configs on a per-service basis using the per-service `configs`
configuration. Two different syntax variants are supported.
@y
Grant access to configs on a per-service basis using the per-service `configs`
configuration. Two different syntax variants are supported.
@z

@x
> **Note**: The config must already exist or be
> [defined in the top-level `configs` configuration](#configs-configuration-reference)
> of this stack file, or stack deployment fails.
@y
> **Note**: The config must already exist or be
> [defined in the top-level `configs` configuration](#configs-configuration-reference)
> of this stack file, or stack deployment fails.
@z

@x
For more information on configs, see [configs](../../engine/swarm/configs.md).
@y
For more information on configs, see [configs](../../engine/swarm/configs.md).
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax variant only specifies the config name. This grants the
container access to the config and mounts it at `/<config_name>`
within the container. The source name and destination mountpoint are both set
to the config name.
@y
The short syntax variant only specifies the config name. This grants the
container access to the config and mounts it at `/<config_name>`
within the container. The source name and destination mountpoint are both set
to the config name.
@z

@x
The following example uses the short syntax to grant the `redis` service
access to the `my_config` and `my_other_config` configs. The value of
`my_config` is set to the contents of the file `./my_config.txt`, and
`my_other_config` is defined as an external resource, which means that it has
already been defined in Docker, either by running the `docker config create`
command or by another stack deployment. If the external config does not exist,
the stack deployment fails with a `config not found` error.
@y
The following example uses the short syntax to grant the `redis` service
access to the `my_config` and `my_other_config` configs. The value of
`my_config` is set to the contents of the file `./my_config.txt`, and
`my_other_config` is defined as an external resource, which means that it has
already been defined in Docker, either by running the `docker config create`
command or by another stack deployment. If the external config does not exist,
the stack deployment fails with a `config not found` error.
@z

@x
> Added in [version 3.3](compose-versioning.md#version-33) file format.
> 
> `config` definitions are only supported in version 3.3 and higher  of the
> compose file format.
@y
> Added in [version 3.3](compose-versioning.md#version-33) file format.
> 
> `config` definitions are only supported in version 3.3 and higher  of the
> compose file format.
@z

% snip code...

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long syntax provides more granularity in how the config is created within
the service's task containers.
@y
The long syntax provides more granularity in how the config is created within
the service's task containers.
@z

@x
- `source`: The identifier of the config as it is defined in this configuration.
- `target`: The path and name of the file to be mounted in the service's
  task containers. Defaults to `/<source>` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the mounted config file
  within in the service's task containers. Both default to `0` on Linux if not
  specified. Not supported on Windows.
- `mode`: The permissions for the file that is mounted within the service's
  task containers, in octal notation. For instance, `0444`
  represents world-readable. The default is `0444`. Configs cannot be writable
  because they are mounted in a temporary filesystem, so if you set the writable
  bit, it is ignored. The executable bit can be set. If you aren't familiar with
  UNIX file permission modes, you may find this
  [permissions calculator](http://permissions-calculator.org/)
  useful.
@y
- `source`: The identifier of the config as it is defined in this configuration.
- `target`: The path and name of the file to be mounted in the service's
  task containers. Defaults to `/<source>` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the mounted config file
  within in the service's task containers. Both default to `0` on Linux if not
  specified. Not supported on Windows.
- `mode`: The permissions for the file that is mounted within the service's
  task containers, in octal notation. For instance, `0444`
  represents world-readable. The default is `0444`. Configs cannot be writable
  because they are mounted in a temporary filesystem, so if you set the writable
  bit, it is ignored. The executable bit can be set. If you aren't familiar with
  UNIX file permission modes, you may find this
  [permissions calculator](http://permissions-calculator.org/)
  useful.
@z

@x
The following example sets the name of `my_config` to `redis_config` within the
container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The `redis` service does not have access to the `my_other_config`
config.
@y
The following example sets the name of `my_config` to `redis_config` within the
container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The `redis` service does not have access to the `my_other_config`
config.
@z

% snip code...

@x
You can grant a service access to multiple configs and you can mix long and
short syntax. Defining a config does not imply granting a service access to it.
@y
You can grant a service access to multiple configs and you can mix long and
short syntax. Defining a config does not imply granting a service access to it.
@z

@x
### container_name
@y
### container_name
@z

@x
Specify a custom container name, rather than a generated default name.
@y
Specify a custom container name, rather than a generated default name.
@z

% snip code...

@x
Because Docker container names must be unique, you cannot scale a service beyond
1 container if you have specified a custom name. Attempting to do so results in
an error.
@y
Because Docker container names must be unique, you cannot scale a service beyond
1 container if you have specified a custom name. Attempting to do so results in
an error.
@z

@x
> Note when using docker stack deploy
>
> The `container_name` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@y
> Note when using docker stack deploy
>
> The `container_name` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@z

@x
### credential_spec
@y
### credential_spec
@z

@x
> Added in [version 3.3](compose-versioning.md#version-33) file format.
> 
> The `credential_spec` option was added in v3.3. Using group Managed Service
> Account (gMSA) configurations with compose files is supported in file format
> version 3.8 or up.
@y
> Added in [version 3.3](compose-versioning.md#version-33) file format.
> 
> The `credential_spec` option was added in v3.3. Using group Managed Service
> Account (gMSA) configurations with compose files is supported in file format
> version 3.8 or up.
@z

@x
Configure the credential spec for managed service account. This option is only
used for services using Windows containers. The `credential_spec` must be in the
format `file://<filename>` or `registry://<value-name>`.
@y
Configure the credential spec for managed service account. This option is only
used for services using Windows containers. The `credential_spec` must be in the
format `file://<filename>` or `registry://<value-name>`.
@z

@x
When using `file:`, the referenced file must be present in the `CredentialSpecs`
subdirectory in the Docker data directory, which defaults to `C:\ProgramData\Docker\`
on Windows. The following example loads the credential spec from a file named
`C:\ProgramData\Docker\CredentialSpecs\my-credential-spec.json`.
@y
When using `file:`, the referenced file must be present in the `CredentialSpecs`
subdirectory in the Docker data directory, which defaults to `C:\ProgramData\Docker\`
on Windows. The following example loads the credential spec from a file named
`C:\ProgramData\Docker\CredentialSpecs\my-credential-spec.json`.
@z

% snip code...

@x
When using `registry:`, the credential spec is read from the Windows registry on
the daemon's host. A registry value with the given name must be located in:
@y
When using `registry:`, the credential spec is read from the Windows registry on
the daemon's host. A registry value with the given name must be located in:
@z

@x
    HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs
@y
    HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs
@z

@x
The following example load the credential spec from a value named `my-credential-spec`
in the registry:
@y
The following example load the credential spec from a value named `my-credential-spec`
in the registry:
@z

% snip code...

@x
#### Example gMSA configuration
@y
#### Example gMSA configuration
@z

@x
When configuring a gMSA credential spec for a service, you only need
to specify a credential spec with `config`, as shown in the following example:
@y
When configuring a gMSA credential spec for a service, you only need
to specify a credential spec with `config`, as shown in the following example:
@z

% snip code...

@x
### depends_on
@y
### depends_on
@z

@x
Express dependency between services. Service dependencies cause the following
behaviors:
@y
Express dependency between services. Service dependencies cause the following
behaviors:
@z

@x
- `docker-compose up` starts services in dependency order. In the following
  example, `db` and `redis` are started before `web`.
- `docker-compose up SERVICE` automatically includes `SERVICE`'s
  dependencies. In the example below, `docker-compose up web` also
  creates and starts `db` and `redis`.
- `docker-compose stop` stops services in dependency order. In the following
  example, `web` is stopped before `db` and `redis`.
@y
- `docker-compose up` starts services in dependency order. In the following
  example, `db` and `redis` are started before `web`.
- `docker-compose up SERVICE` automatically includes `SERVICE`'s
  dependencies. In the example below, `docker-compose up web` also
  creates and starts `db` and `redis`.
- `docker-compose stop` stops services in dependency order. In the following
  example, `web` is stopped before `db` and `redis`.
@z

@x
Simple example:
@y
Simple example:
@z

% snip code...

@x
> There are several things to be aware of when using `depends_on`:
>
> - `depends_on` does not wait for `db` and `redis` to be "ready" before
>   starting `web` - only until they have been started. If you need to wait
>   for a service to be ready, see [Controlling startup order](../startup-order.md)
>   for more on this problem and strategies for solving it.
> - The `depends_on` option is ignored when
>   [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
>   with a version 3 Compose file.
@y
> There are several things to be aware of when using `depends_on`:
>
> - `depends_on` does not wait for `db` and `redis` to be "ready" before
>   starting `web` - only until they have been started. If you need to wait
>   for a service to be ready, see [Controlling startup order](../startup-order.md)
>   for more on this problem and strategies for solving it.
> - The `depends_on` option is ignored when
>   [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
>   with a version 3 Compose file.
@z

@x
### deploy
@y
### deploy
@z

@x
> Added in [version 3](compose-versioning.md#version-3) file format.
@y
> Added in [version 3](compose-versioning.md#version-3) file format.
@z

@x
Specify configuration related to the deployment and running of services. The following  
sub-options only takes effect when deploying to a [swarm](../../engine/swarm/index.md) with
[docker stack deploy](../../reference/cli/docker/stack/deploy.md), and is
ignored by `docker-compose up` and `docker-compose run`, except for `resources`.
@y
Specify configuration related to the deployment and running of services. The following  
sub-options only takes effect when deploying to a [swarm](../../engine/swarm/index.md) with
[docker stack deploy](../../reference/cli/docker/stack/deploy.md), and is
ignored by `docker-compose up` and `docker-compose run`, except for `resources`.
@z

% snip code...

@x
Several sub-options are available:
@y
Several sub-options are available:
@z

@x
#### endpoint_mode
@y
#### endpoint_mode
@z

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format.
@y
> Added in [version 3.2](compose-versioning.md#version-32) file format.
@z

@x
Specify a service discovery method for external clients connecting to a swarm.
@y
Specify a service discovery method for external clients connecting to a swarm.
@z

@x
* `endpoint_mode: vip` - Docker assigns the service a virtual IP (VIP)
that acts as the front end for clients to reach the service on a
network. Docker routes requests between the client and available worker
nodes for the service, without client knowledge of how many nodes
are participating in the service or their IP addresses or ports.
(This is the default.)
@y
* `endpoint_mode: vip` - Docker assigns the service a virtual IP (VIP)
that acts as the front end for clients to reach the service on a
network. Docker routes requests between the client and available worker
nodes for the service, without client knowledge of how many nodes
are participating in the service or their IP addresses or ports.
(This is the default.)
@z

@x
* `endpoint_mode: dnsrr` -  DNS round-robin (DNSRR) service discovery does
not use a single virtual IP. Docker sets up DNS entries for the service
such that a DNS query for the service name returns a list of IP addresses,
and the client connects directly to one of these. DNS round-robin is useful
in cases where you want to use your own load balancer, or for Hybrid
Windows and Linux applications.
@y
* `endpoint_mode: dnsrr` -  DNS round-robin (DNSRR) service discovery does
not use a single virtual IP. Docker sets up DNS entries for the service
such that a DNS query for the service name returns a list of IP addresses,
and the client connects directly to one of these. DNS round-robin is useful
in cases where you want to use your own load balancer, or for Hybrid
Windows and Linux applications.
@z

% snip code...

@x
The options for `endpoint_mode` also work as flags on the swarm mode CLI command
[docker service create](../../reference/cli/docker/service/create.md). For a
quick list of all swarm related `docker` commands, see
[Swarm mode CLI commands](../../engine/swarm/index.md#swarm-mode-key-concepts-and-tutorial).
@y
The options for `endpoint_mode` also work as flags on the swarm mode CLI command
[docker service create](../../reference/cli/docker/service/create.md). For a
quick list of all swarm related `docker` commands, see
[Swarm mode CLI commands](../../engine/swarm/index.md#swarm-mode-key-concepts-and-tutorial).
@z

@x
To learn more about service discovery and networking in swarm mode, see
[Configure service discovery](../../engine/swarm/networking.md#configure-service-discovery)
in the swarm mode topics.
@y
To learn more about service discovery and networking in swarm mode, see
[Configure service discovery](../../engine/swarm/networking.md#configure-service-discovery)
in the swarm mode topics.
@z

@x
#### labels
@y
#### labels
@z

@x
Specify labels for the service. These labels are *only* set on the service,
and *not* on any containers for the service.
@y
Specify labels for the service. These labels are *only* set on the service,
and *not* on any containers for the service.
@z

% snip code...

@x
To set labels on containers instead, use the `labels` key outside of `deploy`:
@y
To set labels on containers instead, use the `labels` key outside of `deploy`:
@z

% snip code...

@x
#### mode
@y
#### mode
@z

@x
Either `global` (exactly one container per swarm node) or `replicated` (a
specified number of containers). The default is `replicated`. (To learn more,
see [Replicated and global services](../../engine/swarm/how-swarm-mode-works/services.md#replicated-and-global-services)
in the [swarm](../../engine/swarm/index.md) topics.)
@y
Either `global` (exactly one container per swarm node) or `replicated` (a
specified number of containers). The default is `replicated`. (To learn more,
see [Replicated and global services](../../engine/swarm/how-swarm-mode-works/services.md#replicated-and-global-services)
in the [swarm](../../engine/swarm/index.md) topics.)
@z

% snip code...

@x
#### placement
@y
#### placement
@z

@x
Specify placement of constraints and preferences. See the docker service create
documentation for a full description of the syntax and available types of
[constraints](../../reference/cli/docker/service/create.md#constraint),
[preferences](../../reference/cli/docker/service/create.md#placement-pref),
and [specifying the maximum replicas per node](../../reference/cli/docker/service/create.md#replicas-max-per-node)
@y
Specify placement of constraints and preferences. See the docker service create
documentation for a full description of the syntax and available types of
[constraints](../../reference/cli/docker/service/create.md#constraint),
[preferences](../../reference/cli/docker/service/create.md#placement-pref),
and [specifying the maximum replicas per node](../../reference/cli/docker/service/create.md#replicas-max-per-node)
@z

% snip code...

@x
#### max_replicas_per_node
@y
#### max_replicas_per_node
@z

@x
> Added in [version 3.8](compose-versioning.md#version-38) file format.
@y
> Added in [version 3.8](compose-versioning.md#version-38) file format.
@z

@x
If the service is `replicated` (which is the default), [limit the number of replicas](../../reference/cli/docker/service/create.md#replicas-max-per-node)
that can run on a node at any time.
@y
If the service is `replicated` (which is the default), [limit the number of replicas](../../reference/cli/docker/service/create.md#replicas-max-per-node)
that can run on a node at any time.
@z

@x
When there are more tasks requested than running nodes, an error
`no suitable node (max replicas per node limit exceed)` is raised.
@y
When there are more tasks requested than running nodes, an error
`no suitable node (max replicas per node limit exceed)` is raised.
@z

% snip code...

@x
#### replicas
@y
#### replicas
@z

@x
If the service is `replicated` (which is the default), specify the number of
containers that should be running at any given time.
@y
If the service is `replicated` (which is the default), specify the number of
containers that should be running at any given time.
@z

% snip code...

@x
#### resources
@y
#### resources
@z

@x
Configures resource constraints.
@y
Configures resource constraints.
@z

@x
> Changed in compose-file version 3
>
> The `resources` section replaces  the [older resource constraint options](compose-file-v2.md#cpu-and-other-resources)
> in Compose files prior to version 3 (`cpu_shares`, `cpu_quota`, `cpuset`,
> `mem_limit`, `memswap_limit`, `mem_swappiness`).
> Refer to [Upgrading version 2.x to 3.x](compose-versioning.md#upgrading)
> to learn about differences between version 2 and 3 of the compose-file format.
@y
> Changed in compose-file version 3
>
> The `resources` section replaces  the [older resource constraint options](compose-file-v2.md#cpu-and-other-resources)
> in Compose files prior to version 3 (`cpu_shares`, `cpu_quota`, `cpuset`,
> `mem_limit`, `memswap_limit`, `mem_swappiness`).
> Refer to [Upgrading version 2.x to 3.x](compose-versioning.md#upgrading)
> to learn about differences between version 2 and 3 of the compose-file format.
@z

@x
Each of these is a single value, analogous to its
[docker service create](../../reference/cli/docker/service/create.md) counterpart.
@y
Each of these is a single value, analogous to its
[docker service create](../../reference/cli/docker/service/create.md) counterpart.
@z

@x
In this general example, the `redis` service is constrained to use no more than
50M of memory and `0.50` (50% of a single core) of available processing time (CPU),
and has `20M` of memory and `0.25` CPU time reserved (as always available to it).
@y
In this general example, the `redis` service is constrained to use no more than
50M of memory and `0.50` (50% of a single core) of available processing time (CPU),
and has `20M` of memory and `0.25` CPU time reserved (as always available to it).
@z

% snip code...

@x
The topics below describe available options to set resource constraints on
services or containers in a swarm.
@y
The topics below describe available options to set resource constraints on
services or containers in a swarm.
@z

@x
> Looking for options to set resources on non swarm mode containers?
>
> The options described here are specific to the
`deploy` key and swarm mode. If you want to set resource constraints
on non swarm deployments, use
[Compose file format version 2 CPU, memory, and other resource options](compose-file-v2.md#cpu-and-other-resources).
If you have further questions, refer to the discussion on the GitHub
issue [docker/compose/4513](https://github.com/docker/compose/issues/4513).
{ .important }
@y
> Looking for options to set resources on non swarm mode containers?
>
> The options described here are specific to the
`deploy` key and swarm mode. If you want to set resource constraints
on non swarm deployments, use
[Compose file format version 2 CPU, memory, and other resource options](compose-file-v2.md#cpu-and-other-resources).
If you have further questions, refer to the discussion on the GitHub
issue [docker/compose/4513](https://github.com/docker/compose/issues/4513).
{ .important }
@z

@x
##### Out Of Memory Exceptions (OOME)
@y
##### Out Of Memory Exceptions (OOME)
@z

@x
If your services or containers attempt to use more memory than the system has
available, you may experience an Out Of Memory Exception (OOME) and a container,
or the Docker daemon, might be killed by the kernel OOM killer. To prevent this
from happening, ensure that your application runs on hosts with adequate memory
and see [Understand the risks of running out of memory](../../config/containers/resource_constraints.md#understand-the-risks-of-running-out-of-memory).
@y
If your services or containers attempt to use more memory than the system has
available, you may experience an Out Of Memory Exception (OOME) and a container,
or the Docker daemon, might be killed by the kernel OOM killer. To prevent this
from happening, ensure that your application runs on hosts with adequate memory
and see [Understand the risks of running out of memory](../../config/containers/resource_constraints.md#understand-the-risks-of-running-out-of-memory).
@z

@x
#### restart_policy
@y
#### restart_policy
@z

@x
Configures if and how to restart containers when they exit. Replaces
[`restart`](compose-file-v2.md#orig-resources).
@y
Configures if and how to restart containers when they exit. Replaces
[`restart`](compose-file-v2.md#orig-resources).
@z

@x
- `condition`: One of `none`, `on-failure` or `any` (default: `any`).
- `delay`: How long to wait between restart attempts, specified as a
  [duration](#specifying-durations) (default: 5s).
- `max_attempts`: How many times to attempt to restart a container before giving
  up (default: never give up). If the restart does not succeed within the configured
  `window`, this attempt doesn't count toward the configured `max_attempts` value.
  For example, if `max_attempts` is set to '2', and the restart fails on the first
  attempt, more than two restarts may be attempted.
- `window`: How long to wait before deciding if a restart has succeeded,
  specified as a [duration](#specifying-durations) (default:
  decide immediately).
@y
- `condition`: One of `none`, `on-failure` or `any` (default: `any`).
- `delay`: How long to wait between restart attempts, specified as a
  [duration](#specifying-durations) (default: 5s).
- `max_attempts`: How many times to attempt to restart a container before giving
  up (default: never give up). If the restart does not succeed within the configured
  `window`, this attempt doesn't count toward the configured `max_attempts` value.
  For example, if `max_attempts` is set to '2', and the restart fails on the first
  attempt, more than two restarts may be attempted.
- `window`: How long to wait before deciding if a restart has succeeded,
  specified as a [duration](#specifying-durations) (default:
  decide immediately).
@z

% snip code...

@x
#### rollback_config
@y
#### rollback_config
@z

@x
> Added in [version 3.7](compose-versioning.md#version-37) file format.
@y
> Added in [version 3.7](compose-versioning.md#version-37) file format.
@z

@x
Configures how the service should be rollbacked in case of a failing
update.
@y
Configures how the service should be rollbacked in case of a failing
update.
@z

@x
- `parallelism`: The number of containers to rollback at a time. If set to 0, all containers rollback simultaneously.
- `delay`: The time to wait between each container group's rollback (default 0s).
- `failure_action`: What to do if a rollback fails. One of `continue` or `pause` (default `pause`)
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 5s) **Note**: Setting to 0 will use the default 5s.
- `max_failure_ratio`: Failure rate to tolerate during a rollback (default 0).
- `order`: Order of operations during rollbacks. One of `stop-first` (old task is stopped before starting new one), or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`).
@y
- `parallelism`: The number of containers to rollback at a time. If set to 0, all containers rollback simultaneously.
- `delay`: The time to wait between each container group's rollback (default 0s).
- `failure_action`: What to do if a rollback fails. One of `continue` or `pause` (default `pause`)
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 5s) **Note**: Setting to 0 will use the default 5s.
- `max_failure_ratio`: Failure rate to tolerate during a rollback (default 0).
- `order`: Order of operations during rollbacks. One of `stop-first` (old task is stopped before starting new one), or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`).
@z

@x
#### update_config
@y
#### update_config
@z

@x
Configures how the service should be updated. Useful for configuring rolling
updates.
@y
Configures how the service should be updated. Useful for configuring rolling
updates.
@z

@x
- `parallelism`: The number of containers to update at a time.
- `delay`: The time to wait between updating a group of containers.
- `failure_action`: What to do if an update fails. One of `continue`, `rollback`, or `pause`
  (default: `pause`).
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 5s) **Note**: Setting to 0 will use the default 5s.
- `max_failure_ratio`: Failure rate to tolerate during an update.
- `order`: Order of operations during updates. One of `stop-first` (old task is stopped before starting new one), or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`) **Note**: Only supported for v3.4 and higher.
@y
- `parallelism`: The number of containers to update at a time.
- `delay`: The time to wait between updating a group of containers.
- `failure_action`: What to do if an update fails. One of `continue`, `rollback`, or `pause`
  (default: `pause`).
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 5s) **Note**: Setting to 0 will use the default 5s.
- `max_failure_ratio`: Failure rate to tolerate during an update.
- `order`: Order of operations during updates. One of `stop-first` (old task is stopped before starting new one), or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`) **Note**: Only supported for v3.4 and higher.
@z

@x
> Added in [version 3.4](compose-versioning.md#version-34) file format.
>
> The `order` option is only supported by v3.4 and higher of the compose
> file format.
@y
> Added in [version 3.4](compose-versioning.md#version-34) file format.
>
> The `order` option is only supported by v3.4 and higher of the compose
> file format.
@z

% snip code...

@x
#### Not supported for `docker stack deploy`
@y
#### Not supported for `docker stack deploy`
@z

@x
The following sub-options (supported for `docker-compose up` and `docker-compose run`) are _not supported_ for `docker stack deploy` or the `deploy` key.
@y
The following sub-options (supported for `docker-compose up` and `docker-compose run`) are _not supported_ for `docker stack deploy` or the `deploy` key.
@z

@x
- [build](#build)
- [cgroup_parent](#cgroup_parent)
- [container_name](#container_name)
- [devices](#devices)
- [tmpfs](#tmpfs)
- [external_links](#external_links)
- [links](#links)
- [network_mode](#network_mode)
- [restart](#restart)
- [security_opt](#security_opt)
- [userns_mode](#userns_mode)
@y
- [build](#build)
- [cgroup_parent](#cgroup_parent)
- [container_name](#container_name)
- [devices](#devices)
- [tmpfs](#tmpfs)
- [external_links](#external_links)
- [links](#links)
- [network_mode](#network_mode)
- [restart](#restart)
- [security_opt](#security_opt)
- [userns_mode](#userns_mode)
@z

@x
> Tip
>
> See the section on [how to configure volumes for services, swarms, and docker-stack.yml
> files](#volumes-for-services-swarms-and-stack-files). Volumes _are_ supported
> but to work with swarms and services, they must be configured as named volumes
> or associated with services that are constrained to nodes with access to the
> requisite volumes.
@y
> Tip
>
> See the section on [how to configure volumes for services, swarms, and docker-stack.yml
> files](#volumes-for-services-swarms-and-stack-files). Volumes _are_ supported
> but to work with swarms and services, they must be configured as named volumes
> or associated with services that are constrained to nodes with access to the
> requisite volumes.
@z

@x
### devices
@y
### devices
@z

@x
List of device mappings.  Uses the same format as the `--device` docker
client create option.
@y
List of device mappings.  Uses the same format as the `--device` docker
client create option.
@z

% snip code...

@x
> Note when using docker stack deploy
>
> The `devices` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@y
> Note when using docker stack deploy
>
> The `devices` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@z

@x
### dns
@y
### dns
@z

@x
Custom DNS servers. Can be a single value or a list.
@y
Custom DNS servers. Can be a single value or a list.
@z

% snip code...

@x
### dns_search
@y
### dns_search
@z

@x
Custom DNS search domains. Can be a single value or a list.
@y
Custom DNS search domains. Can be a single value or a list.
@z

% snip code...

@x
### entrypoint
@y
### entrypoint
@z

@x
Override the default entrypoint.
@y
Override the default entrypoint.
@z

% snip code...

@x
The entrypoint can also be a list, in a manner similar to
[dockerfile](../../reference/dockerfile.md#entrypoint):
@y
The entrypoint can also be a list, in a manner similar to
[dockerfile](../../reference/dockerfile.md#entrypoint):
@z

% snip code...

@x
> **Note**
>
> Setting `entrypoint` both overrides any default entrypoint set on the service's
> image with the `ENTRYPOINT` Dockerfile instruction, *and* clears out any default
> command on the image - meaning that if there's a `CMD` instruction in the
> Dockerfile, it is ignored.
@y
> **Note**
>
> Setting `entrypoint` both overrides any default entrypoint set on the service's
> image with the `ENTRYPOINT` Dockerfile instruction, *and* clears out any default
> command on the image - meaning that if there's a `CMD` instruction in the
> Dockerfile, it is ignored.
@z

@x
### env_file
@y
### env_file
@z

@x
Add environment variables from a file. Can be a single value or a list.
@y
Add environment variables from a file. Can be a single value or a list.
@z

@x
If you have specified a Compose file with `docker-compose -f FILE`, paths in
`env_file` are relative to the directory that file is in.
@y
If you have specified a Compose file with `docker-compose -f FILE`, paths in
`env_file` are relative to the directory that file is in.
@z

@x
Environment variables declared in the [environment](#environment) section
_override_ these values &ndash; this holds true even if those values are
empty or undefined.
@y
Environment variables declared in the [environment](#environment) section
_override_ these values &ndash; this holds true even if those values are
empty or undefined.
@z

% snip code...

@x
Compose expects each line in an env file to be in `VAR=VAL` format. Lines
beginning with `#` are treated as comments and are ignored. Blank lines are
also ignored.
@y
Compose expects each line in an env file to be in `VAR=VAL` format. Lines
beginning with `#` are treated as comments and are ignored. Blank lines are
also ignored.
@z

% snip code...

@x
Compose also recognizes inline comments, like in:
@y
Compose also recognizes inline comments, like in:
@z

% snip code...

@x
To avoid interpreting "#" as an inline comment, use the quotation marks:
@y
To avoid interpreting "#" as an inline comment, use the quotation marks:
@z

% snip code...

@x
> **Note**
>
> If your service specifies a [build](#build) option, variables defined in
> environment files are _not_ automatically visible during the build. Use
> the [args](#args) sub-option of `build` to define build-time environment
> variables.
@y
> **Note**
>
> If your service specifies a [build](#build) option, variables defined in
> environment files are _not_ automatically visible during the build. Use
> the [args](#args) sub-option of `build` to define build-time environment
> variables.
@z

@x
The value of `VAL` is used as is and not modified at all. For example if the
value is surrounded by quotes (as is often the case of shell variables), the
quotes are included in the value passed to Compose.
@y
The value of `VAL` is used as is and not modified at all. For example if the
value is surrounded by quotes (as is often the case of shell variables), the
quotes are included in the value passed to Compose.
@z

@x
Keep in mind that _the order of files in the list is significant in determining
the value assigned to a variable that shows up more than once_. The files in the
list are processed from the top down. For the same variable specified in file
`a.env` and assigned a different value in file `b.env`, if `b.env` is
listed below (after), then the value from `b.env` stands. For example, given the
following declaration in `docker-compose.yml`:
@y
Keep in mind that _the order of files in the list is significant in determining
the value assigned to a variable that shows up more than once_. The files in the
list are processed from the top down. For the same variable specified in file
`a.env` and assigned a different value in file `b.env`, if `b.env` is
listed below (after), then the value from `b.env` stands. For example, given the
following declaration in `docker-compose.yml`:
@z

% snip code...

@x
And the following files:
@y
And the following files:
@z

% snip code...

@x
and
@y
and
@z

% snip code...

@x
`$VAR` is `hello`.
@y
`$VAR` is `hello`.
@z

@x
### environment
@y
### environment
@z

@x
Add environment variables. You can use either an array or a dictionary. Any
boolean values (true, false, yes, no) need to be enclosed in quotes to ensure
they are not converted to True or False by the YML parser.
@y
Add environment variables. You can use either an array or a dictionary. Any
boolean values (true, false, yes, no) need to be enclosed in quotes to ensure
they are not converted to True or False by the YML parser.
@z

@x
Environment variables with only a key are resolved to their values on the
machine Compose is running on, which can be helpful for secret or host-specific values.
@y
Environment variables with only a key are resolved to their values on the
machine Compose is running on, which can be helpful for secret or host-specific values.
@z

% snip code...

@x
> **Note**
>
> If your service specifies a [build](#build) option, variables defined in
> `environment` are _not_ automatically visible during the build. Use the
> [args](#args) sub-option of `build` to define build-time environment
> variables.
@y
> **Note**
>
> If your service specifies a [build](#build) option, variables defined in
> `environment` are _not_ automatically visible during the build. Use the
> [args](#args) sub-option of `build` to define build-time environment
> variables.
@z

@x
### expose
@y
### expose
@z

@x
Expose ports without publishing them to the host machine - they'll only be
accessible to linked services. Only the internal port can be specified.
@y
Expose ports without publishing them to the host machine - they'll only be
accessible to linked services. Only the internal port can be specified.
@z

% snip code...

@x
### external_links
@y
### external_links
@z

@x
Link to containers started outside this `docker-compose.yml` or even outside of
Compose, especially for containers that provide shared or common services.
`external_links` follow semantics similar to the legacy option `links` when
specifying both the container name and the link alias (`CONTAINER:ALIAS`).
@y
Link to containers started outside this `docker-compose.yml` or even outside of
Compose, especially for containers that provide shared or common services.
`external_links` follow semantics similar to the legacy option `links` when
specifying both the container name and the link alias (`CONTAINER:ALIAS`).
@z

% snip code...

@x
> **Note**
>
> The externally-created  containers must be connected to at least one of the same
> networks as the service that is linking to them. [Links](compose-file-v2.md#links)
> are a legacy option. We recommend using [networks](#networks) instead.
@y
> **Note**
>
> The externally-created  containers must be connected to at least one of the same
> networks as the service that is linking to them. [Links](compose-file-v2.md#links)
> are a legacy option. We recommend using [networks](#networks) instead.
@z

@x
> Note when using docker stack deploy
>
> The `external_links` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@y
> Note when using docker stack deploy
>
> The `external_links` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@z

@x
### extra_hosts
@y
### extra_hosts
@z

@x
Add hostname mappings. Use the same values as the docker client `--add-host` parameter.
@y
Add hostname mappings. Use the same values as the docker client `--add-host` parameter.
@z

% snip code...

@x
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this service, e.g:
@y
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this service, e.g:
@z

% snip code...

@x
### healthcheck
@y
### healthcheck
@z

@x
Configure a check that's run to determine whether or not containers for this
service are "healthy". See the docs for the
[HEALTHCHECK Dockerfile instruction](../../reference/dockerfile.md#healthcheck)
for details on how healthchecks work.
@y
Configure a check that's run to determine whether or not containers for this
service are "healthy". See the docs for the
[HEALTHCHECK Dockerfile instruction](../../reference/dockerfile.md#healthcheck)
for details on how healthchecks work.
@z

% snip code...

@x
`interval`, `timeout` and `start_period` are specified as
[durations](#specifying-durations).
@y
`interval`, `timeout` and `start_period` are specified as
[durations](#specifying-durations).
@z

@x
> Added in [version 3.4](compose-versioning.md#version-34) file format.
>
> The `start_period` option was added in file format 3.4.
@y
> Added in [version 3.4](compose-versioning.md#version-34) file format.
>
> The `start_period` option was added in file format 3.4.
@z

@x
`test` must be either a string or a list. If it's a list, the first item must be
either `NONE`, `CMD` or `CMD-SHELL`. If it's a string, it's equivalent to
specifying `CMD-SHELL` followed by that string.
@y
`test` must be either a string or a list. If it's a list, the first item must be
either `NONE`, `CMD` or `CMD-SHELL`. If it's a string, it's equivalent to
specifying `CMD-SHELL` followed by that string.
@z

% snip code...

@x
As above, but wrapped in `/bin/sh`. Both forms below are equivalent.
@y
As above, but wrapped in `/bin/sh`. Both forms below are equivalent.
@z

% snip code...

@x
To disable any default healthcheck set by the image, you can use `disable: true`.
This is equivalent to specifying `test: ["NONE"]`.
@y
To disable any default healthcheck set by the image, you can use `disable: true`.
This is equivalent to specifying `test: ["NONE"]`.
@z

% snip code...

@x
### image
@y
### image
@z

@x
Specify the image to start the container from. Can either be a repository/tag or
a partial image ID.
@y
Specify the image to start the container from. Can either be a repository/tag or
a partial image ID.
@z

% snip code...

@x
If the image does not exist, Compose attempts to pull it, unless you have also
specified [build](#build), in which case it builds it using the specified
options and tags it with the specified tag.
@y
If the image does not exist, Compose attempts to pull it, unless you have also
specified [build](#build), in which case it builds it using the specified
options and tags it with the specified tag.
@z

@x
### init
@y
### init
@z

@x
> Added in [version 3.7](compose-versioning.md#version-37) file format.
@y
> Added in [version 3.7](compose-versioning.md#version-37) file format.
@z

@x
Run an init inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@y
Run an init inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@z

% snip code...

@x
> The default init binary that is used is [Tini](https://github.com/krallin/tini),
> and is installed in `/usr/libexec/docker-init` on the daemon host. You can
> configure the daemon to use a custom init binary through the
> [`init-path` configuration option](/reference/cli/docker/dockerd/#daemon-configuration-file).
@y
> The default init binary that is used is [Tini](https://github.com/krallin/tini),
> and is installed in `/usr/libexec/docker-init` on the daemon host. You can
> configure the daemon to use a custom init binary through the
> [`init-path` configuration option](__SUBDIR__/reference/cli/docker/dockerd/#daemon-configuration-file).
@z

@x
### isolation
@y
### isolation
@z

@x
Specify a container’s isolation technology. On Linux, the only supported value
is `default`. On Windows, acceptable values are `default`, `process` and
`hyperv`. Refer to the
[Docker Engine docs](../../reference/cli/docker/container/run.md#isolation)
for details.
@y
Specify a container’s isolation technology. On Linux, the only supported value
is `default`. On Windows, acceptable values are `default`, `process` and
`hyperv`. Refer to the
[Docker Engine docs](../../reference/cli/docker/container/run.md#isolation)
for details.
@z

@x
### labels
@y
### labels
@z

@x
Add metadata to containers using [Docker labels](../../config/labels-custom-metadata.md). You can use either an array or a dictionary.
@y
Add metadata to containers using [Docker labels](../../config/labels-custom-metadata.md). You can use either an array or a dictionary.
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with those used by other software.
@y
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with those used by other software.
@z

% snip code...

@x
### links
@y
### links
@z

@x
>**Warning**
>
> The `--link` flag is a legacy feature of Docker. It may eventually be removed.
> Unless you absolutely need to continue using it, we recommend that you use
> [user-defined networks](../networking.md)
> to facilitate communication between two containers instead of using `--link`.
>
> One feature that user-defined networks do not support that you can do with
> `--link` is sharing environmental variables between containers. However, you
> can use other mechanisms such as volumes to share environment variables between
> containers in a more controlled way.
{ .warning }
@y
>**Warning**
>
> The `--link` flag is a legacy feature of Docker. It may eventually be removed.
> Unless you absolutely need to continue using it, we recommend that you use
> [user-defined networks](../networking.md)
> to facilitate communication between two containers instead of using `--link`.
>
> One feature that user-defined networks do not support that you can do with
> `--link` is sharing environmental variables between containers. However, you
> can use other mechanisms such as volumes to share environment variables between
> containers in a more controlled way.
{ .warning }
@z

@x
Link to containers in another service. Either specify both the service name and
a link alias (`"SERVICE:ALIAS"`), or just the service name.
@y
Link to containers in another service. Either specify both the service name and
a link alias (`"SERVICE:ALIAS"`), or just the service name.
@z

% snip code...

@x
Containers for the linked service are reachable at a hostname identical to
the alias, or the service name if no alias was specified.
@y
Containers for the linked service are reachable at a hostname identical to
the alias, or the service name if no alias was specified.
@z

@x
Links are not required to enable services to communicate - by default,
any service can reach any other service at that service’s name. (See also, the
[Link containers section in Networking in Compose](../networking.md#link-containers).)
@y
Links are not required to enable services to communicate - by default,
any service can reach any other service at that service’s name. (See also, the
[Link containers section in Networking in Compose](../networking.md#link-containers).)
@z

@x
Links also express dependency between services in the same way as
[depends_on](#depends_on), so they determine the order of service startup.
@y
Links also express dependency between services in the same way as
[depends_on](#depends_on), so they determine the order of service startup.
@z

@x
> **Note**
>
> If you define both links and [networks](#networks), services with
> links between them must share at least one network in common to
> communicate.
@y
> **Note**
>
> If you define both links and [networks](#networks), services with
> links between them must share at least one network in common to
> communicate.
@z

@x
> Note when using docker stack deploy
>
> The `links` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@y
> Note when using docker stack deploy
>
> The `links` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
{ .important }
@z

@x
### logging
@y
### logging
@z

@x
Logging configuration for the service.
@y
Logging configuration for the service.
@z

% snip code...

@x
The `driver`  name specifies a logging driver for the service's
containers, as with the ``--log-driver`` option for docker run
([documented here](../../config/containers/logging/configure.md)).
@y
The `driver`  name specifies a logging driver for the service's
containers, as with the ``--log-driver`` option for docker run
([documented here](../../config/containers/logging/configure.md)).
@z

@x
The default value is json-file.
@y
The default value is json-file.
@z

% snip code...

@x
> **Note**
>
> Only the `json-file` and `journald` drivers make the logs available directly
> from `docker-compose up` and `docker-compose logs`. Using any other driver
> does not print any logs.
@y
> **Note**
>
> Only the `json-file` and `journald` drivers make the logs available directly
> from `docker-compose up` and `docker-compose logs`. Using any other driver
> does not print any logs.
@z

@x
Specify logging options for the logging driver with the ``options`` key, as with the ``--log-opt`` option for `docker run`.
@y
Specify logging options for the logging driver with the ``options`` key, as with the ``--log-opt`` option for `docker run`.
@z

@x
Logging options are key-value pairs. An example of `syslog` options:
@y
Logging options are key-value pairs. An example of `syslog` options:
@z

% snip code...

@x
The default driver [json-file](../../config/containers/logging/json-file.md), has options to limit the amount of logs stored. To do this, use a key-value pair for maximum storage size and maximum number of files:
@y
The default driver [json-file](../../config/containers/logging/json-file.md), has options to limit the amount of logs stored. To do this, use a key-value pair for maximum storage size and maximum number of files:
@z

% snip code...

@x
The example shown above would store log files until they reach a `max-size` of
200kB, and then rotate them. The amount of individual log files stored is
specified by the `max-file` value. As logs grow beyond the max limits, older log
files are removed to allow storage of new logs.
@y
The example shown above would store log files until they reach a `max-size` of
200kB, and then rotate them. The amount of individual log files stored is
specified by the `max-file` value. As logs grow beyond the max limits, older log
files are removed to allow storage of new logs.
@z

@x
Here is an example `docker-compose.yml` file that limits logging storage:
@y
Here is an example `docker-compose.yml` file that limits logging storage:
@z

% snip code...

@x
> Logging options available depend on which logging driver you use
>
> The above example for controlling log files and sizes uses options
> specific to the [json-file driver](../../config/containers/logging/json-file.md).
> These particular options are not available on other logging drivers.
> For a full list of supported logging drivers and their options, refer to the
> [logging drivers](../../config/containers/logging/configure.md) documentation.
@y
> Logging options available depend on which logging driver you use
>
> The above example for controlling log files and sizes uses options
> specific to the [json-file driver](../../config/containers/logging/json-file.md).
> These particular options are not available on other logging drivers.
> For a full list of supported logging drivers and their options, refer to the
> [logging drivers](../../config/containers/logging/configure.md) documentation.
@z

@x
### network_mode
@y
### network_mode
@z

@x
Network mode. Use the same values as the docker client `--network` parameter, plus
the special form `service:[service name]`.
@y
Network mode. Use the same values as the docker client `--network` parameter, plus
the special form `service:[service name]`.
@z

% snip code...

@x
> **Note**
>
> * This option is ignored when
>   [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
> * `network_mode: "host"` cannot be mixed with [links](#links).
{ .important }
@y
> **Note**
>
> * This option is ignored when
>   [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
> * `network_mode: "host"` cannot be mixed with [links](#links).
{ .important }
@z

@x
### networks
@y
### networks
@z

@x
Networks to join, referencing entries under the
[top-level `networks` key](#network-configuration-reference).
@y
Networks to join, referencing entries under the
[top-level `networks` key](#network-configuration-reference).
@z

% snip code...

@x
#### aliases
@y
#### aliases
@z

@x
Aliases (alternative hostnames) for this service on the network. Other containers on the same network can use either the service name or this alias to connect to one of the service's containers.
@y
Aliases (alternative hostnames) for this service on the network. Other containers on the same network can use either the service name or this alias to connect to one of the service's containers.
@z

@x
Since `aliases` is network-scoped, the same service can have different aliases on different networks.
@y
Since `aliases` is network-scoped, the same service can have different aliases on different networks.
@z

@x
> **Note**
>
> A network-wide alias can be shared by multiple containers, and even by multiple
> services. If it is, then exactly which container the name resolves to is not
> guaranteed.
@y
> **Note**
>
> A network-wide alias can be shared by multiple containers, and even by multiple
> services. If it is, then exactly which container the name resolves to is not
> guaranteed.
@z

@x
The general format is shown here.
@y
The general format is shown here.
@z

% snip code...

@x
In the example below, three services are provided (`web`, `worker`, and `db`),
along with two networks (`new` and `legacy`). The `db` service is reachable at
the hostname `db` or `database` on the `new` network, and at `db` or `mysql` on
the `legacy` network.
@y
In the example below, three services are provided (`web`, `worker`, and `db`),
along with two networks (`new` and `legacy`). The `db` service is reachable at
the hostname `db` or `database` on the `new` network, and at `db` or `mysql` on
the `legacy` network.
@z

% snip code...

@x
#### ipv4_address, ipv6_address
@y
#### ipv4_address, ipv6_address
@z

@x
Specify a static IP address for containers for this service when joining the network.
@y
Specify a static IP address for containers for this service when joining the network.
@z

@x
The corresponding network configuration in the
[top-level networks section](#network-configuration-reference) must have an
`ipam` block with subnet configurations covering each static address.
@y
The corresponding network configuration in the
[top-level networks section](#network-configuration-reference) must have an
`ipam` block with subnet configurations covering each static address.
@z

@x
If you'd like to use IPv6, you must first ensure that the Docker daemon is configured to support IPv6.  See [Enable IPv6](../../config/daemon/ipv6.md) for detailed instructions. You can then access IPv6 addressing in a version 3.x Compose file by editing the `/etc/docker/daemon.json` to contain:
`{"ipv6": true, "fixed-cidr-v6": "2001:db8:1::/64"}`
@y
If you'd like to use IPv6, you must first ensure that the Docker daemon is configured to support IPv6.  See [Enable IPv6](../../config/daemon/ipv6.md) for detailed instructions. You can then access IPv6 addressing in a version 3.x Compose file by editing the `/etc/docker/daemon.json` to contain:
`{"ipv6": true, "fixed-cidr-v6": "2001:db8:1::/64"}`
@z

@x
Then, reload the docker daemon and edit docker-compose.yml to contain the following under the service:
@y
Then, reload the docker daemon and edit docker-compose.yml to contain the following under the service:
@z

% snip code...

@x
> The [`enable_ipv6`](compose-file-v2.md#enable_ipv6)
> option is only available in a [version 2.x Compose file](compose-file-v2.md#ipv4_address-ipv6_address).
> _IPv6 options do not currently work in swarm mode_.
@y
> The [`enable_ipv6`](compose-file-v2.md#enable_ipv6)
> option is only available in a [version 2.x Compose file](compose-file-v2.md#ipv4_address-ipv6_address).
> _IPv6 options do not currently work in swarm mode_.
@z

@x
An example:
@y
An example:
@z

% snip code...

@x
### pid
@y
### pid
@z

% snip code...

@x
Sets the PID mode to the host PID mode.  This turns on sharing between
container and the host operating system the PID address space.  Containers
launched with this flag can access and manipulate other
containers in the bare-metal machine's namespace and vice versa.
@y
Sets the PID mode to the host PID mode.  This turns on sharing between
container and the host operating system the PID address space.  Containers
launched with this flag can access and manipulate other
containers in the bare-metal machine's namespace and vice versa.
@z

@x
### ports
@y
### ports
@z

@x
Expose ports.
@y
Expose ports.
@z

@x
> **Note**
>
> Port mapping is incompatible with `network_mode: host`
@y
> **Note**
>
> Port mapping is incompatible with `network_mode: host`
@z

@x
> **Note**
>
> `docker-compose run` ignores `ports` unless you include `--service-ports`.
@y
> **Note**
>
> `docker-compose run` ignores `ports` unless you include `--service-ports`.
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
There are three options: 
* Specify both ports (`HOST:CONTAINER`)
* Specify just the container port (an ephemeral host port is chosen for the host port).
* Specify the host IP address to bind to AND both ports (the default is 0.0.0.0, meaning all interfaces): (`IPADDR:HOSTPORT:CONTAINERPORT`). If HOSTPORT is empty (for example `127.0.0.1::80`), an ephemeral port is chosen to bind to on the host.
@y
There are three options: 
* Specify both ports (`HOST:CONTAINER`)
* Specify just the container port (an ephemeral host port is chosen for the host port).
* Specify the host IP address to bind to AND both ports (the default is 0.0.0.0, meaning all interfaces): (`IPADDR:HOSTPORT:CONTAINERPORT`). If HOSTPORT is empty (for example `127.0.0.1::80`), an ephemeral port is chosen to bind to on the host.
@z

@x
> **Note**
>
> When mapping ports in the `HOST:CONTAINER` format, you may experience
> erroneous results when using a container port lower than 60, because YAML
> parses numbers in the format `xx:yy` as a base-60 value. For this reason,
> we recommend always explicitly specifying your port mappings as strings.
@y
> **Note**
>
> When mapping ports in the `HOST:CONTAINER` format, you may experience
> erroneous results when using a container port lower than 60, because YAML
> parses numbers in the format `xx:yy` as a base-60 value. For this reason,
> we recommend always explicitly specifying your port mappings as strings.
@z

% snip code...

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long form syntax allows the configuration of additional fields that can't be
expressed in the short form.
@y
The long form syntax allows the configuration of additional fields that can't be
expressed in the short form.
@z

@x
- `target`: the port inside the container
- `published`: the publicly exposed port
- `protocol`: the port protocol (`tcp` or `udp`)
- `mode`: `host` for publishing a host port on each node, or `ingress` for a swarm
   mode port to be load balanced.
@y
- `target`: the port inside the container
- `published`: the publicly exposed port
- `protocol`: the port protocol (`tcp` or `udp`)
- `mode`: `host` for publishing a host port on each node, or `ingress` for a swarm
   mode port to be load balanced.
@z

% snip code...

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format.
>
> The long syntax is new in the v3.2 file format.
@y
> Added in [version 3.2](compose-versioning.md#version-32) file format.
>
> The long syntax is new in the v3.2 file format.
@z

@x
### profiles
@y
### profiles
@z

% snip code...

@x
`profiles` defines a list of named profiles for the service to be enabled under.
When not set, the service is _always_ enabled. For the services that make up
your core application you should omit `profiles` so they will always be started.
@y
`profiles` defines a list of named profiles for the service to be enabled under.
When not set, the service is _always_ enabled. For the services that make up
your core application you should omit `profiles` so they will always be started.
@z

@x
Valid profile names follow the regex format `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@y
Valid profile names follow the regex format `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@z

@x
See also [_Using profiles with Compose_](../profiles.md) to learn more about
profiles.
@y
See also [_Using profiles with Compose_](../profiles.md) to learn more about
profiles.
@z

@x
### restart
@y
### restart
@z

@x
`no` is the default [restart policy](../../config/containers/start-containers-automatically.md#use-a-restart-policy), and it does not restart a container under
any circumstance. When `always` is specified, the container always restarts. The
`on-failure` policy restarts a container if the exit code indicates an
on-failure error. `unless-stopped` always restarts a container, except when the
container is stopped (manually or otherwise).
@y
`no` is the default [restart policy](../../config/containers/start-containers-automatically.md#use-a-restart-policy), and it does not restart a container under
any circumstance. When `always` is specified, the container always restarts. The
`on-failure` policy restarts a container if the exit code indicates an
on-failure error. `unless-stopped` always restarts a container, except when the
container is stopped (manually or otherwise).
@z

@x
    restart: "no"
    restart: always
    restart: on-failure
    restart: unless-stopped
@y
    restart: "no"
    restart: always
    restart: on-failure
    restart: unless-stopped
@z

@x
> Note when using docker stack deploy
>
> The `restart` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
{ .important }
@y
> Note when using docker stack deploy
>
> The `restart` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
{ .important }
@z

@x
### secrets
@y
### secrets
@z

@x
Grant access to secrets on a per-service basis using the per-service `secrets`
configuration. Two different syntax variants are supported.
@y
Grant access to secrets on a per-service basis using the per-service `secrets`
configuration. Two different syntax variants are supported.
@z

@x
> Note when using docker stack deploy
>
> The secret must already exist or be
> [defined in the top-level `secrets` configuration](#secrets-configuration-reference)
> of the compose file, or stack deployment fails.
{ .important }
@y
> Note when using docker stack deploy
>
> The secret must already exist or be
> [defined in the top-level `secrets` configuration](#secrets-configuration-reference)
> of the compose file, or stack deployment fails.
{ .important }
@z

@x
For more information on secrets, see [secrets](../../engine/swarm/secrets.md).
@y
For more information on secrets, see [secrets](../../engine/swarm/secrets.md).
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it at `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@y
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it at `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@z

@x
The following example uses the short syntax to grant the `redis` service
access to the `my_secret` and `my_other_secret` secrets. The value of
`my_secret` is set to the contents of the file `./my_secret.txt`, and
`my_other_secret` is defined as an external resource, which means that it has
already been defined in Docker, either by running the `docker secret create`
command or by another stack deployment. If the external secret does not exist,
the stack deployment fails with a `secret not found` error.
@y
The following example uses the short syntax to grant the `redis` service
access to the `my_secret` and `my_other_secret` secrets. The value of
`my_secret` is set to the contents of the file `./my_secret.txt`, and
`my_other_secret` is defined as an external resource, which means that it has
already been defined in Docker, either by running the `docker secret create`
command or by another stack deployment. If the external secret does not exist,
the stack deployment fails with a `secret not found` error.
@z

% snip code...

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long syntax provides more granularity in how the secret is created within
the service's task containers.
@y
The long syntax provides more granularity in how the secret is created within
the service's task containers.
@z

@x
- `source`: The identifier of the secret as it is defined in this configuration.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task containers. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the file within
  `/run/secrets/` in the service's task containers. Both default to `0` if not
  specified.
- `mode`: The permissions for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation. For instance, `0444`
  represents world-readable. The default in Docker 1.13.1 is `0000`, but it is
  `0444` in newer versions. Secrets cannot be writable because they are mounted
  in a temporary filesystem, so if you set the writable bit, it is ignored. The
  executable bit can be set. If you aren't familiar with UNIX file permission
  modes, you may find this
  [permissions calculator](http://permissions-calculator.org/)
  useful.
@y
- `source`: The identifier of the secret as it is defined in this configuration.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task containers. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the file within
  `/run/secrets/` in the service's task containers. Both default to `0` if not
  specified.
- `mode`: The permissions for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation. For instance, `0444`
  represents world-readable. The default in Docker 1.13.1 is `0000`, but it is
  `0444` in newer versions. Secrets cannot be writable because they are mounted
  in a temporary filesystem, so if you set the writable bit, it is ignored. The
  executable bit can be set. If you aren't familiar with UNIX file permission
  modes, you may find this
  [permissions calculator](http://permissions-calculator.org/)
  useful.
@z

@x
The following example sets name of the `my_secret` to `redis_secret` within the
container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The `redis` service does not have access to the `my_other_secret`
secret.
@y
The following example sets name of the `my_secret` to `redis_secret` within the
container, sets the mode to `0440` (group-readable) and sets the user and group
to `103`. The `redis` service does not have access to the `my_other_secret`
secret.
@z

% snip code...

@x
You can grant a service access to multiple secrets and you can mix long and
short syntax. Defining a secret does not imply granting a service access to it.
@y
You can grant a service access to multiple secrets and you can mix long and
short syntax. Defining a secret does not imply granting a service access to it.
@z

@x
### security_opt
@y
### security_opt
@z

@x
Override the default labeling scheme for each container.
@y
Override the default labeling scheme for each container.
@z

% snip code...

@x
> Note when using docker stack deploy
>
> The `security_opt` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
{ .important }
@y
> Note when using docker stack deploy
>
> The `security_opt` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
{ .important }
@z

@x
### stop_grace_period
@y
### stop_grace_period
@z

@x
Specify how long to wait when attempting to stop a container if it doesn't
handle SIGTERM (or whatever stop signal has been specified with
[`stop_signal`](#stop_signal)), before sending SIGKILL. Specified
as a [duration](#specifying-durations).
@y
Specify how long to wait when attempting to stop a container if it doesn't
handle SIGTERM (or whatever stop signal has been specified with
[`stop_signal`](#stop_signal)), before sending SIGKILL. Specified
as a [duration](#specifying-durations).
@z

% snip code...

@x
By default, `stop` waits 10 seconds for the container to exit before sending
SIGKILL.
@y
By default, `stop` waits 10 seconds for the container to exit before sending
SIGKILL.
@z

@x
### stop_signal
@y
### stop_signal
@z

@x
Sets an alternative signal to stop the container. By default `stop` uses
SIGTERM. Setting an alternative signal using `stop_signal` causes
`stop` to send that signal instead.
@y
Sets an alternative signal to stop the container. By default `stop` uses
SIGTERM. Setting an alternative signal using `stop_signal` causes
`stop` to send that signal instead.
@z

% snip code...

@x
### sysctls
@y
### sysctls
@z

@x
Kernel parameters to set in the container. You can use either an array or a
dictionary.
@y
Kernel parameters to set in the container. You can use either an array or a
dictionary.
@z

% snip code...

@x
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to
[configure namespaced kernel parameters (sysctls) at runtime](../../reference/cli/docker/container/run.md#sysctl).
@y
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to
[configure namespaced kernel parameters (sysctls) at runtime](../../reference/cli/docker/container/run.md#sysctl).
@z

@x
> Note when using docker stack deploy
>
> This option requires Docker Engine 19.03 or up when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
@y
> Note when using docker stack deploy
>
> This option requires Docker Engine 19.03 or up when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
@z

@x
### tmpfs
@y
### tmpfs
@z

@x
> Added in [version 3.6](compose-versioning.md#version-36) file format.
@y
> Added in [version 3.6](compose-versioning.md#version-36) file format.
@z

@x
Mount a temporary file system inside the container. Can be a single value or a list.
@y
Mount a temporary file system inside the container. Can be a single value or a list.
@z

% snip code...

@x
> Note when using docker stack deploy
>
> This option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
> with a (version 3-3.5) Compose file.
@y
> Note when using docker stack deploy
>
> This option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md)
> with a (version 3-3.5) Compose file.
@z

@x
Mount a temporary file system inside the container. Size parameter specifies the size
of the tmpfs mount in bytes. Unlimited by default.
@y
Mount a temporary file system inside the container. Size parameter specifies the size
of the tmpfs mount in bytes. Unlimited by default.
@z

% snip code...

@x
### ulimits
@y
### ulimits
@z

@x
Override the default ulimits for a container. You can either specify a single
limit as an integer or soft/hard limits as a mapping.
@y
Override the default ulimits for a container. You can either specify a single
limit as an integer or soft/hard limits as a mapping.
@z

% snip code...

@x
### userns_mode
@y
### userns_mode
@z

% snip code...

@x
Disables the user namespace for this service, if Docker daemon is configured with user namespaces.
See [dockerd](../../engine/security/userns-remap.md#disable-namespace-remapping-for-a-container) for
more information.
@y
Disables the user namespace for this service, if Docker daemon is configured with user namespaces.
See [dockerd](../../engine/security/userns-remap.md#disable-namespace-remapping-for-a-container) for
more information.
@z

@x
> Note when using docker stack deploy
>
> The `userns_mode` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
{ .important }
@y
> Note when using docker stack deploy
>
> The `userns_mode` option is ignored when
> [deploying a stack in swarm mode](../../reference/cli/docker/stack/deploy.md).
{ .important }
@z

@x
### volumes
@y
### volumes
@z

@x
Mount host paths or named volumes, specified as sub-options to a service.
@y
Mount host paths or named volumes, specified as sub-options to a service.
@z

@x
You can mount a host path as part of a definition for a single service, and
there is no need to define it in the top level `volumes` key.
@y
You can mount a host path as part of a definition for a single service, and
there is no need to define it in the top level `volumes` key.
@z

@x
But, if you want to reuse a volume across multiple services, then define a named
volume in the [top-level `volumes` key](#volume-configuration-reference). Use
named volumes with [services, swarms, and stack
files](#volumes-for-services-swarms-and-stack-files).
@y
But, if you want to reuse a volume across multiple services, then define a named
volume in the [top-level `volumes` key](#volume-configuration-reference). Use
named volumes with [services, swarms, and stack
files](#volumes-for-services-swarms-and-stack-files).
@z

@x
> Changed in [version 3](compose-versioning.md#version-3) file format.
>
> The top-level [volumes](#volume-configuration-reference) key defines
> a named volume and references it from each service's `volumes` list. This
> replaces `volumes_from` in earlier versions of the Compose file format.
@y
> Changed in [version 3](compose-versioning.md#version-3) file format.
>
> The top-level [volumes](#volume-configuration-reference) key defines
> a named volume and references it from each service's `volumes` list. This
> replaces `volumes_from` in earlier versions of the Compose file format.
@z

@x
This example shows a named volume (`mydata`) being used by the `web` service,
and a bind mount defined for a single service (first path under `db` service
`volumes`). The `db` service also uses a named volume called `dbdata` (second
path under `db` service `volumes`), but defines it using the old string format
for mounting a named volume. Named volumes must be listed under the top-level
`volumes` key, as shown.
@y
This example shows a named volume (`mydata`) being used by the `web` service,
and a bind mount defined for a single service (first path under `db` service
`volumes`). The `db` service also uses a named volume called `dbdata` (second
path under `db` service `volumes`), but defines it using the old string format
for mounting a named volume. Named volumes must be listed under the top-level
`volumes` key, as shown.
@z

% snip code...

@x
> **Note**
> 
> For general information on volumes, refer to the [use volumes](../../storage/volumes.md)
> and [volume plugins](/engine/extend/plugins_volume/) sections in the documentation.
@y
> **Note**
> 
> For general information on volumes, refer to the [use volumes](../../storage/volumes.md)
> and [volume plugins](__SUBDIR__/engine/extend/plugins_volume/) sections in the documentation.
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax uses the generic `[SOURCE:]TARGET[:MODE]` format, where
`SOURCE` can be either a host path or volume name. `TARGET` is the container
path where the volume is mounted. Standard modes are `ro` for read-only
and `rw` for read-write (default).
@y
The short syntax uses the generic `[SOURCE:]TARGET[:MODE]` format, where
`SOURCE` can be either a host path or volume name. `TARGET` is the container
path where the volume is mounted. Standard modes are `ro` for read-only
and `rw` for read-write (default).
@z

@x
You can mount a relative path on the host, which expands relative to
the directory of the Compose configuration file being used. Relative paths
should always begin with `.` or `..`.
@y
You can mount a relative path on the host, which expands relative to
the directory of the Compose configuration file being used. Relative paths
should always begin with `.` or `..`.
@z

@x
```yaml
volumes:
  # Just specify a path and let the Engine create a volume
  - /var/lib/mysql
@y
```yaml
volumes:
  # Just specify a path and let the Engine create a volume
  - /var/lib/mysql
@z

@x
  # Specify an absolute path mapping
  - /opt/data:/var/lib/mysql
@y
  # Specify an absolute path mapping
  - /opt/data:/var/lib/mysql
@z

@x
  # Path on the host, relative to the Compose file
  - ./cache:/tmp/cache
@y
  # Path on the host, relative to the Compose file
  - ./cache:/tmp/cache
@z

@x
  # User-relative path
  - ~/configs:/etc/configs/:ro
@y
  # User-relative path
  - ~/configs:/etc/configs/:ro
@z

@x
  # Named volume
  - datavolume:/var/lib/mysql
```
@y
  # Named volume
  - datavolume:/var/lib/mysql
```
@z

@x
#### Long syntax
@y
#### Long syntax
@z

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format.
@y
> Added in [version 3.2](compose-versioning.md#version-32) file format.
@z

@x
The long form syntax allows the configuration of additional fields that can't be
expressed in the short form.
@y
The long form syntax allows the configuration of additional fields that can't be
expressed in the short form.
@z

@x
- `type`: the mount type `volume`, `bind`, `tmpfs` or `npipe`
- `source`: the source of the mount, a path on the host for a bind mount, or the
  name of a volume defined in the
  [top-level `volumes` key](#volume-configuration-reference). Not applicable for a tmpfs mount.
- `target`: the path in the container where the volume is mounted
- `read_only`: flag to set the volume as read-only
- `bind`: configure additional bind options
  - `propagation`: the propagation mode used for the bind
- `volume`: configure additional volume options
  - `nocopy`: flag to disable copying of data from a container when a volume is
    created
- `tmpfs`: configure additional tmpfs options
  - `size`: the size for the tmpfs mount in bytes
@y
- `type`: the mount type `volume`, `bind`, `tmpfs` or `npipe`
- `source`: the source of the mount, a path on the host for a bind mount, or the
  name of a volume defined in the
  [top-level `volumes` key](#volume-configuration-reference). Not applicable for a tmpfs mount.
- `target`: the path in the container where the volume is mounted
- `read_only`: flag to set the volume as read-only
- `bind`: configure additional bind options
  - `propagation`: the propagation mode used for the bind
- `volume`: configure additional volume options
  - `nocopy`: flag to disable copying of data from a container when a volume is
    created
- `tmpfs`: configure additional tmpfs options
  - `size`: the size for the tmpfs mount in bytes
@z

% snip code...

@x
> **Note**
>
> When creating bind mounts, using the long syntax requires the
> referenced folder to be created beforehand. Using the short syntax
> creates the folder on the fly if it doesn't exist.
> See the [bind mounts documentation](../../storage/bind-mounts.md#differences-between--v-and---mount-behavior)
> for more information.
@y
> **Note**
>
> When creating bind mounts, using the long syntax requires the
> referenced folder to be created beforehand. Using the short syntax
> creates the folder on the fly if it doesn't exist.
> See the [bind mounts documentation](../../storage/bind-mounts.md#differences-between--v-and---mount-behavior)
> for more information.
@z

@x
#### Volumes for services, swarms, and stack files
@y
#### Volumes for services, swarms, and stack files
@z

@x
> Note when using docker stack deploy
>
> When working with services, swarms, and `docker-stack.yml` files, keep in mind
> that the tasks (containers) backing a service can be deployed on any node in a
> swarm, and this may be a different node each time the service is updated.
@y
> Note when using docker stack deploy
>
> When working with services, swarms, and `docker-stack.yml` files, keep in mind
> that the tasks (containers) backing a service can be deployed on any node in a
> swarm, and this may be a different node each time the service is updated.
@z

@x
In the absence of having named volumes with specified sources, Docker creates an
anonymous volume for each task backing a service. Anonymous volumes do not
persist after the associated containers are removed.
@y
In the absence of having named volumes with specified sources, Docker creates an
anonymous volume for each task backing a service. Anonymous volumes do not
persist after the associated containers are removed.
@z

@x
If you want your data to persist, use a named volume and a volume driver that
is multi-host aware, so that the data is accessible from any node. Or, set
constraints on the service so that its tasks are deployed on a node that has the
volume present.
@y
If you want your data to persist, use a named volume and a volume driver that
is multi-host aware, so that the data is accessible from any node. Or, set
constraints on the service so that its tasks are deployed on a node that has the
volume present.
@z

@x
As an example, the `docker-stack.yml` file for the
[votingapp sample in Docker Labs](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md)
defines a service called `db` that runs a `postgres` database. It is configured
as a named volume to persist the data on the swarm, _and_ is constrained to run
only on `manager` nodes. Here is the relevant snip-it from that file:
@y
As an example, the `docker-stack.yml` file for the
[votingapp sample in Docker Labs](https://github.com/docker/labs/blob/master/beginner/chapters/votingapp.md)
defines a service called `db` that runs a `postgres` database. It is configured
as a named volume to persist the data on the swarm, _and_ is constrained to run
only on `manager` nodes. Here is the relevant snip-it from that file:
@z

% snip code...

@x
### domainname, hostname, ipc, mac\_address, privileged, read\_only, shm\_size, stdin\_open, tty, user, working\_dir
@y
### domainname, hostname, ipc, mac\_address, privileged, read\_only, shm\_size, stdin\_open, tty, user, working\_dir
@z

@x
Each of these is a single value, analogous to its
[docker run](../../reference/cli/docker/container/run.md) counterpart. Note that `mac_address` is a legacy option.
@y
Each of these is a single value, analogous to its
[docker run](../../reference/cli/docker/container/run.md) counterpart. Note that `mac_address` is a legacy option.
@z

% snip code...

@x
## Specifying durations
@y
## Specifying durations
@z

@x
Some configuration options, such as the `interval` and `timeout` sub-options for
[`check`](#healthcheck), accept a duration as a string in a
format that looks like this:
@y
Some configuration options, such as the `interval` and `timeout` sub-options for
[`check`](#healthcheck), accept a duration as a string in a
format that looks like this:
@z

@x
    2.5s
    10s
    1m30s
    2h32m
    5h34m56s
@y
    2.5s
    10s
    1m30s
    2h32m
    5h34m56s
@z

@x
The supported units are `us`, `ms`, `s`, `m` and `h`.
@y
The supported units are `us`, `ms`, `s`, `m` and `h`.
@z

@x
## Specifying byte values
@y
## Specifying byte values
@z

@x
Some configuration options, such as the `shm_size` sub-option for
[`build`](#build), accept a byte value as a string in a format
that looks like this:
@y
Some configuration options, such as the `shm_size` sub-option for
[`build`](#build), accept a byte value as a string in a format
that looks like this:
@z

@x
    2b
    1024kb
    2048k
    300m
    1gb
@y
    2b
    1024kb
    2048k
    300m
    1gb
@z

@x
The supported units are `b`, `k`, `m` and `g`, and their alternative notation `kb`,
`mb` and `gb`. Decimal values are not supported at this time.
@y
The supported units are `b`, `k`, `m` and `g`, and their alternative notation `kb`,
`mb` and `gb`. Decimal values are not supported at this time.
@z

@x
## Volume configuration reference
@y
## Volume configuration reference
@z

@x
While it is possible to declare [volumes](#volumes) on the fly as part of the
service declaration, this section allows you to create named volumes that can be
reused across multiple services (without relying on `volumes_from`), and are
easily retrieved and inspected using the docker command line or API.
See the [docker volume](../../reference/cli/docker/volume/create.md)
subcommand documentation for more information.
@y
While it is possible to declare [volumes](#volumes) on the fly as part of the
service declaration, this section allows you to create named volumes that can be
reused across multiple services (without relying on `volumes_from`), and are
easily retrieved and inspected using the docker command line or API.
See the [docker volume](../../reference/cli/docker/volume/create.md)
subcommand documentation for more information.
@z

@x
See [use volumes](../../storage/volumes.md) and [volume
plugins](/engine/extend/plugins_volume/) for general information on volumes.
@y
See [use volumes](../../storage/volumes.md) and [volume
plugins](__SUBDIR__/engine/extend/plugins_volume/) for general information on volumes.
@z

@x
Here's an example of a two-service setup where a database's data directory is
shared with another service as a volume so that it can be periodically backed
up:
@y
Here's an example of a two-service setup where a database's data directory is
shared with another service as a volume so that it can be periodically backed
up:
@z

% snip code...

@x
An entry under the top-level `volumes` key can be empty, in which case it
uses the default driver configured by the Engine (in most cases, this is the
`local` driver). Optionally, you can configure it with the following keys:
@y
An entry under the top-level `volumes` key can be empty, in which case it
uses the default driver configured by the Engine (in most cases, this is the
`local` driver). Optionally, you can configure it with the following keys:
@z

@x
### driver
@y
### driver
@z

@x
Specify which volume driver should be used for this volume. Defaults to whatever
driver the Docker Engine has been configured to use, which in most cases is
`local`. If the driver is not available, the Engine returns an error when
`docker-compose up` tries to create the volume.
@y
Specify which volume driver should be used for this volume. Defaults to whatever
driver the Docker Engine has been configured to use, which in most cases is
`local`. If the driver is not available, the Engine returns an error when
`docker-compose up` tries to create the volume.
@z

% snip code...

@x
### driver_opts
@y
### driver_opts
@z

@x
Specify a list of options as key-value pairs to pass to the driver for this
volume. Those options are driver-dependent - consult the driver's
documentation for more information. Optional.
@y
Specify a list of options as key-value pairs to pass to the driver for this
volume. Those options are driver-dependent - consult the driver's
documentation for more information. Optional.
@z

% snip code...

@x
### external
@y
### external
@z

@x
If set to `true`, specifies that this volume has been created outside of
Compose. `docker-compose up` does not attempt to create it, and raises
an error if it doesn't exist.
@y
If set to `true`, specifies that this volume has been created outside of
Compose. `docker-compose up` does not attempt to create it, and raises
an error if it doesn't exist.
@z

@x
For version 3.3 and below of the format, `external` cannot be used in
conjunction with other volume configuration keys (`driver`, `driver_opts`,
`labels`). This limitation no longer exists for
[version 3.4](compose-versioning.md#version-34) and above.
@y
For version 3.3 and below of the format, `external` cannot be used in
conjunction with other volume configuration keys (`driver`, `driver_opts`,
`labels`). This limitation no longer exists for
[version 3.4](compose-versioning.md#version-34) and above.
@z

@x
In the example below, instead of attempting to create a volume called
`[projectname]_data`, Compose looks for an existing volume simply
called `data` and mount it into the `db` service's containers.
@y
In the example below, instead of attempting to create a volume called
`[projectname]_data`, Compose looks for an existing volume simply
called `data` and mount it into the `db` service's containers.
@z

% snip code...

@x
> Deprecated in [version 3.4](compose-versioning.md#version-34) file format.
>
> external.name was deprecated in version 3.4 file format use `name` instead.
{ .important }
@y
> Deprecated in [version 3.4](compose-versioning.md#version-34) file format.
>
> external.name was deprecated in version 3.4 file format use `name` instead.
{ .important }
@z

@x
You can also specify the name of the volume separately from the name used to
refer to it within the Compose file:
@y
You can also specify the name of the volume separately from the name used to
refer to it within the Compose file:
@z

% snip code...

@x
> Note when using docker stack deploy
>
> External volumes that do not exist _are created_ if you use [docker stack deploy](#deploy) 
> to launch the app in [swarm mode](../../engine/swarm/index.md) (instead of
> [docker compose up](../../reference/cli/docker/compose/up.md)). In swarm mode, a volume is
> automatically created when it is defined by a service. As service tasks are
> scheduled on new nodes, [swarmkit](https://github.com/docker/swarmkit/blob/master/README.md)
> creates the volume on the local node. To learn more, see [moby/moby#29976](https://github.com/moby/moby/issues/29976).
{ .important }
@y
> Note when using docker stack deploy
>
> External volumes that do not exist _are created_ if you use [docker stack deploy](#deploy) 
> to launch the app in [swarm mode](../../engine/swarm/index.md) (instead of
> [docker compose up](../../reference/cli/docker/compose/up.md)). In swarm mode, a volume is
> automatically created when it is defined by a service. As service tasks are
> scheduled on new nodes, [swarmkit](https://github.com/docker/swarmkit/blob/master/README.md)
> creates the volume on the local node. To learn more, see [moby/moby#29976](https://github.com/moby/moby/issues/29976).
{ .important }
@z

@x
### labels
@y
### labels
@z

@x
Add metadata to containers using
[Docker labels](../../config/labels-custom-metadata.md). You can use either
an array or a dictionary.
@y
Add metadata to containers using
[Docker labels](../../config/labels-custom-metadata.md). You can use either
an array or a dictionary.
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@y
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@z

% snip code...

@x
### name
@y
### name
@z

@x
> Added in [version 3.4](compose-versioning.md#version-34) file format.
@y
> Added in [version 3.4](compose-versioning.md#version-34) file format.
@z

@x
Set a custom name for this volume. The name field can be used to reference
volumes that contain special characters. The name is used as is
and will **not** be scoped with the stack name.
@y
Set a custom name for this volume. The name field can be used to reference
volumes that contain special characters. The name is used as is
and will **not** be scoped with the stack name.
@z

% snip code...

@x
It can also be used in conjunction with the `external` property:
@y
It can also be used in conjunction with the `external` property:
@z

% snip code...

@x
## Network configuration reference
@y
## Network configuration reference
@z

@x
The top-level `networks` key lets you specify networks to be created.
@y
The top-level `networks` key lets you specify networks to be created.
@z

@x
* For a full explanation of Compose's use of Docker networking features and all
  network driver options, see the [Networking guide](../networking.md).
* For [Docker Labs](https://github.com/docker/labs/blob/master/README.md)
  tutorials on networking, start with [Designing Scalable, Portable Docker Container Networks](https://github.com/docker/labs/blob/master/networking/README.md)
@y
* For a full explanation of Compose's use of Docker networking features and all
  network driver options, see the [Networking guide](../networking.md).
* For [Docker Labs](https://github.com/docker/labs/blob/master/README.md)
  tutorials on networking, start with [Designing Scalable, Portable Docker Container Networks](https://github.com/docker/labs/blob/master/networking/README.md)
@z

@x
### driver
@y
### driver
@z

@x
Specify which driver should be used for this network.
@y
Specify which driver should be used for this network.
@z

@x
The default driver depends on how the Docker Engine you're using is configured,
but in most instances it is `bridge` on a single host and `overlay` on a
Swarm.
@y
The default driver depends on how the Docker Engine you're using is configured,
but in most instances it is `bridge` on a single host and `overlay` on a
Swarm.
@z

@x
The Docker Engine returns an error if the driver is not available.
@y
The Docker Engine returns an error if the driver is not available.
@z

% snip code...

@x
#### bridge
@y
#### bridge
@z

@x
Docker defaults to using a `bridge` network on a single host. For examples of
how to work with bridge networks, see the Docker Labs tutorial on
[Bridge networking](https://github.com/docker/labs/blob/master/networking/A2-bridge-networking.md).
@y
Docker defaults to using a `bridge` network on a single host. For examples of
how to work with bridge networks, see the Docker Labs tutorial on
[Bridge networking](https://github.com/docker/labs/blob/master/networking/A2-bridge-networking.md).
@z

@x
#### overlay
@y
#### overlay
@z

@x
The `overlay` driver creates a named network across multiple nodes in a
[swarm](../../engine/swarm/index.md).
@y
The `overlay` driver creates a named network across multiple nodes in a
[swarm](../../engine/swarm/index.md).
@z

@x
* For a working example of how to build and use an
`overlay` network with a service in swarm mode, see the Docker Labs tutorial on
[Overlay networking and service discovery](https://github.com/docker/labs/blob/master/networking/A3-overlay-networking.md).
@y
* For a working example of how to build and use an
`overlay` network with a service in swarm mode, see the Docker Labs tutorial on
[Overlay networking and service discovery](https://github.com/docker/labs/blob/master/networking/A3-overlay-networking.md).
@z

@x
* For an in-depth look at how it works under the hood, see the
networking concepts lab on the
[Overlay Driver Network Architecture](https://github.com/docker/labs/blob/master/networking/concepts/06-overlay-networks.md).
@y
* For an in-depth look at how it works under the hood, see the
networking concepts lab on the
[Overlay Driver Network Architecture](https://github.com/docker/labs/blob/master/networking/concepts/06-overlay-networks.md).
@z

@x
#### host or none
@y
#### host or none
@z

@x
Use the host's networking stack, or no networking. Equivalent to
`docker run --net=host` or `docker run --net=none`. Only used if you use
`docker stack` commands. If you use the `docker-compose` command,
use [network_mode](#network_mode) instead.
@y
Use the host's networking stack, or no networking. Equivalent to
`docker run --net=host` or `docker run --net=none`. Only used if you use
`docker stack` commands. If you use the `docker-compose` command,
use [network_mode](#network_mode) instead.
@z

@x
If you want to use a particular network on a common build, use `network` as
mentioned in the second yaml file example.
@y
If you want to use a particular network on a common build, use `network` as
mentioned in the second yaml file example.
@z

@x
The syntax for using built-in networks such as `host` and `none` is a little
different. Define an external network with the name `host` or `none` (that
Docker has already created automatically) and an alias that Compose can use
(`hostnet` or `nonet` in the following examples), then grant the service access to that
network using the alias.
@y
The syntax for using built-in networks such as `host` and `none` is a little
different. Define an external network with the name `host` or `none` (that
Docker has already created automatically) and an alias that Compose can use
(`hostnet` or `nonet` in the following examples), then grant the service access to that
network using the alias.
@z

% snip code...

@x
### driver_opts
@y
### driver_opts
@z

@x
Specify a list of options as key-value pairs to pass to the driver for this
network. Those options are driver-dependent - consult the driver's
documentation for more information. Optional.
@y
Specify a list of options as key-value pairs to pass to the driver for this
network. Those options are driver-dependent - consult the driver's
documentation for more information. Optional.
@z

% snip code...

@x
### attachable
@y
### attachable
@z

@x
> Added in [version 3.2](compose-versioning.md#version-32) file format.
@y
> Added in [version 3.2](compose-versioning.md#version-32) file format.
@z

@x
Only used when the `driver` is set to `overlay`. If set to `true`, then
standalone containers can attach to this network, in addition to services. If a
standalone container attaches to an overlay network, it can communicate with
services and standalone containers that are also attached to the overlay
network from other Docker daemons.
@y
Only used when the `driver` is set to `overlay`. If set to `true`, then
standalone containers can attach to this network, in addition to services. If a
standalone container attaches to an overlay network, it can communicate with
services and standalone containers that are also attached to the overlay
network from other Docker daemons.
@z

% snip code...

@x
### enable_ipv6
@y
### enable_ipv6
@z

@x
Enable IPv6 networking on this network.
@y
Enable IPv6 networking on this network.
@z

@x
> Not supported in Compose File version 3
>
> `enable_ipv6` requires you to use a version 2 Compose file, as this directive
> is not yet supported in Swarm mode.
{ .warning }
@y
> Not supported in Compose File version 3
>
> `enable_ipv6` requires you to use a version 2 Compose file, as this directive
> is not yet supported in Swarm mode.
{ .warning }
@z

@x
### ipam
@y
### ipam
@z

@x
Specify custom IPAM config. This is an object with several properties, each of
which is optional:
@y
Specify custom IPAM config. This is an object with several properties, each of
which is optional:
@z

@x
-   `driver`: Custom IPAM driver, instead of the default.
-   `config`: A list with zero or more config blocks, each containing any of
    the following keys:
    - `subnet`: Subnet in CIDR format that represents a network segment
@y
-   `driver`: Custom IPAM driver, instead of the default.
-   `config`: A list with zero or more config blocks, each containing any of
    the following keys:
    - `subnet`: Subnet in CIDR format that represents a network segment
@z

@x
A full example:
@y
A full example:
@z

% snip code...

@x
> **Note**
>
> Additional IPAM configurations, such as `gateway`, are only honored for version 2 at the moment.
@y
> **Note**
>
> Additional IPAM configurations, such as `gateway`, are only honored for version 2 at the moment.
@z

@x
### internal
@y
### internal
@z

@x
By default, Docker also connects a bridge network to it to provide external
connectivity. If you want to create an externally isolated overlay network,
you can set this option to `true`.
@y
By default, Docker also connects a bridge network to it to provide external
connectivity. If you want to create an externally isolated overlay network,
you can set this option to `true`.
@z

@x
### labels
@y
### labels
@z

@x
Add metadata to containers using
[Docker labels](../../config/labels-custom-metadata.md). You can use either
an array or a dictionary.
@y
Add metadata to containers using
[Docker labels](../../config/labels-custom-metadata.md). You can use either
an array or a dictionary.
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@y
It's recommended that you use reverse-DNS notation to prevent your labels from
conflicting with those used by other software.
@z

% snip code...

@x
### external
@y
### external
@z

@x
If set to `true`, specifies that this network has been created outside of
Compose. `docker-compose up` does not attempt to create it, and raises
an error if it doesn't exist.
@y
If set to `true`, specifies that this network has been created outside of
Compose. `docker-compose up` does not attempt to create it, and raises
an error if it doesn't exist.
@z

@x
For version 3.3 and below of the format, `external` cannot be used in
conjunction with other network configuration keys (`driver`, `driver_opts`,
`ipam`, `internal`). This limitation no longer exists for
[version 3.4](compose-versioning.md#version-34) and above.
@y
For version 3.3 and below of the format, `external` cannot be used in
conjunction with other network configuration keys (`driver`, `driver_opts`,
`ipam`, `internal`). This limitation no longer exists for
[version 3.4](compose-versioning.md#version-34) and above.
@z

@x
In the example below, `proxy` is the gateway to the outside world. Instead of
attempting to create a network called `[projectname]_outside`, Compose
looks for an existing network simply called `outside` and connect the `proxy`
service's containers to it.
@y
In the example below, `proxy` is the gateway to the outside world. Instead of
attempting to create a network called `[projectname]_outside`, Compose
looks for an existing network simply called `outside` and connect the `proxy`
service's containers to it.
@z

% snip code...

@x
> Deprecated in [version 3.5](compose-versioning.md#version-35) file format.
>
> external.name was deprecated in version 3.5 file format use `name` instead.
{ .important }
@y
> Deprecated in [version 3.5](compose-versioning.md#version-35) file format.
>
> external.name was deprecated in version 3.5 file format use `name` instead.
{ .important }
@z

@x
You can also specify the name of the network separately from the name used to
refer to it within the Compose file:
@y
You can also specify the name of the network separately from the name used to
refer to it within the Compose file:
@z

% snip code...

@x
### name
@y
### name
@z

@x
> Added in [version 3.5](compose-versioning.md#version-35) file format.
@y
> Added in [version 3.5](compose-versioning.md#version-35) file format.
@z

@x
Set a custom name for this network. The name field can be used to reference
networks which contain special characters. The name is used as is
and will **not** be scoped with the stack name.
@y
Set a custom name for this network. The name field can be used to reference
networks which contain special characters. The name is used as is
and will **not** be scoped with the stack name.
@z

% snip code...

@x
It can also be used in conjunction with the `external` property:
@y
It can also be used in conjunction with the `external` property:
@z

% snip code...

@x
## configs configuration reference
@y
## configs configuration reference
@z

@x
The top-level `configs` declaration defines or references
[configs](../../engine/swarm/configs.md) that can be granted to the services in
this stack. The source of the config is either `file` or `external`.
@y
The top-level `configs` declaration defines or references
[configs](../../engine/swarm/configs.md) that can be granted to the services in
this stack. The source of the config is either `file` or `external`.
@z

@x
- `file`: The config is created with the contents of the file at the specified
  path.
- `external`: If set to true, specifies that this config has already been
  created. Docker does not attempt to create it, and if it does not exist, a
  `config not found` error occurs.
- `name`: The name of the config object in Docker. This field can be used to
  reference configs that contain special characters. The name is used as is
  and will **not** be scoped with the stack name. Introduced in version 3.5
  file format.
- `driver` and `driver_opts`: The name of a custom secret driver, and driver-specific
  options passed as key/value pairs. Introduced in version 3.8 file format, and
  only supported when using `docker stack`.
- `template_driver`: The name of the templating driver to use, which controls
  whether and how to evaluate the secret payload as a template. If no driver
  is set, no templating is used. The only driver currently supported is `golang`,
  which uses a `golang`. Introduced in version 3.8 file format, and only supported
  when using `docker stack`. Refer to [use a templated config](../../engine/swarm/configs.md#example-use-a-templated-config)
  for a examples of templated configs.
@y
- `file`: The config is created with the contents of the file at the specified
  path.
- `external`: If set to true, specifies that this config has already been
  created. Docker does not attempt to create it, and if it does not exist, a
  `config not found` error occurs.
- `name`: The name of the config object in Docker. This field can be used to
  reference configs that contain special characters. The name is used as is
  and will **not** be scoped with the stack name. Introduced in version 3.5
  file format.
- `driver` and `driver_opts`: The name of a custom secret driver, and driver-specific
  options passed as key/value pairs. Introduced in version 3.8 file format, and
  only supported when using `docker stack`.
- `template_driver`: The name of the templating driver to use, which controls
  whether and how to evaluate the secret payload as a template. If no driver
  is set, no templating is used. The only driver currently supported is `golang`,
  which uses a `golang`. Introduced in version 3.8 file format, and only supported
  when using `docker stack`. Refer to [use a templated config](../../engine/swarm/configs.md#example-use-a-templated-config)
  for a examples of templated configs.
@z

@x
In this example, `my_first_config` is created (as
`<stack_name>_my_first_config)`when the stack is deployed,
and `my_second_config` already exists in Docker.
@y
In this example, `my_first_config` is created (as
`<stack_name>_my_first_config)`when the stack is deployed,
and `my_second_config` already exists in Docker.
@z

% snip code...

@x
Another variant for external configs is when the name of the config in Docker
is different from the name that exists within the service. The following
example modifies the previous one to use the external config called
`redis_config`.
@y
Another variant for external configs is when the name of the config in Docker
is different from the name that exists within the service. The following
example modifies the previous one to use the external config called
`redis_config`.
@z

% snip code...

@x
You still need to [grant access to the config](#configs) to each service in the
stack.
@y
You still need to [grant access to the config](#configs) to each service in the
stack.
@z

@x
## secrets configuration reference
@y
## secrets configuration reference
@z

@x
The top-level `secrets` declaration defines or references
[secrets](../../engine/swarm/secrets.md) that can be granted to the services in
this stack. The source of the secret is either `file` or `external`.
@y
The top-level `secrets` declaration defines or references
[secrets](../../engine/swarm/secrets.md) that can be granted to the services in
this stack. The source of the secret is either `file` or `external`.
@z

@x
- `file`: The secret is created with the contents of the file at the specified
  path.
- `external`: If set to true, specifies that this secret has already been
  created. Docker does not attempt to create it, and if it does not exist, a
  `secret not found` error occurs.
- `name`: The name of the secret object in Docker. This field can be used to
  reference secrets that contain special characters. The name is used as is
  and will **not** be scoped with the stack name. Introduced in version 3.5
  file format.
- `template_driver`: The name of the templating driver to use, which controls
  whether and how to evaluate the secret payload as a template. If no driver
  is set, no templating is used. The only driver currently supported is `golang`,
  which uses a `golang`. Introduced in version 3.8 file format, and only
  supported when using `docker stack`.
@y
- `file`: The secret is created with the contents of the file at the specified
  path.
- `external`: If set to true, specifies that this secret has already been
  created. Docker does not attempt to create it, and if it does not exist, a
  `secret not found` error occurs.
- `name`: The name of the secret object in Docker. This field can be used to
  reference secrets that contain special characters. The name is used as is
  and will **not** be scoped with the stack name. Introduced in version 3.5
  file format.
- `template_driver`: The name of the templating driver to use, which controls
  whether and how to evaluate the secret payload as a template. If no driver
  is set, no templating is used. The only driver currently supported is `golang`,
  which uses a `golang`. Introduced in version 3.8 file format, and only
  supported when using `docker stack`.
@z

@x
In this example, `my_first_secret` is created as
`<stack_name>_my_first_secret` when the stack is deployed,
and `my_second_secret` already exists in Docker.
@y
In this example, `my_first_secret` is created as
`<stack_name>_my_first_secret` when the stack is deployed,
and `my_second_secret` already exists in Docker.
@z

% snip code...

@x
Another variant for external secrets is when the name of the secret in Docker
is different from the name that exists within the service. The following
example modifies the previous one to use the external secret called
`redis_secret`.
@y
Another variant for external secrets is when the name of the secret in Docker
is different from the name that exists within the service. The following
example modifies the previous one to use the external secret called
`redis_secret`.
@z

@x
### Compose File v3.5 and above
@y
### Compose File v3.5 and above
@z

% snip code...

@x
### Compose File v3.4 and under
@y
### Compose File v3.4 and under
@z

% snip code...

@x
You still need to [grant access to the secrets](#secrets) to each service in the
stack.
@y
You still need to [grant access to the secrets](#secrets) to each service in the
stack.
@z

@x
## Variable substitution
@y
## Variable substitution
@z

@x
{{< include "content/compose-var-sub.md" >}}
@y
{{< include "content/compose-var-sub.md" >}}
@z

@x
## Extension fields
@y
## Extension fields
@z

@x
> Added in [version 3.4](compose-versioning.md#version-34) file format.
@y
> Added in [version 3.4](compose-versioning.md#version-34) file format.
@z

@x
{{< include "content/compose-extfields-sub.md" >}}
@y
{{< include "content/compose-extfields-sub.md" >}}
@z

@x
## Compose documentation
@y
## Compose documentation
@z

@x
- [User guide](../index.md)
- [Installing Compose](../install/index.md)
- [Compose file versions and upgrading](compose-versioning.md)
- [Sample apps with Compose](../samples-for-compose.md)
- [Command line reference](../reference/index.md)
@y
- [User guide](../index.md)
- [Installing Compose](../install/index.md)
- [Compose file versions and upgrading](compose-versioning.md)
- [Sample apps with Compose](../samples-for-compose.md)
- [Command line reference](../reference/index.md)
@z
