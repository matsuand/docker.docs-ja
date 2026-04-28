%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker pass rm
short: Remove secrets from local keychain.
long: |-
    Removes one or more named secrets from the local OS keychain.
    Use --all to remove every stored secret at once.
usage: docker pass rm name1 name2 ... [flags]
@y
command: docker pass rm
short: Remove secrets from local keychain.
long: |-
    Removes one or more named secrets from the local OS keychain.
    Use --all to remove every stored secret at once.
usage: docker pass rm name1 name2 ... [flags]
@z

%options:

@x all
      description: Remove all secrets
@y
      description: Remove all secrets
@z

% snip directives...

@x
examples: |-
    ### Remove a specific secret:
    docker pass rm GH_TOKEN
@y
examples: |-
    ### Remove a specific secret:
    docker pass rm GH_TOKEN
@z

@x
    ### Remove multiple secrets:
    docker pass rm GH_TOKEN NPM_TOKEN
@y
    ### Remove multiple secrets:
    docker pass rm GH_TOKEN NPM_TOKEN
@z

@x
    ### Remove all secrets:
    docker pass rm --all
@y
    ### Remove all secrets:
    docker pass rm --all
@z
