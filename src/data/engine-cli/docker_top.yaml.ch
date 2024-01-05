%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker top
aliases: docker container top, docker top
short: Display the running processes of a container
long: Display the running processes of a container
usage: docker top CONTAINER [ps OPTIONS]
pname: docker
plink: docker.yaml
@y
command: docker top
aliases: docker container top, docker top
short: コンテナー内での実行プロセスを表示します。
long: コンテナー内での実行プロセスを表示します。
usage: docker top CONTAINER [ps OPTIONS]
pname: docker
plink: docker.yaml
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
