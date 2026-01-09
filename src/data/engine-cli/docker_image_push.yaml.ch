%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker image push
aliases: docker image push, docker push
short: Upload an image to a registry
long: |-
    Use `docker image push` to share your images to the [Docker Hub](https://hub.docker.com)
    registry or to a self-hosted one.
@y
command: docker image push
aliases: docker image push, docker push
short: Upload an image to a registry
long: |-
    Use `docker image push` to share your images to the [Docker Hub](https://hub.docker.com)
    registry or to a self-hosted one.
@z

@x
    Refer to the [`docker image tag`](/reference/cli/docker/image/tag/) reference for more information
    about valid image and tag names.
@y
    Refer to the [`docker image tag`](__SUBDIR__/reference/cli/docker/image/tag/) reference for more information
    about valid image and tag names.
@z

@x
    Killing the `docker image push` process, for example by pressing `CTRL-c` while it is
    running in a terminal, terminates the push operation.
@y
    Killing the `docker image push` process, for example by pressing `CTRL-c` while it is
    running in a terminal, terminates the push operation.
@z

@x
    Progress bars are shown during docker push, which show the uncompressed size.
    The actual amount of data that's pushed will be compressed before sending, so
    the uploaded size will not be reflected by the progress bar.
@y
    Progress bars are shown during docker push, which show the uncompressed size.
    The actual amount of data that's pushed will be compressed before sending, so
    the uploaded size will not be reflected by the progress bar.
@z

@x
    Registry credentials are managed by [docker login](/reference/cli/docker/login/).
@y
    Registry credentials are managed by [docker login](__SUBDIR__/reference/cli/docker/login/).
@z

@x
    ### Concurrent uploads
@y
    ### Concurrent uploads
@z

@x
    By default the Docker daemon will push five layers of an image at a time.
    If you are on a low bandwidth connection this may cause timeout issues and you may want to lower
    this via the `--max-concurrent-uploads` daemon option. See the
    [daemon documentation](/reference/cli/dockerd/) for more details.
@y
    By default the Docker daemon will push five layers of an image at a time.
    If you are on a low bandwidth connection this may cause timeout issues and you may want to lower
    this via the `--max-concurrent-uploads` daemon option. See the
    [daemon documentation](__SUBDIR__/reference/cli/dockerd/) for more details.
@z

@x
usage: docker image push [OPTIONS] NAME[:TAG]
@y
usage: docker image push [OPTIONS] NAME[:TAG]
@z

% options:

@x all-tags
      description: Push all tags of an image to the repository
@y
      description: Push all tags of an image to the repository
@z

@x disable-content-trust
      description: Skip image verification (deprecated)
@y
      description: Skip image verification (deprecated)
@z

@x platform
      description: |-
        Push a platform-specific manifest as a single-platform image to the registry.
        Image index won't be pushed, meaning that other manifests, including attestations won't be preserved.
        'os[/arch[/variant]]': Explicit platform (eg. linux/amd64)
@y
      description: |-
        Push a platform-specific manifest as a single-platform image to the registry.
        Image index won't be pushed, meaning that other manifests, including attestations won't be preserved.
        'os[/arch[/variant]]': Explicit platform (eg. linux/amd64)
@z

@x quiet
      description: Suppress verbose output
@y
      description: Suppress verbose output
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Push a new image to a registry
@y
examples: |-
    ### Push a new image to a registry
@z

@x
    First save the new image by finding the container ID (using [`docker container
    ls`](/reference/cli/docker/container/ls/)) and then committing it to a new image name. Note that
    only `a-z0-9-_.` are allowed when naming images:
@y
    First save the new image by finding the container ID (using [`docker container
    ls`](__SUBDIR__/reference/cli/docker/container/ls/)) and then committing it to a new image name. Note that
    only `a-z0-9-_.` are allowed when naming images:
@z

@x
    ```console
    $ docker container commit c16378f943fe rhel-httpd:latest
    ```
@y
    ```console
    $ docker container commit c16378f943fe rhel-httpd:latest
    ```
@z

@x
    Now, push the image to the registry using the image ID. In this example the
    registry is on host named `registry-host` and listening on port `5000`. To do
    this, tag the image with the host name or IP address, and the port of the
    registry:
@y
    Now, push the image to the registry using the image ID. In this example the
    registry is on host named `registry-host` and listening on port `5000`. To do
    this, tag the image with the host name or IP address, and the port of the
    registry:
@z

@x
    ```console
    $ docker image tag rhel-httpd:latest registry-host:5000/myadmin/rhel-httpd:latest
@y
    ```console
    $ docker image tag rhel-httpd:latest registry-host:5000/myadmin/rhel-httpd:latest
@z

@x
    $ docker image push registry-host:5000/myadmin/rhel-httpd:latest
    ```
@y
    $ docker image push registry-host:5000/myadmin/rhel-httpd:latest
    ```
@z

@x
    Check that this worked by running:
@y
    Check that this worked by running:
@z

@x
    ```console
    $ docker image ls
    ```
@y
    ```console
    $ docker image ls
    ```
@z

@x
    You should see both `rhel-httpd` and `registry-host:5000/myadmin/rhel-httpd`
    listed.
@y
    You should see both `rhel-httpd` and `registry-host:5000/myadmin/rhel-httpd`
    listed.
@z

@x
    ### Push all tags of an image (-a, --all-tags) {#all-tags}
@y
    ### Push all tags of an image (-a, --all-tags) {#all-tags}
@z

@x
    Use the `-a` (or `--all-tags`) option to push all tags of a local image.
@y
    Use the `-a` (or `--all-tags`) option to push all tags of a local image.
@z

@x
    The following example creates multiple tags for an image, and pushes all those
    tags to Docker Hub.
@y
    The following example creates multiple tags for an image, and pushes all those
    tags to Docker Hub.
@z

@x
    ```console
    $ docker image tag myimage registry-host:5000/myname/myimage:latest
    $ docker image tag myimage registry-host:5000/myname/myimage:v1.0.1
    $ docker image tag myimage registry-host:5000/myname/myimage:v1.0
    $ docker image tag myimage registry-host:5000/myname/myimage:v1
    ```
@y
    ```console
    $ docker image tag myimage registry-host:5000/myname/myimage:latest
    $ docker image tag myimage registry-host:5000/myname/myimage:v1.0.1
    $ docker image tag myimage registry-host:5000/myname/myimage:v1.0
    $ docker image tag myimage registry-host:5000/myname/myimage:v1
    ```
@z

@x
    The image is now tagged under multiple names:
@y
    The image is now tagged under multiple names:
@z

@x
    ```console
    $ docker image ls
@y
    ```console
    $ docker image ls
@z

@x
    REPOSITORY                          TAG        IMAGE ID       CREATED      SIZE
    myimage                             latest     6d5fcfe5ff17   2 hours ago  1.22MB
    registry-host:5000/myname/myimage   latest     6d5fcfe5ff17   2 hours ago  1.22MB
    registry-host:5000/myname/myimage   v1         6d5fcfe5ff17   2 hours ago  1.22MB
    registry-host:5000/myname/myimage   v1.0       6d5fcfe5ff17   2 hours ago  1.22MB
    registry-host:5000/myname/myimage   v1.0.1     6d5fcfe5ff17   2 hours ago  1.22MB
    ```
@y
    REPOSITORY                          TAG        IMAGE ID       CREATED      SIZE
    myimage                             latest     6d5fcfe5ff17   2 hours ago  1.22MB
    registry-host:5000/myname/myimage   latest     6d5fcfe5ff17   2 hours ago  1.22MB
    registry-host:5000/myname/myimage   v1         6d5fcfe5ff17   2 hours ago  1.22MB
    registry-host:5000/myname/myimage   v1.0       6d5fcfe5ff17   2 hours ago  1.22MB
    registry-host:5000/myname/myimage   v1.0.1     6d5fcfe5ff17   2 hours ago  1.22MB
    ```
@z

@x
    When pushing with the `--all-tags` option, all tags of the `registry-host:5000/myname/myimage`
    image are pushed:
@y
    When pushing with the `--all-tags` option, all tags of the `registry-host:5000/myname/myimage`
    image are pushed:
@z

@x
    ```console
    $ docker image push --all-tags registry-host:5000/myname/myimage
@y
    ```console
    $ docker image push --all-tags registry-host:5000/myname/myimage
@z

@x
    The push refers to repository [registry-host:5000/myname/myimage]
    195be5f8be1d: Pushed
    latest: digest: sha256:edafc0a0fb057813850d1ba44014914ca02d671ae247107ca70c94db686e7de6 size: 4527
    195be5f8be1d: Layer already exists
    v1: digest: sha256:edafc0a0fb057813850d1ba44014914ca02d671ae247107ca70c94db686e7de6 size: 4527
    195be5f8be1d: Layer already exists
    v1.0: digest: sha256:edafc0a0fb057813850d1ba44014914ca02d671ae247107ca70c94db686e7de6 size: 4527
    195be5f8be1d: Layer already exists
    v1.0.1: digest: sha256:edafc0a0fb057813850d1ba44014914ca02d671ae247107ca70c94db686e7de6 size: 4527
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    The push refers to repository [registry-host:5000/myname/myimage]
    195be5f8be1d: Pushed
    latest: digest: sha256:edafc0a0fb057813850d1ba44014914ca02d671ae247107ca70c94db686e7de6 size: 4527
    195be5f8be1d: Layer already exists
    v1: digest: sha256:edafc0a0fb057813850d1ba44014914ca02d671ae247107ca70c94db686e7de6 size: 4527
    195be5f8be1d: Layer already exists
    v1.0: digest: sha256:edafc0a0fb057813850d1ba44014914ca02d671ae247107ca70c94db686e7de6 size: 4527
    195be5f8be1d: Layer already exists
    v1.0.1: digest: sha256:edafc0a0fb057813850d1ba44014914ca02d671ae247107ca70c94db686e7de6 size: 4527
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
