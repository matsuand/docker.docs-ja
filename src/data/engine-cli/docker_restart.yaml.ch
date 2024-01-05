%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker restart
aliases: docker container restart, docker restart
short: Restart one or more containers
long: Restart one or more containers
usage: docker restart [OPTIONS] CONTAINER [CONTAINER...]
pname: docker
plink: docker.yaml
@y
command: docker restart
aliases: docker container restart, docker restart
short: 1 つまたは複数のコンテナーを再起動します。
long: 1 つまたは複数のコンテナーを再起動します。
usage: docker restart [OPTIONS] CONTAINER [CONTAINER...]
pname: docker
plink: docker.yaml
@z

@x
options:
    - option: signal
      shorthand: s
      value_type: string
      description: Signal to send to the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
options:
    - option: signal
      shorthand: s
      value_type: string
      description: コンテナーに送信するシグナル。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@z

@x
    - option: time
      shorthand: t
      value_type: int
      default_value: "0"
      description: Seconds to wait before killing the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
@y
    - option: time
      shorthand: t
      value_type: int
      default_value: "0"
      description: コンテナーを kill する前に待機する秒数。
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
examples: |-
    ```console
    $ docker restart my_container
    ```
@y
examples: |-
    ```console
    $ docker restart my_container
    ```
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
