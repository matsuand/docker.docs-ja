%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container unpause
aliases: docker container unpause, docker unpause
short: Unpause all processes within one or more containers
long: See [docker unpause](unpause.md) for more information.
usage: docker container unpause CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
@y
command: docker container unpause
aliases: docker container unpause, docker unpause
short: 1 つまたは複数コンテナー内において停止中のプロセスを再開します。
long: 詳しくは [docker unpause](unpause.md) を参照してください。
usage: docker container unpause CONTAINER [CONTAINER...]
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
