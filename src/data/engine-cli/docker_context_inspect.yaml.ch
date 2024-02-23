%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context inspect
short: Display detailed information on one or more contexts
long: Inspects one or more contexts.
usage: docker context inspect [OPTIONS] [CONTEXT] [CONTEXT...]
pname: docker context
plink: docker_context.yaml
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
    ### Inspect a context by name
@y
command: docker context inspect
short: Display detailed information on one or more contexts
long: Inspects one or more contexts.
usage: docker context inspect [OPTIONS] [CONTEXT] [CONTEXT...]
pname: docker context
plink: docker_context.yaml
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
    ### Inspect a context by name
@z

@x
    ```console
    $ docker context inspect "local+aks"
@y
    ```console
    $ docker context inspect "local+aks"
@z

@x
    [
      {
        "Name": "local+aks",
        "Metadata": {
          "Description": "Local Docker Engine",
          "StackOrchestrator": "swarm"
        },
        "Endpoints": {
          "docker": {
            "Host": "npipe:////./pipe/docker_engine",
            "SkipTLSVerify": false
          }
        },
        "TLSMaterial": {},
        "Storage": {
          "MetadataPath": "C:\\Users\\simon\\.docker\\contexts\\meta\\cb6d08c0a1bfa5fe6f012e61a442788c00bed93f509141daff05f620fc54ddee",
          "TLSPath": "C:\\Users\\simon\\.docker\\contexts\\tls\\cb6d08c0a1bfa5fe6f012e61a442788c00bed93f509141daff05f620fc54ddee"
        }
      }
    ]
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    [
      {
        "Name": "local+aks",
        "Metadata": {
          "Description": "Local Docker Engine",
          "StackOrchestrator": "swarm"
        },
        "Endpoints": {
          "docker": {
            "Host": "npipe:////./pipe/docker_engine",
            "SkipTLSVerify": false
          }
        },
        "TLSMaterial": {},
        "Storage": {
          "MetadataPath": "C:\\Users\\simon\\.docker\\contexts\\meta\\cb6d08c0a1bfa5fe6f012e61a442788c00bed93f509141daff05f620fc54ddee",
          "TLSPath": "C:\\Users\\simon\\.docker\\contexts\\tls\\cb6d08c0a1bfa5fe6f012e61a442788c00bed93f509141daff05f620fc54ddee"
        }
      }
    ]
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
