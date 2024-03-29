%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker plugin push
short: Push a plugin to a registry
long: |-
    After you have created a plugin using `docker plugin create` and the plugin is
    ready for distribution, use `docker plugin push` to share your images to Docker
    Hub or a self-hosted registry.
@y
command: docker plugin push
short: Push a plugin to a registry
long: |-
    After you have created a plugin using `docker plugin create` and the plugin is
    ready for distribution, use `docker plugin push` to share your images to Docker
    Hub or a self-hosted registry.
@z

@x
    Registry credentials are managed by [docker login](/reference/cli/docker/login/).
usage: docker plugin push [OPTIONS] PLUGIN[:TAG]
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image signing
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
examples: |-
    The following example shows how to push a sample `user/plugin`.
@y
    Registry credentials are managed by [docker login](__SUBDIR__/reference/cli/docker/login/).
usage: docker plugin push [OPTIONS] PLUGIN[:TAG]
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image signing
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
examples: |-
    The following example shows how to push a sample `user/plugin`.
@z

@x
    ```console
    $ docker plugin ls
@y
    ```console
    $ docker plugin ls
@z

@x
    ID             NAME                    DESCRIPTION                  ENABLED
    69553ca1d456   user/plugin:latest      A sample plugin for Docker   false
@y
    ID             NAME                    DESCRIPTION                  ENABLED
    69553ca1d456   user/plugin:latest      A sample plugin for Docker   false
@z

@x
    $ docker plugin push user/plugin
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    $ docker plugin push user/plugin
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
