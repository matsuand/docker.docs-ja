%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker mcp catalog import
short: Import a catalog from URL or file
long: "Import an MCP server catalog from a URL or local file. The catalog will be downloaded \nand stored locally for use with the MCP gateway.\n\nWhen --mcp-registry flag is used, the argument must be an existing catalog name, and the\ncommand will import servers from the MCP registry URL into that catalog."
usage: docker mcp catalog import <alias|url|file>
@y
command: docker mcp catalog import
short: Import a catalog from URL or file
long: "Import an MCP server catalog from a URL or local file. The catalog will be downloaded \nand stored locally for use with the MCP gateway.\n\nWhen --mcp-registry flag is used, the argument must be an existing catalog name, and the\ncommand will import servers from the MCP registry URL into that catalog."
usage: docker mcp catalog import <alias|url|file>
@z

% options:

@x dry-run
      description: Show Imported Data but do not update the Catalog
@y
      description: Show Imported Data but do not update the Catalog
@z

@x mcp-registry
      description: Import server from MCP registry URL into existing catalog
@y
      description: Import server from MCP registry URL into existing catalog
@z

@x
examples: "  # Import from URL\n  docker mcp catalog import https://example.com/my-catalog.yaml\n  \n  # Import from local file\n  docker mcp catalog import ./shared-catalog.yaml\n  \n  # Import from MCP registry URL into existing catalog\n  docker mcp catalog import my-catalog --mcp-registry https://registry.example.com/server"
@y
examples: "  # Import from URL\n  docker mcp catalog import https://example.com/my-catalog.yaml\n  \n  # Import from local file\n  docker mcp catalog import ./shared-catalog.yaml\n  \n  # Import from MCP registry URL into existing catalog\n  docker mcp catalog import my-catalog --mcp-registry https://registry.example.com/server"
@z

% snip directives...
