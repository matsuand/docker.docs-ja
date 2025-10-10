%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp tools disable
short: disable one or more tools
long: disable one or more tools
usage: docker mcp tools disable [tool1] [tool2] ...
@y
command: docker mcp tools disable
short: disable one or more tools
long: disable one or more tools
usage: docker mcp tools disable [tool1] [tool2] ...
@z

% options:

@x server
      description: |
        Specify which server provides the tools (optional, will auto-discover if not provided)
@y
      description: |
        Specify which server provides the tools (optional, will auto-discover if not provided)
@z

% inherited_options:

@x format
      description: Output format (json|list)
@y
      description: Output format (json|list)
@z

@x gateway-arg
      description: Additional arguments passed to the gateway
@y
      description: Additional arguments passed to the gateway
@z

@x verbose
      description: Verbose output
@y
      description: Verbose output
@z

@x version
      description: Version of the gateway
@y
      description: Version of the gateway
@z

% snip directives...
