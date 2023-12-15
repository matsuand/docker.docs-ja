%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker save
aliases: docker image save, docker save
short: Save one or more images to a tar archive (streamed to STDOUT by default)
long: |-
    Produces a tarred repository to the standard output stream.
    Contains all parent layers, and all tags + versions, or specified `repo:tag`, for
    each argument provided.
usage: docker save [OPTIONS] IMAGE [IMAGE...]
pname: docker
plink: docker.yaml
options:
    - option: output
      shorthand: o
      value_type: string
      description: Write to a file, instead of STDOUT
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
    ### Create a backup that can then be used with `docker load`.
@y
command: docker save
aliases: docker image save, docker save
short: Save one or more images to a tar archive (streamed to STDOUT by default)
long: |-
    Produces a tarred repository to the standard output stream.
    Contains all parent layers, and all tags + versions, or specified `repo:tag`, for
    each argument provided.
usage: docker save [OPTIONS] IMAGE [IMAGE...]
pname: docker
plink: docker.yaml
options:
    - option: output
      shorthand: o
      value_type: string
      description: Write to a file, instead of STDOUT
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
    ### Create a backup that can then be used with `docker load`.
@z

@x
    ```console
    $ docker save busybox > busybox.tar
@y
    ```console
    $ docker save busybox > busybox.tar
@z

@x
    $ ls -sh busybox.tar
@y
    $ ls -sh busybox.tar
@z

@x
    2.7M busybox.tar
@y
    2.7M busybox.tar
@z

@x
    $ docker save --output busybox.tar busybox
@y
    $ docker save --output busybox.tar busybox
@z

@x
    $ ls -sh busybox.tar
@y
    $ ls -sh busybox.tar
@z

@x
    2.7M busybox.tar
@y
    2.7M busybox.tar
@z

@x
    $ docker save -o fedora-all.tar fedora
@y
    $ docker save -o fedora-all.tar fedora
@z

@x
    $ docker save -o fedora-latest.tar fedora:latest
    ```
@y
    $ docker save -o fedora-latest.tar fedora:latest
    ```
@z

@x
    ### Save an image to a tar.gz file using gzip
@y
    ### Save an image to a tar.gz file using gzip
@z

@x
    You can use gzip to save the image file and make the backup smaller.
@y
    You can use gzip to save the image file and make the backup smaller.
@z

@x
    ```console
    $ docker save myimage:latest | gzip > myimage_latest.tar.gz
    ```
@y
    ```console
    $ docker save myimage:latest | gzip > myimage_latest.tar.gz
    ```
@z

@x
    ### Cherry-pick particular tags
@y
    ### Cherry-pick particular tags
@z

@x
    You can even cherry-pick particular tags of an image repository.
@y
    You can even cherry-pick particular tags of an image repository.
@z

@x
    ```console
    $ docker save -o ubuntu.tar ubuntu:lucid ubuntu:saucy
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker save -o ubuntu.tar ubuntu:lucid ubuntu:saucy
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
