%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume inspect
short: Display detailed information on one or more volumes
long: |-
    Returns information about a volume. By default, this command renders all results
    in a JSON array. You can specify an alternate format to execute a
    given template for each result. Go's
    [text/template](https://pkg.go.dev/text/template) package describes all the
    details of the format.
usage: docker volume inspect [OPTIONS] VOLUME [VOLUME...]
pname: docker volume
plink: docker_volume.yaml
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
    ```console
    $ docker volume create myvolume
@y
command: docker volume inspect
short: Display detailed information on one or more volumes
long: |-
    Returns information about a volume. By default, this command renders all results
    in a JSON array. You can specify an alternate format to execute a
    given template for each result. Go's
    [text/template](https://pkg.go.dev/text/template) package describes all the
    details of the format.
usage: docker volume inspect [OPTIONS] VOLUME [VOLUME...]
pname: docker volume
plink: docker_volume.yaml
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
    ```console
    $ docker volume create myvolume
@z

@x
    myvolume
    ```
@y
    myvolume
    ```
@z

@x
    Use the `docker volume inspect` comment to inspect the configuration of the volume:
@y
    Use the `docker volume inspect` comment to inspect the configuration of the volume:
@z

@x
    ```console
    $ docker volume inspect myvolume
    ```
@y
    ```console
    $ docker volume inspect myvolume
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
        "CreatedAt": "2020-04-19T11:00:21Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/8140a838303144125b4f54653b47ede0486282c623c3551fbc7f390cdc3e9cf5/_data",
        "Name": "myvolume",
        "Options": {},
        "Scope": "local"
      }
    ]
    ```
@y
    ```json
    [
      {
        "CreatedAt": "2020-04-19T11:00:21Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/8140a838303144125b4f54653b47ede0486282c623c3551fbc7f390cdc3e9cf5/_data",
        "Name": "myvolume",
        "Options": {},
        "Scope": "local"
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
    Use the `--format` flag to format the output using a Go template, for example,
    to print the `Mountpoint` property:
@y
    Use the `--format` flag to format the output using a Go template, for example,
    to print the `Mountpoint` property:
@z

@x
    ```console
    $ docker volume inspect --format '{{ .Mountpoint }}' myvolume
@y
    ```console
    $ docker volume inspect --format '{{ .Mountpoint }}' myvolume
@z

@x
    /var/lib/docker/volumes/myvolume/_data
    ```
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    /var/lib/docker/volumes/myvolume/_data
    ```
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
