%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker MCP Toolkit
linkTitle: MCP Toolkit
description: Use the MCP Toolkit to set up MCP servers and MCP clients.
keywords: Docker MCP Toolkit, MCP server, MCP client, AI agents
@y
title: Docker MCP Toolkit
linkTitle: MCP Toolkit
description: Use the MCP Toolkit to set up MCP servers and MCP clients.
keywords: Docker MCP Toolkit, MCP server, MCP client, AI agents
@z

@x
{{< summary-bar feature_name="Docker MCP Toolkit" >}}
@y
{{< summary-bar feature_name="Docker MCP Toolkit" >}}
@z

@x
The Docker MCP Toolkit is a gateway that lets you set up, manage, and run
containerized MCP servers and connect them to AI agents. It removes friction
from tool usage by offering secure defaults, one-click setup, and support for a
growing ecosystem of LLM-based clients. It is the fastest way from MCP tool
discovery to local execution.
@y
The Docker MCP Toolkit is a gateway that lets you set up, manage, and run
containerized MCP servers and connect them to AI agents. It removes friction
from tool usage by offering secure defaults, one-click setup, and support for a
growing ecosystem of LLM-based clients. It is the fastest way from MCP tool
discovery to local execution.
@z

@x
> [!NOTE]
> If you need to run your own MCP gateway,
> see [Docker MCP Gateway](../mcp-gateway/_index.md).
@y
> [!NOTE]
> If you need to run your own MCP gateway,
> see [Docker MCP Gateway](../mcp-gateway/_index.md).
@z

@x
## Key features
@y
## Key features
@z

@x
- Cross-LLM compatibility: Instantly works with Claude Desktop, Cursor, Continue.dev, and [Gordon](/manuals/ai/gordon/_index.md).
- Integrated tool discovery: Browse and launch MCP servers from the Docker MCP Catalog directly in Docker Desktop.
- Zero manual setup: No dependency management, runtime configuration, or server setup required.
- Functions as both an MCP server aggregator and a gateway for clients to access installed MCP servers.
@y
- Cross-LLM compatibility: Instantly works with Claude Desktop, Cursor, Continue.dev, and [Gordon](manuals/ai/gordon/_index.md).
- Integrated tool discovery: Browse and launch MCP servers from the Docker MCP Catalog directly in Docker Desktop.
- Zero manual setup: No dependency management, runtime configuration, or server setup required.
- Functions as both an MCP server aggregator and a gateway for clients to access installed MCP servers.
@z

@x
## How the MCP Toolkit works
@y
## How the MCP Toolkit works
@z

@x
MCP introduces two core concepts: MCP clients and MCP servers.
@y
MCP introduces two core concepts: MCP clients and MCP servers.
@z

@x
- MCP clients are typically embedded in LLM-based applications, such as the
  Claude Desktop app. They request resources or actions.
- MCP servers are launched by the client to perform the requested tasks, using
  any necessary tools, languages, or processes.
@y
- MCP clients are typically embedded in LLM-based applications, such as the
  Claude Desktop app. They request resources or actions.
- MCP servers are launched by the client to perform the requested tasks, using
  any necessary tools, languages, or processes.
@z

@x
Docker standardizes the development, packaging, and distribution of
applications, including MCP servers. By packaging MCP servers as containers,
Docker eliminates issues related to isolation and environment differences. You
can run a container directly, without managing dependencies or configuring
runtimes.
@y
Docker standardizes the development, packaging, and distribution of
applications, including MCP servers. By packaging MCP servers as containers,
Docker eliminates issues related to isolation and environment differences. You
can run a container directly, without managing dependencies or configuring
runtimes.
@z

@x
Depending on the MCP server, the tools it provides might run within the same
container as the server or in dedicated containers:
@y
Depending on the MCP server, the tools it provides might run within the same
container as the server or in dedicated containers:
@z

@x
{{< tabs group="" >}}
{{< tab name="Single container">}}
@y
{{< tabs group="" >}}
{{< tab name="Single container">}}
@z

@x
![Screenshot showing a single-container MCP Toolkit setup.](./images/mcp-servers.svg)
@y
![Screenshot showing a single-container MCP Toolkit setup.](./images/mcp-servers.svg)
@z

@x
{{< /tab >}}
{{< tab name="Separate containers">}}
@y
{{< /tab >}}
{{< tab name="Separate containers">}}
@z

@x
![Screenshot showing a multi-container MCP Toolkit setup.](./images/mcp-servers-2.svg)
@y
![Screenshot showing a multi-container MCP Toolkit setup.](./images/mcp-servers-2.svg)
@z

@x
{{< /tab >}}
{{</tabs >}}
@y
{{< /tab >}}
{{</tabs >}}
@z

@x
## Security
@y
## Security
@z

@x
The Docker MCP Toolkit combines passive and active measures to reduce attack
surfaces and ensure safe runtime behavior.
@y
The Docker MCP Toolkit combines passive and active measures to reduce attack
surfaces and ensure safe runtime behavior.
@z

@x
### Passive security
@y
### Passive security
@z

@x
- Image signing and attestation: All MCP server images under `mcp/` in the [catalog](catalog.md)
  are built by Docker and digitally
  signed to verify their source and integrity. Each image includes a Software
  Bill of Materials (SBOM) for full transparency.
@y
- Image signing and attestation: All MCP server images under `mcp/` in the [catalog](catalog.md)
  are built by Docker and digitally
  signed to verify their source and integrity. Each image includes a Software
  Bill of Materials (SBOM) for full transparency.
@z

@x
### Active security
@y
### Active security
@z

@x
Security at runtime is enforced through resource and access limitations:
@y
Security at runtime is enforced through resource and access limitations:
@z

@x
- CPU allocation: MCP tools are run in their own container. They are
  restricted to 1 CPU, limiting the impact of potential misuse of computing
  resources.
@y
- CPU allocation: MCP tools are run in their own container. They are
  restricted to 1 CPU, limiting the impact of potential misuse of computing
  resources.
@z

@x
- Memory allocation: Containers for MCP tools are limited to 2 GB.
@y
- Memory allocation: Containers for MCP tools are limited to 2 GB.
@z

@x
- Filesystem access: By default, MCP Servers have no access to the host filesystem.
  The user explicitly selects the servers that will be granted file mounts.
@y
- Filesystem access: By default, MCP Servers have no access to the host filesystem.
  The user explicitly selects the servers that will be granted file mounts.
@z

@x
- Interception of tool requests: Requests to and from tools that contain sensitive
  information such as secrets are blocked.
@y
- Interception of tool requests: Requests to and from tools that contain sensitive
  information such as secrets are blocked.
@z

@x
To learn more about the MCP server catalog, see [Catalog](catalog.md).
@y
To learn more about the MCP server catalog, see [Catalog](catalog.md).
@z

@x
### Example: Use the **GitHub Official** MCP server
@y
### Example: Use the **GitHub Official** MCP server
@z

@x
Imagine you want to enable [Ask Gordon](/manuals/ai/gordon/_index.md) to interact with your GitHub account:
@y
Imagine you want to enable [Ask Gordon](manuals/ai/gordon/_index.md) to interact with your GitHub account:
@z

@x
1. From the **MCP Toolkit** menu, select the **Catalog** tab and find
   the **GitHub Official** server and add it.
2. In the server's **Config** tab, [connect via OAuth](#authenticate-via-oauth).
3. In the **Clients** tab, ensure Gordon is connected.
4. From the **Ask Gordon** menu, you can now send requests related to your
   GitHub account, in accordance to the tools provided by the GitHub Official server. To test it, ask Gordon:
@y
1. From the **MCP Toolkit** menu, select the **Catalog** tab and find
   the **GitHub Official** server and add it.
2. In the server's **Config** tab, [connect via OAuth](#authenticate-via-oauth).
3. In the **Clients** tab, ensure Gordon is connected.
4. From the **Ask Gordon** menu, you can now send requests related to your
   GitHub account, in accordance to the tools provided by the GitHub Official server. To test it, ask Gordon:
@z

@x
   ```text
   What's my GitHub handle?
   ```
@y
   ```text
   What's my GitHub handle?
   ```
@z

@x
   Make sure to allow Gordon to interact with GitHub by selecting **Always allow** in Gordon's answer.
@y
   Make sure to allow Gordon to interact with GitHub by selecting **Always allow** in Gordon's answer.
@z

@x
> [!TIP]
> By default, the Gordon client is enabled,
> which means Gordon can automatically interact with your MCP servers.
@y
> [!TIP]
> By default, the Gordon client is enabled,
> which means Gordon can automatically interact with your MCP servers.
@z

@x
### Example: Use Claude Desktop as a client
@y
### Example: Use Claude Desktop as a client
@z

@x
Imagine you have Claude Desktop installed, and you want to use the GitHub MCP server,
and the Puppeteer MCP server, you do not have to install the servers in Claude Desktop.
You can simply install these 2 MCP servers in the MCP Toolkit,
and add Claude Desktop as a client:
@y
Imagine you have Claude Desktop installed, and you want to use the GitHub MCP server,
and the Puppeteer MCP server, you do not have to install the servers in Claude Desktop.
You can simply install these 2 MCP servers in the MCP Toolkit,
and add Claude Desktop as a client:
@z

@x
1. From the **MCP Toolkit** menu, select the **Catalog** tab and find the **Puppeteer** server and add it.
1. Repeat for the **GitHub Official** server.
1. From the **Clients** tab, select **Connect** next to **Claude Desktop**. Restart
   Claude Desktop if it's running, and it can now access all the servers in the MCP Toolkit.
1. Within Claude Desktop, run a test by submitting the following prompt using the Sonnet 3.5 model:
@y
1. From the **MCP Toolkit** menu, select the **Catalog** tab and find the **Puppeteer** server and add it.
1. Repeat for the **GitHub Official** server.
1. From the **Clients** tab, select **Connect** next to **Claude Desktop**. Restart
   Claude Desktop if it's running, and it can now access all the servers in the MCP Toolkit.
1. Within Claude Desktop, run a test by submitting the following prompt using the Sonnet 3.5 model:
@z

@x
   ```text
   Take a screenshot of docs.docker.com and then invert the colors
   ```
@y
   ```text
   Take a screenshot of docs.docker.com and then invert the colors
   ```
@z

@x
### Example: Use Visual Studio Code as a client
@y
### Example: Use Visual Studio Code as a client
@z

@x
You can interact with all your installed MCP servers in Visual Studio Code:
@y
You can interact with all your installed MCP servers in Visual Studio Code:
@z

@x
<!-- vale off -->
@y
<!-- vale off -->
@z

@x
1. To enable the MCP Toolkit:
@y
1. To enable the MCP Toolkit:
@z

@x
   {{< tabs group="" >}}
   {{< tab name="Enable globally">}}
@y
   {{< tabs group="" >}}
   {{< tab name="Enable globally">}}
@z

@x
   1. Insert the following in your Visual Studio Code's User`mcp.json`:
@y
   1. Insert the following in your Visual Studio Code's User`mcp.json`:
@z

@x
      ```json
      "mcp": {
       "servers": {
         "MCP_DOCKER": {
           "command": "docker",
           "args": [
             "mcp",
             "gateway",
             "run"
           ],
           "type": "stdio"
         }
       }
      }
      ```
@y
      ```json
      "mcp": {
       "servers": {
         "MCP_DOCKER": {
           "command": "docker",
           "args": [
             "mcp",
             "gateway",
             "run"
           ],
           "type": "stdio"
         }
       }
      }
      ```
@z

@x
   {{< /tab >}}
   {{< tab name="Enable for a given project">}}
@y
   {{< /tab >}}
   {{< tab name="Enable for a given project">}}
@z

@x
   1. In your terminal, navigate to your project's folder.
   1. Run:
@y
   1. In your terminal, navigate to your project's folder.
   1. Run:
@z

@x
      ```bash
      docker mcp client connect vscode
      ```
@y
      ```bash
      docker mcp client connect vscode
      ```
@z

@x
      > [!NOTE]
      > This command creates a `.vscode/mcp.json` file in the current directory. We
      > recommend you add it to your  `.gitignore` file.
@y
      > [!NOTE]
      > This command creates a `.vscode/mcp.json` file in the current directory. We
      > recommend you add it to your  `.gitignore` file.
@z

@x
  {{< /tab >}}
  {{</tabs >}}
@y
  {{< /tab >}}
  {{</tabs >}}
@z

@x
1. In Visual Studio Code, open a new Chat and select the **Agent** mode:
@y
1. In Visual Studio Code, open a new Chat and select the **Agent** mode:
@z

@x
   ![Copilot mode switching](./images/copilot-mode.png)
@y
   ![Copilot mode switching](./images/copilot-mode.png)
@z

@x
1. You can also check the available MCP tools:
@y
1. You can also check the available MCP tools:
@z

@x
   ![Displaying tools in VSCode](./images/tools.png)
@y
   ![Displaying tools in VSCode](./images/tools.png)
@z

@x
For more information about the Agent mode, see the
[Visual Studio Code documentation](https://code.visualstudio.com/docs/copilot/chat/mcp-servers#_use-mcp-tools-in-agent-mode).
@y
For more information about the Agent mode, see the
[Visual Studio Code documentation](https://code.visualstudio.com/docs/copilot/chat/mcp-servers#_use-mcp-tools-in-agent-mode).
@z

@x
<!-- vale on -->
@y
<!-- vale on -->
@z

@x
## Authenticate via OAuth
@y
## Authenticate via OAuth
@z

@x
You can connect the MCP Toolkit to your development workflow via
OAuth integration. For now, the MCP Toolkit only supports GitHub OAuth.
@y
You can connect the MCP Toolkit to your development workflow via
OAuth integration. For now, the MCP Toolkit only supports GitHub OAuth.
@z

@x
1. On https://github.com/, ensure you are signed in.
1. In Docker Desktop, select **MCP Toolkit** and select the **OAuth** tab.
1. In the GitHub entry, select **Authorize**. Your browser opens the GitHub authorization page.
1. In the GitHub authorization page, select **Authorize Docker**. Once the authorization
   is successful, you are automatically redirected to Docker Desktop.
1. Install the **GitHub Official** MCP server, see [Install an MCP server](/manuals/ai/mcp-catalog-and-toolkit/get-started.md#install-an-mcp-server).
@y
1. On https://github.com/, ensure you are signed in.
1. In Docker Desktop, select **MCP Toolkit** and select the **OAuth** tab.
1. In the GitHub entry, select **Authorize**. Your browser opens the GitHub authorization page.
1. In the GitHub authorization page, select **Authorize Docker**. Once the authorization
   is successful, you are automatically redirected to Docker Desktop.
1. Install the **GitHub Official** MCP server, see [Install an MCP server](manuals/ai/mcp-catalog-and-toolkit/get-started.md#install-an-mcp-server).
@z

@x
The MCP Toolkit now has access to your GitHub account. To revoke access, select **Revoke** in the **OAuth** tab.
See an example in [Use the **GitHub Official** MCP server](#example-use-the-github-official-mcp-server).
@y
The MCP Toolkit now has access to your GitHub account. To revoke access, select **Revoke** in the **OAuth** tab.
See an example in [Use the **GitHub Official** MCP server](#example-use-the-github-official-mcp-server).
@z

@x
## Related pages
@y
## Related pages
@z

@x
- [Open-source MCP Gateway](/manuals/ai/mcp-gateway/_index.md)
@y
- [Open-source MCP Gateway](manuals/ai/mcp-gateway/_index.md)
@z
