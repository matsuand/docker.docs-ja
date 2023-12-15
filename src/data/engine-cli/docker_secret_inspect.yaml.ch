%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker secret inspect
short: Display detailed information on one or more secrets
long: |-
    Inspects the specified secret.
@y
command: docker secret inspect
short: Display detailed information on one or more secrets
long: |-
    Inspects the specified secret.
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
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](/engine/swarm/secrets/).
@y
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](/engine/swarm/secrets/).
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker secret inspect [OPTIONS] SECRET [SECRET...]
pname: docker secret
plink: docker_secret.yaml
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
    ### Inspect a secret by name or ID
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker secret inspect [OPTIONS] SECRET [SECRET...]
pname: docker secret
plink: docker_secret.yaml
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
    ### Inspect a secret by name or ID
@z

@x
    You can inspect a secret, either by its *name*, or *ID*
@y
    You can inspect a secret, either by its *name*, or *ID*
@z

@x
    For example, given the following secret:
@y
    For example, given the following secret:
@z

@x
    ```console
    $ docker secret ls
@y
    ```console
    $ docker secret ls
@z

@x
    ID                          NAME                CREATED             UPDATED
    eo7jnzguqgtpdah3cm5srfb97   my_secret           3 minutes ago       3 minutes ago
    ```
@y
    ID                          NAME                CREATED             UPDATED
    eo7jnzguqgtpdah3cm5srfb97   my_secret           3 minutes ago       3 minutes ago
    ```
@z

@x
    ```console
    $ docker secret inspect secret.json
    ```
@y
    ```console
    $ docker secret inspect secret.json
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
          "Name": "my_secret",
          "Labels": {
            "env": "dev",
            "rev": "20170324"
          }
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
          "Name": "my_secret",
          "Labels": {
            "env": "dev",
            "rev": "20170324"
          }
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
    secret. The following example command outputs the creation time of the
    secret.
@y
    You can use the --format option to obtain specific information about a
    secret. The following example command outputs the creation time of the
    secret.
@z

@x
    ```console
    $ docker secret inspect --format='{{.CreatedAt}}' eo7jnzguqgtpdah3cm5srfb97
@y
    ```console
    $ docker secret inspect --format='{{.CreatedAt}}' eo7jnzguqgtpdah3cm5srfb97
@z

@x
    2017-03-24 08:15:09.735271783 +0000 UTC
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    2017-03-24 08:15:09.735271783 +0000 UTC
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
