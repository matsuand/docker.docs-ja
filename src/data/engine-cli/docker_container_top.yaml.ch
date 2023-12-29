%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container top
aliases: docker container top, docker top
short: Display the running processes of a container
long: See [docker top](top.md) for more information.
usage: docker container top CONTAINER [ps OPTIONS]
pname: docker container
plink: docker_container.yaml
@y
command: docker container top
aliases: docker container top, docker top
short: コンテナーにおける実行プロセスを表示します。
long: 詳しくは [docker top](top.md) を参照してください。
usage: docker container top CONTAINER [ps OPTIONS]
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
