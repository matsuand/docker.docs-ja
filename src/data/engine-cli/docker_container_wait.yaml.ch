%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container wait
aliases: docker container wait, docker wait
short: Block until one or more containers stop, then print their exit codes
long: See [docker wait](wait.md) for more information.
usage: docker container wait CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
@y
command: docker container wait
aliases: docker container wait, docker wait
short: 1 つまたは複数コンテナーが停止するまで待ち、各終了コードを表示します。
long: 詳しくは [docker wait](wait.md) を参照してください。
usage: docker container wait CONTAINER [CONTAINER...]
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
