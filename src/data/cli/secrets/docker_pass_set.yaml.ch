%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass set
short: Set a secret
long: |-
    Stores a secret in the local OS keychain. The secret value can be
    provided inline (NAME=VALUE) or piped via STDIN.
usage: docker pass set id[=value] [flags]
@y
command: docker pass set
short: Set a secret
long: |-
    Stores a secret in the local OS keychain. The secret value can be
    provided inline (NAME=VALUE) or piped via STDIN.
usage: docker pass set id[=value] [flags]
@z

% options:

@x metadata
      description: Non-sensitive key=value metadata (repeatable)
@y
      description: Non-sensitive key=value metadata (repeatable)
@z

% snip directives...

@x
examples: |-
    ### Set a secret:
    docker pass set POSTGRES_PASSWORD=my-secret-password
@y
examples: |-
    ### Set a secret:
    docker pass set POSTGRES_PASSWORD=my-secret-password
@z

@x
    ### Or pass the secret via STDIN:
    echo my-secret-password > pwd.txt
    cat pwd.txt | docker pass set POSTGRES_PASSWORD
@y
    ### Or pass the secret via STDIN:
    echo my-secret-password > pwd.txt
    cat pwd.txt | docker pass set POSTGRES_PASSWORD
@z

@x
    ### Set a secret with metadata:
    docker pass set POSTGRES_PASSWORD=my-secret-password --metadata owner=alice --metadata expiry=2027-03-01
@y
    ### Set a secret with metadata:
    docker pass set POSTGRES_PASSWORD=my-secret-password --metadata owner=alice --metadata expiry=2027-03-01
@z

@x
    ### Or pass a JSON payload with secret and metadata via STDIN:
    echo '{"secret":"my-secret-password","metadata":{"owner":"alice"}}' | docker pass set POSTGRES_PASSWORD
@y
    ### Or pass a JSON payload with secret and metadata via STDIN:
    echo '{"secret":"my-secret-password","metadata":{"owner":"alice"}}' | docker pass set POSTGRES_PASSWORD
@z
