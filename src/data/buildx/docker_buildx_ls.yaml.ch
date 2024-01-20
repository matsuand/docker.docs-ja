%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx ls
short: List builder instances
long: |-
    Lists all builder instances and the nodes for each instance.
@y
command: docker buildx ls
short: List builder instances
long: |-
    Lists all builder instances and the nodes for each instance.
@z

@x
    ```console
    $ docker buildx ls
    NAME/NODE           DRIVER/ENDPOINT                   STATUS    BUILDKIT   PLATFORMS
    elated_tesla*       docker-container
     \_ elated_tesla0    \_ unix:///var/run/docker.sock   running   v0.10.3    linux/amd64
     \_ elated_tesla1    \_ ssh://ubuntu@1.2.3.4          running   v0.10.3    linux/arm64*, linux/arm/v7, linux/arm/v6
    default             docker
     \_ default          \_ default                       running   v0.8.2     linux/amd64
    ```
@y
    ```console
    $ docker buildx ls
    NAME/NODE           DRIVER/ENDPOINT                   STATUS    BUILDKIT   PLATFORMS
    elated_tesla*       docker-container
     \_ elated_tesla0    \_ unix:///var/run/docker.sock   running   v0.10.3    linux/amd64
     \_ elated_tesla1    \_ ssh://ubuntu@1.2.3.4          running   v0.10.3    linux/arm64*, linux/arm/v7, linux/arm/v6
    default             docker
     \_ default          \_ default                       running   v0.8.2     linux/amd64
    ```
@z

@x
    Each builder has one or more nodes associated with it. The current builder's
    name is marked with a `*` in `NAME/NODE` and explicit node to build against for
    the target platform marked with a `*` in the `PLATFORMS` column.
usage: docker buildx ls
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: builder
      value_type: string
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: table
      description: Format the output
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Format the output (--format) {#format}
@y
    Each builder has one or more nodes associated with it. The current builder's
    name is marked with a `*` in `NAME/NODE` and explicit node to build against for
    the target platform marked with a `*` in the `PLATFORMS` column.
usage: docker buildx ls
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: builder
      value_type: string
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: table
      description: Format the output
      details_url: '#format'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Format the output (--format) {#format}
@z

@x
    The formatting options (`--format`) pretty-prints builder instances output
    using a Go template.
@y
    The formatting options (`--format`) pretty-prints builder instances output
    using a Go template.
@z

@x
    Valid placeholders for the Go template are listed below:
@y
    Valid placeholders for the Go template are listed below:
@z

@x
    | Placeholder       | Description                                 |
    |-------------------|---------------------------------------------|
    | `.Name`           | Builder or node name                        |
    | `.DriverEndpoint` | Driver (for builder) or Endpoint (for node) |
    | `.LastActivity`   | Builder last activity                       |
    | `.Status`         | Builder or node status                      |
    | `.Buildkit`       | BuildKit version of the node                |
    | `.Platforms`      | Available node's platforms                  |
    | `.Error`          | Error                                       |
    | `.Builder`        | Builder object                              |
@y
    | Placeholder       | Description                                 |
    |-------------------|---------------------------------------------|
    | `.Name`           | Builder or node name                        |
    | `.DriverEndpoint` | Driver (for builder) or Endpoint (for node) |
    | `.LastActivity`   | Builder last activity                       |
    | `.Status`         | Builder or node status                      |
    | `.Buildkit`       | BuildKit version of the node                |
    | `.Platforms`      | Available node's platforms                  |
    | `.Error`          | Error                                       |
    | `.Builder`        | Builder object                              |
@z

@x
    When using the `--format` option, the `ls` command will either output the data
    exactly as the template declares or, when using the `table` directive, includes
    column headers as well.
@y
    When using the `--format` option, the `ls` command will either output the data
    exactly as the template declares or, when using the `table` directive, includes
    column headers as well.
@z

@x
    The following example uses a template without headers and outputs the
    `Name` and `DriverEndpoint` entries separated by a colon (`:`):
@y
    The following example uses a template without headers and outputs the
    `Name` and `DriverEndpoint` entries separated by a colon (`:`):
@z

@x
    ```console
    $ docker buildx ls --format "{{.Name}}: {{.DriverEndpoint}}"
    elated_tesla: docker-container
    elated_tesla0: unix:///var/run/docker.sock
    elated_tesla1: ssh://ubuntu@1.2.3.4
    default: docker
    default: default
    ```
@y
    ```console
    $ docker buildx ls --format "{{.Name}}: {{.DriverEndpoint}}"
    elated_tesla: docker-container
    elated_tesla0: unix:///var/run/docker.sock
    elated_tesla1: ssh://ubuntu@1.2.3.4
    default: docker
    default: default
    ```
@z

@x
    The `Builder` placeholder can be used to access the builder object and its
    fields. For example, the following template outputs the builder's and
    nodes' names with their respective endpoints:
@y
    The `Builder` placeholder can be used to access the builder object and its
    fields. For example, the following template outputs the builder's and
    nodes' names with their respective endpoints:
@z

@x
    ```console
    $ docker buildx ls --format "{{.Builder.Name}}: {{range .Builder.Nodes}}\n  {{.Name}}: {{.Endpoint}}{{end}}"
    elated_tesla:
      elated_tesla0: unix:///var/run/docker.sock
      elated_tesla1: ssh://ubuntu@1.2.3.4
    default: docker
      default: default
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker buildx ls --format "{{.Builder.Name}}: {{range .Builder.Nodes}}\n  {{.Name}}: {{.Endpoint}}{{end}}"
    elated_tesla:
      elated_tesla0: unix:///var/run/docker.sock
      elated_tesla1: ssh://ubuntu@1.2.3.4
    default: docker
      default: default
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
