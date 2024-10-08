%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker manifest
short: Manage Docker image manifests and manifest lists
long: |-
    The `docker manifest` command by itself performs no action. In order to operate
    on a manifest or manifest list, one of the subcommands must be used.
@y
command: docker manifest
short: Manage Docker image manifests and manifest lists
long: |-
    The `docker manifest` command by itself performs no action. In order to operate
    on a manifest or manifest list, one of the subcommands must be used.
@z

@x
    A single manifest is information about an image, such as layers, size, and
    digest. The `docker manifest` command also gives you additional information,
    such as the OS and architecture an image was built for.
@y
    A single manifest is information about an image, such as layers, size, and
    digest. The `docker manifest` command also gives you additional information,
    such as the OS and architecture an image was built for.
@z

@x
    A manifest list is a list of image layers that is created by specifying one or
    more (ideally more than one) image names. It can then be used in the same way as
    an image name in `docker pull` and `docker run` commands, for example.
@y
    A manifest list is a list of image layers that is created by specifying one or
    more (ideally more than one) image names. It can then be used in the same way as
    an image name in `docker pull` and `docker run` commands, for example.
@z

@x
    Ideally a manifest list is created from images that are identical in function for
    different os/arch combinations. For this reason, manifest lists are often referred
    to as "multi-arch images". However, a user could create a manifest list that points
    to two images -- one for Windows on AMD64, and one for Darwin on AMD64.
@y
    Ideally a manifest list is created from images that are identical in function for
    different os/arch combinations. For this reason, manifest lists are often referred
    to as "multi-arch images". However, a user could create a manifest list that points
    to two images -- one for Windows on AMD64, and one for Darwin on AMD64.
@z

@x
    ### manifest inspect
@y
    ### manifest inspect
@z

@x
    ```console
    $ docker manifest inspect --help
@y
    ```console
    $ docker manifest inspect --help
@z

@x
    Usage:  docker manifest inspect [OPTIONS] [MANIFEST_LIST] MANIFEST
@y
    Usage:  docker manifest inspect [OPTIONS] [MANIFEST_LIST] MANIFEST
@z

@x
    Display an image manifest, or manifest list
@y
    Display an image manifest, or manifest list
@z

@x
    Options:
          --help       Print usage
          --insecure   Allow communication with an insecure registry
      -v, --verbose    Output additional info including layers and platform
    ```
@y
    Options:
          --help       Print usage
          --insecure   Allow communication with an insecure registry
      -v, --verbose    Output additional info including layers and platform
    ```
@z

@x
    ### manifest create
@y
    ### manifest create
@z

@x
    ```console
    Usage:  docker manifest create MANIFEST_LIST MANIFEST [MANIFEST...]
@y
    ```console
    Usage:  docker manifest create MANIFEST_LIST MANIFEST [MANIFEST...]
@z

@x
    Create a local manifest list for annotating and pushing to a registry
@y
    Create a local manifest list for annotating and pushing to a registry
@z

@x
    Options:
      -a, --amend      Amend an existing manifest list
          --insecure   Allow communication with an insecure registry
          --help       Print usage
    ```
@y
    Options:
      -a, --amend      Amend an existing manifest list
          --insecure   Allow communication with an insecure registry
          --help       Print usage
    ```
@z

@x
    ### manifest annotate
@y
    ### manifest annotate
@z

@x
    ```console
    Usage:  docker manifest annotate [OPTIONS] MANIFEST_LIST MANIFEST
@y
    ```console
    Usage:  docker manifest annotate [OPTIONS] MANIFEST_LIST MANIFEST
@z

@x
    Add additional information to a local image manifest
@y
    Add additional information to a local image manifest
@z

@x
    Options:
          --arch string               Set architecture
          --help                      Print usage
          --os string                 Set operating system
          --os-version string         Set operating system version
          --os-features stringSlice   Set operating system feature
          --variant string            Set architecture variant
@y
    Options:
          --arch string               Set architecture
          --help                      Print usage
          --os string                 Set operating system
          --os-version string         Set operating system version
          --os-features stringSlice   Set operating system feature
          --variant string            Set architecture variant
@z

@x
    ```
@y
    ```
@z

@x
    ### manifest push
@y
    ### manifest push
@z

@x
    ```console
    Usage:  docker manifest push [OPTIONS] MANIFEST_LIST
@y
    ```console
    Usage:  docker manifest push [OPTIONS] MANIFEST_LIST
@z

@x
    Push a manifest list to a repository
@y
    Push a manifest list to a repository
@z

@x
    Options:
          --help       Print usage
          --insecure   Allow push to an insecure registry
      -p, --purge      Remove the local manifest list after push
    ```
@y
    Options:
          --help       Print usage
          --insecure   Allow push to an insecure registry
      -p, --purge      Remove the local manifest list after push
    ```
@z

@x
    ### Working with insecure registries
@y
    ### Working with insecure registries
@z

@x
    The manifest command interacts solely with a registry. Because of this,
    it has no way to query the engine for the list of allowed insecure registries.
    To allow the CLI to interact with an insecure registry, some `docker manifest`
    commands have an `--insecure` flag. For each transaction, such as a `create`,
    which queries a registry, the `--insecure` flag must be specified. This flag
    tells the CLI that this registry call may ignore security concerns like missing
    or self-signed certificates. Likewise, on a `manifest push` to an insecure
    registry, the `--insecure` flag must be specified. If this is not used with an
    insecure registry, the manifest command fails to find a registry that meets the
    default requirements.
usage: docker manifest COMMAND
pname: docker
plink: docker.yaml
cname:
    - docker manifest annotate
    - docker manifest create
    - docker manifest inspect
    - docker manifest push
    - docker manifest rm
clink:
    - docker_manifest_annotate.yaml
    - docker_manifest_create.yaml
    - docker_manifest_inspect.yaml
    - docker_manifest_push.yaml
    - docker_manifest_rm.yaml
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
    ### Inspect an image's manifest object
@y
    The manifest command interacts solely with a registry. Because of this,
    it has no way to query the engine for the list of allowed insecure registries.
    To allow the CLI to interact with an insecure registry, some `docker manifest`
    commands have an `--insecure` flag. For each transaction, such as a `create`,
    which queries a registry, the `--insecure` flag must be specified. This flag
    tells the CLI that this registry call may ignore security concerns like missing
    or self-signed certificates. Likewise, on a `manifest push` to an insecure
    registry, the `--insecure` flag must be specified. If this is not used with an
    insecure registry, the manifest command fails to find a registry that meets the
    default requirements.
usage: docker manifest COMMAND
pname: docker
plink: docker.yaml
cname:
    - docker manifest annotate
    - docker manifest create
    - docker manifest inspect
    - docker manifest push
    - docker manifest rm
clink:
    - docker_manifest_annotate.yaml
    - docker_manifest_create.yaml
    - docker_manifest_inspect.yaml
    - docker_manifest_push.yaml
    - docker_manifest_rm.yaml
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
    ### Inspect an image's manifest object
@z

@x
    ```console
    $ docker manifest inspect hello-world
    {
            "schemaVersion": 2,
            "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
            "config": {
                    "mediaType": "application/vnd.docker.container.image.v1+json",
                    "size": 1520,
                    "digest": "sha256:1815c82652c03bfd8644afda26fb184f2ed891d921b20a0703b46768f9755c57"
            },
            "layers": [
                    {
                            "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                            "size": 972,
                            "digest": "sha256:b04784fba78d739b526e27edc02a5a8cd07b1052e9283f5fc155828f4b614c28"
                    }
            ]
    }
    ```
@y
    ```console
    $ docker manifest inspect hello-world
    {
            "schemaVersion": 2,
            "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
            "config": {
                    "mediaType": "application/vnd.docker.container.image.v1+json",
                    "size": 1520,
                    "digest": "sha256:1815c82652c03bfd8644afda26fb184f2ed891d921b20a0703b46768f9755c57"
            },
            "layers": [
                    {
                            "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                            "size": 972,
                            "digest": "sha256:b04784fba78d739b526e27edc02a5a8cd07b1052e9283f5fc155828f4b614c28"
                    }
            ]
    }
    ```
@z

@x
    ### Inspect an image's manifest and get the os/arch info
@y
    ### Inspect an image's manifest and get the os/arch info
@z

@x
    The `docker manifest inspect` command takes an optional `--verbose` flag that
    gives you the image's name (Ref), as well as the architecture and OS (Platform).
@y
    The `docker manifest inspect` command takes an optional `--verbose` flag that
    gives you the image's name (Ref), as well as the architecture and OS (Platform).
@z

@x
    Just as with other Docker commands that take image names, you can refer to an image with or
    without a tag, or by digest (e.g. `hello-world@sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f`).
@y
    Just as with other Docker commands that take image names, you can refer to an image with or
    without a tag, or by digest (e.g. `hello-world@sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f`).
@z

@x
    Here is an example of inspecting an image's manifest with the `--verbose` flag:
@y
    Here is an example of inspecting an image's manifest with the `--verbose` flag:
@z

@x
    ```console
    $ docker manifest inspect --verbose hello-world
    {
            "Ref": "docker.io/library/hello-world:latest",
            "Digest": "sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f",
            "SchemaV2Manifest": {
                    "schemaVersion": 2,
                    "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
                    "config": {
                            "mediaType": "application/vnd.docker.container.image.v1+json",
                            "size": 1520,
                            "digest": "sha256:1815c82652c03bfd8644afda26fb184f2ed891d921b20a0703b46768f9755c57"
                    },
                    "layers": [
                            {
                                    "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                                    "size": 972,
                                    "digest": "sha256:b04784fba78d739b526e27edc02a5a8cd07b1052e9283f5fc155828f4b614c28"
                            }
                    ]
            },
            "Platform": {
                    "architecture": "amd64",
                    "os": "linux"
            }
    }
    ```
@y
    ```console
    $ docker manifest inspect --verbose hello-world
    {
            "Ref": "docker.io/library/hello-world:latest",
            "Digest": "sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f",
            "SchemaV2Manifest": {
                    "schemaVersion": 2,
                    "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
                    "config": {
                            "mediaType": "application/vnd.docker.container.image.v1+json",
                            "size": 1520,
                            "digest": "sha256:1815c82652c03bfd8644afda26fb184f2ed891d921b20a0703b46768f9755c57"
                    },
                    "layers": [
                            {
                                    "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                                    "size": 972,
                                    "digest": "sha256:b04784fba78d739b526e27edc02a5a8cd07b1052e9283f5fc155828f4b614c28"
                            }
                    ]
            },
            "Platform": {
                    "architecture": "amd64",
                    "os": "linux"
            }
    }
    ```
@z

@x
    ### Create and push a manifest list
@y
    ### Create and push a manifest list
@z

@x
    To create a manifest list, you first `create` the manifest list locally by
    specifying the constituent images you would like to have included in your
    manifest list. Keep in mind that this is pushed to a registry, so if you want to
    push to a registry other than the docker registry, you need to create your
    manifest list with the registry name or IP and port.
    This is similar to tagging an image and pushing it to a foreign registry.
@y
    To create a manifest list, you first `create` the manifest list locally by
    specifying the constituent images you would like to have included in your
    manifest list. Keep in mind that this is pushed to a registry, so if you want to
    push to a registry other than the docker registry, you need to create your
    manifest list with the registry name or IP and port.
    This is similar to tagging an image and pushing it to a foreign registry.
@z

@x
    After you have created your local copy of the manifest list, you may optionally
    `annotate` it. Annotations allowed are the architecture and operating system
    (overriding the image's current values), os features, and an architecture variant.
@y
    After you have created your local copy of the manifest list, you may optionally
    `annotate` it. Annotations allowed are the architecture and operating system
    (overriding the image's current values), os features, and an architecture variant.
@z

@x
    Finally, you need to `push` your manifest list to the desired registry. Below are
    descriptions of these three commands, and an example putting them all together.
@y
    Finally, you need to `push` your manifest list to the desired registry. Below are
    descriptions of these three commands, and an example putting them all together.
@z

@x
    ```console
    $ docker manifest create 45.55.81.106:5000/coolapp:v1 \
        45.55.81.106:5000/coolapp-ppc64le-linux:v1 \
        45.55.81.106:5000/coolapp-arm-linux:v1 \
        45.55.81.106:5000/coolapp-amd64-linux:v1 \
        45.55.81.106:5000/coolapp-amd64-windows:v1
@y
    ```console
    $ docker manifest create 45.55.81.106:5000/coolapp:v1 \
        45.55.81.106:5000/coolapp-ppc64le-linux:v1 \
        45.55.81.106:5000/coolapp-arm-linux:v1 \
        45.55.81.106:5000/coolapp-amd64-linux:v1 \
        45.55.81.106:5000/coolapp-amd64-windows:v1
@z

@x
    Created manifest list 45.55.81.106:5000/coolapp:v1
    ```
@y
    Created manifest list 45.55.81.106:5000/coolapp:v1
    ```
@z

@x
    ```console
    $ docker manifest annotate 45.55.81.106:5000/coolapp:v1 45.55.81.106:5000/coolapp-arm-linux --arch arm
    ```
@y
    ```console
    $ docker manifest annotate 45.55.81.106:5000/coolapp:v1 45.55.81.106:5000/coolapp-arm-linux --arch arm
    ```
@z

@x
    ```console
    $ docker manifest push 45.55.81.106:5000/coolapp:v1
    Pushed manifest 45.55.81.106:5000/coolapp@sha256:9701edc932223a66e49dd6c894a11db8c2cf4eccd1414f1ec105a623bf16b426 with digest: sha256:f67dcc5fc786f04f0743abfe0ee5dae9bd8caf8efa6c8144f7f2a43889dc513b
    Pushed manifest 45.55.81.106:5000/coolapp@sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f with digest: sha256:b64ca0b60356a30971f098c92200b1271257f100a55b351e6bbe985638352f3a
    Pushed manifest 45.55.81.106:5000/coolapp@sha256:39dc41c658cf25f33681a41310372f02728925a54aac3598310bfb1770615fc9 with digest: sha256:df436846483aff62bad830b730a0d3b77731bcf98ba5e470a8bbb8e9e346e4e8
    Pushed manifest 45.55.81.106:5000/coolapp@sha256:f91b1145cd4ac800b28122313ae9e88ac340bb3f1e3a4cd3e59a3648650f3275 with digest: sha256:5bb8e50aa2edd408bdf3ddf61efb7338ff34a07b762992c9432f1c02fc0e5e62
    sha256:050b213d49d7673ba35014f21454c573dcbec75254a08f4a7c34f66a47c06aba
@y
    ```console
    $ docker manifest push 45.55.81.106:5000/coolapp:v1
    Pushed manifest 45.55.81.106:5000/coolapp@sha256:9701edc932223a66e49dd6c894a11db8c2cf4eccd1414f1ec105a623bf16b426 with digest: sha256:f67dcc5fc786f04f0743abfe0ee5dae9bd8caf8efa6c8144f7f2a43889dc513b
    Pushed manifest 45.55.81.106:5000/coolapp@sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f with digest: sha256:b64ca0b60356a30971f098c92200b1271257f100a55b351e6bbe985638352f3a
    Pushed manifest 45.55.81.106:5000/coolapp@sha256:39dc41c658cf25f33681a41310372f02728925a54aac3598310bfb1770615fc9 with digest: sha256:df436846483aff62bad830b730a0d3b77731bcf98ba5e470a8bbb8e9e346e4e8
    Pushed manifest 45.55.81.106:5000/coolapp@sha256:f91b1145cd4ac800b28122313ae9e88ac340bb3f1e3a4cd3e59a3648650f3275 with digest: sha256:5bb8e50aa2edd408bdf3ddf61efb7338ff34a07b762992c9432f1c02fc0e5e62
    sha256:050b213d49d7673ba35014f21454c573dcbec75254a08f4a7c34f66a47c06aba
@z

@x
    ```
@y
    ```
@z

@x
    ### Inspect a manifest list
@y
    ### Inspect a manifest list
@z

@x
    ```console
    $ docker manifest inspect coolapp:v1
    {
       "schemaVersion": 2,
       "mediaType": "application/vnd.docker.distribution.manifest.list.v2+json",
       "manifests": [
          {
             "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
             "size": 424,
             "digest": "sha256:f67dcc5fc786f04f0743abfe0ee5dae9bd8caf8efa6c8144f7f2a43889dc513b",
             "platform": {
                "architecture": "arm",
                "os": "linux"
             }
          },
          {
             "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
             "size": 424,
             "digest": "sha256:b64ca0b60356a30971f098c92200b1271257f100a55b351e6bbe985638352f3a",
             "platform": {
                "architecture": "amd64",
                "os": "linux"
             }
          },
          {
             "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
             "size": 425,
             "digest": "sha256:df436846483aff62bad830b730a0d3b77731bcf98ba5e470a8bbb8e9e346e4e8",
             "platform": {
                "architecture": "ppc64le",
                "os": "linux"
             }
          },
          {
             "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
             "size": 425,
             "digest": "sha256:5bb8e50aa2edd408bdf3ddf61efb7338ff34a07b762992c9432f1c02fc0e5e62",
             "platform": {
                "architecture": "s390x",
                "os": "linux"
             }
          }
       ]
    }
    ```
@y
    ```console
    $ docker manifest inspect coolapp:v1
    {
       "schemaVersion": 2,
       "mediaType": "application/vnd.docker.distribution.manifest.list.v2+json",
       "manifests": [
          {
             "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
             "size": 424,
             "digest": "sha256:f67dcc5fc786f04f0743abfe0ee5dae9bd8caf8efa6c8144f7f2a43889dc513b",
             "platform": {
                "architecture": "arm",
                "os": "linux"
             }
          },
          {
             "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
             "size": 424,
             "digest": "sha256:b64ca0b60356a30971f098c92200b1271257f100a55b351e6bbe985638352f3a",
             "platform": {
                "architecture": "amd64",
                "os": "linux"
             }
          },
          {
             "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
             "size": 425,
             "digest": "sha256:df436846483aff62bad830b730a0d3b77731bcf98ba5e470a8bbb8e9e346e4e8",
             "platform": {
                "architecture": "ppc64le",
                "os": "linux"
             }
          },
          {
             "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
             "size": 425,
             "digest": "sha256:5bb8e50aa2edd408bdf3ddf61efb7338ff34a07b762992c9432f1c02fc0e5e62",
             "platform": {
                "architecture": "s390x",
                "os": "linux"
             }
          }
       ]
    }
    ```
@z

@x
    ### Push to an insecure registry
@y
    ### Push to an insecure registry
@z

@x
    Here is an example of creating and pushing a manifest list using a known
    insecure registry.
@y
    Here is an example of creating and pushing a manifest list using a known
    insecure registry.
@z

@x
    ```console
    $ docker manifest create --insecure myprivateregistry.mycompany.com/repo/image:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-ppc64le:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-s390x:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-arm:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-armhf:1.0 \
        myprivateregistry.mycompany.com/repo/image-windows-amd64:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-amd64:1.0
@y
    ```console
    $ docker manifest create --insecure myprivateregistry.mycompany.com/repo/image:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-ppc64le:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-s390x:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-arm:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-armhf:1.0 \
        myprivateregistry.mycompany.com/repo/image-windows-amd64:1.0 \
        myprivateregistry.mycompany.com/repo/image-linux-amd64:1.0
@z

@x
    $ docker manifest push --insecure myprivateregistry.mycompany.com/repo/image:tag
    ```
@y
    $ docker manifest push --insecure myprivateregistry.mycompany.com/repo/image:tag
    ```
@z

@x
    > [!NOTE]
    > The `--insecure` flag is not required to annotate a manifest list,
    > since annotations are to a locally-stored copy of a manifest list. You may also
    > skip the `--insecure` flag if you are performing a `docker manifest inspect`
    > on a locally-stored manifest list. Be sure to keep in mind that locally-stored
    > manifest lists are never used by the engine on a `docker pull`.
deprecated: false
hidden: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
    > [!NOTE]
    > The `--insecure` flag is not required to annotate a manifest list,
    > since annotations are to a locally-stored copy of a manifest list. You may also
    > skip the `--insecure` flag if you are performing a `docker manifest inspect`
    > on a locally-stored manifest list. Be sure to keep in mind that locally-stored
    > manifest lists are never used by the engine on a `docker pull`.
deprecated: false
hidden: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
