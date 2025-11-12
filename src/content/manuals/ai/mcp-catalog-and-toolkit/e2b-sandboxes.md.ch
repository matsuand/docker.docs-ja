%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: E2B sandboxes
description: Cloud-based secure sandboxes for AI agents with built-in Docker MCP Gateway integration
keywords: E2B, cloud sandboxes, MCP Gateway, AI agents, MCP Catalog
@y
title: E2B sandboxes
description: Cloud-based secure sandboxes for AI agents with built-in Docker MCP Gateway integration
keywords: E2B, cloud sandboxes, MCP Gateway, AI agents, MCP Catalog
@z

@x
Docker has partnered with [E2B](https://e2b.dev/), a provider of secure cloud sandboxes for AI agents. Through this partnership, every E2B sandbox includes direct access to Docker's [MCP Catalog](https://hub.docker.com/mcp), a collection of 200+ tools from publishers including GitHub, Notion, and Stripe.
@y
Docker has partnered with [E2B](https://e2b.dev/), a provider of secure cloud sandboxes for AI agents. Through this partnership, every E2B sandbox includes direct access to Docker's [MCP Catalog](https://hub.docker.com/mcp), a collection of 200+ tools from publishers including GitHub, Notion, and Stripe.
@z

@x
When you create a sandbox, you specify which MCP tools it should access. E2B launches these tools and provides access through the Docker MCP Gateway.
@y
When you create a sandbox, you specify which MCP tools it should access. E2B launches these tools and provides access through the Docker MCP Gateway.
@z

@x
## Example: Using GitHub and Notion MCP server
@y
## Example: Using GitHub and Notion MCP server
@z

@x
This example demonstrates how to connect multiple MCP servers in an E2B sandbox. You'll analyze data in Notion and create GitHub issues using Claude.
@y
This example demonstrates how to connect multiple MCP servers in an E2B sandbox. You'll analyze data in Notion and create GitHub issues using Claude.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Before you begin, make sure you have the following:
@y
Before you begin, make sure you have the following:
@z

@x
- [E2B account](https://e2b.dev/docs/quickstart) with API access
- Anthropic API key for Claude
@y
- [E2B account](https://e2b.dev/docs/quickstart) with API access
- Anthropic API key for Claude
@z

@x
  > [!NOTE]
  > This example uses Claude Code which comes pre-installed in E2B sandboxes.
  > However, you can adapt the example to work with other AI assistants of your
  > choice. See [E2B's MCP documentation](https://e2b.dev/docs/mcp/quickstart)
  > for alternative connection methods.
@y
  > [!NOTE]
  > This example uses Claude Code which comes pre-installed in E2B sandboxes.
  > However, you can adapt the example to work with other AI assistants of your
  > choice. See [E2B's MCP documentation](https://e2b.dev/docs/mcp/quickstart)
  > for alternative connection methods.
@z

@x
- Node.js 18+ installed on your machine
- Notion account with:
  - A database containing sample data
  - [Integration token](https://www.notion.com/help/add-and-manage-connections-with-the-api)
- GitHub account with:
  - A repository for testing
  - Personal access token with `repo` scope
@y
- Node.js 18+ installed on your machine
- Notion account with:
  - A database containing sample data
  - [Integration token](https://www.notion.com/help/add-and-manage-connections-with-the-api)
- GitHub account with:
  - A repository for testing
  - Personal access token with `repo` scope
@z

@x
### Set up your environment
@y
### Set up your environment
@z

@x
Create a new directory and initialize a Node.js project:
@y
Create a new directory and initialize a Node.js project:
@z

% snip command...

@x
Configure your project for ES modules by updating `package.json`:
@y
Configure your project for ES modules by updating `package.json`:
@z

% snip code...

@x
Install required dependencies:
@y
Install required dependencies:
@z

% snip command...

@x
Create a `.env` file with your credentials:
@y
Create a `.env` file with your credentials:
@z

% snip command...

@x
Protect your credentials:
@y
Protect your credentials:
@z

% snip command...

@x
### Create an E2B sandbox with MCP servers
@y
### Create an E2B sandbox with MCP servers
@z

@x
{{< tabs group="" >}}
{{< tab name="Typescript">}}
@y
{{< tabs group="" >}}
{{< tab name="Typescript">}}
@z

@x
Create a file named `index.ts`:
@y
Create a file named `index.ts`:
@z

@x within code
  // Wait for MCP initialization
@y
  // Wait for MCP initialization
@z
@x
  // Connect Claude to MCP gateway
@y
  // Connect Claude to MCP gateway
@z

@x
Run the script:
@y
Run the script:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Python">}}
@y
{{< /tab >}}
{{< tab name="Python">}}
@z

@x
Create a file named `index.py`:
@y
Create a file named `index.py`:
@z

@x within code
    # Wait for MCP initialization
@y
    # Wait for MCP initialization
@z
@x
    # Connect Claude to MCP gateway
@y
    # Connect Claude to MCP gateway
@z

@x
Run the script:
@y
Run the script:
@z

@x
```console
$ python index.py
```
@y
```console
$ python index.py
```
@z

@x
{{< /tab >}}
{{</tabs >}}
@y
{{< /tab >}}
{{</tabs >}}
@z

@x
You should see:
@y
You should see:
@z

@x
```console
Creating E2B sandbox with Notion and GitHub MCP servers...
@y
```console
Creating E2B sandbox with Notion and GitHub MCP servers...
@z

@x
Sandbox created successfully!
MCP Gateway URL: https://50005-xxxxx.e2b.app/mcp
@y
Sandbox created successfully!
MCP Gateway URL: https://50005-xxxxx.e2b.app/mcp
@z

@x
Connecting Claude to MCP gateway...
Added HTTP MCP server e2b-mcp-gateway with URL: https://50005-xxxxx.e2b.app/mcp
@y
Connecting Claude to MCP gateway...
Added HTTP MCP server e2b-mcp-gateway with URL: https://50005-xxxxx.e2b.app/mcp
@z

@x
Connection successful! Cleaning up...
```
@y
Connection successful! Cleaning up...
```
@z

@x
### Test with example workflow
@y
### Test with example workflow
@z

@x
Now, test the setup by running a simple workflow that searches Notion and creates a GitHub issue.
@y
Now, test the setup by running a simple workflow that searches Notion and creates a GitHub issue.
@z

@x
{{< tabs group="" >}}
{{< tab name="Typescript">}}
@y
{{< tabs group="" >}}
{{< tab name="Typescript">}}
@z

@x
> [!IMPORTANT]
>
> Replace `owner/repo` in the prompt with your actual GitHub username and repository
> name (for example, `yourname/test-repo`).
@y
> [!IMPORTANT]
>
> Replace `owner/repo` in the prompt with your actual GitHub username and repository
> name (for example, `yourname/test-repo`).
@z

@x
Update `index.ts` with the following example:
@y
Update `index.ts` with the following example:
@z

@x within code...
  // Wait for MCP servers to initialize
@y
  // Wait for MCP servers to initialize
@z

@x
Run the script:
@y
Run the script:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Python">}}
@y
{{< /tab >}}
{{< tab name="Python">}}
@z

@x
Update `index.py` with this example:
@y
Update `index.py` with this example:
@z

@x
> [!IMPORTANT]
>
> Replace `owner/repo` in the prompt with your actual GitHub username and repository
> name (for example, `yourname/test-repo`).
@y
> [!IMPORTANT]
>
> Replace `owner/repo` in the prompt with your actual GitHub username and repository
> name (for example, `yourname/test-repo`).
@z

@x within code
    # Wait for MCP servers to initialize
@y
    # Wait for MCP servers to initialize
@z
@x
    # Escape single quotes for shell
@y
    # Escape single quotes for shell
@z

@x
Run the script:
@y
Run the script:
@z

@x
```console
$ python workflow.py
```
@y
```console
$ python workflow.py
```
@z

@x
{{< /tab >}}
{{</tabs >}}
@y
{{< /tab >}}
{{</tabs >}}
@z

@x
You should see:
@y
You should see:
@z

@x
```console
Creating sandbox...
@y
```console
Creating sandbox...
@z

@x
Running example: Search Notion and create GitHub issue...
@y
Running example: Search Notion and create GitHub issue...
@z

@x
## Task Completed Successfully
@y
## Task Completed Successfully
@z

@x
I've completed both operations using the Notion and GitHub MCP tools:
@y
I've completed both operations using the Notion and GitHub MCP tools:
@z

@x
### 1. Notion Workspace Search
@y
### 1. Notion Workspace Search
@z

@x
Found 3 databases in your Notion workspace:
- **Customer Feedback** - Database with 12 entries tracking feature requests
- **Product Roadmap** - Planning database with 8 active projects
- **Meeting Notes** - Shared workspace with 45 pages
@y
Found 3 databases in your Notion workspace:
- **Customer Feedback** - Database with 12 entries tracking feature requests
- **Product Roadmap** - Planning database with 8 active projects
- **Meeting Notes** - Shared workspace with 45 pages
@z

@x
### 2. GitHub Issue Creation
@y
### 2. GitHub Issue Creation
@z

@x
Successfully created test issue:
- **Repository**: your-org/your-repo
- **Issue Number**: #47
- **Title**: "MCP Test"
- **Description**: "Testing E2B + Docker MCP integration"
- **Status**: Open
- **URL**: https://github.com/your-org/your-repo/issues/47
@y
Successfully created test issue:
- **Repository**: your-org/your-repo
- **Issue Number**: #47
- **Title**: "MCP Test"
- **Description**: "Testing E2B + Docker MCP integration"
- **Status**: Open
- **URL**: https://github.com/your-org/your-repo/issues/47
@z

@x
Both operations completed successfully. The MCP servers are properly configured and working.
```
@y
Both operations completed successfully. The MCP servers are properly configured and working.
```
@z

@x
The sandbox connected multiple MCP servers and orchestrated a workflow across Notion and GitHub. You can extend this pattern to combine any of the 200+ MCP servers in the Docker MCP Catalog.
@y
The sandbox connected multiple MCP servers and orchestrated a workflow across Notion and GitHub. You can extend this pattern to combine any of the 200+ MCP servers in the Docker MCP Catalog.
@z

@x
## Related pages
@y
## Related pages
@z

@x
- [How to build an AI-powered code quality workflow with SonarQube and E2B](/guides/github-sonarqube-sandbox.md)
- [Docker + E2B: Building the Future of Trusted AI](https://www.docker.com/blog/docker-e2b-building-the-future-of-trusted-ai/)
- [Docker Sandboxes](/manuals/ai/sandboxes/_index.md)
- [Docker MCP Toolkit and Catalog](/manuals/ai/mcp-catalog-and-toolkit/_index.md)
- [Docker MCP Gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
- [E2B MCP documentation](https://e2b.dev/docs/mcp)
@y
- [How to build an AI-powered code quality workflow with SonarQube and E2B](guides/github-sonarqube-sandbox.md)
- [Docker + E2B: Building the Future of Trusted AI](https://www.docker.com/blog/docker-e2b-building-the-future-of-trusted-ai/)
- [Docker Sandboxes](manuals/ai/sandboxes/_index.md)
- [Docker MCP Toolkit and Catalog](manuals/ai/mcp-catalog-and-toolkit/_index.md)
- [Docker MCP Gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
- [E2B MCP documentation](https://e2b.dev/docs/mcp)
@z
