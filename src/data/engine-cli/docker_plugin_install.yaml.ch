%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker plugin install
short: Install a plugin
long: |-
    Installs and enables a plugin. Docker looks first for the plugin on your Docker
    host. If the plugin does not exist locally, then the plugin is pulled from
    the registry. Note that the minimum required registry version to distribute
    plugins is 2.3.0
usage: docker plugin install [OPTIONS] PLUGIN [KEY=VALUE...]
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: alias
      value_type: string
      description: Local name for plugin
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable
      value_type: bool
      default_value: "false"
      description: Do not enable the plugin on install
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image verification
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: grant-all-permissions
      value_type: bool
      default_value: "false"
      description: Grant all permissions necessary to run the plugin
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
    The following example installs `vieus/sshfs` plugin and [sets](plugin_set.md) its
    `DEBUG` environment variable to `1`. To install, `pull` the plugin from Docker
    Hub and prompt the user to accept the list of privileges that the plugin needs,
    set the plugin's parameters and enable the plugin.
@y
command: docker plugin install
short: Install a plugin
long: |-
    Installs and enables a plugin. Docker looks first for the plugin on your Docker
    host. If the plugin does not exist locally, then the plugin is pulled from
    the registry. Note that the minimum required registry version to distribute
    plugins is 2.3.0
usage: docker plugin install [OPTIONS] PLUGIN [KEY=VALUE...]
pname: docker plugin
plink: docker_plugin.yaml
options:
    - option: alias
      value_type: string
      description: Local name for plugin
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable
      value_type: bool
      default_value: "false"
      description: Do not enable the plugin on install
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image verification
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: grant-all-permissions
      value_type: bool
      default_value: "false"
      description: Grant all permissions necessary to run the plugin
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
    The following example installs `vieus/sshfs` plugin and [sets](plugin_set.md) its
    `DEBUG` environment variable to `1`. To install, `pull` the plugin from Docker
    Hub and prompt the user to accept the list of privileges that the plugin needs,
    set the plugin's parameters and enable the plugin.
@z

@x
    ```console
    $ docker plugin install vieux/sshfs DEBUG=1
@y
    ```console
    $ docker plugin install vieux/sshfs DEBUG=1
@z

@x
    Plugin "vieux/sshfs" is requesting the following privileges:
     - network: [host]
     - device: [/dev/fuse]
     - capabilities: [CAP_SYS_ADMIN]
    Do you grant the above permissions? [y/N] y
    vieux/sshfs
    ```
@y
    Plugin "vieux/sshfs" is requesting the following privileges:
     - network: [host]
     - device: [/dev/fuse]
     - capabilities: [CAP_SYS_ADMIN]
    Do you grant the above permissions? [y/N] y
    vieux/sshfs
    ```
@z

@x
    After the plugin is installed, it appears in the list of plugins:
@y
    After the plugin is installed, it appears in the list of plugins:
@z

@x
    ```console
    $ docker plugin ls
@y
    ```console
    $ docker plugin ls
@z

@x
    ID             NAME                  DESCRIPTION                ENABLED
    69553ca1d123   vieux/sshfs:latest    sshFS plugin for Docker    true
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ID             NAME                  DESCRIPTION                ENABLED
    69553ca1d123   vieux/sshfs:latest    sshFS plugin for Docker    true
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
