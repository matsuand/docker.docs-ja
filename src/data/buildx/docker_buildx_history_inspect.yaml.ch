%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history inspect
short: Inspect a build record
long: |-
    Inspect a build record to view metadata such as duration, status, build inputs,
    platforms, outputs, and attached artifacts. You can also use flags to extract
    provenance, SBOMs, or other detailed information.
usage: docker buildx history inspect [OPTIONS] [REF]
@y
command: docker buildx history inspect
short: Inspect a build record
long: |-
    Inspect a build record to view metadata such as duration, status, build inputs,
    platforms, outputs, and attached artifacts. You can also use flags to extract
    provenance, SBOMs, or other detailed information.
usage: docker buildx history inspect [OPTIONS] [REF]
@z

% options:

@x format
      description: Format the output
@y
      description: Format the output
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
    ### Inspect the most recent build
@y
examples: |-
    ### Inspect the most recent build
@z

% snip command...

@x
    ### Inspect a specific build
@y
    ### Inspect a specific build
@z

@x within code
    # Using a build ID
@y
    # Using a build ID
@z
@x
    # Or using a relative offset
@y
    # Or using a relative offset
@z

@x
    The formatting options (`--format`) pretty-prints the output to `pretty` (default),
    `json` or using a Go template.
@y
    The formatting options (`--format`) pretty-prints the output to `pretty` (default),
    `json` or using a Go template.
@z

% snip command...
% snip directives...
