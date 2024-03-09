%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx imagetools create
short: Create a new image based on source images
long: |-
    Create a new manifest list based on source manifests. The source manifests can
    be manifest lists or single platform distribution manifests and must already
    exist in the registry where the new manifest is created. If only one source is
    specified, create performs a carbon copy.
usage: docker buildx imagetools create [OPTIONS] [SOURCE] [SOURCE...]
@y
command: docker buildx imagetools create
short: Create a new image based on source images
long: |-
    Create a new manifest list based on source manifests. The source manifests can
    be manifest lists or single platform distribution manifests and must already
    exist in the registry where the new manifest is created. If only one source is
    specified, create performs a carbon copy.
usage: docker buildx imagetools create [OPTIONS] [SOURCE] [SOURCE...]
@z

% options:

@x annotation
      description: Add annotation to the image
@y
      description: Add annotation to the image
@z

@x append
      description: Append to existing manifest
@y
      description: Append to existing manifest
@z

@x dry-run
      description: Show final image instead of pushing
@y
      description: Show final image instead of pushing
@z

@x file
      description: Read source descriptor from file
@y
      description: Read source descriptor from file
@z

@x progress
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
@y
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
@z

@x tag
      description: Set reference for new image
@y
      description: Set reference for new image
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x
examples: |-
    ### Add annotations to an image (--annotation) {#annotation}
@y
examples: |-
    ### Add annotations to an image (--annotation) {#annotation}
@z

@x
    The `--annotation` flag lets you add annotations the image index, manifest,
    and descriptors when creating a new image.
@y
    The `--annotation` flag lets you add annotations the image index, manifest,
    and descriptors when creating a new image.
@z

@x
    The following command creates a `foo/bar:latest` image with the
    `org.opencontainers.image.authors` annotation on the image index.
@y
    The following command creates a `foo/bar:latest` image with the
    `org.opencontainers.image.authors` annotation on the image index.
@z

% snip command...

@x
    > **Note**
    >
    > The `imagetools create` command supports adding annotations to the image
    > index and descriptor, using the following type prefixes:
    >
    > - `index:`
    > - `manifest-descriptor:`
    >
    > It doesn't support annotating manifests or OCI layouts.
@y
    > **Note**
    >
    > The `imagetools create` command supports adding annotations to the image
    > index and descriptor, using the following type prefixes:
    >
    > - `index:`
    > - `manifest-descriptor:`
    >
    > It doesn't support annotating manifests or OCI layouts.
@z

@x
    For more information about annotations, see
    [Annotations](/build/building/annotations/).
@y
    For more information about annotations, see
    [Annotations](__SUBDIR__/build/building/annotations/).
@z

@x
    ### Append new sources to an existing manifest list (--append) {#append}
@y
    ### Append new sources to an existing manifest list (--append) {#append}
@z

@x
    Use the `--append` flag to append the new sources to an existing manifest list
    in the destination.
@y
    Use the `--append` flag to append the new sources to an existing manifest list
    in the destination.
@z

@x
    ### Override the configured builder instance (--builder) {#builder}
@y
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Same as [`buildx --builder`](/reference/cli/docker/buildx/#builder).
@y
    Same as [`buildx --builder`](__SUBDIR__/reference/cli/docker/buildx/#builder).
@z

@x
    ### Show final image instead of pushing (--dry-run) {#dry-run}
@y
    ### Show final image instead of pushing (--dry-run) {#dry-run}
@z

@x
    Use the `--dry-run` flag to not push the image, just show it.
@y
    Use the `--dry-run` flag to not push the image, just show it.
@z

@x
    ### Read source descriptor from a file (-f, --file) {#file}
@y
    ### Read source descriptor from a file (-f, --file) {#file}
@z

% snip code...

@x
    Reads source from files. A source can be a manifest digest, manifest reference,
    or a JSON of OCI descriptor object.
@y
    Reads source from files. A source can be a manifest digest, manifest reference,
    or a JSON of OCI descriptor object.
@z

@x
    In order to define annotations or additional platform properties like `os.version` and
    `os.features` you need to add them in the OCI descriptor object encoded in JSON.
@y
    In order to define annotations or additional platform properties like `os.version` and
    `os.features` you need to add them in the OCI descriptor object encoded in JSON.
@z

% snip command...

@x
    The descriptor in the file is merged with existing descriptor in the registry if it exists.
@y
    The descriptor in the file is merged with existing descriptor in the registry if it exists.
@z

@x
    The supported fields for the descriptor are defined in [OCI spec](https://github.com/opencontainers/image-spec/blob/master/descriptor.md#properties) .
@y
    The supported fields for the descriptor are defined in [OCI spec](https://github.com/opencontainers/image-spec/blob/master/descriptor.md#properties) .
@z

@x
    ### Set reference for new image  (-t, --tag) {#tag}
@y
    ### Set reference for new image  (-t, --tag) {#tag}
@z

% snip code...

@x
    Use the `-t` or `--tag` flag to set the name of the image to be created.
@y
    Use the `-t` or `--tag` flag to set the name of the image to be created.
@z

% snip command...
% snip directives...
