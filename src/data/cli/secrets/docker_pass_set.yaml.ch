%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass set
short: Set a secret
long: |-
    Stores a secret in the local OS keychain. The secret value can be provided inline (`NAME=VALUE`) or piped via STDIN.
@y
command: docker pass set
short: Set a secret
long: |-
    Stores a secret in the local OS keychain. The secret value can be provided inline (`NAME=VALUE`) or piped via STDIN.
@z

@x
    Behavior when a secret with the same id already exists is platform-dependent:
      - macOS (Keychain): the command fails with a duplicate-item error.
      - Linux (Secret Service) and Windows (Credential Manager): the existing
        value is silently overwritten.
@y
    Behavior when a secret with the same id already exists is platform-dependent:
      - macOS (Keychain): the command fails with a duplicate-item error.
      - Linux (Secret Service) and Windows (Credential Manager): the existing
        value is silently overwritten.
@z

@x
    Pass `--force` to overwrite an existing secret. On Linux and Windows the
    replacement is performed atomically. On macOS the Keychain API requires
    a delete-then-add sequence.
usage: docker pass set id[=value] [flags]
pname: docker pass
plink: docker_pass.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Overwrite existing secret if it already exists
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: metadata
      value_type: stringArray
      default_value: '[]'
      description: Non-sensitive key=value metadata (repeatable)
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
    ### Set a secret:
@y
    Pass `--force` to overwrite an existing secret. On Linux and Windows the
    replacement is performed atomically. On macOS the Keychain API requires
    a delete-then-add sequence.
usage: docker pass set id[=value] [flags]
pname: docker pass
plink: docker_pass.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Overwrite existing secret if it already exists
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: metadata
      value_type: stringArray
      default_value: '[]'
      description: Non-sensitive key=value metadata (repeatable)
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
    ### Set a secret:
@z

@x
    ```console
    $ docker pass set POSTGRES_PASSWORD=my-secret-password
    ```
@y
    ```console
    $ docker pass set POSTGRES_PASSWORD=my-secret-password
    ```
@z

@x
    ### Or pass the secret via STDIN:
@y
    ### Or pass the secret via STDIN:
@z

@x
    ```console
    $ echo my-secret-password > pwd.txt
    $ cat pwd.txt | docker pass set POSTGRES_PASSWORD
    ```
@y
    ```console
    $ echo my-secret-password > pwd.txt
    $ cat pwd.txt | docker pass set POSTGRES_PASSWORD
    ```
@z

@x
    ### Set a secret with metadata:
@y
    ### Set a secret with metadata:
@z

@x
    ```console
    $ docker pass set POSTGRES_PASSWORD=my-secret-password --metadata owner=alice --metadata expiry=2027-03-01
    ```
@y
    ```console
    $ docker pass set POSTGRES_PASSWORD=my-secret-password --metadata owner=alice --metadata expiry=2027-03-01
    ```
@z

@x
    ### Or pass a JSON payload with secret and metadata via STDIN:
@y
    ### Or pass a JSON payload with secret and metadata via STDIN:
@z

@x
    ```console
    $ echo '{"secret":"my-secret-password","metadata":{"owner":"alice"}}' | docker pass set POSTGRES_PASSWORD
    ```
@y
    ```console
    $ echo '{"secret":"my-secret-password","metadata":{"owner":"alice"}}' | docker pass set POSTGRES_PASSWORD
    ```
@z

@x
    ### Overwrite an existing secret:
@y
    ### Overwrite an existing secret:
@z

@x
    ```console
    $ docker pass set POSTGRES_PASSWORD=new-secret-password --force
    ```
@y
    ```console
    $ docker pass set POSTGRES_PASSWORD=new-secret-password --force
    ```
@z
