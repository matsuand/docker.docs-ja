%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker image import
aliases: docker image import, docker import
short: Import the contents from a tarball to create a filesystem image
long: |-
    You can specify a `URL` or `-` (dash) to take data directly from `STDIN`. The
    `URL` can point to an archive (.tar, .tar.gz, .tgz, .bzip, .tar.xz, or .txz)
    containing a filesystem or to an individual file on the Docker host.  If you
    specify an archive, Docker untars it in the container relative to the `/`
    (root). If you specify an individual file, you must specify the full path within
    the host. To import from a remote location, specify a `URI` that begins with the
    `http://` or `https://` protocol.
usage: docker image import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
@y
command: docker image import
aliases: docker image import, docker import
short: Import the contents from a tarball to create a filesystem image
long: |-
    You can specify a `URL` or `-` (dash) to take data directly from `STDIN`. The
    `URL` can point to an archive (.tar, .tar.gz, .tgz, .bzip, .tar.xz, or .txz)
    containing a filesystem or to an individual file on the Docker host.  If you
    specify an archive, Docker untars it in the container relative to the `/`
    (root). If you specify an individual file, you must specify the full path within
    the host. To import from a remote location, specify a `URI` that begins with the
    `http://` or `https://` protocol.
usage: docker image import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
@z

% options:

@x change
      description: Apply Dockerfile instruction to the created image
@y
      description: Apply Dockerfile instruction to the created image
@z

@x message
      description: Set commit message for imported image
@y
      description: Set commit message for imported image
@z

@x platform
      description: Set platform if server is multi-platform capable
@y
      description: Set platform if server is multi-platform capable
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Import from a remote location
@y
examples: |-
    ### Import from a remote location
@z

@x
    This creates a new untagged image.
@y
    This creates a new untagged image.
@z

@x
    ```console
    $ docker import https://example.com/exampleimage.tgz
    ```
@y
    ```console
    $ docker import https://example.com/exampleimage.tgz
    ```
@z

@x
    ### Import from a local file
@y
    ### Import from a local file
@z

@x
    Import to docker via pipe and `STDIN`.
@y
    Import to docker via pipe and `STDIN`.
@z

@x
    ```console
    $ cat exampleimage.tgz | docker import - exampleimagelocal:new
    ```
@y
    ```console
    $ cat exampleimage.tgz | docker import - exampleimagelocal:new
    ```
@z

@x
    Import to docker from a local archive.
@y
    Import to docker from a local archive.
@z

@x
    ```console
    $ docker import /path/to/exampleimage.tgz
    ```
@y
    ```console
    $ docker import /path/to/exampleimage.tgz
    ```
@z

@x
    ### Import from a local directory
@y
    ### Import from a local directory
@z

@x
    ```console
    $ sudo tar -c . | docker import - exampleimagedir
    ```
@y
    ```console
    $ sudo tar -c . | docker import - exampleimagedir
    ```
@z

@x
    Note the `sudo` in this example – you must preserve
    the ownership of the files (especially root ownership) during the
    archiving with tar. If you are not root (or the sudo command) when you
    tar, then the ownerships might not get preserved.
@y
    Note the `sudo` in this example – you must preserve
    the ownership of the files (especially root ownership) during the
    archiving with tar. If you are not root (or the sudo command) when you
    tar, then the ownerships might not get preserved.
@z

@x
    ### Import with new configurations (-c, --change) {#change}
@y
    ### Import with new configurations (-c, --change) {#change}
@z

@x
    The `--change` option applies `Dockerfile` instructions to the image that is
    created. Not all `Dockerfile` instructions are supported; the list of instructions
    is limited to metadata (configuration) changes. The following `Dockerfile`
    instructions are supported:
@y
    The `--change` option applies `Dockerfile` instructions to the image that is
    created. Not all `Dockerfile` instructions are supported; the list of instructions
    is limited to metadata (configuration) changes. The following `Dockerfile`
    instructions are supported:
@z

@x
    - [`CMD`](/reference/dockerfile/#cmd)
    - [`ENTRYPOINT`](/reference/dockerfile/#entrypoint)
    - [`ENV`](/reference/dockerfile/#env)
    - [`EXPOSE`](/reference/dockerfile/#expose)
    - [`HEALTHCHECK`](/reference/dockerfile/#healthcheck)
    - [`LABEL`](/reference/dockerfile/#label)
    - [`ONBUILD`](/reference/dockerfile/#onbuild)
    - [`STOPSIGNAL`](/reference/dockerfile/#stopsignal)
    - [`USER`](/reference/dockerfile/#user)
    - [`VOLUME`](/reference/dockerfile/#volume)
    - [`WORKDIR`](/reference/dockerfile/#workdir)
@y
    - [`CMD`](__SUBDIR__/reference/dockerfile/#cmd)
    - [`ENTRYPOINT`](__SUBDIR__/reference/dockerfile/#entrypoint)
    - [`ENV`](__SUBDIR__/reference/dockerfile/#env)
    - [`EXPOSE`](__SUBDIR__/reference/dockerfile/#expose)
    - [`HEALTHCHECK`](__SUBDIR__/reference/dockerfile/#healthcheck)
    - [`LABEL`](__SUBDIR__/reference/dockerfile/#label)
    - [`ONBUILD`](__SUBDIR__/reference/dockerfile/#onbuild)
    - [`STOPSIGNAL`](__SUBDIR__/reference/dockerfile/#stopsignal)
    - [`USER`](__SUBDIR__/reference/dockerfile/#user)
    - [`VOLUME`](__SUBDIR__/reference/dockerfile/#volume)
    - [`WORKDIR`](__SUBDIR__/reference/dockerfile/#workdir)
@z

@x
    The following example imports an image from a TAR-file containing a root-filesystem,
    and sets the `DEBUG` environment-variable in the resulting image:
@y
    The following example imports an image from a TAR-file containing a root-filesystem,
    and sets the `DEBUG` environment-variable in the resulting image:
@z

@x
    ```console
    $ docker import --change "ENV DEBUG=true" ./rootfs.tgz exampleimagedir
    ```
@y
    ```console
    $ docker import --change "ENV DEBUG=true" ./rootfs.tgz exampleimagedir
    ```
@z

@x
    The `--change` option can be set multiple times to apply multiple `Dockerfile`
    instructions. The example below sets the `LABEL1` and `LABEL2` labels on
    the imported image, in addition to the `DEBUG` environment variable from
    the previous example:
@y
    The `--change` option can be set multiple times to apply multiple `Dockerfile`
    instructions. The example below sets the `LABEL1` and `LABEL2` labels on
    the imported image, in addition to the `DEBUG` environment variable from
    the previous example:
@z

@x
    ```console
    $ docker import \
        --change "ENV DEBUG=true" \
        --change "LABEL LABEL1=hello" \
        --change "LABEL LABEL2=world" \
        ./rootfs.tgz exampleimagedir
    ```
@y
    ```console
    $ docker import \
        --change "ENV DEBUG=true" \
        --change "LABEL LABEL1=hello" \
        --change "LABEL LABEL2=world" \
        ./rootfs.tgz exampleimagedir
    ```
@z

@x
    ### Import with a commit message (-m, --message) {#message}
@y
    ### Import with a commit message (-m, --message) {#message}
@z

@x
    The `--message`  (or `-m`) option allows you to set a custom comment in
    the image's metadata. The following example imports an image from a local
    archive and sets a custom message.
@y
    The `--message`  (or `-m`) option allows you to set a custom comment in
    the image's metadata. The following example imports an image from a local
    archive and sets a custom message.
@z

@x
    ```console
    $ docker import --message "New image imported from tarball" ./rootfs.tgz exampleimagelocal:new
    sha256:25e54c0df7dc49da9093d50541e0ed4508a6b78705057f1a9bebf1d564e2cb00
    ```
@y
    ```console
    $ docker import --message "New image imported from tarball" ./rootfs.tgz exampleimagelocal:new
    sha256:25e54c0df7dc49da9093d50541e0ed4508a6b78705057f1a9bebf1d564e2cb00
    ```
@z

@x
    After importing, the message is set in the "Comment" field of the image's
    configuration, which is shown when viewing the image's history:
@y
    After importing, the message is set in the "Comment" field of the image's
    configuration, which is shown when viewing the image's history:
@z

@x
    ```console
    $ docker image history exampleimagelocal:new
@y
    ```console
    $ docker image history exampleimagelocal:new
@z

@x
    IMAGE          CREATED         CREATED BY   SIZE      COMMENT
    25e54c0df7dc   2 minutes ago                53.6MB    New image imported from tarball
    ```
@y
    IMAGE          CREATED         CREATED BY   SIZE      COMMENT
    25e54c0df7dc   2 minutes ago                53.6MB    New image imported from tarball
    ```
@z

@x
    ### When the daemon supports multiple operating systems
@y
    ### When the daemon supports multiple operating systems
@z

@x
    If the daemon supports multiple operating systems, and the image being imported
    does not match the default operating system, it may be necessary to add
    `--platform`. This would be necessary when importing a Linux image into a Windows
    daemon.
@y
    If the daemon supports multiple operating systems, and the image being imported
    does not match the default operating system, it may be necessary to add
    `--platform`. This would be necessary when importing a Linux image into a Windows
    daemon.
@z

@x
    ```console
    $ docker import --platform=linux .\linuximage.tar
    ```
@y
    ```console
    $ docker import --platform=linux .\linuximage.tar
    ```
@z

@x
    ### Set the platform for the imported image (--platform) {#platform}
@y
    ### Set the platform for the imported image (--platform) {#platform}
@z

@x
    The `--platform` option allows you to specify the platform for the imported
    image. By default, the daemon's native platform is used as platform, but
    the `--platform` option allows you to override the default, for example, in
    situations where the imported root filesystem is for a different architecture
    or operating system.
@y
    The `--platform` option allows you to specify the platform for the imported
    image. By default, the daemon's native platform is used as platform, but
    the `--platform` option allows you to override the default, for example, in
    situations where the imported root filesystem is for a different architecture
    or operating system.
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
    The following example imports an image from a root-filesystem in `rootfs.tgz`,
    and sets the image's platform to `linux/amd64`;
@y
    The following example imports an image from a root-filesystem in `rootfs.tgz`,
    and sets the image's platform to `linux/amd64`;
@z

@x
    ```console
    $ docker image import --platform=linux/amd64  ./rootfs.tgz imported:latest
    sha256:44a8b44157dad5edcff85f0c93a3e455f3b20a046d025af4ec50ed990d7ebc09
    ```
@y
    ```console
    $ docker image import --platform=linux/amd64  ./rootfs.tgz imported:latest
    sha256:44a8b44157dad5edcff85f0c93a3e455f3b20a046d025af4ec50ed990d7ebc09
    ```
@z

@x
    After importing the image, the image's platform is set in the image's
    configuration;
@y
    After importing the image, the image's platform is set in the image's
    configuration;
@z

@x
    ```console
    $ docker image inspect --format '{{.Os}}/{{.Architecture}}' imported:latest
    linux/amd64
    ```
@y
    ```console
    $ docker image inspect --format '{{.Os}}/{{.Architecture}}' imported:latest
    linux/amd64
    ```
@z

% snip directives...
