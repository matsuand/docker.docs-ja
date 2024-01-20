%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker trust key generate
short: Generate and load a signing key-pair
long: |-
    `docker trust key generate` generates a key-pair to be used with signing,
     and loads the private key into the local Docker trust keystore.
usage: docker trust key generate NAME
pname: docker trust key
plink: docker_trust_key.yaml
options:
    - option: dir
      value_type: string
      description: Directory to generate key in, defaults to current directory
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
    ### Generate a key-pair
@y
command: docker trust key generate
short: Generate and load a signing key-pair
long: |-
    `docker trust key generate` generates a key-pair to be used with signing,
     and loads the private key into the local Docker trust keystore.
usage: docker trust key generate NAME
pname: docker trust key
plink: docker_trust_key.yaml
options:
    - option: dir
      value_type: string
      description: Directory to generate key in, defaults to current directory
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
    ### Generate a key-pair
@z

@x
    ```console
    $ docker trust key generate alice
@y
    ```console
    $ docker trust key generate alice
@z

@x
    Generating key for alice...
    Enter passphrase for new alice key with ID 17acf3c:
    Repeat passphrase for new alice key with ID 17acf3c:
    Successfully generated and loaded private key. Corresponding public key available: alice.pub
    $ ls
    alice.pub
    ```
@y
    Generating key for alice...
    Enter passphrase for new alice key with ID 17acf3c:
    Repeat passphrase for new alice key with ID 17acf3c:
    Successfully generated and loaded private key. Corresponding public key available: alice.pub
    $ ls
    alice.pub
    ```
@z

@x
    The private signing key is encrypted by the passphrase and loaded into the Docker trust keystore.
    All passphrase requests to sign with the key will be referred to by the provided `NAME`.
@y
    The private signing key is encrypted by the passphrase and loaded into the Docker trust keystore.
    All passphrase requests to sign with the key will be referred to by the provided `NAME`.
@z

@x
    The public key component `alice.pub` will be available in the current working directory, and can
    be used directly by `docker trust signer add`.
@y
    The public key component `alice.pub` will be available in the current working directory, and can
    be used directly by `docker trust signer add`.
@z

@x
    Provide the `--dir` argument to specify a directory to generate the key in:
@y
    Provide the `--dir` argument to specify a directory to generate the key in:
@z

@x
    ```console
    $ docker trust key generate alice --dir /foo
@y
    ```console
    $ docker trust key generate alice --dir /foo
@z

@x
    Generating key for alice...
    Enter passphrase for new alice key with ID 17acf3c:
    Repeat passphrase for new alice key with ID 17acf3c:
    Successfully generated and loaded private key. Corresponding public key available: alice.pub
    $ ls /foo
    alice.pub
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Generating key for alice...
    Enter passphrase for new alice key with ID 17acf3c:
    Repeat passphrase for new alice key with ID 17acf3c:
    Successfully generated and loaded private key. Corresponding public key available: alice.pub
    $ ls /foo
    alice.pub
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
