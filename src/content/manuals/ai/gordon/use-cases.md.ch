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
Gordon handles Docker workflows through natural conversation. This page shows
example prompts for the most common use cases.
@y
Gordon handles Docker workflows through natural conversation. This page shows
example prompts for the most common use cases.
@z

@x
## Debug and troubleshoot
@y
## Debug and troubleshoot
@z

@x
Fix broken containers, diagnose build failures, and resolve issues.
@y
Fix broken containers, diagnose build failures, and resolve issues.
@z

@x
```console
# Diagnose container crashes
$ docker ai "why did my postgres container crash?"
@y
```console
# Diagnose container crashes
$ docker ai "why did my postgres container crash?"
@z

@x
# Debug build failures
$ docker ai "my build is failing at the pip install step, what's wrong?"
@y
# Debug build failures
$ docker ai "my build is failing at the pip install step, what's wrong?"
@z

@x
# Fix networking issues
$ docker ai "my web container can't reach my database container"
@y
# Fix networking issues
$ docker ai "my web container can't reach my database container"
@z

@x
# Investigate performance problems
$ docker ai "my container is using too much memory, help me investigate"
```
@y
# Investigate performance problems
$ docker ai "my container is using too much memory, help me investigate"
```
@z

@x
## Build and containerize
@y
## Build and containerize
@z

@x
Create Docker assets for applications and migrate to hardened images.
@y
Create Docker assets for applications and migrate to hardened images.
@z

@x
```console
# Create Dockerfile from scratch
$ docker ai "create a Dockerfile for my Node.js application"
@y
```console
# Create Dockerfile from scratch
$ docker ai "create a Dockerfile for my Node.js application"
@z

@x
# Generate compose file
$ docker ai "create a docker-compose.yml for my application stack"
@y
# Generate compose file
$ docker ai "create a docker-compose.yml for my application stack"
@z

@x
# Migrate to Docker Hardened Images
$ docker ai "migrate my Dockerfile to use Docker Hardened Images"
```
@y
# Migrate to Docker Hardened Images
$ docker ai "migrate my Dockerfile to use Docker Hardened Images"
```
@z

@x
## Execute operations
@y
## Execute operations
@z

@x
Run Docker commands to manage containers, images, and resources.
@y
Run Docker commands to manage containers, images, and resources.
@z

@x
```console
# Start containers with configuration
$ docker ai "run a redis container with persistence"
@y
```console
# Start containers with configuration
$ docker ai "run a redis container with persistence"
@z

@x
# Build and tag images
$ docker ai "build my Dockerfile and tag it for production"
@y
# Build and tag images
$ docker ai "build my Dockerfile and tag it for production"
@z

@x
# Clean up resources
$ docker ai "clean up all unused Docker resources"
```
@y
# Clean up resources
$ docker ai "clean up all unused Docker resources"
```
@z

@x
## Develop and optimize
@y
## Develop and optimize
@z

@x
Improve Dockerfiles and configure secure, efficient development environments.
@y
Improve Dockerfiles and configure secure, efficient development environments.
@z

@x
```console
# Optimize existing Dockerfile
$ docker ai "rate my Dockerfile and suggest improvements"
@y
```console
# Optimize existing Dockerfile
$ docker ai "rate my Dockerfile and suggest improvements"
@z

@x
# Add security improvements
$ docker ai "make my Dockerfile more secure"
@y
# Add security improvements
$ docker ai "make my Dockerfile more secure"
@z

@x
# Configure development workflow
$ docker ai "set up my container for development with hot reload"
```
@y
# Configure development workflow
$ docker ai "set up my container for development with hot reload"
```
@z

@x
## Manage resources
@y
## Manage resources
@z

@x
Inspect containers, images, and resource usage.
@y
Inspect containers, images, and resource usage.
@z

@x
```console
# Check container status
$ docker ai "show me all my containers and their status"
@y
```console
# Check container status
$ docker ai "show me all my containers and their status"
@z

@x
# Analyze disk usage
$ docker ai "how much disk space is Docker using?"
@y
# Analyze disk usage
$ docker ai "how much disk space is Docker using?"
@z

@x
# Review image details
$ docker ai "list my images sorted by size"
```
@y
# Review image details
$ docker ai "list my images sorted by size"
```
@z

@x
## Learn Docker
@y
## Learn Docker
@z

@x
Understand concepts and commands in the context of your projects.
@y
Understand concepts and commands in the context of your projects.
@z

@x
```console
# Explain Docker concepts
$ docker ai "explain how Docker networking works"
@y
```console
# Explain Docker concepts
$ docker ai "explain how Docker networking works"
@z

@x
# Understand commands
$ docker ai "what's the difference between COPY and ADD in Dockerfile?"
@y
# Understand commands
$ docker ai "what's the difference between COPY and ADD in Dockerfile?"
@z

@x
# Get troubleshooting guidance
$ docker ai "how do I debug a container that exits immediately?"
```
@y
# Get troubleshooting guidance
$ docker ai "how do I debug a container that exits immediately?"
```
@z

@x
## Writing effective prompts
@y
## Writing effective prompts
@z

@x
Be specific:
- Include relevant context: "my postgres container" not "the database"
- State your goal: "make my build faster" not "optimize"
- Include error messages when debugging
@y
Be specific:
- Include relevant context: "my postgres container" not "the database"
- State your goal: "make my build faster" not "optimize"
- Include error messages when debugging
@z

@x
Gordon works best when you describe what you want to achieve rather than how to
do it.
@y
Gordon works best when you describe what you want to achieve rather than how to
do it.
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
