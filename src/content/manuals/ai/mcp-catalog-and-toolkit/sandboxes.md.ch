%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Sandboxes
description: "Learn how sandboxes provide secure, isolated execution environments for AI agents in the MCP ecosystem, enabling safe code execution and protecting production systems."
keywords: Sandboxes, E2B, MCP Gateway, isolated environment, AI agent security
@y
title: Sandboxes
description: "Learn how sandboxes provide secure, isolated execution environments for AI agents in the MCP ecosystem, enabling safe code execution and protecting production systems."
keywords: Sandboxes, E2B, MCP Gateway, isolated environment, AI agent security
@z

@x
Sandboxes are isolated execution environments that provide secure, controlled spaces for running code and applications without affecting the host system. They create strict boundaries around executing processes, preventing access to unauthorized resources while providing consistent, reproducible environments. Think of it as a virtual "playground" with clearly defined boundaries, where code can execute freely within those boundaries but cannot escape to impact other systems or access sensitive data.
@y
Sandboxes are isolated execution environments that provide secure, controlled spaces for running code and applications without affecting the host system. They create strict boundaries around executing processes, preventing access to unauthorized resources while providing consistent, reproducible environments. Think of it as a virtual "playground" with clearly defined boundaries, where code can execute freely within those boundaries but cannot escape to impact other systems or access sensitive data.
@z

@x
In the Model Context Protocol ecosystem, sandboxes address several critical challenges that arise when AI agents need to execute code or interact with external systems. They enable safe code execution for AI-generated scripts, secure tool validation for MCP servers, and multi-tenant isolation when multiple agents share infrastructure. This ensures that sensitive credentials and data remain protected within appropriate security boundaries while maintaining compliance and audit requirements.
@y
In the Model Context Protocol ecosystem, sandboxes address several critical challenges that arise when AI agents need to execute code or interact with external systems. They enable safe code execution for AI-generated scripts, secure tool validation for MCP servers, and multi-tenant isolation when multiple agents share infrastructure. This ensures that sensitive credentials and data remain protected within appropriate security boundaries while maintaining compliance and audit requirements.
@z

@x
## Key features
@y
## Key features
@z

@x
- Isolation and Security: Complete separation between executing code and the host environment, with strict controls over file access, network connections, and system calls.
- Resource Management: Fine-grained control over CPU, memory, disk space, and network usage to prevent resource exhaustion.
- Reproducible Environments: Consistent, predictable execution environments. Code that runs successfully in one sandbox instance will behave identically in another.
- Ephemeral Environments: Temporary, disposable environments that can be destroyed after task completion, leaving no persistent artifacts.
@y
- Isolation and Security: Complete separation between executing code and the host environment, with strict controls over file access, network connections, and system calls.
- Resource Management: Fine-grained control over CPU, memory, disk space, and network usage to prevent resource exhaustion.
- Reproducible Environments: Consistent, predictable execution environments. Code that runs successfully in one sandbox instance will behave identically in another.
- Ephemeral Environments: Temporary, disposable environments that can be destroyed after task completion, leaving no persistent artifacts.
@z

@x
## E2B sandboxes
@y
## E2B sandboxes
@z

@x
Docker has partnered with [E2B](https://e2b.dev/), a provider of secure cloud sandboxes for AI agents. Through this partnership, every E2B sandbox now includes direct access to Docker’s [MCP Catalog](https://hub.docker.com/mcp), a collection of 200+ tools, including ones from known publishers such as GitHub, Notion, and Stripe, all enabled through the Docker MCP Gateway.
@y
Docker has partnered with [E2B](https://e2b.dev/), a provider of secure cloud sandboxes for AI agents. Through this partnership, every E2B sandbox now includes direct access to Docker’s [MCP Catalog](https://hub.docker.com/mcp), a collection of 200+ tools, including ones from known publishers such as GitHub, Notion, and Stripe, all enabled through the Docker MCP Gateway.
@z

@x
When creating a new sandbox, E2B users can specify which MCP tools the sandbox should access. E2B then launches these MCP tools and provides access through the Docker MCP Gateway.
@y
When creating a new sandbox, E2B users can specify which MCP tools the sandbox should access. E2B then launches these MCP tools and provides access through the Docker MCP Gateway.
@z

@x
The following example shows how to set up an E2B sandbox with GitHub and Notion MCP servers.
@y
The following example shows how to set up an E2B sandbox with GitHub and Notion MCP servers.
@z

@x
## Example: Using GitHub and Notion MCP server
@y
## Example: Using GitHub and Notion MCP server
@z

@x
The following example demonstrates how to analyze data in Notion and create GitHub issues. By the end, you'll understand how to connect multiple MCP servers in an E2B sandbox and orchestrate cross-platform workflows.
@y
The following example demonstrates how to analyze data in Notion and create GitHub issues. By the end, you'll understand how to connect multiple MCP servers in an E2B sandbox and orchestrate cross-platform workflows.
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
    >[!Note]
    >
    > This example uses Claude CLI which comes pre-installed in E2B sandboxes. However,
    > you can adapt the example to work with other AI assistants of your choice. See
    > [E2B's MCP documentation](https://e2b.dev/docs/mcp/quickstart) for alternative
    > connection methods.
@y
    >[!Note]
    >
    > This example uses Claude CLI which comes pre-installed in E2B sandboxes. However,
    > you can adapt the example to work with other AI assistants of your choice. See
    > [E2B's MCP documentation](https://e2b.dev/docs/mcp/quickstart) for alternative
    > connection methods.
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

% snip code...

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
  // Connect Claude CLI to MCP gateway
@y
  // Connect Claude CLI to MCP gateway
@z

@x
Run the script:
@y
Run the script:
@z

% snip code...

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
    # Connect Claude CLI to MCP gateway
@y
    # Connect Claude CLI to MCP gateway
@z

@x
Run the script:
@y
Run the script:
@z

% snip code...

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
```bash
Creating E2B sandbox with Notion and GitHub MCP servers...
@y
```bash
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
Connecting Claude CLI to MCP gateway...
Added HTTP MCP server e2b-mcp-gateway with URL: https://50005-xxxxx.e2b.app/mcp
@y
Connecting Claude CLI to MCP gateway...
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
>[!IMPORTANT]
>
> Replace `owner/repo` in the prompt with your actual GitHub username and repository
> name (for example, `yourname/test-repo`).
@y
>[!IMPORTANT]
>
> Replace `owner/repo` in the prompt with your actual GitHub username and repository
> name (for example, `yourname/test-repo`).
@z

@x
Update `index.ts` with the following example:
@y
Update `index.ts` with the following example:
@z

@x
```typescript
import 'dotenv/config';
import { Sandbox } from 'e2b';
@y
```typescript
import 'dotenv/config';
import { Sandbox } from 'e2b';
@z

@x
async function exampleWorkflow(): Promise<void> {
  console.log("Creating sandbox...\n");
@y
async function exampleWorkflow(): Promise<void> {
  console.log("Creating sandbox...\n");
@z

@x
  const sbx: Sandbox = await Sandbox.betaCreate({
    envs: {
      ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY as string,
    },
    mcp: {
      notion: {
        internalIntegrationToken: process.env.NOTION_INTEGRATION_TOKEN as string,
      },
      githubOfficial: {
        githubPersonalAccessToken: process.env.GITHUB_TOKEN as string,
      },
    },
  });
@y
  const sbx: Sandbox = await Sandbox.betaCreate({
    envs: {
      ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY as string,
    },
    mcp: {
      notion: {
        internalIntegrationToken: process.env.NOTION_INTEGRATION_TOKEN as string,
      },
      githubOfficial: {
        githubPersonalAccessToken: process.env.GITHUB_TOKEN as string,
      },
    },
  });
@z

@x
  const mcpUrl: string = sbx.betaGetMcpUrl();
  const mcpToken: string = await sbx.betaGetMcpToken();
@y
  const mcpUrl: string = sbx.betaGetMcpUrl();
  const mcpToken: string = await sbx.betaGetMcpToken();
@z

@x
  console.log("Sandbox created successfully\n");
@y
  console.log("Sandbox created successfully\n");
@z

@x
  // Wait for MCP servers to initialize
  await new Promise<void>(resolve => setTimeout(resolve, 3000));
@y
  // Wait for MCP servers to initialize
  await new Promise<void>(resolve => setTimeout(resolve, 3000));
@z

@x
  console.log("Connecting Claude to MCP gateway...\n");
  await sbx.commands.run(
    `claude mcp add --transport http e2b-mcp-gateway ${mcpUrl} --header "Authorization: Bearer ${mcpToken}"`,
    {
      timeoutMs: 0,
      onStdout: console.log,
      onStderr: console.log
    }
  );
@y
  console.log("Connecting Claude to MCP gateway...\n");
  await sbx.commands.run(
    `claude mcp add --transport http e2b-mcp-gateway ${mcpUrl} --header "Authorization: Bearer ${mcpToken}"`,
    {
      timeoutMs: 0,
      onStdout: console.log,
      onStderr: console.log
    }
  );
@z

@x
  console.log("\nRunning example: Search Notion and create GitHub issue...\n");
@y
  console.log("\nRunning example: Search Notion and create GitHub issue...\n");
@z

@x
  const prompt: string = `Using Notion and GitHub MCP tools:
1. Search my Notion workspace for databases
2. Create a test issue in owner/repo titled "MCP Toolkit Test" with description "Testing E2B + Docker MCP integration"
3. Confirm both operations completed successfully`;
@y
  const prompt: string = `Using Notion and GitHub MCP tools:
1. Search my Notion workspace for databases
2. Create a test issue in owner/repo titled "MCP Toolkit Test" with description "Testing E2B + Docker MCP integration"
3. Confirm both operations completed successfully`;
@z

@x
  await sbx.commands.run(
    `echo '${prompt.replace(/'/g, "'\\''")}' | claude -p --dangerously-skip-permissions`,
    {
      timeoutMs: 0,
      onStdout: console.log,
      onStderr: console.log
    }
  );
@y
  await sbx.commands.run(
    `echo '${prompt.replace(/'/g, "'\\''")}' | claude -p --dangerously-skip-permissions`,
    {
      timeoutMs: 0,
      onStdout: console.log,
      onStderr: console.log
    }
  );
@z

@x
  await sbx.kill();
}
@y
  await sbx.kill();
}
@z

@x
exampleWorkflow().catch(console.error);
```
@y
exampleWorkflow().catch(console.error);
```
@z

@x
Run the script:
@y
Run the script:
@z

@x
```typescript
npx tsx index.ts
```
@y
```typescript
npx tsx index.ts
```
@z

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
>[!IMPORTANT]
>
> Replace `owner/repo` in the prompt with your actual GitHub username and repository
> name (for example, `yourname/test-repo`).
@y
>[!IMPORTANT]
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
```bash
python workflow.py
```
@y
```bash
python workflow.py
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
```bash
Creating sandbox...
@y
```bash
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
You've successfully created an E2B sandbox with multiple MCP servers and used Claude to orchestrate a workflow across Notion and GitHub.
@y
You've successfully created an E2B sandbox with multiple MCP servers and used Claude to orchestrate a workflow across Notion and GitHub.
@z

@x
You can extend this example to combine any of the 200+ MCP servers in the Docker MCP Catalog to build sophisticated automation workflows for your specific needs.
@y
You can extend this example to combine any of the 200+ MCP servers in the Docker MCP Catalog to build sophisticated automation workflows for your specific needs.
@z

@x
## Related pages
@y
## Related pages
@z

@x
- [How to build an AI-powered code quality workflow with SonarQube and E2B](/guides/github-sonarqube-sandbox.md)
- [Docker + E2B: Building the Future of Trusted AI](https://www.docker.com/blog/docker-e2b-building-the-future-of-trusted-ai/)
- [Docker MCP Toolkit and Catalog](/manuals/ai/mcp-catalog-and-toolkit/_index.md)
- [Docker MCP Gateway](/manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
- [E2B MCP documentation](https://e2b.dev/docs/mcp)
@y
- [How to build an AI-powered code quality workflow with SonarQube and E2B](guides/github-sonarqube-sandbox.md)
- [Docker + E2B: Building the Future of Trusted AI](https://www.docker.com/blog/docker-e2b-building-the-future-of-trusted-ai/)
- [Docker MCP Toolkit and Catalog](manuals/ai/mcp-catalog-and-toolkit/_index.md)
- [Docker MCP Gateway](manuals/ai/mcp-catalog-and-toolkit/mcp-gateway.md)
- [E2B MCP documentation](https://e2b.dev/docs/mcp)
@z
