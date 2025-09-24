%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx dial-stdio
short: Proxy current stdio streams to builder instance
long: |-
    dial-stdio uses the stdin and stdout streams of the command to proxy to the
    configured builder instance. It is not intended to be used by humans, but
    rather by other tools that want to interact with the builder instance via
    BuildKit API.
usage: docker buildx dial-stdio
@y
command: docker buildx dial-stdio
short: Proxy current stdio streams to builder instance
long: |-
    dial-stdio uses the stdin and stdout streams of the command to proxy to the
    configured builder instance. It is not intended to be used by humans, but
    rather by other tools that want to interact with the builder instance via
    BuildKit API.
usage: docker buildx dial-stdio
@z

% options:

@x platform
      description: 'Target platform: this is used for node selection'
@y
      description: 'Target platform: this is used for node selection'
@z

@x progress
        Set type of progress output (`auto`, `plain`, `tty`, `rawjson`). Use plain to show container output
@y
        Set type of progress output (`auto`, `plain`, `tty`, `rawjson`). Use plain to show container output
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x
examples: |-
    Example go program that uses the dial-stdio command wire up a buildkit client.
    This is, for example, use only and may not be suitable for production use.
@y
examples: |-
    Example go program that uses the dial-stdio command wire up a buildkit client.
    This is, for example, use only and may not be suitable for production use.
@z

% snip code...

% snip directives...
