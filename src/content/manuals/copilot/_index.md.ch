%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Docker for GitHub Copilot
@y
title: Docker for GitHub Copilot
@z

@x
description: |
  Learn how to streamline Docker-related tasks with the Docker for GitHub
  Copilot extension. This integration helps you generate Docker assets, analyze
  vulnerabilities, and automate containerization through GitHub Copilot Chat in
  various development environments.
keywords: Docker, GitHub Copilot, extension, Visual Studio Code, chat, ai, containerization
@y
description: |
  Learn how to streamline Docker-related tasks with the Docker for GitHub
  Copilot extension. This integration helps you generate Docker assets, analyze
  vulnerabilities, and automate containerization through GitHub Copilot Chat in
  various development environments.
keywords: Docker, GitHub Copilot, extension, Visual Studio Code, chat, ai, containerization
@z

@x
{{< summary-bar feature_name="Docker GitHub Copilot" >}}
@y
{{< summary-bar feature_name="Docker GitHub Copilot" >}}
@z

@x
The [Docker for GitHub Copilot](https://github.com/marketplace/docker-for-github-copilot)
extension integrates Docker's capabilities with GitHub Copilot, providing
assistance with containerizing applications, generating Docker assets, and
analyzing project vulnerabilities. This extension helps you streamline
Docker-related tasks wherever GitHub Copilot Chat is available.
@y
The [Docker for GitHub Copilot](https://github.com/marketplace/docker-for-github-copilot)
extension integrates Docker's capabilities with GitHub Copilot, providing
assistance with containerizing applications, generating Docker assets, and
analyzing project vulnerabilities. This extension helps you streamline
Docker-related tasks wherever GitHub Copilot Chat is available.
@z

@x
## Key features
@y
## Key features
@z

@x
Key features of the Docker for GitHub Copilot extension include:
@y
Key features of the Docker for GitHub Copilot extension include:
@z

@x
- Ask questions and receive responses about containerization in any context
  where GitHub Copilot Chat is available, such as on GitHub.com and in Visual Studio Code.
- Automatically generate Dockerfiles, Docker Compose files, and `.dockerignore`
  files for a project.
- Open pull requests with generated Docker assets directly from the chat
  interface.
- Get summaries of project vulnerabilities from [Docker
  Scout](/manuals/scout/_index.md) and receive next steps via the CLI.
@y
- Ask questions and receive responses about containerization in any context
  where GitHub Copilot Chat is available, such as on GitHub.com and in Visual Studio Code.
- Automatically generate Dockerfiles, Docker Compose files, and `.dockerignore`
  files for a project.
- Open pull requests with generated Docker assets directly from the chat
  interface.
- Get summaries of project vulnerabilities from [Docker
  Scout](manuals/scout/_index.md) and receive next steps via the CLI.
@z

@x
## Data Privacy
@y
## Data Privacy
@z

@x
The Docker agent is trained exclusively on Docker's documentation and tools to
assist with containerization and related tasks. It does not have access to your
project's data outside the context of the questions you ask.
@y
The Docker agent is trained exclusively on Docker's documentation and tools to
assist with containerization and related tasks. It does not have access to your
project's data outside the context of the questions you ask.
@z

@x
When using the Docker Extension for GitHub Copilot, GitHub Copilot may include
a reference to the currently open file in its request if authorized by the
user. The Docker agent can read the file to provide context-aware responses.
@y
When using the Docker Extension for GitHub Copilot, GitHub Copilot may include
a reference to the currently open file in its request if authorized by the
user. The Docker agent can read the file to provide context-aware responses.
@z

@x
If the agent is requested to check for vulnerabilities or generate
Docker-related assets, it will clone the referenced repository into in-memory
storage to perform the necessary actions.
@y
If the agent is requested to check for vulnerabilities or generate
Docker-related assets, it will clone the referenced repository into in-memory
storage to perform the necessary actions.
@z

@x
Source code or project metadata is never persistently stored. Questions and
answers are retained for analytics and troubleshooting. Data processed by the
Docker agent is never shared with third parties.
@y
Source code or project metadata is never persistently stored. Questions and
answers are retained for analytics and troubleshooting. Data processed by the
Docker agent is never shared with third parties.
@z

@x
## Supported languages
@y
## Supported languages
@z

@x
The Docker Extension for GitHub Copilot supports the following programming
languages for tasks involving containerizing a project from scratch:
@y
The Docker Extension for GitHub Copilot supports the following programming
languages for tasks involving containerizing a project from scratch:
@z

@x
- Go
- Java
- JavaScript
- Python
- Rust
- TypeScript
@y
- Go
- Java
- JavaScript
- Python
- Rust
- TypeScript
@z
