%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
{{< include "compose/deploy.md" >}}
@y
{{< include "compose/deploy.md" >}}
@z

@x
## Attributes
@y
## Attributes
@z

@x
### endpoint_mode
@y
### endpoint_mode
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

% snip code...

@x
### labels
@y
### labels
@z

@x
`labels` specifies metadata for the service. These labels are only set on the service and not on any containers for the service.
This assumes the platform has some native concept of "service" that can match the Compose application model.
@y
`labels` specifies metadata for the service. These labels are only set on the service and not on any containers for the service.
This assumes the platform has some native concept of "service" that can match the Compose application model.
@z

% snip code...

@x
### mode
@y
### mode
@z

@x
`mode` defines the replication model used to run the service on the  platform. Either `global`, exactly one container per physical node, or `replicated`, a specified number of containers. The default is `replicated`.
@y
`mode` defines the replication model used to run the service on the  platform. Either `global`, exactly one container per physical node, or `replicated`, a specified number of containers. The default is `replicated`.
@z

% snip code...

@x
### placement
@y
### placement
@z

@x
`placement` specifies constraints and preferences for the platform to select a physical node to run service containers.
@y
`placement` specifies constraints and preferences for the platform to select a physical node to run service containers.
@z

@x
#### constraints
@y
#### constraints
@z

@x
`constraints` defines a required property the platform's node must fulfill to run the service container. For a further example, see the [CLI reference docs](/reference/cli/docker/service/create.md#constraint).
@y
`constraints` defines a required property the platform's node must fulfill to run the service container. For a further example, see the [CLI reference docs](reference/cli/docker/service/create.md#constraint).
@z

% snip code...

@x
#### preferences
@y
#### preferences
@z

@x
`preferences` defines a strategy (currently `spread` is the only supported strategy) to spread tasks evenly 
over the values of the datacenter node label. For a further example, see the [CLI reference docs](/reference/cli/docker/service/create.md#placement-pref)
@y
`preferences` defines a strategy (currently `spread` is the only supported strategy) to spread tasks evenly 
over the values of the datacenter node label. For a further example, see the [CLI reference docs](reference/cli/docker/service/create.md#placement-pref)
@z

% snip code...

@x
### replicas
@y
### replicas
@z

@x
If the service is `replicated` (which is the default), `replicas` specifies the number of containers that should be
running at any given time.
@y
If the service is `replicated` (which is the default), `replicas` specifies the number of containers that should be
running at any given time.
@z

% snip code...

@x
### resources
@y
### resources
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

% snip code...

@x
#### cpus
@y
#### cpus
@z

@x
`cpus` configures a limit or reservation for how much of the available CPU resources, as number of cores, a container can use.
@y
`cpus` configures a limit or reservation for how much of the available CPU resources, as number of cores, a container can use.
@z

@x
#### memory
@y
#### memory
@z

@x
`memory` configures a limit or reservation on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@y
`memory` configures a limit or reservation on the amount of memory a container can allocate, set as a string expressing a [byte value](extension.md#specifying-byte-values).
@z

@x
#### pids
@y
#### pids
@z

@x
`pids` tunes a container’s PIDs limit, set as an integer.
@y
`pids` tunes a container’s PIDs limit, set as an integer.
@z

@x
#### devices
@y
#### devices
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
##### capabilities
@y
##### capabilities
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
For example, reserving an nVidia CUDA-enabled accelerator might look like this:
@y
To avoid name clashes, driver specific capabilities must be prefixed with the driver name.
For example, reserving an nVidia CUDA-enabled accelerator might look like this:
@z

% snip code...

@x
##### driver
@y
##### driver
@z

@x
A different driver for the reserved device(s) can be requested using `driver` field. The value is specified as a string.
@y
A different driver for the reserved device(s) can be requested using `driver` field. The value is specified as a string.
@z

% snip code...

@x
##### count
@y
##### count
@z

@x
If `count` is set to `all` or not specified, Compose reserves all devices that satisfy the requested capabilities. Otherwise, Compose reserves at least the number of devices specified. The value is specified as an integer.
@y
If `count` is set to `all` or not specified, Compose reserves all devices that satisfy the requested capabilities. Otherwise, Compose reserves at least the number of devices specified. The value is specified as an integer.
@z

% snip code...

@x
`count` and `device_ids` fields are exclusive. Compose returns an error if both are specified.
@y
`count` and `device_ids` fields are exclusive. Compose returns an error if both are specified.
@z

@x
##### device_ids
@y
##### device_ids
@z

@x
If `device_ids` is set, Compose reserves devices with the specified IDs provided they satisfy the requested capabilities. The value is specified as a list of strings.
@y
If `device_ids` is set, Compose reserves devices with the specified IDs provided they satisfy the requested capabilities. The value is specified as a list of strings.
@z

% snip code...

@x
`count` and `device_ids` fields are exclusive. Compose returns an error if both are specified.
@y
`count` and `device_ids` fields are exclusive. Compose returns an error if both are specified.
@z

@x
##### options
@y
##### options
@z

@x
Driver specific options can be set with `options` as key-value pairs.
@y
Driver specific options can be set with `options` as key-value pairs.
@z

% snip code...

@x
### restart_policy
@y
### restart_policy
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

% snip code...

@x
### rollback_config
@y
### rollback_config
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
### update_config
@y
### update_config
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

% snip code...
