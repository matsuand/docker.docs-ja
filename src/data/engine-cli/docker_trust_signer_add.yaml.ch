%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker trust signer add
short: Add a signer
long: '`docker trust signer add` adds signers to signed repositories.'
usage: 'docker trust signer add OPTIONS NAME REPOSITORY [REPOSITORY...] '
pname: docker trust signer
plink: docker_trust_signer.yaml
options:
    - option: key
      value_type: list
      description: Path to the signer's public key file
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
    ### Add a signer to a repository
@y
command: docker trust signer add
short: Add a signer
long: '`docker trust signer add` adds signers to signed repositories.'
usage: 'docker trust signer add OPTIONS NAME REPOSITORY [REPOSITORY...] '
pname: docker trust signer
plink: docker_trust_signer.yaml
options:
    - option: key
      value_type: list
      description: Path to the signer's public key file
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
    ### Add a signer to a repository
@z

@x
    To add a new signer, `alice`, to this repository:
@y
    To add a new signer, `alice`, to this repository:
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo
@z

@x
    No signatures for example/trust-demo
@y
    No signatures for example/trust-demo
@z

@x
    List of signers and their keys:
@y
    List of signers and their keys:
@z

@x
    SIGNER              KEYS
    bob                 5600f5ab76a2
@y
    SIGNER              KEYS
    bob                 5600f5ab76a2
@z

@x
    Administrative keys for example/trust-demo:
    Repository Key: 642692c14c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@y
    Administrative keys for example/trust-demo:
    Repository Key: 642692c14c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@z

@x
    Add `alice` with `docker trust signer add`:
@y
    Add `alice` with `docker trust signer add`:
@z

@x
    ```console
    $ docker trust signer add alice example/trust-demo --key alice.crt
      Adding signer "alice" to example/trust-demo...
      Enter passphrase for repository key with ID 642692c:
    Successfully added signer: alice to example/trust-demo
    ```
@y
    ```console
    $ docker trust signer add alice example/trust-demo --key alice.crt
      Adding signer "alice" to example/trust-demo...
      Enter passphrase for repository key with ID 642692c:
    Successfully added signer: alice to example/trust-demo
    ```
@z

@x
    `docker trust inspect --pretty` now lists `alice` as a valid signer:
@y
    `docker trust inspect --pretty` now lists `alice` as a valid signer:
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo
@z

@x
    No signatures for example/trust-demo
@y
    No signatures for example/trust-demo
@z

@x
    List of signers and their keys:
@y
    List of signers and their keys:
@z

@x
    SIGNER              KEYS
    alice               05e87edcaecb
    bob                 5600f5ab76a2
@y
    SIGNER              KEYS
    alice               05e87edcaecb
    bob                 5600f5ab76a2
@z

@x
    Administrative keys for example/trust-demo:
    Repository Key: 642692c14c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Administrative keys for example/trust-demo:
    Repository Key: 642692c14c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
