%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: MCP Toolkit
description:
keywords: 
@y
title: MCP Toolkit
description:
keywords: 
@z

@x
The Docker MCP Toolkit is a Docker Desktop extension local that enables seamless setup, management, and execution of containerized MCP servers and their connections to AI agents. It removes the friction from tool usage by offering secure defaults, one-click setup, and support for a growing ecosystem of LLM-based clients. It is the fastest path from MCP tool discovery to local execution.
@y
The Docker MCP Toolkit is a Docker Desktop extension local that enables seamless setup, management, and execution of containerized MCP servers and their connections to AI agents. It removes the friction from tool usage by offering secure defaults, one-click setup, and support for a growing ecosystem of LLM-based clients. It is the fastest path from MCP tool discovery to local execution.
@z

@x
## Key features
@y
## Key features
@z

@x
- Cross-LLM compatibility: Works out of the box with Claude Desktop, Cursor, Continue.dev, and [Gordon](/manuals/ai/gordon/_index.md).
- Integrated tool discovery: Browse and launch MCP servers that are available in the Docker MCP Catalog, directly from Docker Desktop.
- No manual setup: Skip dependency management, runtime setup, and manual server configuration.
@y
- Cross-LLM compatibility: Works out of the box with Claude Desktop, Cursor, Continue.dev, and [Gordon](manuals/ai/gordon/_index.md).
- Integrated tool discovery: Browse and launch MCP servers that are available in the Docker MCP Catalog, directly from Docker Desktop.
- No manual setup: Skip dependency management, runtime setup, and manual server configuration.
@z

@x
## How it works
@y
## How it works
@z

@x
The **MCP Servers** tab lists all available servers from the Docker MCP Catalog. Each entry includes:
@y
The **MCP Servers** tab lists all available servers from the Docker MCP Catalog. Each entry includes:
@z

@x
- Tool name and description
- Partner/publisher
- Number of callable tools and what they are
@y
- Tool name and description
- Partner/publisher
- Number of callable tools and what they are
@z

@x
To enable an MCP server, simply use the toggle switch to toggle it on.
@y
To enable an MCP server, simply use the toggle switch to toggle it on.
@z

@x
> [!NOTE]
>
> Some MCP servers requires secrets or tokens to be configured before it can be enabled. Instructions on how to do this can be found on each MCP servers' repository.
@y
> [!NOTE]
>
> Some MCP servers requires secrets or tokens to be configured before it can be enabled. Instructions on how to do this can be found on each MCP servers' repository.
@z

@x
The **MCP Clients** tab lets you connect your enabled MCP servers to supported agents. Connection is as simple as selecting **Connect**, so you can switch between LLM providers without altering your MCP server integrations or security configurations.
@y
The **MCP Clients** tab lets you connect your enabled MCP servers to supported agents. Connection is as simple as selecting **Connect**, so you can switch between LLM providers without altering your MCP server integrations or security configurations.
@z

@x
## Installation
@y
## Installation
@z

@x
To install the Docker MCP Toolkit extension:
@y
To install the Docker MCP Toolkit extension:
@z

@x
1. In the Docker Desktop Dashboard, select the **Extensions** view, and then select **Manage**.
2. Select the **Browse** tab and search for **Docker MCP Toolkit**.
3. On the **Docker MCP Toolkit** result, select install.
@y
1. In the Docker Desktop Dashboard, select the **Extensions** view, and then select **Manage**.
2. Select the **Browse** tab and search for **Docker MCP Toolkit**.
3. On the **Docker MCP Toolkit** result, select install.
@z

@x
The extension then appears under the **My extensions** tab.
@y
The extension then appears under the **My extensions** tab.
@z

@x
### Example
@y
### Example
@z

@x
The following example assumes you have already installed and set up Claude Desktop.
@y
The following example assumes you have already installed and set up Claude Desktop.
@z

@x
1. In the Docker MCP Toolkit extension, search for the Puppeteer MCP server in the **MCP Servers** tab, and toggle it on to enable.
2. From the **MCP Clients** tab, select the **Connect** button for Claude Desktop. 
3. Within Claude Desktop, submit the following prompt using the Sonnet 3.5 model:
@y
1. In the Docker MCP Toolkit extension, search for the Puppeteer MCP server in the **MCP Servers** tab, and toggle it on to enable.
2. From the **MCP Clients** tab, select the **Connect** button for Claude Desktop. 
3. Within Claude Desktop, submit the following prompt using the Sonnet 3.5 model:
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
Once you've given your consent to use the new tools, Claude spins up the Puppeteer MCP server inside a container, navigates to the target URL, captures and modify the page, and returns the screenshot.
@y
Once you've given your consent to use the new tools, Claude spins up the Puppeteer MCP server inside a container, navigates to the target URL, captures and modify the page, and returns the screenshot.
@z
