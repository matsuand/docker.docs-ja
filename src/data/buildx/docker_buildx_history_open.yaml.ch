%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history open
short: Open a build record in Docker Desktop
long: |-
    Open a build record in Docker Desktop for visual inspection. This requires
    Docker Desktop to be installed and running on the host machine.
usage: docker buildx history open [OPTIONS] [REF]
@y
command: docker buildx history open
short: Open a build record in Docker Desktop
long: |-
    Open a build record in Docker Desktop for visual inspection. This requires
    Docker Desktop to be installed and running on the host machine.
usage: docker buildx history open [OPTIONS] [REF]
@z


% inherited_options:

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

@x
examples: |-
    ### Open the most recent build in Docker Desktop
@y
examples: |-
    ### Open the most recent build in Docker Desktop
@z

% snip command...

@x
    By default, this opens the most recent build on the current builder.
@y
    By default, this opens the most recent build on the current builder.
@z

@x
    ### Open a specific build
@y
    ### Open a specific build
@z

@x within command
    # Using a build ID
@y
    # Using a build ID
@z
@x
    # Or using a relative offset
@y
    # Or using a relative offset
@z

% snip directives...
