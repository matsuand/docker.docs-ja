%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image save
aliases: docker image save, docker save
short: Save one or more images to a tar archive (streamed to STDOUT by default)
long: |-
    Produces a tarred repository to the standard output stream.
    Contains all parent layers, and all tags + versions, or specified `repo:tag`, for
    each argument provided.
usage: docker image save [OPTIONS] IMAGE [IMAGE...]
@y
command: docker image save
aliases: docker image save, docker save
short: Save one or more images to a tar archive (streamed to STDOUT by default)
long: |-
    Produces a tarred repository to the standard output stream.
    Contains all parent layers, and all tags + versions, or specified `repo:tag`, for
    each argument provided.
usage: docker image save [OPTIONS] IMAGE [IMAGE...]
@z

% options:

@x output
      description: Write to a file, instead of STDOUT
@y
      description: Write to a file, instead of STDOUT
@z

@x platform
      description: |
        Save only the given platform(s). Formatted as a comma-separated list of `os[/arch[/variant]]` (e.g., `linux/amd64,linux/arm64/v8`)
@y
      description: |
        Save only the given platform(s). Formatted as a comma-separated list of `os[/arch[/variant]]` (e.g., `linux/amd64,linux/arm64/v8`)
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Create a backup that can then be used with `docker load`.
@y
examples: |-
    ### Create a backup that can then be used with `docker load`.
@z

% snip command...

@x
    ### Save an image to a tar.gz file using gzip
@y
    ### Save an image to a tar.gz file using gzip
@z

@x
    You can use gzip to save the image file and make the backup smaller.
@y
    You can use gzip to save the image file and make the backup smaller.
@z

% snip command...

@x
    ### Cherry-pick particular tags
@y
    ### Cherry-pick particular tags
@z

@x
    You can even cherry-pick particular tags of an image repository.
@y
    You can even cherry-pick particular tags of an image repository.
@z

% snip command...

@x
    ### Save a specific platform (--platform) {#platform}
@y
    ### Save a specific platform (--platform) {#platform}
@z

@x
    The `--platform` option allows you to specify which platform variant of the
    image to save. By default, `docker save` saves all platform variants that
    are present in the daemon's image store. Use the `--platform` option
    to specify which platform variant of the image to save. An error is produced
    if the given platform is not present in the local image store.
@y
    The `--platform` option allows you to specify which platform variant of the
    image to save. By default, `docker save` saves all platform variants that
    are present in the daemon's image store. Use the `--platform` option
    to specify which platform variant of the image to save. An error is produced
    if the given platform is not present in the local image store.
@z

@x
    The platform option takes the `os[/arch[/variant]]` format; for example,
    `linux/amd64` or `linux/arm64/v8`. Architecture and variant are optional,
    and default to the daemon's native architecture if omitted.
@y
    The platform option takes the `os[/arch[/variant]]` format; for example,
    `linux/amd64` or `linux/arm64/v8`. Architecture and variant are optional,
    and default to the daemon's native architecture if omitted.
@z

@x
    The following example pulls the RISC-V variant of the `alpine:latest` image
    and saves it to a tar archive.
@y
    The following example pulls the RISC-V variant of the `alpine:latest` image
    and saves it to a tar archive.
@z

% snip command...

@x
    The following example attempts to save a platform variant of `alpine:latest`
    that doesn't exist in the local image store, resulting in an error.
@y
    The following example attempts to save a platform variant of `alpine:latest`
    that doesn't exist in the local image store, resulting in an error.
@z

% snip command...
% snip directives...
