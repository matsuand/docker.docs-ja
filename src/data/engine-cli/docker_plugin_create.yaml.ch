%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker plugin create
short: |
    Create a plugin from a rootfs and configuration. Plugin data directory must contain config.json and rootfs directory.
long: |-
    Creates a plugin. Before creating the plugin, prepare the plugin's root
    filesystem as well as the [config.json](../../extend/config.md).
usage: docker plugin create [OPTIONS] PLUGIN PLUGIN-DATA-DIR
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: compress
      value_type: bool
      default_value: "false"
      description: Compress the context using gzip
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
    The following example shows how to create a sample `plugin`.
@y
command: docker plugin create
short: |
    Create a plugin from a rootfs and configuration. Plugin data directory must contain config.json and rootfs directory.
long: |-
    Creates a plugin. Before creating the plugin, prepare the plugin's root
    filesystem as well as the [config.json](../../extend/config.md).
usage: docker plugin create [OPTIONS] PLUGIN PLUGIN-DATA-DIR
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: compress
      value_type: bool
      default_value: "false"
      description: Compress the context using gzip
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
    The following example shows how to create a sample `plugin`.
@z

@x
    ```console
    $ ls -ls /home/pluginDir
@y
    ```console
    $ ls -ls /home/pluginDir
@z

@x
    total 4
    4 -rw-r--r--  1 root root 431 Nov  7 01:40 config.json
    0 drwxr-xr-x 19 root root 420 Nov  7 01:40 rootfs
@y
    total 4
    4 -rw-r--r--  1 root root 431 Nov  7 01:40 config.json
    0 drwxr-xr-x 19 root root 420 Nov  7 01:40 rootfs
@z

@x
    $ docker plugin create plugin /home/pluginDir
@y
    $ docker plugin create plugin /home/pluginDir
@z

@x
    plugin
@y
    plugin
@z

@x
    $ docker plugin ls
@y
    $ docker plugin ls
@z

@x
    ID              NAME            DESCRIPTION                  ENABLED
    672d8144ec02    plugin:latest   A sample plugin for Docker   false
    ```
@y
    ID              NAME            DESCRIPTION                  ENABLED
    672d8144ec02    plugin:latest   A sample plugin for Docker   false
    ```
@z

@x
    The plugin can subsequently be enabled for local use or pushed to the public registry.
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    The plugin can subsequently be enabled for local use or pushed to the public registry.
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
