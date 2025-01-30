%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Compose Deploy Specification
description: Learn about the Compose Deploy Specification
keywords: compose, compose specification, compose file reference, compose deploy specification
@y
title: Compose Deploy Specification
description: Learn about the Compose Deploy Specification
keywords: compose, compose specification, compose file reference, compose deploy specification
@z

@x
{{% include "compose/deploy.md" %}}
@y
{{% include "compose/deploy.md" %}}
@z

@x
## Attributes
@y
## Attributes
@z

@x
### `endpoint_mode`
@y
### `endpoint_mode`
@z

@x
`endpoint_mode` specifies a service discovery method for external clients connecting to a service. The Compose Deploy Specification defines two canonical values:
@y
`endpoint_mode` specifies a service discovery method for external clients connecting to a service. The Compose Deploy Specification defines two canonical values:
@z

@x
* `endpoint_mode: vip`: Assigns the service a virtual IP (VIP) that acts as the front end for clients to reach the service
  on a network. Platform routes requests between the client and nodes running the service, without client knowledge of how
  many nodes are participating in the service or their IP addresses or ports.
@y
* `endpoint_mode: vip`: Assigns the service a virtual IP (VIP) that acts as the front end for clients to reach the service
  on a network. Platform routes requests between the client and nodes running the service, without client knowledge of how
  many nodes are participating in the service or their IP addresses or ports.
@z

@x
* `endpoint_mode: dnsrr`: Platform sets up DNS entries for the service such that a DNS query for the service name returns a
  list of IP addresses (DNS round-robin), and the client connects directly to one of these.
@y
* `endpoint_mode: dnsrr`: Platform sets up DNS entries for the service such that a DNS query for the service name returns a
  list of IP addresses (DNS round-robin), and the client connects directly to one of these.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    ports:
      - "8080:80"
    deploy:
      mode: replicated
      replicas: 2
      endpoint_mode: vip
```
@y
```yml
services:
  frontend:
    image: example/webapp
    ports:
      - "8080:80"
    deploy:
      mode: replicated
      replicas: 2
      endpoint_mode: vip
```
@z

@x
### `labels`
@y
### `labels`
@z

@x
`labels` specifies metadata for the service. These labels are only set on the service and not on any containers for the service.
This assumes the platform has some native concept of "service" that can match the Compose application model.
@y
`labels` specifies metadata for the service. These labels are only set on the service and not on any containers for the service.
This assumes the platform has some native concept of "service" that can match the Compose application model.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      labels:
        com.example.description: "This label will appear on the web service"
```
@y
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      labels:
        com.example.description: "This label will appear on the web service"
```
@z

@x
### `mode`
@y
### `mode`
@z

@x
`mode` defines the replication model used to run a service or job. Options include:
@y
`mode` defines the replication model used to run a service or job. Options include:
@z

@x
- `global`: Ensures exactly one task continuously runs per physical node until stopped.
- `replicated`: Continuously runs a specified number of tasks across nodes until stopped (default).
- `replicated-job`: Executes a defined number of tasks until a completion state (exits with code 0)'.
   - Total tasks are determined by `replicas`. 
   - Concurrency can be limited using the `max-concurrent` option (CLI only).
- `global-job`: Executes one task per physical node with a completion state (exits with code 0).
   - Automatically runs on new nodes as they are added.
@y
- `global`: Ensures exactly one task continuously runs per physical node until stopped.
- `replicated`: Continuously runs a specified number of tasks across nodes until stopped (default).
- `replicated-job`: Executes a defined number of tasks until a completion state (exits with code 0)'.
   - Total tasks are determined by `replicas`. 
   - Concurrency can be limited using the `max-concurrent` option (CLI only).
- `global-job`: Executes one task per physical node with a completion state (exits with code 0).
   - Automatically runs on new nodes as they are added.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      mode: global
@y
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      mode: global
@z

@x
  batch-job:
    image: example/processor
    deploy:
      mode: replicated-job
      replicas: 5
@y
  batch-job:
    image: example/processor
    deploy:
      mode: replicated-job
      replicas: 5
@z

@x
  maintenance:
    image: example/updater
    deploy:
      mode: global-job
```
@y
  maintenance:
    image: example/updater
    deploy:
      mode: global-job
```
@z

@x
> [!NOTE] 
> - Job modes (`replicated-job` and `global-job`) are designed for tasks that complete and exit with code 0.
> - Completed tasks remain until explicitly removed.
> - Options like `max-concurrent` for controlling concurrency are supported only via the CLI and are not available in Compose.
@y
> [!NOTE] 
> - Job modes (`replicated-job` and `global-job`) are designed for tasks that complete and exit with code 0.
> - Completed tasks remain until explicitly removed.
> - Options like `max-concurrent` for controlling concurrency are supported only via the CLI and are not available in Compose.
@z

@x
For more detailed information about job options and behavior, see the [Docker CLI documentation](/reference/cli/docker/service/create.md#running-as-a-job)
@y
For more detailed information about job options and behavior, see the [Docker CLI documentation](reference/cli/docker/service/create.md#running-as-a-job)
@z

@x
### `placement`
@y
### `placement`
@z

@x
`placement` specifies constraints and preferences for the platform to select a physical node to run service containers.
@y
`placement` specifies constraints and preferences for the platform to select a physical node to run service containers.
@z

@x
#### `constraints`
@y
#### `constraints`
@z

@x
`constraints` defines a required property the platform's node must fulfill to run the service container. For a further example, see the [CLI reference docs](/reference/cli/docker/service/create.md#constraint).
@y
`constraints` defines a required property the platform's node must fulfill to run the service container. For a further example, see the [CLI reference docs](reference/cli/docker/service/create.md#constraint).
@z

@x
```yml
deploy:
  placement:
    constraints:
      - disktype=ssd
```
@y
```yml
deploy:
  placement:
    constraints:
      - disktype=ssd
```
@z

@x
#### `preferences`
@y
#### `preferences`
@z

@x
`preferences` defines a strategy (currently `spread` is the only supported strategy) to spread tasks evenly 
over the values of the datacenter node label. For a further example, see the [CLI reference docs](/reference/cli/docker/service/create.md#placement-pref)
@y
`preferences` defines a strategy (currently `spread` is the only supported strategy) to spread tasks evenly 
over the values of the datacenter node label. For a further example, see the [CLI reference docs](reference/cli/docker/service/create.md#placement-pref)
@z

@x
```yml
deploy:
  placement:
    preferences:
      - spread: node.labels.zone
```
@y
```yml
deploy:
  placement:
    preferences:
      - spread: node.labels.zone
```
@z

@x
### `replicas`
@y
### `replicas`
@z

@x
If the service is `replicated` (which is the default), `replicas` specifies the number of containers that should be
running at any given time.
@y
If the service is `replicated` (which is the default), `replicas` specifies the number of containers that should be
running at any given time.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      mode: replicated
      replicas: 6
```
@y
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      mode: replicated
      replicas: 6
```
@z

@x
### `resources`
@y
### `resources`
@z

@x
`resources` configures physical resource constraints for container to run on platform. Those constraints can be configured
as:
@y
`resources` configures physical resource constraints for container to run on platform. Those constraints can be configured
as:
@z

@x
- `limits`: The platform must prevent the container to allocate more.
- `reservations`: The platform must guarantee the container can allocate at least the configured amount.
@y
- `limits`: The platform must prevent the container to allocate more.
- `reservations`: The platform must guarantee the container can allocate at least the configured amount.
@z

@x
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 50M
          pids: 1
        reservations:
          cpus: '0.25'
          memory: 20M
```
@y
```yml
services:
  frontend:
    image: example/webapp
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 50M
          pids: 1
        reservations:
          cpus: '0.25'
          memory: 20M
```
@z

@x
#### `cpus`
@y
#### `cpus`
@z

@x
`cpus` configures a limit or reservation for how much of the available CPU resources, as number of cores, a container can use.
@y
`cpus` configures a limit or reservation for how much of the available CPU resources, as number of cores, a container can use.
@z

@x
#### `memory`
@y
#### `memory`
@z

@x
`memory` configures a limit or reservation on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@y
`memory` configures a limit or reservation on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@z

@x
#### `pids`
@y
#### `pids`
@z

@x
`pids` tunes a container’s PIDs limit, set as an integer.
@y
`pids` tunes a container’s PIDs limit, set as an integer.
@z

@x
#### `devices`
@y
#### `devices`
@z

@x
`devices` configures reservations of the devices a container can use. It contains a list of reservations, each set as an object with the following parameters: `capabilities`, `driver`, `count`, `device_ids` and `options`.
@y
`devices` configures reservations of the devices a container can use. It contains a list of reservations, each set as an object with the following parameters: `capabilities`, `driver`, `count`, `device_ids` and `options`.
@z

@x
Devices are reserved using a list of capabilities, making `capabilities` the only required field. A device must satisfy all the requested capabilities for a successful reservation.
@y
Devices are reserved using a list of capabilities, making `capabilities` the only required field. A device must satisfy all the requested capabilities for a successful reservation.
@z

@x
##### `capabilities`
@y
##### `capabilities`
@z

@x
`capabilities` are set as a list of strings, expressing both generic and driver specific capabilities.
The following generic capabilities are recognized today:
@y
`capabilities` are set as a list of strings, expressing both generic and driver specific capabilities.
The following generic capabilities are recognized today:
@z

@x
- `gpu`: Graphics accelerator
- `tpu`: AI accelerator
@y
- `gpu`: Graphics accelerator
- `tpu`: AI accelerator
@z

@x
To avoid name clashes, driver specific capabilities must be prefixed with the driver name.
For example, reserving an NVIDIA CUDA-enabled accelerator might look like this:
@y
To avoid name clashes, driver specific capabilities must be prefixed with the driver name.
For example, reserving an NVIDIA CUDA-enabled accelerator might look like this:
@z

@x
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["nvidia-compute"]
```
@y
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["nvidia-compute"]
```
@z

@x
##### `driver`
@y
##### `driver`
@z

@x
A different driver for the reserved device(s) can be requested using `driver` field. The value is specified as a string.
@y
A different driver for the reserved device(s) can be requested using `driver` field. The value is specified as a string.
@z

@x
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["nvidia-compute"]
          driver: nvidia
```
@y
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["nvidia-compute"]
          driver: nvidia
```
@z

@x
##### `count`
@y
##### `count`
@z

@x
If `count` is set to `all` or not specified, Compose reserves all devices that satisfy the requested capabilities. Otherwise, Compose reserves at least the number of devices specified. The value is specified as an integer.
@y
If `count` is set to `all` or not specified, Compose reserves all devices that satisfy the requested capabilities. Otherwise, Compose reserves at least the number of devices specified. The value is specified as an integer.
@z

@x
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["tpu"]
          count: 2
```
@y
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["tpu"]
          count: 2
```
@z

@x
`count` and `device_ids` fields are exclusive. Compose returns an error if both are specified.
@y
`count` and `device_ids` fields are exclusive. Compose returns an error if both are specified.
@z

@x
##### `device_ids`
@y
##### `device_ids`
@z

@x
If `device_ids` is set, Compose reserves devices with the specified IDs provided they satisfy the requested capabilities. The value is specified as a list of strings.
@y
If `device_ids` is set, Compose reserves devices with the specified IDs provided they satisfy the requested capabilities. The value is specified as a list of strings.
@z

@x
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["gpu"]
          device_ids: ["GPU-f123d1c9-26bb-df9b-1c23-4a731f61d8c7"]
```
@y
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["gpu"]
          device_ids: ["GPU-f123d1c9-26bb-df9b-1c23-4a731f61d8c7"]
```
@z

@x
`count` and `device_ids` fields are exclusive. Compose returns an error if both are specified.
@y
`count` and `device_ids` fields are exclusive. Compose returns an error if both are specified.
@z

@x
##### `options`
@y
##### `options`
@z

@x
Driver specific options can be set with `options` as key-value pairs.
@y
Driver specific options can be set with `options` as key-value pairs.
@z

@x
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["gpu"]
          driver: gpuvendor
          options:
            virtualization: false
```
@y
```yml
deploy:
  resources:
    reservations:
      devices:
        - capabilities: ["gpu"]
          driver: gpuvendor
          options:
            virtualization: false
```
@z

@x
### `restart_policy`
@y
### `restart_policy`
@z

@x
`restart_policy` configures if and how to restart containers when they exit. If `restart_policy` is not set, Compose considers the `restart` field set by the service configuration.
@y
`restart_policy` configures if and how to restart containers when they exit. If `restart_policy` is not set, Compose considers the `restart` field set by the service configuration.
@z

@x
- `condition`. When set to:
  - `none`, containers are not automatically restarted regardless of the exit status.
  - `on-failure`, the container is restarted if it exits due to an error, which manifests as a non-zero exit code.
  - `any` (default), containers are restarted regardless of the exit status. 
- `delay`: How long to wait between restart attempts, specified as a [duration](extension.md#specifying-durations). The default is 0, meaning restart attempts can occur immediately.
- `max_attempts`: How many times to attempt to restart a container before giving up (default: never give up). If the restart does not
  succeed within the configured `window`, this attempt doesn't count toward the configured `max_attempts` value.
  For example, if `max_attempts` is set to '2', and the restart fails on the first attempt, more than two restarts must be attempted.
- `window`: How long to wait before deciding if a restart has succeeded, specified as a [duration](extension.md#specifying-durations) (default:
  decide immediately).
@y
- `condition`. When set to:
  - `none`, containers are not automatically restarted regardless of the exit status.
  - `on-failure`, the container is restarted if it exits due to an error, which manifests as a non-zero exit code.
  - `any` (default), containers are restarted regardless of the exit status. 
- `delay`: How long to wait between restart attempts, specified as a [duration](extension.md#specifying-durations). The default is 0, meaning restart attempts can occur immediately.
- `max_attempts`: How many times to attempt to restart a container before giving up (default: never give up). If the restart does not
  succeed within the configured `window`, this attempt doesn't count toward the configured `max_attempts` value.
  For example, if `max_attempts` is set to '2', and the restart fails on the first attempt, more than two restarts must be attempted.
- `window`: How long to wait before deciding if a restart has succeeded, specified as a [duration](extension.md#specifying-durations) (default:
  decide immediately).
@z

@x
```yml
deploy:
  restart_policy:
    condition: on-failure
    delay: 5s
    max_attempts: 3
    window: 120s
```
@y
```yml
deploy:
  restart_policy:
    condition: on-failure
    delay: 5s
    max_attempts: 3
    window: 120s
```
@z

@x
### `rollback_config`
@y
### `rollback_config`
@z

@x
`rollback_config` configures how the service should be rollbacked in case of a failing update.
@y
`rollback_config` configures how the service should be rollbacked in case of a failing update.
@z

@x
- `parallelism`: The number of containers to rollback at a time. If set to 0, all containers rollback simultaneously.
- `delay`: The time to wait between each container group's rollback (default 0s).
- `failure_action`: What to do if a rollback fails. One of `continue` or `pause` (default `pause`)
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 0s).
- `max_failure_ratio`: Failure rate to tolerate during a rollback (default 0).
- `order`: Order of operations during rollbacks. One of `stop-first` (old task is stopped before starting new one),
   or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`).
@y
- `parallelism`: The number of containers to rollback at a time. If set to 0, all containers rollback simultaneously.
- `delay`: The time to wait between each container group's rollback (default 0s).
- `failure_action`: What to do if a rollback fails. One of `continue` or `pause` (default `pause`)
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 0s).
- `max_failure_ratio`: Failure rate to tolerate during a rollback (default 0).
- `order`: Order of operations during rollbacks. One of `stop-first` (old task is stopped before starting new one),
   or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`).
@z

@x
### `update_config`
@y
### `update_config`
@z

@x
`update_config` configures how the service should be updated. Useful for configuring rolling updates.
@y
`update_config` configures how the service should be updated. Useful for configuring rolling updates.
@z

@x
- `parallelism`: The number of containers to update at a time.
- `delay`: The time to wait between updating a group of containers.
- `failure_action`: What to do if an update fails. One of `continue`, `rollback`, or `pause` (default: `pause`).
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 0s).
- `max_failure_ratio`: Failure rate to tolerate during an update.
- `order`: Order of operations during updates. One of `stop-first` (old task is stopped before starting new one),
   or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`).
@y
- `parallelism`: The number of containers to update at a time.
- `delay`: The time to wait between updating a group of containers.
- `failure_action`: What to do if an update fails. One of `continue`, `rollback`, or `pause` (default: `pause`).
- `monitor`: Duration after each task update to monitor for failure `(ns|us|ms|s|m|h)` (default 0s).
- `max_failure_ratio`: Failure rate to tolerate during an update.
- `order`: Order of operations during updates. One of `stop-first` (old task is stopped before starting new one),
   or `start-first` (new task is started first, and the running tasks briefly overlap) (default `stop-first`).
@z

@x
```yml
deploy:
  update_config:
    parallelism: 2
    delay: 10s
    order: stop-first
```
@y
```yml
deploy:
  update_config:
    parallelism: 2
    delay: 10s
    order: stop-first
```
@z
