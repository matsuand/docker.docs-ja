%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker service inspect
short: Display detailed information on one or more services
long: |-
    Inspects the specified service.
@y
command: docker service inspect
short: Display detailed information on one or more services
long: |-
    Inspects the specified service.
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
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service inspect [OPTIONS] SERVICE [SERVICE...]
pname: docker service
plink: docker_service.yaml
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
      details_url: '#pretty'
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
    ### Inspect a service by name or ID
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker service inspect [OPTIONS] SERVICE [SERVICE...]
pname: docker service
plink: docker_service.yaml
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
      details_url: '#pretty'
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
    ### Inspect a service by name or ID
@z

@x
    You can inspect a service, either by its *name*, or *ID*
@y
    You can inspect a service, either by its *name*, or *ID*
@z

@x
    For example, given the following service;
@y
    For example, given the following service;
@z

@x
    ```console
    $ docker service ls
    ID            NAME   MODE        REPLICAS  IMAGE
    dmu1ept4cxcf  redis  replicated  3/3       redis:3.0.6
    ```
@y
    ```console
    $ docker service ls
    ID            NAME   MODE        REPLICAS  IMAGE
    dmu1ept4cxcf  redis  replicated  3/3       redis:3.0.6
    ```
@z

@x
    Both `docker service inspect redis`, and `docker service inspect dmu1ept4cxcf`
    produce the same result:
@y
    Both `docker service inspect redis`, and `docker service inspect dmu1ept4cxcf`
    produce the same result:
@z

@x
    ```console
    $ docker service inspect redis
    ```
@y
    ```console
    $ docker service inspect redis
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
        "ID": "dmu1ept4cxcfe8k8lhtux3ro3",
        "Version": {
          "Index": 12
        },
        "CreatedAt": "2016-06-17T18:44:02.558012087Z",
        "UpdatedAt": "2016-06-17T18:44:02.558012087Z",
        "Spec": {
          "Name": "redis",
          "TaskTemplate": {
            "ContainerSpec": {
              "Image": "redis:3.0.6"
            },
            "Resources": {
              "Limits": {},
              "Reservations": {}
            },
            "RestartPolicy": {
              "Condition": "any",
              "MaxAttempts": 0
            },
            "Placement": {}
          },
          "Mode": {
            "Replicated": {
              "Replicas": 1
            }
          },
          "UpdateConfig": {},
          "EndpointSpec": {
            "Mode": "vip"
          }
        },
        "Endpoint": {
          "Spec": {}
        }
      }
    ]
    ```
@y
    ```json
    [
      {
        "ID": "dmu1ept4cxcfe8k8lhtux3ro3",
        "Version": {
          "Index": 12
        },
        "CreatedAt": "2016-06-17T18:44:02.558012087Z",
        "UpdatedAt": "2016-06-17T18:44:02.558012087Z",
        "Spec": {
          "Name": "redis",
          "TaskTemplate": {
            "ContainerSpec": {
              "Image": "redis:3.0.6"
            },
            "Resources": {
              "Limits": {},
              "Reservations": {}
            },
            "RestartPolicy": {
              "Condition": "any",
              "MaxAttempts": 0
            },
            "Placement": {}
          },
          "Mode": {
            "Replicated": {
              "Replicas": 1
            }
          },
          "UpdateConfig": {},
          "EndpointSpec": {
            "Mode": "vip"
          }
        },
        "Endpoint": {
          "Spec": {}
        }
      }
    ]
    ```
@z

@x
    ```console
    $ docker service inspect dmu1ept4cxcf
@y
    ```console
    $ docker service inspect dmu1ept4cxcf
@z

@x
    [
      {
        "ID": "dmu1ept4cxcfe8k8lhtux3ro3",
        "Version": {
          "Index": 12
        },
        ...
      }
    ]
    ```
@y
    [
      {
        "ID": "dmu1ept4cxcfe8k8lhtux3ro3",
        "Version": {
          "Index": 12
        },
        ...
      }
    ]
    ```
@z

@x
    ### Formatting (--pretty) {#pretty}
@y
    ### Formatting (--pretty) {#pretty}
@z

@x
    You can print the inspect output in a human-readable format instead of the default
    JSON output, by using the `--pretty` option:
@y
    You can print the inspect output in a human-readable format instead of the default
    JSON output, by using the `--pretty` option:
@z

@x
    ```console
    $ docker service inspect --pretty frontend
@y
    ```console
    $ docker service inspect --pretty frontend
@z

@x
    ID:     c8wgl7q4ndfd52ni6qftkvnnp
    Name:   frontend
    Labels:
     - org.example.projectname=demo-app
    Service Mode:   REPLICATED
     Replicas:      5
    Placement:
    UpdateConfig:
     Parallelism:   0
     On failure:    pause
     Max failure ratio: 0
    ContainerSpec:
     Image:     nginx:alpine
    Resources:
    Networks:   net1
    Endpoint Mode:  vip
    Ports:
     PublishedPort = 4443
      Protocol = tcp
      TargetPort = 443
      PublishMode = ingress
    ```
@y
    ID:     c8wgl7q4ndfd52ni6qftkvnnp
    Name:   frontend
    Labels:
     - org.example.projectname=demo-app
    Service Mode:   REPLICATED
     Replicas:      5
    Placement:
    UpdateConfig:
     Parallelism:   0
     On failure:    pause
     Max failure ratio: 0
    ContainerSpec:
     Image:     nginx:alpine
    Resources:
    Networks:   net1
    Endpoint Mode:  vip
    Ports:
     PublishedPort = 4443
      Protocol = tcp
      TargetPort = 443
      PublishMode = ingress
    ```
@z

@x
    You can also use `--format pretty` for the same effect.
@y
    You can also use `--format pretty` for the same effect.
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    You can use the --format option to obtain specific information about a
    The `--format` option can be used to obtain specific information about a
    service. For example, the following command outputs the number of replicas
    of the "redis" service.
@y
    You can use the --format option to obtain specific information about a
    The `--format` option can be used to obtain specific information about a
    service. For example, the following command outputs the number of replicas
    of the "redis" service.
@z

@x
    ```console
    $ docker service inspect --format='{{.Spec.Mode.Replicated.Replicas}}' redis
@y
    ```console
    $ docker service inspect --format='{{.Spec.Mode.Replicated.Replicas}}' redis
@z

@x
    10
    ```
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    10
    ```
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
