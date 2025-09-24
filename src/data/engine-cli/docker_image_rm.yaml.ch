%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image rm
aliases: docker image rm, docker image remove, docker rmi
short: Remove one or more images
long: |-
    Removes (and un-tags) one or more images from the host node. If an image has
    multiple tags, using this command with the tag as a parameter only removes the
    tag. If the tag is the only one for the image, both the image and the tag are
    removed.
@y
command: docker image rm
aliases: docker image rm, docker image remove, docker rmi
short: Remove one or more images
long: |-
    Removes (and un-tags) one or more images from the host node. If an image has
    multiple tags, using this command with the tag as a parameter only removes the
    tag. If the tag is the only one for the image, both the image and the tag are
    removed.
@z

@x
    This does not remove images from a registry. You cannot remove an image of a
    running container unless you use the `-f` option. To see all images on a host
    use the [`docker image ls`](/reference/cli/docker/image/ls/) command.
@y
    This does not remove images from a registry. You cannot remove an image of a
    running container unless you use the `-f` option. To see all images on a host
    use the [`docker image ls`](/reference/cli/docker/image/ls/) command.
@z

@x
usage: docker image rm [OPTIONS] IMAGE [IMAGE...]
@y
usage: docker image rm [OPTIONS] IMAGE [IMAGE...]
@z

% options:

@x force
      description: Force removal of the image
@y
      description: Force removal of the image
@z

@x no-prune
      description: Do not delete untagged parents
@y
      description: Do not delete untagged parents
@z

@x platform
      description: |
        Remove only the given platform variant. Formatted as `os[/arch[/variant]]` (e.g., `linux/amd64`)
@y
      description: |
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    You can remove an image using its short or long ID, its tag, or its digest. If
    an image has one or more tags referencing it, you must remove all of them before
    the image is removed. Digest references are removed automatically when an image
    is removed by tag.
@y
examples: |-
    You can remove an image using its short or long ID, its tag, or its digest. If
    an image has one or more tags referencing it, you must remove all of them before
    the image is removed. Digest references are removed automatically when an image
    is removed by tag.
@z

% snip command...

@x
    If you use the `-f` flag and specify the image's short or long ID, then this
    command untags and removes all images that match the specified ID.
@y
    If you use the `-f` flag and specify the image's short or long ID, then this
    command untags and removes all images that match the specified ID.
@z

% snip command...

@x
    An image pulled by digest has no tag associated with it:
@y
    An image pulled by digest has no tag associated with it:
@z

% snip command...

@x
    To remove an image using its digest:
@y
    To remove an image using its digest:
@z

% snip command...

@x
    ### Remove specific platforms (`--platform`) {#platform}
@y
    ### Remove specific platforms (`--platform`) {#platform}
@z

@x
    The `--platform` option allows you to specify which platform variants of the
    image to remove. By default, `docker image remove` removes all platform variants
    that are present. Use the `--platform` option to specify which platform variant
    of the image to remove.
@y
    The `--platform` option allows you to specify which platform variants of the
    image to remove. By default, `docker image remove` removes all platform variants
    that are present. Use the `--platform` option to specify which platform variant
    of the image to remove.
@z

@x
    Removing a specific platform removes the image from all images that reference
    the same content, and requires the `--force` option to be used. Omitting the
    `--force` option produces a warning, and the remove is canceled:
@y
    Removing a specific platform removes the image from all images that reference
    the same content, and requires the `--force` option to be used. Omitting the
    `--force` option produces a warning, and the remove is canceled:
@z

% snip command...

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
    You can pass multiple platforms either by passing the `--platform` flag
    multiple times, or by passing a comma-separated list of platforms to remove.
    The following uses of this option are equivalent;
@y
    You can pass multiple platforms either by passing the `--platform` flag
    multiple times, or by passing a comma-separated list of platforms to remove.
    The following uses of this option are equivalent;
@z

% snip command...

@x
    The following example removes the `linux/amd64` and `linux/ppc64le` variants
    of an `alpine` image that contains multiple platform variants in the image
    cache:
@y
    The following example removes the `linux/amd64` and `linux/ppc64le` variants
    of an `alpine` image that contains multiple platform variants in the image
    cache:
@z

% snip command...

@x
    After the command completes, the given variants of the `alpine` image are removed
    from the image cache:
@y
    After the command completes, the given variants of the `alpine` image are removed
    from the image cache:
@z

% snip command...
% snip directives...
