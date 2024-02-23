%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker plugin enable
short: Enable a plugin
long: |-
    Enables a plugin. The plugin must be installed before it can be enabled,
    see [`docker plugin install`](/reference/cli/docker/plugin/install/).
usage: docker plugin enable [OPTIONS] PLUGIN
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: timeout
      value_type: int
      default_value: "30"
      description: HTTP client timeout (in seconds)
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
    The following example shows that the `sample-volume-plugin` plugin is installed,
    but disabled:
@y
command: docker plugin enable
short: Enable a plugin
long: |-
    Enables a plugin. The plugin must be installed before it can be enabled,
    see [`docker plugin install`](__SUBDIR__/reference/cli/docker/plugin/install/).
usage: docker plugin enable [OPTIONS] PLUGIN
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: timeout
      value_type: int
      default_value: "30"
      description: HTTP client timeout (in seconds)
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
    The following example shows that the `sample-volume-plugin` plugin is installed,
    but disabled:
@z

@x
    ```console
    $ docker plugin ls
@y
    ```console
    $ docker plugin ls
@z

@x
    ID            NAME                                    DESCRIPTION                ENABLED
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   false
    ```
@y
    ID            NAME                                    DESCRIPTION                ENABLED
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   false
    ```
@z

@x
    To enable the plugin, use the following command:
@y
    To enable the plugin, use the following command:
@z

@x
    ```console
    $ docker plugin enable tiborvass/sample-volume-plugin
@y
    ```console
    $ docker plugin enable tiborvass/sample-volume-plugin
@z

@x
    tiborvass/sample-volume-plugin
@y
    tiborvass/sample-volume-plugin
@z

@x
    $ docker plugin ls
@y
    $ docker plugin ls
@z

@x
    ID            NAME                                    DESCRIPTION                ENABLED
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   true
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ID            NAME                                    DESCRIPTION                ENABLED
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   true
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
