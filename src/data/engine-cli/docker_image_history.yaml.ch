%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image history
aliases: docker image history, docker history
short: Show the history of an image
long: Show the history of an image
usage: docker image history [OPTIONS] IMAGE
@y
command: docker image history
aliases: docker image history, docker history
short: Show the history of an image
long: Show the history of an image
usage: docker image history [OPTIONS] IMAGE
@z

% options:

@x format
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@z

@x human
      description: Print sizes and dates in human readable format
@y
      description: Print sizes and dates in human readable format
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

@x platform
      description: |
        Show history for the given platform. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@y
      description: |
        Show history for the given platform. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@z

@x quiet
      description: Only show image IDs
@y
      description: Only show image IDs
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    To see how the `docker:latest` image was built:
@y
examples: |-
    To see how the `docker:latest` image was built:
@z

% snip command...

@x
    To see how the `docker:apache` image was added to a container's base image:
@y
    To see how the `docker:apache` image was added to a container's base image:
@z

% snip command...

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) will pretty-prints history output
    using a Go template.
@y
    The formatting option (`--format`) will pretty-prints history output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder     | Description                                                                                               |
    |-----------------|-----------------------------------------------------------------------------------------------------------|
    | `.ID`           | Image ID                                                                                                  |
    | `.CreatedSince` | Elapsed time since the image was created if `--human=true`, otherwise timestamp of when image was created |
    | `.CreatedAt`    | Timestamp of when image was created                                                                       |
    | `.CreatedBy`    | Command that was used to create the image                                                                 |
    | `.Size`         | Image disk size                                                                                           |
    | `.Comment`      | Comment for image                                                                                         |
@y
    | Placeholder     | Description                                                                                               |
    |-----------------|-----------------------------------------------------------------------------------------------------------|
    | `.ID`           | Image ID                                                                                                  |
    | `.CreatedSince` | Elapsed time since the image was created if `--human=true`, otherwise timestamp of when image was created |
    | `.CreatedAt`    | Timestamp of when image was created                                                                       |
    | `.CreatedBy`    | Command that was used to create the image                                                                 |
    | `.Size`         | Image disk size                                                                                           |
    | `.Comment`      | Comment for image                                                                                         |
@z

@x
    When using the `--format` option, the `history` command either
    outputs the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `history` command either
    outputs the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `ID` and `CreatedSince` entries separated by a colon (`:`) for the `busybox`
    image:
@y
    The following example uses a template without headers and outputs the
    `ID` and `CreatedSince` entries separated by a colon (`:`) for the `busybox`
    image:
@z

% snip command...

@x
    ### Show history for a specific platform (--platform) {#platform}
@y
    ### Show history for a specific platform (--platform) {#platform}
@z

@x
    The `--platform` option allows you to specify which platform variant to show
    history for if multiple platforms are present. By default, `docker history`
    shows the history for the daemon's native platform or if not present, the
    first available platform.
@y
    The `--platform` option allows you to specify which platform variant to show
    history for if multiple platforms are present. By default, `docker history`
    shows the history for the daemon's native platform or if not present, the
    first available platform.
@z

@x
    If the local image store has multiple platform variants of an image, the
    `--platform` option selects which variant to show the history for. An error
    is produced if the given platform is not present in the local image cache.
@y
    If the local image store has multiple platform variants of an image, the
    `--platform` option selects which variant to show the history for. An error
    is produced if the given platform is not present in the local image cache.
@z

@x
    The platform option takes the `os[/arch[/variant]]` format; for example,
    `linux/amd64` or `linux/arm64/v8`. Architecture and variant are optional,
    and if omitted falls back to the daemon's defaults.
@y
    The platform option takes the `os[/arch[/variant]]` format; for example,
    `linux/amd64` or `linux/arm64/v8`. Architecture and variant are optional,
    and if omitted falls back to the daemon's defaults.
@z

@x
    The following example pulls the RISC-V variant of the `alpine:latest` image
    and shows its history.
@y
    The following example pulls the RISC-V variant of the `alpine:latest` image
    and shows its history.
@z

% snip command...

@x
    The following example attempts to show the history for a platform variant of
    `alpine:latest` that doesn't exist in the local image store, resulting in
    an error.
@y
    The following example attempts to show the history for a platform variant of
    `alpine:latest` that doesn't exist in the local image store, resulting in
    an error.
@z

% snip command...
% snip directives...
