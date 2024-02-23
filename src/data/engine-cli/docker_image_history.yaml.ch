%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image history
aliases: docker image history, docker history
short: Show the history of an image
long: Show the history of an image
usage: docker image history [OPTIONS] IMAGE
pname: docker image
plink: docker_image.yaml
options:
    - option: format
      value_type: string
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: human
      shorthand: H
      value_type: bool
      default_value: "true"
      description: Print sizes and dates in human readable format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Don't truncate output
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
      description: Only show image IDs
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
    To see how the `docker:latest` image was built:
@y
command: docker image history
aliases: docker image history, docker history
short: Show the history of an image
long: Show the history of an image
usage: docker image history [OPTIONS] IMAGE
pname: docker image
plink: docker_image.yaml
options:
    - option: format
      value_type: string
      description: |-
        Format output using a custom template:
        'table':            Print output in table format with column headers (default)
        'table TEMPLATE':   Print output in table format using the given Go template
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: human
      shorthand: H
      value_type: bool
      default_value: "true"
      description: Print sizes and dates in human readable format
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-trunc
      value_type: bool
      default_value: "false"
      description: Don't truncate output
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
      description: Only show image IDs
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
    To see how the `docker:latest` image was built:
@z

@x
    ```console
    $ docker history docker
@y
    ```console
    $ docker history docker
@z

@x
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    3e23a5875458        8 days ago          /bin/sh -c #(nop) ENV LC_ALL=C.UTF-8            0 B
    8578938dd170        8 days ago          /bin/sh -c dpkg-reconfigure locales &&    loc   1.245 MB
    be51b77efb42        8 days ago          /bin/sh -c apt-get update && apt-get install    338.3 MB
    4b137612be55        6 weeks ago         /bin/sh -c #(nop) ADD jessie.tar.xz in /        121 MB
    750d58736b4b        6 weeks ago         /bin/sh -c #(nop) MAINTAINER Tianon Gravi <ad   0 B
    511136ea3c5a        9 months ago                                                        0 B                 Imported from -
    ```
@y
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    3e23a5875458        8 days ago          /bin/sh -c #(nop) ENV LC_ALL=C.UTF-8            0 B
    8578938dd170        8 days ago          /bin/sh -c dpkg-reconfigure locales &&    loc   1.245 MB
    be51b77efb42        8 days ago          /bin/sh -c apt-get update && apt-get install    338.3 MB
    4b137612be55        6 weeks ago         /bin/sh -c #(nop) ADD jessie.tar.xz in /        121 MB
    750d58736b4b        6 weeks ago         /bin/sh -c #(nop) MAINTAINER Tianon Gravi <ad   0 B
    511136ea3c5a        9 months ago                                                        0 B                 Imported from -
    ```
@z

@x
    To see how the `docker:apache` image was added to a container's base image:
@y
    To see how the `docker:apache` image was added to a container's base image:
@z

@x
    ```console
    $ docker history docker:scm
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    2ac9d1098bf1        3 months ago        /bin/bash                                       241.4 MB            Added Apache to Fedora base image
    88b42ffd1f7c        5 months ago        /bin/sh -c #(nop) ADD file:1fd8d7f9f6557cafc7   373.7 MB
    c69cab00d6ef        5 months ago        /bin/sh -c #(nop) MAINTAINER Lokesh Mandvekar   0 B
    511136ea3c5a        19 months ago                                                       0 B                 Imported from -
    ```
@y
    ```console
    $ docker history docker:scm
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    2ac9d1098bf1        3 months ago        /bin/bash                                       241.4 MB            Added Apache to Fedora base image
    88b42ffd1f7c        5 months ago        /bin/sh -c #(nop) ADD file:1fd8d7f9f6557cafc7   373.7 MB
    c69cab00d6ef        5 months ago        /bin/sh -c #(nop) MAINTAINER Lokesh Mandvekar   0 B
    511136ea3c5a        19 months ago                                                       0 B                 Imported from -
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) will pretty-prints history output
    using a Go template.
@y
    The formatting option (`--format`) will pretty-prints history output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder     | Description                                                                                               |
    |-----------------|-----------------------------------------------------------------------------------------------------------|
    | `.ID`           | Image ID                                                                                                  |
    | `.CreatedSince` | Elapsed time since the image was created if `--human=true`, otherwise timestamp of when image was created |
    | `.CreatedAt`    | Timestamp of when image was created                                                                       |
    | `.CreatedBy`    | Command that was used to create the image                                                                 |
    | `.Size`         | Image disk size                                                                                           |
    | `.Comment`      | Comment for image                                                                                         |
@y
    | Placeholder     | Description                                                                                               |
    |-----------------|-----------------------------------------------------------------------------------------------------------|
    | `.ID`           | Image ID                                                                                                  |
    | `.CreatedSince` | Elapsed time since the image was created if `--human=true`, otherwise timestamp of when image was created |
    | `.CreatedAt`    | Timestamp of when image was created                                                                       |
    | `.CreatedBy`    | Command that was used to create the image                                                                 |
    | `.Size`         | Image disk size                                                                                           |
    | `.Comment`      | Comment for image                                                                                         |
@z

@x
    When using the `--format` option, the `history` command either
    outputs the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@y
    When using the `--format` option, the `history` command either
    outputs the data exactly as the template declares or, when using the
    `table` directive, includes column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `ID` and `CreatedSince` entries separated by a colon (`:`) for the `busybox`
    image:
@y
    The following example uses a template without headers and outputs the
    `ID` and `CreatedSince` entries separated by a colon (`:`) for the `busybox`
    image:
@z

@x
    ```console
    $ docker history --format "{{.ID}}: {{.CreatedSince}}" busybox
@y
    ```console
    $ docker history --format "{{.ID}}: {{.CreatedSince}}" busybox
@z

@x
    f6e427c148a7: 4 weeks ago
    <missing>: 4 weeks ago
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    f6e427c148a7: 4 weeks ago
    <missing>: 4 weeks ago
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
