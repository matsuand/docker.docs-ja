%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: |-
    Load an image or repository from a tar archive (even if compressed with gzip,
    bzip2, xz or zstd) from a file or STDIN. It restores both images and tags.
usage: docker image load [OPTIONS]
@y
@z

% options:

@x input
      description: Read from tar archive file, instead of STDIN
@y
@z

@x platform
      description: |
        Load only the given platform variant. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@y
@z

@x quiet
      description: Suppress the load output
@y
@z

% inherited_options:

@x help
      description: Print usage
@y
@z

@x
examples: |-
@y
examples: |-
@z

% snip command...

@x
    ### Load images from STDIN
@y
    ### Load images from STDIN
@z

% snip command...

@x
    ### Load images from a file (--input) {#input}
@y
    ### Load images from a file (--input) {#input}
@z

% snip command...

@x
    ### Load a specific platform (--platform) {#platform}
@y
    ### Load a specific platform (--platform) {#platform}
@z

@x
    The `--platform` option allows you to specify which platform variant of the
    image to load. By default, `docker load` loads all platform variants that
    are present in the archive. Use the `--platform` option to specify which
    platform variant of the image to load. An error is produced if the given
    platform is not present in the archive.
@y
    The `--platform` option allows you to specify which platform variant of the
    image to load. By default, `docker load` loads all platform variants that
    are present in the archive. Use the `--platform` option to specify which
    platform variant of the image to load. An error is produced if the given
    platform is not present in the archive.
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
    The following example loads the `linux/amd64` variant of an `alpine` image
    from an archive that contains multiple platform variants.
@y
    The following example loads the `linux/amd64` variant of an `alpine` image
    from an archive that contains multiple platform variants.
@z

% snip command...

@x
    The following example attempts to load a `linux/ppc64le` image from an
    archive, but the given platform is not present in the archive;
@y
    The following example attempts to load a `linux/ppc64le` image from an
    archive, but the given platform is not present in the archive;
@z

% snip command...
% snip directives...
