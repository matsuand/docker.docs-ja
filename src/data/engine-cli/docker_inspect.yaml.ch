%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker inspect
short: Return low-level information on Docker objects
long: |-
    Docker inspect provides detailed information on constructs controlled by Docker.
@y
command: docker inspect
short: Return low-level information on Docker objects
long: |-
    Docker inspect provides detailed information on constructs controlled by Docker.
@z

@x
    By default, `docker inspect` will render results in a JSON array.
@y
    By default, `docker inspect` will render results in a JSON array.
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    If a format is specified, the given template will be executed for each result.
@y
    If a format is specified, the given template will be executed for each result.
@z

@x
    Go's [text/template](https://pkg.go.dev/text/template) package describes
    all the details of the format.
@y
    Go's [text/template](https://pkg.go.dev/text/template) package describes
    all the details of the format.
@z

@x
    ### Specify target type (--type) {#type}
@y
    ### Specify target type (--type) {#type}
@z

@x
    `--type container|image|node|network|secret|service|volume|task|plugin`
@y
    `--type container|image|node|network|secret|service|volume|task|plugin`
@z

@x
    The `docker inspect` command matches any type of object by either ID or name. In
    some cases multiple type of objects (for example, a container and a volume)
    exist with the same name, making the result ambiguous.
@y
    The `docker inspect` command matches any type of object by either ID or name. In
    some cases multiple type of objects (for example, a container and a volume)
    exist with the same name, making the result ambiguous.
@z

@x
    To restrict `docker inspect` to a specific type of object, use the `--type`
    option.
@y
    To restrict `docker inspect` to a specific type of object, use the `--type`
    option.
@z

@x
    The following example inspects a volume named `myvolume`.
@y
    The following example inspects a volume named `myvolume`.
@z

@x
    ```console
    $ docker inspect --type=volume myvolume
    ```
@y
    ```console
    $ docker inspect --type=volume myvolume
    ```
@z

@x
    ### Inspect the size of a container (-s, --size) {#size}
@y
    ### Inspect the size of a container (-s, --size) {#size}
@z

@x
    The `--size`, or short-form `-s`, option adds two additional fields to the
    `docker inspect` output. This option only works for containers. The container
    doesn't have to be running, it also works for stopped containers.
@y
    The `--size`, or short-form `-s`, option adds two additional fields to the
    `docker inspect` output. This option only works for containers. The container
    doesn't have to be running, it also works for stopped containers.
@z

@x
    ```console
    $ docker inspect --size mycontainer
    ```
@y
    ```console
    $ docker inspect --size mycontainer
    ```
@z

@x
    The output includes the full output of a regular `docker inspect` command, with
    the following additional fields:
@y
    The output includes the full output of a regular `docker inspect` command, with
    the following additional fields:
@z

@x
    - `SizeRootFs`: the total size of all the files in the container, in bytes.
    - `SizeRw`: the size of the files that have been created or changed in the
      container, compared to it's image, in bytes.
@y
    - `SizeRootFs`: the total size of all the files in the container, in bytes.
    - `SizeRw`: the size of the files that have been created or changed in the
      container, compared to it's image, in bytes.
@z

@x
    ```console
    $ docker run --name database -d redis
    3b2cbf074c99db4a0cad35966a9e24d7bc277f5565c17233386589029b7db273
    $ docker inspect --size database -f '{{ .SizeRootFs }}'
    123125760
    $ docker inspect --size database -f '{{ .SizeRw }}'
    8192
    $ docker exec database fallocate -l 1000 /newfile
    $ docker inspect --size database -f '{{ .SizeRw }}'
    12288
    ```
usage: docker inspect [OPTIONS] NAME|ID [NAME|ID...]
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
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: size
      shorthand: s
      value_type: bool
      default_value: "false"
      description: Display total file sizes if the type is container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: type
      value_type: string
      description: Return JSON for specified type
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
    ### Get an instance's IP address
@y
    ```console
    $ docker run --name database -d redis
    3b2cbf074c99db4a0cad35966a9e24d7bc277f5565c17233386589029b7db273
    $ docker inspect --size database -f '{{ .SizeRootFs }}'
    123125760
    $ docker inspect --size database -f '{{ .SizeRw }}'
    8192
    $ docker exec database fallocate -l 1000 /newfile
    $ docker inspect --size database -f '{{ .SizeRw }}'
    12288
    ```
usage: docker inspect [OPTIONS] NAME|ID [NAME|ID...]
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
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: size
      shorthand: s
      value_type: bool
      default_value: "false"
      description: Display total file sizes if the type is container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: type
      value_type: string
      description: Return JSON for specified type
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
    ### Get an instance's IP address
@z

@x
    For the most part, you can pick out any field from the JSON in a fairly
    straightforward manner.
@y
    For the most part, you can pick out any field from the JSON in a fairly
    straightforward manner.
@z

@x
    ```console
    $ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $INSTANCE_ID
    ```
@y
    ```console
    $ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $INSTANCE_ID
    ```
@z

@x
    ### Get an instance's MAC address
@y
    ### Get an instance's MAC address
@z

@x
    ```console
    $ docker inspect --format='{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}' $INSTANCE_ID
    ```
@y
    ```console
    $ docker inspect --format='{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}' $INSTANCE_ID
    ```
@z

@x
    ### Get an instance's log path
@y
    ### Get an instance's log path
@z

@x
    ```console
    $ docker inspect --format='{{.LogPath}}' $INSTANCE_ID
    ```
@y
    ```console
    $ docker inspect --format='{{.LogPath}}' $INSTANCE_ID
    ```
@z

@x
    ### Get an instance's image name
@y
    ### Get an instance's image name
@z

@x
    ```console
    $ docker inspect --format='{{.Config.Image}}' $INSTANCE_ID
    ```
@y
    ```console
    $ docker inspect --format='{{.Config.Image}}' $INSTANCE_ID
    ```
@z

@x
    ### List all port bindings
@y
    ### List all port bindings
@z

@x
    You can loop over arrays and maps in the results to produce simple text output:
@y
    You can loop over arrays and maps in the results to produce simple text output:
@z

@x
    ```console
    $ docker inspect --format='{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' $INSTANCE_ID
    ```
@y
    ```console
    $ docker inspect --format='{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' $INSTANCE_ID
    ```
@z

@x
    ### Find a specific port mapping
@y
    ### Find a specific port mapping
@z

@x
    The `.Field` syntax doesn't work when the field name begins with a number, but
    the template language's `index` function does. The `.NetworkSettings.Ports`
    section contains a map of the internal port mappings to a list of external
    address/port objects. To grab just the numeric public port, you use `index` to
    find the specific port map, and then `index` 0 contains the first object inside
    of that. Then, specify the `HostPort` field to get the public address.
@y
    The `.Field` syntax doesn't work when the field name begins with a number, but
    the template language's `index` function does. The `.NetworkSettings.Ports`
    section contains a map of the internal port mappings to a list of external
    address/port objects. To grab just the numeric public port, you use `index` to
    find the specific port map, and then `index` 0 contains the first object inside
    of that. Then, specify the `HostPort` field to get the public address.
@z

@x
    ```console
    $ docker inspect --format='{{(index (index .NetworkSettings.Ports "8787/tcp") 0).HostPort}}' $INSTANCE_ID
    ```
@y
    ```console
    $ docker inspect --format='{{(index (index .NetworkSettings.Ports "8787/tcp") 0).HostPort}}' $INSTANCE_ID
    ```
@z

@x
    ### Get a subsection in JSON format
@y
    ### Get a subsection in JSON format
@z

@x
    If you request a field which is itself a structure containing other fields, by
    default you get a Go-style dump of the inner values. Docker adds a template
    function, `json`, which can be applied to get results in JSON format.
@y
    If you request a field which is itself a structure containing other fields, by
    default you get a Go-style dump of the inner values. Docker adds a template
    function, `json`, which can be applied to get results in JSON format.
@z

@x
    ```console
    $ docker inspect --format='{{json .Config}}' $INSTANCE_ID
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker inspect --format='{{json .Config}}' $INSTANCE_ID
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
