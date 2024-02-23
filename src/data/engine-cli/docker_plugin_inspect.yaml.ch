%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker plugin inspect
short: Display detailed information on one or more plugins
long: |-
    Returns information about a plugin. By default, this command renders all results
    in a JSON array.
usage: docker plugin inspect [OPTIONS] PLUGIN [PLUGIN...]
pname: docker plugin
plink: docker_plugin.yaml
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
    ### Inspect a plugin
@y
command: docker plugin inspect
short: Display detailed information on one or more plugins
long: |-
    Returns information about a plugin. By default, this command renders all results
    in a JSON array.
usage: docker plugin inspect [OPTIONS] PLUGIN [PLUGIN...]
pname: docker plugin
plink: docker_plugin.yaml
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
    ### Inspect a plugin
@z

@x
    The following example inspects the `tiborvass/sample-volume-plugin` plugin:
@y
    The following example inspects the `tiborvass/sample-volume-plugin` plugin:
@z

@x
    ```console
    $ docker plugin inspect tiborvass/sample-volume-plugin:latest
    ```
@y
    ```console
    $ docker plugin inspect tiborvass/sample-volume-plugin:latest
    ```
@z

@x
    Output is in JSON format (output below is formatted for readability):
@y
    Output is in JSON format (output below is formatted for readability):
@z

@x
    ```json
    {
      "Id": "8c74c978c434745c3ade82f1bc0acf38d04990eaf494fa507c16d9f1daa99c21",
      "Name": "tiborvass/sample-volume-plugin:latest",
      "PluginReference": "tiborvas/sample-volume-plugin:latest",
      "Enabled": true,
      "Config": {
        "Mounts": [
          {
            "Name": "",
            "Description": "",
            "Settable": null,
            "Source": "/data",
            "Destination": "/data",
            "Type": "bind",
            "Options": [
              "shared",
              "rbind"
            ]
          },
          {
            "Name": "",
            "Description": "",
            "Settable": null,
            "Source": null,
            "Destination": "/foobar",
            "Type": "tmpfs",
            "Options": null
          }
        ],
        "Env": [
          "DEBUG=1"
        ],
        "Args": null,
        "Devices": null
      },
      "Manifest": {
        "ManifestVersion": "v0",
        "Description": "A test plugin for Docker",
        "Documentation": "/engine/extend/plugins/",
        "Interface": {
          "Types": [
            "docker.volumedriver/1.0"
          ],
          "Socket": "plugins.sock"
        },
        "Entrypoint": [
          "plugin-sample-volume-plugin",
          "/data"
        ],
        "Workdir": "",
        "User": {
        },
        "Network": {
          "Type": "host"
        },
        "Capabilities": null,
        "Mounts": [
          {
            "Name": "",
            "Description": "",
            "Settable": null,
            "Source": "/data",
            "Destination": "/data",
            "Type": "bind",
            "Options": [
              "shared",
              "rbind"
            ]
          },
          {
            "Name": "",
            "Description": "",
            "Settable": null,
            "Source": null,
            "Destination": "/foobar",
            "Type": "tmpfs",
            "Options": null
          }
        ],
        "Devices": [
          {
            "Name": "device",
            "Description": "a host device to mount",
            "Settable": null,
            "Path": "/dev/cpu_dma_latency"
          }
        ],
        "Env": [
          {
            "Name": "DEBUG",
            "Description": "If set, prints debug messages",
            "Settable": null,
            "Value": "1"
          }
        ],
        "Args": {
          "Name": "args",
          "Description": "command line arguments",
          "Settable": null,
          "Value": [
@y
    ```json
    {
      "Id": "8c74c978c434745c3ade82f1bc0acf38d04990eaf494fa507c16d9f1daa99c21",
      "Name": "tiborvass/sample-volume-plugin:latest",
      "PluginReference": "tiborvas/sample-volume-plugin:latest",
      "Enabled": true,
      "Config": {
        "Mounts": [
          {
            "Name": "",
            "Description": "",
            "Settable": null,
            "Source": "/data",
            "Destination": "/data",
            "Type": "bind",
            "Options": [
              "shared",
              "rbind"
            ]
          },
          {
            "Name": "",
            "Description": "",
            "Settable": null,
            "Source": null,
            "Destination": "/foobar",
            "Type": "tmpfs",
            "Options": null
          }
        ],
        "Env": [
          "DEBUG=1"
        ],
        "Args": null,
        "Devices": null
      },
      "Manifest": {
        "ManifestVersion": "v0",
        "Description": "A test plugin for Docker",
        "Documentation": "/engine/extend/plugins/",
        "Interface": {
          "Types": [
            "docker.volumedriver/1.0"
          ],
          "Socket": "plugins.sock"
        },
        "Entrypoint": [
          "plugin-sample-volume-plugin",
          "/data"
        ],
        "Workdir": "",
        "User": {
        },
        "Network": {
          "Type": "host"
        },
        "Capabilities": null,
        "Mounts": [
          {
            "Name": "",
            "Description": "",
            "Settable": null,
            "Source": "/data",
            "Destination": "/data",
            "Type": "bind",
            "Options": [
              "shared",
              "rbind"
            ]
          },
          {
            "Name": "",
            "Description": "",
            "Settable": null,
            "Source": null,
            "Destination": "/foobar",
            "Type": "tmpfs",
            "Options": null
          }
        ],
        "Devices": [
          {
            "Name": "device",
            "Description": "a host device to mount",
            "Settable": null,
            "Path": "/dev/cpu_dma_latency"
          }
        ],
        "Env": [
          {
            "Name": "DEBUG",
            "Description": "If set, prints debug messages",
            "Settable": null,
            "Value": "1"
          }
        ],
        "Args": {
          "Name": "args",
          "Description": "command line arguments",
          "Settable": null,
          "Value": [
@z

@x
          ]
        }
      }
    }
    ```
@y
          ]
        }
      }
    }
    ```
@z

@x
    ### Format the output (--format) {#format}
@y
    ### Format the output (--format) {#format}
@z

@x
    ```console
    $ docker plugin inspect -f '{{.Id}}' tiborvass/sample-volume-plugin:latest
@y
    ```console
    $ docker plugin inspect -f '{{.Id}}' tiborvass/sample-volume-plugin:latest
@z

@x
    8c74c978c434745c3ade82f1bc0acf38d04990eaf494fa507c16d9f1daa99c21
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    8c74c978c434745c3ade82f1bc0acf38d04990eaf494fa507c16d9f1daa99c21
    ```
deprecated: false
hidden: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
