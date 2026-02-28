%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image tag
aliases: docker image tag, docker tag
short: Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
long: |-
    A Docker image reference consists of several components that describe where the
    image is stored and its identity. These components are:
@y
command: docker image tag
aliases: docker image tag, docker tag
short: Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
long: |-
    A Docker image reference consists of several components that describe where the
    image is stored and its identity. These components are:
@z

% snip text...

@x
    `HOST`
    : Specifies the registry location where the image resides. If omitted, Docker
      defaults to Docker Hub (`docker.io`).
@y
    `HOST`
    : Specifies the registry location where the image resides. If omitted, Docker
      defaults to Docker Hub (`docker.io`).
@z

@x
    `PORT`
    : An optional port number for the registry, if necessary (for example, `:5000`).
@y
    `PORT`
    : An optional port number for the registry, if necessary (for example, `:5000`).
@z

@x
    `NAMESPACE/REPOSITORY`
    : The namespace (optional) usually represents a user or organization. The
      repository is required and identifies the specific image. If the namespace is
      omitted, Docker defaults to `library`, the namespace reserved for Docker
      Official Images.
@y
    `NAMESPACE/REPOSITORY`
    : The namespace (optional) usually represents a user or organization. The
      repository is required and identifies the specific image. If the namespace is
      omitted, Docker defaults to `library`, the namespace reserved for Docker
      Official Images.
@z

@x
    `TAG`
    : An optional identifier used to specify a particular version or variant of the
      image. If no tag is provided, Docker defaults to `latest`.
@y
    `TAG`
    : An optional identifier used to specify a particular version or variant of the
      image. If no tag is provided, Docker defaults to `latest`.
@z

@x
    ### Example image references
@y
    ### Example image references
@z

@x
    `example.com:5000/team/my-app:2.0`
@y
    `example.com:5000/team/my-app:2.0`
@z

@x
    - Host: `example.com`
    - Port: `5000`
    - Namespace: `team`
    - Repository: `my-app`
    - Tag: `2.0`
@y
    - Host: `example.com`
    - Port: `5000`
    - Namespace: `team`
    - Repository: `my-app`
    - Tag: `2.0`
@z

@x
    `alpine`
@y
    `alpine`
@z

@x
    - Host: `docker.io` (default)
    - Namespace: `library` (default)
    - Repository: `alpine`
    - Tag: `latest` (default)
@y
    - Host: `docker.io` (default)
    - Namespace: `library` (default)
    - Repository: `alpine`
    - Tag: `latest` (default)
@z

@x
    For more information on the structure and rules of image naming, refer to the
    [Distribution reference](https://pkg.go.dev/github.com/distribution/reference#pkg-overview)
    as the canonical definition of the format.
@y
    For more information on the structure and rules of image naming, refer to the
    [Distribution reference](https://pkg.go.dev/github.com/distribution/reference#pkg-overview)
    as the canonical definition of the format.
@z

@x
usage: docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
@y
usage: docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Tag an image referenced by ID
@y
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

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...
% snip directives...
