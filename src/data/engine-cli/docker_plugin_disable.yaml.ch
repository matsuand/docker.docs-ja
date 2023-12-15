%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker plugin disable
short: Disable a plugin
long: |-
    Disables a plugin. The plugin must be installed before it can be disabled,
    see [`docker plugin install`](plugin_install.md). Without the `-f` option,
    a plugin that has references (e.g., volumes, networks) cannot be disabled.
usage: docker plugin disable [OPTIONS] PLUGIN
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the disable of an active plugin
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
    The following example shows that the `sample-volume-plugin` plugin is installed
    and enabled:
@y
command: docker plugin disable
short: Disable a plugin
long: |-
    Disables a plugin. The plugin must be installed before it can be disabled,
    see [`docker plugin install`](plugin_install.md). Without the `-f` option,
    a plugin that has references (e.g., volumes, networks) cannot be disabled.
usage: docker plugin disable [OPTIONS] PLUGIN
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the disable of an active plugin
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
    The following example shows that the `sample-volume-plugin` plugin is installed
    and enabled:
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
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   true
    ```
@y
    ID            NAME                                    DESCRIPTION                ENABLED
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   true
    ```
@z

@x
    To disable the plugin, use the following command:
@y
    To disable the plugin, use the following command:
@z

@x
    ```console
    $ docker plugin disable tiborvass/sample-volume-plugin
@y
    ```console
    $ docker plugin disable tiborvass/sample-volume-plugin
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
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   false
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ID            NAME                                    DESCRIPTION                ENABLED
    69553ca1d123  tiborvass/sample-volume-plugin:latest   A test plugin for Docker   false
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
