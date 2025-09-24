%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history import
short: Import build records into Docker Desktop
long: |-
    Import a build record from a `.dockerbuild` archive into Docker Desktop. This
    lets you view, inspect, and analyze builds created in other environments or CI
    pipelines.
usage: docker buildx history import [OPTIONS] -
@y
command: docker buildx history import
short: Import build records into Docker Desktop
long: |-
    Import a build record from a `.dockerbuild` archive into Docker Desktop. This
    lets you view, inspect, and analyze builds created in other environments or CI
    pipelines.
usage: docker buildx history import [OPTIONS] -
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
