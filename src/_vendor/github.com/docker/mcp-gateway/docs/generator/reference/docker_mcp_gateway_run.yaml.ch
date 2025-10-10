%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp gateway run
short: Run the gateway
long: Run the gateway
usage: docker mcp gateway run
@y
command: docker mcp gateway run
short: Run the gateway
long: Run the gateway
usage: docker mcp gateway run
@z

% options:

@x additional-catalog
      description: Additional catalog paths to append to the default catalogs
@y
      description: Additional catalog paths to append to the default catalogs
@z

@x additional-config
      description: Additional config paths to merge with the default config.yaml
@y
      description: Additional config paths to merge with the default config.yaml
@z

@x additional-registry
      description: Additional registry paths to merge with the default registry.yaml
@y
      description: Additional registry paths to merge with the default registry.yaml
@z

@x additional-tools-config
      description: Additional tools paths to merge with the default tools.yaml
@y
      description: Additional tools paths to merge with the default tools.yaml
@z

@x block-network
      description: Block tools from accessing forbidden network resources
@y
      description: Block tools from accessing forbidden network resources
@z

@x block-secrets
      description: Block secrets from being/received sent to/from tools
@y
      description: Block secrets from being/received sent to/from tools
@z

@x catalog
      description: |
        Paths to docker catalogs (absolute or relative to ~/.docker/mcp/catalogs/)
@y
      description: |
        Paths to docker catalogs (absolute or relative to ~/.docker/mcp/catalogs/)
@z

@x central
      description: In central mode, clients tell us which servers to enable
@y
      description: In central mode, clients tell us which servers to enable
@z

@x config
      description: Paths to the config files (absolute or relative to ~/.docker/mcp/)
@y
      description: Paths to the config files (absolute or relative to ~/.docker/mcp/)
@z

@x cpus
      description: CPUs allocated to each MCP Server (default is 1)
@y
      description: CPUs allocated to each MCP Server (default is 1)
@z

@x debug-dns
      description: Debug DNS resolution
@y
      description: Debug DNS resolution
@z

@x dry-run
      description: |
        Start the gateway but do not listen for connections (useful for testing the configuration)
@y
      description: |
        Start the gateway but do not listen for connections (useful for testing the configuration)
@z

@x enable-all-servers
      description: |
        Enable all servers in the catalog (instead of using individual --servers options)
@y
      description: |
        Enable all servers in the catalog (instead of using individual --servers options)
@z

@x interceptor
      description: |
        List of interceptors to use (format: when:type:path, e.g. 'before:exec:/bin/path')
@y
      description: |
        List of interceptors to use (format: when:type:path, e.g. 'before:exec:/bin/path')
@z

@x log-calls
      description: Log calls to the tools
@y
      description: Log calls to the tools
@z

@x long-lived
      description: |
        Containers are long-lived and will not be removed until the gateway is stopped, useful for stateful servers
@y
      description: |
        Containers are long-lived and will not be removed until the gateway is stopped, useful for stateful servers
@z

@x mcp-registry
      description: MCP registry URLs to fetch servers from (can be repeated)
@y
      description: MCP registry URLs to fetch servers from (can be repeated)
@z

@x memory
      description: Memory allocated to each MCP Server (default is 2Gb)
@y
      description: Memory allocated to each MCP Server (default is 2Gb)
@z

@x oci-ref
      description: OCI image references to use
@y
      description: OCI image references to use
@z

@x port
      description: TCP port to listen on (default is to listen on stdio)
@y
      description: TCP port to listen on (default is to listen on stdio)
@z

@x registry
      description: |
        Paths to the registry files (absolute or relative to ~/.docker/mcp/)
@y
      description: |
        Paths to the registry files (absolute or relative to ~/.docker/mcp/)
@z

@x secrets
      description: |
        Colon separated paths to search for secrets. Can be `docker-desktop` or a path to a .env file (default to using Docker Desktop's secrets API)
@y
      description: |
        Colon separated paths to search for secrets. Can be `docker-desktop` or a path to a .env file (default to using Docker Desktop's secrets API)
@z

@x servers
      description: |
        Names of the servers to enable (if non empty, ignore --registry flag)
@y
      description: |
        Names of the servers to enable (if non empty, ignore --registry flag)
@z

@x static
      description: Enable static mode (aka pre-started servers)
@y
      description: Enable static mode (aka pre-started servers)
@z

@x tools
      description: List of tools to enable
@y
      description: List of tools to enable
@z

@x tools-config
      description: Paths to the tools files (absolute or relative to ~/.docker/mcp/)
@y
      description: Paths to the tools files (absolute or relative to ~/.docker/mcp/)
@z

@x transport
      description: stdio, sse or streaming (default is stdio)
@y
      description: stdio, sse or streaming (default is stdio)
@z

@x verbose
      description: Verbose output
@y
      description: Verbose output
@z

@x verify-signatures
      description: Verify signatures of the server images
@y
      description: Verify signatures of the server images
@z

@x watch
      description: Watch for changes and reconfigure the gateway
@y
      description: Watch for changes and reconfigure the gateway
@z

% snip directives...
