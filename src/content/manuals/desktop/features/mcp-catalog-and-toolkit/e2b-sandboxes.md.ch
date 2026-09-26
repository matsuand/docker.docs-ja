%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応 (一部)

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
[E2B](https://e2b.dev/) provides secure cloud sandboxes for AI agents with direct access to Docker's [MCP Catalog](https://hub.docker.com/mcp), a collection of 200+ tools from publishers including GitHub, Notion, and Stripe.
@y
[E2B](https://e2b.dev/) provides secure cloud sandboxes for AI agents with direct access to Docker's [MCP Catalog](https://hub.docker.com/mcp), a collection of 200+ tools from publishers including GitHub, Notion, and Stripe.
@z

@x
When you create an E2B sandbox, you specify which MCP tools it should access. E2B launches these tools and provides access through the Docker MCP Gateway.
@y
When you create an E2B sandbox, you specify which MCP tools it should access. E2B launches these tools and provides access through the Docker MCP Gateway.
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
  > This example uses Claude Code, which is pre-installed in E2B sandboxes.
  > However, you can adapt the example to work with other AI assistants of your
  > choice. See [E2B's MCP documentation](https://e2b.dev/docs/mcp/quickstart)
  > for alternative connection methods.
@y
  > [!NOTE]
  > This example uses Claude Code, which is pre-installed in E2B sandboxes.
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

% snip command...

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

% snip output...

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

@x within code
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

@x
```python
import os
import asyncio
import shlex
from dotenv import load_dotenv
from e2b import Sandbox
@y
```python
import os
import asyncio
import shlex
from dotenv import load_dotenv
from e2b import Sandbox
@z

@x
load_dotenv()
@y
load_dotenv()
@z

@x
async def example_workflow():
    print("Creating sandbox...\n")
@y
async def example_workflow():
    print("Creating sandbox...\n")
@z

@x
    sbx = await Sandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
        },
        mcp={
            "notion": {
                "internalIntegrationToken": os.getenv("NOTION_INTEGRATION_TOKEN"),
            },
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
        },
    )
@y
    sbx = await Sandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
        },
        mcp={
            "notion": {
                "internalIntegrationToken": os.getenv("NOTION_INTEGRATION_TOKEN"),
            },
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
        },
    )
@z

@x
    mcp_url = sbx.beta_get_mcp_url()
    mcp_token = await sbx.beta_get_mcp_token()
@y
    mcp_url = sbx.beta_get_mcp_url()
    mcp_token = await sbx.beta_get_mcp_token()
@z

@x
    print("Sandbox created successfully\n")
@y
    print("Sandbox created successfully\n")
@z

@x
    # Wait for MCP servers to initialize
    await asyncio.sleep(3)
@y
    # Wait for MCP servers to initialize
    await asyncio.sleep(3)
@z

@x
    print("Connecting Claude to MCP gateway...\n")
@y
    print("Connecting Claude to MCP gateway...\n")
@z

@x
    def on_stdout(output):
        print(output, end='')
@y
    def on_stdout(output):
        print(output, end='')
@z

@x
    def on_stderr(output):
        print(output, end='')
@y
    def on_stderr(output):
        print(output, end='')
@z

@x
    await sbx.commands.run(
        f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
        timeout_ms=0,
        on_stdout=on_stdout,
        on_stderr=on_stderr
    )
@y
    await sbx.commands.run(
        f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
        timeout_ms=0,
        on_stdout=on_stdout,
        on_stderr=on_stderr
    )
@z

@x
    print("\nRunning example: Search Notion and create GitHub issue...\n")
@y
    print("\nRunning example: Search Notion and create GitHub issue...\n")
@z

@x
    prompt = """Using Notion and GitHub MCP tools:
1. Search my Notion workspace for databases
2. Create a test issue in owner/repo titled "MCP Toolkit Test" with description "Testing E2B + Docker MCP integration"
3. Confirm both operations completed successfully"""
@y
    prompt = """Using Notion and GitHub MCP tools:
1. Search my Notion workspace for databases
2. Create a test issue in owner/repo titled "MCP Toolkit Test" with description "Testing E2B + Docker MCP integration"
3. Confirm both operations completed successfully"""
@z

@x
    # Escape single quotes for shell
    escaped_prompt = prompt.replace("'", "'\\''")
@y
    # Escape single quotes for shell
    escaped_prompt = prompt.replace("'", "'\\''")
@z

@x
    await sbx.commands.run(
        f"echo '{escaped_prompt}' | claude -p --dangerously-skip-permissions",
        timeout_ms=0,
        on_stdout=on_stdout,
        on_stderr=on_stderr
    )
@y
    await sbx.commands.run(
        f"echo '{escaped_prompt}' | claude -p --dangerously-skip-permissions",
        timeout_ms=0,
        on_stdout=on_stdout,
        on_stderr=on_stderr
    )
@z

@x
    await sbx.kill()
@y
    await sbx.kill()
@z

@x
if __name__ == "__main__":
    try:
        asyncio.run(example_workflow())
    except Exception as e:
        print(f"Error: {e}")
```
@y
if __name__ == "__main__":
    try:
        asyncio.run(example_workflow())
    except Exception as e:
        print(f"Error: {e}")
```
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
- [Docker MCP Toolkit and Catalog](/manuals/desktop/features/mcp-catalog-and-toolkit/_index.md)
- [Docker MCP Gateway](/manuals/desktop/features/mcp-catalog-and-toolkit/mcp-gateway.md)
- [E2B MCP documentation](https://e2b.dev/docs/mcp)
@y
- [How to build an AI-powered code quality workflow with SonarQube and E2B](guides/github-sonarqube-sandbox.md)
- [Docker + E2B: Building the Future of Trusted AI](https://www.docker.com/blog/docker-e2b-building-the-future-of-trusted-ai/)
- [Docker Sandboxes](manuals/ai/sandboxes/_index.md)
- [Docker MCP Toolkit and Catalog](manuals/desktop/features/mcp-catalog-and-toolkit/_index.md)
- [Docker MCP Gateway](manuals/desktop/features/mcp-catalog-and-toolkit/mcp-gateway.md)
- [E2B MCP documentation](https://e2b.dev/docs/mcp)
@z
