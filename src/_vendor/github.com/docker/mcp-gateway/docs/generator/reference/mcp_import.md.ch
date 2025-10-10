%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker mcp import
@y
# docker mcp import
@z

@x
<!---MARKER_GEN_START-->
Import and parse a server definition from an official MCP registry URL.
@y
<!---MARKER_GEN_START-->
Import and parse a server definition from an official MCP registry URL.
@z

@x
This command fetches the server definition from the provided URL, parses it as a ServerDetail,
converts it to the internal Server format, and displays the results.
@y
This command fetches the server definition from the provided URL, parses it as a ServerDetail,
converts it to the internal Server format, and displays the results.
@z

@x
Example:
  docker mcp officialregistry import https://registry.example.com/servers/my-server
@y
Example:
  docker mcp officialregistry import https://registry.example.com/servers/my-server
@z

@x
### Options
@y
### Options
@z

@x
| Name             | Type     | Default | Description                     |
|:-----------------|:---------|:--------|:--------------------------------|
| `--catalog`      | `string` |         | import to local catalog         |
| `--mcp-registry` | `string` |         | import from MCP registry format |
| `--push`         | `bool`   |         | push the new server artifact    |
@y
| Name             | Type     | Default | Description                     |
|:-----------------|:---------|:--------|:--------------------------------|
| `--catalog`      | `string` |         | import to local catalog         |
| `--mcp-registry` | `string` |         | import from MCP registry format |
| `--push`         | `bool`   |         | push the new server artifact    |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z
