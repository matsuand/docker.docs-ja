%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Lab: Getting Started with cagent"
linkTitle: "Lab: Getting Started with cagent"
description: |
  Build intelligent multi-agent teams with cagent and Docker in this hands-on
  interactive lab.
summary: |
  Hands-on lab: Create, share, and orchestrate intelligent AI agents using
  cagent, MCP Toolkit, and Docker.
keywords: AI, Docker, cagent, agents, multi-agent, MCP Toolkit, lab, labspace
@y
title: "Lab: Getting Started with cagent"
linkTitle: "Lab: Getting Started with cagent"
description: |
  Build intelligent multi-agent teams with cagent and Docker in this hands-on
  interactive lab.
summary: |
  Hands-on lab: Create, share, and orchestrate intelligent AI agents using
  cagent, MCP Toolkit, and Docker.
keywords: AI, Docker, cagent, agents, multi-agent, MCP Toolkit, lab, labspace
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
    - title: cagent documentation
      url: https://github.com/docker/cagent
    - title: Docker MCP Toolkit
      url: https://docs.docker.com/ai/mcp-catalog-and-toolkit/toolkit/
    - title: Labspace repository
      url: https://github.com/ajeetraina/labspace-cagent
@y
    - title: cagent documentation
      url: https://github.com/docker/cagent
    - title: Docker MCP Toolkit
      url: https://docs.docker.com/ai/mcp-catalog-and-toolkit/toolkit/
    - title: Labspace repository
      url: https://github.com/ajeetraina/labspace-cagent
@z

@x
This lab walks you through building intelligent agents with cagent. You'll learn beginner
agent concepts, then build sophisticated multi-agent teams that handle complex
real-world tasks. Learn how to create, share, and orchestrate AI agents with
Docker.
@y
This lab walks you through building intelligent agents with cagent. You'll learn beginner
agent concepts, then build sophisticated multi-agent teams that handle complex
real-world tasks. Learn how to create, share, and orchestrate AI agents with
Docker.
@z

@x
## What you'll learn
@y
## What you'll learn
@z

@x
- Create simple agents with cagent
- Use built-in generic agentic tools for common tasks
- Integrate MCP servers from the MCP Toolkit
- Share agents using the Docker Registry
- Build multi-agent systems for complex workflows
- Use Docker Model Runner with cagent (preview)
@y
- Create simple agents with cagent
- Use built-in generic agentic tools for common tasks
- Integrate MCP servers from the MCP Toolkit
- Share agents using the Docker Registry
- Build multi-agent systems for complex workflows
- Use Docker Model Runner with cagent (preview)
@z

@x
## Modules
@y
## Modules
@z

@x
| # | Module | Description |
|---|--------|-------------|
| 1 | Introduction | Overview of cagent and intelligent agent concepts |
| 2 | Getting Started | Create your first agent with cagent |
| 3 | Using Built-in Tools | Leverage the generic agentic tools in cagent |
| 4 | Using MCP | Integrate MCP servers from the MCP Toolkit |
| 5 | Sharing Agents | Package and share agents via Docker Registry |
| 6 | Introduction to Sub-agents | Build multi-agent systems with sub-agent orchestration |
| 7 | Conclusion | Summary and next steps |
@y
| # | Module | Description |
|---|--------|-------------|
| 1 | Introduction | Overview of cagent and intelligent agent concepts |
| 2 | Getting Started | Create your first agent with cagent |
| 3 | Using Built-in Tools | Leverage the generic agentic tools in cagent |
| 4 | Using MCP | Integrate MCP servers from the MCP Toolkit |
| 5 | Sharing Agents | Package and share agents via Docker Registry |
| 6 | Introduction to Sub-agents | Build multi-agent systems with sub-agent orchestration |
| 7 | Conclusion | Summary and next steps |
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Latest version of Docker Desktop
- Basic familiarity with Docker
@y
- Latest version of Docker Desktop
- Basic familiarity with Docker
@z

@x
## Launch the lab
@y
## Launch the lab
@z

@x
Start the labspace:
@y
Start the labspace:
@z

@x
```console
$ docker compose -f oci://dockersamples/labspace-cagent up -d
```
@y
```console
$ docker compose -f oci://dockersamples/labspace-cagent up -d
```
@z

@x
Then open your browser to [http://localhost:3030](http://localhost:3030).
@y
Then open your browser to [http://localhost:3030](http://localhost:3030).
@z
