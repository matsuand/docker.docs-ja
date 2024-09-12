%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Services top-level elements
description: Explore all the attributes the services top-level element can have.
keywords: compose, compose specification, services, compose file reference
@y
title: Services top-level elements
description: Explore all the attributes the services top-level element can have.
keywords: compose, compose specification, services, compose file reference
@z

@x
{{< include "compose/services.md" >}}
@y
{{< include "compose/services.md" >}}
@z

@x
A Compose file must declare a `services` top-level element as a map whose keys are string representations of service names,
and whose values are service definitions. A service  definition contains the configuration that is applied to each
service container.
@y
A Compose file must declare a `services` top-level element as a map whose keys are string representations of service names,
and whose values are service definitions. A service  definition contains the configuration that is applied to each
service container.
@z

@x
Each service may also include a `build` section, which defines how to create the Docker image for the service.
Compose supports building docker images using this service definition. If not used, the `build` section is ignored and the Compose file is still considered valid. Build support is an optional aspect of the Compose Specification, and is
described in detail in the [Compose Build Specification](build.md) documentation.
@y
Each service may also include a `build` section, which defines how to create the Docker image for the service.
Compose supports building docker images using this service definition. If not used, the `build` section is ignored and the Compose file is still considered valid. Build support is an optional aspect of the Compose Specification, and is
described in detail in the [Compose Build Specification](build.md) documentation.
@z

@x
Each service defines runtime constraints and requirements to run its containers. The `deploy` section groups
these constraints and allows the platform to adjust the deployment strategy to best match containers' needs with
available resources. Deploy support is an optional aspect of the Compose Specification, and is
described in detail in the [Compose Deploy Specification](deploy.md) documentation.
If not implemented the `deploy` section is ignored and the Compose file is still considered valid.
@y
Each service defines runtime constraints and requirements to run its containers. The `deploy` section groups
these constraints and allows the platform to adjust the deployment strategy to best match containers' needs with
available resources. Deploy support is an optional aspect of the Compose Specification, and is
described in detail in the [Compose Deploy Specification](deploy.md) documentation.
If not implemented the `deploy` section is ignored and the Compose file is still considered valid.
@z

@x
## Examples
@y
## Examples
@z

@x
### Simple example
@y
### Simple example
@z

@x
The following example demonstrates how to define two simple services, set their images, map ports, and configure basic environment variables using Docker Compose.
@y
The following example demonstrates how to define two simple services, set their images, map ports, and configure basic environment variables using Docker Compose.
@z

@x
```yaml
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
@y
```yaml
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
@z

@x
  db:
    image: postgres:13
    environment:
      POSTGRES_USER: example
      POSTGRES_DB: exampledb
```
@y
  db:
    image: postgres:13
    environment:
      POSTGRES_USER: example
      POSTGRES_DB: exampledb
```
@z

@x
### Advanced example 
@y
### Advanced example 
@z

@x
In the following example, the `proxy` service uses the Nginx image, mounts a local Nginx configuration file into the container, exposes port `80` and depends on the `backend` service. 
@y
In the following example, the `proxy` service uses the Nginx image, mounts a local Nginx configuration file into the container, exposes port `80` and depends on the `backend` service. 
@z

@x
The `backend` service builds an image from the Dockerfile located in the `backend` directory that is set to build at stage `builder`.
@y
The `backend` service builds an image from the Dockerfile located in the `backend` directory that is set to build at stage `builder`.
@z

@x
```yaml
services:
  proxy:
    image: nginx
    volumes:
      - type: bind
        source: ./proxy/nginx.conf
        target: /etc/nginx/conf.d/default.conf
        read_only: true
    ports:
      - 80:80
    depends_on:
      - backend
@y
```yaml
services:
  proxy:
    image: nginx
    volumes:
      - type: bind
        source: ./proxy/nginx.conf
        target: /etc/nginx/conf.d/default.conf
        read_only: true
    ports:
      - 80:80
    depends_on:
      - backend
@z

@x
  backend:
    build:
      context: backend
      target: builder
```
@y
  backend:
    build:
      context: backend
      target: builder
```
@z

@x
For more example Compose files, explore the [Awesome Compose samples](https://github.com/docker/awesome-compose).
@y
For more example Compose files, explore the [Awesome Compose samples](https://github.com/docker/awesome-compose).
@z

@x
## Attributes
@y
## Attributes
@z

@x
### annotations
@y
### annotations
@z

@x
`annotations` defines annotations for the container. `annotations` can use either an array or a map.
@y
`annotations` defines annotations for the container. `annotations` can use either an array or a map.
@z

@x
```yml
annotations:
  com.example.foo: bar
```
@y
```yml
annotations:
  com.example.foo: bar
```
@z

@x
```yml
annotations:
  - com.example.foo=bar
```
@y
```yml
annotations:
  - com.example.foo=bar
```
@z

@x
### attach
@y
### attach
@z

@x
{{< introduced compose 2.20.0 "/manuals/compose/release-notes.md#2200" >}}
@y
{{< introduced compose 2.20.0 "/manuals/compose/release-notes.md#2200" >}}
@z

@x
When `attach` is defined and set to `false` Compose does not collect service logs,
until you explicitly request it to.
@y
When `attach` is defined and set to `false` Compose does not collect service logs,
until you explicitly request it to.
@z

@x
The default service configuration is `attach: true`.
@y
The default service configuration is `attach: true`.
@z

@x
### build
@y
### build
@z

@x
`build` specifies the build configuration for creating a container image from source, as defined in the [Compose Build Specification](build.md).
@y
`build` specifies the build configuration for creating a container image from source, as defined in the [Compose Build Specification](build.md).
@z

@x
### blkio_config
@y
### blkio_config
@z

@x
`blkio_config` defines a set of configuration options to set block IO limits for a service.
@y
`blkio_config` defines a set of configuration options to set block IO limits for a service.
@z

@x
```yml
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
```
@y
```yml
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
```
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
- `path`: Defines the symbolic path to the affected device.
- `rate`: Either as an integer value representing the number of bytes or as a string expressing a byte value.
@y
- `path`: Defines the symbolic path to the affected device.
- `rate`: Either as an integer value representing the number of bytes or as a string expressing a byte value.
@z

@x
#### device_read_iops, device_write_iops
@y
#### device_read_iops, device_write_iops
@z

@x
Set a limit in operations per second for read / write operations on a given device.
Each item in the list must have two keys:
@y
Set a limit in operations per second for read / write operations on a given device.
Each item in the list must have two keys:
@z

@x
- `path`: Defines the symbolic path to the affected device.
- `rate`: As an integer value representing the permitted number of operations per second.
@y
- `path`: Defines the symbolic path to the affected device.
- `rate`: As an integer value representing the permitted number of operations per second.
@z

@x
#### weight
@y
#### weight
@z

@x
Modify the proportion of bandwidth allocated to a service relative to other services.
Takes an integer value between 10 and 1000, with 500 being the default.
@y
Modify the proportion of bandwidth allocated to a service relative to other services.
Takes an integer value between 10 and 1000, with 500 being the default.
@z

@x
#### weight_device
@y
#### weight_device
@z

@x
Fine-tune bandwidth allocation by device. Each item in the list must have two keys:
@y
Fine-tune bandwidth allocation by device. Each item in the list must have two keys:
@z

@x
- `path`: Defines the symbolic path to the affected device.
- `weight`: An integer value between 10 and 1000.
@y
- `path`: Defines the symbolic path to the affected device.
- `weight`: An integer value between 10 and 1000.
@z

@x
### cpu_count
@y
### cpu_count
@z

@x
`cpu_count` defines the number of usable CPUs for service container.
@y
`cpu_count` defines the number of usable CPUs for service container.
@z

@x
### cpu_percent
@y
### cpu_percent
@z

@x
`cpu_percent` defines the usable percentage of the available CPUs.
@y
`cpu_percent` defines the usable percentage of the available CPUs.
@z

@x
### cpu_shares
@y
### cpu_shares
@z

@x
`cpu_shares` defines, as integer value, a service container's relative CPU weight versus other containers.
@y
`cpu_shares` defines, as integer value, a service container's relative CPU weight versus other containers.
@z

@x
### cpu_period
@y
### cpu_period
@z

@x
`cpu_period` configures CPU CFS (Completely Fair Scheduler) period when a platform is based
on Linux kernel.
@y
`cpu_period` configures CPU CFS (Completely Fair Scheduler) period when a platform is based
on Linux kernel.
@z

@x
### cpu_quota
@y
### cpu_quota
@z

@x
`cpu_quota` configures CPU CFS (Completely Fair Scheduler) quota when a platform is based
on Linux kernel.
@y
`cpu_quota` configures CPU CFS (Completely Fair Scheduler) quota when a platform is based
on Linux kernel.
@z

@x
### cpu_rt_runtime
@y
### cpu_rt_runtime
@z

@x
`cpu_rt_runtime` configures CPU allocation parameters for platforms with support for realtime scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@y
`cpu_rt_runtime` configures CPU allocation parameters for platforms with support for realtime scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@z

@x
```yml
 cpu_rt_runtime: '400ms'
 cpu_rt_runtime: 95000`
```
@y
```yml
 cpu_rt_runtime: '400ms'
 cpu_rt_runtime: 95000`
```
@z

@x
### cpu_rt_period
@y
### cpu_rt_period
@z

@x
`cpu_rt_period` configures CPU allocation parameters for platforms with support for realtime scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@y
`cpu_rt_period` configures CPU allocation parameters for platforms with support for realtime scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@z

@x
```yml
 cpu_rt_period: '1400us'
 cpu_rt_period: 11000`
```
@y
```yml
 cpu_rt_period: '1400us'
 cpu_rt_period: 11000`
```
@z

@x
### cpus
@y
### cpus
@z

@x
`cpus` define the number of (potentially virtual) CPUs to allocate to service containers. This is a fractional number.
`0.000` means no limit.
@y
`cpus` define the number of (potentially virtual) CPUs to allocate to service containers. This is a fractional number.
`0.000` means no limit.
@z

@x
When set, `cpus` must be consistent with the `cpus` attribute in the [Deploy Specification](deploy.md#cpus).
@y
When set, `cpus` must be consistent with the `cpus` attribute in the [Deploy Specification](deploy.md#cpus).
@z

@x
### cpuset
@y
### cpuset
@z

@x
`cpuset` defines the explicit CPUs in which to allow execution. Can be a range `0-3` or a list `0,1`
@y
`cpuset` defines the explicit CPUs in which to allow execution. Can be a range `0-3` or a list `0,1`
@z

@x
### cap_add
@y
### cap_add
@z

@x
`cap_add` specifies additional container [capabilities](https://man7.org/linux/man-pages/man7/capabilities.7.html)
as strings.
@y
`cap_add` specifies additional container [capabilities](https://man7.org/linux/man-pages/man7/capabilities.7.html)
as strings.
@z

@x
```yaml
cap_add:
  - ALL
```
@y
```yaml
cap_add:
  - ALL
```
@z

@x
### cap_drop
@y
### cap_drop
@z

@x
`cap_drop` specifies container [capabilities](https://man7.org/linux/man-pages/man7/capabilities.7.html) to drop
as strings.
@y
`cap_drop` specifies container [capabilities](https://man7.org/linux/man-pages/man7/capabilities.7.html) to drop
as strings.
@z

@x
```yaml
cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
```
@y
```yaml
cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
```
@z

@x
### cgroup
@y
### cgroup
@z

@x
{{< introduced compose 2.15.0 "/manuals/compose/release-notes.md#2150" >}}
@y
{{< introduced compose 2.15.0 "/manuals/compose/release-notes.md#2150" >}}
@z

@x
`cgroup` specifies the cgroup namespace to join. When unset, it is the container runtime's decision to
select which cgroup namespace to use, if supported.
@y
`cgroup` specifies the cgroup namespace to join. When unset, it is the container runtime's decision to
select which cgroup namespace to use, if supported.
@z

@x
- `host`: Runs the container in the Container runtime cgroup namespace.
- `private`: Runs the container in its own private cgroup namespace.
@y
- `host`: Runs the container in the Container runtime cgroup namespace.
- `private`: Runs the container in its own private cgroup namespace.
@z

@x
### cgroup_parent
@y
### cgroup_parent
@z

@x
`cgroup_parent` specifies an optional parent [cgroup](https://man7.org/linux/man-pages/man7/cgroups.7.html) for the container.
@y
`cgroup_parent` specifies an optional parent [cgroup](https://man7.org/linux/man-pages/man7/cgroups.7.html) for the container.
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
`command` overrides the default command declared by the container image, for example by Dockerfile's `CMD`.
@y
`command` overrides the default command declared by the container image, for example by Dockerfile's `CMD`.
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
The value can also be a list, in a manner similar to [Dockerfile](https://docs.docker.com/reference/dockerfile/#cmd):
@y
The value can also be a list, in a manner similar to [Dockerfile](https://docs.docker.com/reference/dockerfile/#cmd):
@z

@x
```yaml
command: [ "bundle", "exec", "thin", "-p", "3000" ]
```
@y
```yaml
command: [ "bundle", "exec", "thin", "-p", "3000" ]
```
@z

@x
If the value is `null`, the default command from the image is used.
@y
If the value is `null`, the default command from the image is used.
@z

@x
If the value is `[]` (empty list) or `''` (empty string), the default command declared by the image is ignored,
i.e. overridden to be empty.
@y
If the value is `[]` (empty list) or `''` (empty string), the default command declared by the image is ignored,
i.e. overridden to be empty.
@z

@x
### configs
@y
### configs
@z

@x
Configs allow services to adapt their behaviour without the need to rebuild a Docker image. 
Services can only access configs when explicitly granted by the `configs` attribute. Two different syntax variants are supported.
@y
Configs allow services to adapt their behaviour without the need to rebuild a Docker image. 
Services can only access configs when explicitly granted by the `configs` attribute. Two different syntax variants are supported.
@z

@x
Compose reports an error if `config` doesn't exist on the platform or isn't defined in the
[`configs` top-level element](configs.md) in the Compose file.
@y
Compose reports an error if `config` doesn't exist on the platform or isn't defined in the
[`configs` top-level element](configs.md) in the Compose file.
@z

@x
There are two syntaxes defined for configs: a short syntax and a long syntax.
@y
There are two syntaxes defined for configs: a short syntax and a long syntax.
@z

@x
You can grant a service access to multiple configs, and you can mix long and short syntax.
@y
You can grant a service access to multiple configs, and you can mix long and short syntax.
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax variant only specifies the config name. This grants the
container access to the config and mounts it as files into a service’s container’s filesystem. The location of the mount point within the container defaults to `/<config_name>` in Linux containers, and `C:\<config-name>` in Windows containers. 
@y
The short syntax variant only specifies the config name. This grants the
container access to the config and mounts it as files into a service’s container’s filesystem. The location of the mount point within the container defaults to `/<config_name>` in Linux containers, and `C:\<config-name>` in Windows containers. 
@z

@x
The following example uses the short syntax to grant the `redis` service
access to the `my_config` and `my_other_config` configs. The value of
`my_config` is set to the contents of the file `./my_config.txt`, and
`my_other_config` is defined as an external resource, which means that it has
already been defined in the platform. If the external config does not exist,
the deployment fails.
@y
The following example uses the short syntax to grant the `redis` service
access to the `my_config` and `my_other_config` configs. The value of
`my_config` is set to the contents of the file `./my_config.txt`, and
`my_other_config` is defined as an external resource, which means that it has
already been defined in the platform. If the external config does not exist,
the deployment fails.
@z

@x
```yml
services:
  redis:
    image: redis:latest
    configs:
      - my_config
      - my_other_config
configs:
  my_config:
    file: ./my_config.txt
  my_other_config:
    external: true
```
@y
```yml
services:
  redis:
    image: redis:latest
    configs:
      - my_config
      - my_other_config
configs:
  my_config:
    file: ./my_config.txt
  my_other_config:
    external: true
```
@z

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long syntax provides more granularity in how the config is created within the service's task containers.
@y
The long syntax provides more granularity in how the config is created within the service's task containers.
@z

@x
- `source`: The name of the config as it exists in the platform.
- `target`: The path and name of the file to be mounted in the service's
  task containers. Defaults to `/<source>` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the mounted config file
  within the service's task containers. Default value when not specified is USER running container.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file that is mounted within the service's
  task containers, in octal notation. Default value is world-readable (`0444`).
  Writable bit must be ignored. The executable bit can be set.
@y
- `source`: The name of the config as it exists in the platform.
- `target`: The path and name of the file to be mounted in the service's
  task containers. Defaults to `/<source>` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the mounted config file
  within the service's task containers. Default value when not specified is USER running container.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file that is mounted within the service's
  task containers, in octal notation. Default value is world-readable (`0444`).
  Writable bit must be ignored. The executable bit can be set.
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

@x
```yml
services:
  redis:
    image: redis:latest
    configs:
      - source: my_config
        target: /redis_config
        uid: "103"
        gid: "103"
        mode: 0440
configs:
  my_config:
    external: true
  my_other_config:
    external: true
```
@y
```yml
services:
  redis:
    image: redis:latest
    configs:
      - source: my_config
        target: /redis_config
        uid: "103"
        gid: "103"
        mode: 0440
configs:
  my_config:
    external: true
  my_other_config:
    external: true
```
@z

@x
### container_name
@y
### container_name
@z

@x
`container_name` is a string that specifies a custom container name, rather than a name generated by default.
@y
`container_name` is a string that specifies a custom container name, rather than a name generated by default.
@z

@x
```yml
container_name: my-web-container
```
@y
```yml
container_name: my-web-container
```
@z

@x
Compose does not scale a service beyond one container if the Compose file specifies a
`container_name`. Attempting to do so results in an error.
@y
Compose does not scale a service beyond one container if the Compose file specifies a
`container_name`. Attempting to do so results in an error.
@z

@x
`container_name` follows the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`
@y
`container_name` follows the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`
@z

@x
### credential_spec
@y
### credential_spec
@z

@x
`credential_spec` configures the credential spec for a managed service account.
@y
`credential_spec` configures the credential spec for a managed service account.
@z

@x
If you have services that use Windows containers, you can use `file:` and
`registry:` protocols for `credential_spec`. Compose also supports additional
protocols for custom use-cases.
@y
If you have services that use Windows containers, you can use `file:` and
`registry:` protocols for `credential_spec`. Compose also supports additional
protocols for custom use-cases.
@z

@x
The `credential_spec` must be in the format `file://<filename>` or `registry://<value-name>`.
@y
The `credential_spec` must be in the format `file://<filename>` or `registry://<value-name>`.
@z

@x
```yml
credential_spec:
  file: my-credential-spec.json
```
@y
```yml
credential_spec:
  file: my-credential-spec.json
```
@z

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
The following example loads the credential spec from a value named `my-credential-spec`
in the registry:
@y
The following example loads the credential spec from a value named `my-credential-spec`
in the registry:
@z

@x
```yml
credential_spec:
  registry: my-credential-spec
```
@y
```yml
credential_spec:
  registry: my-credential-spec
```
@z

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

@x
```yml
services:
  myservice:
    image: myimage:latest
    credential_spec:
      config: my_credential_spec
@y
```yml
services:
  myservice:
    image: myimage:latest
    credential_spec:
      config: my_credential_spec
@z

@x
configs:
  my_credentials_spec:
    file: ./my-credential-spec.json|
```
@y
configs:
  my_credentials_spec:
    file: ./my-credential-spec.json|
```
@z

@x
### depends_on
@y
### depends_on
@z

@x
{{< include "compose/services-depends-on.md" >}}
@y
{{< include "compose/services-depends-on.md" >}}
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax variant only specifies service names of the dependencies.
Service dependencies cause the following behaviors:
@y
The short syntax variant only specifies service names of the dependencies.
Service dependencies cause the following behaviors:
@z

@x
- Compose creates services in dependency order. In the following
  example, `db` and `redis` are created before `web`.
@y
- Compose creates services in dependency order. In the following
  example, `db` and `redis` are created before `web`.
@z

@x
- Compose removes services in dependency order. In the following
  example, `web` is removed before `db` and `redis`.
@y
- Compose removes services in dependency order. In the following
  example, `web` is removed before `db` and `redis`.
@z

@x
Simple example:
@y
Simple example:
@z

@x
```yml
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
```yml
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
Compose guarantees dependency services have been started before
starting a dependent service.
Compose waits for dependency services to be "ready" before
starting a dependent service.
@y
Compose guarantees dependency services have been started before
starting a dependent service.
Compose waits for dependency services to be "ready" before
starting a dependent service.
@z

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long form syntax enables the configuration of additional fields that can't be
expressed in the short form.
@y
The long form syntax enables the configuration of additional fields that can't be
expressed in the short form.
@z

@x
- `restart`: When set to `true` Compose restarts this service after it updates the dependency service.
  This applies to an explicit restart controlled by a Compose operation, and excludes automated restart by the container runtime
  after the container dies. Introduced in Docker Compose version [2.17.0](/manuals/compose/release-notes.md#2170).
@y
- `restart`: When set to `true` Compose restarts this service after it updates the dependency service.
  This applies to an explicit restart controlled by a Compose operation, and excludes automated restart by the container runtime
  after the container dies. Introduced in Docker Compose version [2.17.0](manuals/compose/release-notes.md#2170).
@z

@x
- `condition`: Sets the condition under which dependency is considered satisfied
  - `service_started`: An equivalent of the short syntax described above
  - `service_healthy`: Specifies that a dependency is expected to be "healthy"
    (as indicated by [healthcheck](#healthcheck)) before starting a dependent
    service.
  - `service_completed_successfully`: Specifies that a dependency is expected to run
    to successful completion before starting a dependent service.
- `required`: When set to `false` Compose only warns you when the dependency service isn't started or available. If it's not defined
    the default value of `required` is `true`. Introduced in Docker Compose version [2.20.0](/manuals/compose/release-notes.md#2200).
@y
- `condition`: Sets the condition under which dependency is considered satisfied
  - `service_started`: An equivalent of the short syntax described above
  - `service_healthy`: Specifies that a dependency is expected to be "healthy"
    (as indicated by [healthcheck](#healthcheck)) before starting a dependent
    service.
  - `service_completed_successfully`: Specifies that a dependency is expected to run
    to successful completion before starting a dependent service.
- `required`: When set to `false` Compose only warns you when the dependency service isn't started or available. If it's not defined
    the default value of `required` is `true`. Introduced in Docker Compose version [2.20.0](manuals/compose/release-notes.md#2200).
@z

@x
Service dependencies cause the following behaviors:
@y
Service dependencies cause the following behaviors:
@z

@x
- Compose creates services in dependency order. In the following
  example, `db` and `redis` are created before `web`.
@y
- Compose creates services in dependency order. In the following
  example, `db` and `redis` are created before `web`.
@z

@x
- Compose waits for healthchecks to pass on dependencies
  marked with `service_healthy`. In the following example, `db` is expected to
  be "healthy" before `web` is created.
@y
- Compose waits for healthchecks to pass on dependencies
  marked with `service_healthy`. In the following example, `db` is expected to
  be "healthy" before `web` is created.
@z

@x
- Compose removes services in dependency order. In the following
  example, `web` is removed before `db` and `redis`.
@y
- Compose removes services in dependency order. In the following
  example, `web` is removed before `db` and `redis`.
@z

@x
```yml
services:
  web:
    build: .
    depends_on:
      db:
        condition: service_healthy
        restart: true
      redis:
        condition: service_started
  redis:
    image: redis
  db:
    image: postgres
```
@y
```yml
services:
  web:
    build: .
    depends_on:
      db:
        condition: service_healthy
        restart: true
      redis:
        condition: service_started
  redis:
    image: redis
  db:
    image: postgres
```
@z

@x
Compose guarantees dependency services are started before
starting a dependent service.
Compose guarantees dependency services marked with
`service_healthy` are "healthy" before starting a dependent service.
@y
Compose guarantees dependency services are started before
starting a dependent service.
Compose guarantees dependency services marked with
`service_healthy` are "healthy" before starting a dependent service.
@z

@x
### deploy
@y
### deploy
@z

@x
`deploy` specifies the configuration for the deployment and lifecycle of services, as defined [in the Compose Deploy Specification](deploy.md).
@y
`deploy` specifies the configuration for the deployment and lifecycle of services, as defined [in the Compose Deploy Specification](deploy.md).
@z

@x
### develop
@y
### develop
@z

@x
{{< introduced compose 2.22.0 "/manuals/compose/release-notes.md#2220" >}}
@y
{{< introduced compose 2.22.0 "/manuals/compose/release-notes.md#2220" >}}
@z

@x
`develop` specifies the development configuration for maintaining a container in sync with source, as defined in the [Development Section](develop.md).
@y
`develop` specifies the development configuration for maintaining a container in sync with source, as defined in the [Development Section](develop.md).
@z

@x
### device_cgroup_rules
@y
### device_cgroup_rules
@z

@x
`device_cgroup_rules` defines a list of device cgroup rules for this container.
The format is the same format the Linux kernel specifies in the [Control Groups
Device Whitelist Controller](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v1/devices.html).
@y
`device_cgroup_rules` defines a list of device cgroup rules for this container.
The format is the same format the Linux kernel specifies in the [Control Groups
Device Whitelist Controller](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v1/devices.html).
@z

@x
```yml
device_cgroup_rules:
  - 'c 1:3 mr'
  - 'a 7:* rmw'
```
@y
```yml
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
`devices` defines a list of device mappings for created containers in the form of
`HOST_PATH:CONTAINER_PATH[:CGROUP_PERMISSIONS]`.
@y
`devices` defines a list of device mappings for created containers in the form of
`HOST_PATH:CONTAINER_PATH[:CGROUP_PERMISSIONS]`.
@z

@x
```yml
devices:
  - "/dev/ttyUSB0:/dev/ttyUSB0"
  - "/dev/sda:/dev/xvda:rwm"
```
@y
```yml
devices:
  - "/dev/ttyUSB0:/dev/ttyUSB0"
  - "/dev/sda:/dev/xvda:rwm"
```
@z

@x
### dns
@y
### dns
@z

@x
`dns` defines custom DNS servers to set on the container network interface configuration. It can be a single value or a list.
@y
`dns` defines custom DNS servers to set on the container network interface configuration. It can be a single value or a list.
@z

@x
```yml
dns: 8.8.8.8
```
@y
```yml
dns: 8.8.8.8
```
@z

@x
```yml
dns:
  - 8.8.8.8
  - 9.9.9.9
```
@y
```yml
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
`dns_opt` list custom DNS options to be passed to the container’s DNS resolver (`/etc/resolv.conf` file on Linux).
@y
`dns_opt` list custom DNS options to be passed to the container’s DNS resolver (`/etc/resolv.conf` file on Linux).
@z

@x
```yml
dns_opt:
  - use-vc
  - no-tld-query
```
@y
```yml
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
`dns_search` defines custom DNS search domains to set on container network interface configuration. It can be a single value or a list.
@y
`dns_search` defines custom DNS search domains to set on container network interface configuration. It can be a single value or a list.
@z

@x
```yml
dns_search: example.com
```
@y
```yml
dns_search: example.com
```
@z

@x
```yml
dns_search:
  - dc1.example.com
  - dc2.example.com
```
@y
```yml
dns_search:
  - dc1.example.com
  - dc2.example.com
```
@z

@x
### domainname
@y
### domainname
@z

@x
`domainname` declares a custom domain name to use for the service container. It must be a valid RFC 1123 hostname.
@y
`domainname` declares a custom domain name to use for the service container. It must be a valid RFC 1123 hostname.
@z

@x
### driver_opts
@y
### driver_opts
@z

@x
{{< introduced compose 2.27.1 "/manuals/compose/release-notes.md#2271" >}}
@y
{{< introduced compose 2.27.1 "/manuals/compose/release-notes.md#2271" >}}
@z

@x
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent.
@y
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent.
@z

@x
```yml
services:
  app:
    networks:
      app_net:
        driver_opts:
          com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
```
@y
```yml
services:
  app:
    networks:
      app_net:
        driver_opts:
          com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
```
@z

@x
Consult the [network drivers documentation](/manuals/engine/network/_index.md) for more information.
@y
Consult the [network drivers documentation](manuals/engine/network/_index.md) for more information.
@z

@x
### entrypoint
@y
### entrypoint
@z

@x
`entrypoint` declares the default entrypoint for the service container.
This overrides the `ENTRYPOINT` instruction from the service's Dockerfile.
@y
`entrypoint` declares the default entrypoint for the service container.
This overrides the `ENTRYPOINT` instruction from the service's Dockerfile.
@z

@x
If `entrypoint` is non-null, Compose ignores any default command from the image, for example the `CMD`
instruction in the Dockerfile.
@y
If `entrypoint` is non-null, Compose ignores any default command from the image, for example the `CMD`
instruction in the Dockerfile.
@z

@x
See also [`command`](#command) to set or override the default command to be executed by the entrypoint process.
@y
See also [`command`](#command) to set or override the default command to be executed by the entrypoint process.
@z

@x
In its short form, the value can be defined as a string:
```yml
entrypoint: /code/entrypoint.sh
```
@y
In its short form, the value can be defined as a string:
```yml
entrypoint: /code/entrypoint.sh
```
@z

@x
Alternatively, the value can also be a list, in a manner similar to the
[Dockerfile](https://docs.docker.com/reference/dockerfile/#cmd):
@y
Alternatively, the value can also be a list, in a manner similar to the
[Dockerfile](https://docs.docker.com/reference/dockerfile/#cmd):
@z

@x
```yml
entrypoint:
  - php
  - -d
  - zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20100525/xdebug.so
  - -d
  - memory_limit=-1
  - vendor/bin/phpunit
```
@y
```yml
entrypoint:
  - php
  - -d
  - zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20100525/xdebug.so
  - -d
  - memory_limit=-1
  - vendor/bin/phpunit
```
@z

@x
If the value is `null`, the default entrypoint from the image is used.
@y
If the value is `null`, the default entrypoint from the image is used.
@z

@x
If the value is `[]` (empty list) or `''` (empty string), the default entrypoint declared by the image is ignored,
i.e. overridden to be empty.
@y
If the value is `[]` (empty list) or `''` (empty string), the default entrypoint declared by the image is ignored,
i.e. overridden to be empty.
@z

@x
### env_file
@y
### env_file
@z

@x
{{< include "compose/services-env-file.md" >}} 
@y
{{< include "compose/services-env-file.md" >}} 
@z

@x
```yml
env_file: .env
```
@y
```yml
env_file: .env
```
@z

@x
`env_file` can also be a list. The files in the list are processed from the top down. For the same variable
specified in two env files, the value from the last file in the list stands.
@y
`env_file` can also be a list. The files in the list are processed from the top down. For the same variable
specified in two env files, the value from the last file in the list stands.
@z

@x
```yml
env_file:
  - ./a.env
  - ./b.env
```
@y
```yml
env_file:
  - ./a.env
  - ./b.env
```
@z

@x
List elements can also be declared as a mapping, which then lets you set an additional
attribute `required`. This defaults to `true`. When `required` is set to `false` and the `.env` file is missing,
Compose silently ignores the entry.
@y
List elements can also be declared as a mapping, which then lets you set an additional
attribute `required`. This defaults to `true`. When `required` is set to `false` and the `.env` file is missing,
Compose silently ignores the entry.
@z

@x
```yml
env_file:
  - path: ./default.env
    required: true # default
  - path: ./override.env
    required: false
```
> `required` attribute is available with Docker Compose version 2.24.0 or later.
@y
```yml
env_file:
  - path: ./default.env
    required: true # default
  - path: ./override.env
    required: false
```
> `required` attribute is available with Docker Compose version 2.24.0 or later.
@z

@x
Relative path are resolved from the Compose file's parent folder. As absolute paths prevent the Compose
file from being portable, Compose warns you when such a path is used to set `env_file`.
@y
Relative path are resolved from the Compose file's parent folder. As absolute paths prevent the Compose
file from being portable, Compose warns you when such a path is used to set `env_file`.
@z

@x
Environment variables declared in the [environment](#environment) section override these values. This holds true even if those values are
empty or undefined.
@y
Environment variables declared in the [environment](#environment) section override these values. This holds true even if those values are
empty or undefined.
@z

@x
#### Env_file format
@y
#### Env_file format
@z

@x
Each line in an `.env` file must be in `VAR[=[VAL]]` format. The following syntax rules apply:
@y
Each line in an `.env` file must be in `VAR[=[VAL]]` format. The following syntax rules apply:
@z

@x
- Lines beginning with `#` are processed as comments and ignored.
- Blank lines are ignored.
- Unquoted and double-quoted (`"`) values have [Interpolation](interpolation.md) applied.
- Each line represents a key-value pair. Values can optionally be quoted.
  - `VAR=VAL` -> `VAL`
  - `VAR="VAL"` -> `VAL`
  - `VAR='VAL'` -> `VAL`
- Inline comments for unquoted values must be preceded with a space.
  - `VAR=VAL # comment` -> `VAL`
  - `VAR=VAL# not a comment` -> `VAL# not a comment`
- Inline comments for quoted values must follow the closing quote.
  - `VAR="VAL # not a comment"` -> `VAL # not a comment`
  - `VAR="VAL" # comment` -> `VAL`
- Single-quoted (`'`) values are used literally.
  - `VAR='$OTHER'` -> `$OTHER`
  - `VAR='${OTHER}'` -> `${OTHER}`
- Quotes can be escaped with `\`.
  - `VAR='Let\'s go!'` -> `Let's go!`
  - `VAR="{\"hello\": \"json\"}"` -> `{"hello": "json"}`
- Common shell escape sequences including `\n`, `\r`, `\t`, and `\\` are supported in double-quoted values.
  - `VAR="some\tvalue"` -> `some  value`
  - `VAR='some\tvalue'` -> `some\tvalue`
  - `VAR=some\tvalue` -> `some\tvalue`
@y
- Lines beginning with `#` are processed as comments and ignored.
- Blank lines are ignored.
- Unquoted and double-quoted (`"`) values have [Interpolation](interpolation.md) applied.
- Each line represents a key-value pair. Values can optionally be quoted.
  - `VAR=VAL` -> `VAL`
  - `VAR="VAL"` -> `VAL`
  - `VAR='VAL'` -> `VAL`
- Inline comments for unquoted values must be preceded with a space.
  - `VAR=VAL # comment` -> `VAL`
  - `VAR=VAL# not a comment` -> `VAL# not a comment`
- Inline comments for quoted values must follow the closing quote.
  - `VAR="VAL # not a comment"` -> `VAL # not a comment`
  - `VAR="VAL" # comment` -> `VAL`
- Single-quoted (`'`) values are used literally.
  - `VAR='$OTHER'` -> `$OTHER`
  - `VAR='${OTHER}'` -> `${OTHER}`
- Quotes can be escaped with `\`.
  - `VAR='Let\'s go!'` -> `Let's go!`
  - `VAR="{\"hello\": \"json\"}"` -> `{"hello": "json"}`
- Common shell escape sequences including `\n`, `\r`, `\t`, and `\\` are supported in double-quoted values.
  - `VAR="some\tvalue"` -> `some  value`
  - `VAR='some\tvalue'` -> `some\tvalue`
  - `VAR=some\tvalue` -> `some\tvalue`
@z

@x
`VAL` may be omitted, in such cases the variable value is an empty string.
`=VAL` may be omitted, in such cases the variable is unset.
@y
`VAL` may be omitted, in such cases the variable value is an empty string.
`=VAL` may be omitted, in such cases the variable is unset.
@z

@x
```bash
# Set Rails/Rack environment
RACK_ENV=development
VAR="quoted"
```
@y
```bash
# Set Rails/Rack environment
RACK_ENV=development
VAR="quoted"
```
@z

@x
### environment
@y
### environment
@z

@x
{{< include "compose/services-environment.md" >}}
@y
{{< include "compose/services-environment.md" >}}
@z

@x
Environment variables can be declared by a single key (no value to equals sign). In this case Compose
relies on you to resolve the value. If the value is not resolved, the variable
is unset and is removed from the service container environment.
@y
Environment variables can be declared by a single key (no value to equals sign). In this case Compose
relies on you to resolve the value. If the value is not resolved, the variable
is unset and is removed from the service container environment.
@z

@x
Map syntax:
@y
Map syntax:
@z

@x
```yml
environment:
  RACK_ENV: development
  SHOW: "true"
  USER_INPUT:
```
@y
```yml
environment:
  RACK_ENV: development
  SHOW: "true"
  USER_INPUT:
```
@z

@x
Array syntax:
@y
Array syntax:
@z

@x
```yml
environment:
  - RACK_ENV=development
  - SHOW=true
  - USER_INPUT
```
@y
```yml
environment:
  - RACK_ENV=development
  - SHOW=true
  - USER_INPUT
```
@z

@x
When both `env_file` and `environment` are set for a service, values set by `environment` have precedence.
@y
When both `env_file` and `environment` are set for a service, values set by `environment` have precedence.
@z

@x
### expose
@y
### expose
@z

@x
`expose` defines the (incoming) port or a range of ports that Compose exposes from the container. These ports must be
accessible to linked services and should not be published to the host machine. Only the internal container
ports can be specified.
@y
`expose` defines the (incoming) port or a range of ports that Compose exposes from the container. These ports must be
accessible to linked services and should not be published to the host machine. Only the internal container
ports can be specified.
@z

@x
Syntax is `<portnum>/[<proto>]` or `<startport-endport>/[<proto>]` for a port range.
When not explicitly set, `tcp` protocol is used.
@y
Syntax is `<portnum>/[<proto>]` or `<startport-endport>/[<proto>]` for a port range.
When not explicitly set, `tcp` protocol is used.
@z

@x
```yml
expose:
  - "3000"
  - "8000"
  - "8080-8085/tcp"
```
@y
```yml
expose:
  - "3000"
  - "8000"
  - "8080-8085/tcp"
```
@z

@x
> [!NOTE]
>
> If the Dockerfile for the image already exposes ports, it is visible to other containers on the network even if `expose` is not set in your Compose file. 
@y
> [!NOTE]
>
> If the Dockerfile for the image already exposes ports, it is visible to other containers on the network even if `expose` is not set in your Compose file. 
@z

@x
### extends
@y
### extends
@z

@x
`extends` lets you share common configurations among different files, or even different projects entirely. With `extends` you can define a common set of service options in one place and refer to it from anywhere. You can refer to another Compose file and select a service you want to also use in your own application, with the ability to override some attributes for your own needs.
@y
`extends` lets you share common configurations among different files, or even different projects entirely. With `extends` you can define a common set of service options in one place and refer to it from anywhere. You can refer to another Compose file and select a service you want to also use in your own application, with the ability to override some attributes for your own needs.
@z

@x
You can use `extends` on any service together with other configuration keys. The `extends` value must be a mapping
defined with a required `service` and an optional `file` key.
@y
You can use `extends` on any service together with other configuration keys. The `extends` value must be a mapping
defined with a required `service` and an optional `file` key.
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
- `service`: Defines the name of the service being referenced as a base, for example `web` or `database`.
- `file`: The location of a Compose configuration file defining that service.
@y
- `service`: Defines the name of the service being referenced as a base, for example `web` or `database`.
- `file`: The location of a Compose configuration file defining that service.
@z

@x
When a service uses `extends`, it can also specify dependencies on other resources, an explicit `volumes` declaration for instance. However, it's important to note that `extends` does not automatically incorporate the target volume definition into the extending Compose file. Instead, you are responsible for ensuring that an equivalent resource exists for the service being extended to maintain consistency. Docker Compose verifies that a resource with the referenced ID is present within the Compose model.
@y
When a service uses `extends`, it can also specify dependencies on other resources, an explicit `volumes` declaration for instance. However, it's important to note that `extends` does not automatically incorporate the target volume definition into the extending Compose file. Instead, you are responsible for ensuring that an equivalent resource exists for the service being extended to maintain consistency. Docker Compose verifies that a resource with the referenced ID is present within the Compose model.
@z

@x
Dependencies on other resources in an `extends` target can be:
- An explicit reference by `volumes`, `networks`, `configs`, `secrets`, `links`, `volumes_from` or `depends_on`
- A reference to another service using the `service:{name}` syntax in namespace declaration (`ipc`, `pid`, `network_mode`)
@y
Dependencies on other resources in an `extends` target can be:
- An explicit reference by `volumes`, `networks`, `configs`, `secrets`, `links`, `volumes_from` or `depends_on`
- A reference to another service using the `service:{name}` syntax in namespace declaration (`ipc`, `pid`, `network_mode`)
@z

@x
Circular references with `extends` are not supported, Compose returns an error when one is detected.
@y
Circular references with `extends` are not supported, Compose returns an error when one is detected.
@z

@x
#### Finding referenced service
@y
#### Finding referenced service
@z

@x
`file` value can be:
@y
`file` value can be:
@z

@x
- Not present.
  This indicates that another service within the same Compose file is being referenced.
- File path, which can be either:
  - Relative path. This path is considered as relative to the location of the main Compose
    file.
  - Absolute path.
@y
- Not present.
  This indicates that another service within the same Compose file is being referenced.
- File path, which can be either:
  - Relative path. This path is considered as relative to the location of the main Compose
    file.
  - Absolute path.
@z

@x
A service denoted by `service` must be present in the identified referenced Compose file.
Compose returns an error if:
@y
A service denoted by `service` must be present in the identified referenced Compose file.
Compose returns an error if:
@z

@x
- The service denoted by `service` is not found.
- The Compose file denoted by `file` is not found.
@y
- The service denoted by `service` is not found.
- The Compose file denoted by `file` is not found.
@z

@x
#### Merging service definitions
@y
#### Merging service definitions
@z

@x
Two service definitions, the main one in the current Compose file and the referenced one
specified by `extends`, are merged in the following way:
@y
Two service definitions, the main one in the current Compose file and the referenced one
specified by `extends`, are merged in the following way:
@z

@x
- Mappings: Keys in mappings of the main service definition override keys in mappings
  of the referenced service definition. Keys that aren't overridden are included as is.
- Sequences: Items are combined together into a new sequence. The order of elements is
  preserved with the referenced items coming first and main items after.
- Scalars: Keys in the main service definition take precedence over keys in the
  referenced one.
@y
- Mappings: Keys in mappings of the main service definition override keys in mappings
  of the referenced service definition. Keys that aren't overridden are included as is.
- Sequences: Items are combined together into a new sequence. The order of elements is
  preserved with the referenced items coming first and main items after.
- Scalars: Keys in the main service definition take precedence over keys in the
  referenced one.
@z

@x
##### Mappings
@y
##### Mappings
@z

@x
The following keys should be treated as mappings: `annotations`, `build.args`, `build.labels`,
`build.extra_hosts`, `deploy.labels`, `deploy.update_config`, `deploy.rollback_config`,
`deploy.restart_policy`, `deploy.resources.limits`, `environment`, `healthcheck`,
`labels`, `logging.options`, `sysctls`, `storage_opt`, `extra_hosts`, `ulimits`.
@y
The following keys should be treated as mappings: `annotations`, `build.args`, `build.labels`,
`build.extra_hosts`, `deploy.labels`, `deploy.update_config`, `deploy.rollback_config`,
`deploy.restart_policy`, `deploy.resources.limits`, `environment`, `healthcheck`,
`labels`, `logging.options`, `sysctls`, `storage_opt`, `extra_hosts`, `ulimits`.
@z

@x
One exception that applies to `healthcheck` is that the main mapping cannot specify
`disable: true` unless the  referenced mapping also specifies `disable: true`. Compose returns an error in this case.
@y
One exception that applies to `healthcheck` is that the main mapping cannot specify
`disable: true` unless the  referenced mapping also specifies `disable: true`. Compose returns an error in this case.
@z

@x
For example, the input below:
@y
For example, the input below:
@z

@x
```yaml
services:
  common:
    image: busybox
    environment:
      TZ: utc
      PORT: 80
  cli:
    extends:
      service: common
    environment:
      PORT: 8080
```
@y
```yaml
services:
  common:
    image: busybox
    environment:
      TZ: utc
      PORT: 80
  cli:
    extends:
      service: common
    environment:
      PORT: 8080
```
@z

@x
Produces the following configuration for the `cli` service. The same output is
produced if array syntax is used.
@y
Produces the following configuration for the `cli` service. The same output is
produced if array syntax is used.
@z

@x
```yaml
environment:
  PORT: 8080
  TZ: utc
image: busybox
```
@y
```yaml
environment:
  PORT: 8080
  TZ: utc
image: busybox
```
@z

@x
Items under `blkio_config.device_read_bps`, `blkio_config.device_read_iops`,
`blkio_config.device_write_bps`, `blkio_config.device_write_iops`, `devices` and
`volumes` are also treated as mappings where key is the target path inside the
container.
@y
Items under `blkio_config.device_read_bps`, `blkio_config.device_read_iops`,
`blkio_config.device_write_bps`, `blkio_config.device_write_iops`, `devices` and
`volumes` are also treated as mappings where key is the target path inside the
container.
@z

@x
For example, the input below:
@y
For example, the input below:
@z

@x
```yaml
services:
  common:
    image: busybox
    volumes:
      - common-volume:/var/lib/backup/data:rw
  cli:
    extends:
      service: common
    volumes:
      - cli-volume:/var/lib/backup/data:ro
```
@y
```yaml
services:
  common:
    image: busybox
    volumes:
      - common-volume:/var/lib/backup/data:rw
  cli:
    extends:
      service: common
    volumes:
      - cli-volume:/var/lib/backup/data:ro
```
@z

@x
Produces the following configuration for the `cli` service. Note that the mounted path
now points to the new volume name and `ro` flag was applied.
@y
Produces the following configuration for the `cli` service. Note that the mounted path
now points to the new volume name and `ro` flag was applied.
@z

@x
```yaml
image: busybox
volumes:
- cli-volume:/var/lib/backup/data:ro
```
@y
```yaml
image: busybox
volumes:
- cli-volume:/var/lib/backup/data:ro
```
@z

@x
If the referenced service definition contains `extends` mapping, the items under it
are simply copied into the new merged definition. The merging process is then kicked
off again until no `extends` keys are remaining.
@y
If the referenced service definition contains `extends` mapping, the items under it
are simply copied into the new merged definition. The merging process is then kicked
off again until no `extends` keys are remaining.
@z

@x
For example, the input below:
@y
For example, the input below:
@z

@x
```yaml
services:
  base:
    image: busybox
    user: root
  common:
    image: busybox
    extends:
      service: base
  cli:
    extends:
      service: common
```
@y
```yaml
services:
  base:
    image: busybox
    user: root
  common:
    image: busybox
    extends:
      service: base
  cli:
    extends:
      service: common
```
@z

@x
Produces the following configuration for the `cli` service. Here, `cli` services
gets `user` key from `common` service, which in turn gets this key from `base`
service.
@y
Produces the following configuration for the `cli` service. Here, `cli` services
gets `user` key from `common` service, which in turn gets this key from `base`
service.
@z

@x
```yaml
image: busybox
user: root
```
@y
```yaml
image: busybox
user: root
```
@z

@x
##### Sequences
@y
##### Sequences
@z

@x
The following keys should be treated as sequences: `cap_add`, `cap_drop`, `configs`,
`deploy.placement.constraints`, `deploy.placement.preferences`,
`deploy.reservations.generic_resources`, `device_cgroup_rules`, `expose`,
`external_links`, `ports`, `secrets`, `security_opt`.
Any duplicates resulting from the merge are removed so that the sequence only
contains unique elements.
@y
The following keys should be treated as sequences: `cap_add`, `cap_drop`, `configs`,
`deploy.placement.constraints`, `deploy.placement.preferences`,
`deploy.reservations.generic_resources`, `device_cgroup_rules`, `expose`,
`external_links`, `ports`, `secrets`, `security_opt`.
Any duplicates resulting from the merge are removed so that the sequence only
contains unique elements.
@z

@x
For example, the input below:
@y
For example, the input below:
@z

@x
```yaml
services:
  common:
    image: busybox
    security_opt:
      - label:role:ROLE
  cli:
    extends:
      service: common
    security_opt:
      - label:user:USER
```
@y
```yaml
services:
  common:
    image: busybox
    security_opt:
      - label:role:ROLE
  cli:
    extends:
      service: common
    security_opt:
      - label:user:USER
```
@z

@x
Produces the following configuration for the `cli` service.
@y
Produces the following configuration for the `cli` service.
@z

@x
```yaml
image: busybox
security_opt:
- label:role:ROLE
- label:user:USER
```
@y
```yaml
image: busybox
security_opt:
- label:role:ROLE
- label:user:USER
```
@z

@x
In case list syntax is used, the following keys should also be treated as sequences:
`dns`, `dns_search`, `env_file`, `tmpfs`. Unlike sequence fields mentioned above,
duplicates resulting from the merge are not removed.
@y
In case list syntax is used, the following keys should also be treated as sequences:
`dns`, `dns_search`, `env_file`, `tmpfs`. Unlike sequence fields mentioned above,
duplicates resulting from the merge are not removed.
@z

@x
##### Scalars
@y
##### Scalars
@z

@x
Any other allowed keys in the service definition should be treated as scalars.
@y
Any other allowed keys in the service definition should be treated as scalars.
@z

@x
### external_links
@y
### external_links
@z

@x
`external_links` link service containers to services managed outside of your Compose application.
`external_links` define the name of an existing service to retrieve using the platform lookup mechanism.
An alias of the form `SERVICE:ALIAS` can be specified.
@y
`external_links` link service containers to services managed outside of your Compose application.
`external_links` define the name of an existing service to retrieve using the platform lookup mechanism.
An alias of the form `SERVICE:ALIAS` can be specified.
@z

@x
```yml
external_links:
  - redis
  - database:mysql
  - database:postgresql
```
@y
```yml
external_links:
  - redis
  - database:mysql
  - database:postgresql
```
@z

@x
### extra_hosts
@y
### extra_hosts
@z

@x
`extra_hosts` adds hostname mappings to the container network interface configuration (`/etc/hosts` for Linux).
@y
`extra_hosts` adds hostname mappings to the container network interface configuration (`/etc/hosts` for Linux).
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
Short syntax uses plain strings in a list. Values must set hostname and IP address for additional hosts in the form of `HOSTNAME=IP`.
@y
Short syntax uses plain strings in a list. Values must set hostname and IP address for additional hosts in the form of `HOSTNAME=IP`.
@z

@x
```yml
extra_hosts:
  - "somehost=162.242.195.82"
  - "otherhost=50.31.209.229"
  - "myhostv6=::1"
```
@y
```yml
extra_hosts:
  - "somehost=162.242.195.82"
  - "otherhost=50.31.209.229"
  - "myhostv6=::1"
```
@z

@x
IPv6 addresses can be enclosed in square brackets, for example:
@y
IPv6 addresses can be enclosed in square brackets, for example:
@z

@x
```yml
extra_hosts:
  - "myhostv6=[::1]"
```
@y
```yml
extra_hosts:
  - "myhostv6=[::1]"
```
@z

@x
The separator `=` is preferred, but `:` can also be used. Introduced in Docker Compose version [2.24.1](/manuals/compose/release-notes.md#2241). For example:
@y
The separator `=` is preferred, but `:` can also be used. Introduced in Docker Compose version [2.24.1](manuals/compose/release-notes.md#2241). For example:
@z

@x
```yml
extra_hosts:
  - "somehost:162.242.195.82"
  - "myhostv6:::1"
```
@y
```yml
extra_hosts:
  - "somehost:162.242.195.82"
  - "myhostv6:::1"
```
@z

@x
#### Long syntax
@y
#### Long syntax
@z

@x
Alternatively, `extra_hosts` can be set as a mapping between hostname(s) and IP(s)
@y
Alternatively, `extra_hosts` can be set as a mapping between hostname(s) and IP(s)
@z

@x
```yml
extra_hosts:
  somehost: "162.242.195.82"
  otherhost: "50.31.209.229"
  myhostv6: "::1"
```
@y
```yml
extra_hosts:
  somehost: "162.242.195.82"
  otherhost: "50.31.209.229"
  myhostv6: "::1"
```
@z

@x
Compose creates a matching entry with the IP address and hostname in the container's network
configuration, which means for Linux `/etc/hosts` get extra lines:
@y
Compose creates a matching entry with the IP address and hostname in the container's network
configuration, which means for Linux `/etc/hosts` get extra lines:
@z

@x
```console
162.242.195.82  somehost
50.31.209.229   otherhost
::1             myhostv6
```
@y
```console
162.242.195.82  somehost
50.31.209.229   otherhost
::1             myhostv6
```
@z

@x
### group_add
@y
### group_add
@z

@x
`group_add` specifies additional groups, by name or number, which the user inside the container must be a member of.
@y
`group_add` specifies additional groups, by name or number, which the user inside the container must be a member of.
@z

@x
An example of where this is useful is when multiple containers (running as different users) need to all read or write
the same file on a shared volume. That file can be owned by a group shared by all the containers, and specified in
`group_add`.
@y
An example of where this is useful is when multiple containers (running as different users) need to all read or write
the same file on a shared volume. That file can be owned by a group shared by all the containers, and specified in
`group_add`.
@z

@x
```yml
services:
  myservice:
    image: alpine
    group_add:
      - mail
```
@y
```yml
services:
  myservice:
    image: alpine
    group_add:
      - mail
```
@z

@x
Running `id` inside the created container must show that the user belongs to the `mail` group, which would not have
been the case if `group_add` were not declared.
@y
Running `id` inside the created container must show that the user belongs to the `mail` group, which would not have
been the case if `group_add` were not declared.
@z

@x
### healthcheck
@y
### healthcheck
@z

@x
{{< include "compose/services-healthcheck.md" >}} 
@y
{{< include "compose/services-healthcheck.md" >}} 
@z

@x
For more information on `HEALTHCHECK`, see the [Dockerfile reference](/reference/dockerfile.md#healthcheck).
@y
For more information on `HEALTHCHECK`, see the [Dockerfile reference](reference/dockerfile.md#healthcheck).
@z

@x
```yml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 40s
  start_interval: 5s
```
@y
```yml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 40s
  start_interval: 5s
```
@z

@x
`interval`, `timeout`, `start_period`, and `start_interval` are [specified as durations](extension.md#specifying-durations). Introduced in Docker Compose version [2.20.2](/manuals/compose/release-notes.md#2202)
@y
`interval`, `timeout`, `start_period`, and `start_interval` are [specified as durations](extension.md#specifying-durations). Introduced in Docker Compose version [2.20.2](manuals/compose/release-notes.md#2202)
@z

@x
`test` defines the command Compose runs to check container health. It can be
either a string or a list. If it's a list, the first item must be either `NONE`, `CMD` or `CMD-SHELL`.
If it's a string, it's equivalent to specifying `CMD-SHELL` followed by that string.
@y
`test` defines the command Compose runs to check container health. It can be
either a string or a list. If it's a list, the first item must be either `NONE`, `CMD` or `CMD-SHELL`.
If it's a string, it's equivalent to specifying `CMD-SHELL` followed by that string.
@z

@x
```yml
# Hit the local web app
test: ["CMD", "curl", "-f", "http://localhost"]
```
@y
```yml
# Hit the local web app
test: ["CMD", "curl", "-f", "http://localhost"]
```
@z

@x
Using `CMD-SHELL` runs the command configured as a string using the container's default shell
(`/bin/sh` for Linux). Both forms below are equivalent:
@y
Using `CMD-SHELL` runs the command configured as a string using the container's default shell
(`/bin/sh` for Linux). Both forms below are equivalent:
@z

@x
```yml
test: ["CMD-SHELL", "curl -f http://localhost || exit 1"]
```
@y
```yml
test: ["CMD-SHELL", "curl -f http://localhost || exit 1"]
```
@z

@x
```yml
test: curl -f https://localhost || exit 1
```
@y
```yml
test: curl -f https://localhost || exit 1
```
@z

@x
`NONE` disables the healthcheck, and is mostly useful to disable the Healthcheck Dockerfile instruction set by the service's Docker image. Alternatively,
the healthcheck set by the image can be disabled by setting `disable: true`:
@y
`NONE` disables the healthcheck, and is mostly useful to disable the Healthcheck Dockerfile instruction set by the service's Docker image. Alternatively,
the healthcheck set by the image can be disabled by setting `disable: true`:
@z

@x
```yml
healthcheck:
  disable: true
```
@y
```yml
healthcheck:
  disable: true
```
@z

@x
### hostname
@y
### hostname
@z

@x
`hostname` declares a custom host name to use for the service container. It must be a valid RFC 1123 hostname.
@y
`hostname` declares a custom host name to use for the service container. It must be a valid RFC 1123 hostname.
@z

@x
### image
@y
### image
@z

@x
`image` specifies the image to start the container from. `image` must follow the Open Container Specification
[addressable image format](https://github.com/opencontainers/org/blob/master/docs/docs/introduction/digests.md),
as `[<registry>/][<project>/]<image>[:<tag>|@<digest>]`.
@y
`image` specifies the image to start the container from. `image` must follow the Open Container Specification
[addressable image format](https://github.com/opencontainers/org/blob/master/docs/docs/introduction/digests.md),
as `[<registry>/][<project>/]<image>[:<tag>|@<digest>]`.
@z

@x
```yml
    image: redis
    image: redis:5
    image: redis@sha256:0ed5d5928d4737458944eb604cc8509e245c3e19d02ad83935398bc4b991aac7
    image: library/redis
    image: docker.io/library/redis
    image: my_private.registry:5000/redis
```
@y
```yml
    image: redis
    image: redis:5
    image: redis@sha256:0ed5d5928d4737458944eb604cc8509e245c3e19d02ad83935398bc4b991aac7
    image: library/redis
    image: docker.io/library/redis
    image: my_private.registry:5000/redis
```
@z

@x
If the image does not exist on the platform, Compose attempts to pull it based on the `pull_policy`.
If you are also using the [Compose Build Specification](build.md), there are alternative options for controlling the precedence of
pull over building the image from source, however pulling the image is the default behavior.
@y
If the image does not exist on the platform, Compose attempts to pull it based on the `pull_policy`.
If you are also using the [Compose Build Specification](build.md), there are alternative options for controlling the precedence of
pull over building the image from source, however pulling the image is the default behavior.
@z

@x
`image` may be omitted from a Compose file as long as a `build` section is declared. If you are not using the Compose Build Specification, Compose won't work if `image` is missing from the Compose file.
@y
`image` may be omitted from a Compose file as long as a `build` section is declared. If you are not using the Compose Build Specification, Compose won't work if `image` is missing from the Compose file.
@z

@x
### init
@y
### init
@z

@x
`init` runs an init process (PID 1) inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@y
`init` runs an init process (PID 1) inside the container that forwards signals and reaps processes.
Set this option to `true` to enable this feature for the service.
@z

@x
```yml
services:
  web:
    image: alpine:latest
    init: true
```
@y
```yml
services:
  web:
    image: alpine:latest
    init: true
```
@z

@x
The init binary that is used is platform specific.
@y
The init binary that is used is platform specific.
@z

@x
### ipc
@y
### ipc
@z

@x
`ipc` configures the IPC isolation mode set by the service container.
@y
`ipc` configures the IPC isolation mode set by the service container.
@z

@x
- `shareable`: Gives the container its own private IPC namespace, with a
  possibility to share it with other containers.
- `service:{name}`: Makes the container join another container's
  (`shareable`) IPC namespace.
@y
- `shareable`: Gives the container its own private IPC namespace, with a
  possibility to share it with other containers.
- `service:{name}`: Makes the container join another container's
  (`shareable`) IPC namespace.
@z

@x
```yml
    ipc: "shareable"
    ipc: "service:[service name]"
```
@y
```yml
    ipc: "shareable"
    ipc: "service:[service name]"
```
@z

@x
### isolation
@y
### isolation
@z

@x
`isolation` specifies a container’s isolation technology. Supported values are platform specific.
@y
`isolation` specifies a container’s isolation technology. Supported values are platform specific.
@z

@x
### labels
@y
### labels
@z

@x
`labels` add metadata to containers. You can use either an array or a map.
@y
`labels` add metadata to containers. You can use either an array or a map.
@z

@x
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with
those used by other software.
@y
It's recommended that you use reverse-DNS notation to prevent your labels from conflicting with
those used by other software.
@z

@x
```yml
labels:
  com.example.description: "Accounting webapp"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@y
```yml
labels:
  com.example.description: "Accounting webapp"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
```
@z

@x
```yml
labels:
  - "com.example.description=Accounting webapp"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@y
```yml
labels:
  - "com.example.description=Accounting webapp"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```
@z

@x
Compose creates containers with canonical labels:
@y
Compose creates containers with canonical labels:
@z

@x
- `com.docker.compose.project` set on all resources created by Compose to the user project name
- `com.docker.compose.service` set on service containers with service name as defined in the Compose file
@y
- `com.docker.compose.project` set on all resources created by Compose to the user project name
- `com.docker.compose.service` set on service containers with service name as defined in the Compose file
@z

@x
The `com.docker.compose` label prefix is reserved. Specifying labels with this prefix in the Compose file
results in a runtime error.
@y
The `com.docker.compose` label prefix is reserved. Specifying labels with this prefix in the Compose file
results in a runtime error.
@z

@x
### links
@y
### links
@z

@x
`links` defines a network link to containers in another service. Either specify both the service name and
a link alias (`SERVICE:ALIAS`), or just the service name.
@y
`links` defines a network link to containers in another service. Either specify both the service name and
a link alias (`SERVICE:ALIAS`), or just the service name.
@z

@x
```yml
web:
  links:
    - db
    - db:database
    - redis
```
@y
```yml
web:
  links:
    - db
    - db:database
    - redis
```
@z

@x
Containers for the linked service are reachable at a hostname identical to the alias, or the service name
if no alias is specified.
@y
Containers for the linked service are reachable at a hostname identical to the alias, or the service name
if no alias is specified.
@z

@x
Links are not required to enable services to communicate. When no specific network configuration is set,
any service is able to reach any other service at that service’s name on the `default` network. If services
do declare networks they are attached to, `links` does not override the network configuration and services not
attached to a shared network are not be able to communicate. Compose doesn't warn you about a configuration mismatch.
@y
Links are not required to enable services to communicate. When no specific network configuration is set,
any service is able to reach any other service at that service’s name on the `default` network. If services
do declare networks they are attached to, `links` does not override the network configuration and services not
attached to a shared network are not be able to communicate. Compose doesn't warn you about a configuration mismatch.
@z

@x
Links also express implicit dependency between services in the same way as
[depends_on](#depends_on), so they determine the order of service startup.
@y
Links also express implicit dependency between services in the same way as
[depends_on](#depends_on), so they determine the order of service startup.
@z

@x
### logging
@y
### logging
@z

@x
`logging` defines the logging configuration for the service.
@y
`logging` defines the logging configuration for the service.
@z

@x
```yml
logging:
  driver: syslog
  options:
    syslog-address: "tcp://192.168.0.42:123"
```
@y
```yml
logging:
  driver: syslog
  options:
    syslog-address: "tcp://192.168.0.42:123"
```
@z

@x
The `driver` name specifies a logging driver for the service's containers. The default and available values
are platform specific. Driver specific options can be set with `options` as key-value pairs.
@y
The `driver` name specifies a logging driver for the service's containers. The default and available values
are platform specific. Driver specific options can be set with `options` as key-value pairs.
@z

@x
### mac_address
@y
### mac_address
@z

@x
> Available with Docker Compose version 2.24.0 and later.
@y
> Available with Docker Compose version 2.24.0 and later.
@z

@x
`mac_address` sets a MAC address for the service container.
@y
`mac_address` sets a MAC address for the service container.
@z

@x
> [!NOTE]
> Container runtimes might reject this value (ie. Docker Engine >= v25.0). In that case, you should use [networks.mac_address](#mac_address) instead.
@y
> [!NOTE]
> Container runtimes might reject this value (ie. Docker Engine >= v25.0). In that case, you should use [networks.mac_address](#mac_address) instead.
@z

@x
### mem_limit
@y
### mem_limit
@z

@x
`mem_limit` configures a limit on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@y
`mem_limit` configures a limit on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@z

@x
When set, `mem_limit` must be consistent with the `limits.memory` attribute in the [Deploy Specification](deploy.md#memory).
@y
When set, `mem_limit` must be consistent with the `limits.memory` attribute in the [Deploy Specification](deploy.md#memory).
@z

@x
### mem_reservation
@y
### mem_reservation
@z

@x
`mem_reservation` configures a reservation on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@y
`mem_reservation` configures a reservation on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@z

@x
When set, `mem_reservation` must be consistent with the `reservations.memory` attribute in the [Deploy Specification](deploy.md#memory).
@y
When set, `mem_reservation` must be consistent with the `reservations.memory` attribute in the [Deploy Specification](deploy.md#memory).
@z

@x
### mem_swappiness
@y
### mem_swappiness
@z

@x
`mem_swappiness` defines as a percentage, a value between 0 and 100, for the host kernel to swap out
anonymous memory pages used by a container.
@y
`mem_swappiness` defines as a percentage, a value between 0 and 100, for the host kernel to swap out
anonymous memory pages used by a container.
@z

@x
- `0`: Turns off anonymous page swapping.
- `100`: Sets all anonymous pages as swappable.
@y
- `0`: Turns off anonymous page swapping.
- `100`: Sets all anonymous pages as swappable.
@z

@x
The default value is platform specific.
@y
The default value is platform specific.
@z

@x
### memswap_limit
@y
### memswap_limit
@z

@x
`memswap_limit` defines the amount of memory the container is allowed to swap to disk. This is a modifier
attribute that only has meaning if [`memory`](deploy.md#memory) is also set. Using swap lets the container write excess
memory requirements to disk when the container has exhausted all the memory that is available to it.
There is a performance penalty for applications that swap memory to disk often.
@y
`memswap_limit` defines the amount of memory the container is allowed to swap to disk. This is a modifier
attribute that only has meaning if [`memory`](deploy.md#memory) is also set. Using swap lets the container write excess
memory requirements to disk when the container has exhausted all the memory that is available to it.
There is a performance penalty for applications that swap memory to disk often.
@z

@x
- If `memswap_limit` is set to a positive integer, then both `memory` and `memswap_limit` must be set. `memswap_limit` represents the total amount of memory and swap that can be used, and `memory` controls the amount used by non-swap memory. So if `memory`="300m" and `memswap_limit`="1g", the container can use 300m of memory and 700m (1g - 300m) swap.
- If `memswap_limit` is set to 0, the setting is ignored, and the value is treated as unset.
- If `memswap_limit` is set to the same value as `memory`, and `memory` is set to a positive integer, the container does not have access to swap.
- If `memswap_limit` is unset, and `memory` is set, the container can use as much swap as the `memory` setting, if the host container has swap memory configured. For instance, if `memory`="300m" and `memswap_limit` is not set, the container can use 600m in total of memory and swap.
- If `memswap_limit` is explicitly set to -1, the container is allowed to use unlimited swap, up to the amount available on the host system.
@y
- If `memswap_limit` is set to a positive integer, then both `memory` and `memswap_limit` must be set. `memswap_limit` represents the total amount of memory and swap that can be used, and `memory` controls the amount used by non-swap memory. So if `memory`="300m" and `memswap_limit`="1g", the container can use 300m of memory and 700m (1g - 300m) swap.
- If `memswap_limit` is set to 0, the setting is ignored, and the value is treated as unset.
- If `memswap_limit` is set to the same value as `memory`, and `memory` is set to a positive integer, the container does not have access to swap.
- If `memswap_limit` is unset, and `memory` is set, the container can use as much swap as the `memory` setting, if the host container has swap memory configured. For instance, if `memory`="300m" and `memswap_limit` is not set, the container can use 600m in total of memory and swap.
- If `memswap_limit` is explicitly set to -1, the container is allowed to use unlimited swap, up to the amount available on the host system.
@z

@x
### network_mode
@y
### network_mode
@z

@x
`network_mode` sets a service container's network mode. 
@y
`network_mode` sets a service container's network mode. 
@z

@x
- `none`: Turns off all container networking.
- `host`: Gives the container raw access to the host's network interface.
- `service:{name}`: Gives the containers access to the specified service only. For more information, see [Container networks](/manuals/engine/network/_index.md#container-networks).
@y
- `none`: Turns off all container networking.
- `host`: Gives the container raw access to the host's network interface.
- `service:{name}`: Gives the containers access to the specified service only. For more information, see [Container networks](manuals/engine/network/_index.md#container-networks).
@z

@x
```yml
    network_mode: "host"
    network_mode: "none"
    network_mode: "service:[service name]"
```
@y
```yml
    network_mode: "host"
    network_mode: "none"
    network_mode: "service:[service name]"
```
@z

@x
When set, the [`networks`](#networks) attribute is not allowed and Compose rejects any
Compose file containing both attributes.
@y
When set, the [`networks`](#networks) attribute is not allowed and Compose rejects any
Compose file containing both attributes.
@z

@x
### networks
@y
### networks
@z

@x
{{< include "compose/services-networks.md" >}}
@y
{{< include "compose/services-networks.md" >}}
@z

@x
```yml
services:
  some-service:
    networks:
      - some-network
      - other-network
```
For more information about the `networks` top-level element, see [Networks](networks.md).
@y
```yml
services:
  some-service:
    networks:
      - some-network
      - other-network
```
For more information about the `networks` top-level element, see [Networks](networks.md).
@z

@x
#### aliases
@y
#### aliases
@z

@x
`aliases` declares alternative hostnames for the service on the network. Other containers on the same
network can use either the service name or an alias to connect to one of the service's containers.
@y
`aliases` declares alternative hostnames for the service on the network. Other containers on the same
network can use either the service name or an alias to connect to one of the service's containers.
@z

@x
Since `aliases` are network-scoped, the same service can have different aliases on different networks.
@y
Since `aliases` are network-scoped, the same service can have different aliases on different networks.
@z

@x
> [!NOTE]
> A network-wide alias can be shared by multiple containers, and even by multiple services.
> If it is, then exactly which container the name resolves to is not guaranteed.
@y
> [!NOTE]
> A network-wide alias can be shared by multiple containers, and even by multiple services.
> If it is, then exactly which container the name resolves to is not guaranteed.
@z

@x
```yml
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
```yml
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
In the following example, service `frontend` is able to reach the `backend` service at
the hostname `backend` or `database` on the `back-tier` network. The service `monitoring`
is able to reach same `backend` service at `backend` or `mysql` on the `admin` network.
@y
In the following example, service `frontend` is able to reach the `backend` service at
the hostname `backend` or `database` on the `back-tier` network. The service `monitoring`
is able to reach same `backend` service at `backend` or `mysql` on the `admin` network.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    networks:
      - front-tier
      - back-tier
@y
```yml
services:
  frontend:
    image: example/webapp
    networks:
      - front-tier
      - back-tier
@z

@x
  monitoring:
    image: example/monitoring
    networks:
      - admin
@y
  monitoring:
    image: example/monitoring
    networks:
      - admin
@z

@x
  backend:
    image: example/backend
    networks:
      back-tier:
        aliases:
          - database
      admin:
        aliases:
          - mysql
@y
  backend:
    image: example/backend
    networks:
      back-tier:
        aliases:
          - database
      admin:
        aliases:
          - mysql
@z

@x
networks:
  front-tier:
  back-tier:
  admin:
```
@y
networks:
  front-tier:
  back-tier:
  admin:
```
@z

@x
#### ipv4_address, ipv6_address
@y
#### ipv4_address, ipv6_address
@z

@x
Specify a static IP address for a service container when joining the network.
@y
Specify a static IP address for a service container when joining the network.
@z

@x
The corresponding network configuration in the [top-level networks section](networks.md) must have an
`ipam` attribute with subnet configurations covering each static address.
@y
The corresponding network configuration in the [top-level networks section](networks.md) must have an
`ipam` attribute with subnet configurations covering each static address.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    networks:
      front-tier:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10
@y
```yml
services:
  frontend:
    image: example/webapp
    networks:
      front-tier:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10
@z

@x
networks:
  front-tier:
    ipam:
      driver: default
      config:
        - subnet: "172.16.238.0/24"
        - subnet: "2001:3984:3989::/64"
```
@y
networks:
  front-tier:
    ipam:
      driver: default
      config:
        - subnet: "172.16.238.0/24"
        - subnet: "2001:3984:3989::/64"
```
@z

@x
#### link_local_ips
@y
#### link_local_ips
@z

@x
`link_local_ips` specifies a list of link-local IPs. Link-local IPs are special IPs which belong to a well
known subnet and are purely managed by the operator, usually dependent on the architecture where they are
deployed.
@y
`link_local_ips` specifies a list of link-local IPs. Link-local IPs are special IPs which belong to a well
known subnet and are purely managed by the operator, usually dependent on the architecture where they are
deployed.
@z

@x
Example:
@y
Example:
@z

@x
```yaml
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
#### mac_address
@y
#### mac_address
@z

@x
{{< introduced compose 2.23.2 "/manuals/compose/release-notes.md#2232" >}}
@y
{{< introduced compose 2.23.2 "/manuals/compose/release-notes.md#2232" >}}
@z

@x
`mac_address` sets the MAC address used by the service container when connecting to this particular network.
@y
`mac_address` sets the MAC address used by the service container when connecting to this particular network.
@z

@x
#### priority
@y
#### priority
@z

@x
`priority` indicates in which order Compose connects the service’s containers to its
networks. If unspecified, the default value is 0.
@y
`priority` indicates in which order Compose connects the service’s containers to its
networks. If unspecified, the default value is 0.
@z

@x
In the following example, the app service connects to `app_net_1` first as it has the highest priority. It then connects to `app_net_3`, then `app_net_2`, which uses the default priority value of 0.
@y
In the following example, the app service connects to `app_net_1` first as it has the highest priority. It then connects to `app_net_3`, then `app_net_2`, which uses the default priority value of 0.
@z

@x
```yaml
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
### oom_kill_disable
@y
### oom_kill_disable
@z

@x
If `oom_kill_disable` is set, Compose configures the platform so it won't kill the container in case
of memory starvation.
@y
If `oom_kill_disable` is set, Compose configures the platform so it won't kill the container in case
of memory starvation.
@z

@x
### oom_score_adj
@y
### oom_score_adj
@z

@x
`oom_score_adj` tunes the preference for containers to be killed by platform in case of memory starvation. Value must
be within -1000,1000 range.
@y
`oom_score_adj` tunes the preference for containers to be killed by platform in case of memory starvation. Value must
be within -1000,1000 range.
@z

@x
### pid
@y
### pid
@z

@x
`pid` sets the PID mode for container created by Compose.
Supported values are platform specific.
@y
`pid` sets the PID mode for container created by Compose.
Supported values are platform specific.
@z

@x
### pids_limit
@y
### pids_limit
@z

@x
`pids_limit` tunes a container’s PIDs limit. Set to -1 for unlimited PIDs.
@y
`pids_limit` tunes a container’s PIDs limit. Set to -1 for unlimited PIDs.
@z

@x
```yml
pids_limit: 10
```
@y
```yml
pids_limit: 10
```
@z

@x
When set, `pids_limit` must be consistent with the `pids` attribute in the [Deploy Specification](deploy.md#pids).
@y
When set, `pids_limit` must be consistent with the `pids` attribute in the [Deploy Specification](deploy.md#pids).
@z

@x
### platform
@y
### platform
@z

@x
`platform` defines the target platform the containers for the service run on. It uses the `os[/arch[/variant]]` syntax.
@y
`platform` defines the target platform the containers for the service run on. It uses the `os[/arch[/variant]]` syntax.
@z

@x
The values of `os`, `arch`, and `variant` must conform to the convention used by the [OCI Image Spec](https://github.com/opencontainers/image-spec/blob/v1.0.2/image-index.md).
@y
The values of `os`, `arch`, and `variant` must conform to the convention used by the [OCI Image Spec](https://github.com/opencontainers/image-spec/blob/v1.0.2/image-index.md).
@z

@x
Compose uses this attribute to determine which version of the image is pulled
and/or on which platform the service’s build is performed.
@y
Compose uses this attribute to determine which version of the image is pulled
and/or on which platform the service’s build is performed.
@z

@x
```yml
platform: darwin
platform: windows/amd64
platform: linux/arm64/v8
```
@y
```yml
platform: darwin
platform: windows/amd64
platform: linux/arm64/v8
```
@z

@x
### ports
@y
### ports
@z

@x
{{< include "compose/services-ports.md" >}}
@y
{{< include "compose/services-ports.md" >}}
@z

@x
> [!NOTE]
>
> Port mapping must not be used with `network_mode: host` otherwise a runtime error occurs.
@y
> [!NOTE]
>
> Port mapping must not be used with `network_mode: host` otherwise a runtime error occurs.
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax is a colon-separated string to set the host IP, host port, and container port
in the form:
@y
The short syntax is a colon-separated string to set the host IP, host port, and container port
in the form:
@z

@x
`[HOST:]CONTAINER[/PROTOCOL]` where:
@y
`[HOST:]CONTAINER[/PROTOCOL]` where:
@z

@x
- `HOST` is `[IP:](port | range)`
- `CONTAINER` is `port | range`
- `PROTOCOL` to restrict port to specified protocol. `tcp` and `udp` values are defined by the Specification,
  Compose offers support for platform-specific protocol names.
@y
- `HOST` is `[IP:](port | range)`
- `CONTAINER` is `port | range`
- `PROTOCOL` to restrict port to specified protocol. `tcp` and `udp` values are defined by the Specification,
  Compose offers support for platform-specific protocol names.
@z

@x
If host IP is not set, it binds to all network interfaces. Ports can be either a single
value or a range. Host and container must use equivalent ranges.
@y
If host IP is not set, it binds to all network interfaces. Ports can be either a single
value or a range. Host and container must use equivalent ranges.
@z

@x
Either specify both ports (`HOST:CONTAINER`), or just the container port. In the latter case,
the container runtime automatically allocates any unassigned port of the host.
@y
Either specify both ports (`HOST:CONTAINER`), or just the container port. In the latter case,
the container runtime automatically allocates any unassigned port of the host.
@z

@x
`HOST:CONTAINER` should always be specified as a (quoted) string, to avoid conflicts
with [yaml base-60 float](https://yaml.org/type/float.html).
@y
`HOST:CONTAINER` should always be specified as a (quoted) string, to avoid conflicts
with [yaml base-60 float](https://yaml.org/type/float.html).
@z

@x
Examples:
@y
Examples:
@z

@x
```yml
ports:
  - "3000"
  - "3000-3005"
  - "8000:8000"
  - "9090-9091:8080-8081"
  - "49100:22"
  - "8000-9000:80"
  - "127.0.0.1:8001:8001"
  - "127.0.0.1:5000-5010:5000-5010"
  - "6060:6060/udp"
```
@y
```yml
ports:
  - "3000"
  - "3000-3005"
  - "8000:8000"
  - "9090-9091:8080-8081"
  - "49100:22"
  - "8000-9000:80"
  - "127.0.0.1:8001:8001"
  - "127.0.0.1:5000-5010:5000-5010"
  - "6060:6060/udp"
```
@z

@x
> [!NOTE]
>
> If Host IP mapping is not supported by a container engine, Compose rejects
> the Compose file and ignores the specified host IP.
@y
> [!NOTE]
>
> If Host IP mapping is not supported by a container engine, Compose rejects
> the Compose file and ignores the specified host IP.
@z

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
- `target`: The container port
- `published`: The publicly exposed port. It is defined as a string and can be set as a range using syntax `start-end`. It means the actual port is assigned a remaining available port, within the set range.
- `host_ip`: The Host IP mapping, unspecified means all network interfaces (`0.0.0.0`).
- `protocol`: The port protocol (`tcp` or `udp`). Defaults to `tcp`.
- `app_protocol`: The application protocol (TCP/IP level 4 / OSI level 7) this port is used for. This is optional and can be used as a hint for Compose to offer richer behavior for protocols that it understands. Introduced in Docker Compose version [2.26.0](/manuals/compose/release-notes.md#2260).
- `mode`: `host`: For publishing a host port on each node, or `ingress` for a port to be load balanced. Defaults to `ingress`.
- `name`: A human-readable name for the port, used to document it's usage within the service.
@y
- `target`: The container port
- `published`: The publicly exposed port. It is defined as a string and can be set as a range using syntax `start-end`. It means the actual port is assigned a remaining available port, within the set range.
- `host_ip`: The Host IP mapping, unspecified means all network interfaces (`0.0.0.0`).
- `protocol`: The port protocol (`tcp` or `udp`). Defaults to `tcp`.
- `app_protocol`: The application protocol (TCP/IP level 4 / OSI level 7) this port is used for. This is optional and can be used as a hint for Compose to offer richer behavior for protocols that it understands. Introduced in Docker Compose version [2.26.0](manuals/compose/release-notes.md#2260).
- `mode`: `host`: For publishing a host port on each node, or `ingress` for a port to be load balanced. Defaults to `ingress`.
- `name`: A human-readable name for the port, used to document it's usage within the service.
@z

@x
```yml
ports:
  - name: web
    target: 80
    host_ip: 127.0.0.1
    published: "8080"
    protocol: tcp
    app_protocol: http
    mode: host
@y
```yml
ports:
  - name: web
    target: 80
    host_ip: 127.0.0.1
    published: "8080"
    protocol: tcp
    app_protocol: http
    mode: host
@z

@x
  - name: web-secured
    target: 443
    host_ip: 127.0.0.1
    published: "8083-9000"
    protocol: tcp
    app_protocol: https
    mode: host
```
@y
  - name: web-secured
    target: 443
    host_ip: 127.0.0.1
    published: "8083-9000"
    protocol: tcp
    app_protocol: https
    mode: host
```
@z

@x
### privileged
@y
### privileged
@z

@x
`privileged` configures the service container to run with elevated privileges. Support and actual impacts are platform specific.
@y
`privileged` configures the service container to run with elevated privileges. Support and actual impacts are platform specific.
@z

@x
### profiles
@y
### profiles
@z

@x
`profiles` defines a list of named profiles for the service to be enabled under. If unassigned, the service is always started but if assigned, it is only started if the profile is activated.
@y
`profiles` defines a list of named profiles for the service to be enabled under. If unassigned, the service is always started but if assigned, it is only started if the profile is activated.
@z

@x
If present, `profiles` follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@y
If present, `profiles` follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@z

@x
```yaml
services:
  frontend:
    image: frontend
    profiles: ["frontend"]
@y
```yaml
services:
  frontend:
    image: frontend
    profiles: ["frontend"]
@z

@x
  phpmyadmin:
    image: phpmyadmin
    depends_on:
      - db
    profiles:
      - debug
```
@y
  phpmyadmin:
    image: phpmyadmin
    depends_on:
      - db
    profiles:
      - debug
```
@z

@x
### pull_policy
@y
### pull_policy
@z

@x
`pull_policy` defines the decisions Compose makes when it starts to pull images. Possible values are:
@y
`pull_policy` defines the decisions Compose makes when it starts to pull images. Possible values are:
@z

@x
* `always`: Compose always pulls the image from the registry.
* `never`: Compose doesn't pull the image from a registry and relies on the platform cached image.
   If there is no cached image, a failure is reported.
* `missing`: Compose pulls the image only if it's not available in the platform cache.
   This is the default option if you are not also using the [Compose Build Specification](build.md).
  `if_not_present` is considered an alias for this value for backward compatibility.
* `build`: Compose builds the image. Compose rebuilds the image if it's already present.
@y
* `always`: Compose always pulls the image from the registry.
* `never`: Compose doesn't pull the image from a registry and relies on the platform cached image.
   If there is no cached image, a failure is reported.
* `missing`: Compose pulls the image only if it's not available in the platform cache.
   This is the default option if you are not also using the [Compose Build Specification](build.md).
  `if_not_present` is considered an alias for this value for backward compatibility.
* `build`: Compose builds the image. Compose rebuilds the image if it's already present.
@z

@x
### read_only
@y
### read_only
@z

@x
`read_only` configures the service container to be created with a read-only filesystem.
@y
`read_only` configures the service container to be created with a read-only filesystem.
@z

@x
### restart
@y
### restart
@z

@x
`restart` defines the policy that the platform applies on container termination.
@y
`restart` defines the policy that the platform applies on container termination.
@z

@x
- `no`: The default restart policy. It does not restart the container under any circumstances.
- `always`: The policy always restarts the container until its removal.
- `on-failure[:max-retries]`: The policy restarts the container if the exit code indicates an error.
Optionally, limit the number of restart retries the Docker daemon attempts.
- `unless-stopped`: The policy restarts the container irrespective of the exit code but stops
  restarting when the service is stopped or removed.
@y
- `no`: The default restart policy. It does not restart the container under any circumstances.
- `always`: The policy always restarts the container until its removal.
- `on-failure[:max-retries]`: The policy restarts the container if the exit code indicates an error.
Optionally, limit the number of restart retries the Docker daemon attempts.
- `unless-stopped`: The policy restarts the container irrespective of the exit code but stops
  restarting when the service is stopped or removed.
@z

@x
```yml
    restart: "no"
    restart: always
    restart: on-failure
    restart: on-failure:3
    restart: unless-stopped
```
@y
```yml
    restart: "no"
    restart: always
    restart: on-failure
    restart: on-failure:3
    restart: unless-stopped
```
@z

@x
You can find more detailed information on restart policies in the
[Restart Policies (--restart)](/reference/cli/docker/container/run.md#restart)
section of the Docker run reference page.
@y
You can find more detailed information on restart policies in the
[Restart Policies (--restart)](reference/cli/docker/container/run.md#restart)
section of the Docker run reference page.
@z

@x
### runtime
@y
### runtime
@z

@x
`runtime` specifies which runtime to use for the service’s containers.
@y
`runtime` specifies which runtime to use for the service’s containers.
@z

@x
For example, `runtime` can be the name of [an implementation of OCI Runtime Spec](https://github.com/opencontainers/runtime-spec/blob/master/implementations.md), such as "runc".
@y
For example, `runtime` can be the name of [an implementation of OCI Runtime Spec](https://github.com/opencontainers/runtime-spec/blob/master/implementations.md), such as "runc".
@z

@x
```yml
web:
  image: busybox:latest
  command: true
  runtime: runc
```
@y
```yml
web:
  image: busybox:latest
  command: true
  runtime: runc
```
@z

@x
The default is `runc`. To use a different runtime, see [Alternative runtimes](/manuals/engine/daemon/alternative-runtimes.md).
@y
The default is `runc`. To use a different runtime, see [Alternative runtimes](manuals/engine/daemon/alternative-runtimes.md).
@z

@x
### scale
@y
### scale
@z

@x
`scale` specifies the default number of containers to deploy for this service.
When both are set, `scale` must be consistent with the `replicas` attribute in the [Deploy Specification](deploy.md#replicas).
@y
`scale` specifies the default number of containers to deploy for this service.
When both are set, `scale` must be consistent with the `replicas` attribute in the [Deploy Specification](deploy.md#replicas).
@z

@x
### secrets
@y
### secrets
@z

@x
{{< include "compose/services-secrets.md" >}}
@y
{{< include "compose/services-secrets.md" >}}
@z

@x
Two different syntax variants are supported; the short syntax and the long syntax. Long and short syntax for secrets may be used in the same Compose file.
@y
Two different syntax variants are supported; the short syntax and the long syntax. Long and short syntax for secrets may be used in the same Compose file.
@z

@x
Compose reports an error if the secret doesn't exist on the platform or isn't defined in the
[`secrets` top-level section](secrets.md) of the Compose file.
@y
Compose reports an error if the secret doesn't exist on the platform or isn't defined in the
[`secrets` top-level section](secrets.md) of the Compose file.
@z

@x
Defining a secret in the top-level `secrets` must not imply granting any service access to it.
Such grant must be explicit within service specification as [secrets](secrets.md) service element.
@y
Defining a secret in the top-level `secrets` must not imply granting any service access to it.
Such grant must be explicit within service specification as [secrets](secrets.md) service element.
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it as read-only to `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@y
The short syntax variant only specifies the secret name. This grants the
container access to the secret and mounts it as read-only to `/run/secrets/<secret_name>`
within the container. The source name and destination mountpoint are both set
to the secret name.
@z

@x
The following example uses the short syntax to grant the `frontend` service
access to the `server-certificate` secret. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@y
The following example uses the short syntax to grant the `frontend` service
access to the `server-certificate` secret. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    secrets:
      - server-certificate
secrets:
  server-certificate:
    file: ./server.cert
```
@y
```yml
services:
  frontend:
    image: example/webapp
    secrets:
      - server-certificate
secrets:
  server-certificate:
    file: ./server.cert
```
@z

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long syntax provides more granularity in how the secret is created within
the service's containers.
@y
The long syntax provides more granularity in how the secret is created within
the service's containers.
@z

@x
- `source`: The name of the secret as it exists on the platform.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task container, or absolute path of the file if an alternate location is required. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the file within
  `/run/secrets/` in the service's task containers. Default value is USER running container.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation.
  The default value is world-readable permissions (mode `0444`).
  The writable bit must be ignored if set. The executable bit may be set. 
@y
- `source`: The name of the secret as it exists on the platform.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task container, or absolute path of the file if an alternate location is required. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric UID or GID that owns the file within
  `/run/secrets/` in the service's task containers. Default value is USER running container.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation.
  The default value is world-readable permissions (mode `0444`).
  The writable bit must be ignored if set. The executable bit may be set. 
@z

@x
The following example sets the name of the `server-certificate` secret file to `server.cert`
within the container, sets the mode to `0440` (group-readable), and sets the user and group
to `103`. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@y
The following example sets the name of the `server-certificate` secret file to `server.cert`
within the container, sets the mode to `0440` (group-readable), and sets the user and group
to `103`. The value of `server-certificate` is set
to the contents of the file `./server.cert`.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    secrets:
      - source: server-certificate
        target: server.cert
        uid: "103"
        gid: "103"
        mode: 0440
secrets:
  server-certificate:
    file: ./server.cert
```
@y
```yml
services:
  frontend:
    image: example/webapp
    secrets:
      - source: server-certificate
        target: server.cert
        uid: "103"
        gid: "103"
        mode: 0440
secrets:
  server-certificate:
    file: ./server.cert
```
@z

@x
### security_opt
@y
### security_opt
@z

@x
`security_opt` overrides the default labeling scheme for each container.
@y
`security_opt` overrides the default labeling scheme for each container.
@z

@x
```yml
security_opt:
  - label:user:USER
  - label:role:ROLE
```
@y
```yml
security_opt:
  - label:user:USER
  - label:role:ROLE
```
@z

@x
For further default labeling schemes you can override, see [Security configuration](/reference/cli/docker/container/run.md#security-opt).
@y
For further default labeling schemes you can override, see [Security configuration](reference/cli/docker/container/run.md#security-opt).
@z

@x
### shm_size
@y
### shm_size
@z

@x
`shm_size` configures the size of the shared memory (`/dev/shm` partition on Linux) allowed by the service container.
It's specified as a [byte value](extension.md#specifying-byte-values).
@y
`shm_size` configures the size of the shared memory (`/dev/shm` partition on Linux) allowed by the service container.
It's specified as a [byte value](extension.md#specifying-byte-values).
@z

@x
### stdin_open
@y
### stdin_open
@z

@x
`stdin_open` configures a service's container to run with an allocated stdin. This is the same as running a container with the 
`-i` flag. For more information, see [Keep STDIN open](/reference/cli/docker/container/run.md#interactive).
@y
`stdin_open` configures a service's container to run with an allocated stdin. This is the same as running a container with the 
`-i` flag. For more information, see [Keep STDIN open](reference/cli/docker/container/run.md#interactive).
@z

@x
Supported values are `true` or `false`.
@y
Supported values are `true` or `false`.
@z

@x
### stop_grace_period
@y
### stop_grace_period
@z

@x
`stop_grace_period` specifies how long Compose must wait when attempting to stop a container if it doesn't
handle SIGTERM (or whichever stop signal has been specified with
[`stop_signal`](#stop_signal)), before sending SIGKILL. It's specified
as a [duration](extension.md#specifying-durations).
@y
`stop_grace_period` specifies how long Compose must wait when attempting to stop a container if it doesn't
handle SIGTERM (or whichever stop signal has been specified with
[`stop_signal`](#stop_signal)), before sending SIGKILL. It's specified
as a [duration](extension.md#specifying-durations).
@z

@x
```yml
    stop_grace_period: 1s
    stop_grace_period: 1m30s
```
@y
```yml
    stop_grace_period: 1s
    stop_grace_period: 1m30s
```
@z

@x
Default value is 10 seconds for the container to exit before sending SIGKILL.
@y
Default value is 10 seconds for the container to exit before sending SIGKILL.
@z

@x
### stop_signal
@y
### stop_signal
@z

@x
`stop_signal` defines the signal that Compose uses to stop the service containers.
If unset containers are stopped by Compose by sending `SIGTERM`.
@y
`stop_signal` defines the signal that Compose uses to stop the service containers.
If unset containers are stopped by Compose by sending `SIGTERM`.
@z

@x
```yml
stop_signal: SIGUSR1
```
@y
```yml
stop_signal: SIGUSR1
```
@z

@x
### storage_opt
@y
### storage_opt
@z

@x
`storage_opt` defines storage driver options for a service.
@y
`storage_opt` defines storage driver options for a service.
@z

@x
```yml
storage_opt:
  size: '1G'
```
@y
```yml
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
`sysctls` defines kernel parameters to set in the container. `sysctls` can use either an array or a map.
@y
`sysctls` defines kernel parameters to set in the container. `sysctls` can use either an array or a map.
@z

@x
```yml
sysctls:
  net.core.somaxconn: 1024
  net.ipv4.tcp_syncookies: 0
```
@y
```yml
sysctls:
  net.core.somaxconn: 1024
  net.ipv4.tcp_syncookies: 0
```
@z

@x
```yml
sysctls:
  - net.core.somaxconn=1024
  - net.ipv4.tcp_syncookies=0
```
@y
```yml
sysctls:
  - net.core.somaxconn=1024
  - net.ipv4.tcp_syncookies=0
```
@z

@x
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to [configure namespaced kernel
parameters (sysctls) at runtime](/reference/cli/docker/container/run.md#sysctl).
@y
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to [configure namespaced kernel
parameters (sysctls) at runtime](reference/cli/docker/container/run.md#sysctl).
@z

@x
### tmpfs
@y
### tmpfs
@z

@x
`tmpfs` mounts a temporary file system inside the container. It can be a single value or a list.
@y
`tmpfs` mounts a temporary file system inside the container. It can be a single value or a list.
@z

@x
```yml
tmpfs: /run
```
@y
```yml
tmpfs: /run
```
@z

@x
```yml
tmpfs:
  - /run
  - /tmp
```
@y
```yml
tmpfs:
  - /run
  - /tmp
```
@z

@x
### tty
@y
### tty
@z

@x
`tty` configures a service's container to run with a TTY. This is the same as running a container with the 
`-t` or `--tty` flag. For more information, see [Allocate a pseudo-TTY](/reference/cli/docker/container/run.md#tty).
@y
`tty` configures a service's container to run with a TTY. This is the same as running a container with the 
`-t` or `--tty` flag. For more information, see [Allocate a pseudo-TTY](reference/cli/docker/container/run.md#tty).
@z

@x
Supported values are `true` or `false`.
@y
Supported values are `true` or `false`.
@z

@x
### ulimits
@y
### ulimits
@z

@x
`ulimits` overrides the default ulimits for a container. It's specified either as an integer for a single limit
or as mapping for soft/hard limits.
@y
`ulimits` overrides the default ulimits for a container. It's specified either as an integer for a single limit
or as mapping for soft/hard limits.
@z

@x
```yml
ulimits:
  nproc: 65535
  nofile:
    soft: 20000
    hard: 40000
```
@y
```yml
ulimits:
  nproc: 65535
  nofile:
    soft: 20000
    hard: 40000
```
@z

@x
### user
@y
### user
@z

@x
`user` overrides the user used to run the container process. The default is set by the image (i.e. Dockerfile `USER`). If it's not set, then `root`.
@y
`user` overrides the user used to run the container process. The default is set by the image (i.e. Dockerfile `USER`). If it's not set, then `root`.
@z

@x
### userns_mode
@y
### userns_mode
@z

@x
`userns_mode` sets the user namespace for the service. Supported values are platform specific and may depend
on platform configuration.
@y
`userns_mode` sets the user namespace for the service. Supported values are platform specific and may depend
on platform configuration.
@z

@x
```yml
userns_mode: "host"
```
@y
```yml
userns_mode: "host"
```
@z

@x
### uts
@y
### uts
@z

@x
{{< introduced compose 2.15.1 "/manuals/compose/release-notes.md#2151" >}}
@y
{{< introduced compose 2.15.1 "/manuals/compose/release-notes.md#2151" >}}
@z

@x
`uts` configures the UTS namespace mode set for the service container. When unspecified
it is the runtime's decision to assign a UTS namespace, if supported. Available values are:
@y
`uts` configures the UTS namespace mode set for the service container. When unspecified
it is the runtime's decision to assign a UTS namespace, if supported. Available values are:
@z

@x
- `'host'`: Results in the container using the same UTS namespace as the host.
@y
- `'host'`: Results in the container using the same UTS namespace as the host.
@z

@x
```yml
    uts: "host"
```
@y
```yml
    uts: "host"
```
@z

@x
### volumes
@y
### volumes
@z

@x
{{< include "compose/services-volumes.md" >}}
@y
{{< include "compose/services-volumes.md" >}}
@z

@x
The following example shows a named volume (`db-data`) being used by the `backend` service,
and a bind mount defined for a single service.
@y
The following example shows a named volume (`db-data`) being used by the `backend` service,
and a bind mount defined for a single service.
@z

@x
```yml
services:
  backend:
    image: example/backend
    volumes:
      - type: volume
        source: db-data
        target: /data
        volume:
          nocopy: true
          subpath: sub
      - type: bind
        source: /var/run/postgres/postgres.sock
        target: /var/run/postgres/postgres.sock
@y
```yml
services:
  backend:
    image: example/backend
    volumes:
      - type: volume
        source: db-data
        target: /data
        volume:
          nocopy: true
          subpath: sub
      - type: bind
        source: /var/run/postgres/postgres.sock
        target: /var/run/postgres/postgres.sock
@z

@x
volumes:
  db-data:
```
@y
volumes:
  db-data:
```
@z

@x
For more information about the `volumes` top-level element, see [Volumes](volumes.md).
@y
For more information about the `volumes` top-level element, see [Volumes](volumes.md).
@z

@x
#### Short syntax
@y
#### Short syntax
@z

@x
The short syntax uses a single string with colon-separated values to specify a volume mount
(`VOLUME:CONTAINER_PATH`), or an access mode (`VOLUME:CONTAINER_PATH:ACCESS_MODE`).
@y
The short syntax uses a single string with colon-separated values to specify a volume mount
(`VOLUME:CONTAINER_PATH`), or an access mode (`VOLUME:CONTAINER_PATH:ACCESS_MODE`).
@z

@x
- `VOLUME`: Can be either a host path on the platform hosting containers (bind mount) or a volume name.
- `CONTAINER_PATH`: The path in the container where the volume is mounted.
- `ACCESS_MODE`: A comma-separated `,` list of options:
  - `rw`: Read and write access. This is the default if none is specified.
  - `ro`: Read-only access.
  - `z`: SELinux option indicating that the bind mount host content is shared among multiple containers.
  - `Z`: SELinux option indicating that the bind mount host content is private and unshared for other containers.
@y
- `VOLUME`: Can be either a host path on the platform hosting containers (bind mount) or a volume name.
- `CONTAINER_PATH`: The path in the container where the volume is mounted.
- `ACCESS_MODE`: A comma-separated `,` list of options:
  - `rw`: Read and write access. This is the default if none is specified.
  - `ro`: Read-only access.
  - `z`: SELinux option indicating that the bind mount host content is shared among multiple containers.
  - `Z`: SELinux option indicating that the bind mount host content is private and unshared for other containers.
@z

@x
> [!NOTE]
>
> The SELinux re-labeling bind mount option is ignored on platforms without SELinux.
@y
> [!NOTE]
>
> The SELinux re-labeling bind mount option is ignored on platforms without SELinux.
@z

@x
> [!NOTE]
> Relative host paths are only supported by Compose that deploy to a
> local container runtime. This is because the relative path is resolved from the Compose file’s parent
> directory which is only applicable in the local case. When Compose deploys to a non-local
> platform it rejects Compose files which use relative host paths with an error. To avoid ambiguities
> with named volumes, relative paths should always begin with `.` or `..`.
@y
> [!NOTE]
> Relative host paths are only supported by Compose that deploy to a
> local container runtime. This is because the relative path is resolved from the Compose file’s parent
> directory which is only applicable in the local case. When Compose deploys to a non-local
> platform it rejects Compose files which use relative host paths with an error. To avoid ambiguities
> with named volumes, relative paths should always begin with `.` or `..`.
@z

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
- `type`: The mount type. Either `volume`, `bind`, `tmpfs`, `npipe`, or `cluster`
- `source`: The source of the mount, a path on the host for a bind mount, or the
  name of a volume defined in the
  [top-level `volumes` key](volumes.md). Not applicable for a tmpfs mount.
- `target`: The path in the container where the volume is mounted.
- `read_only`: Flag to set the volume as read-only.
- `bind`: Used to configure additional bind options:
  - `propagation`: The propagation mode used for the bind.
  - `create_host_path`: Creates a directory at the source path on host if there is nothing present.
    Compose does nothing if there is something present at the path. This is automatically implied by short syntax
    for backward compatibility with `docker-compose` legacy.
  - `selinux`: The SELinux re-labeling option `z` (shared) or `Z` (private)
- `volume`: Configures additional volume options:
  - `nocopy`: Flag to disable copying of data from a container when a volume is created.
  - `subpath`: Path inside a volume to mount instead of the volume root.
- `tmpfs`: Configures additional tmpfs options:
  - `size`: The size for the tmpfs mount in bytes (either numeric or as bytes unit).
  - `mode`: The file mode for the tmpfs mount as Unix permission bits as an octal number. Introduced in Docker Compose version [2.14.0](/manuals/compose/release-notes.md#2260).
- `consistency`: The consistency requirements of the mount. Available values are platform specific.
@y
- `type`: The mount type. Either `volume`, `bind`, `tmpfs`, `npipe`, or `cluster`
- `source`: The source of the mount, a path on the host for a bind mount, or the
  name of a volume defined in the
  [top-level `volumes` key](volumes.md). Not applicable for a tmpfs mount.
- `target`: The path in the container where the volume is mounted.
- `read_only`: Flag to set the volume as read-only.
- `bind`: Used to configure additional bind options:
  - `propagation`: The propagation mode used for the bind.
  - `create_host_path`: Creates a directory at the source path on host if there is nothing present.
    Compose does nothing if there is something present at the path. This is automatically implied by short syntax
    for backward compatibility with `docker-compose` legacy.
  - `selinux`: The SELinux re-labeling option `z` (shared) or `Z` (private)
- `volume`: Configures additional volume options:
  - `nocopy`: Flag to disable copying of data from a container when a volume is created.
  - `subpath`: Path inside a volume to mount instead of the volume root.
- `tmpfs`: Configures additional tmpfs options:
  - `size`: The size for the tmpfs mount in bytes (either numeric or as bytes unit).
  - `mode`: The file mode for the tmpfs mount as Unix permission bits as an octal number. Introduced in Docker Compose version [2.14.0](manuals/compose/release-notes.md#2260).
- `consistency`: The consistency requirements of the mount. Available values are platform specific.
@z

@x
> [!TIP]
>
> Working with large repositories or monorepos, or with virtual file systems that are no longer scaling with your codebase? 
> Compose now takes advantage of [Synchronized file shares](/manuals/desktop/synchronized-file-sharing.md) and automatically creates file shares for bind mounts. 
> Ensure you're signed in to Docker with a paid subscription and have enabled both **Access experimental features** and **Manage Synchronized file shares with Compose** in Docker Desktop's settings.
@y
> [!TIP]
>
> Working with large repositories or monorepos, or with virtual file systems that are no longer scaling with your codebase? 
> Compose now takes advantage of [Synchronized file shares](manuals/desktop/synchronized-file-sharing.md) and automatically creates file shares for bind mounts. 
> Ensure you're signed in to Docker with a paid subscription and have enabled both **Access experimental features** and **Manage Synchronized file shares with Compose** in Docker Desktop's settings.
@z

@x
### volumes_from
@y
### volumes_from
@z

@x
`volumes_from` mounts all of the volumes from another service or container. You can optionally specify
read-only access `ro` or read-write `rw`. If no access level is specified, then read-write access is used.
@y
`volumes_from` mounts all of the volumes from another service or container. You can optionally specify
read-only access `ro` or read-write `rw`. If no access level is specified, then read-write access is used.
@z

@x
You can also mount volumes from a container that is not managed by Compose by using the `container:` prefix.
@y
You can also mount volumes from a container that is not managed by Compose by using the `container:` prefix.
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
### working_dir
@y
### working_dir
@z

@x
`working_dir` overrides the container's working directory which is specified by the image, for example Dockerfile's `WORKDIR`.
@y
`working_dir` overrides the container's working directory which is specified by the image, for example Dockerfile's `WORKDIR`.
@z
