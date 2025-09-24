%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp policy set
short: Set a policy for secret management in Docker Desktop
long: Set a policy for secret management in Docker Desktop
usage: docker mcp policy set <content>
pname: docker mcp policy
plink: docker_mcp_policy.yaml
examples: |-
    ### Backup the current policy to a file
    docker mcp policy dump > policy.conf
@y
command: docker mcp policy set
short: Set a policy for secret management in Docker Desktop
long: Set a policy for secret management in Docker Desktop
usage: docker mcp policy set <content>
pname: docker mcp policy
plink: docker_mcp_policy.yaml
examples: |-
    ### Backup the current policy to a file
    docker mcp policy dump > policy.conf
@z

@x
    ### Set a new policy
    docker mcp policy set "my-secret allows postgres"
@y
    ### Set a new policy
    docker mcp policy set "my-secret allows postgres"
@z

@x
    ### Restore the previous policy
    cat policy.conf | docker mcp policy set
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ### Restore the previous policy
    cat policy.conf | docker mcp policy set
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
