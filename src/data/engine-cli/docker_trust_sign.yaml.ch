%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker trust sign
short: Sign an image
long: '`docker trust sign` adds signatures to tags to create signed repositories.'
usage: docker trust sign IMAGE:TAG
pname: docker trust
plink: docker_trust.yaml
options:
    - option: local
      value_type: bool
      default_value: "false"
      description: Sign a locally tagged image
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
    ### Sign a tag as a repository admin
@y
command: docker trust sign
short: Sign an image
long: '`docker trust sign` adds signatures to tags to create signed repositories.'
usage: docker trust sign IMAGE:TAG
pname: docker trust
plink: docker_trust.yaml
options:
    - option: local
      value_type: bool
      default_value: "false"
      description: Sign a locally tagged image
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
    ### Sign a tag as a repository admin
@z

@x
    Given an image:
@y
    Given an image:
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
    v1                  c24134c079c35e698060beabe110bb83ab285d0d978de7d92fed2c8c83570a41   (Repo Admin)
@y
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  c24134c079c35e698060beabe110bb83ab285d0d978de7d92fed2c8c83570a41   (Repo Admin)
@z

@x
    Administrative keys for example/trust-demo:
    Repository Key: 36d4c3601102fa7c5712a343c03b94469e5835fb27c191b529c06fd19c14a942
    Root Key:       246d360f7c53a9021ee7d4259e3c5692f3f1f7ad4737b1ea8c7b8da741ad980b
    ```
@y
    Administrative keys for example/trust-demo:
    Repository Key: 36d4c3601102fa7c5712a343c03b94469e5835fb27c191b529c06fd19c14a942
    Root Key:       246d360f7c53a9021ee7d4259e3c5692f3f1f7ad4737b1ea8c7b8da741ad980b
    ```
@z

@x
    Sign a new tag with `docker trust sign`:
@y
    Sign a new tag with `docker trust sign`:
@z

@x
    ```console
    $ docker trust sign example/trust-demo:v2
@y
    ```console
    $ docker trust sign example/trust-demo:v2
@z

@x
    Signing and pushing trust metadata for example/trust-demo:v2
    The push refers to a repository [docker.io/example/trust-demo]
    eed4e566104a: Layer already exists
    77edfb6d1e3c: Layer already exists
    c69f806905c2: Layer already exists
    582f327616f1: Layer already exists
    a3fbb648f0bd: Layer already exists
    5eac2de68a97: Layer already exists
    8d4d1ab5ff74: Layer already exists
    v2: digest: sha256:8f6f460abf0436922df7eb06d28b3cdf733d2cac1a185456c26debbff0839c56 size: 1787
    Signing and pushing trust metadata
    Enter passphrase for repository key with ID 36d4c36:
    Successfully signed docker.io/example/trust-demo:v2
    ```
@y
    Signing and pushing trust metadata for example/trust-demo:v2
    The push refers to a repository [docker.io/example/trust-demo]
    eed4e566104a: Layer already exists
    77edfb6d1e3c: Layer already exists
    c69f806905c2: Layer already exists
    582f327616f1: Layer already exists
    a3fbb648f0bd: Layer already exists
    5eac2de68a97: Layer already exists
    8d4d1ab5ff74: Layer already exists
    v2: digest: sha256:8f6f460abf0436922df7eb06d28b3cdf733d2cac1a185456c26debbff0839c56 size: 1787
    Signing and pushing trust metadata
    Enter passphrase for repository key with ID 36d4c36:
    Successfully signed docker.io/example/trust-demo:v2
    ```
@z

@x
    Use `docker trust inspect --pretty` to list the new signature:
@y
    Use `docker trust inspect --pretty` to list the new signature:
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
    v1                  c24134c079c35e698060beabe110bb83ab285d0d978de7d92fed2c8c83570a41   (Repo Admin)
    v2                  8f6f460abf0436922df7eb06d28b3cdf733d2cac1a185456c26debbff0839c56   (Repo Admin)
@y
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  c24134c079c35e698060beabe110bb83ab285d0d978de7d92fed2c8c83570a41   (Repo Admin)
    v2                  8f6f460abf0436922df7eb06d28b3cdf733d2cac1a185456c26debbff0839c56   (Repo Admin)
@z

@x
    Administrative keys for example/trust-demo:
    Repository Key: 36d4c3601102fa7c5712a343c03b94469e5835fb27c191b529c06fd19c14a942
    Root Key:       246d360f7c53a9021ee7d4259e3c5692f3f1f7ad4737b1ea8c7b8da741ad980b
    ```
@y
    Administrative keys for example/trust-demo:
    Repository Key: 36d4c3601102fa7c5712a343c03b94469e5835fb27c191b529c06fd19c14a942
    Root Key:       246d360f7c53a9021ee7d4259e3c5692f3f1f7ad4737b1ea8c7b8da741ad980b
    ```
@z

@x
    ### Sign a tag as a signer
@y
    ### Sign a tag as a signer
@z

@x
    Given an image:
@y
    Given an image:
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
@y
    Administrative keys for example/trust-demo:
    Repository Key: ecc457614c9fc399da523a5f4e24fe306a0a6ee1cc79a10e4555b3c6ab02f71e
    Root Key:       3cb2228f6561e58f46dbc4cda4fcaff9d5ef22e865a94636f82450d1d2234949
    ```
@z

@x
    Sign a new tag with `docker trust sign`:
@y
    Sign a new tag with `docker trust sign`:
@z

@x
    ```console
    $ docker trust sign example/trust-demo:v1
@y
    ```console
    $ docker trust sign example/trust-demo:v1
@z

@x
    Signing and pushing trust metadata for example/trust-demo:v1
    The push refers to a repository [docker.io/example/trust-demo]
    26b126eb8632: Layer already exists
    220d34b5f6c9: Layer already exists
    8a5132998025: Layer already exists
    aca233ed29c3: Layer already exists
    e5d2f035d7a4: Layer already exists
    v1: digest: sha256:74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4 size: 1357
    Signing and pushing trust metadata
    Enter passphrase for delegation key with ID 27d42a8:
    Successfully signed docker.io/example/trust-demo:v1
    ```
@y
    Signing and pushing trust metadata for example/trust-demo:v1
    The push refers to a repository [docker.io/example/trust-demo]
    26b126eb8632: Layer already exists
    220d34b5f6c9: Layer already exists
    8a5132998025: Layer already exists
    aca233ed29c3: Layer already exists
    e5d2f035d7a4: Layer already exists
    v1: digest: sha256:74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4 size: 1357
    Signing and pushing trust metadata
    Enter passphrase for delegation key with ID 27d42a8:
    Successfully signed docker.io/example/trust-demo:v1
    ```
@z

@x
    `docker trust inspect --pretty` lists the new signature:
@y
    `docker trust inspect --pretty` lists the new signature:
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
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   alice
@y
    SIGNED TAG          DIGEST                                                             SIGNERS
    v1                  74d4bfa917d55d53c7df3d2ab20a8d926874d61c3da5ef6de15dd2654fc467c4   alice
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