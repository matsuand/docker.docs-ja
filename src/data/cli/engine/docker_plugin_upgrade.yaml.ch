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
@y
command: docker plugin upgrade
short: Upgrade an existing plugin
long: |-
    Upgrades an existing plugin to the specified remote plugin image. If no remote
    is specified, Docker will re-pull the current image and use the updated version.
    All existing references to the plugin will continue to work.
    The plugin must be disabled before running the upgrade.
usage: docker plugin upgrade [OPTIONS] PLUGIN [REMOTE]
@z

% pname: docker plugin
% plink: docker_plugin.yaml
% options:

@x disable-content-trust
      description: Skip image verification (deprecated)
@y
      description: Skip image verification (deprecated)
@z

@x grant-all-permissions
      description: Grant all permissions necessary to run the plugin
@y
      description: Grant all permissions necessary to run the plugin
@z

@x skip-remote-check
      description: |
        Do not check if specified remote plugin matches existing plugin image
@y
      description: |
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    The following example installs `vieus/sshfs` plugin, uses it to create and use
    a volume, then upgrades the plugin.
@y
examples: |-
    The following example installs `vieus/sshfs` plugin, uses it to create and use
    a volume, then upgrades the plugin.
@z

% snip command...
% snip directives...
