%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker config create
short: Create a config from a file or STDIN
long: |-
    Creates a config using standard input or from a file for the config content.
@y
command: docker config create
short: Create a config from a file or STDIN
long: |-
    Creates a config using standard input or from a file for the config content.
@z

@x
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@y
    For detailed information about using configs, refer to [store configuration data using Docker Configs](__SUBDIR__/engine/swarm/configs/).
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker config create [OPTIONS] CONFIG file|-
pname: docker config
plink: docker_config.yaml
options:
    - option: label
      shorthand: l
      value_type: list
      description: Config labels
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
    ### Create a config
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker config create [OPTIONS] CONFIG file|-
pname: docker config
plink: docker_config.yaml
options:
    - option: label
      shorthand: l
      value_type: list
      description: Config labels
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
    ### Create a config
@z

@x
    ```console
    $ printf <config> | docker config create my_config -
@y
    ```console
    $ printf <config> | docker config create my_config -
@z

@x
    onakdyv307se2tl7nl20anokv
@y
    onakdyv307se2tl7nl20anokv
@z

@x
    $ docker config ls
@y
    $ docker config ls
@z

@x
    ID                          NAME                CREATED             UPDATED
    onakdyv307se2tl7nl20anokv   my_config           6 seconds ago       6 seconds ago
    ```
@y
    ID                          NAME                CREATED             UPDATED
    onakdyv307se2tl7nl20anokv   my_config           6 seconds ago       6 seconds ago
    ```
@z

@x
    ### Create a config with a file
@y
    ### Create a config with a file
@z

@x
    ```console
    $ docker config create my_config ./config.json
@y
    ```console
    $ docker config create my_config ./config.json
@z

@x
    dg426haahpi5ezmkkj5kyl3sn
@y
    dg426haahpi5ezmkkj5kyl3sn
@z

@x
    $ docker config ls
@y
    $ docker config ls
@z

@x
    ID                          NAME                CREATED             UPDATED
    dg426haahpi5ezmkkj5kyl3sn   my_config           7 seconds ago       7 seconds ago
    ```
@y
    ID                          NAME                CREATED             UPDATED
    dg426haahpi5ezmkkj5kyl3sn   my_config           7 seconds ago       7 seconds ago
    ```
@z

@x
    ### Create a config with labels (-l, --label) {#label}
@y
    ### Create a config with labels (-l, --label) {#label}
@z

@x
    ```console
    $ docker config create \
        --label env=dev \
        --label rev=20170324 \
        my_config ./config.json
@y
    ```console
    $ docker config create \
        --label env=dev \
        --label rev=20170324 \
        my_config ./config.json
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
    $ docker config inspect my_config
@y
    ```console
    $ docker config inspect my_config
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
deprecated: false
min_api_version: "1.30"
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
deprecated: false
min_api_version: "1.30"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
