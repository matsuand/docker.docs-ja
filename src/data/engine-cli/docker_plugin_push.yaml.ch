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

    Registry credentials are managed by [docker login](/reference/cli/docker/login/).
@y
command: docker plugin push
short: Push a plugin to a registry
long: |-
    After you have created a plugin using `docker plugin create` and the plugin is
    ready for distribution, use `docker plugin push` to share your images to Docker
    Hub or a self-hosted registry.

    Registry credentials are managed by [docker login](/reference/cli/docker/login/).
@z

@x
usage: docker plugin push [OPTIONS] PLUGIN[:TAG]
@y
usage: docker plugin push [OPTIONS] PLUGIN[:TAG]
@z

% pname: docker plugin
% plink: docker_plugin.yaml
% options:

@x disable-content-trust
      description: Skip image verification (deprecated)
@y
      description: Skip image verification (deprecated)
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    The following example shows how to push a sample `user/plugin`.
@y
examples: |-
    The following example shows how to push a sample `user/plugin`.
@z

% snip command...
% snip directives...
