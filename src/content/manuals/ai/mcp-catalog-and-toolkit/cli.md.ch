%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Use MCP Toolkit from the CLI
linkTitle: Use with CLI
description: Manage MCP profiles, servers, and catalogs using the Docker MCP CLI.
keywords: docker mcp, cli, profiles, servers, catalog, gateway
@y
title: Use MCP Toolkit from the CLI
linkTitle: Use with CLI
description: Manage MCP profiles, servers, and catalogs using the Docker MCP CLI.
keywords: docker mcp, cli, profiles, servers, catalog, gateway
@z

@x
{{< summary-bar feature_name="Docker MCP Toolkit" >}}
@y
{{< summary-bar feature_name="Docker MCP Toolkit" >}}
@z

@x
> [!NOTE]
> The `docker mcp` commands documented here are available in Docker Desktop
> 4.62 and later. Earlier versions may not support all commands shown.
@y
> [!NOTE]
> The `docker mcp` commands documented here are available in Docker Desktop
> 4.62 and later. Earlier versions may not support all commands shown.
@z

@x
The `docker mcp` commands let you manage MCP profiles, servers, OAuth
credentials, and catalogs from the terminal. Use the CLI for scripting,
automation, and headless environments.
@y
The `docker mcp` commands let you manage MCP profiles, servers, OAuth
credentials, and catalogs from the terminal. Use the CLI for scripting,
automation, and headless environments.
@z

@x
## Profiles
@y
## Profiles
@z

@x
### Create a profile
@y
### Create a profile
@z

@x
```console
$ docker mcp profile create --name <profile-id>
```
@y
```console
$ docker mcp profile create --name <profile-id>
```
@z

@x
The profile ID is used to reference the profile in subsequent commands:
@y
The profile ID is used to reference the profile in subsequent commands:
@z

@x
```console
$ docker mcp profile create --name web-dev
```
@y
```console
$ docker mcp profile create --name web-dev
```
@z

@x
### List profiles
@y
### List profiles
@z

@x
```console
$ docker mcp profile list
```
@y
```console
$ docker mcp profile list
```
@z

@x
### View a profile
@y
### View a profile
@z

@x
```console
$ docker mcp profile show <profile-id>
```
@y
```console
$ docker mcp profile show <profile-id>
```
@z

@x
### Remove a profile
@y
### Remove a profile
@z

@x
```console
$ docker mcp profile remove <profile-id>
```
@y
```console
$ docker mcp profile remove <profile-id>
```
@z

@x
> [!CAUTION]
> Removing a profile deletes all its server configurations and settings. This
> action can't be undone.
@y
> [!CAUTION]
> Removing a profile deletes all its server configurations and settings. This
> action can't be undone.
@z

@x
## Servers
@y
## Servers
@z

@x
### Browse the catalog
@y
### Browse the catalog
@z

@x
List available servers and their IDs:
@y
List available servers and their IDs:
@z

@x
```console
$ docker mcp catalog server ls mcp/docker-mcp-catalog
```
@y
```console
$ docker mcp catalog server ls mcp/docker-mcp-catalog
```
@z

@x
The output lists each server by name. The name (for example, `playwright` or
`github-official`) is the server ID to use in `catalog://` URIs.
@y
The output lists each server by name. The name (for example, `playwright` or
`github-official`) is the server ID to use in `catalog://` URIs.
@z

@x
To look up a server ID in Docker Desktop, open **MCP Toolkit** > **Catalog**,
select a server, and check the **Server ID** field.
@y
To look up a server ID in Docker Desktop, open **MCP Toolkit** > **Catalog**,
select a server, and check the **Server ID** field.
@z

@x
### Add servers to a profile
@y
### Add servers to a profile
@z

@x
Servers are referenced by URI. The URI format depends on where the server
comes from:
@y
Servers are referenced by URI. The URI format depends on where the server
comes from:
@z

@x
| Format | Source |
| --- | --- |
| `catalog://<catalog-ref>/<server-id>` | An OCI catalog |
| `docker://<image>:<tag>` | A Docker image |
| `https://<url>/v0/servers/<uuid>` | The MCP community registry |
| `file://<path>` | A local YAML or JSON file |
@y
| Format | Source |
| --- | --- |
| `catalog://<catalog-ref>/<server-id>` | An OCI catalog |
| `docker://<image>:<tag>` | A Docker image |
| `https://<url>/v0/servers/<uuid>` | The MCP community registry |
| `file://<path>` | A local YAML or JSON file |
@z

@x
The most common format is `catalog://`, where `<catalog-ref>` matches the
**Catalog** field and `<server-id>` matches the **Server ID** field shown in
Docker Desktop or in the `catalog server ls` output:
@y
The most common format is `catalog://`, where `<catalog-ref>` matches the
**Catalog** field and `<server-id>` matches the **Server ID** field shown in
Docker Desktop or in the `catalog server ls` output:
@z

@x
```console
$ docker mcp profile server add <profile-id> \
  --server catalog://<catalog-ref>/<server-id>
```
@y
```console
$ docker mcp profile server add <profile-id> \
  --server catalog://<catalog-ref>/<server-id>
```
@z

@x
Add multiple servers in one command:
@y
Add multiple servers in one command:
@z

@x
```console
$ docker mcp profile server add web-dev \
  --server catalog://mcp/docker-mcp-catalog/github-official \
  --server catalog://mcp/docker-mcp-catalog/playwright
```
@y
```console
$ docker mcp profile server add web-dev \
  --server catalog://mcp/docker-mcp-catalog/github-official \
  --server catalog://mcp/docker-mcp-catalog/playwright
```
@z

@x
To add a server defined in a local YAML file:
@y
To add a server defined in a local YAML file:
@z

@x
```console
$ docker mcp profile server add my-profile \
  --server file://./my-server.yaml
```
@y
```console
$ docker mcp profile server add my-profile \
  --server file://./my-server.yaml
```
@z

@x
The YAML file defines the server image and configuration:
@y
The YAML file defines the server image and configuration:
@z

@x
```yaml
name: my-server
title: My Server
type: server
image: myimage:latest
description: Description of the server
```
@y
```yaml
name: my-server
title: My Server
type: server
image: myimage:latest
description: Description of the server
```
@z

@x
If the server requires OAuth authentication, authorize it in Docker Desktop
after adding. See [OAuth authentication](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md#oauth-authentication).
@y
If the server requires OAuth authentication, authorize it in Docker Desktop
after adding. See [OAuth authentication](manuals/ai/mcp-catalog-and-toolkit/toolkit.md#oauth-authentication).
@z

@x
### List servers
@y
### List servers
@z

@x
List all servers across all profiles:
@y
List all servers across all profiles:
@z

@x
```console
$ docker mcp profile server ls
```
@y
```console
$ docker mcp profile server ls
```
@z

@x
Filter by profile:
@y
Filter by profile:
@z

@x
```console
$ docker mcp profile server ls --filter profile=web-dev
```
@y
```console
$ docker mcp profile server ls --filter profile=web-dev
```
@z

@x
### Remove a server
@y
### Remove a server
@z

@x
```console
$ docker mcp profile server remove <profile-id> --name <server-name>
```
@y
```console
$ docker mcp profile server remove <profile-id> --name <server-name>
```
@z

@x
Remove multiple servers at once:
@y
Remove multiple servers at once:
@z

@x
```console
$ docker mcp profile server remove web-dev \
  --name github-official \
  --name playwright
```
@y
```console
$ docker mcp profile server remove web-dev \
  --name github-official \
  --name playwright
```
@z

@x
### Configure server settings
@y
### Configure server settings
@z

@x
Set and retrieve configuration values for servers in a profile:
@y
Set and retrieve configuration values for servers in a profile:
@z

@x
```console
$ docker mcp profile config <profile-id> --set <server-id>.<key>=<value>
$ docker mcp profile config <profile-id> --get-all
$ docker mcp profile config <profile-id> --del <server-id>.<key>
```
@y
```console
$ docker mcp profile config <profile-id> --set <server-id>.<key>=<value>
$ docker mcp profile config <profile-id> --get-all
$ docker mcp profile config <profile-id> --del <server-id>.<key>
```
@z

@x
Server configuration keys and their expected values are defined by each server.
Check the server's documentation or its entry in Docker Desktop under
**MCP Toolkit** > **Catalog** > **Configuration**.
@y
Server configuration keys and their expected values are defined by each server.
Check the server's documentation or its entry in Docker Desktop under
**MCP Toolkit** > **Catalog** > **Configuration**.
@z

@x
## Gateway
@y
## Gateway
@z

@x
Run the MCP Gateway with a specific profile:
@y
Run the MCP Gateway with a specific profile:
@z

@x
```console
$ docker mcp gateway run --profile <profile-id>
```
@y
```console
$ docker mcp gateway run --profile <profile-id>
```
@z

@x
Omit `--profile` to use the default profile.
@y
Omit `--profile` to use the default profile.
@z

@x
### Connect a client manually
@y
### Connect a client manually
@z

@x
To connect any client that isn't listed in Docker Desktop, configure it to run
the gateway over `stdio`. For example, in a JSON-based client configuration:
@y
To connect any client that isn't listed in Docker Desktop, configure it to run
the gateway over `stdio`. For example, in a JSON-based client configuration:
@z

@x
```json
{
  "servers": {
    "MCP_DOCKER": {
      "command": "docker",
      "args": ["mcp", "gateway", "run", "--profile", "web-dev"],
      "type": "stdio"
    }
  }
}
```
@y
```json
{
  "servers": {
    "MCP_DOCKER": {
      "command": "docker",
      "args": ["mcp", "gateway", "run", "--profile", "web-dev"],
      "type": "stdio"
    }
  }
}
```
@z

@x
For Claude Desktop, the format is:
@y
For Claude Desktop, the format is:
@z

@x
```json
{
  "mcpServers": {
    "MCP_DOCKER": {
      "command": "docker",
      "args": ["mcp", "gateway", "run", "--profile", "web-dev"]
    }
  }
}
```
@y
```json
{
  "mcpServers": {
    "MCP_DOCKER": {
      "command": "docker",
      "args": ["mcp", "gateway", "run", "--profile", "web-dev"]
    }
  }
}
```
@z

@x
### Connect a named client
@y
### Connect a named client
@z

@x
Connect a supported client to a profile:
@y
Connect a supported client to a profile:
@z

@x
```console
$ docker mcp client connect <client> --profile <profile-id>
```
@y
```console
$ docker mcp client connect <client> --profile <profile-id>
```
@z

@x
For example, to connect VS Code to a project-specific profile:
@y
For example, to connect VS Code to a project-specific profile:
@z

@x
```console
$ docker mcp client connect vscode --profile my-project
```
@y
```console
$ docker mcp client connect vscode --profile my-project
```
@z

@x
This creates a `.vscode/mcp.json` file in the current directory. Because this
is a user-specific file, add it to `.gitignore`:
@y
This creates a `.vscode/mcp.json` file in the current directory. Because this
is a user-specific file, add it to `.gitignore`:
@z

@x
```console
$ echo ".vscode/mcp.json" >> .gitignore
```
@y
```console
$ echo ".vscode/mcp.json" >> .gitignore
```
@z

@x
## Share profiles
@y
## Share profiles
@z

@x
Profiles are shared as OCI artifacts via any OCI-compatible registry.
Credentials are not included for security reasons. Team members configure
OAuth separately after pulling.
@y
Profiles are shared as OCI artifacts via any OCI-compatible registry.
Credentials are not included for security reasons. Team members configure
OAuth separately after pulling.
@z

@x
### Push a profile
@y
### Push a profile
@z

@x
```console
$ docker mcp profile push <profile-id> <registry-reference>
```
@y
```console
$ docker mcp profile push <profile-id> <registry-reference>
```
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker mcp profile push web-dev registry.example.com/profiles/web-dev:v1
```
@y
```console
$ docker mcp profile push web-dev registry.example.com/profiles/web-dev:v1
```
@z

@x
### Pull a profile
@y
### Pull a profile
@z

@x
```console
$ docker mcp profile pull <registry-reference>
```
@y
```console
$ docker mcp profile pull <registry-reference>
```
@z

@x
For example:
@y
For example:
@z

@x
```console
$ docker mcp profile pull registry.example.com/profiles/team-standard:latest
```
@y
```console
$ docker mcp profile pull registry.example.com/profiles/team-standard:latest
```
@z

@x
## Custom catalogs
@y
## Custom catalogs
@z

@x
Custom catalogs let you curate a focused collection of servers for your team or
organization. For an overview of what custom catalogs are and when to use them,
see [Custom catalogs](/manuals/ai/mcp-catalog-and-toolkit/catalog.md#custom-catalogs).
@y
Custom catalogs let you curate a focused collection of servers for your team or
organization. For an overview of what custom catalogs are and when to use them,
see [Custom catalogs](manuals/ai/mcp-catalog-and-toolkit/catalog.md#custom-catalogs).
@z

@x
Catalogs are referenced by OCI reference, for example
`registry.example.com/mcp/my-catalog:latest`. Servers within a catalog use
the same URI schemes as when
[adding servers to a profile](#add-servers-to-a-profile).
@y
Catalogs are referenced by OCI reference, for example
`registry.example.com/mcp/my-catalog:latest`. Servers within a catalog use
the same URI schemes as when
[adding servers to a profile](#add-servers-to-a-profile).
@z

@x
### Customize the Docker catalog
@y
### Customize the Docker catalog
@z

@x
Use the Docker catalog as a base, then add or remove servers to fit your
organization's needs. Copy it first:
@y
Use the Docker catalog as a base, then add or remove servers to fit your
organization's needs. Copy it first:
@z

@x
```console
$ docker mcp catalog tag mcp/docker-mcp-catalog registry.example.com/mcp/company-tools:latest
```
@y
```console
$ docker mcp catalog tag mcp/docker-mcp-catalog registry.example.com/mcp/company-tools:latest
```
@z

@x
List the servers it contains:
@y
List the servers it contains:
@z

@x
```console
$ docker mcp catalog server ls registry.example.com/mcp/company-tools:latest
```
@y
```console
$ docker mcp catalog server ls registry.example.com/mcp/company-tools:latest
```
@z

@x
Remove servers your organization doesn't approve:
@y
Remove servers your organization doesn't approve:
@z

@x
```console
$ docker mcp catalog server remove registry.example.com/mcp/company-tools:latest \
  --name <server-name>
```
@y
```console
$ docker mcp catalog server remove registry.example.com/mcp/company-tools:latest \
  --name <server-name>
```
@z

@x
Add your own private servers, packaged as Docker images:
@y
Add your own private servers, packaged as Docker images:
@z

@x
```console
$ docker mcp catalog server add registry.example.com/mcp/company-tools:latest \
  --server docker://registry.example.com/mcp/internal-api:latest \
  --server docker://registry.example.com/mcp/data-pipeline:latest
```
@y
```console
$ docker mcp catalog server add registry.example.com/mcp/company-tools:latest \
  --server docker://registry.example.com/mcp/internal-api:latest \
  --server docker://registry.example.com/mcp/data-pipeline:latest
```
@z

@x
Push when ready:
@y
Push when ready:
@z

@x
```console
$ docker mcp catalog push registry.example.com/mcp/company-tools:latest
```
@y
```console
$ docker mcp catalog push registry.example.com/mcp/company-tools:latest
```
@z

@x
### Build a catalog from scratch
@y
### Build a catalog from scratch
@z

@x
To include exactly what you choose and nothing else, create a catalog from
scratch. You can include servers from the Docker catalog, your own private
images, or both.
@y
To include exactly what you choose and nothing else, create a catalog from
scratch. You can include servers from the Docker catalog, your own private
images, or both.
@z

@x
Create a catalog and specify which servers to include:
@y
Create a catalog and specify which servers to include:
@z

@x
```console
$ docker mcp catalog create registry.example.com/mcp/data-tools:latest \
  --title "Data Analysis Tools" \
  --server catalog://mcp/docker-mcp-catalog/postgres \
  --server catalog://mcp/docker-mcp-catalog/brave-search \
  --server docker://registry.example.com/mcp/analytics:latest
```
@y
```console
$ docker mcp catalog create registry.example.com/mcp/data-tools:latest \
  --title "Data Analysis Tools" \
  --server catalog://mcp/docker-mcp-catalog/postgres \
  --server catalog://mcp/docker-mcp-catalog/brave-search \
  --server docker://registry.example.com/mcp/analytics:latest
```
@z

@x
View the result:
@y
View the result:
@z

@x
```console
$ docker mcp catalog show registry.example.com/mcp/data-tools:latest
```
@y
```console
$ docker mcp catalog show registry.example.com/mcp/data-tools:latest
```
@z

@x
Push to distribute:
@y
Push to distribute:
@z

@x
```console
$ docker mcp catalog push registry.example.com/mcp/data-tools:latest
```
@y
```console
$ docker mcp catalog push registry.example.com/mcp/data-tools:latest
```
@z

@x
### Distribute a catalog
@y
### Distribute a catalog
@z

@x
Push your catalog so team members can import it:
@y
Push your catalog so team members can import it:
@z

@x
```console
$ docker mcp catalog push <oci-reference>
```
@y
```console
$ docker mcp catalog push <oci-reference>
```
@z

@x
Team members can pull it using the CLI:
@y
Team members can pull it using the CLI:
@z

@x
```console
$ docker mcp catalog pull <oci-reference>
```
@y
```console
$ docker mcp catalog pull <oci-reference>
```
@z

@x
Or import it using Docker Desktop: select **MCP Toolkit** > **Catalog** >
**Import catalog** and enter the OCI reference.
@y
Or import it using Docker Desktop: select **MCP Toolkit** > **Catalog** >
**Import catalog** and enter the OCI reference.
@z

@x
### Use a custom catalog with the gateway
@y
### Use a custom catalog with the gateway
@z

@x
Run the gateway with your catalog instead of the default Docker catalog:
@y
Run the gateway with your catalog instead of the default Docker catalog:
@z

@x
```console
$ docker mcp gateway run --catalog <oci-reference>
```
@y
```console
$ docker mcp gateway run --catalog <oci-reference>
```
@z

@x
For [Dynamic MCP](/manuals/ai/mcp-catalog-and-toolkit/dynamic-mcp.md), where
agents discover and add servers during conversations, this limits what agents
can find to your curated set.
@y
For [Dynamic MCP](manuals/ai/mcp-catalog-and-toolkit/dynamic-mcp.md), where
agents discover and add servers during conversations, this limits what agents
can find to your curated set.
@z

@x
To enable specific servers from your catalog without using a profile:
@y
To enable specific servers from your catalog without using a profile:
@z

@x
```console
$ docker mcp gateway run --catalog <oci-reference> --servers <name1> --servers <name2>
```
@y
```console
$ docker mcp gateway run --catalog <oci-reference> --servers <name1> --servers <name2>
```
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [Get started with MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/get-started.md)
- [MCP Profiles](/manuals/ai/mcp-catalog-and-toolkit/profiles.md)
- [MCP Catalog](/manuals/ai/mcp-catalog-and-toolkit/catalog.md)
- [MCP Gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@y
- [Get started with MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/get-started.md)
- [MCP Profiles](manuals/ai/mcp-catalog-and-toolkit/profiles.md)
- [MCP Catalog](manuals/ai/mcp-catalog-and-toolkit/catalog.md)
- [MCP Gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@z
