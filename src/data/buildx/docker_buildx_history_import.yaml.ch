%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history import
short: Import a build into Docker Desktop
long: Import a build into Docker Desktop
usage: docker buildx history import [OPTIONS] < bundle.dockerbuild
@y
command: docker buildx history import
short: Import a build into Docker Desktop
long: Import a build into Docker Desktop
usage: docker buildx history import [OPTIONS] < bundle.dockerbuild
@z

% options:

@x file
      description: Import from a file path
@y
      description: Import from a file path
@z

inherited_options:
@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

% snip directives...
