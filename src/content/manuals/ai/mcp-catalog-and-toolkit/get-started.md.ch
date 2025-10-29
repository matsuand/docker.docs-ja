%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Get started with Docker MCP Toolkit
linkTitle: Get started
description: Learn how to quickly install and use the MCP Toolkit to set up servers and clients.
keywords: Docker MCP Toolkit, MCP server, MCP client, AI agents
@y
title: Get started with Docker MCP Toolkit
linkTitle: Get started
description: Learn how to quickly install and use the MCP Toolkit to set up servers and clients.
keywords: Docker MCP Toolkit, MCP server, MCP client, AI agents
@z

@x
{{< summary-bar feature_name="Docker MCP Toolkit" >}}
@y
{{< summary-bar feature_name="Docker MCP Toolkit" >}}
@z

@x
The Docker MCP Toolkit makes it easy to set up, manage, and run containerized
Model Context Protocol (MCP) servers, and connect them to AI agents. It
provides secure defaults and support for a growing ecosystem of LLM-based
clients. This page shows you how to get started quickly with the Docker MCP
Toolkit.
@y
The Docker MCP Toolkit makes it easy to set up, manage, and run containerized
Model Context Protocol (MCP) servers, and connect them to AI agents. It
provides secure defaults and support for a growing ecosystem of LLM-based
clients. This page shows you how to get started quickly with the Docker MCP
Toolkit.
@z

@x
## Setup
@y
## Setup
@z

@x
Before you begin, make sure you meet the following requirements to get started with Docker MCP Toolkit.
@y
Before you begin, make sure you meet the following requirements to get started with Docker MCP Toolkit.
@z

@x
1. Download and install the latest version of [Docker Desktop](/get-started/get-docker/).
2. Open the Docker Desktop settings and select **Beta features**.
3. Select **Enable Docker MCP Toolkit**.
4. Select **Apply**.
@y
1. Download and install the latest version of [Docker Desktop](__SUBDIR__/get-started/get-docker/).
2. Open the Docker Desktop settings and select **Beta features**.
3. Select **Enable Docker MCP Toolkit**.
4. Select **Apply**.
@z

@x
There are multiple ways to get started with Docker MCP Toolkit. You can:
@y
There are multiple ways to get started with Docker MCP Toolkit. You can:
@z

@x
- The **Learning center** in Docker Desktop provides walkthroughs and resources
  to help you get started with Docker products and features.
@y
- The **Learning center** in Docker Desktop provides walkthroughs and resources
  to help you get started with Docker products and features.
@z

@x
  On the **MCP Toolkit** page, the **Get started** walkthrough that guides you
  through installing an MCP server, connecting a client, and testing your
  setup.
@y
  On the **MCP Toolkit** page, the **Get started** walkthrough that guides you
  through installing an MCP server, connecting a client, and testing your
  setup.
@z

@x
- Alternatively, follow the step-by-step instructions on this page to use
  Docker Desktop or the CLI to [Install an MCP server](#install-an-mcp-server),
  [add a client, and test your setup](#install-an-mcp-client-and-test-your-setup)
  with example prompts.
@y
- Alternatively, follow the step-by-step instructions on this page to use
  Docker Desktop or the CLI to [Install an MCP server](#install-an-mcp-server),
  [add a client, and test your setup](#install-an-mcp-client-and-test-your-setup)
  with example prompts.
@z

@x
## Install an MCP server
@y
## Install an MCP server
@z

@x
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@y
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@z

@x
1. In Docker Desktop, select **MCP Toolkit** and select the **Catalog** tab.
2. Search for the **GitHub Official** server from the catalog and then select the plus icon to add it.
3. In the **GitHub Official** server page, select the **Configuration** tab and select **OAuth**.
@y
1. In Docker Desktop, select **MCP Toolkit** and select the **Catalog** tab.
2. Search for the **GitHub Official** server from the catalog and then select the plus icon to add it.
3. In the **GitHub Official** server page, select the **Configuration** tab and select **OAuth**.
@z

@x
   > [!NOTE]
   >
   > The type of configuration required depends on the server you select. For the GitHub Official server, you must authenticate using OAuth.
@y
   > [!NOTE]
   >
   > The type of configuration required depends on the server you select. For the GitHub Official server, you must authenticate using OAuth.
@z

@x
   Your browser opens the GitHub authorization page. Follow the on-screen instructions to [authenticate via OAuth](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md#authenticate-via-oauth).
@y
   Your browser opens the GitHub authorization page. Follow the on-screen instructions to [authenticate via OAuth](manuals/ai/mcp-catalog-and-toolkit/toolkit.md#authenticate-via-oauth).
@z

@x
4. Return to Docker Desktop when the authentication process is complete.
5. Search for the **Playwright** server from the catalog and add it.
@y
4. Return to Docker Desktop when the authentication process is complete.
5. Search for the **Playwright** server from the catalog and add it.
@z

@x
{{< /tab >}}
{{< tab name="From the Docker CLI">}}
@y
{{< /tab >}}
{{< tab name="From the Docker CLI">}}
@z

@x
1. Add the GitHub Official MCP server. Run:
@y
1. Add the GitHub Official MCP server. Run:
@z

% snip command...

@x
2. Authenticate the server by running the following command:
@y
2. Authenticate the server by running the following command:
@z

% snip command...

@x
   > [!NOTE]
   >
   > The type of configuration required depends on the server you select. For the GitHub Official server, you must authenticate using OAuth.
@y
   > [!NOTE]
   >
   > The type of configuration required depends on the server you select. For the GitHub Official server, you must authenticate using OAuth.
@z

@x
   Your browser opens the GitHub authorization page. Follow the on-screen instructions to [authenticate via OAuth](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md#authenticate-via-oauth).
@y
   Your browser opens the GitHub authorization page. Follow the on-screen instructions to [authenticate via OAuth](manuals/ai/mcp-catalog-and-toolkit/toolkit.md#authenticate-via-oauth).
@z

@x
3. Add the **Playwright** server. Run:
@y
3. Add the **Playwright** server. Run:
@z

% snip command...

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
You’ve now successfully added an MCP server. Next, install an MCP client and test your setup with an example prompt.
@y
You’ve now successfully added an MCP server. Next, install an MCP client and test your setup with an example prompt.
@z

@x
## Install an MCP client and test your setup
@y
## Install an MCP client and test your setup
@z

@x
After you've installed MCP servers, you can add clients to the MCP Toolkit. These clients can interact with the installed MCP servers, turning the MCP Toolkit into a gateway. In the following section, let’s add the Claude Desktop client.
@y
After you've installed MCP servers, you can add clients to the MCP Toolkit. These clients can interact with the installed MCP servers, turning the MCP Toolkit into a gateway. In the following section, let’s add the Claude Desktop client.
@z

@x
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@y
{{< tabs group="release" >}}
{{< tab name="From Docker Desktop">}}
@z

@x
1. In Docker Desktop, select **MCP Toolkit** and select the **Clients** tab.
2. Find **Claude Desktop** and select **Connect**.
@y
1. In Docker Desktop, select **MCP Toolkit** and select the **Clients** tab.
2. Find **Claude Desktop** and select **Connect**.
@z

@x
   If Claude Desktop isn't installed, select **Download** to install it, then select **Connect**.
@y
   If Claude Desktop isn't installed, select **Download** to install it, then select **Connect**.
@z

@x
3. Restart Claude Desktop if it's running, and it can now access all the servers in the MCP Toolkit.
4. Open Claude Desktop and run a test by submitting the following prompt:
@y
3. Restart Claude Desktop if it's running, and it can now access all the servers in the MCP Toolkit.
4. Open Claude Desktop and run a test by submitting the following prompt:
@z

% snip text...

@x
   Claude prompts you for permissions and shares a screenshot of the header element from the Docker documentation page.
@y
   Claude prompts you for permissions and shares a screenshot of the header element from the Docker documentation page.
@z

@x
   ![Screenshot showing the header of Docker docs.](./images/claude-desktop-example.png)
@y
   ![Screenshot showing the header of Docker docs.](./images/claude-desktop-example.png)
@z

@x
{{< /tab >}}
{{< tab name="From the Docker CLI">}}
@y
{{< /tab >}}
{{< tab name="From the Docker CLI">}}
@z

@x
1. In a terminal window, run the following commands to connect the Claude Desktop client:
@y
1. In a terminal window, run the following commands to connect the Claude Desktop client:
@z

% snip command...

@x
2. Restart Claude Desktop if it's running, and it can now access all the servers in the MCP Toolkit.
3. Open Claude Desktop and run a test by submitting the following prompt using the Sonnet 4 model:
@y
2. Restart Claude Desktop if it's running, and it can now access all the servers in the MCP Toolkit.
3. Open Claude Desktop and run a test by submitting the following prompt using the Sonnet 4 model:
@z

% snip text...

@x
   Claude prompts you for permissions and shares a screenshot of the header element from the Docker documentation page.
@y
   Claude prompts you for permissions and shares a screenshot of the header element from the Docker documentation page.
@z

@x
   ![Screenshot showing the header of Docker docs.](./images/claude-desktop-example.png)
@y
   ![Screenshot showing the header of Docker docs.](./images/claude-desktop-example.png)
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [MCP Toolkit](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md)
- [MCP Catalog](/manuals/ai/mcp-catalog-and-toolkit/catalog.md)
- [MCP Gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@y
- [MCP Toolkit](manuals/ai/mcp-catalog-and-toolkit/toolkit.md)
- [MCP Catalog](manuals/ai/mcp-catalog-and-toolkit/catalog.md)
- [MCP Gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
@z
