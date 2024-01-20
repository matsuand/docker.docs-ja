%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker config inspect
short: Display detailed information on one or more configs
long: |-
    Inspects the specified config.
@y
command: docker config inspect
short: Display detailed information on one or more configs
long: |-
    Inspects the specified config.
@z

@x
    By default, this renders all results in a JSON array. If a format is specified,
    the given template will be executed for each result.
@y
    By default, this renders all results in a JSON array. If a format is specified,
    the given template will be executed for each result.
@z

@x
    Go's [text/template](https://pkg.go.dev/text/template) package
    describes all the details of the format.
@y
    Go's [text/template](https://pkg.go.dev/text/template) package
    describes all the details of the format.
@z

@x
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@y
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker config inspect [OPTIONS] CONFIG [CONFIG...]
pname: docker config
plink: docker_config.yaml
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
    - option: pretty
      value_type: bool
      default_value: "false"
      description: Print the information in a human friendly format
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
    ### Inspect a config by name or ID
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker config inspect [OPTIONS] CONFIG [CONFIG...]
pname: docker config
plink: docker_config.yaml
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
    - option: pretty
      value_type: bool
      default_value: "false"
      description: Print the information in a human friendly format
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
    ### Inspect a config by name or ID
@z

@x
    You can inspect a config, either by its *name*, or *ID*
@y
    You can inspect a config, either by its *name*, or *ID*
@z

@x
    For example, given the following config:
@y
    For example, given the following config:
@z

@x
    ```console
    $ docker config ls
@y
    ```console
    $ docker config ls
@z

@x
    ID                          NAME                CREATED             UPDATED
    eo7jnzguqgtpdah3cm5srfb97   my_config           3 minutes ago       3 minutes ago
    ```
@y
    ID                          NAME                CREATED             UPDATED
    eo7jnzguqgtpdah3cm5srfb97   my_config           3 minutes ago       3 minutes ago
    ```
@z

@x
    ```console
    $ docker config inspect config.json
    ```
@y
    ```console
    $ docker config inspect config.json
    ```
@z

@x
    The output is in JSON format, for example:
@y
    The output is in JSON format, for example:
@z

@x
    ```json
    [
      {
        "ID": "eo7jnzguqgtpdah3cm5srfb97",
        "Version": {
          "Index": 17
        },
        "CreatedAt": "2017-03-24T08:15:09.735271783Z",
        "UpdatedAt": "2017-03-24T08:15:09.735271783Z",
        "Spec": {
          "Name": "my_config",
          "Labels": {
            "env": "dev",
            "rev": "20170324"
          },
          "Data": "aGVsbG8K"
        }
      }
    ]
    ```
@y
    ```json
    [
      {
        "ID": "eo7jnzguqgtpdah3cm5srfb97",
        "Version": {
          "Index": 17
        },
        "CreatedAt": "2017-03-24T08:15:09.735271783Z",
        "UpdatedAt": "2017-03-24T08:15:09.735271783Z",
        "Spec": {
          "Name": "my_config",
          "Labels": {
            "env": "dev",
            "rev": "20170324"
          },
          "Data": "aGVsbG8K"
        }
      }
    ]
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    You can use the --format option to obtain specific information about a
    config. The following example command outputs the creation time of the
    config.
@y
    You can use the --format option to obtain specific information about a
    config. The following example command outputs the creation time of the
    config.
@z

@x
    ```console
    $ docker config inspect --format='{{.CreatedAt}}' eo7jnzguqgtpdah3cm5srfb97
@y
    ```console
    $ docker config inspect --format='{{.CreatedAt}}' eo7jnzguqgtpdah3cm5srfb97
@z

@x
    2017-03-24 08:15:09.735271783 +0000 UTC
    ```
deprecated: false
min_api_version: "1.30"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    2017-03-24 08:15:09.735271783 +0000 UTC
    ```
deprecated: false
min_api_version: "1.30"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
