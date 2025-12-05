%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
description: Learn how to use Claude Code with Docker MCP Toolkit to generate production-ready Docker Compose files from natural language using the Docker Hub MCP server.
keywords: mcp, model context protocol, docker, docker desktop, claude code, docker hub, compose, automation
title: Generate Docker Compose Files with Claude Code and Docker MCP Toolkit
summary: |
  This guide shows how to wire Claude Code to the Docker MCP Toolkit so it can search Docker Hub images and generate complete Docker Compose stacks from natural language.
  You’ll enable the Docker Hub MCP server, connect Claude Code, verify MCP access, and create a Node.js + PostgreSQL stack with a conversational prompt.
@y
description: Learn how to use Claude Code with Docker MCP Toolkit to generate production-ready Docker Compose files from natural language using the Docker Hub MCP server.
keywords: mcp, model context protocol, docker, docker desktop, claude code, docker hub, compose, automation
title: Generate Docker Compose Files with Claude Code and Docker MCP Toolkit
summary: |
  This guide shows how to wire Claude Code to the Docker MCP Toolkit so it can search Docker Hub images and generate complete Docker Compose stacks from natural language.
  You’ll enable the Docker Hub MCP server, connect Claude Code, verify MCP access, and create a Node.js + PostgreSQL stack with a conversational prompt.
@z

@x
  time: 15 minutes
@y
  time: 15 分
@z

@x
This guide introduces how to use Claude Code together with Docker MCP Toolkit so Claude can search Docker Hub in real time and generate a complete `docker-compose.yaml` from natural language.
@y
This guide introduces how to use Claude Code together with Docker MCP Toolkit so Claude can search Docker Hub in real time and generate a complete `docker-compose.yaml` from natural language.
@z

@x
Instead of manually writing YAML or looking for image tags, you describe your stack once — Claude uses the Model Context Protocol (MCP) to query Docker Hub and build a production-ready Compose file.
@y
Instead of manually writing YAML or looking for image tags, you describe your stack once — Claude uses the Model Context Protocol (MCP) to query Docker Hub and build a production-ready Compose file.
@z

@x
In this guide, you’ll learn how to:
@y
In this guide, you’ll learn how to:
@z

@x
- Enable Docker MCP Toolkit in Docker Desktop  
- Add the Docker Hub MCP server  
- Connect Claude Code to the MCP Gateway (GUI or CLI)  
- Verify MCP connectivity inside Claude  
- Ask Claude to generate and save a Compose file for a Node.js + PostgreSQL app  
- Deploy it instantly with `docker compose up`  
@y
- Enable Docker MCP Toolkit in Docker Desktop  
- Add the Docker Hub MCP server  
- Connect Claude Code to the MCP Gateway (GUI or CLI)  
- Verify MCP connectivity inside Claude  
- Ask Claude to generate and save a Compose file for a Node.js + PostgreSQL app  
- Deploy it instantly with `docker compose up`  
@z

@x
## Use Claude Code and Docker MCP Toolkit to generate a Docker Compose file from natural language
@y
## Use Claude Code and Docker MCP Toolkit to generate a Docker Compose file from natural language
@z

@x
- **Setup**: Enable MCP Toolkit → Add Docker Hub MCP server → Connect Claude Code  
- **Use Claude**: Describe your stack in plain English  
- **Automate**: Claude queries Docker Hub via MCP and builds a complete `docker-compose.yaml`  
- **Deploy**: Run `docker compose up` → Node.js + PostgreSQL live on `localhost:3000`  
- **Benefit**: Zero YAML authoring. Zero image searching. Describe once → Claude builds it.
@y
- **Setup**: Enable MCP Toolkit → Add Docker Hub MCP server → Connect Claude Code  
- **Use Claude**: Describe your stack in plain English  
- **Automate**: Claude queries Docker Hub via MCP and builds a complete `docker-compose.yaml`  
- **Deploy**: Run `docker compose up` → Node.js + PostgreSQL live on `localhost:3000`  
- **Benefit**: Zero YAML authoring. Zero image searching. Describe once → Claude builds it.
@z

@x
**Estimated time**: ~15 minutes
@y
**Estimated time**: ~15 minutes
@z

@x
## 1. What you are building
@y
## 1. What you are building
@z

@x
The goal is simple: use Claude Code together with the Docker MCP Toolkit to search Docker Hub images and generate a complete Docker Compose file for a Node.js and PostgreSQL setup. 
@y
The goal is simple: use Claude Code together with the Docker MCP Toolkit to search Docker Hub images and generate a complete Docker Compose file for a Node.js and PostgreSQL setup. 
@z

@x
The Model Context Protocol (MCP) bridges Claude Code and Docker Desktop, giving Claude real-time access to Docker's tools. Instead of context-switching between Docker, terminal commands, and YAML editors, you describe your requirements once and Claude handles the infrastructure details.
@y
The Model Context Protocol (MCP) bridges Claude Code and Docker Desktop, giving Claude real-time access to Docker's tools. Instead of context-switching between Docker, terminal commands, and YAML editors, you describe your requirements once and Claude handles the infrastructure details.
@z

@x
**Why this matters:** This pattern scales to complex multi-service setups, database migrations, networking, security policies — all through conversational prompts.
@y
**Why this matters:** This pattern scales to complex multi-service setups, database migrations, networking, security policies — all through conversational prompts.
@z

@x
## 2. Prerequisites
@y
## 2. Prerequisites
@z

@x
Make sure you have:
@y
Make sure you have:
@z

@x
- Docker Desktop installed
- Enable Docker Desktop updated with [MCP Toolkit](https://docs.docker.com/ai/mcp-catalog-and-toolkit/get-started/#setup) support
@y
- Docker Desktop installed
- Enable Docker Desktop updated with [MCP Toolkit](https://docs.docker.com/ai/mcp-catalog-and-toolkit/get-started/#setup) support
@z

@x
- Claude Code installed
@y
- Claude Code installed
@z

@x
## 3. Install the Docker Hub MCP server
@y
## 3. Install the Docker Hub MCP server
@z

@x
1. Open **Docker Desktop**  
1. Select **MCP Toolkit**  
1. Go to the **Catalog** tab  
1. Search for **Docker Hub**  
1. Select the **Docker Hub**MCP server
1. Add the MCP server, then open the **Configuration** tab
1. Enter your Docker Hub username
1. [Create a read-only personal access token](/security/access-tokens/#create-a-personal-access-token) and enter your access token under **Secrets**
1. Save the configuration
@y
1. Open **Docker Desktop**  
1. Select **MCP Toolkit**  
1. Go to the **Catalog** tab  
1. Search for **Docker Hub**  
1. Select the **Docker Hub**MCP server
1. Add the MCP server, then open the **Configuration** tab
1. Enter your Docker Hub username
1. [Create a read-only personal access token](__SUBDIR__/security/access-tokens/#create-a-personal-access-token) and enter your access token under **Secrets**
1. Save the configuration
@z

@x
![Docker Hub](./Images/catalog_docker_hub.avif "Docker Hub")
@y
![Docker Hub](./Images/catalog_docker_hub.avif "Docker Hub")
@z

@x
Public images work without credentials. For private repositories, you can add your Docker Hub username and token later.
@y
Public images work without credentials. For private repositories, you can add your Docker Hub username and token later.
@z

@x
![Docker Hub Secrets](./Images/dockerhub_secrets.avif "Docker Hub Secrets")
@y
![Docker Hub Secrets](./Images/dockerhub_secrets.avif "Docker Hub Secrets")
@z

@x
## 4. Connect Claude Code to Docker MCP Toolkit
@y
## 4. Connect Claude Code to Docker MCP Toolkit
@z

@x
You can connect from Docker Desktop or using the CLI.
@y
You can connect from Docker Desktop or using the CLI.
@z

@x
### Option A. Connect with Docker Desktop
@y
### Option A. Connect with Docker Desktop
@z

@x
1. Open **MCP Toolkit**  
1. Go to the **Clients** tab  
1. Locate **Claude Code**  
1. Select **Connect**
@y
1. Open **MCP Toolkit**  
1. Go to the **Clients** tab  
1. Locate **Claude Code**  
1. Select **Connect**
@z

@x
![Docker Connection](./Images/docker-connect-claude.avif)
@y
![Docker Connection](./Images/docker-connect-claude.avif)
@z

@x
### Option B. Connect using the CLI
@y
### Option B. Connect using the CLI
@z

% snip command...

@x
## 5. Verify MCP servers inside Claude Code
@y
## 5. Verify MCP servers inside Claude Code
@z

@x
1. Navigate to your project folder:
@y
1. Navigate to your project folder:
@z

% snip command...

@x
1. Start Claude Code:
@y
1. Start Claude Code:
@z

% snip command...

@x
1. In the input box, type:
@y
1. In the input box, type:
@z

% snip input...

@x
You should now see:
@y
You should now see:
@z

@x
- The MCP gateway (for example `MCP_DOCKER`)
- Tools provided by the Docker Hub MCP server
@y
- The MCP gateway (for example `MCP_DOCKER`)
- Tools provided by the Docker Hub MCP server
@z

@x
![mcp-docker](./Images/mcp-servers.avif)
@y
![mcp-docker](./Images/mcp-servers.avif)
@z

@x
If not, restart Claude Code or check Docker Desktop to confirm the connection.
@y
If not, restart Claude Code or check Docker Desktop to confirm the connection.
@z

@x
## 6. Create a basic Node.js app
@y
## 6. Create a basic Node.js app
@z

@x
Claude Code generates more accurate Compose files when it can inspect a real project. Set up the application code now so the agent can bind mount it later.
@y
Claude Code generates more accurate Compose files when it can inspect a real project. Set up the application code now so the agent can bind mount it later.
@z

@x
Inside project folder, create a folder named `app`:
@y
Inside project folder, create a folder named `app`:
@z

% snip command...

@x
Create `index.js`:
@y
Create `index.js`:
@z

% snip code...

@x
Add a start script to `package.json`:
@y
Add a start script to `package.json`:
@z

% snip code...

@x
Return to your project root (`cd ..`) once the app is ready.
@y
Return to your project root (`cd ..`) once the app is ready.
@z

@x
## 7. Ask Claude Code to design your Docker Compose stack
@y
## 7. Ask Claude Code to design your Docker Compose stack
@z

@x
Paste this message into Claude Code:
@y
Paste this message into Claude Code:
@z

% snip text...

@x
Claude will search images through MCP, inspect the `app` directory, and generate a Compose file that mounts and runs your local code.
@y
Claude will search images through MCP, inspect the `app` directory, and generate a Compose file that mounts and runs your local code.
@z

@x
## 8. Save the generated Docker Compose file
@y
## 8. Save the generated Docker Compose file
@z

@x
Tell Claude:
@y
Tell Claude:
@z

% snip text...

@x
You should see something like this:
@y
You should see something like this:
@z

% snip code...

@x
## 9. Run the Docker Compose stack
@y
## 9. Run the Docker Compose stack
@z

@x
From your project root:
@y
From your project root:
@z

% snip command...

@x
Docker will:
@y
Docker will:
@z

@x
- Pull the Node and Postgres images selected through Docker Hub MCP  
- Create networks and volumes  
- Start the containers  
@y
- Pull the Node and Postgres images selected through Docker Hub MCP  
- Create networks and volumes  
- Start the containers  
@z

@x
Open your browser:
@y
Open your browser:
@z

% snip command...

@x
Your Node.js app should now be running.
@y
Your Node.js app should now be running.
@z

@x
## Conclusion
@y
## Conclusion
@z

@x
By combining Claude Code with the Docker MCP Toolkit, Docker Desktop, and the Docker Hub MCP server, you can describe your stack in natural language and let MCP handle the details. This removes context switching and replaces it with a smooth, guided workflow powered by model context protocol integrations.
@y
By combining Claude Code with the Docker MCP Toolkit, Docker Desktop, and the Docker Hub MCP server, you can describe your stack in natural language and let MCP handle the details. This removes context switching and replaces it with a smooth, guided workflow powered by model context protocol integrations.
@z

@x
### Next steps
@y
### Next steps
@z

@x
- Explore the 220+ MCP servers available in the [Docker MCP catalog](https://hub.docker.com/mcp)
- Connect Claude Code to your databases, internal APIs, and team tools  
- Share your MCP setup with your team so everyone works consistently  
@y
- Explore the 220+ MCP servers available in the [Docker MCP catalog](https://hub.docker.com/mcp)
- Connect Claude Code to your databases, internal APIs, and team tools  
- Share your MCP setup with your team so everyone works consistently  
@z

@x
The future of development is not about switching between tools. It is about tools working together in a simple, safe, and predictable way. The Docker MCP Toolkit brings that future into your everyday workflow.
@y
The future of development is not about switching between tools. It is about tools working together in a simple, safe, and predictable way. The Docker MCP Toolkit brings that future into your everyday workflow.
@z

@x
## Learn more
@y
## Learn more
@z

@x
- **[Explore the MCP Catalog](https://hub.docker.com/mcp):** Discover containerized, security-hardened MCP servers  
- **[Get started with MCP Toolkit in Docker Desktop](https://hub.docker.com/open-desktop?url=https://open.docker.com/dashboard/mcp):** Requires version 4.48 or newer to launch automatically  
- **[Read the MCP Horror Stories series](https://www.docker.com/blog/mcp-horror-stories-the-supply-chain-attack/):** Learn about common MCP security pitfalls and how to avoid them  
@y
- **[Explore the MCP Catalog](https://hub.docker.com/mcp):** Discover containerized, security-hardened MCP servers  
- **[Get started with MCP Toolkit in Docker Desktop](https://hub.docker.com/open-desktop?url=https://open.docker.com/dashboard/mcp):** Requires version 4.48 or newer to launch automatically  
- **[Read the MCP Horror Stories series](https://www.docker.com/blog/mcp-horror-stories-the-supply-chain-attack/):** Learn about common MCP security pitfalls and how to avoid them  
@z
