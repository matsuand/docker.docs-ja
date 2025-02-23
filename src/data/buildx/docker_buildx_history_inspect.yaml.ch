%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history inspect
short: Inspect a build
long: Inspect a build
usage: docker buildx history inspect [OPTIONS] [REF]
@y
@z

% cname:
% clink:
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
    ### Format the output (--format) {#format}
@y
examples: |-
    ### Format the output (--format) {#format}
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
