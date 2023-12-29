%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context
short: Manage contexts
long: Manage contexts.
usage: docker context
pname: docker
plink: docker.yaml
@y
command: docker context
short: コンテキストを管理します。
long: コンテキストを管理します。
usage: docker context
pname: docker
plink: docker.yaml
@z

@x
cname:
    - docker context create
    - docker context export
    - docker context import
    - docker context inspect
    - docker context ls
    - docker context rm
    - docker context show
    - docker context update
    - docker context use
@y
cname:
    - docker context create
    - docker context export
    - docker context import
    - docker context inspect
    - docker context ls
    - docker context rm
    - docker context show
    - docker context update
    - docker context use
@z

@x
clink:
    - docker_context_create.yaml
    - docker_context_export.yaml
    - docker_context_import.yaml
    - docker_context_inspect.yaml
    - docker_context_ls.yaml
    - docker_context_rm.yaml
    - docker_context_show.yaml
    - docker_context_update.yaml
    - docker_context_use.yaml
@y
clink:
    - docker_context_create.yaml
    - docker_context_export.yaml
    - docker_context_import.yaml
    - docker_context_inspect.yaml
    - docker_context_ls.yaml
    - docker_context_rm.yaml
    - docker_context_show.yaml
    - docker_context_update.yaml
    - docker_context_use.yaml
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
