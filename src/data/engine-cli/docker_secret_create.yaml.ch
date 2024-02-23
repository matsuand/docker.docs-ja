%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker secret create
short: Create a secret from a file or STDIN as content
long: |-
    Creates a secret using standard input or from a file for the secret content.
@y
command: docker secret create
short: Create a secret from a file or STDIN as content
long: |-
    Creates a secret using standard input or from a file for the secret content.
@z

@x
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](/engine/swarm/secrets/).
@y
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](__SUBDIR__/engine/swarm/secrets/).
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker secret create [OPTIONS] SECRET [file|-]
pname: docker secret
plink: docker_secret.yaml
options:
    - option: driver
      shorthand: d
      value_type: string
      description: Secret driver
      deprecated: false
      hidden: false
      min_api_version: "1.31"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      shorthand: l
      value_type: list
      description: Secret labels
      details_url: '#label'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: template-driver
      value_type: string
      description: Template driver
      deprecated: false
      hidden: false
      min_api_version: "1.37"
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
    ### Create a secret
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker secret create [OPTIONS] SECRET [file|-]
pname: docker secret
plink: docker_secret.yaml
options:
    - option: driver
      shorthand: d
      value_type: string
      description: Secret driver
      deprecated: false
      hidden: false
      min_api_version: "1.31"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      shorthand: l
      value_type: list
      description: Secret labels
      details_url: '#label'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: template-driver
      value_type: string
      description: Template driver
      deprecated: false
      hidden: false
      min_api_version: "1.37"
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
    ### Create a secret
@z

@x
    ```console
    $ printf "my super secret password" | docker secret create my_secret -
@y
    ```console
    $ printf "my super secret password" | docker secret create my_secret -
@z

@x
    onakdyv307se2tl7nl20anokv
@y
    onakdyv307se2tl7nl20anokv
@z

@x
    $ docker secret ls
@y
    $ docker secret ls
@z

@x
    ID                          NAME                CREATED             UPDATED
    onakdyv307se2tl7nl20anokv   my_secret           6 seconds ago       6 seconds ago
    ```
@y
    ID                          NAME                CREATED             UPDATED
    onakdyv307se2tl7nl20anokv   my_secret           6 seconds ago       6 seconds ago
    ```
@z

@x
    ### Create a secret with a file
@y
    ### Create a secret with a file
@z

@x
    ```console
    $ docker secret create my_secret ./secret.json
@y
    ```console
    $ docker secret create my_secret ./secret.json
@z

@x
    dg426haahpi5ezmkkj5kyl3sn
@y
    dg426haahpi5ezmkkj5kyl3sn
@z

@x
    $ docker secret ls
@y
    $ docker secret ls
@z

@x
    ID                          NAME                CREATED             UPDATED
    dg426haahpi5ezmkkj5kyl3sn   my_secret           7 seconds ago       7 seconds ago
    ```
@y
    ID                          NAME                CREATED             UPDATED
    dg426haahpi5ezmkkj5kyl3sn   my_secret           7 seconds ago       7 seconds ago
    ```
@z

@x
    ### Create a secret with labels (--label) {#label}
@y
    ### Create a secret with labels (--label) {#label}
@z

@x
    ```console
    $ docker secret create \
      --label env=dev \
      --label rev=20170324 \
      my_secret ./secret.json
@y
    ```console
    $ docker secret create \
      --label env=dev \
      --label rev=20170324 \
      my_secret ./secret.json
@z

@x
    eo7jnzguqgtpdah3cm5srfb97
    ```
@y
    eo7jnzguqgtpdah3cm5srfb97
    ```
@z

@x
    ```console
    $ docker secret inspect my_secret
@y
    ```console
    $ docker secret inspect my_secret
@z

@x
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
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
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
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
