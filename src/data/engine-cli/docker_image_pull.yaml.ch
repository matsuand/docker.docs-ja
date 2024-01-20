%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image pull
aliases: docker image pull, docker pull
short: Download an image from a registry
long: |-
    Most of your images will be created on top of a base image from the
    [Docker Hub](https://hub.docker.com) registry.
@y
command: docker image pull
aliases: docker image pull, docker pull
short: Download an image from a registry
long: |-
    Most of your images will be created on top of a base image from the
    [Docker Hub](https://hub.docker.com) registry.
@z

@x
    [Docker Hub](https://hub.docker.com) contains many pre-built images that you
    can `pull` and try without needing to define and configure your own.
@y
    [Docker Hub](https://hub.docker.com) contains many pre-built images that you
    can `pull` and try without needing to define and configure your own.
@z

@x
    To download a particular image, or set of images (i.e., a repository),
    use `docker pull`.
@y
    To download a particular image, or set of images (i.e., a repository),
    use `docker pull`.
@z

@x
    ### Proxy configuration
@y
    ### Proxy configuration
@z

@x
    If you are behind an HTTP proxy server, for example in corporate settings,
    before open a connect to registry, you may need to configure the Docker
    daemon's proxy settings, refer to the [dockerd command-line reference](dockerd.md#proxy-configuration)
    for details.
@y
    If you are behind an HTTP proxy server, for example in corporate settings,
    before open a connect to registry, you may need to configure the Docker
    daemon's proxy settings, refer to the [dockerd command-line reference](dockerd.md#proxy-configuration)
    for details.
@z

@x
    ### Concurrent downloads
@y
    ### Concurrent downloads
@z

@x
    By default the Docker daemon will pull three layers of an image at a time.
    If you are on a low bandwidth connection this may cause timeout issues and you may want to lower
    this via the `--max-concurrent-downloads` daemon option. See the
    [daemon documentation](dockerd.md) for more details.
usage: docker image pull [OPTIONS] NAME[:TAG|@DIGEST]
pname: docker image
plink: docker_image.yaml
options:
    - option: all-tags
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Download all tagged images in the repository
      details_url: '#all-tags'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image verification
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Set platform if server is multi-platform capable
      deprecated: false
      hidden: false
      min_api_version: "1.32"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress verbose output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Pull an image from Docker Hub
@y
    By default the Docker daemon will pull three layers of an image at a time.
    If you are on a low bandwidth connection this may cause timeout issues and you may want to lower
    this via the `--max-concurrent-downloads` daemon option. See the
    [daemon documentation](dockerd.md) for more details.
usage: docker image pull [OPTIONS] NAME[:TAG|@DIGEST]
pname: docker image
plink: docker_image.yaml
options:
    - option: all-tags
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Download all tagged images in the repository
      details_url: '#all-tags'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image verification
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Set platform if server is multi-platform capable
      deprecated: false
      hidden: false
      min_api_version: "1.32"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress verbose output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Pull an image from Docker Hub
@z

@x
    To download a particular image, or set of images (i.e., a repository), use
    `docker image pull` (or the `docker pull` shorthand). If no tag is provided,
    Docker Engine uses the `:latest` tag as a default. This example pulls the
    `debian:latest` image:
@y
    To download a particular image, or set of images (i.e., a repository), use
    `docker image pull` (or the `docker pull` shorthand). If no tag is provided,
    Docker Engine uses the `:latest` tag as a default. This example pulls the
    `debian:latest` image:
@z

@x
    ```console
    $ docker image pull debian
@y
    ```console
    $ docker image pull debian
@z

@x
    Using default tag: latest
    latest: Pulling from library/debian
    e756f3fdd6a3: Pull complete
    Digest: sha256:3f1d6c17773a45c97bd8f158d665c9709d7b29ed7917ac934086ad96f92e4510
    Status: Downloaded newer image for debian:latest
    docker.io/library/debian:latest
    ```
@y
    Using default tag: latest
    latest: Pulling from library/debian
    e756f3fdd6a3: Pull complete
    Digest: sha256:3f1d6c17773a45c97bd8f158d665c9709d7b29ed7917ac934086ad96f92e4510
    Status: Downloaded newer image for debian:latest
    docker.io/library/debian:latest
    ```
@z

@x
    Docker images can consist of multiple layers. In the example above, the image
    consists of a single layer; `e756f3fdd6a3`.
@y
    Docker images can consist of multiple layers. In the example above, the image
    consists of a single layer; `e756f3fdd6a3`.
@z

@x
    Layers can be reused by images. For example, the `debian:bookworm` image shares
    its layer with the `debian:latest`. Pulling the `debian:bookworm` image therefore
    only pulls its metadata, but not its layers, because the layer is already present
    locally:
@y
    Layers can be reused by images. For example, the `debian:bookworm` image shares
    its layer with the `debian:latest`. Pulling the `debian:bookworm` image therefore
    only pulls its metadata, but not its layers, because the layer is already present
    locally:
@z

@x
    ```console
    $ docker image pull debian:bookworm
@y
    ```console
    $ docker image pull debian:bookworm
@z

@x
    bookworm: Pulling from library/debian
    Digest: sha256:3f1d6c17773a45c97bd8f158d665c9709d7b29ed7917ac934086ad96f92e4510
    Status: Downloaded newer image for debian:bookworm
    docker.io/library/debian:bookworm
    ```
@y
    bookworm: Pulling from library/debian
    Digest: sha256:3f1d6c17773a45c97bd8f158d665c9709d7b29ed7917ac934086ad96f92e4510
    Status: Downloaded newer image for debian:bookworm
    docker.io/library/debian:bookworm
    ```
@z

@x
    To see which images are present locally, use the [`docker images`](image_ls.md)
    command:
@y
    To see which images are present locally, use the [`docker images`](image_ls.md)
    command:
@z

@x
    ```console
    $ docker images
@y
    ```console
    $ docker images
@z

@x
    REPOSITORY   TAG        IMAGE ID       CREATED        SIZE
    debian       bookworm   4eacea30377a   8 days ago     124MB
    debian       latest     4eacea30377a   8 days ago     124MB
    ```
@y
    REPOSITORY   TAG        IMAGE ID       CREATED        SIZE
    debian       bookworm   4eacea30377a   8 days ago     124MB
    debian       latest     4eacea30377a   8 days ago     124MB
    ```
@z

@x
    Docker uses a content-addressable image store, and the image ID is a SHA256
    digest covering the image's configuration and layers. In the example above,
    `debian:bookworm` and `debian:latest` have the same image ID because they are
    the same image tagged with different names. Because they are the same image,
    their layers are stored only once and do not consume extra disk space.
@y
    Docker uses a content-addressable image store, and the image ID is a SHA256
    digest covering the image's configuration and layers. In the example above,
    `debian:bookworm` and `debian:latest` have the same image ID because they are
    the same image tagged with different names. Because they are the same image,
    their layers are stored only once and do not consume extra disk space.
@z

@x
    For more information about images, layers, and the content-addressable store,
    refer to [understand images, containers, and storage drivers](/storage/storagedriver/).
@y
    For more information about images, layers, and the content-addressable store,
    refer to [understand images, containers, and storage drivers](/storage/storagedriver/).
@z

@x
    ### Pull an image by digest (immutable identifier)
@y
    ### Pull an image by digest (immutable identifier)
@z

@x
    So far, you've pulled images by their name (and "tag"). Using names and tags is
    a convenient way to work with images. When using tags, you can `docker pull` an
    image again to make sure you have the most up-to-date version of that image.
    For example, `docker pull ubuntu:22.04` pulls the latest version of the Ubuntu
    22.04 image.
@y
    So far, you've pulled images by their name (and "tag"). Using names and tags is
    a convenient way to work with images. When using tags, you can `docker pull` an
    image again to make sure you have the most up-to-date version of that image.
    For example, `docker pull ubuntu:22.04` pulls the latest version of the Ubuntu
    22.04 image.
@z

@x
    In some cases you don't want images to be updated to newer versions, but prefer
    to use a fixed version of an image. Docker enables you to pull an image by its
    digest. When pulling an image by digest, you specify exactly which version
    of an image to pull. Doing so, allows you to "pin" an image to that version,
    and guarantee that the image you're using is always the same.
@y
    In some cases you don't want images to be updated to newer versions, but prefer
    to use a fixed version of an image. Docker enables you to pull an image by its
    digest. When pulling an image by digest, you specify exactly which version
    of an image to pull. Doing so, allows you to "pin" an image to that version,
    and guarantee that the image you're using is always the same.
@z

@x
    To know the digest of an image, pull the image first. Let's pull the latest
    `ubuntu:22.04` image from Docker Hub:
@y
    To know the digest of an image, pull the image first. Let's pull the latest
    `ubuntu:22.04` image from Docker Hub:
@z

@x
    ```console
    $ docker pull ubuntu:22.04
@y
    ```console
    $ docker pull ubuntu:22.04
@z

@x
    22.04: Pulling from library/ubuntu
    125a6e411906: Pull complete
    Digest: sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    Status: Downloaded newer image for ubuntu:22.04
    docker.io/library/ubuntu:22.04
    ```
@y
    22.04: Pulling from library/ubuntu
    125a6e411906: Pull complete
    Digest: sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    Status: Downloaded newer image for ubuntu:22.04
    docker.io/library/ubuntu:22.04
    ```
@z

@x
    Docker prints the digest of the image after the pull has finished. In the example
    above, the digest of the image is:
@y
    Docker prints the digest of the image after the pull has finished. In the example
    above, the digest of the image is:
@z

@x
    ```console
    sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    ```
@y
    ```console
    sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    ```
@z

@x
    Docker also prints the digest of an image when pushing to a registry. This
    may be useful if you want to pin to a version of the image you just pushed.
@y
    Docker also prints the digest of an image when pushing to a registry. This
    may be useful if you want to pin to a version of the image you just pushed.
@z

@x
    A digest takes the place of the tag when pulling an image, for example, to
    pull the above image by digest, run the following command:
@y
    A digest takes the place of the tag when pulling an image, for example, to
    pull the above image by digest, run the following command:
@z

@x
    ```console
    $ docker pull ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
@y
    ```console
    $ docker pull ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
@z

@x
    docker.io/library/ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d: Pulling from library/ubuntu
    Digest: sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    Status: Image is up to date for ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    docker.io/library/ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    ```
@y
    docker.io/library/ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d: Pulling from library/ubuntu
    Digest: sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    Status: Image is up to date for ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    docker.io/library/ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    ```
@z

@x
    Digest can also be used in the `FROM` of a Dockerfile, for example:
@y
    Digest can also be used in the `FROM` of a Dockerfile, for example:
@z

@x
    ```dockerfile
    FROM ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    LABEL org.opencontainers.image.authors="some maintainer <maintainer@example.com>"
    ```
@y
    ```dockerfile
    FROM ubuntu@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d
    LABEL org.opencontainers.image.authors="some maintainer <maintainer@example.com>"
    ```
@z

@x
    > **Note**
    >
    > Using this feature "pins" an image to a specific version in time.
    > Docker does therefore not pull updated versions of an image, which may include
    > security updates. If you want to pull an updated image, you need to change the
    > digest accordingly.
@y
    > **Note**
    >
    > Using this feature "pins" an image to a specific version in time.
    > Docker does therefore not pull updated versions of an image, which may include
    > security updates. If you want to pull an updated image, you need to change the
    > digest accordingly.
@z

@x
    ### Pull from a different registry
@y
    ### Pull from a different registry
@z

@x
    By default, `docker pull` pulls images from [Docker Hub](https://hub.docker.com). It is also possible to
    manually specify the path of a registry to pull from. For example, if you have
    set up a local registry, you can specify its path to pull from it. A registry
    path is similar to a URL, but does not contain a protocol specifier (`https://`).
@y
    By default, `docker pull` pulls images from [Docker Hub](https://hub.docker.com). It is also possible to
    manually specify the path of a registry to pull from. For example, if you have
    set up a local registry, you can specify its path to pull from it. A registry
    path is similar to a URL, but does not contain a protocol specifier (`https://`).
@z

@x
    The following command pulls the `testing/test-image` image from a local registry
    listening on port 5000 (`myregistry.local:5000`):
@y
    The following command pulls the `testing/test-image` image from a local registry
    listening on port 5000 (`myregistry.local:5000`):
@z

@x
    ```console
    $ docker image pull myregistry.local:5000/testing/test-image
    ```
@y
    ```console
    $ docker image pull myregistry.local:5000/testing/test-image
    ```
@z

@x
    Registry credentials are managed by [docker login](login.md).
@y
    Registry credentials are managed by [docker login](login.md).
@z

@x
    Docker uses the `https://` protocol to communicate with a registry, unless the
    registry is allowed to be accessed over an insecure connection. Refer to the
    [insecure registries](dockerd.md#insecure-registries) section for more information.
@y
    Docker uses the `https://` protocol to communicate with a registry, unless the
    registry is allowed to be accessed over an insecure connection. Refer to the
    [insecure registries](dockerd.md#insecure-registries) section for more information.
@z

@x
    ### Pull a repository with multiple images (-a, --all-tags) {#all-tags}
@y
    ### Pull a repository with multiple images (-a, --all-tags) {#all-tags}
@z

@x
    By default, `docker pull` pulls a single image from the registry. A repository
    can contain multiple images. To pull all images from a repository, provide the
    `-a` (or `--all-tags`) option when using `docker pull`.
@y
    By default, `docker pull` pulls a single image from the registry. A repository
    can contain multiple images. To pull all images from a repository, provide the
    `-a` (or `--all-tags`) option when using `docker pull`.
@z

@x
    This command pulls all images from the `ubuntu` repository:
@y
    This command pulls all images from the `ubuntu` repository:
@z

@x
    ```console
    $ docker image pull --all-tags ubuntu
@y
    ```console
    $ docker image pull --all-tags ubuntu
@z

@x
    Pulling repository ubuntu
    ad57ef8d78d7: Download complete
    105182bb5e8b: Download complete
    511136ea3c5a: Download complete
    73bd853d2ea5: Download complete
    ....
@y
    Pulling repository ubuntu
    ad57ef8d78d7: Download complete
    105182bb5e8b: Download complete
    511136ea3c5a: Download complete
    73bd853d2ea5: Download complete
    ....
@z

@x
    Status: Downloaded newer image for ubuntu
    ```
@y
    Status: Downloaded newer image for ubuntu
    ```
@z

@x
    After the pull has completed use the `docker image ls` command (or the `docker images`
    shorthand) to see the images that were pulled. The example below shows all the
    `ubuntu` images that are present locally:
@y
    After the pull has completed use the `docker image ls` command (or the `docker images`
    shorthand) to see the images that were pulled. The example below shows all the
    `ubuntu` images that are present locally:
@z

@x
    ```console
    $ docker image ls --filter reference=ubuntu
    REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
    ubuntu       18.04     c6ad7e71ba7d   5 weeks ago    63.2MB
    ubuntu       bionic    c6ad7e71ba7d   5 weeks ago    63.2MB
    ubuntu       22.04     5ccefbfc0416   2 months ago   78MB
    ubuntu       focal     ff0fea8310f3   2 months ago   72.8MB
    ubuntu       latest    ff0fea8310f3   2 months ago   72.8MB
    ubuntu       jammy     41ba606c8ab9   3 months ago   79MB
    ubuntu       20.04     ba6acccedd29   7 months ago   72.8MB
    ```
@y
    ```console
    $ docker image ls --filter reference=ubuntu
    REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
    ubuntu       18.04     c6ad7e71ba7d   5 weeks ago    63.2MB
    ubuntu       bionic    c6ad7e71ba7d   5 weeks ago    63.2MB
    ubuntu       22.04     5ccefbfc0416   2 months ago   78MB
    ubuntu       focal     ff0fea8310f3   2 months ago   72.8MB
    ubuntu       latest    ff0fea8310f3   2 months ago   72.8MB
    ubuntu       jammy     41ba606c8ab9   3 months ago   79MB
    ubuntu       20.04     ba6acccedd29   7 months ago   72.8MB
    ```
@z

@x
    ### Cancel a pull
@y
    ### Cancel a pull
@z

@x
    Killing the `docker pull` process, for example by pressing `CTRL-c` while it is
    running in a terminal, will terminate the pull operation.
@y
    Killing the `docker pull` process, for example by pressing `CTRL-c` while it is
    running in a terminal, will terminate the pull operation.
@z

@x
    ```console
    $ docker pull ubuntu
@y
    ```console
    $ docker pull ubuntu
@z

@x
    Using default tag: latest
    latest: Pulling from library/ubuntu
    a3ed95caeb02: Pulling fs layer
    236608c7b546: Pulling fs layer
    ^C
    ```
@y
    Using default tag: latest
    latest: Pulling from library/ubuntu
    a3ed95caeb02: Pulling fs layer
    236608c7b546: Pulling fs layer
    ^C
    ```
@z

@x
    The Engine terminates a pull operation when the connection between the daemon
    and the client (initiating the pull) is cut or lost for any reason or the
    command is manually terminated.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    The Engine terminates a pull operation when the connection between the daemon
    and the client (initiating the pull) is cut or lost for any reason or the
    command is manually terminated.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
