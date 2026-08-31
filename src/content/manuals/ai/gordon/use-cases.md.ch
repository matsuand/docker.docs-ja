%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Gordon use cases and examples
linkTitle: Use cases
description: Example prompts for common Docker workflows
@y
title: Gordon use cases and examples
linkTitle: Use cases
description: Example prompts for common Docker workflows
@z

@x
{{< summary-bar feature_name="Gordon" >}}
@y
{{< summary-bar feature_name="Gordon" >}}
@z

@x
Gordon handles Docker workflows through natural conversation. In Docker
Desktop, Gordon is available from the sidebar for open-ended sessions and from
contextual entry points in views like Containers, Images, Builds, and Volumes.
Selecting Gordon from one of these views opens a conversation pre-loaded with
context about the item you're looking at. You can ask the same questions from
the CLI with `docker ai`.
@y
Gordon handles Docker workflows through natural conversation. In Docker
Desktop, Gordon is available from the sidebar for open-ended sessions and from
contextual entry points in views like Containers, Images, Builds, and Volumes.
Selecting Gordon from one of these views opens a conversation pre-loaded with
context about the item you're looking at. You can ask the same questions from
the CLI with `docker ai`.
@z

@x
## Debug a failing container
@y
## Debug a failing container
@z

@x
You're in the Containers view and a container has crashed or behaves
unexpectedly. Open Gordon from the container row to ask about that container's
state and configuration:
@y
You're in the Containers view and a container has crashed or behaves
unexpectedly. Open Gordon from the container row to ask about that container's
state and configuration:
@z

@x
- "Why did this container exit?"
- "What environment variables are set in this container?"
- "How long did this container run?"
- "What security settings are applied to this container?"
@y
- "Why did this container exit?"
- "What environment variables are set in this container?"
- "How long did this container run?"
- "What security settings are applied to this container?"
@z

@x
From the CLI:
@y
From the CLI:
@z

@x
```console
$ docker ai "why is my postgres container crashing on startup?"
```
@y
```console
$ docker ai "why is my postgres container crashing on startup?"
```
@z

@x
## Debug a failed build
@y
## Debug a failed build
@z

@x
You're in the Builds view looking at a build that failed or is slower than
expected. Open Gordon from the build to inspect the Dockerfile, build
arguments, and cache behavior:
@y
You're in the Builds view looking at a build that failed or is slower than
expected. Open Gordon from the build to inspect the Dockerfile, build
arguments, and cache behavior:
@z

@x
- "Why did this build fail?"
- "How can I improve cache usage for this build?"
- "What Dockerfile instructions were used?"
- "What build arguments were used?"
@y
- "Why did this build fail?"
- "How can I improve cache usage for this build?"
- "What Dockerfile instructions were used?"
- "What build arguments were used?"
@z

@x
From the CLI:
@y
From the CLI:
@z

@x
```console
$ docker ai "my build is failing at the pip install step, what's wrong?"
```
@y
```console
$ docker ai "my build is failing at the pip install step, what's wrong?"
```
@z

@x
## Inspect an image
@y
## Inspect an image
@z

@x
You're in the Images view and want to understand what's in an image before
running it, or you want to size up a base image:
@y
You're in the Images view and want to understand what's in an image before
running it, or you want to size up a base image:
@z

@x
- "How do I run this image in the CLI?"
- "What environment variables are configured?"
- "What entrypoint is configured?"
- "What's the base architecture of this image?"
- "Is there a lighter version of this image?"
@y
- "How do I run this image in the CLI?"
- "What environment variables are configured?"
- "What entrypoint is configured?"
- "What's the base architecture of this image?"
- "Is there a lighter version of this image?"
@z

@x
From the CLI:
@y
From the CLI:
@z

@x
```console
$ docker ai "compare my python:3.12 image to python:3.12-slim"
```
@y
```console
$ docker ai "compare my python:3.12 image to python:3.12-slim"
```
@z

@x
## Manage volumes and resources
@y
## Manage volumes and resources
@z

@x
From the Volumes view, ask Gordon about what's stored, which containers use a
volume, or how to clean up. From any view, use the Gordon sidebar to inspect
your wider environment:
@y
From the Volumes view, ask Gordon about what's stored, which containers use a
volume, or how to clean up. From any view, use the Gordon sidebar to inspect
your wider environment:
@z

@x
- "Which containers are using this volume?"
- "Show me all my containers and their status"
- "How much disk space is Docker using?"
- "List my images sorted by size"
@y
- "Which containers are using this volume?"
- "Show me all my containers and their status"
- "How much disk space is Docker using?"
- "List my images sorted by size"
@z

@x
From the CLI:
@y
From the CLI:
@z

@x
```console
$ docker ai "clean up all unused Docker resources"
```
@y
```console
$ docker ai "clean up all unused Docker resources"
```
@z

@x
## Build and containerize
@y
## Build and containerize
@z

@x
For new projects, start a conversation in the Gordon sidebar or via `docker
ai` from your project directory. Gordon reads your working directory and
proposes the right files:
@y
For new projects, start a conversation in the Gordon sidebar or via `docker
ai` from your project directory. Gordon reads your working directory and
proposes the right files:
@z

@x
- "Containerize my Node.js app"
- "Create a docker-compose for my stack"
- "Set up a dev environment with Postgres and Redis"
@y
- "Containerize my Node.js app"
- "Create a docker-compose for my stack"
- "Set up a dev environment with Postgres and Redis"
@z

@x
From the CLI:
@y
From the CLI:
@z

@x
```console
$ cd ~/my-project
$ docker ai "create a Dockerfile for this application"
```
@y
```console
$ cd ~/my-project
$ docker ai "create a Dockerfile for this application"
```
@z

@x
## Develop and optimize
@y
## Develop and optimize
@z

@x
Ask Gordon to review and improve existing Dockerfiles or service definitions.
You can start from the Images view (for an image you've already built) or from
the Gordon sidebar with your project context:
@y
Ask Gordon to review and improve existing Dockerfiles or service definitions.
You can start from the Images view (for an image you've already built) or from
the Gordon sidebar with your project context:
@z

@x
- "Optimize this Dockerfile"
- "Add a health check to my service"
- "Make my Dockerfile more secure"
@y
- "Optimize this Dockerfile"
- "Add a health check to my service"
- "Make my Dockerfile more secure"
@z

@x
From the CLI:
@y
From the CLI:
@z

@x
```console
$ docker ai "rate my Dockerfile and suggest improvements"
```
@y
```console
$ docker ai "rate my Dockerfile and suggest improvements"
```
@z

@x
## Learn Docker
@y
## Learn Docker
@z

@x
For conceptual questions, use the Gordon sidebar or CLI. Gordon explains
concepts grounded in your environment, not generic answers:
@y
For conceptual questions, use the Gordon sidebar or CLI. Gordon explains
concepts grounded in your environment, not generic answers:
@z

@x
- "What is a Docker volume?"
- "Explain multi-stage builds"
- "How does networking work in Docker?"
@y
- "What is a Docker volume?"
- "Explain multi-stage builds"
- "How does networking work in Docker?"
@z

@x
From the CLI:
@y
From the CLI:
@z

@x
```console
$ docker ai "what's the difference between COPY and ADD in a Dockerfile?"
```
@y
```console
$ docker ai "what's the difference between COPY and ADD in a Dockerfile?"
```
@z

@x
## Writing effective prompts
@y
## Writing effective prompts
@z

@x
Be specific:
@y
Be specific:
@z

@x
- Include relevant context: "my postgres container" not "the database"
- State your goal: "make my build faster" not "optimize"
- Include error messages when debugging
@y
- Include relevant context: "my postgres container" not "the database"
- State your goal: "make my build faster" not "optimize"
- Include error messages when debugging
@z

@x
Gordon works best when you describe what you want to achieve rather than how
to do it. Gordon maintains context across a conversation, so you can follow up
with clarifications or ask related questions without repeating yourself.
@y
Gordon works best when you describe what you want to achieve rather than how
to do it. Gordon maintains context across a conversation, so you can follow up
with clarifications or ask related questions without repeating yourself.
@z

@x
### Working directory context
@y
### Working directory context
@z

@x
When using `docker ai` in the CLI, Gordon uses your current working directory
as the default context for file operations. Change to your project directory
before starting Gordon to ensure it has access to the right files:
@y
When using `docker ai` in the CLI, Gordon uses your current working directory
as the default context for file operations. Change to your project directory
before starting Gordon to ensure it has access to the right files:
@z

@x
```console
$ cd ~/my-project
$ docker ai "review my Dockerfile"
```
@y
```console
$ cd ~/my-project
$ docker ai "review my Dockerfile"
```
@z

@x
You can also override the working directory with the `-C` flag. See [Using
Gordon via CLI](./how-to/cli.md#working-directory) for details.
@y
You can also override the working directory with the `-C` flag. See [Using
Gordon via CLI](./how-to/cli.md#working-directory) for details.
@z
