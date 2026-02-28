%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker push
aliases: docker image push, docker push
short: Upload an image to a registry
long: Upload an image to a registry
usage: docker push [OPTIONS] NAME[:TAG]
@y
command: docker push
aliases: docker image push, docker push
short: Upload an image to a registry
long: Upload an image to a registry
usage: docker push [OPTIONS] NAME[:TAG]
@z

% options:

@x all-tags
      description: Push all tags of an image to the repository
@y
      description: Push all tags of an image to the repository
@z

@x disable-content-trust
      description: Skip image verification (deprecated)
@y
      description: Skip image verification (deprecated)
@z

@x platform
      description: |-
        Push a platform-specific manifest as a single-platform image to the registry.
        Image index won't be pushed, meaning that other manifests, including attestations won't be preserved.
        'os[/arch[/variant]]': Explicit platform (eg. linux/amd64)
@y
      description: |-
        Push a platform-specific manifest as a single-platform image to the registry.
        Image index won't be pushed, meaning that other manifests, including attestations won't be preserved.
        'os[/arch[/variant]]': Explicit platform (eg. linux/amd64)
@z

@x quiet
      description: Suppress verbose output
@y
      description: Suppress verbose output
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

% snip directives...
