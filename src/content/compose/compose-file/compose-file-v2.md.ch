%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
---
description: Compose file reference
keywords: fig, composition, compose version 2, docker
title: Compose file version 2 reference
toc_max: 4
toc_min: 1
---
@y
---
description: Compose file reference
keywords: fig, composition, compose version 2, docker
title: Compose file version 2 reference
toc_max: 4
toc_min: 1
---
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
These topics describe version 2 of the Compose file format.
@y
These topics describe version 2 of the Compose file format.
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
definition in version 2.
@y
This section contains a list of all configuration options supported by a service
definition in version 2.
@z

@x
### blkio_config
@y
### blkio_config
@z

@x
A set of configuration options to set block IO limits for this service.
@y
A set of configuration options to set block IO limits for this service.
@z

@x
    version: "{{% param "compose_file_v2" %}}"
    services:
      foo:
        image: busybox
        blkio_config:
          weight: 300
          weight_device:
            - path: /dev/sda
              weight: 400
          device_read_bps:
            - path: /dev/sdb
              rate: '12mb'
          device_read_iops:
            - path: /dev/sdb
              rate: 120
          device_write_bps:
            - path: /dev/sdb
              rate: '1024k'
          device_write_iops:
            - path: /dev/sdb
              rate: 30
@y
    version: "{{% param "compose_file_v2" %}}"
    services:
      foo:
        image: busybox
        blkio_config:
          weight: 300
          weight_device:
            - path: /dev/sda
              weight: 400
          device_read_bps:
            - path: /dev/sdb
              rate: '12mb'
          device_read_iops:
            - path: /dev/sdb
              rate: 120
          device_write_bps:
            - path: /dev/sdb
              rate: '1024k'
          device_write_iops:
            - path: /dev/sdb
              rate: 30
@z

@x
#### device_read_bps, device_write_bps
@y
#### device_read_bps, device_write_bps
@z

@x
Set a limit in bytes per second for read / write operations on a given device.
Each item in the list must have two keys:
@y
Set a limit in bytes per second for read / write operations on a given device.
Each item in the list must have two keys:
@z

@x
* `path`, defining the symbolic path to the affected device
* `rate`, either as an integer value representing the number of bytes or as
  a string expressing a [byte value](#specifying-byte-values).
@y
* `path`, defining the symbolic path to the affected device
* `rate`, either as an integer value representing the number of bytes or as
  a string expressing a [byte value](#specifying-byte-values).
@z

@x
#### device_read_iops, device_write_iops
@y
#### device_read_iops, device_write_iops
@z

@x
Set a limit in operations per second for read / write operations on a given
device. Each item in the list must have two keys:
@y
Set a limit in operations per second for read / write operations on a given
device. Each item in the list must have two keys:
@z

@x
* `path`, defining the symbolic path to the affected device
* `rate`, as an integer value representing the permitted number of operations
  per second.
@y
* `path`, defining the symbolic path to the affected device
* `rate`, as an integer value representing the permitted number of operations
  per second.
@z

@x
#### weight
@y
#### weight
@z

@x
Modify the proportion of bandwidth allocated to this service relative to other
services. Takes an integer value between 10 and 1000, with 500 being the
default.
@y
Modify the proportion of bandwidth allocated to this service relative to other
services. Takes an integer value between 10 and 1000, with 500 being the
default.
@z

@x
#### weight_device
@y
#### weight_device
@z

@x
Fine-tune bandwidth allocation by device. Each item in the list must have
two keys:
@y
Fine-tune bandwidth allocation by device. Each item in the list must have
two keys:
@z

@x
* `path`, defining the symbolic path to the affected device
* `weight`, an integer value between 10 and 1000
@y
* `path`, defining the symbolic path to the affected device
* `weight`, an integer value between 10 and 1000
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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  webapp:
    build: ./dir
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  webapp:
    build: ./dir
```
@z

@x
Or, as an object with the path specified under [context](#context) and
optionally [Dockerfile](#dockerfile) and [args](#args):
@y
Or, as an object with the path specified under [context](#context) and
optionally [Dockerfile](#dockerfile) and [args](#args):
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  webapp:
    build:
      context: ./dir
      dockerfile: Dockerfile-alternate
      args:
        buildno: 1
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  webapp:
    build:
      context: ./dir
      dockerfile: Dockerfile-alternate
      args:
        buildno: 1
```
@z

@x
If you specify `image` as well as `build`, then Compose names the built image
with the `webapp` and optional `tag` specified in `image`:
@y
If you specify `image` as well as `build`, then Compose names the built image
with the `webapp` and optional `tag` specified in `image`:
@z

@x
```yaml
build: ./dir
image: webapp:tag
```
@y
```yaml
build: ./dir
image: webapp:tag
```
@z

@x
This results in an image named `webapp` and tagged `tag`, built from `./dir`.
@y
This results in an image named `webapp` and tagged `tag`, built from `./dir`.
@z

@x
#### context
@y
#### context
@z

@x
> Added in [version 2.0](compose-versioning.md#version-2) file format.
@y
> Added in [version 2.0](compose-versioning.md#version-2) file format.
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

@x
```yaml
build:
  context: ./dir
```
@y
```yaml
build:
  context: ./dir
```
@z

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

@x
```yaml
build:
  context: .
  dockerfile: Dockerfile-alternate
```
@y
```yaml
build:
  context: .
  dockerfile: Dockerfile-alternate
```
@z

@x
#### args
@y
#### args
@z

@x
> Added in [version 2.0](compose-versioning.md#version-2) file format.
@y
> Added in [version 2.0](compose-versioning.md#version-2) file format.
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

@x
```dockerfile
# syntax=docker/dockerfile:1
@y
```dockerfile
# syntax=docker/dockerfile:1
@z

@x
ARG buildno
ARG gitcommithash
@y
ARG buildno
ARG gitcommithash
@z

@x
RUN echo "Build number: $buildno"
RUN echo "Based on commit: $gitcommithash"
```
@y
RUN echo "Build number: $buildno"
RUN echo "Based on commit: $gitcommithash"
```
@z

@x
Then specify the arguments under the `build` key. You can pass a mapping
or a list:
@y
Then specify the arguments under the `build` key. You can pass a mapping
or a list:
@z

@x
```yaml
build:
  context: .
  args:
    buildno: 1
    gitcommithash: cdc3b19
```
@y
```yaml
build:
  context: .
  args:
    buildno: 1
    gitcommithash: cdc3b19
```
@z

@x
```yaml
build:
  context: .
  args:
    - buildno=1
    - gitcommithash=cdc3b19
```
@y
```yaml
build:
  context: .
  args:
    - buildno=1
    - gitcommithash=cdc3b19
```
@z

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

@x
```yaml
args:
  - buildno
  - gitcommithash
```
@y
```yaml
args:
  - buildno
  - gitcommithash
```
@z

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
> Added in [version 2.2](compose-versioning.md#version-22) file format
@y
> Added in [version 2.2](compose-versioning.md#version-22) file format
@z

@x
A list of images that the engine uses for cache resolution.
@y
A list of images that the engine uses for cache resolution.
@z

@x
```yaml
build:
  context: .
  cache_from:
    - alpine:latest
    - corp/web_app:3.14
```
@y
```yaml
build:
  context: .
  cache_from:
    - alpine:latest
    - corp/web_app:3.14
```
@z

@x
#### extra_hosts
@y
#### extra_hosts
@z

@x
Add hostname mappings at build-time. Use the same values as the docker client `--add-host` parameter.
@y
Add hostname mappings at build-time. Use the same values as the docker client `--add-host` parameter.
@z

@x
```yaml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@y
```yaml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@z

@x
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this build, e.g:
@y
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this build, e.g:
@z

@x
```console
162.242.195.82  somehost
50.31.209.229   otherhost
```
@y
```console
162.242.195.82  somehost
50.31.209.229   otherhost
```
@z

@x
#### isolation
@y
#### isolation
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@z

@x
Specify a build’s container isolation technology. On Linux, the only supported value
is `default`. On Windows, acceptable values are `default`, `process` and
`hyperv`. Refer to the
[Docker Engine docs](../../reference/cli/docker/container/run.md#isolation)
for details.
@y
Specify a build’s container isolation technology. On Linux, the only supported value
is `default`. On Windows, acceptable values are `default`, `process` and
`hyperv`. Refer to the
[Docker Engine docs](../../reference/cli/docker/container/run.md#isolation)
for details.
@z

@x
If unspecified, Compose will use the `isolation` value found in the service's definition
to determine the value to use for builds.
@y
If unspecified, Compose will use the `isolation` value found in the service's definition
to determine the value to use for builds.
@z

@x
#### labels
@y
#### labels
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format
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

@x
```yaml
build:
  context: .
  labels:
    com.example.description: "Accounting webapp"
    com.example.department: "Finance"
    com.example.label-with-empty-value: ""
```
@y
```yaml
build:
  context: .
  labels:
    com.example.description: "Accounting webapp"
    com.example.department: "Finance"
    com.example.label-with-empty-value: ""
```
@z

@x
```yaml
build:
  context: .
  labels:
    - "com.example.description=Accounting webapp"
    - "com.example.department=Finance"
    - "com.example.label-with-empty-value"
```
@y
```yaml
build:
  context: .
  labels:
    - "com.example.description=Accounting webapp"
    - "com.example.department=Finance"
    - "com.example.label-with-empty-value"
```
@z

@x
#### network
@y
#### network
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format
@y
> Added in [version 2.2](compose-versioning.md#version-22) file format
@z

@x
Set the network containers connect to for the `RUN` instructions during
build.
@y
Set the network containers connect to for the `RUN` instructions during
build.
@z

@x
```yaml
build:
  context: .
  network: host
```
@y
```yaml
build:
  context: .
  network: host
```
@z

@x
```yaml
build:
  context: .
  network: custom_network_1
```
@y
```yaml
build:
  context: .
  network: custom_network_1
```
@z

@x
Use `none` to disable networking during build:
@y
Use `none` to disable networking during build:
@z

@x
```yaml
build:
  context: .
  network: none
```
@y
```yaml
build:
  context: .
  network: none
```
@z

@x
#### shm_size
@y
#### shm_size
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format
@y
> Added in [version 2.3](compose-versioning.md#version-23) file format
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

@x
```yaml
build:
  context: .
  shm_size: '2gb'
```
@y
```yaml
build:
  context: .
  shm_size: '2gb'
```
@z

@x
```yaml
build:
  context: .
  shm_size: 10000000
```
@y
```yaml
build:
  context: .
  shm_size: 10000000
```
@z

@x
#### target
@y
#### target
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format
@y
> Added in [version 2.3](compose-versioning.md#version-23) file format
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

@x
```yaml
build:
  context: .
  target: prod
```
@y
```yaml
build:
  context: .
  target: prod
```
@z

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

@x
```yaml
cap_add:
  - ALL
@y
```yaml
cap_add:
  - ALL
@z

@x
cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
```
@y
cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
```
@z

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

@x
```yaml
cgroup_parent: m-executor-abcd
```
@y
```yaml
cgroup_parent: m-executor-abcd
```
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

@x
```yaml
command: bundle exec thin -p 3000
```
@y
```yaml
command: bundle exec thin -p 3000
```
@z

@x
The command can also be a list, in a manner similar to
[dockerfile](../../reference/dockerfile.md#cmd):
@y
The command can also be a list, in a manner similar to
[dockerfile](../../reference/dockerfile.md#cmd):
@z

@x
```yaml
command: ["bundle", "exec", "thin", "-p", "3000"]
```
@y
```yaml
command: ["bundle", "exec", "thin", "-p", "3000"]
```
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

@x
```yaml
container_name: my-web-container
```
@y
```yaml
container_name: my-web-container
```
@z

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
### cpu_rt_runtime, cpu_rt_period
@y
### cpu_rt_runtime, cpu_rt_period
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format
@y
> Added in [version 2.2](compose-versioning.md#version-22) file format
@z

@x
Configure CPU allocation parameters using the Docker daemon realtime scheduler.
@y
Configure CPU allocation parameters using the Docker daemon realtime scheduler.
@z

@x
```yaml
cpu_rt_runtime: '400ms'
cpu_rt_period: '1400us'
```
@y
```yaml
cpu_rt_runtime: '400ms'
cpu_rt_period: '1400us'
```
@z

@x
Integer values will use microseconds as units:
@y
Integer values will use microseconds as units:
@z

@x
```yaml
cpu_rt_runtime: 95000
cpu_rt_period: 11000
```
@y
```yaml
cpu_rt_runtime: 95000
cpu_rt_period: 11000
```
@z

@x
### device_cgroup_rules
@y
### device_cgroup_rules
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format.
@y
> Added in [version 2.3](compose-versioning.md#version-23) file format.
@z

@x
Add rules to the cgroup allowed devices list.
@y
Add rules to the cgroup allowed devices list.
@z

@x
```yaml
device_cgroup_rules:
  - 'c 1:3 mr'
  - 'a 7:* rmw'
```
@y
```yaml
device_cgroup_rules:
  - 'c 1:3 mr'
  - 'a 7:* rmw'
```
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

@x
```yaml
devices:
  - "/dev/ttyUSB0:/dev/ttyUSB0"
```
@y
```yaml
devices:
  - "/dev/ttyUSB0:/dev/ttyUSB0"
```
@z

@x
### depends_on
@y
### depends_on
@z

@x
> Added in [version 2.0](compose-versioning.md#version-2) file format.
@y
> Added in [version 2.0](compose-versioning.md#version-2) file format.
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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  web:
    build: .
    depends_on:
      - db
      - redis
  redis:
    image: redis
  db:
    image: postgres
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  web:
    build: .
    depends_on:
      - db
      - redis
  redis:
    image: redis
  db:
    image: postgres
```
@z

@x
> **Note**
>
> `depends_on` does not wait for `db` and `redis` to be "ready" before
> starting `web` - only until they have been started. If you need to wait
> for a service to be ready, see [Controlling startup order](../startup-order.md)
> for more on this problem and strategies for solving it.
@y
> **Note**
>
> `depends_on` does not wait for `db` and `redis` to be "ready" before
> starting `web` - only until they have been started. If you need to wait
> for a service to be ready, see [Controlling startup order](../startup-order.md)
> for more on this problem and strategies for solving it.
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@z

@x
A healthcheck indicates that you want a dependency to wait
for another container to be "healthy" (as indicated by a successful state from
the healthcheck) before starting.
@y
A healthcheck indicates that you want a dependency to wait
for another container to be "healthy" (as indicated by a successful state from
the healthcheck) before starting.
@z

@x
Example:
@y
Example:
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  web:
    build: .
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
  redis:
    image: redis
  db:
    image: postgres
    healthcheck:
      test: "exit 0"
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  web:
    build: .
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
  redis:
    image: redis
  db:
    image: postgres
    healthcheck:
      test: "exit 0"
```
@z

@x
In the above example, Compose waits for the `redis` service to be started
(legacy behavior) and the `db` service to be healthy before starting `web`.
@y
In the above example, Compose waits for the `redis` service to be started
(legacy behavior) and the `db` service to be healthy before starting `web`.
@z

@x
See the [healthcheck section](#healthcheck) for complementary
information.
@y
See the [healthcheck section](#healthcheck) for complementary
information.
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

@x
```yaml
dns: 8.8.8.8
```
@y
```yaml
dns: 8.8.8.8
```
@z

@x
```yaml
dns:
  - 8.8.8.8
  - 9.9.9.9
```
@y
```yaml
dns:
  - 8.8.8.8
  - 9.9.9.9
```
@z

@x
### dns_opt
@y
### dns_opt
@z

@x
List of custom DNS options to be added to the container's `resolv.conf` file.
@y
List of custom DNS options to be added to the container's `resolv.conf` file.
@z

@x
```yaml
dns_opt:
  - use-vc
  - no-tld-query
```
@y
```yaml
dns_opt:
  - use-vc
  - no-tld-query
```
@z

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

@x
```yaml
dns_search: example.com
```
@y
```yaml
dns_search: example.com
```
@z

@x
```yaml
dns_search:
  - dc1.example.com
  - dc2.example.com
```
@y
```yaml
dns_search:
  - dc1.example.com
  - dc2.example.com
```
@z

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

@x
```yaml
entrypoint: /code/entrypoint.sh
```
@y
```yaml
entrypoint: /code/entrypoint.sh
```
@z

@x
The entrypoint can also be a list, in a manner similar to
[dockerfile](../../reference/dockerfile.md#entrypoint):
@y
The entrypoint can also be a list, in a manner similar to
[dockerfile](../../reference/dockerfile.md#entrypoint):
@z

@x
```yaml
entrypoint: ["php", "-d", "memory_limit=-1", "vendor/bin/phpunit"]
```
@y
```yaml
entrypoint: ["php", "-d", "memory_limit=-1", "vendor/bin/phpunit"]
```
@z

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

@x
```yaml
env_file: .env
```
@y
```yaml
env_file: .env
```
@z

@x
```yaml
env_file:
  - ./common.env
  - ./apps/web.env
  - /opt/runtime_opts.env
```
@y
```yaml
env_file:
  - ./common.env
  - ./apps/web.env
  - /opt/runtime_opts.env
```
@z

@x
Compose expects each line in an env file to be in `VAR=VAL` format. Lines
beginning with `#` are treated as comments and are ignored. Blank lines are
also ignored.
@y
Compose expects each line in an env file to be in `VAR=VAL` format. Lines
beginning with `#` are treated as comments and are ignored. Blank lines are
also ignored.
@z

@x
```console
# Set Rails/Rack environment
RACK_ENV=development
```
@y
```console
# Set Rails/Rack environment
RACK_ENV=development
```
@z

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

@x
```yaml
services:
  some-service:
    env_file:
      - a.env
      - b.env
```
@y
```yaml
services:
  some-service:
    env_file:
      - a.env
      - b.env
```
@z

@x
And the following files:
@y
And the following files:
@z

@x
```console
# a.env
VAR=1
```
@y
```console
# a.env
VAR=1
```
@z

@x
and
@y
and
@z

@x
```console
# b.env
VAR=hello
```
@y
```console
# b.env
VAR=hello
```
@z

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

@x
```yaml
environment:
  RACK_ENV: development
  SHOW: 'true'
  SESSION_SECRET:
```
@y
```yaml
environment:
  RACK_ENV: development
  SHOW: 'true'
  SESSION_SECRET:
```
@z

@x
```yaml
environment:
  - RACK_ENV=development
  - SHOW=true
  - SESSION_SECRET
```
@y
```yaml
environment:
  - RACK_ENV=development
  - SHOW=true
  - SESSION_SECRET
```
@z

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

@x
```yaml
expose:
  - "3000"
  - "8000"
```
@y
```yaml
expose:
  - "3000"
  - "8000"
```
@z

@x
### extends
@y
### extends
@z

@x
Extend another service, in the current file or another, optionally overriding
configuration.
@y
Extend another service, in the current file or another, optionally overriding
configuration.
@z

@x
You can use `extends` on any service together with other configuration keys.
The `extends` value must be a dictionary defined with a required `service`
and an optional `file` key.
@y
You can use `extends` on any service together with other configuration keys.
The `extends` value must be a dictionary defined with a required `service`
and an optional `file` key.
@z

@x
```yaml
extends:
  file: common.yml
  service: webapp
```
@y
```yaml
extends:
  file: common.yml
  service: webapp
```
@z

@x
The `service` is the name of the service being extended, for example
`web` or `database`. The `file` is the location of a Compose configuration
file defining that service.
@y
The `service` is the name of the service being extended, for example
`web` or `database`. The `file` is the location of a Compose configuration
file defining that service.
@z

@x
If you omit the `file` Compose looks for the service configuration in the
current file. The `file` value can be an absolute or relative path. If you
specify a relative path, Compose treats it as relative to the location of the
current file.
@y
If you omit the `file` Compose looks for the service configuration in the
current file. The `file` value can be an absolute or relative path. If you
specify a relative path, Compose treats it as relative to the location of the
current file.
@z

@x
You can extend a service that itself extends another. You can extend
indefinitely. Compose does not support circular references and `docker-compose`
returns an error if it encounters one.
@y
You can extend a service that itself extends another. You can extend
indefinitely. Compose does not support circular references and `docker-compose`
returns an error if it encounters one.
@z

@x
For more on `extends`, see the
[the extends documentation](../multiple-compose-files/extends.md)
@y
For more on `extends`, see the
[the extends documentation](../multiple-compose-files/extends.md)
@z

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

@x
```yaml
external_links:
  - redis_1
  - project_db_1:mysql
  - project_db_1:postgresql
```
@y
```yaml
external_links:
  - redis_1
  - project_db_1:mysql
  - project_db_1:postgresql
```
@z

@x
> **Note**
>
> If you're using the [version 2 or above file format](compose-versioning.md#version-2),
> the externally-created  containers must be connected to at least one of the same
> networks as the service that is linking to them. [Links](compose-file-v2.md#links)
> are a legacy option. We recommend using [networks](#networks) instead.
@y
> **Note**
>
> If you're using the [version 2 or above file format](compose-versioning.md#version-2),
> the externally-created  containers must be connected to at least one of the same
> networks as the service that is linking to them. [Links](compose-file-v2.md#links)
> are a legacy option. We recommend using [networks](#networks) instead.
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

@x
```yaml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@y
```yaml
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```
@z

@x
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this service, e.g:
@y
An entry with the ip address and hostname is created in `/etc/hosts` inside containers for this service, e.g:
@z

@x
```console
162.242.195.82  somehost
50.31.209.229   otherhost
```
@y
```console
162.242.195.82  somehost
50.31.209.229   otherhost
```
@z

@x
### group_add
@y
### group_add
@z

@x
Specify additional groups (by name or number) which the user inside the
container should be a member of. Groups must exist in both the container and the
host system to be added. An example of where this is useful is when multiple
containers (running as different users) need to all read or write the same
file on the host system. That file can be owned by a group shared by all the
containers, and specified in `group_add`. See the
[Docker documentation](../../reference/cli/docker/container/run.md#additional-groups) for more
details.
@y
Specify additional groups (by name or number) which the user inside the
container should be a member of. Groups must exist in both the container and the
host system to be added. An example of where this is useful is when multiple
containers (running as different users) need to all read or write the same
file on the host system. That file can be owned by a group shared by all the
containers, and specified in `group_add`. See the
[Docker documentation](../../reference/cli/docker/container/run.md#additional-groups) for more
details.
@z

@x
A full example:
@y
A full example:
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  myservice:
    image: alpine
    group_add:
      - mail
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  myservice:
    image: alpine
    group_add:
      - mail
```
@z

@x
Running `id` inside the created container shows that the user belongs to
the `mail` group, which would not have been the case if `group_add` were not
used.
@y
Running `id` inside the created container shows that the user belongs to
the `mail` group, which would not have been the case if `group_add` were not
used.
@z

@x
### healthcheck
@y
### healthcheck
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
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

@x
```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 40s
```
@y
```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 40s
```
@z

@x
`interval`, `timeout` and `start_period` are specified as
[durations](#specifying-durations).
@y
`interval`, `timeout` and `start_period` are specified as
[durations](#specifying-durations).
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format.
>
> The `start_period` option was added in file format 2.3.
@y
> Added in [version 2.3](compose-versioning.md#version-23) file format.
>
> The `start_period` option was added in file format 2.3.
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

@x
```yaml
# Hit the local web app
test: ["CMD", "curl", "-f", "http://localhost"]
```
@y
```yaml
# Hit the local web app
test: ["CMD", "curl", "-f", "http://localhost"]
```
@z

@x
As above, but wrapped in `/bin/sh`. Both forms below are equivalent.
@y
As above, but wrapped in `/bin/sh`. Both forms below are equivalent.
@z

@x
```yaml
test: ["CMD-SHELL", "curl -f http://localhost || exit 1"]
```
@y
```yaml
test: ["CMD-SHELL", "curl -f http://localhost || exit 1"]
```
@z

@x
```yaml
test: curl -f https://localhost || exit 1
```
@y
```yaml
test: curl -f https://localhost || exit 1
```
@z

@x
To disable any default healthcheck set by the image, you can use `disable: true`.
This is equivalent to specifying `test: ["NONE"]`.
@y
To disable any default healthcheck set by the image, you can use `disable: true`.
This is equivalent to specifying `test: ["NONE"]`.
@z

@x
```yaml
healthcheck:
  disable: true
```
@y
```yaml
healthcheck:
  disable: true
```
@z

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

@x
```yaml
image: redis
```
```yaml
image: ubuntu:22.04
```
```yaml
image: tutum/influxdb
```
```yaml
image: example-registry.com:4000/postgresql
```
```yaml
image: a4bc65fd
```
@y
```yaml
image: redis
```
```yaml
image: ubuntu:22.04
```
```yaml
image: tutum/influxdb
```
```yaml
image: example-registry.com:4000/postgresql
```
```yaml
image: a4bc65fd
```
@z

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
> Added in [version 2.2](compose-versioning.md#version-22) file format.
@y
> Added in [version 2.2](compose-versioning.md#version-22) file format.
@z

@x
Run an init inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@y
Run an init inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  web:
    image: alpine:latest
    init: true
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  web:
    image: alpine:latest
    init: true
```
@z

@x
> The default init binary that is used is [Tini](https://github.com/krallin/tini),
> and is installed in `/usr/libexec/docker-init` on the daemon host. You can
> configure the daemon to use a custom init binary through the
> [`init-path` configuration option](../../reference/cli/dockerd.md#daemon-configuration-file).
@y
> The default init binary that is used is [Tini](https://github.com/krallin/tini),
> and is installed in `/usr/libexec/docker-init` on the daemon host. You can
> configure the daemon to use a custom init binary through the
> [`init-path` configuration option](../../reference/cli/dockerd.md#daemon-configuration-file).
@z

@x
### isolation
@y
### isolation
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
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

@x
```yaml
labels:
  com.example.description: "Accounting webapp"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@y
```yaml
labels:
  com.example.description: "Accounting webapp"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@z

@x
```yaml
labels:
  - "com.example.description=Accounting webapp"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@y
```yaml
labels:
  - "com.example.description=Accounting webapp"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@z

@x
### links
@y
### links
@z

@x
Link to containers in another service. Either specify both the service name and
a link alias (`"SERVICE:ALIAS"`), or just the service name.
@y
Link to containers in another service. Either specify both the service name and
a link alias (`"SERVICE:ALIAS"`), or just the service name.
@z

@x
> Links are a legacy option. We recommend using
> [networks](#networks) instead.
@y
> Links are a legacy option. We recommend using
> [networks](#networks) instead.
@z

@x
```yaml
web:
  links:
    - "db"
    - "db:database"
    - "redis"
```
@y
```yaml
web:
  links:
    - "db"
    - "db:database"
    - "redis"
```
@z

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
[Links topic in Networking in Compose](../networking.md#link-containers).)
@y
Links are not required to enable services to communicate - by default,
any service can reach any other service at that service’s name. (See also, the
[Links topic in Networking in Compose](../networking.md#link-containers).)
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
> communicate. We recommend using networks instead.
@y
> **Note**
>
> If you define both links and [networks](#networks), services with
> links between them must share at least one network in common to
> communicate. We recommend using networks instead.
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

@x
```yaml
logging:
  driver: syslog
  options:
    syslog-address: "tcp://192.168.0.42:123"
```
@y
```yaml
logging:
  driver: syslog
  options:
    syslog-address: "tcp://192.168.0.42:123"
```
@z

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

@x
```yaml
driver: "json-file"
```
```yaml
driver: "syslog"
```
```yaml
driver: "none"
```
@y
```yaml
driver: "json-file"
```
```yaml
driver: "syslog"
```
```yaml
driver: "none"
```
@z

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

@x
```yaml
driver: "syslog"
options:
  syslog-address: "tcp://192.168.0.42:123"
```
@y
```yaml
driver: "syslog"
options:
  syslog-address: "tcp://192.168.0.42:123"
```
@z

@x
### network_mode
@y
### network_mode
@z

@x
> Changed in [version 2](compose-versioning.md#version-2) file format.
@y
> Changed in [version 2](compose-versioning.md#version-2) file format.
@z

@x
Network mode. Use the same values as the docker client `--network` parameter, plus
the special form `service:[service name]`.
@y
Network mode. Use the same values as the docker client `--network` parameter, plus
the special form `service:[service name]`.
@z

@x
```yaml
network_mode: "bridge"
```
```yaml
network_mode: "host"
```
```yaml
network_mode: "none"
```
```yaml
network_mode: "service:[service name]"
```
```yaml
network_mode: "container:[container name/id]"
```
@y
```yaml
network_mode: "bridge"
```
```yaml
network_mode: "host"
```
```yaml
network_mode: "none"
```
```yaml
network_mode: "service:[service name]"
```
```yaml
network_mode: "container:[container name/id]"
```
@z

@x
### networks
@y
### networks
@z

@x
> Changed in [version 2](compose-versioning.md#version-2) file format.
@y
> Changed in [version 2](compose-versioning.md#version-2) file format.
@z

@x
Networks to join, referencing entries under the
[top-level `networks` key](#network-configuration-reference).
@y
Networks to join, referencing entries under the
[top-level `networks` key](#network-configuration-reference).
@z

@x
```yaml
services:
  some-service:
    networks:
     - some-network
     - other-network
```
@y
```yaml
services:
  some-service:
    networks:
     - some-network
     - other-network
```
@z

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

@x
```yaml
services:
  some-service:
    networks:
      some-network:
        aliases:
          - alias1
          - alias3
      other-network:
        aliases:
          - alias2
```
@y
```yaml
services:
  some-service:
    networks:
      some-network:
        aliases:
          - alias1
          - alias3
      other-network:
        aliases:
          - alias2
```
@z

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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
@z

@x
services:
  web:
    image: "nginx:alpine"
    networks:
      - new
@y
services:
  web:
    image: "nginx:alpine"
    networks:
      - new
@z

@x
  worker:
    image: "my-worker-image:latest"
    networks:
      - legacy
@y
  worker:
    image: "my-worker-image:latest"
    networks:
      - legacy
@z

@x
  db:
    image: mysql
    networks:
      new:
        aliases:
          - database
      legacy:
        aliases:
          - mysql
@y
  db:
    image: mysql
    networks:
      new:
        aliases:
          - database
      legacy:
        aliases:
          - mysql
@z

@x
networks:
  new:
  legacy:
```
@y
networks:
  new:
  legacy:
```
@z

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
`ipam` block with subnet and gateway configurations covering each static address.
@y
The corresponding network configuration in the
[top-level networks section](#network-configuration-reference) must have an
`ipam` block with subnet and gateway configurations covering each static address.
@z

@x
> If IPv6 addressing is desired, the [`enable_ipv6`](#enable_ipv6) option must be set.
@y
> If IPv6 addressing is desired, the [`enable_ipv6`](#enable_ipv6) option must be set.
@z

@x
An example:
@y
An example:
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
@z

@x
services:
  app:
    image: busybox
    command: ifconfig
    networks:
      app_net:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10
@y
services:
  app:
    image: busybox
    command: ifconfig
    networks:
      app_net:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10
@z

@x
networks:
  app_net:
    driver: bridge
    enable_ipv6: true
    ipam:
      driver: default
      config:
        - subnet: 172.16.238.0/24
          gateway: 172.16.238.1
        - subnet: 2001:3984:3989::/64
          gateway: 2001:3984:3989::1
```
@y
networks:
  app_net:
    driver: bridge
    enable_ipv6: true
    ipam:
      driver: default
      config:
        - subnet: 172.16.238.0/24
          gateway: 172.16.238.1
        - subnet: 2001:3984:3989::/64
          gateway: 2001:3984:3989::1
```
@z

@x
#### link_local_ips
@y
#### link_local_ips
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@z

@x
Specify a list of link-local IPs. Link-local IPs are special IPs which belong
to a well known subnet and are purely managed by the operator, usually
dependent on the architecture where they are deployed. Therefore they are not
managed by docker (IPAM driver).
@y
Specify a list of link-local IPs. Link-local IPs are special IPs which belong
to a well known subnet and are purely managed by the operator, usually
dependent on the architecture where they are deployed. Therefore they are not
managed by docker (IPAM driver).
@z

@x
Example usage:
@y
Example usage:
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  app:
    image: busybox
    command: top
    networks:
      app_net:
        link_local_ips:
          - 57.123.22.11
          - 57.123.22.13
networks:
  app_net:
    driver: bridge
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  app:
    image: busybox
    command: top
    networks:
      app_net:
        link_local_ips:
          - 57.123.22.11
          - 57.123.22.13
networks:
  app_net:
    driver: bridge
```
@z

@x
#### priority
@y
#### priority
@z

@x
Specify a priority to indicate in which order Compose should connect the
service's containers to its networks. If unspecified, the default value is `0`.
@y
Specify a priority to indicate in which order Compose should connect the
service's containers to its networks. If unspecified, the default value is `0`.
@z

@x
In the following example, the `app` service connects to `app_net_1` first
as it has the highest priority. It then connects to `app_net_3`, then
`app_net_2`, which uses the default priority value of `0`.
@y
In the following example, the `app` service connects to `app_net_1` first
as it has the highest priority. It then connects to `app_net_3`, then
`app_net_2`, which uses the default priority value of `0`.
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  app:
    image: busybox
    command: top
    networks:
      app_net_1:
        priority: 1000
      app_net_2:
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  app:
    image: busybox
    command: top
    networks:
      app_net_1:
        priority: 1000
      app_net_2:
@z

@x
      app_net_3:
        priority: 100
networks:
  app_net_1:
  app_net_2:
  app_net_3:
```
@y
      app_net_3:
        priority: 100
networks:
  app_net_1:
  app_net_2:
  app_net_3:
```
@z

@x
> **Note**
>
> If multiple networks have the same priority, the connection order is undefined.
@y
> **Note**
>
> If multiple networks have the same priority, the connection order is undefined.
@z

@x
### pid
@y
### pid
@z

@x
```yaml
pid: "host"
```
```yaml
pid: "container:custom_container_1"
```
```yaml
pid: "service:foobar"
```
@y
```yaml
pid: "host"
```
```yaml
pid: "container:custom_container_1"
```
```yaml
pid: "service:foobar"
```
@z

@x
If set to one of the following forms: `container:<container_name>`,
`service:<service_name>`, the service shares the PID address space of the
designated container or service.
@y
If set to one of the following forms: `container:<container_name>`,
`service:<service_name>`, the service shares the PID address space of the
designated container or service.
@z

@x
If set to "host", the service's PID mode is the host PID mode.  This turns
on sharing between container and the host operating system the PID address
space. Containers launched with this flag can access and manipulate
other containers in the bare-metal machine's namespace and vice versa.
@y
If set to "host", the service's PID mode is the host PID mode.  This turns
on sharing between container and the host operating system the PID address
space. Containers launched with this flag can access and manipulate
other containers in the bare-metal machine's namespace and vice versa.
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
>
> The `service:` and `container:` forms require [version 2.1](compose-versioning.md#version-21) or above
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
>
> The `service:` and `container:` forms require [version 2.1](compose-versioning.md#version-21) or above
@z

@x
### pids_limit
@y
### pids_limit
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@z

@x
Tunes a container's PIDs limit. Set to `-1` for unlimited PIDs.
@y
Tunes a container's PIDs limit. Set to `-1` for unlimited PIDs.
@z

@x
```yaml
pids_limit: 10
```
@y
```yaml
pids_limit: 10
```
@z

@x
### platform
@y
### platform
@z

@x
> Added in [version 2.4](compose-versioning.md#version-24) file format.
@y
> Added in [version 2.4](compose-versioning.md#version-24) file format.
@z

@x
Target platform containers for this service will run on, using the
`os[/arch[/variant]]` syntax, e.g.
@y
Target platform containers for this service will run on, using the
`os[/arch[/variant]]` syntax, e.g.
@z

@x
```yaml
platform: osx
```
```yaml
platform: windows/amd64
```
```yaml
platform: linux/arm64/v8
```
@y
```yaml
platform: osx
```
```yaml
platform: windows/amd64
```
```yaml
platform: linux/arm64/v8
```
@z

@x
This parameter determines which version of the image will be pulled and/or
on which platform the service's build will be performed.
@y
This parameter determines which version of the image will be pulled and/or
on which platform the service's build will be performed.
@z

@x
### ports
@y
### ports
@z

@x
Expose ports. Either specify both ports (`HOST:CONTAINER`), or just the container
port (an ephemeral host port is chosen).
@y
Expose ports. Either specify both ports (`HOST:CONTAINER`), or just the container
port (an ephemeral host port is chosen).
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

@x
```yaml
ports:
  - "3000"
  - "3000-3005"
  - "8000:8000"
  - "9090-9091:8080-8081"
  - "49100:22"
  - "127.0.0.1:8001:8001"
  - "127.0.0.1:5000-5010:5000-5010"
  - "6060:6060/udp"
  - "12400-12500:1240"
```
@y
```yaml
ports:
  - "3000"
  - "3000-3005"
  - "8000:8000"
  - "9090-9091:8080-8081"
  - "49100:22"
  - "127.0.0.1:8001:8001"
  - "127.0.0.1:5000-5010:5000-5010"
  - "6060:6060/udp"
  - "12400-12500:1240"
```
@z

@x
### runtime
@y
### runtime
@z

@x
> Added in [version 2.3](compose-versioning.md#version-23) file format.
@y
> Added in [version 2.3](compose-versioning.md#version-23) file format.
@z

@x
Specify which runtime to use for the service's containers. Default runtime
and available runtimes are listed in the output of `docker info`.
@y
Specify which runtime to use for the service's containers. Default runtime
and available runtimes are listed in the output of `docker info`.
@z

@x
```yaml
web:
  image: busybox:latest
  command: true
  runtime: runc
```
@y
```yaml
web:
  image: busybox:latest
  command: true
  runtime: runc
```
@z

@x
### scale
@y
### scale
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format.
@y
> Added in [version 2.2](compose-versioning.md#version-22) file format.
@z

@x
Specify the default number of containers to deploy for this service. Whenever
you run `docker-compose up`, Compose creates or removes containers to match
the specified number. This value can be overridden using the
[`--scale`](../../reference/cli/docker/compose/up.md)
@y
Specify the default number of containers to deploy for this service. Whenever
you run `docker-compose up`, Compose creates or removes containers to match
the specified number. This value can be overridden using the
[`--scale`](../../reference/cli/docker/compose/up.md)
@z

@x
```yaml
web:
  image: busybox:latest
  command: echo 'scaled'
  scale: 3
```
@y
```yaml
web:
  image: busybox:latest
  command: echo 'scaled'
  scale: 3
```
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

@x
```yaml
security_opt:
  - label:user:USER
  - label:role:ROLE
```
@y
```yaml
security_opt:
  - label:user:USER
  - label:role:ROLE
```
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

@x
```yaml
stop_grace_period: 1s
```
@y
```yaml
stop_grace_period: 1s
```
@z

@x
```yaml
stop_grace_period: 1m30s
```
@y
```yaml
stop_grace_period: 1m30s
```
@z

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

@x
```yaml
stop_signal: SIGUSR1
```
@y
```yaml
stop_signal: SIGUSR1
```
@z

@x
### storage_opt
@y
### storage_opt
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@z

@x
Set storage driver options for this service.
@y
Set storage driver options for this service.
@z

@x
```yaml
storage_opt:
  size: '1G'
```
@y
```yaml
storage_opt:
  size: '1G'
```
@z

@x
### sysctls
@y
### sysctls
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@z

@x
Kernel parameters to set in the container. You can use either an array or a
dictionary.
@y
Kernel parameters to set in the container. You can use either an array or a
dictionary.
@z

@x
```yaml
sysctls:
  net.core.somaxconn: 1024
  net.ipv4.tcp_syncookies: 0
```
@y
```yaml
sysctls:
  net.core.somaxconn: 1024
  net.ipv4.tcp_syncookies: 0
```
@z

@x
```yaml
sysctls:
  - net.core.somaxconn=1024
  - net.ipv4.tcp_syncookies=0
```
@y
```yaml
sysctls:
  - net.core.somaxconn=1024
  - net.ipv4.tcp_syncookies=0
```
@z

@x
### tmpfs
@y
### tmpfs
@z

@x
Mount a temporary file system inside the container. Can be a single value or a list.
@y
Mount a temporary file system inside the container. Can be a single value or a list.
@z

@x
```yaml
tmpfs: /run
```
@y
```yaml
tmpfs: /run
```
@z

@x
```yaml
tmpfs:
  - /run
  - /tmp
```
@y
```yaml
tmpfs:
  - /run
  - /tmp
```
@z

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

@x
```yaml
ulimits:
  nproc: 65535
  nofile:
    soft: 20000
    hard: 40000
```
@y
```yaml
ulimits:
  nproc: 65535
  nofile:
    soft: 20000
    hard: 40000
```
@z

@x
### userns_mode
@y
### userns_mode
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@z

@x
```yaml
userns_mode: "host"
```
@y
```yaml
userns_mode: "host"
```
@z

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
### volumes
@y
### volumes
@z

@x
Mount host paths or named volumes. Named volumes need to be specified with the
[top-level `volumes` key](#volume-configuration-reference).
@y
Mount host paths or named volumes. Named volumes need to be specified with the
[top-level `volumes` key](#volume-configuration-reference).
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
> Added in [version 2.3](compose-versioning.md#version-23) file format.
@y
> Added in [version 2.3](compose-versioning.md#version-23) file format.
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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  web:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - type: volume
        source: mydata
        target: /data
        volume:
          nocopy: true
      - type: bind
        source: ./static
        target: /opt/app/static
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
services:
  web:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - type: volume
        source: mydata
        target: /data
        volume:
          nocopy: true
      - type: bind
        source: ./static
        target: /opt/app/static
@z

@x
networks:
  webnet:
@y
networks:
  webnet:
@z

@x
volumes:
  mydata:
```
@y
volumes:
  mydata:
```
@z

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
### volume\_driver
@y
### volume\_driver
@z

@x
Specify a default volume driver to be used for all declared volumes on this
service.
@y
Specify a default volume driver to be used for all declared volumes on this
service.
@z

@x
```yaml
volume_driver: mydriver
```
@y
```yaml
volume_driver: mydriver
```
@z

@x
> **Note**
>
> In [version 2 files](compose-versioning.md#version-2), this
> option only applies to anonymous volumes (those specified in the image,
> or specified under `volumes` without an explicit named volume or host path).
> To configure the driver for a named volume, use the `driver` key under the
> entry in the [top-level `volumes` option](#volume-configuration-reference).
@y
> **Note**
>
> In [version 2 files](compose-versioning.md#version-2), this
> option only applies to anonymous volumes (those specified in the image,
> or specified under `volumes` without an explicit named volume or host path).
> To configure the driver for a named volume, use the `driver` key under the
> entry in the [top-level `volumes` option](#volume-configuration-reference).
@z

@x
See [Docker Volumes](../../storage/volumes.md) and
[Volume Plugins](/engine/extend/plugins_volume/) for more information.
@y
See [Docker Volumes](../../storage/volumes.md) and
[Volume Plugins](__SUBDIR__/engine/extend/plugins_volume/) for more information.
@z

@x
### volumes_from
@y
### volumes_from
@z

@x
Mount all of the volumes from another service or container, optionally
specifying read-only access (``ro``) or read-write (``rw``). If no access level
is specified, then read-write is used.
@y
Mount all of the volumes from another service or container, optionally
specifying read-only access (``ro``) or read-write (``rw``). If no access level
is specified, then read-write is used.
@z

@x
```yaml
volumes_from:
  - service_name
  - service_name:ro
  - container:container_name
  - container:container_name:rw
```
@y
```yaml
volumes_from:
  - service_name
  - service_name:ro
  - container:container_name
  - container:container_name:rw
```
@z

@x
> Changed in [version 2](compose-versioning.md#version-2) file format.
@y
> Changed in [version 2](compose-versioning.md#version-2) file format.
@z

@x
### restart
@y
### restart
@z

@x
`no` is the default restart policy, and it doesn't restart a container under any circumstance. When `always` is specified, the container always restarts. The `on-failure` policy restarts a container if the exit code indicates an on-failure error.
@y
`no` is the default restart policy, and it doesn't restart a container under any circumstance. When `always` is specified, the container always restarts. The `on-failure` policy restarts a container if the exit code indicates an on-failure error.
@z

@x
```yaml
restart: "no"
```
```yaml
restart: "always"
```
```yaml
restart: "on-failure"
```
```yaml
restart: "unless-stopped"
```
@y
```yaml
restart: "no"
```
```yaml
restart: "always"
```
```yaml
restart: "on-failure"
```
```yaml
restart: "unless-stopped"
```
@z

@x
{ #cpu-and-other-resources }
@y
{ #cpu-and-other-resources }
@z

@x
### cpu_count, cpu_percent, cpu\_shares, cpu\_period, cpu\_quota, cpus, cpuset, domainname, hostname, ipc, mac\_address, mem\_limit, memswap\_limit, mem\_swappiness, mem\_reservation, oom_kill_disable, oom_score_adj, privileged, read\_only, shm\_size, stdin\_open, tty, user, working\_dir
@y
### cpu_count, cpu_percent, cpu\_shares, cpu\_period, cpu\_quota, cpus, cpuset, domainname, hostname, ipc, mac\_address, mem\_limit, memswap\_limit, mem\_swappiness, mem\_reservation, oom_kill_disable, oom_score_adj, privileged, read\_only, shm\_size, stdin\_open, tty, user, working\_dir
@z

@x
Each of these is a single value, analogous to its
[docker run](../../reference/cli/docker/container/run.md#runtime-constraints-on-resources) counterpart.
@y
Each of these is a single value, analogous to its
[docker run](../../reference/cli/docker/container/run.md#runtime-constraints-on-resources) counterpart.
@z

@x
> Added in [version 2.2](compose-versioning.md#version-22) file format.
>
> The `cpu_count`, `cpu_percent`, and `cpus` options were added in [version 2.2](compose-versioning.md#version-22).
@y
> Added in [version 2.2](compose-versioning.md#version-22) file format.
>
> The `cpu_count`, `cpu_percent`, and `cpus` options were added in [version 2.2](compose-versioning.md#version-22).
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
>
> The `oom_kill_disable` and `cpu_period` options were added in [version 2.1](compose-versioning.md#version-21).
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
>
> The `oom_kill_disable` and `cpu_period` options were added in [version 2.1](compose-versioning.md#version-21).
@z

@x
```yaml
cpu_count: 2
cpu_percent: 50
cpus: 0.5
cpu_shares: 73
cpu_quota: 50000
cpu_period: 20ms
cpuset: 0,1
@y
```yaml
cpu_count: 2
cpu_percent: 50
cpus: 0.5
cpu_shares: 73
cpu_quota: 50000
cpu_period: 20ms
cpuset: 0,1
@z

@x
user: postgresql
working_dir: /code
@y
user: postgresql
working_dir: /code
@z

@x
domainname: foo.com
hostname: foo
ipc: host
mac_address: 02:42:ac:11:65:43
@y
domainname: foo.com
hostname: foo
ipc: host
mac_address: 02:42:ac:11:65:43
@z

@x
mem_limit: 1000000000
memswap_limit: 2000000000
mem_reservation: 512m
privileged: true
@y
mem_limit: 1000000000
memswap_limit: 2000000000
mem_reservation: 512m
privileged: true
@z

@x
oom_score_adj: 500
oom_kill_disable: true
@y
oom_score_adj: 500
oom_kill_disable: true
@z

@x
read_only: true
shm_size: 64M
stdin_open: true
tty: true
```
@y
read_only: true
shm_size: 64M
stdin_open: true
tty: true
```
@z

@x
<a name="orig-resources"></a>
@y
<a name="orig-resources"></a>
@z

@x
## Specifying durations
@y
## Specifying durations
@z

@x
Some configuration options, such as the `interval` and `timeout` sub-options for
[`healthcheck`](#healthcheck), accept a duration as a string in a
format that looks like this:
@y
Some configuration options, such as the `interval` and `timeout` sub-options for
[`healthcheck`](#healthcheck), accept a duration as a string in a
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
Some configuration options, such as the `device_read_bps` sub-option for
[`blkio_config`](#blkio_config), accept a byte value as a string in a format
that looks like this:
@y
Some configuration options, such as the `device_read_bps` sub-option for
[`blkio_config`](#blkio_config), accept a byte value as a string in a format
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
See [use volumes](../../storage/volumes.md) and [volume plugins](/engine/extend/plugins_volume/)
for general information on volumes.
@y
See [use volumes](../../storage/volumes.md) and [volume plugins](__SUBDIR__/engine/extend/plugins_volume/)
for general information on volumes.
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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
@z

@x
services:
  db:
    image: db
    volumes:
      - data-volume:/var/lib/db
  backup:
    image: backup-service
    volumes:
      - data-volume:/var/lib/backup/data
@y
services:
  db:
    image: db
    volumes:
      - data-volume:/var/lib/db
  backup:
    image: backup-service
    volumes:
      - data-volume:/var/lib/backup/data
@z

@x
volumes:
  data-volume:
```
@y
volumes:
  data-volume:
```
@z

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

@x
```yaml
driver: foobar
```
@y
```yaml
driver: foobar
```
@z

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

@x
```yaml
volumes:
  example:
    driver_opts:
      type: "nfs"
      o: "addr=10.40.0.199,nolock,soft,rw"
      device: ":/docker/example"
```
@y
```yaml
volumes:
  example:
    driver_opts:
      type: "nfs"
      o: "addr=10.40.0.199,nolock,soft,rw"
      device: ":/docker/example"
```
@z

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
For version 2.0 of the format, `external` cannot be used in
conjunction with other volume configuration keys (`driver`, `driver_opts`,
`labels`). This limitation no longer exists for
[version 2.1](compose-versioning.md#version-21) and above.
@y
For version 2.0 of the format, `external` cannot be used in
conjunction with other volume configuration keys (`driver`, `driver_opts`,
`labels`). This limitation no longer exists for
[version 2.1](compose-versioning.md#version-21) and above.
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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
@z

@x
services:
  db:
    image: postgres
    volumes:
      - data:/var/lib/postgresql/data
@y
services:
  db:
    image: postgres
    volumes:
      - data:/var/lib/postgresql/data
@z

@x
volumes:
  data:
    external: true
```
@y
volumes:
  data:
    external: true
```
@z

@x
You can also specify the name of the volume separately from the name used to
refer to it within the Compose file:
@y
You can also specify the name of the volume separately from the name used to
refer to it within the Compose file:
@z

@x
```yaml
volumes:
  data:
    external:
      name: actual-name-of-volume
```
@y
```yaml
volumes:
  data:
    external:
      name: actual-name-of-volume
```
@z

@x
> Deprecated in [version 2.1](compose-versioning.md#version-21) file format.
>
> external.name was deprecated in version 2.1 file format use `name` instead.
{ .important }
@y
> Deprecated in [version 2.1](compose-versioning.md#version-21) file format.
>
> external.name was deprecated in version 2.1 file format use `name` instead.
{ .important }
@z

@x
### labels
@y
### labels
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
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

@x
```yaml
labels:
  com.example.description: "Database volume"
  com.example.department: "IT/Ops"
  com.example.label-with-empty-value: ""
```
@y
```yaml
labels:
  com.example.description: "Database volume"
  com.example.department: "IT/Ops"
  com.example.label-with-empty-value: ""
```
@z

@x
```yaml
labels:
  - "com.example.description=Database volume"
  - "com.example.department=IT/Ops"
  - "com.example.label-with-empty-value"
```
@y
```yaml
labels:
  - "com.example.description=Database volume"
  - "com.example.department=IT/Ops"
  - "com.example.label-with-empty-value"
```
@z

@x
### name
@y
### name
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
volumes:
  data:
    name: my-app-data
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
volumes:
  data:
    name: my-app-data
```
@z

@x
It can also be used in conjunction with the `external` property:
@y
It can also be used in conjunction with the `external` property:
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
volumes:
  data:
    external: true
    name: my-app-data
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
volumes:
  data:
    external: true
    name: my-app-data
```
@z

@x
## Network configuration reference
@y
## Network configuration reference
@z

@x
The top-level `networks` key lets you specify networks to be created. For a full
explanation of Compose's use of Docker networking features, see the
[Networking guide](../networking.md).
@y
The top-level `networks` key lets you specify networks to be created. For a full
explanation of Compose's use of Docker networking features, see the
[Networking guide](../networking.md).
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

@x
```yaml
driver: overlay
```
@y
```yaml
driver: overlay
```
@z

@x
> Changed in [version 2.1](compose-versioning.md#version-21) file format.
>
> Starting with Compose file format 2.1, overlay networks are always created as
> `attachable`, and this is not configurable. This means that standalone
> containers can connect to overlay networks.
@y
> Changed in [version 2.1](compose-versioning.md#version-21) file format.
>
> Starting with Compose file format 2.1, overlay networks are always created as
> `attachable`, and this is not configurable. This means that standalone
> containers can connect to overlay networks.
@z

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

@x
```yaml
driver_opts:
  foo: "bar"
  baz: 1
```
@y
```yaml
driver_opts:
  foo: "bar"
  baz: 1
```
@z

@x
### enable_ipv6
@y
### enable_ipv6
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@z

@x
Enable IPv6 networking on this network.
@y
Enable IPv6 networking on this network.
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
    - `ip_range`: Range of IPs from which to allocate container IPs
    - `gateway`: IPv4 or IPv6 gateway for the master subnet
    - `aux_addresses`: Auxiliary IPv4 or IPv6 addresses used by Network driver,
      as a mapping from hostname to IP
-   `options`: Driver-specific options as a key-value mapping.
@y
-   `driver`: Custom IPAM driver, instead of the default.
-   `config`: A list with zero or more config blocks, each containing any of
    the following keys:
    - `subnet`: Subnet in CIDR format that represents a network segment
    - `ip_range`: Range of IPs from which to allocate container IPs
    - `gateway`: IPv4 or IPv6 gateway for the master subnet
    - `aux_addresses`: Auxiliary IPv4 or IPv6 addresses used by Network driver,
      as a mapping from hostname to IP
-   `options`: Driver-specific options as a key-value mapping.
@z

@x
A full example:
@y
A full example:
@z

@x
```yaml
ipam:
  driver: default
  config:
    - subnet: 172.28.0.0/16
      ip_range: 172.28.5.0/24
      gateway: 172.28.5.254
      aux_addresses:
        host1: 172.28.1.5
        host2: 172.28.1.6
        host3: 172.28.1.7
  options:
    foo: bar
    baz: "0"
```
@y
```yaml
ipam:
  driver: default
  config:
    - subnet: 172.28.0.0/16
      ip_range: 172.28.5.0/24
      gateway: 172.28.5.254
      aux_addresses:
        host1: 172.28.1.5
        host2: 172.28.1.6
        host3: 172.28.1.7
  options:
    foo: bar
    baz: "0"
```
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
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
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

@x
```yaml
labels:
  com.example.description: "Financial transaction network"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@y
```yaml
labels:
  com.example.description: "Financial transaction network"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@z

@x
```yaml
labels:
  - "com.example.description=Financial transaction network"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@y
```yaml
labels:
  - "com.example.description=Financial transaction network"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@z

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
For version 2.0 of the format, `external` cannot be used in conjunction with
other network configuration keys (`driver`, `driver_opts`, `ipam`, `internal`).
This limitation no longer exists for
[version 2.1](compose-versioning.md#version-21) and above.
@y
For version 2.0 of the format, `external` cannot be used in conjunction with
other network configuration keys (`driver`, `driver_opts`, `ipam`, `internal`).
This limitation no longer exists for
[version 2.1](compose-versioning.md#version-21) and above.
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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
@z

@x
services:
  proxy:
    build: ./proxy
    networks:
      - outside
      - default
  app:
    build: ./app
    networks:
      - default
@y
services:
  proxy:
    build: ./proxy
    networks:
      - outside
      - default
  app:
    build: ./app
    networks:
      - default
@z

@x
networks:
  outside:
    external: true
```
@y
networks:
  outside:
    external: true
```
@z

@x
You can also specify the name of the network separately from the name used to
refer to it within the Compose file:
@y
You can also specify the name of the network separately from the name used to
refer to it within the Compose file:
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
networks:
  outside:
    external:
      name: actual-name-of-network
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
networks:
  outside:
    external:
      name: actual-name-of-network
```
@z

@x
Not supported for version 2 `docker-compose` files. Use
[network_mode](#network_mode) instead.
@y
Not supported for version 2 `docker-compose` files. Use
[network_mode](#network_mode) instead.
@z

@x
### name
@y
### name
@z

@x
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
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

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
networks:
  network1:
    name: my-app-net
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
networks:
  network1:
    name: my-app-net
```
@z

@x
It can also be used in conjunction with the `external` property:
@y
It can also be used in conjunction with the `external` property:
@z

@x
```yaml
version: "{{% param "compose_file_v2" %}}"
networks:
  network1:
    external: true
    name: my-app-net
```
@y
```yaml
version: "{{% param "compose_file_v2" %}}"
networks:
  network1:
    external: true
    name: my-app-net
```
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
> Added in [version 2.1](compose-versioning.md#version-21) file format.
@y
> Added in [version 2.1](compose-versioning.md#version-21) file format.
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
