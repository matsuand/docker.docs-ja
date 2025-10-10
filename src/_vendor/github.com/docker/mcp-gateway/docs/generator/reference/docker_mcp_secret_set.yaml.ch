%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp secret set
short: Set a secret in Docker Desktop's secret store
long: Set a secret in Docker Desktop's secret store
usage: docker mcp secret set key[=value]
@y
command: docker mcp secret set
short: Set a secret in Docker Desktop's secret store
long: Set a secret in Docker Desktop's secret store
usage: docker mcp secret set key[=value]
@z

% options:

@x provider
      description: 'Supported: credstore, oauth/<provider>'
@y
      description: 'Supported: credstore, oauth/<provider>'
@z

@x
examples: |-
    ### Use secrets for postgres password with default policy
@y
examples: |-
    ### Use secrets for postgres password with default policy
@z

% snip code...

@x
    ### Pass the secret via STDIN
@y
    ### Pass the secret via STDIN
@z

% snip code...
% snip directives...
