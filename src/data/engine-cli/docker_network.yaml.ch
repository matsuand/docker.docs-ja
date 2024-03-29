%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network
short: Manage networks
long: |-
    Manage networks. You can use subcommands to create, inspect, list, remove,
    prune, connect, and disconnect networks.
usage: docker network
pname: docker
plink: docker.yaml
cname:
    - docker network connect
    - docker network create
    - docker network disconnect
    - docker network inspect
    - docker network ls
    - docker network prune
    - docker network rm
clink:
    - docker_network_connect.yaml
    - docker_network_create.yaml
    - docker_network_disconnect.yaml
    - docker_network_inspect.yaml
    - docker_network_ls.yaml
    - docker_network_prune.yaml
    - docker_network_rm.yaml
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
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker network
short: Manage networks
long: |-
    Manage networks. You can use subcommands to create, inspect, list, remove,
    prune, connect, and disconnect networks.
usage: docker network
pname: docker
plink: docker.yaml
cname:
    - docker network connect
    - docker network create
    - docker network disconnect
    - docker network inspect
    - docker network ls
    - docker network prune
    - docker network rm
clink:
    - docker_network_connect.yaml
    - docker_network_create.yaml
    - docker_network_disconnect.yaml
    - docker_network_inspect.yaml
    - docker_network_ls.yaml
    - docker_network_prune.yaml
    - docker_network_rm.yaml
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
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
