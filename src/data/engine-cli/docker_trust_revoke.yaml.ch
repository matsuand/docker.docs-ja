%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker trust revoke
short: Remove trust for an image
long: '`docker trust revoke` removes signatures from tags in signed repositories.'
usage: docker trust revoke [OPTIONS] IMAGE[:TAG]
pname: docker trust
plink: docker_trust.yaml
options:
    - option: "yes"
      shorthand: "y"
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
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
    ### Revoke signatures from a signed tag
@y
command: docker trust revoke
short: Remove trust for an image
long: '`docker trust revoke` removes signatures from tags in signed repositories.'
usage: docker trust revoke [OPTIONS] IMAGE[:TAG]
pname: docker trust
plink: docker_trust.yaml
options:
    - option: "yes"
      shorthand: "y"
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
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
    ### Revoke signatures from a signed tag
@z

@x
    Here's an example of a repository with two signed tags:
@y
    Here's an example of a repository with two signed tags:
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo
    SIGNED TAG          DIGEST                                                              SIGNERS
    red                 852cc04935f930a857b630edc4ed6131e91b22073bcc216698842e44f64d2943    alice
    blue                f1c38dbaeeb473c36716f6494d803fbfbe9d8a76916f7c0093f227821e378197    alice, bob
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo
    SIGNED TAG          DIGEST                                                              SIGNERS
    red                 852cc04935f930a857b630edc4ed6131e91b22073bcc216698842e44f64d2943    alice
    blue                f1c38dbaeeb473c36716f6494d803fbfbe9d8a76916f7c0093f227821e378197    alice, bob
@z

@x
    List of signers and their keys for example/trust-demo:
@y
    List of signers and their keys for example/trust-demo:
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
    When `alice`, one of the signers, runs `docker trust revoke`:
@y
    When `alice`, one of the signers, runs `docker trust revoke`:
@z

@x
    ```console
    $ docker trust revoke example/trust-demo:red
    Enter passphrase for delegation key with ID 27d42a8:
    Successfully deleted signature for example/trust-demo:red
    ```
@y
    ```console
    $ docker trust revoke example/trust-demo:red
    Enter passphrase for delegation key with ID 27d42a8:
    Successfully deleted signature for example/trust-demo:red
    ```
@z

@x
    After revocation, the tag is removed from the list of released tags:
@y
    After revocation, the tag is removed from the list of released tags:
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo
    SIGNED TAG          DIGEST                                                              SIGNERS
    blue                f1c38dbaeeb473c36716f6494d803fbfbe9d8a76916f7c0093f227821e378197    alice, bob
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo
    SIGNED TAG          DIGEST                                                              SIGNERS
    blue                f1c38dbaeeb473c36716f6494d803fbfbe9d8a76916f7c0093f227821e378197    alice, bob
@z

@x
    List of signers and their keys for example/trust-demo:
@y
    List of signers and their keys for example/trust-demo:
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
    ### Revoke signatures on all tags in a repository
@y
    ### Revoke signatures on all tags in a repository
@z

@x
    When no tag is specified, `docker trust` revokes all signatures that you have a signing key for.
@y
    When no tag is specified, `docker trust` revokes all signatures that you have a signing key for.
@z

@x
    ```console
    $ docker trust inspect --pretty example/trust-demo
    SIGNED TAG          DIGEST                                                              SIGNERS
    red                 852cc04935f930a857b630edc4ed6131e91b22073bcc216698842e44f64d2943    alice
    blue                f1c38dbaeeb473c36716f6494d803fbfbe9d8a76916f7c0093f227821e378197    alice, bob
@y
    ```console
    $ docker trust inspect --pretty example/trust-demo
    SIGNED TAG          DIGEST                                                              SIGNERS
    red                 852cc04935f930a857b630edc4ed6131e91b22073bcc216698842e44f64d2943    alice
    blue                f1c38dbaeeb473c36716f6494d803fbfbe9d8a76916f7c0093f227821e378197    alice, bob
@z

@x
    List of signers and their keys for example/trust-demo:
@y
    List of signers and their keys for example/trust-demo:
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
    When `alice`, one of the signers, runs `docker trust revoke`:
@y
    When `alice`, one of the signers, runs `docker trust revoke`:
@z

@x
    ```console
    $ docker trust revoke example/trust-demo
    Please confirm you would like to delete all signature data for example/trust-demo? [y/N] y
    Enter passphrase for delegation key with ID 27d42a8:
    Successfully deleted signature for example/trust-demo
    ```
@y
    ```console
    $ docker trust revoke example/trust-demo
    Please confirm you would like to delete all signature data for example/trust-demo? [y/N] y
    Enter passphrase for delegation key with ID 27d42a8:
    Successfully deleted signature for example/trust-demo
    ```
@z

@x
    All tags that have `alice`'s signature on them are removed from the list of released tags:
@y
    All tags that have `alice`'s signature on them are removed from the list of released tags:
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
    List of signers and their keys for example/trust-demo:
@y
    List of signers and their keys for example/trust-demo:
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
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Administrative keys for example/trust-demo:
    Repository Key: ecc457614c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
