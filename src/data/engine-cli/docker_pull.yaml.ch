%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pull
aliases: docker image pull, docker pull
short: Download an image from a registry
long: Download an image from a registry
usage: docker pull [OPTIONS] NAME[:TAG|@DIGEST]
@y
command: docker pull
aliases: docker image pull, docker pull
short: Download an image from a registry
long: Download an image from a registry
usage: docker pull [OPTIONS] NAME[:TAG|@DIGEST]
@z

% pname: docker
% plink: docker.yaml
% options:

@x all-tags
      description: Download all tagged images in the repository
@y
      description: Download all tagged images in the repository
@z

@x disable-content-trust
      description: Skip image verification (deprecated)
@y
      description: Skip image verification (deprecated)
@z

@x platform
      description: Set platform if server is multi-platform capable
@y
      description: Set platform if server is multi-platform capable
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
