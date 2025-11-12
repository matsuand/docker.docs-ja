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
  test_prompt: Use the GitHub MCP server to show me my open pull requests
@y
  test_prompt: Use the GitHub MCP server to show me my open pull requests
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
The **Learning center** in Docker Desktop provides walkthroughs and resources
to help you get started with Docker products and features. On the **MCP
Toolkit** page, the **Get started** walkthrough that guides you through
installing an MCP server, connecting a client, and testing your setup.
@y
The **Learning center** in Docker Desktop provides walkthroughs and resources
to help you get started with Docker products and features. On the **MCP
Toolkit** page, the **Get started** walkthrough that guides you through
installing an MCP server, connecting a client, and testing your setup.
@z

@x
Alternatively, follow the step-by-step instructions on this page to:
@y
Alternatively, follow the step-by-step instructions on this page to:
@z

@x
- [Install MCP servers](#install-mcp-servers)
- [Connect clients](#connect-clients)
- [Verify connections](#verify-connections)
@y
- [Install MCP servers](#install-mcp-servers)
- [Connect clients](#connect-clients)
- [Verify connections](#verify-connections)
@z

@x
## Install MCP servers
@y
## Install MCP servers
@z

@x
{{< tabs >}}
{{< tab name="Docker Desktop">}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop">}}
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
{{< tab name="CLI">}}
@y
{{< /tab >}}
{{< tab name="CLI">}}
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
You’ve now successfully added an MCP server. Next, connect an MCP client to use
the MCP Toolkit in an AI application.
@y
You’ve now successfully added an MCP server. Next, connect an MCP client to use
the MCP Toolkit in an AI application.
@z

@x
## Connect clients
@y
## Connect clients
@z

@x
To connect a client to MCP Toolkit:
@y
To connect a client to MCP Toolkit:
@z

@x
1. In Docker Desktop, select **MCP Toolkit** and select the **Clients** tab.
2. Find your application in the list.
3. Select **Connect** to configure the client.
@y
1. In Docker Desktop, select **MCP Toolkit** and select the **Clients** tab.
2. Find your application in the list.
3. Select **Connect** to configure the client.
@z

@x
If your client isn't listed, you can connect the MCP Toolkit manually over
`stdio` by configuring your client to run the following command:
@y
If your client isn't listed, you can connect the MCP Toolkit manually over
`stdio` by configuring your client to run the following command:
@z

% snip command...

@x
For example, if your client uses a JSON file to configure MCP servers, you may
add an entry like:
@y
For example, if your client uses a JSON file to configure MCP servers, you may
add an entry like:
@z

% snip code...

@x
Consult the documentation of the application you're using for instructions on
how to set up MCP servers manually.
@y
Consult the documentation of the application you're using for instructions on
how to set up MCP servers manually.
@z

@x
## Verify connections
@y
## Verify connections
@z

@x
Refer to the relevant section for instructions on how to verify that your setup
is working:
@y
Refer to the relevant section for instructions on how to verify that your setup
is working:
@z

@x
- [Claude Code](#claude-code)
- [Claude Desktop](#claude-desktop)
- [OpenAI Codex](#codex)
- [Continue](#continue)
- [Cursor](#cursor)
- [Gemini](#gemini)
- [Goose](#goose)
- [Gordon](#gordon)
- [LM Studio](#lm-studio)
- [OpenCode](#opencode)
- [Sema4.ai](#sema4)
- [Visual Studio Code](#vscode)
- [Zed](#zed)
@y
- [Claude Code](#claude-code)
- [Claude Desktop](#claude-desktop)
- [OpenAI Codex](#codex)
- [Continue](#continue)
- [Cursor](#cursor)
- [Gemini](#gemini)
- [Goose](#goose)
- [Gordon](#gordon)
- [LM Studio](#lm-studio)
- [OpenCode](#opencode)
- [Sema4.ai](#sema4)
- [Visual Studio Code](#vscode)
- [Zed](#zed)
@z

@x
### Claude Code
@y
### Claude Code
@z

@x
If you configured the MCP Toolkit for a specific project, navigate to the
relevant project directory. Then run `claude mcp list`. The output should show
`MCP_DOCKER` with a "connected" status:
@y
If you configured the MCP Toolkit for a specific project, navigate to the
relevant project directory. Then run `claude mcp list`. The output should show
`MCP_DOCKER` with a "connected" status:
@z

% snip command...

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip command...

@x
### Claude Desktop
@y
### Claude Desktop
@z

@x
Restart Claude Desktop and check the **Search and tools** menu in the chat
input. You should see the `MCP_DOCKER` server listed and enabled:
@y
Restart Claude Desktop and check the **Search and tools** menu in the chat
input. You should see the `MCP_DOCKER` server listed and enabled:
@z

@x
![Claude Desktop](images/claude-desktop.avif)
@y
![Claude Desktop](images/claude-desktop.avif)
@z

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip text...

@x
### Codex
@y
### Codex
@z

@x
Run `codex mcp list` to view active MCP servers and their statuses. The
`MCP_DOCKER` server should appear in the list with an "enabled" status:
@y
Run `codex mcp list` to view active MCP servers and their statuses. The
`MCP_DOCKER` server should appear in the list with an "enabled" status:
@z

% snip command...

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip command...

@x
### Continue
@y
### Continue
@z

@x
Launch the Continue terminal UI by running `cn`. Use the `/mcp` command to view
active MCP servers and their statuses. The `MCP_DOCKER` server should appear in
the list with a "connected" status:
@y
Launch the Continue terminal UI by running `cn`. Use the `/mcp` command to view
active MCP servers and their statuses. The `MCP_DOCKER` server should appear in
the list with a "connected" status:
@z

% snip text...

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip command...

@x
### Cursor
@y
### Cursor
@z

@x
Open Cursor. If you configured the MCP Toolkit for a specific project, open the
relevant project directory. Then navigate to **Cursor Settings > Tools & MCP**.
You should see `MCP_DOCKER` under **Installed MCP Servers**:
@y
Open Cursor. If you configured the MCP Toolkit for a specific project, open the
relevant project directory. Then navigate to **Cursor Settings > Tools & MCP**.
You should see `MCP_DOCKER` under **Installed MCP Servers**:
@z

@x
![Cursor](images/cursor.avif)
@y
![Cursor](images/cursor.avif)
@z

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip text...

@x
### Gemini
@y
### Gemini
@z

@x
Run `gemini mcp list` to view active MCP servers and their statuses. The
`MCP_DOCKER` should appear in the list with a "connected" status.
@y
Run `gemini mcp list` to view active MCP servers and their statuses. The
`MCP_DOCKER` should appear in the list with a "connected" status.
@z

% snip command...

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip command...

@x
### Goose
@y
### Goose
@z

@x
{{< tabs >}}
{{< tab name="Desktop app" >}}
@y
{{< tabs >}}
{{< tab name="Desktop app" >}}
@z

@x
Open the Goose desktop application and select **Extensions** in the sidebar.
Under **Enabled Extensions**, you should see an extension named `Mcpdocker`:
@y
Open the Goose desktop application and select **Extensions** in the sidebar.
Under **Enabled Extensions**, you should see an extension named `Mcpdocker`:
@z

@x
![Goose desktop app](images/goose.avif)
@y
![Goose desktop app](images/goose.avif)
@z

@x
{{< /tab >}}
{{< tab name="CLI" >}}
@y
{{< /tab >}}
{{< tab name="CLI" >}}
@z

@x
Run `goose info -v` and look for an entry named `mcpdocker` under extensions.
The status should show `enabled: true`:
@y
Run `goose info -v` and look for an entry named `mcpdocker` under extensions.
The status should show `enabled: true`:
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
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip text...

@x
### Gordon
@y
### Gordon
@z

@x
Open the **Ask Gordon** view in Docker Desktop and select the toolbox icon in
the chat input area. The **MCP Toolkit** tab shows whether MCP Toolkit is
enabled and displays all the provided tools:
@y
Open the **Ask Gordon** view in Docker Desktop and select the toolbox icon in
the chat input area. The **MCP Toolkit** tab shows whether MCP Toolkit is
enabled and displays all the provided tools:
@z

@x
![MCP Toolkit in the Ask Gordon UI](images/ask-gordon.avif)
@y
![MCP Toolkit in the Ask Gordon UI](images/ask-gordon.avif)
@z

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers, either directly in Docker Desktop or using the CLI:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers, either directly in Docker Desktop or using the CLI:
@z

% snip command...

@x
### LM Studio
@y
### LM Studio
@z

@x
Restart LM Studio and start a new chat. Open the integrations menu and look for
an entry named `mcp/mcp-docker`. Use the toggle to enable the server:
@y
Restart LM Studio and start a new chat. Open the integrations menu and look for
an entry named `mcp/mcp-docker`. Use the toggle to enable the server:
@z

@x
![LM Studio](images/lm-studio.avif)
@y
![LM Studio](images/lm-studio.avif)
@z

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip text...

@x
### OpenCode
@y
### OpenCode
@z

@x
The OpenCode configuration file (at `~/.config/opencode/opencode.json` by
default) contains the setup for MCP Toolkit:
@y
The OpenCode configuration file (at `~/.config/opencode/opencode.json` by
default) contains the setup for MCP Toolkit:
@z

% snip code...

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip command...

@x
### Sema4.ai Studio {#sema4}
@y
### Sema4.ai Studio {#sema4}
@z

@x
In Sema4.ai Studio, select **Actions** in the sidebar, then select the **MCP
Servers** tab. You should see Docker MCP Toolkit in the list:
@y
In Sema4.ai Studio, select **Actions** in the sidebar, then select the **MCP
Servers** tab. You should see Docker MCP Toolkit in the list:
@z

@x
![Docker MCP Toolkit in Sema4.ai Studio](./images/sema4-mcp-list.avif)
@y
![Docker MCP Toolkit in Sema4.ai Studio](./images/sema4-mcp-list.avif)
@z

@x
To use MCP Toolkit with Sema4.ai, add it as an agent action. Find the agent you
want to connect to the MCP Toolkit and open the agent editor. Select **Add
Action**, enable Docker MCP Toolkit in the list, then save your agent:
@y
To use MCP Toolkit with Sema4.ai, add it as an agent action. Find the agent you
want to connect to the MCP Toolkit and open the agent editor. Select **Add
Action**, enable Docker MCP Toolkit in the list, then save your agent:
@z

@x
![Editing an agent in Sema4.ai Studio](images/sema4-edit-agent.avif)
@y
![Editing an agent in Sema4.ai Studio](images/sema4-edit-agent.avif)
@z

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip text...

@x
### Visual Studio Code {#vscode}
@y
### Visual Studio Code {#vscode}
@z

@x
Open Visual Studio Code. If you configured the MCP Toolkit for a specific
project, open the relevant project directory. Then open the **Extensions**
pane. You should see the `MCP_DOCKER` server listed under installed MCP
servers.
@y
Open Visual Studio Code. If you configured the MCP Toolkit for a specific
project, open the relevant project directory. Then open the **Extensions**
pane. You should see the `MCP_DOCKER` server listed under installed MCP
servers.
@z

@x
![MCP_DOCKER installed in Visual Studio Code](images/vscode-extensions.avif)
@y
![MCP_DOCKER installed in Visual Studio Code](images/vscode-extensions.avif)
@z

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip text...

@x
### Zed
@y
### Zed
@z

@x
Launch Zed and open agent settings:
@y
Launch Zed and open agent settings:
@z

@x
![Opening Zed agent settings from command palette](images/zed-cmd-palette.avif)
@y
![Opening Zed agent settings from command palette](images/zed-cmd-palette.avif)
@z

@x
Ensure that `MCP_DOCKER` is listed and enabled in the MCP Servers section:
@y
Ensure that `MCP_DOCKER` is listed and enabled in the MCP Servers section:
@z

@x
![MCP_DOCKER in Zed's agent settings](images/zed-agent-settings.avif)
@y
![MCP_DOCKER in Zed's agent settings](images/zed-agent-settings.avif)
@z

@x
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@y
Test the connection by submitting a prompt that invokes one of your installed
MCP servers:
@z

% snip text...

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
