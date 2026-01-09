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

% snip command...

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
    The following example switches the Docker CLI to use a [context](/reference/cli/docker/context/)
    named `remote-test-server`, which runs an older version of the Docker Engine
    on a Linux server:
@y
    The following example switches the Docker CLI to use a [context](__SUBDIR__/reference/cli/docker/context/)
    named `remote-test-server`, which runs an older version of the Docker Engine
    on a Linux server:
@z

% snip command...

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
    For example, if the CLI is connecting with Docker Engine version 27.5, it downgrades
    to API version 1.47 (refer to the [API version matrix](/reference/api/engine/#api-version-matrix)
    to learn about the supported API versions for Docker Engine):
@y
    For example, if the CLI is connecting with Docker Engine version 27.5, it downgrades
    to API version 1.47 (refer to the [API version matrix](__SUBDIR__/reference/api/engine/#api-version-matrix)
    to learn about the supported API versions for Docker Engine):
@z

% snip command...

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

% snip command...

@x
usage: docker version [OPTIONS]
@y
usage: docker version [OPTIONS]
@z

% pname: docker
% plink: docker.yaml
%  options:

@x format
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@y
      description: |-
        Format output using a custom template:
        'json':             Print in JSON format
        'TEMPLATE':         Print output using the given Go template.
        Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Format the output (--format) {#format}
@y
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

% snip command...

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

% snip command...

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

% snip command...
% snip directives...
