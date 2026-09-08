%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass rm
short: Remove secrets from local keychain.
long: |-
    Removes one or more named secrets from the local OS keychain. Use `--all` to remove every stored secret at once.
usage: docker pass rm name1 name2 ... [flags]
pname: docker pass
plink: docker_pass.yaml
options:
    - option: all
      value_type: bool
      default_value: "false"
      description: Remove all secrets
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
examples: |-
    ### Remove a specific secret:
@y
command: docker pass rm
short: Remove secrets from local keychain.
long: |-
    Removes one or more named secrets from the local OS keychain. Use `--all` to remove every stored secret at once.
usage: docker pass rm name1 name2 ... [flags]
pname: docker pass
plink: docker_pass.yaml
options:
    - option: all
      value_type: bool
      default_value: "false"
      description: Remove all secrets
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
examples: |-
    ### Remove a specific secret:
@z

@x
    ```console
    $ docker pass rm GH_TOKEN
    ```
@y
    ```console
    $ docker pass rm GH_TOKEN
    ```
@z

@x
    ### Remove multiple secrets:
@y
    ### Remove multiple secrets:
@z

@x
    ```console
    $ docker pass rm GH_TOKEN NPM_TOKEN
    ```
@y
    ```console
    $ docker pass rm GH_TOKEN NPM_TOKEN
    ```
@z

@x
    ### Remove all secrets:
@y
    ### Remove all secrets:
@z

@x
    ```console
    $ docker pass rm --all
    ```
@y
    ```console
    $ docker pass rm --all
    ```
@z
