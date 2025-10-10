%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp secret
short: Manage secrets
long: Manage secrets
@y
command: docker mcp secret
short: Manage secrets
long: Manage secrets
@z

% cname:
% clink:

@x
examples: |-
    ### Use secrets for postgres password with default policy
@y
examples: |-
    ### Use secrets for postgres password with default policy
@z

@x
    > docker mcp secret set POSTGRES_PASSWORD=my-secret-password
    > docker run -d -l x-secret:POSTGRES_PASSWORD=/pwd.txt -e POSTGRES_PASSWORD_FILE=/pwd.txt -p 5432 postgres
@y
    > docker mcp secret set POSTGRES_PASSWORD=my-secret-password
    > docker run -d -l x-secret:POSTGRES_PASSWORD=/pwd.txt -e POSTGRES_PASSWORD_FILE=/pwd.txt -p 5432 postgres
@z

@x
    ### Pass the secret via STDIN
@y
    ### Pass the secret via STDIN
@z

@x
    > echo my-secret-password > pwd.txt
    > cat pwd.txt | docker mcp secret set POSTGRES_PASSWORD
@y
    > echo my-secret-password > pwd.txt
    > cat pwd.txt | docker mcp secret set POSTGRES_PASSWORD
@z

% snip directives...
