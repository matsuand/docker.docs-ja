%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Container specification
description: Explore all the container attributes shared by services, jobs, and pre_start init containers.
keywords: compose, compose specification, container, services, jobs, compose file reference
@y
title: Container specification
description: Explore all the container attributes shared by services, jobs, and pre_start init containers.
keywords: compose, compose specification, container, services, jobs, compose file reference
@z

@x
A container specification defines the runtime configuration of a single container. It's the
common set of attributes shared by anything that runs a container: [services](services.md),
[jobs](jobs.md), and the init containers that [`pre_start`](services.md#pre_start) declares.
@y
A container specification defines the runtime configuration of a single container. It's the
common set of attributes shared by anything that runs a container: [services](services.md),
[jobs](jobs.md), and the init containers that [`pre_start`](services.md#pre_start) declares.
@z

@x
Attributes that only apply to an orchestrated workload, such as `build`, `ports`, and
`healthcheck`, aren't part of the container specification. The
[workload specification](workload-spec.md) defines them.
@y
Attributes that only apply to an orchestrated workload, such as `build`, `ports`, and
`healthcheck`, aren't part of the container specification. The
[workload specification](workload-spec.md) defines them.
@z

@x
## Attributes
@y
## Attributes
@z

@x
<!-- vale off(Docker.HeadingSentenceCase.yml) -->
@y
<!-- vale off(Docker.HeadingSentenceCase.yml) -->
@z

@x
### `annotations`
@y
### `annotations`
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
### `blkio_config`
@y
### `blkio_config`
@z

@x
`blkio_config` defines a set of configuration options to set block I/O limits for a service.
@y
`blkio_config` defines a set of configuration options to set block I/O limits for a service.
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
#### `device_read_bps`, `device_write_bps`
@y
#### `device_read_bps`, `device_write_bps`
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
#### `device_read_iops`, `device_write_iops`
@y
#### `device_read_iops`, `device_write_iops`
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
#### `weight`
@y
#### `weight`
@z

@x
Modify the proportion of bandwidth allocated to a service relative to other services.
Takes an integer value between 10 and 1000, with 500 being the default.
@y
Modify the proportion of bandwidth allocated to a service relative to other services.
Takes an integer value between 10 and 1000, with 500 being the default.
@z

@x
#### `weight_device`
@y
#### `weight_device`
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
### `cpu_count`
@y
### `cpu_count`
@z

@x
`cpu_count` defines the number of usable CPUs for service container.
@y
`cpu_count` defines the number of usable CPUs for service container.
@z

@x
### `cpu_percent`
@y
### `cpu_percent`
@z

@x
`cpu_percent` defines the usable percentage of the available CPUs.
@y
`cpu_percent` defines the usable percentage of the available CPUs.
@z

@x
### `cpu_shares`
@y
### `cpu_shares`
@z

@x
`cpu_shares` defines, as integer value, a service container's relative CPU weight versus other containers.
@y
`cpu_shares` defines, as integer value, a service container's relative CPU weight versus other containers.
@z

@x
### `cpu_period`
@y
### `cpu_period`
@z

@x
`cpu_period` configures CPU CFS (Completely Fair Scheduler) period when a platform is based
on Linux kernel.
@y
`cpu_period` configures CPU CFS (Completely Fair Scheduler) period when a platform is based
on Linux kernel.
@z

@x
### `cpu_quota`
@y
### `cpu_quota`
@z

@x
`cpu_quota` configures CPU CFS (Completely Fair Scheduler) quota when a platform is based
on Linux kernel.
@y
`cpu_quota` configures CPU CFS (Completely Fair Scheduler) quota when a platform is based
on Linux kernel.
@z

@x
### `cpu_rt_runtime`
@y
### `cpu_rt_runtime`
@z

@x
`cpu_rt_runtime` configures CPU allocation parameters for platforms with support for real-time scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@y
`cpu_rt_runtime` configures CPU allocation parameters for platforms with support for real-time scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@z

@x
```yml
 cpu_rt_runtime: '400ms'
 cpu_rt_runtime: '95000'
```
@y
```yml
 cpu_rt_runtime: '400ms'
 cpu_rt_runtime: '95000'
```
@z

@x
### `cpu_rt_period`
@y
### `cpu_rt_period`
@z

@x
`cpu_rt_period` configures CPU allocation parameters for platforms with support for real-time scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@y
`cpu_rt_period` configures CPU allocation parameters for platforms with support for real-time scheduler. It can be either
an integer value using microseconds as unit or a [duration](extension.md#specifying-durations).
@z

@x
```yml
 cpu_rt_period: '1400us'
 cpu_rt_period: '11000'
```
@y
```yml
 cpu_rt_period: '1400us'
 cpu_rt_period: '11000'
```
@z

@x
### `cpus`
@y
### `cpus`
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
### `cpuset`
@y
### `cpuset`
@z

@x
`cpuset` defines the explicit CPUs in which to permit execution. Can be a range `0-3` or a list `0,1`
@y
`cpuset` defines the explicit CPUs in which to permit execution. Can be a range `0-3` or a list `0,1`
@z

@x
### `cap_add`
@y
### `cap_add`
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
### `cap_drop`
@y
### `cap_drop`
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
### `cgroup`
@y
### `cgroup`
@z

@x
{{< summary-bar feature_name="Compose cgroup" >}}
@y
{{< summary-bar feature_name="Compose cgroup" >}}
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
### `cgroup_parent`
@y
### `cgroup_parent`
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
### `command`
@y
### `command`
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
If the value is `null`, the default command from the image is used.
@y
If the value is `null`, the default command from the image is used.
@z

@x
If the value is `[]` (empty list) or `''` (empty string), the default command declared by the image is ignored, or in other words overridden to be empty.
@y
If the value is `[]` (empty list) or `''` (empty string), the default command declared by the image is ignored, or in other words overridden to be empty.
@z

@x
> [!NOTE]
>
> Unlike the `CMD` instruction in a Dockerfile, the `command` field doesn't automatically run within the context of the [`SHELL`](/reference/dockerfile.md#shell-form) instruction defined in the image. If your `command` relies on shell-specific features, such as environment variable expansion, you need to explicitly run it within a shell. For example:
>
> ```yaml
> command: /bin/sh -c 'echo "hello $$HOSTNAME"'
> ```
@y
> [!NOTE]
>
> Unlike the `CMD` instruction in a Dockerfile, the `command` field doesn't automatically run within the context of the [`SHELL`](reference/dockerfile.md#shell-form) instruction defined in the image. If your `command` relies on shell-specific features, such as environment variable expansion, you need to explicitly run it within a shell. For example:
>
> ```yaml
> command: /bin/sh -c 'echo "hello $$HOSTNAME"'
> ```
@z

@x
The value can also be a list, similar to the [exec-form syntax](/reference/dockerfile.md#exec-form)
used by the [Dockerfile](/reference/dockerfile.md#exec-form).
@y
The value can also be a list, similar to the [exec-form syntax](reference/dockerfile.md#exec-form)
used by the [Dockerfile](reference/dockerfile.md#exec-form).
@z

@x
### `configs`
@y
### `configs`
@z

@x
`configs` let services adapt their behaviour without the need to rebuild a Docker image.
Services can only access configs when explicitly granted by the `configs` attribute. Two different syntax variants are supported.
@y
`configs` let services adapt their behaviour without the need to rebuild a Docker image.
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
- `uid` and `gid`: The numeric uid or gid that owns the mounted config file
  within the service's task containers.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file that is mounted within the service's
  task containers, in octal notation. Default value is world-readable (`0444`).
  Writable bit must be ignored. The executable bit can be set.
@y
- `source`: The name of the config as it exists in the platform.
- `target`: The path and name of the file to be mounted in the service's
  task containers. Defaults to `/<source>` if not specified.
- `uid` and `gid`: The numeric uid or gid that owns the mounted config file
  within the service's task containers.
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
### `credential_spec`
@y
### `credential_spec`
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
```bash
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs
```
@y
```bash
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers\CredentialSpecs
```
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
    file: ./my-credential-spec.json
```
@y
configs:
  my_credentials_spec:
    file: ./my-credential-spec.json
```
@z

@x
### `device_cgroup_rules`
@y
### `device_cgroup_rules`
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
### `devices`
@y
### `devices`
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
`devices` can also rely on the [CDI](https://github.com/cncf-tags/container-device-interface) syntax to let the container runtime select a device:
@y
`devices` can also rely on the [CDI](https://github.com/cncf-tags/container-device-interface) syntax to let the container runtime select a device:
@z

@x
```yml
devices:
  - "vendor1.com/device=gpu"
```
@y
```yml
devices:
  - "vendor1.com/device=gpu"
```
@z

@x
### `dns`
@y
### `dns`
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
### `dns_opt`
@y
### `dns_opt`
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
### `dns_search`
@y
### `dns_search`
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
### `domainname`
@y
### `domainname`
@z

@x
`domainname` declares a custom domain name to use for the service container. It must be a valid RFC 1123 hostname.
@y
`domainname` declares a custom domain name to use for the service container. It must be a valid RFC 1123 hostname.
@z

@x
### `driver_opts`
@y
### `driver_opts`
@z

@x
{{< summary-bar feature_name="Compose driver opts" >}}
@y
{{< summary-bar feature_name="Compose driver opts" >}}
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
### `entrypoint`
@y
### `entrypoint`
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
If the value is `[]` (empty list) or `''` (empty string), the default entrypoint declared by the image is ignored, or in other words, overridden to be empty.
@y
If the value is `[]` (empty list) or `''` (empty string), the default entrypoint declared by the image is ignored, or in other words, overridden to be empty.
@z

@x
### `env_file`
@y
### `env_file`
@z

@x
{{% include "compose/services-env-file.md" %}}
@y
{{% include "compose/services-env-file.md" %}}
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
Relative paths are resolved from the Compose file's parent folder. As absolute paths prevent the Compose
file from being portable, Compose warns you when such a path is used to set `env_file`.
@y
Relative paths are resolved from the Compose file's parent folder. As absolute paths prevent the Compose
file from being portable, Compose warns you when such a path is used to set `env_file`.
@z

@x
Environment variables declared in the [`environment`](#environment) section override these values. This holds true even if those values are
empty or undefined.
@y
Environment variables declared in the [`environment`](#environment) section override these values. This holds true even if those values are
empty or undefined.
@z

@x
`env_file` can also be a list. The files in the list are processed from the top down. For the same variable
specified in two environment files, the value from the last file in the list stands.
@y
`env_file` can also be a list. The files in the list are processed from the top down. For the same variable
specified in two environment files, the value from the last file in the list stands.
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
List elements can also be declared as a mapping, which then lets you set additional
attributes.
@y
List elements can also be declared as a mapping, which then lets you set additional
attributes.
@z

@x
#### `required`
@y
#### `required`
@z

@x
{{< summary-bar feature_name="Compose required" >}}
@y
{{< summary-bar feature_name="Compose required" >}}
@z

@x
The `required` attribute defaults to `true`. When `required` is set to `false` and the `.env` file is missing, Compose silently ignores the entry.
@y
The `required` attribute defaults to `true`. When `required` is set to `false` and the `.env` file is missing, Compose silently ignores the entry.
@z

@x
```yml
env_file:
  - path: ./default.env
    required: true # default
  - path: ./override.env
    required: false
```
@y
```yml
env_file:
  - path: ./default.env
    required: true # default
  - path: ./override.env
    required: false
```
@z

@x
#### `format`
@y
#### `format`
@z

@x
{{< summary-bar feature_name="Compose format" >}}
@y
{{< summary-bar feature_name="Compose format" >}}
@z

@x
The `format` attribute lets you use an alternative file format for the `env_file`. When not set, `env_file` is parsed according to the Compose rules outlined in [`Env_file` format](#env_file-format).
@y
The `format` attribute lets you use an alternative file format for the `env_file`. When not set, `env_file` is parsed according to the Compose rules outlined in [`Env_file` format](#env_file-format).
@z

@x
`raw` format lets you use an `env_file` with key=value items, but without any attempt from Compose to parse the value for interpolation.
This let you pass values as-is, including quotes and `$` signs.
@y
`raw` format lets you use an `env_file` with key=value items, but without any attempt from Compose to parse the value for interpolation.
This let you pass values as-is, including quotes and `$` signs.
@z

@x
```yml
env_file:
  - path: ./default.env
    format: raw
```
@y
```yml
env_file:
  - path: ./default.env
    format: raw
```
@z

@x
#### `Env_file` format
@y
#### `Env_file` format
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
- Delimiter separating key and value can be either `=` or `:`.
- Spaces before and after value are ignored.
  - `VAR=VAL` -> `VAL`
  - `VAR="VAL"` -> `VAL`
  - `VAR='VAL'` -> `VAL`
  - `VAR: VAL` -> `VAL`
  - `VAR = VAL  ` -> `VAL` <!-- markdownlint-disable-line no-space-in-code -->
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
- Delimiter separating key and value can be either `=` or `:`.
- Spaces before and after value are ignored.
  - `VAR=VAL` -> `VAL`
  - `VAR="VAL"` -> `VAL`
  - `VAR='VAL'` -> `VAL`
  - `VAR: VAL` -> `VAL`
  - `VAR = VAL  ` -> `VAL` <!-- markdownlint-disable-line no-space-in-code -->
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
### `environment`
@y
### `environment`
@z

@x
{{% include "compose/services-environment.md" %}}
@y
{{% include "compose/services-environment.md" %}}
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
### `extra_hosts`
@y
### `extra_hosts`
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
The separator `=` is preferred, but `:` can also be used. Introduced in Docker Compose version [2.24.1](https://github.com/docker/compose/releases/tag/v2.24.1). For example:
@y
The separator `=` is preferred, but `:` can also be used. Introduced in Docker Compose version [2.24.1](https://github.com/docker/compose/releases/tag/v2.24.1). For example:
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
### `gpus`
@y
### `gpus`
@z

@x
{{< summary-bar feature_name="Compose gpus" >}}
@y
{{< summary-bar feature_name="Compose gpus" >}}
@z

@x
`gpus` specifies GPU devices to be allocated for container usage. This is equivalent to a [device request](deploy.md#devices) with
an implicit `gpu` capability.
@y
`gpus` specifies GPU devices to be allocated for container usage. This is equivalent to a [device request](deploy.md#devices) with
an implicit `gpu` capability.
@z

@x
```yaml
services:
  model:
    gpus:
      - driver: 3dfx
        count: 2
```
@y
```yaml
services:
  model:
    gpus:
      - driver: 3dfx
        count: 2
```
@z

@x
`gpus` also can be set as string `all` to allocate all available GPU devices to the container.
@y
`gpus` also can be set as string `all` to allocate all available GPU devices to the container.
@z

@x
```yaml
services:
  model:
    gpus: all
```
@y
```yaml
services:
  model:
    gpus: all
```
@z

@x
### `group_add`
@y
### `group_add`
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
### `hostname`
@y
### `hostname`
@z

@x
`hostname` declares a custom host name to use for the service container. It must be a valid RFC 1123 hostname.
@y
`hostname` declares a custom host name to use for the service container. It must be a valid RFC 1123 hostname.
@z

@x
### `image`
@y
### `image`
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
### `init`
@y
### `init`
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
### `ipc`
@y
### `ipc`
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
### `isolation`
@y
### `isolation`
@z

@x
`isolation` specifies a container’s isolation technology. Supported values are platform specific.
@y
`isolation` specifies a container’s isolation technology. Supported values are platform specific.
@z

@x
### `labels`
@y
### `labels`
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
### `label_file`
@y
### `label_file`
@z

@x
{{< summary-bar feature_name="Compose label file" >}}
@y
{{< summary-bar feature_name="Compose label file" >}}
@z

@x
The `label_file` attribute lets you load labels for a service from an external file or a list of files. This provides a convenient way to manage multiple labels without cluttering the Compose file.
@y
The `label_file` attribute lets you load labels for a service from an external file or a list of files. This provides a convenient way to manage multiple labels without cluttering the Compose file.
@z

@x
The file uses a key-value format, similar to `env_file`. You can specify multiple files as a list. When using multiple files, they are processed in the order they appear in the list. If the same label is defined in multiple files, the value from the last file in the list overrides earlier ones.
@y
The file uses a key-value format, similar to `env_file`. You can specify multiple files as a list. When using multiple files, they are processed in the order they appear in the list. If the same label is defined in multiple files, the value from the last file in the list overrides earlier ones.
@z

@x
```yaml
services:
  one:
    label_file: ./app.labels
@y
```yaml
services:
  one:
    label_file: ./app.labels
@z

@x
  two:
    label_file:
      - ./app.labels
      - ./additional.labels
```
@y
  two:
    label_file:
      - ./app.labels
      - ./additional.labels
```
@z

@x
If a label is defined in both the `label_file` and the `labels` attribute, the value in [labels](#labels) takes precedence.
@y
If a label is defined in both the `label_file` and the `labels` attribute, the value in [labels](#labels) takes precedence.
@z

@x
### `logging`
@y
### `logging`
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
### `mac_address`
@y
### `mac_address`
@z

@x
> Available with Docker Compose version 2.24.0 and later.
@y
> Available with Docker Compose version 2.24.0 and later.
@z

@x
`mac_address` sets a Mac address for the service container.
@y
`mac_address` sets a Mac address for the service container.
@z

@x
> [!NOTE]
> Container runtimes might reject this value, for example Docker Engine >= v25.0. In that case, you should use [networks.mac_address](#mac_address) instead.
@y
> [!NOTE]
> Container runtimes might reject this value, for example Docker Engine >= v25.0. In that case, you should use [networks.mac_address](#mac_address) instead.
@z

@x
### `mem_limit`
@y
### `mem_limit`
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
### `mem_reservation`
@y
### `mem_reservation`
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
### `mem_swappiness`
@y
### `mem_swappiness`
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
### `memswap_limit`
@y
### `memswap_limit`
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
- If `memswap_limit` is unset, and `memory` is set, the container can use as much swap as the `memory` setting, if the host has swap memory configured. For instance, if `memory`="300m" and `memswap_limit` is not set, the container can use 600m in total of memory and swap.
- If `memswap_limit` is explicitly set to -1, the container is allowed to use unlimited swap, up to the amount available on the host system.
@y
- If `memswap_limit` is set to a positive integer, then both `memory` and `memswap_limit` must be set. `memswap_limit` represents the total amount of memory and swap that can be used, and `memory` controls the amount used by non-swap memory. So if `memory`="300m" and `memswap_limit`="1g", the container can use 300m of memory and 700m (1g - 300m) swap.
- If `memswap_limit` is set to 0, the setting is ignored, and the value is treated as unset.
- If `memswap_limit` is set to the same value as `memory`, and `memory` is set to a positive integer, the container does not have access to swap.
- If `memswap_limit` is unset, and `memory` is set, the container can use as much swap as the `memory` setting, if the host has swap memory configured. For instance, if `memory`="300m" and `memswap_limit` is not set, the container can use 600m in total of memory and swap.
- If `memswap_limit` is explicitly set to -1, the container is allowed to use unlimited swap, up to the amount available on the host system.
@z

@x
### `models`
@y
### `models`
@z

@x
{{< summary-bar feature_name="Compose models" >}}
@y
{{< summary-bar feature_name="Compose models" >}}
@z

@x
`models` defines which AI models the service should use at runtime. Each referenced model must be defined under the [`models` top-level element](models.md).
@y
`models` defines which AI models the service should use at runtime. Each referenced model must be defined under the [`models` top-level element](models.md).
@z

@x
```yaml
services:
  short_syntax:
    image: app
    models:
      - my_model
  long_syntax:
    image: app
    models:
      my_model:
        endpoint_var: MODEL_URL
        model_var: MODEL
```
@y
```yaml
services:
  short_syntax:
    image: app
    models:
      - my_model
  long_syntax:
    image: app
    models:
      my_model:
        endpoint_var: MODEL_URL
        model_var: MODEL
```
@z

@x
When a service is linked to a model, Docker Compose injects environment variables to pass connection details and model identifiers to the container. This allows the application to locate and communicate with the model dynamically at runtime, without hard-coding values.
@y
When a service is linked to a model, Docker Compose injects environment variables to pass connection details and model identifiers to the container. This allows the application to locate and communicate with the model dynamically at runtime, without hard-coding values.
@z

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long syntax gives you more control over the environment variable names.
@y
The long syntax gives you more control over the environment variable names.
@z

@x
- `endpoint_var` sets the name of the environment variable that holds the model runner’s URL.
- `model_var` sets the name of the environment variable that holds the model identifier.
@y
- `endpoint_var` sets the name of the environment variable that holds the model runner’s URL.
- `model_var` sets the name of the environment variable that holds the model identifier.
@z

@x
If either is omitted, Compose automatically generates the environment variable names based on the model key using the following rules:
@y
If either is omitted, Compose automatically generates the environment variable names based on the model key using the following rules:
@z

@x
 - Convert the model key to uppercase
 - Replace any '-' characters with '_'
 - Append `_URL` for the endpoint variable
@y
 - Convert the model key to uppercase
 - Replace any '-' characters with '_'
 - Append `_URL` for the endpoint variable
@z

@x
### `network_mode`
@y
### `network_mode`
@z

@x
`network_mode` sets a service container's network mode.
@y
`network_mode` sets a service container's network mode.
@z

@x
- `bridge`: Connects the container to Docker's default bridge network instead of
  a project-specific network. Containers on the default bridge network cannot
  resolve each other by service name . Instead, use a user-defined network for DNS resolution.
- `none`: Turns off all container networking.
- `host`: Gives the container raw access to the host's network interface.
- `service:{name}`: Gives the container access to the specified container by referring to its service name.
- `container:{name}`: Gives the container access to the specified container by referring to its container ID.
@y
- `bridge`: Connects the container to Docker's default bridge network instead of
  a project-specific network. Containers on the default bridge network cannot
  resolve each other by service name . Instead, use a user-defined network for DNS resolution.
- `none`: Turns off all container networking.
- `host`: Gives the container raw access to the host's network interface.
- `service:{name}`: Gives the container access to the specified container by referring to its service name.
- `container:{name}`: Gives the container access to the specified container by referring to its container ID.
@z

@x
For more information container networks, see the [Docker Engine documentation](/manuals/engine/network/_index.md#container-networks).
@y
For more information container networks, see the [Docker Engine documentation](manuals/engine/network/_index.md#container-networks).
@z

@x
```yml
    network_mode: "bridge"
    network_mode: "host"
    network_mode: "none"
    network_mode: "service:[service name]"
```
@y
```yml
    network_mode: "bridge"
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
### `networks`
@y
### `networks`
@z

@x
{{% include "compose/services-networks.md" %}}
@y
{{% include "compose/services-networks.md" %}}
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
#### Implicit default network
@y
#### Implicit default network
@z

@x
If `networks` is empty or absent from the Compose file, Compose considers an implicit definition for the service to be
connected to the `default` network:
@y
If `networks` is empty or absent from the Compose file, Compose considers an implicit definition for the service to be
connected to the `default` network:
@z

@x
```yml
services:
  some-service:
    image: foo
```
This example is actually equivalent to:
@y
```yml
services:
  some-service:
    image: foo
```
This example is actually equivalent to:
@z

@x
```yml
services:
  some-service:
    image: foo
    networks:
      default: {}
```
@y
```yml
services:
  some-service:
    image: foo
    networks:
      default: {}
```
@z

@x
If you want the service to not be connected a network, you must set [`network_mode: none`](#network_mode).
@y
If you want the service to not be connected a network, you must set [`network_mode: none`](#network_mode).
@z

@x
#### `aliases`
@y
#### `aliases`
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
  front-tier: {}
  back-tier: {}
  admin: {}
```
@y
networks:
  front-tier: {}
  back-tier: {}
  admin: {}
```
@z

@x
#### use_service_name_alias
@y
#### use_service_name_alias
@z

@x
{{< summary-bar feature_name="Compose use service name alias" >}}
@y
{{< summary-bar feature_name="Compose use service name alias" >}}
@z

@x
`use_service_name_alias` controls whether the service name is registered as an alias of the service's containers
on the network. It defaults to `true`. It requires the long syntax of `networks`.
@y
`use_service_name_alias` controls whether the service name is registered as an alias of the service's containers
on the network. It defaults to `true`. It requires the long syntax of `networks`.
@z

@x
When set to `false`, the service name is not an alias on this network. The values listed in
[`aliases`](#aliases) are not affected, and neither are the other networks of the service.
@y
When set to `false`, the service name is not an alias on this network. The values listed in
[`aliases`](#aliases) are not affected, and neither are the other networks of the service.
@z

@x
You must distinguish an unset value from `false`, so that a Compose file merged on top of another
can set the attribute back to `true`.
@y
You must distinguish an unset value from `false`, so that a Compose file merged on top of another
can set the attribute back to `true`.
@z

@x
This is useful when a network is shared by several Compose applications that each define a service with the
same name: the name would otherwise resolve to a container of any of them. Give each service a distinct
alias instead:
@y
This is useful when a network is shared by several Compose applications that each define a service with the
same name: the name would otherwise resolve to a container of any of them. Give each service a distinct
alias instead:
@z

@x
```yml
networks:
  shared:
    external: true
@y
```yml
networks:
  shared:
    external: true
@z

@x
services:
  database:
    networks:
      shared:
        aliases:
          - project1-database
        use_service_name_alias: false
```
@y
services:
  database:
    networks:
      shared:
        aliases:
          - project1-database
        use_service_name_alias: false
```
@z

@x
If the service is attached to no other network where its name is registered, other services can no longer
reach it by service name. Use `aliases` to give it a name on that network. [`links`](services.md#links)
are not affected.
@y
If the service is attached to no other network where its name is registered, other services can no longer
reach it by service name. Use `aliases` to give it a name on that network. [`links`](services.md#links)
are not affected.
@z

@x
> [!NOTE]
>
> `use_service_name_alias` only affects name resolution. It does not isolate the network. Containers attached
> to it can still reach the service by IP address or by any of its aliases.
@y
> [!NOTE]
>
> `use_service_name_alias` only affects name resolution. It does not isolate the network. Containers attached
> to it can still reach the service by IP address or by any of its aliases.
@z

@x
#### `interface_name`
@y
#### `interface_name`
@z

@x
{{< summary-bar feature_name="Compose interface-name" >}}
@y
{{< summary-bar feature_name="Compose interface-name" >}}
@z

@x
`interface_name` lets you specify the name of the network interface used to connect a service to a given network. This ensures consistent and predictable interface naming across services and networks.
@y
`interface_name` lets you specify the name of the network interface used to connect a service to a given network. This ensures consistent and predictable interface naming across services and networks.
@z

@x
```yaml
services:
  backend:
    image: alpine
    command: ip link show
    networks:
      back-tier:
        interface_name: eth0
```
@y
```yaml
services:
  backend:
    image: alpine
    command: ip link show
    networks:
      back-tier:
        interface_name: eth0
```
@z

@x
Running the example Compose application shows:
@y
Running the example Compose application shows:
@z

@x
```console
backend-1  | 11: eth0@if64: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
```
@y
```console
backend-1  | 11: eth0@if64: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP
```
@z

@x
#### `ipv4_address`, `ipv6_address`
@y
#### `ipv4_address`, `ipv6_address`
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
#### `link_local_ips`
@y
#### `link_local_ips`
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
#### `mac_address`
@y
#### `mac_address`
@z

@x
{{< summary-bar feature_name="Compose mac address" >}}
@y
{{< summary-bar feature_name="Compose mac address" >}}
@z

@x
`mac_address` sets the Mac address used by the service container when connecting to this particular network.
@y
`mac_address` sets the Mac address used by the service container when connecting to this particular network.
@z

@x
#### `driver_opts`
@y
#### `driver_opts`
@z

@x
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent. Consult the driver's documentation for more information.
@y
`driver_opts` specifies a list of options as key-value pairs to pass to the driver. These options are
driver-dependent. Consult the driver's documentation for more information.
@z

@x
```yml
services:
  app:
    networks:
      app_net:
        driver_opts:
          foo: "bar"
          baz: 1
```
@y
```yml
services:
  app:
    networks:
      app_net:
        driver_opts:
          foo: "bar"
          baz: 1
```
@z

@x
#### `gw_priority`
@y
#### `gw_priority`
@z

@x
{{< summary-bar feature_name="Compose gw priority" >}}
@y
{{< summary-bar feature_name="Compose gw priority" >}}
@z

@x
The network with the highest `gw_priority` is selected as the default gateway for the service container.
If unspecified, the default value is 0.
@y
The network with the highest `gw_priority` is selected as the default gateway for the service container.
If unspecified, the default value is 0.
@z

@x
In the following example, `app_net_2` will be selected as the default gateway.
@y
In the following example, `app_net_2` will be selected as the default gateway.
@z

@x
```yaml
services:
  app:
    image: busybox
    command: top
    networks:
      app_net_1:
      app_net_2:
        gw_priority: 1
      app_net_3:
networks:
  app_net_1:
  app_net_2:
  app_net_3:
```
@y
```yaml
services:
  app:
    image: busybox
    command: top
    networks:
      app_net_1:
      app_net_2:
        gw_priority: 1
      app_net_3:
networks:
  app_net_1:
  app_net_2:
  app_net_3:
```
@z

@x
#### `priority`
@y
#### `priority`
@z

@x
`priority` indicates in which order Compose connects the service’s containers to its
networks. If unspecified, the default value is 0.
@y
`priority` indicates in which order Compose connects the service’s containers to its
networks. If unspecified, the default value is 0.
@z

@x
If the container runtime accepts a `mac_address` attribute at service level, it is
applied to the network with the highest `priority`. In other cases, use attribute
`networks.mac_address`.
@y
If the container runtime accepts a `mac_address` attribute at service level, it is
applied to the network with the highest `priority`. In other cases, use attribute
`networks.mac_address`.
@z

@x
`priority` does not affect which network is selected as the default gateway. Use the
[`gw_priority`](#gw_priority) attribute instead.
@y
`priority` does not affect which network is selected as the default gateway. Use the
[`gw_priority`](#gw_priority) attribute instead.
@z

@x
`priority` does not control the order in which networks connections are added to
the container, it cannot be used to determine the device name (`eth0` etc.) in the
container.
@y
`priority` does not control the order in which networks connections are added to
the container, it cannot be used to determine the device name (`eth0` etc.) in the
container.
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
### `oom_kill_disable`
@y
### `oom_kill_disable`
@z

@x
If `oom_kill_disable` is set, Compose configures the platform so it won't kill the container in case
of memory starvation.
@y
If `oom_kill_disable` is set, Compose configures the platform so it won't kill the container in case
of memory starvation.
@z

@x
### `oom_score_adj`
@y
### `oom_score_adj`
@z

@x
`oom_score_adj` tunes the preference for containers to be killed by platform in case of memory starvation. Value must
be within -1000,1000 range.
@y
`oom_score_adj` tunes the preference for containers to be killed by platform in case of memory starvation. Value must
be within -1000,1000 range.
@z

@x
### `pid`
@y
### `pid`
@z

@x
`pid` sets the PID mode for container created by Compose.
Supported values are platform specific.
@y
`pid` sets the PID mode for container created by Compose.
Supported values are platform specific.
@z

@x
### `pids_limit`
@y
### `pids_limit`
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
### `platform`
@y
### `platform`
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
### `privileged`
@y
### `privileged`
@z

@x
`privileged` configures the service container to run with elevated privileges. Support and actual impacts are platform specific.
@y
`privileged` configures the service container to run with elevated privileges. Support and actual impacts are platform specific.
@z

@x
### `pull_policy`
@y
### `pull_policy`
@z

@x
`pull_policy` defines the decisions Compose makes when it starts to pull images. Possible values are:
@y
`pull_policy` defines the decisions Compose makes when it starts to pull images. Possible values are:
@z

@x
- `always`: Compose always pulls the image from the registry.
- `never`: Compose doesn't pull the image from a registry and relies on the platform cached image.
   If there is no cached image, a failure is reported.
- `missing`: Compose pulls the image only if it's not available in the platform cache.
   This is the default option if you are not also using the [Compose Build Specification](build.md).
  `if_not_present` is considered an alias for this value for backward compatibility. The `latest` tag is always pulled even when the `missing` pull policy is used.
- `build`: Compose builds the image. Compose rebuilds the image if it's already present.
- `daily`: Compose checks the registry for image updates if the last pull took place more than 24 hours ago.
- `weekly`: Compose checks the registry for image updates if the last pull took place more than 7 days ago.
- `every_<duration>`: Compose checks the registry for image updates if the last pull took place before `<duration>`. Duration can be expressed in weeks (`w`), days (`d`), hours (`h`), minutes (`m`), seconds (`s`) or a combination of these.
@y
- `always`: Compose always pulls the image from the registry.
- `never`: Compose doesn't pull the image from a registry and relies on the platform cached image.
   If there is no cached image, a failure is reported.
- `missing`: Compose pulls the image only if it's not available in the platform cache.
   This is the default option if you are not also using the [Compose Build Specification](build.md).
  `if_not_present` is considered an alias for this value for backward compatibility. The `latest` tag is always pulled even when the `missing` pull policy is used.
- `build`: Compose builds the image. Compose rebuilds the image if it's already present.
- `daily`: Compose checks the registry for image updates if the last pull took place more than 24 hours ago.
- `weekly`: Compose checks the registry for image updates if the last pull took place more than 7 days ago.
- `every_<duration>`: Compose checks the registry for image updates if the last pull took place before `<duration>`. Duration can be expressed in weeks (`w`), days (`d`), hours (`h`), minutes (`m`), seconds (`s`) or a combination of these.
@z

@x
```yaml
services:
  test:
    image: nginx
    pull_policy: every_12h
```
@y
```yaml
services:
  test:
    image: nginx
    pull_policy: every_12h
```
@z

@x
### `read_only`
@y
### `read_only`
@z

@x
`read_only` configures the service container to be created with a read-only filesystem.
@y
`read_only` configures the service container to be created with a read-only filesystem.
@z

@x
### `runtime`
@y
### `runtime`
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
### `secrets`
@y
### `secrets`
@z

@x
{{% include "compose/services-secrets.md" %}}
@y
{{% include "compose/services-secrets.md" %}}
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
- `uid` and `gid`: The numeric uid or gid that owns the file within
  `/run/secrets/` in the service's task containers.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation.
  The default value is world-readable permissions (mode `0444`).
  The writable bit must be ignored if set. The executable bit may be set.
@y
- `source`: The name of the secret as it exists on the platform.
- `target`: The name of the file to be mounted in `/run/secrets/` in the
  service's task container, or absolute path of the file if an alternate location is required. Defaults to `source` if not specified.
- `uid` and `gid`: The numeric uid or gid that owns the file within
  `/run/secrets/` in the service's task containers.
- `mode`: The [permissions](https://wintelguy.com/permissions-calc.pl) for the file to be mounted in `/run/secrets/`
  in the service's task containers, in octal notation.
  The default value is world-readable permissions (mode `0444`).
  The writable bit must be ignored if set. The executable bit may be set.
@z

@x
Note that support for `uid`, `gid`, and `mode` attributes are only implemented in Docker Compose when the source of the secret is [`environment`](secrets.md). When the source is a [`file`](secrets.md), Compose uses a bind-mount under the hood which doesn't allow `uid` remapping, and these attributes are silently ignored.
@y
Note that support for `uid`, `gid`, and `mode` attributes are only implemented in Docker Compose when the source of the secret is [`environment`](secrets.md). When the source is a [`file`](secrets.md), Compose uses a bind-mount under the hood which doesn't allow `uid` remapping, and these attributes are silently ignored.
@z

@x
The following example sets the name of the `my-token` secret file within the container,
sets the mode to `0440` (group-readable), and sets the user and group to `103`.
The value of `my-token` is read from the `MY_TOKEN` environment variable.
@y
The following example sets the name of the `my-token` secret file within the container,
sets the mode to `0440` (group-readable), and sets the user and group to `103`.
The value of `my-token` is read from the `MY_TOKEN` environment variable.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    secrets:
      - source: my-token
        uid: "103"
        gid: "103"
        mode: 0o440
secrets:
  my-token:
    environment: "MY_TOKEN"
```
@y
```yml
services:
  frontend:
    image: example/webapp
    secrets:
      - source: my-token
        uid: "103"
        gid: "103"
        mode: 0o440
secrets:
  my-token:
    environment: "MY_TOKEN"
```
@z

@x
### `security_opt`
@y
### `security_opt`
@z

@x
`security_opt` overrides the default labeling scheme for each container.
@y
`security_opt` overrides the default labeling scheme for each container.
@z

@x
Options accept either `option=value` or `option:value` syntax. For boolean options
such as `no-new-privileges`, the value may be omitted entirely, in which case the
option is treated as enabled. The following syntaxes are all equivalent:
@y
Options accept either `option=value` or `option:value` syntax. For boolean options
such as `no-new-privileges`, the value may be omitted entirely, in which case the
option is treated as enabled. The following syntaxes are all equivalent:
@z

@x
```yml
security_opt:
  - no-new-privileges
  - no-new-privileges=true
  - no-new-privileges:true
```
@y
```yml
security_opt:
  - no-new-privileges
  - no-new-privileges=true
  - no-new-privileges:true
```
@z

@x
```yml
security_opt:
  - label=user:USER
  - label=role:ROLE
```
@y
```yml
security_opt:
  - label=user:USER
  - label=role:ROLE
```
@z

@x
For further default labeling schemes you can override, see [Security configuration](/reference/cli/docker/container/run/#security-opt).
@y
For further default labeling schemes you can override, see [Security configuration](__SUBDIR__/reference/cli/docker/container/run/#security-opt).
@z

@x
### `shm_size`
@y
### `shm_size`
@z

@x
`shm_size` configures the size of the shared memory (`/dev/shm` partition on Linux) allowed by the service container.
It's specified as a [byte value](extension.md#specifying-byte-values).
@y
`shm_size` configures the size of the shared memory (`/dev/shm` partition on Linux) allowed by the service container.
It's specified as a [byte value](extension.md#specifying-byte-values).
@z

@x
### `stop_grace_period`
@y
### `stop_grace_period`
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
### `stop_signal`
@y
### `stop_signal`
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
### `storage_opt`
@y
### `storage_opt`
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
### `sysctls`
@y
### `sysctls`
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
parameters (sysctls) at runtime](/reference/cli/docker/container/run/#sysctl).
@y
You can only use sysctls that are namespaced in the kernel. Docker does not
support changing sysctls inside a container that also modify the host system.
For an overview of supported sysctls, refer to [configure namespaced kernel
parameters (sysctls) at runtime](__SUBDIR__/reference/cli/docker/container/run/#sysctl).
@z

@x
### `tmpfs`
@y
### `tmpfs`
@z

@x
`tmpfs` mounts a temporary file system inside the container. It can be a single value or a list.
@y
`tmpfs` mounts a temporary file system inside the container. It can be a single value or a list.
@z

@x
```yml
tmpfs:
 - <path>
 - <path>:<options>
```
@y
```yml
tmpfs:
 - <path>
 - <path>:<options>
```
@z

@x
- `path`: The path inside the container where the tmpfs will be mounted.
- `options`: Comma-separated list of options for the tmpfs mount.
@y
- `path`: The path inside the container where the tmpfs will be mounted.
- `options`: Comma-separated list of options for the tmpfs mount.
@z

@x
Available options:
@y
Available options:
@z

@x
- `mode`: Sets the file system permissions.
- `uid`: Sets the user ID that owns the mounted tmpfs.
- `gid`: Sets the group ID that owns the mounted tmpfs.
@y
- `mode`: Sets the file system permissions.
- `uid`: Sets the user ID that owns the mounted tmpfs.
- `gid`: Sets the group ID that owns the mounted tmpfs.
@z

@x
```yml
services:
  app:
    tmpfs:
      - /data:mode=755,uid=1009,gid=1009
      - /run
```
@y
```yml
services:
  app:
    tmpfs:
      - /data:mode=755,uid=1009,gid=1009
      - /run
```
@z

@x
### `ulimits`
@y
### `ulimits`
@z

@x
`ulimits` overrides the default `ulimits` for a container. It's specified either as an integer for a single limit
or as mapping for soft/hard limits.
@y
`ulimits` overrides the default `ulimits` for a container. It's specified either as an integer for a single limit
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
### `use_api_socket`
@y
### `use_api_socket`
@z

@x
When `use_api_socket` is set, the container is able to interact with the underlying container engine through the API socket.
Your credentials are mounted inside the container so the container acts as a pure delegate for your commands relating to the container engine.
Typically, commands ran by container can `pull` and `push` to your registry.
@y
When `use_api_socket` is set, the container is able to interact with the underlying container engine through the API socket.
Your credentials are mounted inside the container so the container acts as a pure delegate for your commands relating to the container engine.
Typically, commands ran by container can `pull` and `push` to your registry.
@z

@x
### `user`
@y
### `user`
@z

@x
`user` overrides the user used to run the container process. The default is set by the image, for example Dockerfile `USER`. If it's not set, then `root`.
@y
`user` overrides the user used to run the container process. The default is set by the image, for example Dockerfile `USER`. If it's not set, then `root`.
@z

@x
### `userns_mode`
@y
### `userns_mode`
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
### `uts`
@y
### `uts`
@z

@x
{{< summary-bar feature_name="Compose uts" >}}
@y
{{< summary-bar feature_name="Compose uts" >}}
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
### `volumes`
@y
### `volumes`
@z

@x
{{% include "compose/services-volumes.md" %}}
@y
{{% include "compose/services-volumes.md" %}}
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
> [!NOTE]
>
> For bind mounts, the short syntax creates a directory at the source path on the host if it doesn't exist. This is for backward compatibility with `docker-compose` legacy.
> It can be prevented by using long syntax and setting `create_host_path` to `false`.
@y
> [!NOTE]
>
> For bind mounts, the short syntax creates a directory at the source path on the host if it doesn't exist. This is for backward compatibility with `docker-compose` legacy.
> It can be prevented by using long syntax and setting `create_host_path` to `false`.
@z

@x
#### Long syntax
@y
#### Long syntax
@z

@x
The long form syntax lets you configure additional fields that can't be
expressed in the short form.
@y
The long form syntax lets you configure additional fields that can't be
expressed in the short form.
@z

@x
- `type`: The mount type. Either `volume`, `bind`, `tmpfs`, `image`, `npipe`, or `cluster`
- `source`: The source of the mount, a path on the host for a bind mount, a Docker image reference for an image mount, or the
  name of a volume defined in the
  [top-level `volumes` key](volumes.md). Not applicable for a tmpfs mount.
- `target`: The path in the container where the volume is mounted.
- `read_only`: Flag to set the volume as read-only.
- `bind`: Used to configure additional bind options:
  - `propagation`: The propagation mode used for the bind.
  - `create_host_path`: Creates a directory at the source path on host if there is nothing present. Defaults to `true`.
  - `selinux`: The SELinux re-labeling option `z` (shared) or `Z` (private)
- `volume`: Configures additional volume options:
  - `nocopy`: Flag to disable copying of data from a container when a volume is created.
  - `subpath`: Path inside a volume to mount instead of the volume root.
- `tmpfs`: Configures additional tmpfs options:
  - `size`: The size for the tmpfs mount in bytes (either numeric or as bytes unit).
  - `mode`: The file mode for the tmpfs mount as Unix permission bits as an octal number. Introduced in Docker Compose version [2.14.0](https://github.com/docker/compose/releases/tag/v2.14.0).
- `image`: Configures additional image options:
  - `subpath`: Path inside the source image to mount instead of the image root. Available in [Docker Compose version 2.35.0](https://github.com/docker/compose/releases/tag/v2.35.0)
- `consistency`: The consistency requirements of the mount. Available values are platform specific.
@y
- `type`: The mount type. Either `volume`, `bind`, `tmpfs`, `image`, `npipe`, or `cluster`
- `source`: The source of the mount, a path on the host for a bind mount, a Docker image reference for an image mount, or the
  name of a volume defined in the
  [top-level `volumes` key](volumes.md). Not applicable for a tmpfs mount.
- `target`: The path in the container where the volume is mounted.
- `read_only`: Flag to set the volume as read-only.
- `bind`: Used to configure additional bind options:
  - `propagation`: The propagation mode used for the bind.
  - `create_host_path`: Creates a directory at the source path on host if there is nothing present. Defaults to `true`.
  - `selinux`: The SELinux re-labeling option `z` (shared) or `Z` (private)
- `volume`: Configures additional volume options:
  - `nocopy`: Flag to disable copying of data from a container when a volume is created.
  - `subpath`: Path inside a volume to mount instead of the volume root.
- `tmpfs`: Configures additional tmpfs options:
  - `size`: The size for the tmpfs mount in bytes (either numeric or as bytes unit).
  - `mode`: The file mode for the tmpfs mount as Unix permission bits as an octal number. Introduced in Docker Compose version [2.14.0](https://github.com/docker/compose/releases/tag/v2.14.0).
- `image`: Configures additional image options:
  - `subpath`: Path inside the source image to mount instead of the image root. Available in [Docker Compose version 2.35.0](https://github.com/docker/compose/releases/tag/v2.35.0)
- `consistency`: The consistency requirements of the mount. Available values are platform specific.
@z

@x
> [!TIP]
>
> Working with large repositories or monorepos, or with virtual file systems that are no longer scaling with your codebase?
> Compose now takes advantage of [Synchronized file shares](/manuals/desktop/features/synchronized-file-sharing.md) and automatically creates file shares for bind mounts.
> Ensure you're signed in to Docker with a paid subscription and have enabled both **Access experimental features** and **Manage Synchronized file shares with Compose** in Docker Desktop's settings.
@y
> [!TIP]
>
> Working with large repositories or monorepos, or with virtual file systems that are no longer scaling with your codebase?
> Compose now takes advantage of [Synchronized file shares](manuals/desktop/features/synchronized-file-sharing.md) and automatically creates file shares for bind mounts.
> Ensure you're signed in to Docker with a paid subscription and have enabled both **Access experimental features** and **Manage Synchronized file shares with Compose** in Docker Desktop's settings.
@z

@x
### `volumes_from`
@y
### `volumes_from`
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
### `working_dir`
@y
### `working_dir`
@z

@x
`working_dir` overrides the container's working directory which is specified by the image, for example Dockerfile's `WORKDIR`.
@y
`working_dir` overrides the container's working directory which is specified by the image, for example Dockerfile's `WORKDIR`.
@z
