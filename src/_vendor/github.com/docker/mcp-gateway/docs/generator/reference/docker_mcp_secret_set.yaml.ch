%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp secret set
short: Set a secret in Docker Desktop's secret store
long: Set a secret in Docker Desktop's secret store
usage: docker mcp secret set key[=value]
pname: docker mcp secret
plink: docker_mcp_secret.yaml
options:
    - option: provider
      value_type: string
      description: 'Supported: credstore, oauth/<provider>'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Use secrets for postgres password with default policy
@y
command: docker mcp secret set
short: Set a secret in Docker Desktop's secret store
long: Set a secret in Docker Desktop's secret store
usage: docker mcp secret set key[=value]
pname: docker mcp secret
plink: docker_mcp_secret.yaml
options:
    - option: provider
      value_type: string
      description: 'Supported: credstore, oauth/<provider>'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Use secrets for postgres password with default policy
@z

@x
    ```console
    docker mcp secret set POSTGRES_PASSWORD=my-secret-password
    docker run -d -l x-secret:POSTGRES_PASSWORD=/pwd.txt -e POSTGRES_PASSWORD_FILE=/pwd.txt -p 5432 postgres
    ```
@y
    ```console
    docker mcp secret set POSTGRES_PASSWORD=my-secret-password
    docker run -d -l x-secret:POSTGRES_PASSWORD=/pwd.txt -e POSTGRES_PASSWORD_FILE=/pwd.txt -p 5432 postgres
    ```
@z

@x
    ### Pass the secret via STDIN
@y
    ### Pass the secret via STDIN
@z

@x
    ```console
    echo my-secret-password > pwd.txt
    cat pwd.txt | docker mcp secret set POSTGRES_PASSWORD
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    echo my-secret-password > pwd.txt
    cat pwd.txt | docker mcp secret set POSTGRES_PASSWORD
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
