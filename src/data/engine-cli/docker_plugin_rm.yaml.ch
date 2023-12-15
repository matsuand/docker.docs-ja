%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker plugin rm
aliases: docker plugin rm, docker plugin remove
short: Remove one or more plugins
long: |-
    Removes a plugin. You cannot remove a plugin if it is enabled, you must disable
    a plugin using the [`docker plugin disable`](plugin_disable.md) before removing
    it (or use --force, use of force is not recommended, since it can affect
    functioning of running containers using the plugin).
usage: docker plugin rm [OPTIONS] PLUGIN [PLUGIN...]
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the removal of an active plugin
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
    The following example disables and removes the `sample-volume-plugin:latest`
    plugin:
@y
command: docker plugin rm
aliases: docker plugin rm, docker plugin remove
short: Remove one or more plugins
long: |-
    Removes a plugin. You cannot remove a plugin if it is enabled, you must disable
    a plugin using the [`docker plugin disable`](plugin_disable.md) before removing
    it (or use --force, use of force is not recommended, since it can affect
    functioning of running containers using the plugin).
usage: docker plugin rm [OPTIONS] PLUGIN [PLUGIN...]
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the removal of an active plugin
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
    The following example disables and removes the `sample-volume-plugin:latest`
    plugin:
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
    $ docker plugin rm tiborvass/sample-volume-plugin:latest
@y
    $ docker plugin rm tiborvass/sample-volume-plugin:latest
@z

@x
    tiborvass/sample-volume-plugin
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    tiborvass/sample-volume-plugin
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
