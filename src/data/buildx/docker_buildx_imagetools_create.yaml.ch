%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx imagetools create
short: Create a new image based on source images
long: |-
    Create a new manifest list based on source manifests. The source manifests can
    be manifest lists or single platform distribution manifests and must already
    exist in the registry where the new manifest is created. If only one source is
    specified, create performs a carbon copy.
usage: docker buildx imagetools create [OPTIONS] [SOURCE] [SOURCE...]
pname: docker buildx imagetools
plink: docker_buildx_imagetools.yaml
options:
    - option: annotation
      value_type: stringArray
      default_value: '[]'
      description: Add annotation to the image
      details_url: '#annotation'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: append
      value_type: bool
      default_value: "false"
      description: Append to existing manifest
      details_url: '#append'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Show final image instead of pushing
      details_url: '#dry-run'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: file
      shorthand: f
      value_type: stringArray
      default_value: '[]'
      description: Read source descriptor from file
      details_url: '#file'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      shorthand: t
      value_type: stringArray
      default_value: '[]'
      description: Set reference for new image
      details_url: '#tag'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Add annotations to an image (--annotation) {#annotation}
@y
command: docker buildx imagetools create
short: Create a new image based on source images
long: |-
    Create a new manifest list based on source manifests. The source manifests can
    be manifest lists or single platform distribution manifests and must already
    exist in the registry where the new manifest is created. If only one source is
    specified, create performs a carbon copy.
usage: docker buildx imagetools create [OPTIONS] [SOURCE] [SOURCE...]
pname: docker buildx imagetools
plink: docker_buildx_imagetools.yaml
options:
    - option: annotation
      value_type: stringArray
      default_value: '[]'
      description: Add annotation to the image
      details_url: '#annotation'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: append
      value_type: bool
      default_value: "false"
      description: Append to existing manifest
      details_url: '#append'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Show final image instead of pushing
      details_url: '#dry-run'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: file
      shorthand: f
      value_type: stringArray
      default_value: '[]'
      description: Read source descriptor from file
      details_url: '#file'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      shorthand: t
      value_type: stringArray
      default_value: '[]'
      description: Set reference for new image
      details_url: '#tag'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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

@x
    ```console
    $ docker buildx imagetools create \
      --annotation "index:org.opencontainers.image.authors=dvdksn" \
      --tag foo/bar:latest \
      foo/bar:alpha foo/bar:beta foo/bar:gamma
    ```
@y
    ```console
    $ docker buildx imagetools create \
      --annotation "index:org.opencontainers.image.authors=dvdksn" \
      --tag foo/bar:latest \
      foo/bar:alpha foo/bar:beta foo/bar:gamma
    ```
@z

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
    [Annotations](/build/building/annotations/).
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
    Same as [`buildx --builder`](buildx.md#builder).
@y
    Same as [`buildx --builder`](buildx.md#builder).
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

@x
    ```text
    -f FILE or --file FILE
    ```
@y
    ```text
    -f FILE or --file FILE
    ```
@z

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

@x
    ```console
    $ docker buildx imagetools inspect --raw alpine | jq '.manifests[0] | .platform."os.version"="10.1"' > descr.json
    $ docker buildx imagetools create -f descr.json myuser/image
    ```
@y
    ```console
    $ docker buildx imagetools inspect --raw alpine | jq '.manifests[0] | .platform."os.version"="10.1"' > descr.json
    $ docker buildx imagetools create -f descr.json myuser/image
    ```
@z

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

@x
    ```text
    -t IMAGE or --tag IMAGE
    ```
@y
    ```text
    -t IMAGE or --tag IMAGE
    ```
@z

@x
    Use the `-t` or `--tag` flag to set the name of the image to be created.
@y
    Use the `-t` or `--tag` flag to set the name of the image to be created.
@z

@x
    ```console
    $ docker buildx imagetools create --dry-run alpine@sha256:5c40b3c27b9f13c873fefb2139765c56ce97fd50230f1f2d5c91e55dec171907 sha256:c4ba6347b0e4258ce6a6de2401619316f982b7bcc529f73d2a410d0097730204
    $ docker buildx imagetools create -t tonistiigi/myapp -f image1 -f image2
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker buildx imagetools create --dry-run alpine@sha256:5c40b3c27b9f13c873fefb2139765c56ce97fd50230f1f2d5c91e55dec171907 sha256:c4ba6347b0e4258ce6a6de2401619316f982b7bcc529f73d2a410d0097730204
    $ docker buildx imagetools create -t tonistiigi/myapp -f image1 -f image2
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
