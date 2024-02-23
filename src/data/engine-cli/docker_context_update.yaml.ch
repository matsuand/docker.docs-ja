%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker context update
short: Update a context
long: |-
    Updates an existing `context`.
    See [context create](/reference/cli/docker/context/create/).
usage: docker context update [OPTIONS] CONTEXT
pname: docker context
plink: docker_context.yaml
options:
    - option: description
      value_type: string
      description: Description of the context
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: docker
      value_type: stringToString
      default_value: '[]'
      description: set the docker endpoint
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
    ### Update an existing context
@y
command: docker context update
short: Update a context
long: |-
    Updates an existing `context`.
    See [context create](__SUBDIR__/reference/cli/docker/context/create/).
usage: docker context update [OPTIONS] CONTEXT
pname: docker context
plink: docker_context.yaml
options:
    - option: description
      value_type: string
      description: Description of the context
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: docker
      value_type: stringToString
      default_value: '[]'
      description: set the docker endpoint
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
    ### Update an existing context
@z

@x
    ```console
    $ docker context update \
        --description "some description" \
        --docker "host=tcp://myserver:2376,ca=~/ca-file,cert=~/cert-file,key=~/key-file" \
        my-context
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker context update \
        --description "some description" \
        --docker "host=tcp://myserver:2376,ca=~/ca-file,cert=~/cert-file,key=~/key-file" \
        my-context
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
