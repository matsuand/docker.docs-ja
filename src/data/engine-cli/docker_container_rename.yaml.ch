%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container rename
aliases: docker container rename, docker rename
short: Rename a container
long: See [docker rename](rename.md) for more information.
usage: docker container rename CONTAINER NEW_NAME
pname: docker container
plink: docker_container.yaml
@y
command: docker container rename
aliases: docker container rename, docker rename
short: コンテナーの名前を変更します。
long: 詳しくは [docker rename](rename.md) を参照してください。
usage: docker container rename CONTAINER NEW_NAME
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
