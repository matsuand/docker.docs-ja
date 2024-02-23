%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: |-
    Load an image or repository from a tar archive (even if compressed with gzip,
    bzip2, xz or zstd) from a file or STDIN. It restores both images and tags.
usage: docker image load [OPTIONS]
pname: docker image
plink: docker_image.yaml
options:
    - option: input
      shorthand: i
      value_type: string
      description: Read from tar archive file, instead of STDIN
      details_url: '#input'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress the load output
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
    ```console
    $ docker image ls
@y
command: docker image load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: |-
    Load an image or repository from a tar archive (even if compressed with gzip,
    bzip2, xz or zstd) from a file or STDIN. It restores both images and tags.
usage: docker image load [OPTIONS]
pname: docker image
plink: docker_image.yaml
options:
    - option: input
      shorthand: i
      value_type: string
      description: Read from tar archive file, instead of STDIN
      details_url: '#input'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress the load output
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
    ```console
    $ docker image ls
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    ```
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    ```
@z

@x
    ### Load images from STDIN
@y
    ### Load images from STDIN
@z

@x
    ```console
    $ docker load < busybox.tar.gz
@y
    ```console
    $ docker load < busybox.tar.gz
@z

@x
    Loaded image: busybox:latest
    $ docker images
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             latest              769b9341d937        7 weeks ago         2.489 MB
    ```
@y
    Loaded image: busybox:latest
    $ docker images
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             latest              769b9341d937        7 weeks ago         2.489 MB
    ```
@z

@x
    ### Load images from a file (--input) {#input}
@y
    ### Load images from a file (--input) {#input}
@z

@x
    ```console
    $ docker load --input fedora.tar
@y
    ```console
    $ docker load --input fedora.tar
@z

@x
    Loaded image: fedora:rawhide
    Loaded image: fedora:20
@y
    Loaded image: fedora:rawhide
    Loaded image: fedora:20
@z

@x
    $ docker images
@y
    $ docker images
@z

@x
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             latest              769b9341d937        7 weeks ago         2.489 MB
    fedora              rawhide             0d20aec6529d        7 weeks ago         387 MB
    fedora              20                  58394af37342        7 weeks ago         385.5 MB
    fedora              heisenbug           58394af37342        7 weeks ago         385.5 MB
    fedora              latest              58394af37342        7 weeks ago         385.5 MB
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    busybox             latest              769b9341d937        7 weeks ago         2.489 MB
    fedora              rawhide             0d20aec6529d        7 weeks ago         387 MB
    fedora              20                  58394af37342        7 weeks ago         385.5 MB
    fedora              heisenbug           58394af37342        7 weeks ago         385.5 MB
    fedora              latest              58394af37342        7 weeks ago         385.5 MB
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
