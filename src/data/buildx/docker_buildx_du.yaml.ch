%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx du
short: Disk usage
long: Disk usage
usage: docker buildx du
@y
command: docker buildx du
short: ディスク使用量
long: ディスク使用量。
usage: docker buildx du
@z

% options:

@x filter
      description: Provide filter values
@y
      description: Provide filter values
@z

@x verbose
      description: Provide a more verbose output
@y
      description: Provide a more verbose output
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x
examples: |-
    ### Show disk usage
@y
examples: |-
    ### ディスク使用量の表示 {#show-disk-usage}
@z

@x
    The `docker buildx du` command shows the disk usage for the currently selected
    builder.
@y
    The `docker buildx du` command shows the disk usage for the currently selected
    builder.
@z

% snip command...

@x
    If `RECLAIMABLE` is false, the `docker buildx du prune` command won't delete
    the record, even if you use `--all`. That's because the record is actively in
    use by some component of the builder.
@y
    If `RECLAIMABLE` is false, the `docker buildx du prune` command won't delete
    the record, even if you use `--all`. That's because the record is actively in
    use by some component of the builder.
@z

@x
    The asterisks (\*) in the default output indicate the following:
@y
    The asterisks (\*) in the default output indicate the following:
@z

@x
    - An asterisk next to an ID (`zu7m6evdpebh5h8kfkpw9dlf2*`) indicates that the record
      is mutable. The size of the record may change, or another build can take ownership of
      it and change or commit to it. If you run the `du` command again, this item may
      not be there anymore, or the size might be different.
    - An asterisk next to a size (`8.288kB*`) indicates that the record is shared.
      Storage of the record is shared with some other resource, typically an image.
      If you prune such a record then you will lose build cache but only metadata
      will be deleted as the image still needs to actual storage layers.
@y
    - An asterisk next to an ID (`zu7m6evdpebh5h8kfkpw9dlf2*`) indicates that the record
      is mutable. The size of the record may change, or another build can take ownership of
      it and change or commit to it. If you run the `du` command again, this item may
      not be there anymore, or the size might be different.
    - An asterisk next to a size (`8.288kB*`) indicates that the record is shared.
      Storage of the record is shared with some other resource, typically an image.
      If you prune such a record then you will lose build cache but only metadata
      will be deleted as the image still needs to actual storage layers.
@z

@x
    ### Use verbose output (--verbose) {#verbose}
@y
    ### Use verbose output (--verbose) {#verbose}
@z

@x
    The verbose output of the `docker buildx du` command is useful for inspecting
    the disk usage records in more detail. The verbose output shows the mutable and
    shared states more clearly, as well as additional information about the
    corresponding layer.
@y
    The verbose output of the `docker buildx du` command is useful for inspecting
    the disk usage records in more detail. The verbose output shows the mutable and
    shared states more clearly, as well as additional information about the
    corresponding layer.
@z

% snip command...

@x
    ### Override the configured builder instance (--builder) {#builder}
@y
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Use the `--builder` flag to inspect the disk usage of a particular builder.
@y
    Use the `--builder` flag to inspect the disk usage of a particular builder.
@z

% snip command...
% snip directives...
