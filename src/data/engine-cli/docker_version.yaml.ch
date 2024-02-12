%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker version
short: Show the Docker version information
long: |-
    The version command prints the current version number for all independently
    versioned Docker components. Use the [`--format`](#format) option to customize
    the output.
@y
command: docker version
short: Show the Docker version information
long: |-
    The version command prints the current version number for all independently
    versioned Docker components. Use the [`--format`](#format) option to customize
    the output.
@z

@x
    The version command (`docker version`) outputs the version numbers of Docker
    components, while the `--version` flag (`docker --version`) outputs the version
    number of the Docker CLI you are using.
@y
    The version command (`docker version`) outputs the version numbers of Docker
    components, while the `--version` flag (`docker --version`) outputs the version
    number of the Docker CLI you are using.
@z

@x
    ### Default output
@y
    ### Default output
@z

@x
    The default output renders all version information divided into two sections;
    the `Client` section contains information about the Docker CLI and client
    components, and the `Server` section contains information about the Docker
    Engine and components used by the Docker Engine, such as the containerd and runc
    OCI Runtimes.
@y
    The default output renders all version information divided into two sections;
    the `Client` section contains information about the Docker CLI and client
    components, and the `Server` section contains information about the Docker
    Engine and components used by the Docker Engine, such as the containerd and runc
    OCI Runtimes.
@z

@x
    The information shown may differ depending on how you installed Docker and
    what components are in use. The following example shows the output on a macOS
    machine running Docker Desktop:
@y
    The information shown may differ depending on how you installed Docker and
    what components are in use. The following example shows the output on a macOS
    machine running Docker Desktop:
@z

@x
    ```console
    $ docker version
@y
    ```console
    $ docker version
@z

@x
    Client: Docker Engine - Community
     Version:           23.0.3
     API version:       1.42
     Go version:        go1.19.7
     Git commit:        3e7cbfd
     Built:             Tue Apr  4 22:05:41 2023
     OS/Arch:           darwin/amd64
     Context:           default
@y
    Client: Docker Engine - Community
     Version:           23.0.3
     API version:       1.42
     Go version:        go1.19.7
     Git commit:        3e7cbfd
     Built:             Tue Apr  4 22:05:41 2023
     OS/Arch:           darwin/amd64
     Context:           default
@z

@x
    Server: Docker Desktop 4.19.0 (12345)
     Engine:
      Version:          23.0.3
      API version:      1.42 (minimum version 1.12)
      Go version:       go1.19.7
      Git commit:       59118bf
      Built:            Tue Apr  4 22:05:41 2023
      OS/Arch:          linux/amd64
      Experimental:     false
     containerd:
      Version:          1.6.20
      GitCommit:        2806fc1057397dbaeefbea0e4e17bddfbd388f38
     runc:
      Version:          1.1.5
      GitCommit:        v1.1.5-0-gf19387a
     docker-init:
      Version:          0.19.0
      GitCommit:        de40ad0
    ```
@y
    Server: Docker Desktop 4.19.0 (12345)
     Engine:
      Version:          23.0.3
      API version:      1.42 (minimum version 1.12)
      Go version:       go1.19.7
      Git commit:       59118bf
      Built:            Tue Apr  4 22:05:41 2023
      OS/Arch:          linux/amd64
      Experimental:     false
     containerd:
      Version:          1.6.20
      GitCommit:        2806fc1057397dbaeefbea0e4e17bddfbd388f38
     runc:
      Version:          1.1.5
      GitCommit:        v1.1.5-0-gf19387a
     docker-init:
      Version:          0.19.0
      GitCommit:        de40ad0
    ```
@z

@x
    ### Client and server versions
@y
    ### Client and server versions
@z

@x
    Docker uses a client/server architecture, which allows you to use the Docker CLI
    on your local machine to control a Docker Engine running on a remote machine,
    which can be (for example) a machine running in the cloud or inside a virtual machine.
@y
    Docker uses a client/server architecture, which allows you to use the Docker CLI
    on your local machine to control a Docker Engine running on a remote machine,
    which can be (for example) a machine running in the cloud or inside a virtual machine.
@z

@x
    The following example switches the Docker CLI to use a [context](context.md)
    named `remote-test-server`, which runs an older version of the Docker Engine
    on a Linux server:
@y
    The following example switches the Docker CLI to use a [context](context.md)
    named `remote-test-server`, which runs an older version of the Docker Engine
    on a Linux server:
@z

@x
    ```console
    $ docker context use remote-test-server
    remote-test-server
@y
    ```console
    $ docker context use remote-test-server
    remote-test-server
@z

@x
    $ docker version
@y
    $ docker version
@z

@x
    Client: Docker Engine - Community
     Version:           23.0.3
     API version:       1.40 (downgraded from 1.42)
     Go version:        go1.19.7
     Git commit:        3e7cbfd
     Built:             Tue Apr  4 22:05:41 2023
     OS/Arch:           darwin/amd64
     Context:           remote-test-server
@y
    Client: Docker Engine - Community
     Version:           23.0.3
     API version:       1.40 (downgraded from 1.42)
     Go version:        go1.19.7
     Git commit:        3e7cbfd
     Built:             Tue Apr  4 22:05:41 2023
     OS/Arch:           darwin/amd64
     Context:           remote-test-server
@z

@x
    Server: Docker Engine - Community
     Engine:
      Version:          19.03.8
      API version:      1.40 (minimum version 1.12)
      Go version:       go1.12.17
      Git commit:       afacb8b
      Built:            Wed Mar 11 01:29:16 2020
      OS/Arch:          linux/amd64
     containerd:
      Version:          v1.2.13
      GitCommit:        7ad184331fa3e55e52b890ea95e65ba581ae3429
     runc:
      Version:          1.0.0-rc10
      GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
     docker-init:
      Version:          0.18.0
      GitCommit:        fec3683
    ```
@y
    Server: Docker Engine - Community
     Engine:
      Version:          19.03.8
      API version:      1.40 (minimum version 1.12)
      Go version:       go1.12.17
      Git commit:       afacb8b
      Built:            Wed Mar 11 01:29:16 2020
      OS/Arch:          linux/amd64
     containerd:
      Version:          v1.2.13
      GitCommit:        7ad184331fa3e55e52b890ea95e65ba581ae3429
     runc:
      Version:          1.0.0-rc10
      GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
     docker-init:
      Version:          0.18.0
      GitCommit:        fec3683
    ```
@z

@x
    ### API version and version negotiation
@y
    ### API version and version negotiation
@z

@x
    The API version used by the client depends on the Docker Engine that the Docker
    CLI is connecting with. When connecting with the Docker Engine, the Docker CLI
    and Docker Engine perform API version negotiation, and select the highest API
    version that is supported by both the Docker CLI and the Docker Engine.
@y
    The API version used by the client depends on the Docker Engine that the Docker
    CLI is connecting with. When connecting with the Docker Engine, the Docker CLI
    and Docker Engine perform API version negotiation, and select the highest API
    version that is supported by both the Docker CLI and the Docker Engine.
@z

@x
    For example, if the CLI is connecting with Docker Engine version 19.03, it downgrades
    to API version 1.40 (refer to the [API version matrix](/engine/api/#api-version-matrix)
    to learn about the supported API versions for Docker Engine):
@y
    For example, if the CLI is connecting with Docker Engine version 19.03, it downgrades
    to API version 1.40 (refer to the [API version matrix](__SUBDIR__/engine/api/#api-version-matrix)
    to learn about the supported API versions for Docker Engine):
@z

@x
    ```console
    $ docker version --format '{{.Client.APIVersion}}'
@y
    ```console
    $ docker version --format '{{.Client.APIVersion}}'
@z

@x
    1.40
    ```
@y
    1.40
    ```
@z

@x
    Be aware that API version can also be overridden using the `DOCKER_API_VERSION`
    environment variable, which can be useful for debugging purposes, and disables
    API version negotiation. The following example illustrates an environment where
    the `DOCKER_API_VERSION` environment variable is set. Unsetting the environment
    variable removes the override, and re-enables API version negotiation:
@y
    Be aware that API version can also be overridden using the `DOCKER_API_VERSION`
    environment variable, which can be useful for debugging purposes, and disables
    API version negotiation. The following example illustrates an environment where
    the `DOCKER_API_VERSION` environment variable is set. Unsetting the environment
    variable removes the override, and re-enables API version negotiation:
@z

@x
    ```console
    $ env | grep DOCKER_API_VERSION
    DOCKER_API_VERSION=1.39
@y
    ```console
    $ env | grep DOCKER_API_VERSION
    DOCKER_API_VERSION=1.39
@z

@x
    $ docker version --format '{{.Client.APIVersion}}'
    1.39
@y
    $ docker version --format '{{.Client.APIVersion}}'
    1.39
@z

@x
    $ unset DOCKER_API_VERSION
    $ docker version --format '{{.Client.APIVersion}}'
    1.42
    ```
usage: docker version [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: format
      shorthand: f
      value_type: string
      description: |-
        Format output using a custom template:
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
    ### Format the output (--format) {#format}
@y
    $ unset DOCKER_API_VERSION
    $ docker version --format '{{.Client.APIVersion}}'
    1.42
    ```
usage: docker version [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: format
      shorthand: f
      value_type: string
      description: |-
        Format output using a custom template:
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
    ### Format the output (--format) {#format}
@z

@x
    The formatting option (`--format`) pretty-prints the output using a Go template,
    which allows you to customize the output format, or to obtain specific information
    from the output. Refer to the [format command and log output](/config/formatting/)
    page for details of the format.
@y
    The formatting option (`--format`) pretty-prints the output using a Go template,
    which allows you to customize the output format, or to obtain specific information
    from the output. Refer to the [format command and log output](__SUBDIR__/config/formatting/)
    page for details of the format.
@z

@x
    ### Get the server version
@y
    ### Get the server version
@z

@x
    ```console
    $ docker version --format '{{.Server.Version}}'
@y
    ```console
    $ docker version --format '{{.Server.Version}}'
@z

@x
    23.0.3
    ```
@y
    23.0.3
    ```
@z

@x
    ### Get the client API version
@y
    ### Get the client API version
@z

@x
    The following example prints the API version that is used by the client:
@y
    The following example prints the API version that is used by the client:
@z

@x
    ```console
    $ docker version --format '{{.Client.APIVersion}}'
@y
    ```console
    $ docker version --format '{{.Client.APIVersion}}'
@z

@x
    1.42
    ```
@y
    1.42
    ```
@z

@x
    The version shown is the API version that is negotiated between the client
    and the Docker Engine. Refer to [API version and version negotiation](#api-version-and-version-negotiation)
    above for more information.
@y
    The version shown is the API version that is negotiated between the client
    and the Docker Engine. Refer to [API version and version negotiation](#api-version-and-version-negotiation)
    above for more information.
@z

@x
    ### Dump raw JSON data
@y
    ### Dump raw JSON data
@z

@x
    ```console
    $ docker version --format '{{json .}}'
@y
    ```console
    $ docker version --format '{{json .}}'
@z

@x
    {"Client":"Version":"23.0.3","ApiVersion":"1.42", ...}
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    {"Client":"Version":"23.0.3","ApiVersion":"1.42", ...}
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
