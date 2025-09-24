%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Hub MCP server
linkTitle: Hub MCP server
description: The Docker Hub MCP Server makes Docker Hub image metadata accessible to LLMs for content discovery.
keywords: Docker Hub MCP Server, Hub MCP server, Hub MCP
@y
title: Docker Hub MCP server
linkTitle: Hub MCP server
description: The Docker Hub MCP Server makes Docker Hub image metadata accessible to LLMs for content discovery.
keywords: Docker Hub MCP Server, Hub MCP server, Hub MCP
@z

@x
The Docker Hub MCP Server is a Model Context Protocol (MCP) server that
interfaces with Docker Hub APIs to make rich image metadata accessible to LLMs,
enabling intelligent content discovery and repository management. Developers
building with containers, especially in AI and LLM-powered workflows, often face
inadequate context across the vast landscape of Docker Hub images. As a result,
LLMs struggle to recommend the right images, and developers lose time manually
searching instead of building.
@y
The Docker Hub MCP Server is a Model Context Protocol (MCP) server that
interfaces with Docker Hub APIs to make rich image metadata accessible to LLMs,
enabling intelligent content discovery and repository management. Developers
building with containers, especially in AI and LLM-powered workflows, often face
inadequate context across the vast landscape of Docker Hub images. As a result,
LLMs struggle to recommend the right images, and developers lose time manually
searching instead of building.
@z

@x
## Key features
@y
## Key features
@z

@x
- Advanced LLM context: Docker's MCP Server provides LLMs with detailed, structured context for Docker Hub images, enabling smarter, more relevant recommendations for developers, whether they're choosing a base image or automating CI/CD workflows.
- Natural language image discovery: Developers can find the right container image using natural language, no need to remember tags or repository names. Just describe what you need, and Docker Hub will return images that match your intent.
- Simplified repository management: Hub MCP Server enables agents to manage repositories through natural language fetching image details, viewing stats, searching content, and performing key operations quickly and easily.
@y
- Advanced LLM context: Docker's MCP Server provides LLMs with detailed, structured context for Docker Hub images, enabling smarter, more relevant recommendations for developers, whether they're choosing a base image or automating CI/CD workflows.
- Natural language image discovery: Developers can find the right container image using natural language, no need to remember tags or repository names. Just describe what you need, and Docker Hub will return images that match your intent.
- Simplified repository management: Hub MCP Server enables agents to manage repositories through natural language fetching image details, viewing stats, searching content, and performing key operations quickly and easily.
@z

@x
## Install Docker Hub MCP server
@y
## Install Docker Hub MCP server
@z

@x
1. From the **MCP Toolkit** menu, select the **Catalog** tab and search for **Docker Hub** and select the plus icon to add the Docker Hub MCP server.
1. In the server's **Configuration** tab, insert your Docker Hub username and personal access token (PAT).
1. In the **Clients** tab in MCP Toolkit, ensure Gordon is connected.
1. From the **Ask Gordon** menu, you can now send requests related to your
   Docker Hub account, in accordance to the tools provided by the Docker Hub MCP server. To test it, ask Gordon:
@y
1. From the **MCP Toolkit** menu, select the **Catalog** tab and search for **Docker Hub** and select the plus icon to add the Docker Hub MCP server.
1. In the server's **Configuration** tab, insert your Docker Hub username and personal access token (PAT).
1. In the **Clients** tab in MCP Toolkit, ensure Gordon is connected.
1. From the **Ask Gordon** menu, you can now send requests related to your
   Docker Hub account, in accordance to the tools provided by the Docker Hub MCP server. To test it, ask Gordon:
@z

@x
   ```text
   What repositories are in my namespace?
   ```
@y
   ```text
   What repositories are in my namespace?
   ```
@z

@x
> [!TIP]
> By default, the Gordon [client](/manuals/ai/mcp-catalog-and-toolkit/toolkit.md#install-an-mcp-client) is enabled,
> which means Gordon can automatically interact with your MCP servers.
@y
> [!TIP]
> By default, the Gordon [client](manuals/ai/mcp-catalog-and-toolkit/toolkit.md#install-an-mcp-client) is enabled,
> which means Gordon can automatically interact with your MCP servers.
@z

@x
## Use Claude Desktop as a client
@y
## Use Claude Desktop as a client
@z

@x
1. Add the Docker Hub MCP Server configuration to your `claude_desktop_config.json`:
@y
1. Add the Docker Hub MCP Server configuration to your `claude_desktop_config.json`:
@z

@x
   {{< tabs >}}
   {{< tab name="For public repositories only">}}
@y
   {{< tabs >}}
   {{< tab name="For public repositories only">}}
@z

@x
   ```json
   {
     "mcpServers": {
       "docker-hub": {
         "command": "node",
         "args": ["/FULL/PATH/TO/YOUR/docker-hub-mcp-server/dist/index.js", "--transport=stdio"]
       }
     }
   }
   ```
@y
   ```json
   {
     "mcpServers": {
       "docker-hub": {
         "command": "node",
         "args": ["/FULL/PATH/TO/YOUR/docker-hub-mcp-server/dist/index.js", "--transport=stdio"]
       }
     }
   }
   ```
@z

@x
   Where :
   - `/FULL/PATH/TO/YOUR/docker-hub-mcp-server` is the complete path to where you cloned the repository
@y
   Where :
   - `/FULL/PATH/TO/YOUR/docker-hub-mcp-server` is the complete path to where you cloned the repository
@z

@x
   {{< /tab >}}
   {{< tab name="For authenticated access">}}
@y
   {{< /tab >}}
   {{< tab name="For authenticated access">}}
@z

@x
   ```json
   {
     "mcpServers": {
       "docker-hub": {
         "command": "node",
         "args": ["/FULL/PATH/TO/YOUR/docker-hub-mcp-server/dist/index.js", "--transport=stdio", "--username=YOUR_DOCKER_HUB_USERNAME"],
         "env": {
           "HUB_PAT_TOKEN": "YOUR_DOCKER_HUB_PERSONAL_ACCESS_TOKEN"
         }
       }
     }
   }
   ```
@y
   ```json
   {
     "mcpServers": {
       "docker-hub": {
         "command": "node",
         "args": ["/FULL/PATH/TO/YOUR/docker-hub-mcp-server/dist/index.js", "--transport=stdio", "--username=YOUR_DOCKER_HUB_USERNAME"],
         "env": {
           "HUB_PAT_TOKEN": "YOUR_DOCKER_HUB_PERSONAL_ACCESS_TOKEN"
         }
       }
     }
   }
   ```
@z

@x
   Where :
   - `YOUR_DOCKER_HUB_USERNAME` is your Docker Hub username.
   - `YOUR_DOCKER_HUB_PERSONAL_ACCESS_TOKEN` is Docker Hub personal access token
   - `/FULL/PATH/TO/YOUR/docker-hub-mcp-server` is the complete path to where you cloned the repository
@y
   Where :
   - `YOUR_DOCKER_HUB_USERNAME` is your Docker Hub username.
   - `YOUR_DOCKER_HUB_PERSONAL_ACCESS_TOKEN` is Docker Hub personal access token
   - `/FULL/PATH/TO/YOUR/docker-hub-mcp-server` is the complete path to where you cloned the repository
@z

@x
   {{< /tab >}}
   {{</tabs >}}
@y
   {{< /tab >}}
   {{</tabs >}}
@z

@x
1. Save the configuration file and completely restart Claude Desktop for the changes to take effect.
@y
1. Save the configuration file and completely restart Claude Desktop for the changes to take effect.
@z

@x
## Usage with Visual Studio Code
@y
## Usage with Visual Studio Code
@z

@x
1. Add the Docker Hub MCP Server configuration to your User Settings (JSON)
   file in Visual Studio Code. You can do this by opening the `Command Palette` and
   typing `Preferences: Open User Settings (JSON)`.
@y
1. Add the Docker Hub MCP Server configuration to your User Settings (JSON)
   file in Visual Studio Code. You can do this by opening the `Command Palette` and
   typing `Preferences: Open User Settings (JSON)`.
@z

@x
   {{< tabs >}}
   {{< tab name="For public repositories only">}}
@y
   {{< tabs >}}
   {{< tab name="For public repositories only">}}
@z

@x
   ```json
   {
     "mcpServers": {
       "docker-hub": {
         "command": "node",
         "args": ["/FULL/PATH/TO/YOUR/docker-hub-mcp-server/dist/index.js", "--transport=stdio"]
       }
     }
   }
   ```
@y
   ```json
   {
     "mcpServers": {
       "docker-hub": {
         "command": "node",
         "args": ["/FULL/PATH/TO/YOUR/docker-hub-mcp-server/dist/index.js", "--transport=stdio"]
       }
     }
   }
   ```
@z

@x
   Where :
   - `/FULL/PATH/TO/YOUR/docker-hub-mcp-server` is the complete path to where you cloned the repository
@y
   Where :
   - `/FULL/PATH/TO/YOUR/docker-hub-mcp-server` is the complete path to where you cloned the repository
@z

@x
   {{< /tab >}}
   {{< tab name="For authenticated access">}}
@y
   {{< /tab >}}
   {{< tab name="For authenticated access">}}
@z

@x
   ```json
   {
     "mcpServers": {
       "docker-hub": {
         "command": "node",
         "args": ["/FULL/PATH/TO/YOUR/docker-hub-mcp-server/dist/index.js", "--transport=stdio"],
         "env": {
           "HUB_USERNAME": "YOUR_DOCKER_HUB_USERNAME",
           "HUB_PAT_TOKEN": "YOUR_DOCKER_HUB_PERSONAL_ACCESS_TOKEN"
         }
       }
     }
   }
   ```
@y
   ```json
   {
     "mcpServers": {
       "docker-hub": {
         "command": "node",
         "args": ["/FULL/PATH/TO/YOUR/docker-hub-mcp-server/dist/index.js", "--transport=stdio"],
         "env": {
           "HUB_USERNAME": "YOUR_DOCKER_HUB_USERNAME",
           "HUB_PAT_TOKEN": "YOUR_DOCKER_HUB_PERSONAL_ACCESS_TOKEN"
         }
       }
     }
   }
   ```
@z

@x
   Where :
   - `YOUR_DOCKER_HUB_USERNAME` is your Docker Hub username.
   - `YOUR_DOCKER_HUB_PERSONAL_ACCESS_TOKEN` is Docker Hub personal access token
   - `/FULL/PATH/TO/YOUR/docker-hub-mcp-server` is the complete path to where you cloned the repository
@y
   Where :
   - `YOUR_DOCKER_HUB_USERNAME` is your Docker Hub username.
   - `YOUR_DOCKER_HUB_PERSONAL_ACCESS_TOKEN` is Docker Hub personal access token
   - `/FULL/PATH/TO/YOUR/docker-hub-mcp-server` is the complete path to where you cloned the repository
@z

@x
   {{< /tab >}}
   {{</tabs >}}
@y
   {{< /tab >}}
   {{</tabs >}}
@z

@x
1. Open the `Command Palette` and type `MCP: List Servers`.
1. Select `docker-hub` and select `Start Server`.
@y
1. Open the `Command Palette` and type `MCP: List Servers`.
1. Select `docker-hub` and select `Start Server`.
@z

@x
## Using other clients
@y
## Using other clients
@z

@x
To integrate the Docker Hub MCP Server into your own development
environment, see the source code and installation instructions on the
[`hub-mcp` GitHub repository](https://github.com/docker/hub-mcp).
@y
To integrate the Docker Hub MCP Server into your own development
environment, see the source code and installation instructions on the
[`hub-mcp` GitHub repository](https://github.com/docker/hub-mcp).
@z

@x
## Usage examples
@y
## Usage examples
@z

@x
This section provides task-oriented examples for common operations with Docker Hub
tools.
@y
This section provides task-oriented examples for common operations with Docker Hub
tools.
@z

@x
### Finding images
@y
### Finding images
@z

@x
```console
# Search for official images
$ docker ai "Search for official nginx images on Docker Hub"
@y
```console
# Search for official images
$ docker ai "Search for official nginx images on Docker Hub"
@z

@x
# Search for lightweight images to reduce deployment size and improve performance
$ docker ai "Search for minimal Node.js images with small footprint"
@y
# Search for lightweight images to reduce deployment size and improve performance
$ docker ai "Search for minimal Node.js images with small footprint"
@z

@x
# Get the most recent tag of a base image
$ docker ai "Show me the latest tag details for go"
@y
# Get the most recent tag of a base image
$ docker ai "Show me the latest tag details for go"
@z

@x
# Find a production-ready database with enterprise features and reliability
$ docker ai "Search for production ready database images"
@y
# Find a production-ready database with enterprise features and reliability
$ docker ai "Search for production ready database images"
@z

@x
# Compare Ubuntu versions to choose the right one for my project
$ docker ai "Help me find the right Ubuntu version for my project"
```
@y
# Compare Ubuntu versions to choose the right one for my project
$ docker ai "Help me find the right Ubuntu version for my project"
```
@z

@x
### Repository management
@y
### Repository management
@z

@x
```console
# Create a repository
$ docker ai "Create a repository in my namespace"
@y
```console
# Create a repository
$ docker ai "Create a repository in my namespace"
@z

@x
# List all repositories in my namespace
$ docker ai "List all repositories in my namespace"
@y
# List all repositories in my namespace
$ docker ai "List all repositories in my namespace"
@z

@x
# Find the largest repository in my namespace
$ docker ai "Which of my repositories takes up the most space?"
@y
# Find the largest repository in my namespace
$ docker ai "Which of my repositories takes up the most space?"
@z

@x
# Find repositories that haven't been updated recently
$ docker ai "Which of my repositories haven't had any pushes in the last 60 days?"
@y
# Find repositories that haven't been updated recently
$ docker ai "Which of my repositories haven't had any pushes in the last 60 days?"
@z

@x
# Find which repositories are currently active and being used
$ docker ai "Show me my most recently updated repositories"
@y
# Find which repositories are currently active and being used
$ docker ai "Show me my most recently updated repositories"
@z

@x
# Get details about a repository
$ docker ai "Show me information about my '<repository-name>' repository"
```
@y
# Get details about a repository
$ docker ai "Show me information about my '<repository-name>' repository"
```
@z

@x
### Pull/push images
@y
### Pull/push images
@z

@x
```console
# Pull latest PostgreSQL version
$ docker ai "Pull the latest postgres image"
@y
```console
# Pull latest PostgreSQL version
$ docker ai "Pull the latest postgres image"
@z

@x
# Push image to your Docker Hub repository
$ docker ai "Push my <image-name> to my <repository-name> repository"
```
@y
# Push image to your Docker Hub repository
$ docker ai "Push my <image-name> to my <repository-name> repository"
```
@z

@x
### Tag management
@y
### Tag management
@z

@x
```console
# List all tags for a repository
$ $ docker ai "Show me all tags for my '<repository-name>' repository"
@y
```console
# List all tags for a repository
$ $ docker ai "Show me all tags for my '<repository-name>' repository"
@z

@x
# Find the most recently pushed tag
$ docker ai "What's the most recent tag pushed to my '<repository-name>' repository?"
@y
# Find the most recently pushed tag
$ docker ai "What's the most recent tag pushed to my '<repository-name>' repository?"
@z

@x
# List tags with architecture filtering
$ docker ai "List tags for in the '<repository-name>' repository that support amd64 architecture"
@y
# List tags with architecture filtering
$ docker ai "List tags for in the '<repository-name>' repository that support amd64 architecture"
@z

@x
# Get detailed information about a specific tag
$ docker ai "Show me details about the '<tag-name>' tag in the '<repository-name>' repository"
@y
# Get detailed information about a specific tag
$ docker ai "Show me details about the '<tag-name>' tag in the '<repository-name>' repository"
@z

@x
# Check if a specific tag exists
$ docker ai "Check if version 'v1.2.0' exists for my 'my-web-app' repository"
```
@y
# Check if a specific tag exists
$ docker ai "Check if version 'v1.2.0' exists for my 'my-web-app' repository"
```
@z

@x
### Docker Hardened Images
@y
### Docker Hardened Images
@z

@x
```console
# List available hardened images
$ docker ai "What is the most secure image I can use to run a node.js application?"
@y
```console
# List available hardened images
$ docker ai "What is the most secure image I can use to run a node.js application?"
@z

@x
# Convert Dockerfile to use a hardened image
$ docker ai "Can you help me update my Dockerfile to use a docker hardened image instead of the current one"
```
> [!NOTE]
> To access Docker Hardened Images, a subscription is required. If you're interested in using Docker Hardened Images, visit [Docker Hardened Images](https://www.docker.com/products/hardened-images/).
@y
# Convert Dockerfile to use a hardened image
$ docker ai "Can you help me update my Dockerfile to use a docker hardened image instead of the current one"
```
> [!NOTE]
> To access Docker Hardened Images, a subscription is required. If you're interested in using Docker Hardened Images, visit [Docker Hardened Images](https://www.docker.com/products/hardened-images/).
@z

@x
## Reference
@y
## Reference
@z

@x
This section provides a comprehensive listing of the tools you can find
in the Docker Hub MCP Server.
@y
This section provides a comprehensive listing of the tools you can find
in the Docker Hub MCP Server.
@z

@x
### Docker Hub MCP server tools
@y
### Docker Hub MCP server tools
@z

@x
Tools to interact with your Docker repositories and discover content on Docker Hub.
@y
Tools to interact with your Docker repositories and discover content on Docker Hub.
@z

@x
| Name | Description |
|------|-------------|
| `check-repository` | Check repository |
| `check-repository-tag` | Check repository tag |
| `check-repository-tags` | Check repository tags |
| `create-repository` | Creates a new repository |
| `docker-hardened-images` | Lists available [Docker Hardened Images](https://www.docker.com/products/hardened-images/) in specified namespace |
| `get-namespaces` | Get organizations/namespaces for a user |
| `get-repository-dockerfile` | Gets Dockerfile for repository |
| `get-repository-info` | Gets repository info |
| `list-repositories-by-namespace` | Lists repositories under namespace |
| `list-repository-tags` | List repository tags |
| `read-repository-tag` | Read repository tag |
| `search` | Search content on Docker Hub |
| `set-repository-dockerfile` | Sets Dockerfile for repository |
| `update-repository-info` | Updates repository info |
@y
| Name | Description |
|------|-------------|
| `check-repository` | Check repository |
| `check-repository-tag` | Check repository tag |
| `check-repository-tags` | Check repository tags |
| `create-repository` | Creates a new repository |
| `docker-hardened-images` | Lists available [Docker Hardened Images](https://www.docker.com/products/hardened-images/) in specified namespace |
| `get-namespaces` | Get organizations/namespaces for a user |
| `get-repository-dockerfile` | Gets Dockerfile for repository |
| `get-repository-info` | Gets repository info |
| `list-repositories-by-namespace` | Lists repositories under namespace |
| `list-repository-tags` | List repository tags |
| `read-repository-tag` | Read repository tag |
| `search` | Search content on Docker Hub |
| `set-repository-dockerfile` | Sets Dockerfile for repository |
| `update-repository-info` | Updates repository info |
@z
