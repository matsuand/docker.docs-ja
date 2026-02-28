%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker trust signer remove
short: Remove a signer
long: '`docker trust signer remove` removes signers from signed repositories.'
usage: docker trust signer remove [OPTIONS] NAME REPOSITORY [REPOSITORY...]
pname: docker trust signer
plink: docker_trust_signer.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: |
        Do not prompt for confirmation before removing the most recent signer
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
    ### Remove a signer from a repository
@y
command: docker trust signer remove
short: Remove a signer
long: '`docker trust signer remove` removes signers from signed repositories.'
usage: docker trust signer remove [OPTIONS] NAME REPOSITORY [REPOSITORY...]
pname: docker trust signer
plink: docker_trust_signer.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: |
        Do not prompt for confirmation before removing the most recent signer
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
    ### Remove a signer from a repository
@z

@x
    To remove an existing signer, `alice`, from this repository:
@y
    To remove an existing signer, `alice`, from this repository:
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
    Repository Key: ecc457614c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@y
    Administrative keys for example/trust-demo:
    Repository Key: ecc457614c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@z

@x
    Remove `alice` with `docker trust signer remove`:
@y
    Remove `alice` with `docker trust signer remove`:
@z

@x
    ```console
    $ docker trust signer remove alice example/trust-demo
@y
    ```console
    $ docker trust signer remove alice example/trust-demo
@z

@x
    Removing signer "alice" from image example/trust-demo...
    Enter passphrase for repository key with ID 642692c:
    Successfully removed alice from example/trust-demo
    ```
@y
    Removing signer "alice" from image example/trust-demo...
    Enter passphrase for repository key with ID 642692c:
    Successfully removed alice from example/trust-demo
    ```
@z

@x
    `docker trust inspect --pretty` now doesn't list `alice` as a valid signer:
@y
    `docker trust inspect --pretty` now doesn't list `alice` as a valid signer:
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
    Repository Key: ecc457614c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@y
    Administrative keys for example/trust-demo:
    Repository Key: ecc457614c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@z

@x
    ### Remove a signer from multiple repositories
@y
    ### Remove a signer from multiple repositories
@z

@x
    To remove an existing signer, `alice`, from multiple repositories:
@y
    To remove an existing signer, `alice`, from multiple repositories:
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo
@z

@x
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   alice, bob
@y
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   alice, bob
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
    Repository Key: 95b9e5514c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@y
    Administrative keys for example/trust-demo:
    Repository Key: 95b9e5514c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo2
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo2
@z

@x
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   alice, bob
@y
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   alice, bob
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
    Administrative keys for example/trust-demo2:
    Repository Key: ece554f14c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4553d2ab20a8d9268
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@y
    Administrative keys for example/trust-demo2:
    Repository Key: ece554f14c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4553d2ab20a8d9268
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@z

@x
    Remove `alice` from both images with a single `docker trust signer remove` command:
@y
    Remove `alice` from both images with a single `docker trust signer remove` command:
@z

@x
    ```console
    $ docker trust signer remove alice example/trust-demo example/trust-demo2
@y
    ```console
    $ docker trust signer remove alice example/trust-demo example/trust-demo2
@z

@x
    Removing signer "alice" from image example/trust-demo...
    Enter passphrase for repository key with ID 95b9e55:
    Successfully removed alice from example/trust-demo
@y
    Removing signer "alice" from image example/trust-demo...
    Enter passphrase for repository key with ID 95b9e55:
    Successfully removed alice from example/trust-demo
@z

@x
    Removing signer "alice" from image example/trust-demo2...
    Enter passphrase for repository key with ID ece554f:
    Successfully removed alice from example/trust-demo2
    ```
@y
    Removing signer "alice" from image example/trust-demo2...
    Enter passphrase for repository key with ID ece554f:
    Successfully removed alice from example/trust-demo2
    ```
@z

@x
    Run `docker trust inspect --pretty` to confirm that `alice` is no longer listed as a valid
    signer of either `example/trust-demo` or `example/trust-demo2`:
@y
    Run `docker trust inspect --pretty` to confirm that `alice` is no longer listed as a valid
    signer of either `example/trust-demo` or `example/trust-demo2`:
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo
@z

@x
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   bob
@y
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   bob
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
    Repository Key: ecc457614c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@y
    Administrative keys for example/trust-demo:
    Repository Key: ecc457614c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo2
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo2
@z

@x
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   bob
@y
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   bob
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
    Administrative keys for example/trust-demo2:
    Repository Key: ece554f14c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4553d2ab20a8d9268
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@y
    Administrative keys for example/trust-demo2:
    Repository Key: ece554f14c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4553d2ab20a8d9268
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@z

@x
    `docker trust signer remove` removes signers to repositories on a best effort basis.
    It continues to remove the signer from subsequent repositories if one attempt fails:
@y
    `docker trust signer remove` removes signers to repositories on a best effort basis.
    It continues to remove the signer from subsequent repositories if one attempt fails:
@z

@x
    ```console
    $ docker trust signer remove alice example/unauthorized example/authorized
@y
    ```console
    $ docker trust signer remove alice example/unauthorized example/authorized
@z

@x
    Removing signer "alice" from image example/unauthorized...
    No signer alice for image example/unauthorized
@y
    Removing signer "alice" from image example/unauthorized...
    No signer alice for image example/unauthorized
@z

@x
    Removing signer "alice" from image example/authorized...
    Enter passphrase for repository key with ID c6772a0:
    Successfully removed alice from example/authorized
@y
    Removing signer "alice" from image example/authorized...
    Enter passphrase for repository key with ID c6772a0:
    Successfully removed alice from example/authorized
@z

@x
    Error removing signer from: example/unauthorized
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Error removing signer from: example/unauthorized
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
