%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: How to build an AI-powered code quality workflow with SonarQube and E2B
linkTitle: Build an AI-powered code quality workflow
summary: Build AI-powered code quality workflows using E2B sandboxes with Docker's MCP catalog to automate GitHub and SonarQube integration.
description: Learn how to create E2B sandboxes with MCP servers, analyze code quality with SonarQube, and generate quality-gated pull requests using GitHub—all through natural language interactions with Claude.
@y
title: How to build an AI-powered code quality workflow with SonarQube and E2B
linkTitle: Build an AI-powered code quality workflow
summary: Build AI-powered code quality workflows using E2B sandboxes with Docker's MCP catalog to automate GitHub and SonarQube integration.
description: Learn how to create E2B sandboxes with MCP servers, analyze code quality with SonarQube, and generate quality-gated pull requests using GitHub—all through natural language interactions with Claude.
@z

@x
  time: 40 minutes
@y
  time: 40 分
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
