%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応 (一部)

@x
title: How to build an AI-powered code quality workflow with SonarQube and E2B
linkTitle: AI-powered code quality
summary: Build AI-powered code quality workflows using E2B sandboxes with Docker's MCP catalog to automate GitHub and SonarQube integration.
description: Learn how to create E2B sandboxes with MCP servers, analyze code quality with SonarQube, and generate quality-gated pull requests using GitHub—all through natural language interactions with Claude.
keywords: sonarqube, e2b, sandboxes, mcp, github, code quality, ai workflow, claude
@y
title: How to build an AI-powered code quality workflow with SonarQube and E2B
linkTitle: AI-powered code quality
summary: Build AI-powered code quality workflows using E2B sandboxes with Docker's MCP catalog to automate GitHub and SonarQube integration.
description: Learn how to create E2B sandboxes with MCP servers, analyze code quality with SonarQube, and generate quality-gated pull requests using GitHub—all through natural language interactions with Claude.
keywords: sonarqube, e2b, sandboxes, mcp, github, code quality, ai workflow, claude
@z

@x
  time: 40 minutes
@y
  time: 40 minutes
@z

@x
This guide demonstrates how to build an AI-powered code quality workflow using
[E2B sandboxes](https://e2b.dev/docs) with Docker’s MCP catalog. You’ll create
a system that automatically analyzes code quality issues in GitHub repositories
using SonarQube, then generate pull requests with fixes.
@y
This guide demonstrates how to build an AI-powered code quality workflow using
[E2B sandboxes](https://e2b.dev/docs) with Docker’s MCP catalog. You’ll create
a system that automatically analyzes code quality issues in GitHub repositories
using SonarQube, then generate pull requests with fixes.
@z

@x
## What you'll build
@y
## What you'll build
@z

@x
You’ll build a Node.js script that spins up an E2B sandbox, connects GitHub and
SonarQube MCP servers, and uses Claude Code to analyze code quality and propose
improvements. The MCP servers are containerized and run as part of the E2B
sandbox.
@y
You’ll build a Node.js script that spins up an E2B sandbox, connects GitHub and
SonarQube MCP servers, and uses Claude Code to analyze code quality and propose
improvements. The MCP servers are containerized and run as part of the E2B
sandbox.
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
In this guide, you'll learn:
@y
In this guide, you'll learn:
@z

@x
- How to create E2B sandboxes with multiple MCP servers
- How to configure GitHub and SonarQube MCP servers for AI workflows
- How to use Claude Code inside sandboxes to interact with external tools
- How to build automated code review workflows that create quality-gated
pull requests
@y
- How to create E2B sandboxes with multiple MCP servers
- How to configure GitHub and SonarQube MCP servers for AI workflows
- How to use Claude Code inside sandboxes to interact with external tools
- How to build automated code review workflows that create quality-gated
pull requests
@z

@x
## Why use E2B sandboxes?
@y
## Why use E2B sandboxes?
@z

@x
Running this workflow in E2B sandboes provides several advantages over
local execution:
@y
Running this workflow in E2B sandboes provides several advantages over
local execution:
@z

@x
- Security: AI-generated code runs in isolated containers, protecting your
local environment and credentials
- Zero setup: No need to install SonarQube, GitHub CLI, or manage dependencies
locally
- Scalability: Resource-intensive operations like code scanning run in the
cloud without consuming local resources
@y
- Security: AI-generated code runs in isolated containers, protecting your
local environment and credentials
- Zero setup: No need to install SonarQube, GitHub CLI, or manage dependencies
locally
- Scalability: Resource-intensive operations like code scanning run in the
cloud without consuming local resources
@z

@x
## Learn more
@y
## Learn more
@z

@x
Read Docker's blog post: [Docker + E2B: Building the Future of Trusted AI](https://www.docker.com/blog/docker-e2b-building-the-future-of-trusted-ai/).
@y
Read Docker's blog post: [Docker + E2B: Building the Future of Trusted AI](https://www.docker.com/blog/docker-e2b-building-the-future-of-trusted-ai/).
@z

@x
## Build a code quality check workflow
@y
## Build a code quality check workflow
@z

@x
In this section, you'll build a complete code quality automation workflow
step-by-step. You'll start by creating an E2B sandbox with GitHub and
SonarQube MCP servers, then progressively add functionality until you have a
production-ready workflow that analyzes code quality and creates pull requests.
@y
In this section, you'll build a complete code quality automation workflow
step-by-step. You'll start by creating an E2B sandbox with GitHub and
SonarQube MCP servers, then progressively add functionality until you have a
production-ready workflow that analyzes code quality and creates pull requests.
@z

@x
By working through each step sequentially, you'll learn how MCP servers work,
how to interact with them through Claude, and how to chain operations together
to build powerful automation workflows.
@y
By working through each step sequentially, you'll learn how MCP servers work,
how to interact with them through Claude, and how to chain operations together
to build powerful automation workflows.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Before you begin, make sure you have:
@y
Before you begin, make sure you have:
@z

@x
- E2B account with [API access](https://e2b.dev/docs/api-key)
- [Anthropic API key](https://docs.claude.com/en/api/admin-api/apikeys/get-api-key)
@y
- E2B account with [API access](https://e2b.dev/docs/api-key)
- [Anthropic API key](https://docs.claude.com/en/api/admin-api/apikeys/get-api-key)
@z

@x
  > [!NOTE]
  >
  > This example uses Claude CLI which comes pre-installed in E2B sandboxes, but you can adapt the example to work with other AI assistants of your choice. See [E2B's MCP documentation](https://e2b.dev/docs/mcp/quickstart) for alternative connection methods.
@y
  > [!NOTE]
  >
  > This example uses Claude CLI which comes pre-installed in E2B sandboxes, but you can adapt the example to work with other AI assistants of your choice. See [E2B's MCP documentation](https://e2b.dev/docs/mcp/quickstart) for alternative connection methods.
@z

@x
- GitHub account with:
  - A repository containing code to analyze
  - [Personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) with `repo` scope
- SonarCloud account with:
  - [Organization](https://docs.sonarsource.com/sonarqube-cloud/administering-sonarcloud/resources-structure/organization) created
  - [Project configured](https://docs.sonarsource.com/sonarqube-community-build/project-administration/creating-and-importing-projects) for your repository
  - [User token](https://docs.sonarsource.com/sonarqube-server/instance-administration/security/administering-tokens) generated
- Language runtime installed:
  - TypeScript: [Node.js 18+](https://nodejs.org/en/download)
  - Python: [Python 3.8+](https://www.python.org/downloads/)
@y
- GitHub account with:
  - A repository containing code to analyze
  - [Personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) with `repo` scope
- SonarCloud account with:
  - [Organization](https://docs.sonarsource.com/sonarqube-cloud/administering-sonarcloud/resources-structure/organization) created
  - [Project configured](https://docs.sonarsource.com/sonarqube-community-build/project-administration/creating-and-importing-projects) for your repository
  - [User token](https://docs.sonarsource.com/sonarqube-server/instance-administration/security/administering-tokens) generated
- Language runtime installed:
  - TypeScript: [Node.js 18+](https://nodejs.org/en/download)
  - Python: [Python 3.8+](https://www.python.org/downloads/)
@z

@x
> [!NOTE]
>
> This guide uses Claude's `--dangerously-skip-permissions` flag to enable
> automated command execution in E2B sandboxes. This flag bypasses permission
> prompts, which is appropriate for isolated container environments like E2B
> where sandboxes are disposable and separate from your local machine.
>
> However, be aware that Claude can execute any commands within the sandbox,
> including accessing files and credentials available in that environment. Only
> use this approach with trusted code and workflows. For more information,
> see [Anthropic's guidance on container security](https://docs.anthropic.com/en/docs/claude-code/devcontainer).
@y
> [!NOTE]
>
> This guide uses Claude's `--dangerously-skip-permissions` flag to enable
> automated command execution in E2B sandboxes. This flag bypasses permission
> prompts, which is appropriate for isolated container environments like E2B
> where sandboxes are disposable and separate from your local machine.
>
> However, be aware that Claude can execute any commands within the sandbox,
> including accessing files and credentials available in that environment. Only
> use this approach with trusted code and workflows. For more information,
> see [Anthropic's guidance on container security](https://docs.anthropic.com/en/docs/claude-code/devcontainer).
@z

@x
### Set up your project
@y
### Set up your project
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
1. Create a new directory for your workflow and initialize Node.js:
@y
1. Create a new directory for your workflow and initialize Node.js:
@z

% snip command...

@x
2. Open `package.json` and configure it for ES modules:
@y
2. Open `package.json` and configure it for ES modules:
@z

% snip code...

@x
3. Install required dependencies:
@y
3. Install required dependencies:
@z

% snip command...

@x
4. Create a `.env` file in your project root:
@y
4. Create a `.env` file in your project root:
@z

% snip command...

@x
5. Add your API keys and configuration, replacing the placeholders with your actual credentials:
@y
5. Add your API keys and configuration, replacing the placeholders with your actual credentials:
@z

% snip text...

@x
6. Protect your credentials by adding `.env` to `.gitignore`:
@y
6. Protect your credentials by adding `.env` to `.gitignore`:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
1. Create a new directory for your workflow:
@y
1. Create a new directory for your workflow:
@z

% snip command...

@x
2. Create a virtual environment and activate it:
@y
2. Create a virtual environment and activate it:
@z

% snip command...

@x
3. Install required dependencies:
@y
3. Install required dependencies:
@z

% snip command...

@x
4. Create a `.env` file in your project root:
@y
4. Create a `.env` file in your project root:
@z

% snip command...

@x
5. Add your API keys and configuration, replacing the placeholders with your actual credentials:
@y
5. Add your API keys and configuration, replacing the placeholders with your actual credentials:
@z

% snip text...

@x
6. Protect your credentials by adding `.env` to `.gitignore`:
@y
6. Protect your credentials by adding `.env` to `.gitignore`:
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
### Step 1: Create your first sandbox
@y
### Step 1: Create your first sandbox
@z

@x
Let's start by creating a sandbox and verifying the MCP servers are configured correctly.
@y
Let's start by creating a sandbox and verifying the MCP servers are configured correctly.
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
Create a file named `01-test-connection.ts` in your project root:
@y
Create a file named `01-test-connection.ts` in your project root:
@z

@x within code
  // Wait for MCP initialization
@y
  // Wait for MCP initialization
@z
@x
  // Configure Claude to use the MCP gateway
@y
  // Configure Claude to use the MCP gateway
@z

@x
Run this script to verify your setup:
@y
Run this script to verify your setup:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
Create a file named `01_test_connection.py` in your project root:
@y
Create a file named `01_test_connection.py` in your project root:
@z

@x within code
    # Wait for MCP initialization
@y
    # Wait for MCP initialization
@z
@x
    # Configure Claude to use the MCP gateway
@y
    # Configure Claude to use the MCP gateway
@z

@x
Run this script to verify your setup:
@y
Run this script to verify your setup:
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
Your output should look similar to the following example:
@y
Your output should look similar to the following example:
@z

% snip output...

@x
You've just learned how to create an E2B sandbox with multiple MCP servers
configured. The `betaCreate` method initializes a cloud environment
with Claude CLI and your specified MCP servers.
@y
You've just learned how to create an E2B sandbox with multiple MCP servers
configured. The `betaCreate` method initializes a cloud environment
with Claude CLI and your specified MCP servers.
@z

@x
### Step 2: Discover available MCP tools
@y
### Step 2: Discover available MCP tools
@z

@x
MCP servers expose tools that Claude can call. The GitHub MCP server provides
repository management tools, while SonarQube provides code analysis tools.
By listing their tools, you know what operations are possible.
@y
MCP servers expose tools that Claude can call. The GitHub MCP server provides
repository management tools, while SonarQube provides code analysis tools.
By listing their tools, you know what operations are possible.
@z

@x
To try listing MCP tools:
@y
To try listing MCP tools:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
Create `02-list-tools.ts`:
@y
Create `02-list-tools.ts`:
@z

@x within code
  // Wait for MCP initialization
@y
  // Wait for MCP initialization
@z

@x
Run the script:
@y
Run the script:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
Create `02_list_tools.py`:
@y
Create `02_list_tools.py`:
@z

% snip code...

@x
Run the script:
@y
Run the script:
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
In the console, you should see a list of MCP tools:
@y
In the console, you should see a list of MCP tools:
@z

% snip command...

@x
### Step 3: Test GitHub MCP tools
@y
### Step 3: Test GitHub MCP tools
@z

@x
Let's try testing GitHub using MCP tools. Start simple by listing
repository issues.
@y
Let's try testing GitHub using MCP tools. Start simple by listing
repository issues.
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
Create `03-test-github.ts`:
@y
Create `03-test-github.ts`:
@z

% snip code...

@x
Run the script:
@y
Run the script:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
Create `03_test_github.py`:
@y
Create `03_test_github.py`:
@z

% snip code...

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
You should see Claude use the GitHub MCP tools to list your repository's issues:
@y
You should see Claude use the GitHub MCP tools to list your repository's issues:
@z

% snip output...

@x
You can now send prompts to Claude and interact with GitHub through
natural language. Claude decides what tool to call based on your prompt.
@y
You can now send prompts to Claude and interact with GitHub through
natural language. Claude decides what tool to call based on your prompt.
@z

@x
### Step 4: Test SonarQube MCP tools
@y
### Step 4: Test SonarQube MCP tools
@z

@x
Let's analyze code quality using SonarQube MCP tools.
@y
Let's analyze code quality using SonarQube MCP tools.
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
Create `04-test-sonarqube.ts`:
@y
Create `04-test-sonarqube.ts`:
@z

% snip code...

@x
Run the script:
@y
Run the script:
@z

% snip command...

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
Create `04_test_sonarqube.py`:
@y
Create `04_test_sonarqube.py`:
@z

@x
```python
import os
import asyncio
from dotenv import load_dotenv
from e2b import AsyncSandbox
@y
```python
import os
import asyncio
from dotenv import load_dotenv
from e2b import AsyncSandbox
@z

@x
load_dotenv()
@y
load_dotenv()
@z

@x
async def test_sonarqube():
    print("Creating sandbox...\n")
@y
async def test_sonarqube():
    print("Creating sandbox...\n")
@z

@x
    sbx = await AsyncSandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
            "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
            "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
        },
        mcp={
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
            "sonarqube": {
                "org": os.getenv("SONARQUBE_ORG"),
                "token": os.getenv("SONARQUBE_TOKEN"),
                "url": "https://sonarcloud.io",
            },
        },
    )
@y
    sbx = await AsyncSandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
            "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
            "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
        },
        mcp={
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
            "sonarqube": {
                "org": os.getenv("SONARQUBE_ORG"),
                "token": os.getenv("SONARQUBE_TOKEN"),
                "url": "https://sonarcloud.io",
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
    await asyncio.sleep(1)
@y
    await asyncio.sleep(1)
@z

@x
    await sbx.commands.run(
        f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@y
    await sbx.commands.run(
        f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@z

@x
    print("\nAnalyzing code quality with SonarQube...\n")
@y
    print("\nAnalyzing code quality with SonarQube...\n")
@z

@x
    prompt = """Using the SonarQube MCP tools:
    1. List all projects in my organization
    2. For the first project, show:
    - Quality gate status (pass/fail)
    - Number of bugs
    - Number of code smells
    - Number of security vulnerabilities
    3. List the top 5 most critical issues found"""
@y
    prompt = """Using the SonarQube MCP tools:
    1. List all projects in my organization
    2. For the first project, show:
    - Quality gate status (pass/fail)
    - Number of bugs
    - Number of code smells
    - Number of security vulnerabilities
    3. List the top 5 most critical issues found"""
@z

@x
    await sbx.commands.run(
        f"echo '{prompt}' | claude -p --dangerously-skip-permissions",
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@y
    await sbx.commands.run(
        f"echo '{prompt}' | claude -p --dangerously-skip-permissions",
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@z

@x
    await sbx.kill()
@y
    await sbx.kill()
@z

@x
if __name__ == "__main__":
    asyncio.run(test_sonarqube())
```
@y
if __name__ == "__main__":
    asyncio.run(test_sonarqube())
```
@z

@x
Run the script:
@y
Run the script:
@z

@x
```bash
python 04_test_sonarqube.py
```
@y
```bash
python 04_test_sonarqube.py
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
> [!NOTE]
>
> This script may take a few minutes to run.
@y
> [!NOTE]
>
> This script may take a few minutes to run.
@z

@x
You should see Claude output SonarQube analysis results:
@y
You should see Claude output SonarQube analysis results:
@z

@x
```console {collapse=true}
Creating sandbox...
@y
```console {collapse=true}
Creating sandbox...
@z

@x
Analyzing code quality with SonarQube...
@y
Analyzing code quality with SonarQube...
@z

@x
## SonarQube Analysis Results
@y
## SonarQube Analysis Results
@z

@x
### 1. Projects in Your Organization
@y
### 1. Projects in Your Organization
@z

@x
Found **1 project**:
- **Project Name**: project-1
- **Project Key**: project-testing
@y
Found **1 project**:
- **Project Name**: project-1
- **Project Key**: project-testing
@z

@x
### 2. Project Analysis
@y
### 2. Project Analysis
@z

@x
...
@y
...
@z

@x
### 3. Top 5 Most Critical Issues
@y
### 3. Top 5 Most Critical Issues
@z

@x
Found 1 total issues (all are code smells with no critical/blocker severity):
@y
Found 1 total issues (all are code smells with no critical/blocker severity):
@z

@x
1. **MAJOR Severity** - test.js:2
   - **Rule**: javascript:S1854
   - **Message**: Remove this useless assignment to variable "unusedVariable"
   - **Status**: OPEN
@y
1. **MAJOR Severity** - test.js:2
   - **Rule**: javascript:S1854
   - **Message**: Remove this useless assignment to variable "unusedVariable"
   - **Status**: OPEN
@z

@x
**Summary**: The project is in good health with no bugs or vulnerabilities detected.
```
@y
**Summary**: The project is in good health with no bugs or vulnerabilities detected.
```
@z

@x
You can now use SonarQube MCP tools to analyze code quality through
natural language. You can retrieve quality metrics, identify issues,
and understand what code needs fixing.
@y
You can now use SonarQube MCP tools to analyze code quality through
natural language. You can retrieve quality metrics, identify issues,
and understand what code needs fixing.
@z

@x
### Step 5: Create a branch and make code changes
@y
### Step 5: Create a branch and make code changes
@z

@x
Now, let's teach Claude to fix code based on quality issues discovered
by SonarQube.
@y
Now, let's teach Claude to fix code based on quality issues discovered
by SonarQube.
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
Create `05-fix-code-issue.ts`:
@y
Create `05-fix-code-issue.ts`:
@z

@x
```typescript
import "dotenv/config";
import { Sandbox } from "e2b";
@y
```typescript
import "dotenv/config";
import { Sandbox } from "e2b";
@z

@x
async function fixCodeIssue() {
  console.log("Creating sandbox...\n");
@y
async function fixCodeIssue() {
  console.log("Creating sandbox...\n");
@z

@x
  const sbx = await Sandbox.betaCreate({
    envs: {
      ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
      GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
      SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
    },
    mcp: {
      githubOfficial: {
        githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
      },
      sonarqube: {
        org: process.env.SONARQUBE_ORG!,
        token: process.env.SONARQUBE_TOKEN!,
        url: "https://sonarcloud.io",
      },
    },
  });
@y
  const sbx = await Sandbox.betaCreate({
    envs: {
      ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
      GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
      SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
    },
    mcp: {
      githubOfficial: {
        githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
      },
      sonarqube: {
        org: process.env.SONARQUBE_ORG!,
        token: process.env.SONARQUBE_TOKEN!,
        url: "https://sonarcloud.io",
      },
    },
  });
@z

@x
  const mcpUrl = sbx.betaGetMcpUrl();
  const mcpToken = await sbx.betaGetMcpToken();
@y
  const mcpUrl = sbx.betaGetMcpUrl();
  const mcpToken = await sbx.betaGetMcpToken();
@z

@x
  await new Promise((resolve) => setTimeout(resolve, 1000));
@y
  await new Promise((resolve) => setTimeout(resolve, 1000));
@z

@x
  await sbx.commands.run(
    `claude mcp add --transport http e2b-mcp-gateway ${mcpUrl} --header "Authorization: Bearer ${mcpToken}"`,
    { timeoutMs: 0, onStdout: console.log, onStderr: console.log },
  );
@y
  await sbx.commands.run(
    `claude mcp add --transport http e2b-mcp-gateway ${mcpUrl} --header "Authorization: Bearer ${mcpToken}"`,
    { timeoutMs: 0, onStdout: console.log, onStderr: console.log },
  );
@z

@x
  const repoPath = `${process.env.GITHUB_OWNER}/${process.env.GITHUB_REPO}`;
  const branchName = `quality-fix-${Date.now()}`;
@y
  const repoPath = `${process.env.GITHUB_OWNER}/${process.env.GITHUB_REPO}`;
  const branchName = `quality-fix-${Date.now()}`;
@z

@x
  console.log("\nFixing a code quality issue...\n");
@y
  console.log("\nFixing a code quality issue...\n");
@z

@x
  const prompt = `Using GitHub and SonarQube MCP tools:
@y
  const prompt = `Using GitHub and SonarQube MCP tools:
@z

@x
    1. Analyze code quality in repository "${repoPath}" with SonarQube
    2. Find ONE simple issue that can be confidently fixed (like an unused variable or code smell)
    3. Create a new branch called "${branchName}"
    4. Read the file containing the issue using GitHub tools
    5. Fix the issue in the code
    6. Commit the fix to the new branch with a clear commit message
@y
    1. Analyze code quality in repository "${repoPath}" with SonarQube
    2. Find ONE simple issue that can be confidently fixed (like an unused variable or code smell)
    3. Create a new branch called "${branchName}"
    4. Read the file containing the issue using GitHub tools
    5. Fix the issue in the code
    6. Commit the fix to the new branch with a clear commit message
@z

@x
    Important: Only fix issues you're 100% confident about. Explain what you're fixing and why.`;
@y
    Important: Only fix issues you're 100% confident about. Explain what you're fixing and why.`;
@z

@x
  await sbx.commands.run(
    `echo '${prompt.replace(/'/g, "'\\''")}' | claude -p --dangerously-skip-permissions`,
    {
      timeoutMs: 0,
      onStdout: console.log,
      onStderr: console.log,
    },
  );
@y
  await sbx.commands.run(
    `echo '${prompt.replace(/'/g, "'\\''")}' | claude -p --dangerously-skip-permissions`,
    {
      timeoutMs: 0,
      onStdout: console.log,
      onStderr: console.log,
    },
  );
@z

@x
  console.log(`\nCheck your repository for branch: ${branchName}`);
@y
  console.log(`\nCheck your repository for branch: ${branchName}`);
@z

@x
  await sbx.kill();
}
@y
  await sbx.kill();
}
@z

@x
fixCodeIssue().catch(console.error);
```
@y
fixCodeIssue().catch(console.error);
```
@z

@x
Run the script:
@y
Run the script:
@z

@x
```bash
npx tsx 05-fix-code-issue.ts
```
@y
```bash
npx tsx 05-fix-code-issue.ts
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
Create `05_fix_code_issue.py`:
@y
Create `05_fix_code_issue.py`:
@z

@x
```python
import os
import asyncio
import time
from dotenv import load_dotenv
from e2b import AsyncSandbox
@y
```python
import os
import asyncio
import time
from dotenv import load_dotenv
from e2b import AsyncSandbox
@z

@x
load_dotenv()
@y
load_dotenv()
@z

@x
async def fix_code_issue():
    print("Creating sandbox...\n")
@y
async def fix_code_issue():
    print("Creating sandbox...\n")
@z

@x
    sbx = await AsyncSandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
            "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
            "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
        },
        mcp={
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
            "sonarqube": {
                "org": os.getenv("SONARQUBE_ORG"),
                "token": os.getenv("SONARQUBE_TOKEN"),
                "url": "https://sonarcloud.io",
            },
        },
    )
@y
    sbx = await AsyncSandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
            "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
            "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
        },
        mcp={
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
            "sonarqube": {
                "org": os.getenv("SONARQUBE_ORG"),
                "token": os.getenv("SONARQUBE_TOKEN"),
                "url": "https://sonarcloud.io",
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
    await asyncio.sleep(1)
@y
    await asyncio.sleep(1)
@z

@x
    await sbx.commands.run(
        f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@y
    await sbx.commands.run(
        f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@z

@x
    repo_path = f"{os.getenv('GITHUB_OWNER')}/{os.getenv('GITHUB_REPO')}"
    branch_name = f"quality-fix-{int(time.time() * 1000)}"
@y
    repo_path = f"{os.getenv('GITHUB_OWNER')}/{os.getenv('GITHUB_REPO')}"
    branch_name = f"quality-fix-{int(time.time() * 1000)}"
@z

@x
    print("\nFixing a code quality issue...\n")
@y
    print("\nFixing a code quality issue...\n")
@z

@x
    prompt = f"""Using GitHub and SonarQube MCP tools:
@y
    prompt = f"""Using GitHub and SonarQube MCP tools:
@z

@x
    1. Analyze code quality in repository "{repo_path}" with SonarQube
    2. Find ONE simple issue that can be confidently fixed (like an unused variable or code smell)
    3. Create a new branch called "{branch_name}"
    4. Read the file containing the issue using GitHub tools
    5. Fix the issue in the code
    6. Commit the fix to the new branch with a clear commit message
@y
    1. Analyze code quality in repository "{repo_path}" with SonarQube
    2. Find ONE simple issue that can be confidently fixed (like an unused variable or code smell)
    3. Create a new branch called "{branch_name}"
    4. Read the file containing the issue using GitHub tools
    5. Fix the issue in the code
    6. Commit the fix to the new branch with a clear commit message
@z

@x
    Important: Only fix issues you're 100% confident about. Explain what you're fixing and why."""
@y
    Important: Only fix issues you're 100% confident about. Explain what you're fixing and why."""
@z

@x
    await sbx.commands.run(
        f"echo '{prompt}' | claude -p --dangerously-skip-permissions",
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@y
    await sbx.commands.run(
        f"echo '{prompt}' | claude -p --dangerously-skip-permissions",
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@z

@x
    print(f"\n Check your repository for branch: {branch_name}")
@y
    print(f"\n Check your repository for branch: {branch_name}")
@z

@x
    await sbx.kill()
@y
    await sbx.kill()
@z

@x
if __name__ == "__main__":
    asyncio.run(fix_code_issue())
```
@y
if __name__ == "__main__":
    asyncio.run(fix_code_issue())
```
@z

@x
Run the script:
@y
Run the script:
@z

@x
```bash
python 05_fix_code_issue.py
```
@y
```bash
python 05_fix_code_issue.py
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
> [!NOTE]
>
> This script may take a few minutes to run.
@y
> [!NOTE]
>
> This script may take a few minutes to run.
@z

@x
Claude will analyze your repository and fix a code quality issue:
@y
Claude will analyze your repository and fix a code quality issue:
@z

@x
```console {collapse=true}
Creating sandbox...
@y
```console {collapse=true}
Creating sandbox...
@z

@x
Fixing a code quality issue...
@y
Fixing a code quality issue...
@z

@x
## Task Completed Successfully!
@y
## Task Completed Successfully!
@z

@x
I've successfully analyzed the repository and fixed a code quality issue. Here's what I did:
@y
I've successfully analyzed the repository and fixed a code quality issue. Here's what I did:
@z

@x
### 1. Analysis
Found 1 SonarQube issues in the `<your-repo>` repository:
- **Unused variable** (MINOR severity, line 2)
- Useless assignment (MAJOR severity, line 2)
- For-of loop suggestion (MINOR severity, lines 5-7)
@y
### 1. Analysis
Found 1 SonarQube issues in the `<your-repo>` repository:
- **Unused variable** (MINOR severity, line 2)
- Useless assignment (MAJOR severity, line 2)
- For-of loop suggestion (MINOR severity, lines 5-7)
@z

@x
### 2. Issue Fixed
**Location:** test.js:2
**Issue:** Unused variable declaration
**SonarQube Rule:** javascript:S1481
**What was wrong:** The line `const unusedVariable = "this is not used";` declared a variable that was never used anywhere in the function.
@y
### 2. Issue Fixed
**Location:** test.js:2
**Issue:** Unused variable declaration
**SonarQube Rule:** javascript:S1481
**What was wrong:** The line `const unusedVariable = "this is not used";` declared a variable that was never used anywhere in the function.
@z

@x
### 3. Why This Fix is Safe
- The variable was only declared and assigned, never referenced
- Removing it has zero impact on functionality
- It eliminates dead code and improves code quality
- This is a textbook example of a code smell that should be removed
@y
### 3. Why This Fix is Safe
- The variable was only declared and assigned, never referenced
- Removing it has zero impact on functionality
- It eliminates dead code and improves code quality
- This is a textbook example of a code smell that should be removed
@z

@x
### 4. Changes Made
- Created branch: `quality-fix-xxxxx`
- Removed the unused variable declaration
- Committed with a clear message explaining the fix and referencing the SonarQube rule
@y
### 4. Changes Made
- Created branch: `quality-fix-xxxxx`
- Removed the unused variable declaration
- Committed with a clear message explaining the fix and referencing the SonarQube rule
@z

@x
**Commit SHA:** `xxxxxxxxxxxxxxxxxxxxxxxxx`
**Branch:** https://github.com/<github-org>/<your-repo>/tree/quality-fix-xxxxx
@y
**Commit SHA:** `xxxxxxxxxxxxxxxxxxxxxxxxx`
**Branch:** https://github.com/<github-org>/<your-repo>/tree/quality-fix-xxxxx
@z

@x
The fix is ready for review and can be merged to improve the code quality of the repository!
```
@y
The fix is ready for review and can be merged to improve the code quality of the repository!
```
@z

@x
You can now use GitHub and SonarQube MCP tools in the same workflow to read
files, make code changes, and commit them.
@y
You can now use GitHub and SonarQube MCP tools in the same workflow to read
files, make code changes, and commit them.
@z

@x
### Step 6: Create quality-gated pull requests
@y
### Step 6: Create quality-gated pull requests
@z

@x
Finally, let's build the complete workflow: analyze quality, fix issues,
and create a PR only if improvements are made.
@y
Finally, let's build the complete workflow: analyze quality, fix issues,
and create a PR only if improvements are made.
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
Create `06-quality-gated-pr.ts`:
@y
Create `06-quality-gated-pr.ts`:
@z

@x
```typescript
import "dotenv/config";
import { Sandbox } from "e2b";
@y
```typescript
import "dotenv/config";
import { Sandbox } from "e2b";
@z

@x
async function qualityGatedPR() {
  console.log("Creating sandbox for quality-gated PR workflow...\n");
@y
async function qualityGatedPR() {
  console.log("Creating sandbox for quality-gated PR workflow...\n");
@z

@x
  const sbx = await Sandbox.betaCreate({
    envs: {
      ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
      GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
      SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
    },
    mcp: {
      githubOfficial: {
        githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
      },
      sonarqube: {
        org: process.env.SONARQUBE_ORG!,
        token: process.env.SONARQUBE_TOKEN!,
        url: "https://sonarcloud.io",
      },
    },
  });
@y
  const sbx = await Sandbox.betaCreate({
    envs: {
      ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
      GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
      SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
    },
    mcp: {
      githubOfficial: {
        githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
      },
      sonarqube: {
        org: process.env.SONARQUBE_ORG!,
        token: process.env.SONARQUBE_TOKEN!,
        url: "https://sonarcloud.io",
      },
    },
  });
@z

@x
  const mcpUrl = sbx.betaGetMcpUrl();
  const mcpToken = await sbx.betaGetMcpToken();
@y
  const mcpUrl = sbx.betaGetMcpUrl();
  const mcpToken = await sbx.betaGetMcpToken();
@z

@x
  await new Promise((resolve) => setTimeout(resolve, 1000));
@y
  await new Promise((resolve) => setTimeout(resolve, 1000));
@z

@x
  await sbx.commands.run(
    `claude mcp add --transport http e2b-mcp-gateway ${mcpUrl} --header "Authorization: Bearer ${mcpToken}"`,
    { timeoutMs: 0, onStdout: console.log, onStderr: console.log },
  );
@y
  await sbx.commands.run(
    `claude mcp add --transport http e2b-mcp-gateway ${mcpUrl} --header "Authorization: Bearer ${mcpToken}"`,
    { timeoutMs: 0, onStdout: console.log, onStderr: console.log },
  );
@z

@x
  const repoPath = `${process.env.GITHUB_OWNER}/${process.env.GITHUB_REPO}`;
  const branchName = `quality-improvements-${Date.now()}`;
@y
  const repoPath = `${process.env.GITHUB_OWNER}/${process.env.GITHUB_REPO}`;
  const branchName = `quality-improvements-${Date.now()}`;
@z

@x
  console.log("\nRunning quality-gated PR workflow...\n");
@y
  console.log("\nRunning quality-gated PR workflow...\n");
@z

@x
  const prompt = `You are a code quality engineer. Using GitHub and SonarQube MCP tools:
@y
  const prompt = `You are a code quality engineer. Using GitHub and SonarQube MCP tools:
@z

@x
    STEP 1: ANALYSIS
    - Get current code quality status from SonarQube for "${repoPath}"
    - Record the current number of bugs, code smells, and vulnerabilities
    - Identify 1-3 issues that you can confidently fix
@y
    STEP 1: ANALYSIS
    - Get current code quality status from SonarQube for "${repoPath}"
    - Record the current number of bugs, code smells, and vulnerabilities
    - Identify 1-3 issues that you can confidently fix
@z

@x
    STEP 2: FIX ISSUES
    - Create branch "${branchName}"
    - For each issue you're fixing:
        * Read the file with the issue
        * Make the fix
        * Commit with a descriptive message
    - Only fix issues where you're 100% confident the fix is correct
@y
    STEP 2: FIX ISSUES
    - Create branch "${branchName}"
    - For each issue you're fixing:
        * Read the file with the issue
        * Make the fix
        * Commit with a descriptive message
    - Only fix issues where you're 100% confident the fix is correct
@z

@x
    STEP 3: VERIFICATION
        - After your fixes, check if quality metrics would improve
        - Calculate: Would this reduce bugs/smells/vulnerabilities?
@y
    STEP 3: VERIFICATION
        - After your fixes, check if quality metrics would improve
        - Calculate: Would this reduce bugs/smells/vulnerabilities?
@z

@x
    STEP 4: QUALITY GATE
        - Only proceed if your changes improve quality
        - If quality would not improve, explain why and stop
@y
    STEP 4: QUALITY GATE
        - Only proceed if your changes improve quality
        - If quality would not improve, explain why and stop
@z

@x
    STEP 5: CREATE PR (only if quality gate passes)
        - Create a pull request from "${branchName}" to main
        - Title: "Quality improvements: [describe what you fixed]"
        - Description should include:
            * What issues you fixed
            * Before/after quality metrics
            * Why these fixes improve code quality
        - Add a comment with detailed SonarQube analysis
@y
    STEP 5: CREATE PR (only if quality gate passes)
        - Create a pull request from "${branchName}" to main
        - Title: "Quality improvements: [describe what you fixed]"
        - Description should include:
            * What issues you fixed
            * Before/after quality metrics
            * Why these fixes improve code quality
        - Add a comment with detailed SonarQube analysis
@z

@x
    Be thorough and explain your decisions at each step.`;
@y
    Be thorough and explain your decisions at each step.`;
@z

@x
  await sbx.commands.run(
    `echo '${prompt.replace(/'/g, "'\\''")}' | claude -p --dangerously-skip-permissions`,
    {
      timeoutMs: 0,
      onStdout: console.log,
      onStderr: console.log,
    },
  );
@y
  await sbx.commands.run(
    `echo '${prompt.replace(/'/g, "'\\''")}' | claude -p --dangerously-skip-permissions`,
    {
      timeoutMs: 0,
      onStdout: console.log,
      onStderr: console.log,
    },
  );
@z

@x
  console.log(`\n Workflow complete! Check ${repoPath} for new pull request.`);
@y
  console.log(`\n Workflow complete! Check ${repoPath} for new pull request.`);
@z

@x
  await sbx.kill();
}
@y
  await sbx.kill();
}
@z

@x
qualityGatedPR().catch(console.error);
```
@y
qualityGatedPR().catch(console.error);
```
@z

@x
Run the script:
@y
Run the script:
@z

@x
```bash
npx tsx 06-quality-gated-pr.ts
```
@y
```bash
npx tsx 06-quality-gated-pr.ts
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
Create `06_quality_gated_pr.py`:
@y
Create `06_quality_gated_pr.py`:
@z

@x
```python
import os
import asyncio
import time
from dotenv import load_dotenv
from e2b import AsyncSandbox
@y
```python
import os
import asyncio
import time
from dotenv import load_dotenv
from e2b import AsyncSandbox
@z

@x
load_dotenv()
@y
load_dotenv()
@z

@x
async def quality_gated_pr():
    print("Creating sandbox for quality-gated PR workflow...\n")
@y
async def quality_gated_pr():
    print("Creating sandbox for quality-gated PR workflow...\n")
@z

@x
    sbx = await AsyncSandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
            "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
            "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
        },
        mcp={
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
            "sonarqube": {
                "org": os.getenv("SONARQUBE_ORG"),
                "token": os.getenv("SONARQUBE_TOKEN"),
                "url": "https://sonarcloud.io",
            },
        },
    )
@y
    sbx = await AsyncSandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
            "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
            "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
        },
        mcp={
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
            "sonarqube": {
                "org": os.getenv("SONARQUBE_ORG"),
                "token": os.getenv("SONARQUBE_TOKEN"),
                "url": "https://sonarcloud.io",
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
    await asyncio.sleep(1)
@y
    await asyncio.sleep(1)
@z

@x
    await sbx.commands.run(
        f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@y
    await sbx.commands.run(
        f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@z

@x
    repo_path = f"{os.getenv('GITHUB_OWNER')}/{os.getenv('GITHUB_REPO')}"
    branch_name = f"quality-improvements-{int(time.time() * 1000)}"
@y
    repo_path = f"{os.getenv('GITHUB_OWNER')}/{os.getenv('GITHUB_REPO')}"
    branch_name = f"quality-improvements-{int(time.time() * 1000)}"
@z

@x
    print("\nRunning quality-gated PR workflow...\n")
@y
    print("\nRunning quality-gated PR workflow...\n")
@z

@x
    prompt = f"""You are a code quality engineer. Using GitHub and SonarQube MCP tools:
@y
    prompt = f"""You are a code quality engineer. Using GitHub and SonarQube MCP tools:
@z

@x
    STEP 1: ANALYSIS
    - Get current code quality status from SonarQube for "{repo_path}"
    - Record the current number of bugs, code smells, and vulnerabilities
    - Identify 1-3 issues that you can confidently fix
@y
    STEP 1: ANALYSIS
    - Get current code quality status from SonarQube for "{repo_path}"
    - Record the current number of bugs, code smells, and vulnerabilities
    - Identify 1-3 issues that you can confidently fix
@z

@x
    STEP 2: FIX ISSUES
    - Create branch "{branch_name}"
    - For each issue you are fixing:
        Read the file with the issue
        Make the fix
        Commit with a descriptive message
    - Only fix issues where you are 100 percent confident the fix is correct
@y
    STEP 2: FIX ISSUES
    - Create branch "{branch_name}"
    - For each issue you are fixing:
        Read the file with the issue
        Make the fix
        Commit with a descriptive message
    - Only fix issues where you are 100 percent confident the fix is correct
@z

@x
    STEP 3: VERIFICATION
        - After your fixes, check if quality metrics would improve
        - Calculate: Would this reduce bugs/smells/vulnerabilities?
@y
    STEP 3: VERIFICATION
        - After your fixes, check if quality metrics would improve
        - Calculate: Would this reduce bugs/smells/vulnerabilities?
@z

@x
    STEP 4: QUALITY GATE
        - Only proceed if your changes improve quality
        - If quality would not improve, explain why and stop
@y
    STEP 4: QUALITY GATE
        - Only proceed if your changes improve quality
        - If quality would not improve, explain why and stop
@z

@x
    STEP 5: CREATE PR (only if quality gate passes)
        - Create a pull request from "{branch_name}" to main
        - Title: "Quality improvements: [describe what you fixed]"
        - Description should include:
            What issues you fixed
            Before/after quality metrics
            Why these fixes improve code quality
        - Add a comment with detailed SonarQube analysis
@y
    STEP 5: CREATE PR (only if quality gate passes)
        - Create a pull request from "{branch_name}" to main
        - Title: "Quality improvements: [describe what you fixed]"
        - Description should include:
            What issues you fixed
            Before/after quality metrics
            Why these fixes improve code quality
        - Add a comment with detailed SonarQube analysis
@z

@x
    Be thorough and explain your decisions at each step."""
@y
    Be thorough and explain your decisions at each step."""
@z

@x
    await sbx.commands.run(
        f"echo '{prompt.replace(chr(39), chr(39) + chr(92) + chr(39) + chr(39))}' | claude -p --dangerously-skip-permissions",
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@y
    await sbx.commands.run(
        f"echo '{prompt.replace(chr(39), chr(39) + chr(92) + chr(39) + chr(39))}' | claude -p --dangerously-skip-permissions",
        timeout=0,
        on_stdout=print,
        on_stderr=print,
    )
@z

@x
    print(f"\n Workflow complete! Check {repo_path} for new pull request.")
@y
    print(f"\n Workflow complete! Check {repo_path} for new pull request.")
@z

@x
    await sbx.kill()
@y
    await sbx.kill()
@z

@x
if __name__ == "__main__":
    asyncio.run(quality_gated_pr())
```
@y
if __name__ == "__main__":
    asyncio.run(quality_gated_pr())
```
@z

@x
Run the script:
@y
Run the script:
@z

@x
```bash
python 06_quality_gated_pr.py
```
@y
```bash
python 06_quality_gated_pr.py
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
> [!NOTE]
>
> This script may take a few minutes to run.
@y
> [!NOTE]
>
> This script may take a few minutes to run.
@z

@x
Claude will run the entire workflow, creating a quality improvement
and opening a PR in GitHub:
@y
Claude will run the entire workflow, creating a quality improvement
and opening a PR in GitHub:
@z

@x
```console {collapse=true}
Creating sandbox for quality-gated PR workflow...
@y
```console {collapse=true}
Creating sandbox for quality-gated PR workflow...
@z

@x
Running quality-gated PR workflow...
@y
Running quality-gated PR workflow...
@z

@x
## Complete - Code Quality Improvement Successfully Executed
@y
## Complete - Code Quality Improvement Successfully Executed
@z

@x
### Summary of Work Completed
@y
### Summary of Work Completed
@z

@x
**Pull Request Created:** https://github.com/<github-org>/<your-repo>/pull/1
@y
**Pull Request Created:** https://github.com/<github-org>/<your-repo>/pull/1
@z

@x
---
@y
---
@z

@x
### STEP 1: ANALYSIS
@y
### STEP 1: ANALYSIS
@z

@x
**Current State:**
- **Bugs:** 0
- **Vulnerabilities:** 0
- **Code Smells:** 1
- **Lines of Code:** 12
- **All Ratings:** A (Reliability, Security, Maintainability)
@y
**Current State:**
- **Bugs:** 0
- **Vulnerabilities:** 0
- **Code Smells:** 1
- **Lines of Code:** 12
- **All Ratings:** A (Reliability, Security, Maintainability)
@z

@x
**Issues Identified (all in test.js):**
1. xxxxxxxxx - Unused variable declaration (MINOR)
@y
**Issues Identified (all in test.js):**
1. xxxxxxxxx - Unused variable declaration (MINOR)
@z

@x
---
@y
---
@z

@x
### STEP 2: FIX ISSUES
@y
### STEP 2: FIX ISSUES
@z

@x
**Branch Created:** `quality-improvements-xxxxxxxx`
@y
**Branch Created:** `quality-improvements-xxxxxxxx`
@z

@x
**Changes Made:**
1. **Removed unused variable** (line 2) - Eliminated dead code that served no purpose
2. **Modernized loop pattern** (lines 5-7) - Converted `for (let i = 0; i < items.length; i++)` to `for (const item of items)`
@y
**Changes Made:**
1. **Removed unused variable** (line 2) - Eliminated dead code that served no purpose
2. **Modernized loop pattern** (lines 5-7) - Converted `for (let i = 0; i < items.length; i++)` to `for (const item of items)`
@z

@x
**Commit:** xxxxxxxxxx
@y
**Commit:** xxxxxxxxxx
@z

@x
---
@y
---
@z

@x
### STEP 3: VERIFICATION
@y
### STEP 3: VERIFICATION
@z

@x
**Expected Impact:**
- Code Smells: 1 → 0 (100% reduction)
- Bugs: 0 → 0 (maintained)
- Vulnerabilities: 0 → 0 (maintained)
- All quality ratings maintained at A
@y
**Expected Impact:**
- Code Smells: 1 → 0 (100% reduction)
- Bugs: 0 → 0 (maintained)
- Vulnerabilities: 0 → 0 (maintained)
- All quality ratings maintained at A
@z

@x
---
@y
---
@z

@x
### STEP 4: QUALITY GATE PASSED
@y
### STEP 4: QUALITY GATE PASSED
@z

@x
**Decision Criteria Met:**
- ✅ Reduces code smells by 100%
- ✅ No new bugs or vulnerabilities introduced
- ✅ Code is more readable and maintainable
- ✅ Follows modern JavaScript best practices
- ✅ All fixes are low-risk refactorings with no behavioral changes
@y
**Decision Criteria Met:**
- ✅ Reduces code smells by 100%
- ✅ No new bugs or vulnerabilities introduced
- ✅ Code is more readable and maintainable
- ✅ Follows modern JavaScript best practices
- ✅ All fixes are low-risk refactorings with no behavioral changes
@z

@x
---
@y
---
@z

@x
### STEP 5: CREATE PR
@y
### STEP 5: CREATE PR
@z

@x
**Pull Request Details:**
- **Number:** #1
- **Title:** Quality improvements: Remove unused variable and modernize for loop
- **Branch:** quality-improvements-xxxxxxxx → main
- **URL:** https://github.com/<github-org)/<your-repo>/pull/1
@y
**Pull Request Details:**
- **Number:** #1
- **Title:** Quality improvements: Remove unused variable and modernize for loop
- **Branch:** quality-improvements-xxxxxxxx → main
- **URL:** https://github.com/<github-org)/<your-repo>/pull/1
@z

@x
**PR Includes:**
- Comprehensive description with before/after metrics
- Detailed SonarQube analysis comment with issue breakdown
- Code comparison showing improvements
- Quality metrics table
@y
**PR Includes:**
- Comprehensive description with before/after metrics
- Detailed SonarQube analysis comment with issue breakdown
- Code comparison showing improvements
- Quality metrics table
@z

@x
The pull request is now ready for review and merge!
```
@y
The pull request is now ready for review and merge!
```
@z

@x
You've now built a complete, multi-step workflow with conditional logic.
Claude analyzes quality with SonarQube, makes fixes using GitHub tools,
verifies improvements, and only creates a PR if quality actually improves.
@y
You've now built a complete, multi-step workflow with conditional logic.
Claude analyzes quality with SonarQube, makes fixes using GitHub tools,
verifies improvements, and only creates a PR if quality actually improves.
@z

@x
### Step 7: Add error handling
@y
### Step 7: Add error handling
@z

@x
Production workflows need error handling. Let's make the workflow more robust.
@y
Production workflows need error handling. Let's make the workflow more robust.
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
Create `07-robust-workflow.ts`:
@y
Create `07-robust-workflow.ts`:
@z

@x
```typescript
import "dotenv/config";
import { Sandbox } from "e2b";
@y
```typescript
import "dotenv/config";
import { Sandbox } from "e2b";
@z

@x
async function robustWorkflow() {
  let sbx: Sandbox | undefined;
@y
async function robustWorkflow() {
  let sbx: Sandbox | undefined;
@z

@x
  try {
    console.log("Creating sandbox...\n");
@y
  try {
    console.log("Creating sandbox...\n");
@z

@x
    sbx = await Sandbox.betaCreate({
      envs: {
        ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
        GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
        SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
      },
      mcp: {
        githubOfficial: {
          githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
        },
        sonarqube: {
          org: process.env.SONARQUBE_ORG!,
          token: process.env.SONARQUBE_TOKEN!,
          url: "https://sonarcloud.io",
        },
      },
    });
@y
    sbx = await Sandbox.betaCreate({
      envs: {
        ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
        GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
        SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
      },
      mcp: {
        githubOfficial: {
          githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
        },
        sonarqube: {
          org: process.env.SONARQUBE_ORG!,
          token: process.env.SONARQUBE_TOKEN!,
          url: "https://sonarcloud.io",
        },
      },
    });
@z

@x
    const mcpUrl = sbx.betaGetMcpUrl();
    const mcpToken = await sbx.betaGetMcpToken();
@y
    const mcpUrl = sbx.betaGetMcpUrl();
    const mcpToken = await sbx.betaGetMcpToken();
@z

@x
    await new Promise((resolve) => setTimeout(resolve, 1000));
@y
    await new Promise((resolve) => setTimeout(resolve, 1000));
@z

@x
    await sbx.commands.run(
      `claude mcp add --transport http e2b-mcp-gateway ${mcpUrl} --header "Authorization: Bearer ${mcpToken}"`,
      { timeoutMs: 0, onStdout: console.log, onStderr: console.log },
    );
@y
    await sbx.commands.run(
      `claude mcp add --transport http e2b-mcp-gateway ${mcpUrl} --header "Authorization: Bearer ${mcpToken}"`,
      { timeoutMs: 0, onStdout: console.log, onStderr: console.log },
    );
@z

@x
    const repoPath = `${process.env.GITHUB_OWNER}/${process.env.GITHUB_REPO}`;
@y
    const repoPath = `${process.env.GITHUB_OWNER}/${process.env.GITHUB_REPO}`;
@z

@x
    console.log("\nRunning workflow with error handling...\n");
@y
    console.log("\nRunning workflow with error handling...\n");
@z

@x
    const prompt = `Run a quality improvement workflow for "${repoPath}".
@y
    const prompt = `Run a quality improvement workflow for "${repoPath}".
@z

@x
    ERROR HANDLING RULES:
    1. If SonarQube is unreachable, explain the error and stop gracefully
    2. If GitHub API fails, retry once, then explain and stop
    3. If no fixable issues are found, explain why and exit (this is not an error)
    4. If file modifications fail, explain which file and why
    5. At each step, check for errors before proceeding
@y
    ERROR HANDLING RULES:
    1. If SonarQube is unreachable, explain the error and stop gracefully
    2. If GitHub API fails, retry once, then explain and stop
    3. If no fixable issues are found, explain why and exit (this is not an error)
    4. If file modifications fail, explain which file and why
    5. At each step, check for errors before proceeding
@z

@x
    Run the workflow and handle any errors you encounter professionally.`;
@y
    Run the workflow and handle any errors you encounter professionally.`;
@z

@x
    await sbx.commands.run(
      `echo '${prompt.replace(/'/g, "'\\''")}' | claude -p --dangerously-skip-permissions`,
      {
        timeoutMs: 0,
        onStdout: console.log,
        onStderr: console.log,
      },
    );
@y
    await sbx.commands.run(
      `echo '${prompt.replace(/'/g, "'\\''")}' | claude -p --dangerously-skip-permissions`,
      {
        timeoutMs: 0,
        onStdout: console.log,
        onStderr: console.log,
      },
    );
@z

@x
    console.log("\n Workflow completed");
  } catch (error) {
    const err = error as Error;
    console.error("\n Workflow failed:", err.message);
@y
    console.log("\n Workflow completed");
  } catch (error) {
    const err = error as Error;
    console.error("\n Workflow failed:", err.message);
@z

@x
    if (err.message.includes("403")) {
      console.error("\n Check your E2B account has MCP gateway access");
    } else if (err.message.includes("401")) {
      console.error("\n Check your API tokens are valid");
    } else if (err.message.includes("Credit balance")) {
      console.error("\n Check your Anthropic API credit balance");
    }
@y
    if (err.message.includes("403")) {
      console.error("\n Check your E2B account has MCP gateway access");
    } else if (err.message.includes("401")) {
      console.error("\n Check your API tokens are valid");
    } else if (err.message.includes("Credit balance")) {
      console.error("\n Check your Anthropic API credit balance");
    }
@z

@x
    process.exit(1);
  } finally {
    if (sbx) {
      console.log("\n Cleaning up sandbox...");
      await sbx.kill();
    }
  }
}
@y
    process.exit(1);
  } finally {
    if (sbx) {
      console.log("\n Cleaning up sandbox...");
      await sbx.kill();
    }
  }
}
@z

@x
robustWorkflow().catch(console.error);
```
@y
robustWorkflow().catch(console.error);
```
@z

@x
Run the script:
@y
Run the script:
@z

@x
```bash
npx tsx 07-robust-workflow.ts
```
@y
```bash
npx tsx 07-robust-workflow.ts
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
Create `07_robust_workflow.py`:
@y
Create `07_robust_workflow.py`:
@z

@x
```python
import os
import asyncio
import sys
from dotenv import load_dotenv
from e2b import AsyncSandbox
@y
```python
import os
import asyncio
import sys
from dotenv import load_dotenv
from e2b import AsyncSandbox
@z

@x
load_dotenv()
@y
load_dotenv()
@z

@x
async def robust_workflow():
    sbx = None
@y
async def robust_workflow():
    sbx = None
@z

@x
    try:
        print("Creating sandbox...\n")
@y
    try:
        print("Creating sandbox...\n")
@z

@x
        sbx = await AsyncSandbox.beta_create(
            envs={
                "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
                "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
                "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
            },
            mcp={
                "githubOfficial": {
                    "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
                },
                "sonarqube": {
                    "org": os.getenv("SONARQUBE_ORG"),
                    "token": os.getenv("SONARQUBE_TOKEN"),
                    "url": "https://sonarcloud.io",
                },
            },
        )
@y
        sbx = await AsyncSandbox.beta_create(
            envs={
                "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
                "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
                "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
            },
            mcp={
                "githubOfficial": {
                    "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
                },
                "sonarqube": {
                    "org": os.getenv("SONARQUBE_ORG"),
                    "token": os.getenv("SONARQUBE_TOKEN"),
                    "url": "https://sonarcloud.io",
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
        await asyncio.sleep(1)
@y
        await asyncio.sleep(1)
@z

@x
        await sbx.commands.run(
            f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
            timeout=0,  # Fixed: was timeout_ms
            on_stdout=print,
            on_stderr=print,
        )
@y
        await sbx.commands.run(
            f'claude mcp add --transport http e2b-mcp-gateway {mcp_url} --header "Authorization: Bearer {mcp_token}"',
            timeout=0,  # Fixed: was timeout_ms
            on_stdout=print,
            on_stderr=print,
        )
@z

@x
        repo_path = f"{os.getenv('GITHUB_OWNER')}/{os.getenv('GITHUB_REPO')}"
@y
        repo_path = f"{os.getenv('GITHUB_OWNER')}/{os.getenv('GITHUB_REPO')}"
@z

@x
        print("\nRunning workflow with error handling...\n")
@y
        print("\nRunning workflow with error handling...\n")
@z

@x
        prompt = f"""Run a quality improvement workflow for "{repo_path}".
@y
        prompt = f"""Run a quality improvement workflow for "{repo_path}".
@z

@x
        ERROR HANDLING RULES:
        1. If SonarQube is unreachable, explain the error and stop gracefully
        2. If GitHub API fails, retry once, then explain and stop
        3. If no fixable issues are found, explain why and exit (this is not an error)
        4. If file modifications fail, explain which file and why
        5. At each step, check for errors before proceeding
@y
        ERROR HANDLING RULES:
        1. If SonarQube is unreachable, explain the error and stop gracefully
        2. If GitHub API fails, retry once, then explain and stop
        3. If no fixable issues are found, explain why and exit (this is not an error)
        4. If file modifications fail, explain which file and why
        5. At each step, check for errors before proceeding
@z

@x
        Run the workflow and handle any errors you encounter professionally."""
@y
        Run the workflow and handle any errors you encounter professionally."""
@z

@x
        await sbx.commands.run(
            f"echo '{prompt}' | claude -p --dangerously-skip-permissions",
            timeout=0,
            on_stdout=print,
            on_stderr=print,
        )
@y
        await sbx.commands.run(
            f"echo '{prompt}' | claude -p --dangerously-skip-permissions",
            timeout=0,
            on_stdout=print,
            on_stderr=print,
        )
@z

@x
        print("\n Workflow completed")
@y
        print("\n Workflow completed")
@z

@x
    except Exception as error:
        print(f"\n✗ Workflow failed: {str(error)}")
@y
    except Exception as error:
        print(f"\n✗ Workflow failed: {str(error)}")
@z

@x
        error_msg = str(error)
        if "403" in error_msg:
            print("\n Check your E2B account has MCP gateway access")
        elif "401" in error_msg:
            print("\n Check your API tokens are valid")
        elif "Credit balance" in error_msg:
            print("\n Check your Anthropic API credit balance")
@y
        error_msg = str(error)
        if "403" in error_msg:
            print("\n Check your E2B account has MCP gateway access")
        elif "401" in error_msg:
            print("\n Check your API tokens are valid")
        elif "Credit balance" in error_msg:
            print("\n Check your Anthropic API credit balance")
@z

@x
        sys.exit(1)
@y
        sys.exit(1)
@z

@x
    finally:
        if sbx:
            print("\n Cleaning up sandbox...")
            await sbx.kill()
@y
    finally:
        if sbx:
            print("\n Cleaning up sandbox...")
            await sbx.kill()
@z

@x
if __name__ == "__main__":
    asyncio.run(robust_workflow())
```
@y
if __name__ == "__main__":
    asyncio.run(robust_workflow())
```
@z

@x
Run the script:
@y
Run the script:
@z

@x
```bash
python 07_robust_workflow.py
```
@y
```bash
python 07_robust_workflow.py
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Claude will run the entire workflow, and if it encounters an error, respond
with robust error messaging.
@y
Claude will run the entire workflow, and if it encounters an error, respond
with robust error messaging.
@z

@x
### Next steps
@y
### Next steps
@z

@x
In the next section, you'll customize your workflow for your needs.
@y
In the next section, you'll customize your workflow for your needs.
@z

@x
## Customize a code quality check workflow
@y
## Customize a code quality check workflow
@z

@x
Now that you understand the basics of automating code quality workflows with
GitHub and SonarQube in E2B sandboxes, you can customize the workflow
for your needs.
@y
Now that you understand the basics of automating code quality workflows with
GitHub and SonarQube in E2B sandboxes, you can customize the workflow
for your needs.
@z

@x
### Focus on specific quality issues
@y
### Focus on specific quality issues
@z

@x
Modify the prompt to prioritize certain issue types:
@y
Modify the prompt to prioritize certain issue types:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
const prompt = `Using SonarQube and GitHub MCP tools:
@y
```typescript
const prompt = `Using SonarQube and GitHub MCP tools:
@z

@x
Focus only on:
- Security vulnerabilities (CRITICAL priority)
- Bugs (HIGH priority)
- Skip code smells for this iteration
@y
Focus only on:
- Security vulnerabilities (CRITICAL priority)
- Bugs (HIGH priority)
- Skip code smells for this iteration
@z

@x
Analyze "${repoPath}" and fix the highest priority issues first.`;
```
@y
Analyze "${repoPath}" and fix the highest priority issues first.`;
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
prompt = f"""Using SonarQube and GitHub MCP tools:
@y
```python
prompt = f"""Using SonarQube and GitHub MCP tools:
@z

@x
Focus only on:
- Security vulnerabilities (CRITICAL priority)
- Bugs (HIGH priority)
- Skip code smells for this iteration
@y
Focus only on:
- Security vulnerabilities (CRITICAL priority)
- Bugs (HIGH priority)
- Skip code smells for this iteration
@z

@x
Analyze "{repo_path}" and fix the highest priority issues first."""
```
@y
Analyze "{repo_path}" and fix the highest priority issues first."""
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Integrate with CI/CD
@y
### Integrate with CI/CD
@z

@x
Add this workflow to GitHub Actions to run automatically on pull requests:
@y
Add this workflow to GitHub Actions to run automatically on pull requests:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
```yaml
name: Automated quality checks
on:
  pull_request:
    types: [opened, synchronize]
@y
```yaml
name: Automated quality checks
on:
  pull_request:
    types: [opened, synchronize]
@z

@x
jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@{{% param "checkout_action_version" %}}
      - uses: actions/setup-node@v5
        with:
          node-version: "24"
      - run: npm install
      - run: npx tsx 06-quality-gated-pr.ts
        env:
          E2B_API_KEY: ${{ secrets.E2B_API_KEY }}
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SONARQUBE_TOKEN: ${{ secrets.SONARQUBE_TOKEN }}
          GITHUB_OWNER: ${{ github.repository_owner }}
          GITHUB_REPO: ${{ github.event.repository.name }}
          SONARQUBE_ORG: your-org-key
```
@y
jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@{{% param "checkout_action_version" %}}
      - uses: actions/setup-node@v5
        with:
          node-version: "24"
      - run: npm install
      - run: npx tsx 06-quality-gated-pr.ts
        env:
          E2B_API_KEY: ${{ secrets.E2B_API_KEY }}
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SONARQUBE_TOKEN: ${{ secrets.SONARQUBE_TOKEN }}
          GITHUB_OWNER: ${{ github.repository_owner }}
          GITHUB_REPO: ${{ github.event.repository.name }}
          SONARQUBE_ORG: your-org-key
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```yaml
name: Automated quality checks
on:
  pull_request:
    types: [opened, synchronize]
@y
```yaml
name: Automated quality checks
on:
  pull_request:
    types: [opened, synchronize]
@z

@x
jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@{{% param "checkout_action_version" %}}
      - uses: actions/setup-python@v6
        with:
          python-version: "3.14"
      - run: pip install e2b python-dotenv
      - run: python 06_quality_gated_pr.py
        env:
          E2B_API_KEY: ${{ secrets.E2B_API_KEY }}
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SONARQUBE_TOKEN: ${{ secrets.SONARQUBE_TOKEN }}
          GITHUB_OWNER: ${{ github.repository_owner }}
          GITHUB_REPO: ${{ github.event.repository.name }}
          SONARQUBE_ORG: your-org-key
```
@y
jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@{{% param "checkout_action_version" %}}
      - uses: actions/setup-python@v6
        with:
          python-version: "3.14"
      - run: pip install e2b python-dotenv
      - run: python 06_quality_gated_pr.py
        env:
          E2B_API_KEY: ${{ secrets.E2B_API_KEY }}
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SONARQUBE_TOKEN: ${{ secrets.SONARQUBE_TOKEN }}
          GITHUB_OWNER: ${{ github.repository_owner }}
          GITHUB_REPO: ${{ github.event.repository.name }}
          SONARQUBE_ORG: your-org-key
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Filter by file patterns
@y
### Filter by file patterns
@z

@x
Target specific parts of your codebase:
@y
Target specific parts of your codebase:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
const prompt = `Analyze code quality but only consider:
- Files in src/**/*.js
- Exclude test files (*.test.js, *.spec.js)
- Exclude build artifacts in dist/
@y
```typescript
const prompt = `Analyze code quality but only consider:
- Files in src/**/*.js
- Exclude test files (*.test.js, *.spec.js)
- Exclude build artifacts in dist/
@z

@x
Focus on production code only.`;
```
@y
Focus on production code only.`;
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
prompt = """Analyze code quality but only consider:
- Files in src/**/*.js
- Exclude test files (*.test.js, *.spec.js)
- Exclude build artifacts in dist/
@y
```python
prompt = """Analyze code quality but only consider:
- Files in src/**/*.js
- Exclude test files (*.test.js, *.spec.js)
- Exclude build artifacts in dist/
@z

@x
Focus on production code only."""
```
@y
Focus on production code only."""
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Set quality thresholds
@y
### Set quality thresholds
@z

@x
Define when PRs should be created:
@y
Define when PRs should be created:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
const prompt = `Quality gate thresholds:
- Only create PR if:
  * Bug count decreases by at least 1
  * No new security vulnerabilities introduced
  * Code coverage does not decrease
  * Technical debt reduces by at least 15 minutes
@y
```typescript
const prompt = `Quality gate thresholds:
- Only create PR if:
  * Bug count decreases by at least 1
  * No new security vulnerabilities introduced
  * Code coverage does not decrease
  * Technical debt reduces by at least 15 minutes
@z

@x
If changes do not meet these thresholds, explain why and skip PR creation.`;
```
@y
If changes do not meet these thresholds, explain why and skip PR creation.`;
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
prompt = """Quality gate thresholds:
- Only create PR if:
  * Bug count decreases by at least 1
  * No new security vulnerabilities introduced
  * Code coverage does not decrease
  * Technical debt reduces by at least 15 minutes
@y
```python
prompt = """Quality gate thresholds:
- Only create PR if:
  * Bug count decreases by at least 1
  * No new security vulnerabilities introduced
  * Code coverage does not decrease
  * Technical debt reduces by at least 15 minutes
@z

@x
If changes do not meet these thresholds, explain why and skip PR creation."""
```
@y
If changes do not meet these thresholds, explain why and skip PR creation."""
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Next steps
@y
### Next steps
@z

@x
Learn how to troubleshoot common issues.
@y
Learn how to troubleshoot common issues.
@z

@x
## Troubleshoot code quality workflows
@y
## Troubleshoot code quality workflows
@z

@x
This page covers common issues you might encounter when building code quality
workflows with E2B sandboxes and MCP servers, along with their solutions.
@y
This page covers common issues you might encounter when building code quality
workflows with E2B sandboxes and MCP servers, along with their solutions.
@z

@x
If you're experiencing problems not covered here, check the
[E2B documentation](https://e2b.dev/docs).
@y
If you're experiencing problems not covered here, check the
[E2B documentation](https://e2b.dev/docs).
@z

@x
### MCP tools not available
@y
### MCP tools not available
@z

@x
Issue: Claude reports `I don't have any MCP tools available`.
@y
Issue: Claude reports `I don't have any MCP tools available`.
@z

@x
Solution:
@y
Solution:
@z

@x
1.  Verify you're using the authorization header:
@y
1.  Verify you're using the authorization header:
@z

@x
    ```plaintext
    --header "Authorization: Bearer ${mcpToken}"
    ```
@y
    ```plaintext
    --header "Authorization: Bearer ${mcpToken}"
    ```
@z

@x
2.  Check you're waiting for MCP initialization.
@y
2.  Check you're waiting for MCP initialization.
@z

@x
    ```typescript
    // typescript
    await new Promise((resolve) => setTimeout(resolve, 1000));
    ```
@y
    ```typescript
    // typescript
    await new Promise((resolve) => setTimeout(resolve, 1000));
    ```
@z

@x
    ```python
    # python
    await asyncio.sleep(1)
    ```
@y
    ```python
    # python
    await asyncio.sleep(1)
    ```
@z

@x
3.  Ensure credentials are in both `envs` and `mcp` configuration:
@y
3.  Ensure credentials are in both `envs` and `mcp` configuration:
@z

@x
    ```typescript
    // typescript
    const sbx = await Sandbox.betaCreate({
      envs: {
        ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
        GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
        SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
      },
      mcp: {
        githubOfficial: {
          githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
        },
        sonarqube: {
          org: process.env.SONARQUBE_ORG!,
          token: process.env.SONARQUBE_TOKEN!,
          url: "https://sonarcloud.io",
        },
      },
    });
    ```
@y
    ```typescript
    // typescript
    const sbx = await Sandbox.betaCreate({
      envs: {
        ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
        GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
        SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
      },
      mcp: {
        githubOfficial: {
          githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
        },
        sonarqube: {
          org: process.env.SONARQUBE_ORG!,
          token: process.env.SONARQUBE_TOKEN!,
          url: "https://sonarcloud.io",
        },
      },
    });
    ```
@z

@x
    ```python
    # python
    sbx = await AsyncSandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
            "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
            "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
        },
        mcp={
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
            "sonarqube": {
                "org": os.getenv("SONARQUBE_ORG"),
                "token": os.getenv("SONARQUBE_TOKEN"),
                "url": "https://sonarcloud.io",
            },
        },
    )
    ```
@y
    ```python
    # python
    sbx = await AsyncSandbox.beta_create(
        envs={
            "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
            "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
            "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
        },
        mcp={
            "githubOfficial": {
                "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
            },
            "sonarqube": {
                "org": os.getenv("SONARQUBE_ORG"),
                "token": os.getenv("SONARQUBE_TOKEN"),
                "url": "https://sonarcloud.io",
            },
        },
    )
    ```
@z

@x
4.  Verify your API tokens are valid and have proper scopes.
@y
4.  Verify your API tokens are valid and have proper scopes.
@z

@x
### GitHub tools work but SonarQube doesn't
@y
### GitHub tools work but SonarQube doesn't
@z

@x
Issue: GitHub MCP tools load but SonarQube tools don't appear.
@y
Issue: GitHub MCP tools load but SonarQube tools don't appear.
@z

@x
Solution: SonarQube MCP server requires GitHub to be configured simultaneously.
Always include both servers in your sandbox configuration, even if you're only
testing one.
@y
Solution: SonarQube MCP server requires GitHub to be configured simultaneously.
Always include both servers in your sandbox configuration, even if you're only
testing one.
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
// Include both servers even if only using one
const sbx = await Sandbox.betaCreate({
  envs: {
    ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
    GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
    SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
  },
  mcp: {
    githubOfficial: {
      githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
    },
    sonarqube: {
      org: process.env.SONARQUBE_ORG!,
      token: process.env.SONARQUBE_TOKEN!,
      url: "https://sonarcloud.io",
    },
  },
});
```
@y
```typescript
// Include both servers even if only using one
const sbx = await Sandbox.betaCreate({
  envs: {
    ANTHROPIC_API_KEY: process.env.ANTHROPIC_API_KEY!,
    GITHUB_TOKEN: process.env.GITHUB_TOKEN!,
    SONARQUBE_TOKEN: process.env.SONARQUBE_TOKEN!,
  },
  mcp: {
    githubOfficial: {
      githubPersonalAccessToken: process.env.GITHUB_TOKEN!,
    },
    sonarqube: {
      org: process.env.SONARQUBE_ORG!,
      token: process.env.SONARQUBE_TOKEN!,
      url: "https://sonarcloud.io",
    },
  },
});
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
# Include both servers even if only using one
sbx = await AsyncSandbox.beta_create(
    envs={
        "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
        "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
        "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
    },
    mcp={
        "githubOfficial": {
            "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
        },
        "sonarqube": {
            "org": os.getenv("SONARQUBE_ORG"),
            "token": os.getenv("SONARQUBE_TOKEN"),
            "url": "https://sonarcloud.io",
        },
    },
)
```
@y
```python
# Include both servers even if only using one
sbx = await AsyncSandbox.beta_create(
    envs={
        "ANTHROPIC_API_KEY": os.getenv("ANTHROPIC_API_KEY"),
        "GITHUB_TOKEN": os.getenv("GITHUB_TOKEN"),
        "SONARQUBE_TOKEN": os.getenv("SONARQUBE_TOKEN"),
    },
    mcp={
        "githubOfficial": {
            "githubPersonalAccessToken": os.getenv("GITHUB_TOKEN"),
        },
        "sonarqube": {
            "org": os.getenv("SONARQUBE_ORG"),
            "token": os.getenv("SONARQUBE_TOKEN"),
            "url": "https://sonarcloud.io",
        },
    },
)
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Claude can't access private repositories
@y
### Claude can't access private repositories
@z

@x
Issue: "I don't have access to that repository".
@y
Issue: "I don't have access to that repository".
@z

@x
Solution:
@y
Solution:
@z

@x
1. Verify your GitHub token has `repo` scope (not just `public_repo`).
2. Test with a public repository first.
3. Ensure the repository owner and name are correct in your `.env`:
@y
1. Verify your GitHub token has `repo` scope (not just `public_repo`).
2. Test with a public repository first.
3. Ensure the repository owner and name are correct in your `.env`:
@z

@x
   {{< tabs group="language" >}}
   {{< tab name="TypeScript" >}}
@y
   {{< tabs group="language" >}}
   {{< tab name="TypeScript" >}}
@z

@x
   ```plaintext
   GITHUB_OWNER=your_github_username
   GITHUB_REPO=your_repository_name
   ```
@y
   ```plaintext
   GITHUB_OWNER=your_github_username
   GITHUB_REPO=your_repository_name
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Python" >}}
@y
   {{< /tab >}}
   {{< tab name="Python" >}}
@z

@x
   ```plaintext
   GITHUB_OWNER=your_github_username
   GITHUB_REPO=your_repository_name
   ```
@y
   ```plaintext
   GITHUB_OWNER=your_github_username
   GITHUB_REPO=your_repository_name
   ```
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
### Workflow times out or runs too long
@y
### Workflow times out or runs too long
@z

@x
Issue: Workflow doesn't complete or Claude credits run out.
@y
Issue: Workflow doesn't complete or Claude credits run out.
@z

@x
Solutions:
@y
Solutions:
@z

@x
1. Use `timeoutMs: 0` (TypeScript) or `timeout_ms=0` (Python) for complex workflows to allow unlimited time:
@y
1. Use `timeoutMs: 0` (TypeScript) or `timeout_ms=0` (Python) for complex workflows to allow unlimited time:
@z

@x
   {{< tabs group="language" >}}
   {{< tab name="TypeScript" >}}
@y
   {{< tabs group="language" >}}
   {{< tab name="TypeScript" >}}
@z

@x
   ```typescript
   await sbx.commands.run(
     `echo '${prompt}' | claude -p --dangerously-skip-permissions`,
     {
       timeoutMs: 0, // No timeout
       onStdout: console.log,
       onStderr: console.log,
     },
   );
   ```
@y
   ```typescript
   await sbx.commands.run(
     `echo '${prompt}' | claude -p --dangerously-skip-permissions`,
     {
       timeoutMs: 0, // No timeout
       onStdout: console.log,
       onStderr: console.log,
     },
   );
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Python" >}}
@y
   {{< /tab >}}
   {{< tab name="Python" >}}
@z

@x
   ```python
   await sbx.commands.run(
       f"echo '{prompt}' | claude -p --dangerously-skip-permissions",
       timeout_ms=0,  # No timeout
       on_stdout=print,
       on_stderr=print,
   )
   ```
@y
   ```python
   await sbx.commands.run(
       f"echo '{prompt}' | claude -p --dangerously-skip-permissions",
       timeout_ms=0,  # No timeout
       on_stdout=print,
       on_stderr=print,
   )
   ```
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
2. Break complex workflows into smaller, focused tasks.
3. Monitor your Anthropic API credit usage.
4. Add checkpoints in prompts: "After each step, show progress before continuing".
@y
2. Break complex workflows into smaller, focused tasks.
3. Monitor your Anthropic API credit usage.
4. Add checkpoints in prompts: "After each step, show progress before continuing".
@z

@x
### Sandbox cleanup errors
@y
### Sandbox cleanup errors
@z

@x
Issue: Sandboxes aren't being cleaned up properly, leading to resource exhaustion.
@y
Issue: Sandboxes aren't being cleaned up properly, leading to resource exhaustion.
@z

@x
Solution: Always use proper error handling with cleanup in the `finally` block:
@y
Solution: Always use proper error handling with cleanup in the `finally` block:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
async function robustWorkflow() {
  let sbx: Sandbox | undefined;
@y
```typescript
async function robustWorkflow() {
  let sbx: Sandbox | undefined;
@z

@x
  try {
    sbx = await Sandbox.betaCreate({
      // ... configuration
    });
@y
  try {
    sbx = await Sandbox.betaCreate({
      // ... configuration
    });
@z

@x
    // ... workflow logic
  } catch (error) {
    console.error("Workflow failed:", error);
    process.exit(1);
  } finally {
    if (sbx) {
      console.log("Cleaning up sandbox...");
      await sbx.kill();
    }
  }
}
```
@y
    // ... workflow logic
  } catch (error) {
    console.error("Workflow failed:", error);
    process.exit(1);
  } finally {
    if (sbx) {
      console.log("Cleaning up sandbox...");
      await sbx.kill();
    }
  }
}
```
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
```python
async def robust_workflow():
    sbx = None
@y
```python
async def robust_workflow():
    sbx = None
@z

@x
    try:
        sbx = await AsyncSandbox.beta_create(
            # ... configuration
        )
@y
    try:
        sbx = await AsyncSandbox.beta_create(
            # ... configuration
        )
@z

@x
        # ... workflow logic
@y
        # ... workflow logic
@z

@x
    except Exception as error:
        print(f"Workflow failed: {error}")
        sys.exit(1)
    finally:
        if sbx:
            print("Cleaning up sandbox...")
            await sbx.kill()
```
@y
    except Exception as error:
        print(f"Workflow failed: {error}")
        sys.exit(1)
    finally:
        if sbx:
            print("Cleaning up sandbox...")
            await sbx.kill()
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Environment variable not loading
@y
### Environment variable not loading
@z

@x
Issue: Script fails with "undefined" or "None" for environment variables.
@y
Issue: Script fails with "undefined" or "None" for environment variables.
@z

@x
Solution:
@y
Solution:
@z

@x
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs group="language" >}}
{{< tab name="TypeScript" >}}
@z

@x
1. Ensure `dotenv` is loaded at the top of your file:
@y
1. Ensure `dotenv` is loaded at the top of your file:
@z

@x
   ```typescript
   import "dotenv/config";
   ```
@y
   ```typescript
   import "dotenv/config";
   ```
@z

@x
2. Verify the `.env` file is in the same directory as your script.
@y
2. Verify the `.env` file is in the same directory as your script.
@z

@x
3. Check variable names match exactly (case-sensitive):
@y
3. Check variable names match exactly (case-sensitive):
@z

@x
   ```typescript
   // .env file
   GITHUB_TOKEN = ghp_xxxxx;
@y
   ```typescript
   // .env file
   GITHUB_TOKEN = ghp_xxxxx;
@z

@x
   // In code
   process.env.GITHUB_TOKEN; // Correct
   process.env.github_token; // Wrong - case doesn't match
   ```
@y
   // In code
   process.env.GITHUB_TOKEN; // Correct
   process.env.github_token; // Wrong - case doesn't match
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Python" >}}
   1. Ensure `dotenv` is loaded at the top of your file:
@y
   {{< /tab >}}
   {{< tab name="Python" >}}
   1. Ensure `dotenv` is loaded at the top of your file:
@z

@x
      ```python
      from dotenv import load_dotenv
      load_dotenv()
      ```
@y
      ```python
      from dotenv import load_dotenv
      load_dotenv()
      ```
@z

@x
   2. Verify the `.env` file is in the same directory as your script.
@y
   2. Verify the `.env` file is in the same directory as your script.
@z

@x
   3. Check variable names match exactly (case-sensitive):
@y
   3. Check variable names match exactly (case-sensitive):
@z

@x
      ```python
      # .env file
      GITHUB_TOKEN=ghp_xxxxx
@y
      ```python
      # .env file
      GITHUB_TOKEN=ghp_xxxxx
@z

@x
      # In code
      os.getenv("GITHUB_TOKEN")  # Correct
      os.getenv("github_token")  # Wrong - case doesn't match
      ```
@y
      # In code
      os.getenv("GITHUB_TOKEN")  # Correct
      os.getenv("github_token")  # Wrong - case doesn't match
      ```
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
### SonarQube returns empty results
@y
### SonarQube returns empty results
@z

@x
Issue: SonarQube analysis returns no projects or issues.
@y
Issue: SonarQube analysis returns no projects or issues.
@z

@x
Solution:
@y
Solution:
@z

@x
1. Verify your SonarCloud organization key is correct.
2. Ensure you have at least one project configured in SonarCloud.
3. Check that your SonarQube token has the necessary permissions.
4. Confirm your project has been analyzed at least once in SonarCloud.
@y
1. Verify your SonarCloud organization key is correct.
2. Ensure you have at least one project configured in SonarCloud.
3. Check that your SonarQube token has the necessary permissions.
4. Confirm your project has been analyzed at least once in SonarCloud.
@z
