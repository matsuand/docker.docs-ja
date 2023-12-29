%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container port
aliases: docker container port, docker port
short: List port mappings or a specific mapping for the container
long: See [docker port](port.md) for more information.
usage: docker container port CONTAINER [PRIVATE_PORT[/PROTO]]
pname: docker container
plink: docker_container.yaml
@y
command: docker container port
aliases: docker container port, docker port
short:  コンテナーにおけるポート割り当て、あるいは特定の割り当てを一覧表示します。
long: 詳しくは [docker port](port.md) を参照してください。
usage: docker container port CONTAINER [PRIVATE_PORT[/PROTO]]
pname: docker container
plink: docker_container.yaml
@z

@x
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
@y
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: 利用方法を表示します。
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
