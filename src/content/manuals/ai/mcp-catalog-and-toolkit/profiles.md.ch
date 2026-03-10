%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md ƒŠƒ“ƒN‚Ö‚Ì (no slash) ‘Î‰ž

@x
title: MCP Profiles
linkTitle: Profiles
description: Organize MCP servers into profiles for different projects and environments
keywords: Docker MCP, profiles, MCP servers, configuration, sharing
@y
title: MCP Profiles
linkTitle: Profiles
description: Organize MCP servers into profiles for different projects and environments
keywords: Docker MCP, profiles, MCP servers, configuration, sharing
@z

@x
{{< summary-bar feature_name="MCP Profiles" >}}
@y
{{< summary-bar feature_name="MCP Profiles" >}}
@z

@x
Profiles organize your MCP servers into named collections. Without profiles,
you'd configure servers separately for every AI application you use. Each time
you want to change which servers are available, you'd update Claude Desktop, VS
Code, Cursor, and other tools individually. Profiles solve this by centralizing
your server configurations.
@y
Profiles organize your MCP servers into named collections. Without profiles,
you'd configure servers separately for every AI application you use. Each time
you want to change which servers are available, you'd update Claude Desktop, VS
Code, Cursor, and other tools individually. Profiles solve this by centralizing
your server configurations.
@z

@x
## What profiles do
@y
## What profiles do
@z

@x
A profile is a named collection of MCP servers with their configurations and
settings. You select servers from the [MCP
Catalog](/manuals/ai/mcp-catalog-and-toolkit/catalog.md) (the source of
available servers) and add them to your profiles (your configured server
collections for specific work). Think of the catalog as a library of tools, and
profiles as your toolboxes organized for different jobs.
@y
A profile is a named collection of MCP servers with their configurations and
settings. You select servers from the [MCP
Catalog](manuals/ai/mcp-catalog-and-toolkit/catalog.md) (the source of
available servers) and add them to your profiles (your configured server
collections for specific work). Think of the catalog as a library of tools, and
profiles as your toolboxes organized for different jobs.
@z

@x
Your "web-dev" profile might include GitHub, Playwright, and database servers.
Your "data-analysis" profile might include spreadsheet, API, and visualization
servers. Connect different AI clients to different profiles, or switch between
profiles as you change tasks.
@y
Your "web-dev" profile might include GitHub, Playwright, and database servers.
Your "data-analysis" profile might include spreadsheet, API, and visualization
servers. Connect different AI clients to different profiles, or switch between
profiles as you change tasks.
@z

@x
When you run the MCP Gateway or connect a client without specifying a profile,
Docker MCP uses your default profile. If you're upgrading from a previous
version of MCP Toolkit, your existing server configurations are already in the
default profile.
@y
When you run the MCP Gateway or connect a client without specifying a profile,
Docker MCP uses your default profile. If you're upgrading from a previous
version of MCP Toolkit, your existing server configurations are already in the
default profile.
@z

@x
## Profile capabilities
@y
## Profile capabilities
@z

@x
Each profile maintains its own isolated collection of servers and
configurations. Your "web-dev" profile might include GitHub, Playwright, and
database servers, while your "data-analysis" profile includes spreadsheet, API,
and visualization servers. Create as many profiles as you need, each containing
only the servers relevant to that context.
@y
Each profile maintains its own isolated collection of servers and
configurations. Your "web-dev" profile might include GitHub, Playwright, and
database servers, while your "data-analysis" profile includes spreadsheet, API,
and visualization servers. Create as many profiles as you need, each containing
only the servers relevant to that context.
@z

@x
You can connect different AI applications to different profiles. When you
connect a client, you specify which profile it should use. This means Claude
Desktop and VS Code can have access to different server collections if needed.
@y
You can connect different AI applications to different profiles. When you
connect a client, you specify which profile it should use. This means Claude
Desktop and VS Code can have access to different server collections if needed.
@z

@x
Profiles can be shared with your team. Push a profile to your registry, and
team members can pull it to get the exact same server collection and
configuration you use.
@y
Profiles can be shared with your team. Push a profile to your registry, and
team members can pull it to get the exact same server collection and
configuration you use.
@z

@x
## Creating and managing profiles
@y
## Creating and managing profiles
@z

@x
### Create a profile
@y
### Create a profile
@z

@x
1. In Docker Desktop, select **MCP Toolkit** and select the **Profiles** tab.
2. Select **Create profile**.
3. Enter a name for your profile (e.g., "web-dev").
4. Optionally, search and add servers to your profile now, or add them later.
5. Optionally, search and add clients to connect to your profile.
6. Select **Create**.
@y
1. In Docker Desktop, select **MCP Toolkit** and select the **Profiles** tab.
2. Select **Create profile**.
3. Enter a name for your profile (e.g., "web-dev").
4. Optionally, search and add servers to your profile now, or add them later.
5. Optionally, search and add clients to connect to your profile.
6. Select **Create**.
@z

@x
Your new profile appears in the profiles list.
@y
Your new profile appears in the profiles list.
@z

@x
### View profile details
@y
### View profile details
@z

@x
Select a profile in the **Profiles** tab to view its details. The profile view
has two tabs:
@y
Select a profile in the **Profiles** tab to view its details. The profile view
has two tabs:
@z

@x
- **Overview**: Shows the servers in your profile, secrets configuration, and
  connected clients. Use the **+** buttons to add more servers or clients.
- **Tools**: Lists all available tools from your profile's servers. You can
  enable or disable individual tools.
@y
- **Overview**: Shows the servers in your profile, secrets configuration, and
  connected clients. Use the **+** buttons to add more servers or clients.
- **Tools**: Lists all available tools from your profile's servers. You can
  enable or disable individual tools.
@z

@x
### Remove a profile
@y
### Remove a profile
@z

@x
1. In the **Profiles** tab, find the profile you want to remove.
2. Select â‹® next to the profile name, and then **Delete**.
3. Confirm the removal.
@y
1. In the **Profiles** tab, find the profile you want to remove.
2. Select â‹® next to the profile name, and then **Delete**.
3. Confirm the removal.
@z

@x
> [!CAUTION]
> Removing a profile deletes all its server configurations and settings, and
> updates the client configuration (removes MCP Toolkit). This action can't be
> undone.
@y
> [!CAUTION]
> Removing a profile deletes all its server configurations and settings, and
> updates the client configuration (removes MCP Toolkit). This action can't be
> undone.
@z

@x
### Default profile
@y
### Default profile
@z

@x
When you run the MCP Gateway or use MCP Toolkit without specifying a profile,
Docker MCP uses a profile named `default`, or an empty configuration if a
`default` profile does not exist.
@y
When you run the MCP Gateway or use MCP Toolkit without specifying a profile,
Docker MCP uses a profile named `default`, or an empty configuration if a
`default` profile does not exist.
@z

@x
If you're upgrading from a previous version of MCP Toolkit, your existing
server configurations automatically migrate to the `default` profile. You don't
need to manually recreate your setup - everything continues to work as before.
@y
If you're upgrading from a previous version of MCP Toolkit, your existing
server configurations automatically migrate to the `default` profile. You don't
need to manually recreate your setup - everything continues to work as before.
@z

@x
You can always specify a different profile using the `--profile` flag with the
gateway command:
@y
You can always specify a different profile using the `--profile` flag with the
gateway command:
@z

@x
```console
$ docker mcp gateway run --profile web-dev
```
@y
```console
$ docker mcp gateway run --profile web-dev
```
@z

@x
## Adding servers to profiles
@y
## Adding servers to profiles
@z

@x
Profiles contain the MCP servers you select from the catalog. Add servers to
organize your tools for specific workflows.
@y
Profiles contain the MCP servers you select from the catalog. Add servers to
organize your tools for specific workflows.
@z

@x
### Add a server
@y
### Add a server
@z

@x
You can add servers to a profile in two ways.
@y
You can add servers to a profile in two ways.
@z

@x
From the Catalog tab:
@y
From the Catalog tab:
@z

@x
1. Select the **Catalog** tab.
2. Select the checkbox next to servers you want to add to see which profile to
   add them to.
3. Choose your profile from the drop-down.
@y
1. Select the **Catalog** tab.
2. Select the checkbox next to servers you want to add to see which profile to
   add them to.
3. Choose your profile from the drop-down.
@z

@x
From within a profile:
@y
From within a profile:
@z

@x
1. Select the **Profiles** tab and select your profile.
2. In the **Servers** section, select the **+** button.
3. Search for and select servers to add.
@y
1. Select the **Profiles** tab and select your profile.
2. In the **Servers** section, select the **+** button.
3. Search for and select servers to add.
@z

@x
If a server requires OAuth authentication, you're prompted to authorize it. See
[OAuth authentication](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md#oauth-authentication)
for details.
@y
If a server requires OAuth authentication, you're prompted to authorize it. See
[OAuth authentication](manuals/ai/mcp-catalog-and-toolkit/toolkit.md#oauth-authentication)
for details.
@z

@x
### List servers in a profile
@y
### List servers in a profile
@z

@x
Select a profile in the **Profiles** tab to see all servers it contains.
@y
Select a profile in the **Profiles** tab to see all servers it contains.
@z

@x
### Remove a server
@y
### Remove a server
@z

@x
1. Select the **Profiles** tab and select your profile.
2. In the **Servers** section, find the server you want to remove.
3. Select the delete icon next to the server.
@y
1. Select the **Profiles** tab and select your profile.
2. In the **Servers** section, find the server you want to remove.
3. Select the delete icon next to the server.
@z

@x
## Configuring profiles
@y
## Configuring profiles
@z

@x
### Server configuration
@y
### Server configuration
@z

@x
Some servers require configuration beyond authentication. Configure server
settings within your profile.
@y
Some servers require configuration beyond authentication. Configure server
settings within your profile.
@z

@x
1. Select the **Profiles** tab and select your profile.
2. In the **Servers** section, select the configure icon next to the server.
3. Adjust the server's configuration settings as needed.
@y
1. Select the **Profiles** tab and select your profile.
2. In the **Servers** section, select the configure icon next to the server.
3. Adjust the server's configuration settings as needed.
@z

@x
### OAuth credentials
@y
### OAuth credentials
@z

@x
OAuth credentials are shared across all profiles. When you authorize access to
a service like GitHub or Notion, that authorization is available to any server
in any profile that needs it.
@y
OAuth credentials are shared across all profiles. When you authorize access to
a service like GitHub or Notion, that authorization is available to any server
in any profile that needs it.
@z

@x
This means all profiles use the same OAuth credentials for a given service. If
you need to use different accounts for different projects, you'll need to
revoke and re-authorize between switching profiles.
@y
This means all profiles use the same OAuth credentials for a given service. If
you need to use different accounts for different projects, you'll need to
revoke and re-authorize between switching profiles.
@z

@x
See [OAuth authentication](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md#oauth-authentication)
for details on authorizing servers.
@y
See [OAuth authentication](manuals/ai/mcp-catalog-and-toolkit/toolkit.md#oauth-authentication)
for details on authorizing servers.
@z

@x
### Configuration persistence
@y
### Configuration persistence
@z

@x
Profile configurations persist in your Docker installation. When you restart
Docker Desktop or your system, your profiles, servers, and configurations
remain intact.
@y
Profile configurations persist in your Docker installation. When you restart
Docker Desktop or your system, your profiles, servers, and configurations
remain intact.
@z

@x
## Sharing profiles
@y
## Sharing profiles
@z

@x
Profiles can be shared with your team by pushing them to OCI-compliant
registries as artifacts. This is useful for distributing standardized MCP
setups across your organization. Credentials are not included in shared
profiles for security reasons. Team members configure OAuth separately after
pulling.
@y
Profiles can be shared with your team by pushing them to OCI-compliant
registries as artifacts. This is useful for distributing standardized MCP
setups across your organization. Credentials are not included in shared
profiles for security reasons. Team members configure OAuth separately after
pulling.
@z

@x
### Push a profile
@y
### Push a profile
@z

@x
1. Select the profile you want to share in the **Profiles** tab.
2. Select **Push to Registry**.
3. Enter the registry destination (e.g., `registry.example.com/profiles/web-dev:v1`).
4. Complete authentication if required.
@y
1. Select the profile you want to share in the **Profiles** tab.
2. Select **Push to Registry**.
3. Enter the registry destination (e.g., `registry.example.com/profiles/web-dev:v1`).
4. Complete authentication if required.
@z

@x
### Pull a profile
@y
### Pull a profile
@z

@x
1. Select **Pull from Registry** in the **Profiles** tab.
2. Enter the registry reference (e.g., `registry.example.com/profiles/team-standard:latest`).
3. Complete authentication if required.
@y
1. Select **Pull from Registry** in the **Profiles** tab.
2. Enter the registry reference (e.g., `registry.example.com/profiles/team-standard:latest`).
3. Complete authentication if required.
@z

@x
The profile is downloaded and added to your profiles list. Configure any
required OAuth credentials separately.
@y
The profile is downloaded and added to your profiles list. Configure any
required OAuth credentials separately.
@z

@x
### Team collaboration workflow
@y
### Team collaboration workflow
@z

@x
A typical workflow for sharing profiles across a team:
@y
A typical workflow for sharing profiles across a team:
@z

@x
1. Create and configure a profile with the servers your team needs.
2. Test the profile to ensure it works as expected.
3. Push the profile to your team's registry with a version tag (e.g.,
   `registry.example.com/profiles/team-dev:v1`).
4. Share the registry reference with your team.
5. Team members pull the profile and configure any required OAuth credentials.
@y
1. Create and configure a profile with the servers your team needs.
2. Test the profile to ensure it works as expected.
3. Push the profile to your team's registry with a version tag (e.g.,
   `registry.example.com/profiles/team-dev:v1`).
4. Share the registry reference with your team.
5. Team members pull the profile and configure any required OAuth credentials.
@z

@x
This ensures everyone uses the same server collection and configuration,
reducing setup time and inconsistencies.
@y
This ensures everyone uses the same server collection and configuration,
reducing setup time and inconsistencies.
@z

@x
## Using profiles with clients
@y
## Using profiles with clients
@z

@x
When you connect an AI client to the MCP Gateway, you specify which profile's
servers the client can access.
@y
When you connect an AI client to the MCP Gateway, you specify which profile's
servers the client can access.
@z

@x
### Run the gateway with a profile
@y
### Run the gateway with a profile
@z

@x
Connect clients to your profile through the **Clients** section in the MCP
Toolkit. You can add clients when creating a profile or add them to existing
profiles later.
@y
Connect clients to your profile through the **Clients** section in the MCP
Toolkit. You can add clients when creating a profile or add them to existing
profiles later.
@z

@x
### Configure clients for specific profiles
@y
### Configure clients for specific profiles
@z

@x
When setting up a client manually, you can specify which profile the client
uses. This lets different clients connect to different profiles.
@y
When setting up a client manually, you can specify which profile the client
uses. This lets different clients connect to different profiles.
@z

@x
For example, your Claude Desktop configuration might use:
@y
For example, your Claude Desktop configuration might use:
@z

@x
```json
{
  "mcpServers": {
    "MCP_DOCKER": {
      "command": "docker",
      "args": ["mcp", "gateway", "run", "--profile", "claude-work"]
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
      "args": ["mcp", "gateway", "run", "--profile", "claude-work"]
    }
  }
}
```
@z

@x
While your VS Code configuration uses a different profile:
@y
While your VS Code configuration uses a different profile:
@z

@x
```json
{
  "mcp": {
    "servers": {
      "MCP_DOCKER": {
        "command": "docker",
        "args": ["mcp", "gateway", "run", "--profile", "vscode-dev"],
        "type": "stdio"
      }
    }
  }
}
```
@y
```json
{
  "mcp": {
    "servers": {
      "MCP_DOCKER": {
        "command": "docker",
        "args": ["mcp", "gateway", "run", "--profile", "vscode-dev"],
        "type": "stdio"
      }
    }
  }
}
```
@z

@x
### Switching between profiles
@y
### Switching between profiles
@z

@x
To switch the profile your clients use, update the client configuration to
specify a different `--profile` value in the gateway command arguments.
@y
To switch the profile your clients use, update the client configuration to
specify a different `--profile` value in the gateway command arguments.
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [Get started with MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/get-started.md)
- [Use MCP Toolkit from the CLI](/manuals/ai/mcp-catalog-and-toolkit/cli.md)
- [MCP Catalog](/manuals/ai/mcp-catalog-and-toolkit/catalog.md)
- [MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md)
@y
- [Get started with MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/get-started.md)
- [Use MCP Toolkit from the CLI](manuals/ai/mcp-catalog-and-toolkit/cli.md)
- [MCP Catalog](manuals/ai/mcp-catalog-and-toolkit/catalog.md)
- [MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/toolkit.md)
@z
