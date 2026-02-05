%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: What next after the Docker workshop
@y
title: Docker ワークショップの次にすることは
@z

@x
linkTitle: "Part 9: What next"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop, AI, model runner, MCP, agents, hardened images, security
description: Explore what to do next after completing the Docker workshop, including securing your images, AI development, and language-specific guides.
@y
linkTitle: "9 部: 次は何"
keywords: get started, setup, orientation, quickstart, intro, concepts, containers,
  docker desktop, AI, model runner, MCP, agents, hardened images, security
description: Explore what to do next after completing the Docker workshop, including securing your images, AI development, and language-specific guides.
@z

@x
summary: |
  Now that you've completed the Docker workshop, you're ready to explore
  securing your images with Docker Hardened Images, building AI-powered
  applications, and diving into language-specific guides.
@y
summary: |
  Now that you've completed the Docker workshop, you're ready to explore
  securing your images with Docker Hardened Images, building AI-powered
  applications, and diving into language-specific guides.
@z

%secure-images:

@x
- title: What are Docker Hardened Images?
  description: Understand secure, minimal, production-ready base images with near-zero CVEs.
  link: /dhi/explore/what/
@y
- title: What are Docker Hardened Images?
  description: Understand secure, minimal, production-ready base images with near-zero CVEs.
  link: __SUBDIR__/dhi/explore/what/
@z

@x
- title: Get started with DHI
  description: Pull and run your first Docker Hardened Image in minutes.
  link: /dhi/get-started/
@y
- title: Get started with DHI
  description: Pull and run your first Docker Hardened Image in minutes.
  link: __SUBDIR__/dhi/get-started/
@z

@x
- title: Use hardened images
  description: Learn how to use DHI in your Dockerfiles and CI/CD pipelines.
  link: /dhi/how-to/use/
@y
- title: Use hardened images
  description: Learn how to use DHI in your Dockerfiles and CI/CD pipelines.
  link: __SUBDIR__/dhi/how-to/use/
@z

@x
- title: Explore the DHI catalog
  description: Browse available hardened images, variants, and security attestations.
  link: /dhi/how-to/explore/
@y
- title: Explore the DHI catalog
  description: Browse available hardened images, variants, and security attestations.
  link: __SUBDIR__/dhi/how-to/explore/
@z

%ai-development:

@x
- title: Docker Model Runner
  description: Run and manage AI models locally using familiar Docker commands with OpenAI-compatible APIs.
  link: /ai/model-runner/
@y
- title: Docker Model Runner
  description: Run and manage AI models locally using familiar Docker commands with OpenAI-compatible APIs.
  link: __SUBDIR__/ai/model-runner/
@z

@x
- title: MCP Toolkit
  description: Set up, manage, and run containerized MCP servers to power your AI agents.
  link: /ai/mcp-catalog-and-toolkit/toolkit/
@y
- title: MCP Toolkit
  description: Set up, manage, and run containerized MCP servers to power your AI agents.
  link: __SUBDIR__/ai/mcp-catalog-and-toolkit/toolkit/
@z

@x
- title: Build AI agents with cagent
  description: Create teams of specialized AI agents that collaborate to solve complex problems.
  link: /ai/cagent/
@y
- title: Build AI agents with cagent
  description: Create teams of specialized AI agents that collaborate to solve complex problems.
  link: __SUBDIR__/ai/cagent/
@z

@x
- title: Use AI models in Compose
  description: Define AI model dependencies in your Docker Compose applications.
  link: /compose/how-tos/model-runner/
@y
- title: Use AI models in Compose
  description: Define AI model dependencies in your Docker Compose applications.
  link: __SUBDIR__/compose/how-tos/model-runner/
@z

%language-guides:

@x
- title: Node.js
  description: Learn how to containerize and develop Node.js applications.
  link: /guides/language/nodejs/
@y
- title: Node.js
  description: Learn how to containerize and develop Node.js applications.
  link: __SUBDIR__/guides/language/nodejs/
@z

@x
- title: Python
  description: Build and run Python applications in containers.
  link: /guides/language/python/
@y
- title: Python
  description: Build and run Python applications in containers.
  link: __SUBDIR__/guides/language/python/
@z

@x
- title: Java
  description: Containerize Java applications with best practices.
  link: /guides/language/java/
@y
- title: Java
  description: Containerize Java applications with best practices.
  link: __SUBDIR__/guides/language/java/
@z

@x
- title: Go
  description: Develop and deploy Go applications using Docker.
  link: /guides/language/golang/
@y
- title: Go
  description: Develop and deploy Go applications using Docker.
  link: __SUBDIR__/guides/language/golang/
@z

@x
Congratulations on completing the Docker workshop. You've learned how to containerize applications, work with multi-container setups, use Docker Compose, and apply image-building best practices.
@y
Congratulations on completing the Docker workshop. You've learned how to containerize applications, work with multi-container setups, use Docker Compose, and apply image-building best practices.
@z

@x
Here's what to explore next.
@y
Here's what to explore next.
@z

@x
## Secure your images
@y
## Secure your images
@z

@x
Take your image-building skills to the next level with Docker Hardened Images—secure, minimal, and production-ready base images that are now free for everyone.
@y
Take your image-building skills to the next level with Docker Hardened Images—secure, minimal, and production-ready base images that are now free for everyone.
@z

@x
{{< grid items="secure-images" >}}
@y
{{< grid items="secure-images" >}}
@z

@x
## Build with AI
@y
## Build with AI
@z

@x
Docker makes it easy to run AI models locally and build agentic AI applications. Explore Docker's AI tools and start building AI-powered apps.
@y
Docker makes it easy to run AI models locally and build agentic AI applications. Explore Docker's AI tools and start building AI-powered apps.
@z

@x
{{< grid items="ai-development" >}}
@y
{{< grid items="ai-development" >}}
@z

@x
## Language-specific guides
@y
## Language-specific guides
@z

@x
Apply what you've learned to your preferred programming language with hands-on tutorials.
@y
Apply what you've learned to your preferred programming language with hands-on tutorials.
@z

@x
{{< grid items="language-guides" >}}
@y
{{< grid items="language-guides" >}}
@z
