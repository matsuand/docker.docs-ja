%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker plugin set
short: Change settings for a plugin
long: |-
    Change settings for a plugin. The plugin must be disabled.
@y
command: docker plugin set
short: Change settings for a plugin
long: |-
    Change settings for a plugin. The plugin must be disabled.
@z

@x
    The settings currently supported are:
     * env variables
     * source of mounts
     * path of devices
     * args
usage: docker plugin set PLUGIN KEY=VALUE [KEY=VALUE...]
pname: docker plugin
plink: docker_plugin.yaml
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
    ### Change an environment variable
@y
    The settings currently supported are:
     * env variables
     * source of mounts
     * path of devices
     * args
usage: docker plugin set PLUGIN KEY=VALUE [KEY=VALUE...]
pname: docker plugin
plink: docker_plugin.yaml
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
    ### Change an environment variable
@z

@x
    The following example change the env variable `DEBUG` on the
    `sample-volume-plugin` plugin.
@y
    The following example change the env variable `DEBUG` on the
    `sample-volume-plugin` plugin.
@z

@x
    ```console
    $ docker plugin inspect -f {{.Settings.Env}} tiborvass/sample-volume-plugin
    [DEBUG=0]
@y
    ```console
    $ docker plugin inspect -f {{.Settings.Env}} tiborvass/sample-volume-plugin
    [DEBUG=0]
@z

@x
    $ docker plugin set tiborvass/sample-volume-plugin DEBUG=1
@y
    $ docker plugin set tiborvass/sample-volume-plugin DEBUG=1
@z

@x
    $ docker plugin inspect -f {{.Settings.Env}} tiborvass/sample-volume-plugin
    [DEBUG=1]
    ```
@y
    $ docker plugin inspect -f {{.Settings.Env}} tiborvass/sample-volume-plugin
    [DEBUG=1]
    ```
@z

@x
    ### Change the source of a mount
@y
    ### Change the source of a mount
@z

@x
    The following example change the source of the `mymount` mount on
    the `myplugin` plugin.
@y
    The following example change the source of the `mymount` mount on
    the `myplugin` plugin.
@z

@x
    ```console
    $ docker plugin inspect -f '{{with $mount := index .Settings.Mounts 0}}{{$mount.Source}}{{end}}' myplugin
    /foo
@y
    ```console
    $ docker plugin inspect -f '{{with $mount := index .Settings.Mounts 0}}{{$mount.Source}}{{end}}' myplugin
    /foo
@z

@x
    $ docker plugins set myplugin mymount.source=/bar
@y
    $ docker plugins set myplugin mymount.source=/bar
@z

@x
    $ docker plugin inspect -f '{{with $mount := index .Settings.Mounts 0}}{{$mount.Source}}{{end}}' myplugin
    /bar
    ```
@y
    $ docker plugin inspect -f '{{with $mount := index .Settings.Mounts 0}}{{$mount.Source}}{{end}}' myplugin
    /bar
    ```
@z

@x
    > **Note**
    >
    > Since only `source` is settable in `mymount`,
    > `docker plugins set mymount=/bar myplugin` would work too.
@y
    > **Note**
    >
    > Since only `source` is settable in `mymount`,
    > `docker plugins set mymount=/bar myplugin` would work too.
@z

@x
    ### Change a device path
@y
    ### Change a device path
@z

@x
    The following example change the path of the `mydevice` device on
    the `myplugin` plugin.
@y
    The following example change the path of the `mydevice` device on
    the `myplugin` plugin.
@z

@x
    ```console
    $ docker plugin inspect -f '{{with $device := index .Settings.Devices 0}}{{$device.Path}}{{end}}' myplugin
@y
    ```console
    $ docker plugin inspect -f '{{with $device := index .Settings.Devices 0}}{{$device.Path}}{{end}}' myplugin
@z

@x
    /dev/foo
@y
    /dev/foo
@z

@x
    $ docker plugins set myplugin mydevice.path=/dev/bar
@y
    $ docker plugins set myplugin mydevice.path=/dev/bar
@z

@x
    $ docker plugin inspect -f '{{with $device := index .Settings.Devices 0}}{{$device.Path}}{{end}}' myplugin
@y
    $ docker plugin inspect -f '{{with $device := index .Settings.Devices 0}}{{$device.Path}}{{end}}' myplugin
@z

@x
    /dev/bar
    ```
@y
    /dev/bar
    ```
@z

@x
    > **Note**
    >
    > Since only `path` is settable in `mydevice`,
    > `docker plugins set mydevice=/dev/bar myplugin` would work too.
@y
    > **Note**
    >
    > Since only `path` is settable in `mydevice`,
    > `docker plugins set mydevice=/dev/bar myplugin` would work too.
@z

@x
    ### Change the source of the arguments
@y
    ### Change the source of the arguments
@z

@x
    The following example change the value of the args on the `myplugin` plugin.
@y
    The following example change the value of the args on the `myplugin` plugin.
@z

@x
    ```console
    $ docker plugin inspect -f '{{.Settings.Args}}' myplugin
@y
    ```console
    $ docker plugin inspect -f '{{.Settings.Args}}' myplugin
@z

@x
    ["foo", "bar"]
@y
    ["foo", "bar"]
@z

@x
    $ docker plugins set myplugin myargs="foo bar baz"
@y
    $ docker plugins set myplugin myargs="foo bar baz"
@z

@x
    $ docker plugin inspect -f '{{.Settings.Args}}' myplugin
@y
    $ docker plugin inspect -f '{{.Settings.Args}}' myplugin
@z

@x
    ["foo", "bar", "baz"]
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ["foo", "bar", "baz"]
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
