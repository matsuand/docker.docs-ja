%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker plugin upgrade
short: Upgrade an existing plugin
long: |-
    Upgrades an existing plugin to the specified remote plugin image. If no remote
    is specified, Docker will re-pull the current image and use the updated version.
    All existing references to the plugin will continue to work.
    The plugin must be disabled before running the upgrade.
usage: docker plugin upgrade [OPTIONS] PLUGIN [REMOTE]
pname: docker plugin
plink: docker_plugin.yaml
options:
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
    - option: skip-remote-check
      value_type: bool
      default_value: "false"
      description: |
        Do not check if specified remote plugin matches existing plugin image
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
    The following example installs `vieus/sshfs` plugin, uses it to create and use
    a volume, then upgrades the plugin.
@y
command: docker plugin upgrade
short: Upgrade an existing plugin
long: |-
    Upgrades an existing plugin to the specified remote plugin image. If no remote
    is specified, Docker will re-pull the current image and use the updated version.
    All existing references to the plugin will continue to work.
    The plugin must be disabled before running the upgrade.
usage: docker plugin upgrade [OPTIONS] PLUGIN [REMOTE]
pname: docker plugin
plink: docker_plugin.yaml
options:
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
    - option: skip-remote-check
      value_type: bool
      default_value: "false"
      description: |
        Do not check if specified remote plugin matches existing plugin image
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
    The following example installs `vieus/sshfs` plugin, uses it to create and use
    a volume, then upgrades the plugin.
@z

@x
    ```console
    $ docker plugin install vieux/sshfs DEBUG=1
@y
    ```console
    $ docker plugin install vieux/sshfs DEBUG=1
@z

@x
    Plugin "vieux/sshfs:next" is requesting the following privileges:
     - network: [host]
     - device: [/dev/fuse]
     - capabilities: [CAP_SYS_ADMIN]
    Do you grant the above permissions? [y/N] y
    vieux/sshfs:next
@y
    Plugin "vieux/sshfs:next" is requesting the following privileges:
     - network: [host]
     - device: [/dev/fuse]
     - capabilities: [CAP_SYS_ADMIN]
    Do you grant the above permissions? [y/N] y
    vieux/sshfs:next
@z

@x
    $ docker volume create -d vieux/sshfs:next -o sshcmd=root@1.2.3.4:/tmp/shared -o password=XXX sshvolume
@y
    $ docker volume create -d vieux/sshfs:next -o sshcmd=root@1.2.3.4:/tmp/shared -o password=XXX sshvolume
@z

@x
    sshvolume
@y
    sshvolume
@z

@x
    $ docker run -it -v sshvolume:/data alpine sh -c "touch /data/hello"
@y
    $ docker run -it -v sshvolume:/data alpine sh -c "touch /data/hello"
@z

@x
    $ docker plugin disable -f vieux/sshfs:next
@y
    $ docker plugin disable -f vieux/sshfs:next
@z

@x
    viex/sshfs:next
@y
    viex/sshfs:next
@z

@x
    # Here docker volume ls doesn't show 'sshfsvolume', since the plugin is disabled
    $ docker volume ls
@y
    # Here docker volume ls doesn't show 'sshfsvolume', since the plugin is disabled
    $ docker volume ls
@z

@x
    DRIVER              VOLUME NAME
@y
    DRIVER              VOLUME NAME
@z

@x
    $ docker plugin upgrade vieux/sshfs:next vieux/sshfs:next
@y
    $ docker plugin upgrade vieux/sshfs:next vieux/sshfs:next
@z

@x
    Plugin "vieux/sshfs:next" is requesting the following privileges:
     - network: [host]
     - device: [/dev/fuse]
     - capabilities: [CAP_SYS_ADMIN]
    Do you grant the above permissions? [y/N] y
    Upgrade plugin vieux/sshfs:next to vieux/sshfs:next
@y
    Plugin "vieux/sshfs:next" is requesting the following privileges:
     - network: [host]
     - device: [/dev/fuse]
     - capabilities: [CAP_SYS_ADMIN]
    Do you grant the above permissions? [y/N] y
    Upgrade plugin vieux/sshfs:next to vieux/sshfs:next
@z

@x
    $ docker plugin enable vieux/sshfs:next
@y
    $ docker plugin enable vieux/sshfs:next
@z

@x
    viex/sshfs:next
@y
    viex/sshfs:next
@z

@x
    $ docker volume ls
@y
    $ docker volume ls
@z

@x
    DRIVER              VOLUME NAME
    viuex/sshfs:next    sshvolume
@y
    DRIVER              VOLUME NAME
    viuex/sshfs:next    sshvolume
@z

@x
    $ docker run -it -v sshvolume:/data alpine sh -c "ls /data"
@y
    $ docker run -it -v sshvolume:/data alpine sh -c "ls /data"
@z

@x
    hello
    ```
deprecated: false
hidden: false
min_api_version: "1.26"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    hello
    ```
deprecated: false
hidden: false
min_api_version: "1.26"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
