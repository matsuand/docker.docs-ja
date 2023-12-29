%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container pause
aliases: docker container pause, docker pause
short: Pause all processes within one or more containers
long: See [docker pause](pause.md) for more information.
usage: docker container pause CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
@y
command: docker container pause
aliases: docker container pause, docker pause
short: 1 つまたは複数コンテナー内部における全プロセスを一時停止します。
long: 詳しくは [docker pause](pause.md) を参照してください。
usage: docker container pause CONTAINER [CONTAINER...]
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
