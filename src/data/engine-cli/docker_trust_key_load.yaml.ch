%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker trust key load
short: Load a private key file for signing
long: |-
    `docker trust key load` adds private keys to the local Docker trust keystore.
@y
command: docker trust key load
short: Load a private key file for signing
long: |-
    `docker trust key load` adds private keys to the local Docker trust keystore.
@z

@x
    To add a signer to a repository use `docker trust signer add`.
usage: docker trust key load [OPTIONS] KEYFILE
pname: docker trust key
plink: docker_trust_key.yaml
options:
    - option: name
      value_type: string
      default_value: signer
      description: Name for the loaded key
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
    ### Load a single private key
@y
    To add a signer to a repository use `docker trust signer add`.
usage: docker trust key load [OPTIONS] KEYFILE
pname: docker trust key
plink: docker_trust_key.yaml
options:
    - option: name
      value_type: string
      default_value: signer
      description: Name for the loaded key
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
    ### Load a single private key
@z

@x
    For a private key `alice.pem` with permissions `-rw-------`
@y
    For a private key `alice.pem` with permissions `-rw-------`
@z

@x
    ```console
    $ docker trust key load alice.pem
@y
    ```console
    $ docker trust key load alice.pem
@z

@x
    Loading key from "alice.pem"...
    Enter passphrase for new signer key with ID f8097df:
    Repeat passphrase for new signer key with ID f8097df:
    Successfully imported key from alice.pem
    ```
@y
    Loading key from "alice.pem"...
    Enter passphrase for new signer key with ID f8097df:
    Repeat passphrase for new signer key with ID f8097df:
    Successfully imported key from alice.pem
    ```
@z

@x
    To specify a name use the `--name` flag:
@y
    To specify a name use the `--name` flag:
@z

@x
    ```console
    $ docker trust key load --name alice-key alice.pem
@y
    ```console
    $ docker trust key load --name alice-key alice.pem
@z

@x
    Loading key from "alice.pem"...
    Enter passphrase for new alice-key key with ID f8097df:
    Repeat passphrase for new alice-key key with ID f8097df:
    Successfully imported key from alice.pem
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Loading key from "alice.pem"...
    Enter passphrase for new alice-key key with ID f8097df:
    Repeat passphrase for new alice-key key with ID f8097df:
    Successfully imported key from alice.pem
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
