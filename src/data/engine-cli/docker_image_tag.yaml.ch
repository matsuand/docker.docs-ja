%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker image tag
aliases: docker image tag, docker tag
short: Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
long: |-
    A full image name has the following format and components:
@y
command: docker image tag
aliases: docker image tag, docker tag
short: Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
long: |-
    A full image name has the following format and components:
@z

@x
    `[HOST[:PORT_NUMBER]/]PATH`
@y
    `[HOST[:PORT_NUMBER]/]PATH`
@z

@x
    - `HOST`: The optional registry hostname specifies where the image is located.
      The hostname must comply with standard DNS rules, but may not contain
      underscores. If you don't specify a hostname, the command uses Docker's public
      registry at `registry-1.docker.io` by default. Note that `docker.io` is the
      canonical reference for Docker's public registry.
    - `PORT_NUMBER`: If a hostname is present, it may optionally be followed by a
      registry port number in the format `:8080`.
    - `PATH`: The path consists of slash-separated components. Each
      component may contain lowercase letters, digits and separators. A separator is
      defined as a period, one or two underscores, or one or more hyphens. A component
      may not start or end with a separator. While the
      [OCI Distribution Specification](https://github.com/opencontainers/distribution-spec)
      supports more than two slash-separated components, most registries only support
      two slash-separated components. For Docker's public registry, the path format is
      as follows:
      - `[NAMESPACE/]REPOSITORY`: The first, optional component is typically a
      user's or an organization's namespace. The second, mandatory component is the
      repository name. When the namespace is not present, Docker uses `library`
      as the default namespace.
@y
    - `HOST`: The optional registry hostname specifies where the image is located.
      The hostname must comply with standard DNS rules, but may not contain
      underscores. If you don't specify a hostname, the command uses Docker's public
      registry at `registry-1.docker.io` by default. Note that `docker.io` is the
      canonical reference for Docker's public registry.
    - `PORT_NUMBER`: If a hostname is present, it may optionally be followed by a
      registry port number in the format `:8080`.
    - `PATH`: The path consists of slash-separated components. Each
      component may contain lowercase letters, digits and separators. A separator is
      defined as a period, one or two underscores, or one or more hyphens. A component
      may not start or end with a separator. While the
      [OCI Distribution Specification](https://github.com/opencontainers/distribution-spec)
      supports more than two slash-separated components, most registries only support
      two slash-separated components. For Docker's public registry, the path format is
      as follows:
      - `[NAMESPACE/]REPOSITORY`: The first, optional component is typically a
      user's or an organization's namespace. The second, mandatory component is the
      repository name. When the namespace is not present, Docker uses `library`
      as the default namespace.
@z

@x
    After the image name, the optional `TAG` is a custom, human-readable manifest
    identifier that's typically a specific version or variant of an image. The tag
    must be valid ASCII and can contain lowercase and uppercase letters, digits,
    underscores, periods, and hyphens. It can't start with a period or hyphen and
    must be no longer than 128 characters. If you don't specify a tag, the command uses `latest` by default.
@y
    After the image name, the optional `TAG` is a custom, human-readable manifest
    identifier that's typically a specific version or variant of an image. The tag
    must be valid ASCII and can contain lowercase and uppercase letters, digits,
    underscores, periods, and hyphens. It can't start with a period or hyphen and
    must be no longer than 128 characters. If you don't specify a tag, the command uses `latest` by default.
@z

@x
    You can group your images together using names and tags, and then
    [push](/engine/reference/commandline/push) them to a
    registry.
usage: docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
pname: docker image
plink: docker_image.yaml
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
    ### Tag an image referenced by ID
@y
    You can group your images together using names and tags, and then
    [push](__SUBDIR__/engine/reference/commandline/push) them to a
    registry.
usage: docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
pname: docker image
plink: docker_image.yaml
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
    ### Tag an image referenced by ID
@z

@x
    To tag a local image with ID `0e5574283393` as `fedora/httpd` with the tag
    `version1.0`:
@y
    To tag a local image with ID `0e5574283393` as `fedora/httpd` with the tag
    `version1.0`:
@z

@x
    ```console
    $ docker tag 0e5574283393 fedora/httpd:version1.0
    ```
@y
    ```console
    $ docker tag 0e5574283393 fedora/httpd:version1.0
    ```
@z

@x
    ### Tag an image referenced by Name
@y
    ### Tag an image referenced by Name
@z

@x
    To tag a local image `httpd` as `fedora/httpd` with the tag `version1.0`:
@y
    To tag a local image `httpd` as `fedora/httpd` with the tag `version1.0`:
@z

@x
    ```console
    $ docker tag httpd fedora/httpd:version1.0
    ```
@y
    ```console
    $ docker tag httpd fedora/httpd:version1.0
    ```
@z

@x
    Note that since the tag name isn't specified, the alias is created for an
    existing local version `httpd:latest`.
@y
    Note that since the tag name isn't specified, the alias is created for an
    existing local version `httpd:latest`.
@z

@x
    ### Tag an image referenced by Name and Tag
@y
    ### Tag an image referenced by Name and Tag
@z

@x
    To tag a local image with the name `httpd` and the tag `test` as `fedora/httpd`
    with the tag `version1.0.test`:
@y
    To tag a local image with the name `httpd` and the tag `test` as `fedora/httpd`
    with the tag `version1.0.test`:
@z

@x
    ```console
    $ docker tag httpd:test fedora/httpd:version1.0.test
    ```
@y
    ```console
    $ docker tag httpd:test fedora/httpd:version1.0.test
    ```
@z

@x
    ### Tag an image for a private registry
@y
    ### Tag an image for a private registry
@z

@x
    To push an image to a private registry and not the public Docker registry you
    must include the registry hostname and port (if needed).
@y
    To push an image to a private registry and not the public Docker registry you
    must include the registry hostname and port (if needed).
@z

@x
    ```console
    $ docker tag 0e5574283393 myregistryhost:5000/fedora/httpd:version1.0
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker tag 0e5574283393 myregistryhost:5000/fedora/httpd:version1.0
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
