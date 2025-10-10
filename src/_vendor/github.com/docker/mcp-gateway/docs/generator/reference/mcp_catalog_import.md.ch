%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker mcp catalog import
@y
# docker mcp catalog import
@z

@x
<!---MARKER_GEN_START-->
Import an MCP server catalog from a URL or local file. The catalog will be downloaded 
and stored locally for use with the MCP gateway.
@y
<!---MARKER_GEN_START-->
Import an MCP server catalog from a URL or local file. The catalog will be downloaded 
and stored locally for use with the MCP gateway.
@z

@x
When --mcp-registry flag is used, the argument must be an existing catalog name, and the
command will import servers from the MCP registry URL into that catalog.
@y
When --mcp-registry flag is used, the argument must be an existing catalog name, and the
command will import servers from the MCP registry URL into that catalog.
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default | Description                                               |
|:-----------------|:---------|:--------|:----------------------------------------------------------|
| `--dry-run`      | `bool`   |         | Show Imported Data but do not update the Catalog          |
| `--mcp-registry` | `string` |         | Import server from MCP registry URL into existing catalog |
@y
| Name             | Type     | Default | Description                                               |
|:-----------------|:---------|:--------|:----------------------------------------------------------|
| `--dry-run`      | `bool`   |         | Show Imported Data but do not update the Catalog          |
| `--mcp-registry` | `string` |         | Import server from MCP registry URL into existing catalog |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
