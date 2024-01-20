%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker update
aliases: docker container update, docker update
short: Update configuration of one or more containers
long: Update configuration of one or more containers
usage: docker update [OPTIONS] CONTAINER [CONTAINER...]
pname: docker
plink: docker.yaml
options:
    - option: blkio-weight
      value_type: uint16
      default_value: "0"
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-period
      value_type: int64
      default_value: "0"
      description: Limit the CPU real-time period in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-runtime
      value_type: int64
      default_value: "0"
      description: Limit the CPU real-time runtime in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-shares
      shorthand: c
      value_type: int64
      default_value: "0"
      description: CPU shares (relative weight)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpus
      value_type: decimal
      description: Number of CPUs
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-cpus
      value_type: string
      description: CPUs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-mems
      value_type: string
      description: MEMs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: kernel-memory
      value_type: bytes
      default_value: "0"
      description: Kernel memory limit (deprecated)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: bytes
      default_value: "0"
      description: Memory limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-reservation
      value_type: bytes
      default_value: "0"
      description: Memory soft limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: bytes
      default_value: "0"
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pids-limit
      value_type: int64
      default_value: "0"
      description: Tune container pids limit (set -1 for unlimited)
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart
      value_type: string
      description: Restart policy to apply when a container exits
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker update
aliases: docker container update, docker update
short: Update configuration of one or more containers
long: Update configuration of one or more containers
usage: docker update [OPTIONS] CONTAINER [CONTAINER...]
pname: docker
plink: docker.yaml
options:
    - option: blkio-weight
      value_type: uint16
      default_value: "0"
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-period
      value_type: int64
      default_value: "0"
      description: Limit the CPU real-time period in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-runtime
      value_type: int64
      default_value: "0"
      description: Limit the CPU real-time runtime in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-shares
      shorthand: c
      value_type: int64
      default_value: "0"
      description: CPU shares (relative weight)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpus
      value_type: decimal
      description: Number of CPUs
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-cpus
      value_type: string
      description: CPUs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-mems
      value_type: string
      description: MEMs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: kernel-memory
      value_type: bytes
      default_value: "0"
      description: Kernel memory limit (deprecated)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: bytes
      default_value: "0"
      description: Memory limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-reservation
      value_type: bytes
      default_value: "0"
      description: Memory soft limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: bytes
      default_value: "0"
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pids-limit
      value_type: int64
      default_value: "0"
      description: Tune container pids limit (set -1 for unlimited)
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart
      value_type: string
      description: Restart policy to apply when a container exits
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
