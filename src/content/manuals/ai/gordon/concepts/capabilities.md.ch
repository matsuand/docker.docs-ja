%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Gordon's capabilities
linkTitle: Capabilities
description: Understand what Gordon can do and the tools it has access to
@y
title: Gordon's capabilities
linkTitle: Capabilities
description: Understand what Gordon can do and the tools it has access to
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
Gordon combines multiple capabilities to handle Docker workflows. This page
explains what Gordon can do and the tools it uses.
@y
Gordon combines multiple capabilities to handle Docker workflows. This page
explains what Gordon can do and the tools it uses.
@z

@x
## Core capabilities
@y
## Core capabilities
@z

@x
Gordon uses five capabilities to take action on your behalf:
@y
Gordon uses five capabilities to take action on your behalf:
@z

@x
- Specialized agents for specific Docker tasks
- Shell access to run commands
- Filesystem access to read and write files
- Knowledge base of Docker documentation and best practices
- Web access to fetch external resources
@y
- Specialized agents for specific Docker tasks
- Shell access to run commands
- Filesystem access to read and write files
- Knowledge base of Docker documentation and best practices
- Web access to fetch external resources
@z

@x
## Agent architecture
@y
## Agent architecture
@z

@x
Gordon uses a primary agent that handles most tasks, with a specialized
sub-agent for specific workflows:
@y
Gordon uses a primary agent that handles most tasks, with a specialized
sub-agent for specific workflows:
@z

@x
- **Main agent**: Handles all Docker operations, software development,
  containerization, and general development tasks
- **DHI migration sub-agent**: Specialized handler for migrating Dockerfiles to
  Docker Hardened Images
@y
- **Main agent**: Handles all Docker operations, software development,
  containerization, and general development tasks
- **DHI migration sub-agent**: Specialized handler for migrating Dockerfiles to
  Docker Hardened Images
@z

@x
The main agent handles:
@y
The main agent handles:
@z

@x
- Creating Docker assets (Dockerfile, compose.yaml, .dockerignore)
- Optimizing Dockerfiles to reduce image size and improve build performance
- Running Docker commands (ps, logs, exec, build, compose)
- Debugging container issues and analyzing configurations
- Writing and reviewing code across multiple programming languages
- General development questions and tasks
@y
- Creating Docker assets (Dockerfile, compose.yaml, .dockerignore)
- Optimizing Dockerfiles to reduce image size and improve build performance
- Running Docker commands (ps, logs, exec, build, compose)
- Debugging container issues and analyzing configurations
- Writing and reviewing code across multiple programming languages
- General development questions and tasks
@z

@x
When you request DHI migration, Gordon automatically delegates to the DHI
migration sub-agent.
@y
When you request DHI migration, Gordon automatically delegates to the DHI
migration sub-agent.
@z

@x
## Shell access
@y
## Shell access
@z

@x
Gordon executes shell commands in your environment after you approve them.
This includes Docker CLI commands, system utilities, and application-specific
tools.
@y
Gordon executes shell commands in your environment after you approve them.
This includes Docker CLI commands, system utilities, and application-specific
tools.
@z

@x
Example commands Gordon might run:
@y
Example commands Gordon might run:
@z

@x
```console
$ docker ps
$ docker logs container-name
$ docker exec -it container-name bash
$ grep "error" app.log
```
@y
```console
$ docker ps
$ docker logs container-name
$ docker exec -it container-name bash
$ grep "error" app.log
```
@z

@x
Commands run with your user permissions. Gordon cannot access `sudo` unless
you've explicitly granted it.
@y
Commands run with your user permissions. Gordon cannot access `sudo` unless
you've explicitly granted it.
@z

@x
## Filesystem access
@y
## Filesystem access
@z

@x
Gordon reads and writes files on your system. It can analyze Dockerfiles, read
configuration files, scan directories, and parse logs without approval. Writing
files requires your approval.
@y
Gordon reads and writes files on your system. It can analyze Dockerfiles, read
configuration files, scan directories, and parse logs without approval. Writing
files requires your approval.
@z

@x
The working directory sets the default context for file operations, but Gordon
can access files outside this directory when needed.
@y
The working directory sets the default context for file operations, but Gordon
can access files outside this directory when needed.
@z

@x
## Knowledge base
@y
## Knowledge base
@z

@x
Gordon uses retrieval-augmented generation to access Docker documentation,
best practices, troubleshooting procedures, and security recommendations. This
lets Gordon answer questions accurately, explain errors, and suggest
solutions that follow Docker's guidelines.
@y
Gordon uses retrieval-augmented generation to access Docker documentation,
best practices, troubleshooting procedures, and security recommendations. This
lets Gordon answer questions accurately, explain errors, and suggest
solutions that follow Docker's guidelines.
@z

@x
## Web access
@y
## Web access
@z

@x
Gordon fetches external web resources to look up error messages, package
versions, and framework documentation. This helps when debugging issues that
require context outside Docker's own documentation.
@y
Gordon fetches external web resources to look up error messages, package
versions, and framework documentation. This helps when debugging issues that
require context outside Docker's own documentation.
@z

@x
Gordon cannot access authenticated or private resources, and external requests
are rate-limited.
@y
Gordon cannot access authenticated or private resources, and external requests
are rate-limited.
@z

@x
## Working with other tools
@y
## Working with other tools
@z

@x
Gordon complements general-purpose AI coding assistants by focusing on Docker
workflows. Use tools like Cursor or GitHub Copilot for application code and
refactoring, and use Gordon for containerization, deployment configuration,
and Docker operations. They work well together.
@y
Gordon complements general-purpose AI coding assistants by focusing on Docker
workflows. Use tools like Cursor or GitHub Copilot for application code and
refactoring, and use Gordon for containerization, deployment configuration,
and Docker operations. They work well together.
@z
