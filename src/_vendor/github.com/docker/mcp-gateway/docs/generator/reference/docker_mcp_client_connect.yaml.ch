%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp client connect
short: |
    Connect the Docker MCP Toolkit to a client. Supported clients: claude-desktop continue cursor gemini goose gordon lmstudio sema4 vscode
long: |
    Connect the Docker MCP Toolkit to a client. Supported clients: claude-desktop continue cursor gemini goose gordon lmstudio sema4 vscode
usage: |-
    docker mcp client connect [OPTIONS] <mcp-client>
@y
command: docker mcp client connect
short: |
    Connect the Docker MCP Toolkit to a client. Supported clients: claude-desktop continue cursor gemini goose gordon lmstudio sema4 vscode
long: |
    Connect the Docker MCP Toolkit to a client. Supported clients: claude-desktop continue cursor gemini goose gordon lmstudio sema4 vscode
usage: |-
    docker mcp client connect [OPTIONS] <mcp-client>
@z

@x
    Supported clients: claude-desktop continue cursor gemini goose gordon lmstudio sema4 vscode
pname: docker mcp client
plink: docker_mcp_client.yaml
options:
    - option: global
      shorthand: g
      value_type: bool
      default_value: "false"
      description: |
        Change the system wide configuration or the clients setup in your current git repo.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only display errors.
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
@y
    Supported clients: claude-desktop continue cursor gemini goose gordon lmstudio sema4 vscode
pname: docker mcp client
plink: docker_mcp_client.yaml
options:
    - option: global
      shorthand: g
      value_type: bool
      default_value: "false"
      description: |
        Change the system wide configuration or the clients setup in your current git repo.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only display errors.
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
@z
