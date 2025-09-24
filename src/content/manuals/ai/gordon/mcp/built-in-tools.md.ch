%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Built-in tools in Gordon
description: Use and configure Gordon's built-in tools for Docker, Kubernetes, security, and development workflows
keywords: ai, mcp, gordon, docker, kubernetes, security, developer tools, toolbox, configuration, usage
@y
title: Built-in tools in Gordon
description: Use and configure Gordon's built-in tools for Docker, Kubernetes, security, and development workflows
keywords: ai, mcp, gordon, docker, kubernetes, security, developer tools, toolbox, configuration, usage
@z

@x
Gordon includes an integrated toolbox that gives you access to system tools and
capabilities. These tools extend Gordon's functionality so you can interact with
the Docker Engine, Kubernetes, Docker Scout security scanning, and other
developer utilities. This article describes the available tools, how to
configure them, and usage patterns.
@y
Gordon includes an integrated toolbox that gives you access to system tools and
capabilities. These tools extend Gordon's functionality so you can interact with
the Docker Engine, Kubernetes, Docker Scout security scanning, and other
developer utilities. This article describes the available tools, how to
configure them, and usage patterns.
@z

@x
## Configure tools
@y
## Configure tools
@z

@x
Configure tools globally in the toolbox to make them available throughout
Gordon, including Docker Desktop and the CLI.
@y
Configure tools globally in the toolbox to make them available throughout
Gordon, including Docker Desktop and the CLI.
@z

@x
To configure tools:
@y
To configure tools:
@z

@x
1. In the **Ask Gordon** view in Docker Desktop, select the **Toolbox** button at the bottom left of the input area.
@y
1. In the **Ask Gordon** view in Docker Desktop, select the **Toolbox** button at the bottom left of the input area.
@z

@x
   ![Screenshot showing Gordon page with the toolbox button.](../images/gordon.png)
@y
   ![Screenshot showing Gordon page with the toolbox button.](../images/gordon.png)
@z

@x
1. To enable or disable a tool, select it in the left menu and select the toggle.
@y
1. To enable or disable a tool, select it in the left menu and select the toggle.
@z

@x
   ![Screenshot showing Gordon's Toolbox.](../images/toolbox.png)
@y
   ![Screenshot showing Gordon's Toolbox.](../images/toolbox.png)
@z

@x
   For more information about Docker tools, see [Reference](#reference).
@y
   For more information about Docker tools, see [Reference](#reference).
@z

@x
## Usage examples
@y
## Usage examples
@z

@x
This section shows common tasks you can perform with Gordon tools.
@y
This section shows common tasks you can perform with Gordon tools.
@z

@x
### Manage Docker containers
@y
### Manage Docker containers
@z

@x
#### List and monitor containers
@y
#### List and monitor containers
@z

@x
```console
# List all running containers
$ docker ai "Show me all running containers"
@y
```console
# List all running containers
$ docker ai "Show me all running containers"
@z

@x
# List containers using specific resources
$ docker ai "List all containers using more than 1GB of memory"
@y
# List containers using specific resources
$ docker ai "List all containers using more than 1GB of memory"
@z

@x
# View logs from a specific container
$ docker ai "Show me logs from my running api-container from the last hour"
```
@y
# View logs from a specific container
$ docker ai "Show me logs from my running api-container from the last hour"
```
@z

@x
#### Manage container lifecycle
@y
#### Manage container lifecycle
@z

@x
```console
# Run a new container
$ docker ai "Run a nginx container with port 80 exposed to localhost"
@y
```console
# Run a new container
$ docker ai "Run a nginx container with port 80 exposed to localhost"
@z

@x
# Stop a specific container
$ docker ai "Stop my database container"
@y
# Stop a specific container
$ docker ai "Stop my database container"
@z

@x
# Clean up unused containers
$ docker ai "Remove all stopped containers"
```
@y
# Clean up unused containers
$ docker ai "Remove all stopped containers"
```
@z

@x
### Work with Docker images
@y
### Work with Docker images
@z

@x
```console
# List available images
$ docker ai "Show me all my local Docker images"
@y
```console
# List available images
$ docker ai "Show me all my local Docker images"
@z

@x
# Pull a specific image
$ docker ai "Pull the latest Ubuntu image"
@y
# Pull a specific image
$ docker ai "Pull the latest Ubuntu image"
@z

@x
# Build an image from a Dockerfile
$ docker ai "Build an image from my current directory and tag it as myapp:latest"
@y
# Build an image from a Dockerfile
$ docker ai "Build an image from my current directory and tag it as myapp:latest"
@z

@x
# Clean up unused images
$ docker ai "Remove all my unused images"
```
@y
# Clean up unused images
$ docker ai "Remove all my unused images"
```
@z

@x
### Manage Docker volumes
@y
### Manage Docker volumes
@z

@x
```console
# List volumes
$ docker ai "List all my Docker volumes"
@y
```console
# List volumes
$ docker ai "List all my Docker volumes"
@z

@x
# Create a new volume
$ docker ai "Create a new volume called postgres-data"
@y
# Create a new volume
$ docker ai "Create a new volume called postgres-data"
@z

@x
# Back up data from a container to a volume
$ docker ai "Create a backup of my postgres container data to a new volume"
```
@y
# Back up data from a container to a volume
$ docker ai "Create a backup of my postgres container data to a new volume"
```
@z

@x
### Perform Kubernetes operations
@y
### Perform Kubernetes operations
@z

@x
```console
# Create a deployment
$ docker ai "Create an nginx deployment and make sure it's exposed locally"
@y
```console
# Create a deployment
$ docker ai "Create an nginx deployment and make sure it's exposed locally"
@z

@x
# List resources
$ docker ai "Show me all deployments in the default namespace"
@y
# List resources
$ docker ai "Show me all deployments in the default namespace"
@z

@x
# Get logs
$ docker ai "Show me logs from the auth-service pod"
```
@y
# Get logs
$ docker ai "Show me logs from the auth-service pod"
```
@z

@x
### Run security analysis
@y
### Run security analysis
@z

@x
```console
# Scan for CVEs
$ docker ai "Scan my application for security vulnerabilities"
@y
```console
# Scan for CVEs
$ docker ai "Scan my application for security vulnerabilities"
@z

@x
# Get security recommendations
$ docker ai "Give me recommendations for improving the security of my nodejs-app image"
```
@y
# Get security recommendations
$ docker ai "Give me recommendations for improving the security of my nodejs-app image"
```
@z

@x
### Use development workflows
@y
### Use development workflows
@z

@x
```console
# Analyze and commit changes
$ docker ai "Look at my local changes, create multiple commits with sensible commit messages"
@y
```console
# Analyze and commit changes
$ docker ai "Look at my local changes, create multiple commits with sensible commit messages"
@z

@x
# Review branch status
$ docker ai "Show me the status of my current branch compared to main"
```
@y
# Review branch status
$ docker ai "Show me the status of my current branch compared to main"
```
@z

@x
## Reference
@y
## Reference
@z

@x
This section lists the built-in tools in Gordon's toolbox.
@y
This section lists the built-in tools in Gordon's toolbox.
@z

@x
### Docker tools
@y
### Docker tools
@z

@x
Interact with Docker containers, images, and volumes.
@y
Interact with Docker containers, images, and volumes.
@z

@x
#### Container management
@y
#### Container management
@z

@x
<!-- vale off -->
@y
<!-- vale off -->
@z

@x
| Name          | Description                      |
|---------------|----------------------------------|
| `docker`      | Access the Docker CLI            |
| `list_builds` | List builds in the Docker daemon |
| `build_logs`  | Show build logs                  |
@y
| Name          | Description                      |
|---------------|----------------------------------|
| `docker`      | Access the Docker CLI            |
| `list_builds` | List builds in the Docker daemon |
| `build_logs`  | Show build logs                  |
@z

@x
#### Volume management
@y
#### Volume management
@z

@x
| Tool           | Description                |
|----------------|---------------------------|
| `list_volumes` | List all Docker volumes   |
| `remove_volume`| Remove a Docker volume    |
| `create_volume`| Create a new Docker volume|
@y
| Tool           | Description                |
|----------------|---------------------------|
| `list_volumes` | List all Docker volumes   |
| `remove_volume`| Remove a Docker volume    |
| `create_volume`| Create a new Docker volume|
@z

@x
#### Image management
@y
#### Image management
@z

@x
| Tool           | Description                    |
|----------------|-------------------------------|
| `list_images`  | List all Docker images         |
| `remove_images`| Remove Docker images           |
| `pull_image`   | Pull an image from a registry  |
| `push_image`   | Push an image to a registry    |
| `build_image`  | Build a Docker image           |
| `tag_image`    | Tag a Docker image             |
| `inspect`      | Inspect a Docker object        |
@y
| Tool           | Description                    |
|----------------|-------------------------------|
| `list_images`  | List all Docker images         |
| `remove_images`| Remove Docker images           |
| `pull_image`   | Pull an image from a registry  |
| `push_image`   | Push an image to a registry    |
| `build_image`  | Build a Docker image           |
| `tag_image`    | Tag a Docker image             |
| `inspect`      | Inspect a Docker object        |
@z

@x
### Kubernetes tools
@y
### Kubernetes tools
@z

@x
Interact with your Kubernetes cluster.
@y
Interact with your Kubernetes cluster.
@z

@x
#### Pod management
@y
#### Pod management
@z

@x
| Tool           | Description                        |
|----------------|------------------------------------|
| `list_pods`    | List all pods in the cluster       |
| `get_pod_logs` | Get logs from a specific pod       |
@y
| Tool           | Description                        |
|----------------|------------------------------------|
| `list_pods`    | List all pods in the cluster       |
| `get_pod_logs` | Get logs from a specific pod       |
@z

@x
#### Deployment management
@y
#### Deployment management
@z

@x
| Tool               | Description                        |
|--------------------|------------------------------------|
| `list_deployments` | List all deployments               |
| `create_deployment`| Create a new deployment            |
| `expose_deployment`| Expose a deployment as a service   |
| `remove_deployment`| Remove a deployment                |
@y
| Tool               | Description                        |
|--------------------|------------------------------------|
| `list_deployments` | List all deployments               |
| `create_deployment`| Create a new deployment            |
| `expose_deployment`| Expose a deployment as a service   |
| `remove_deployment`| Remove a deployment                |
@z

@x
#### Service management
@y
#### Service management
@z

@x
| Tool           | Description                |
|----------------|---------------------------|
| `list_services`| List all services         |
| `remove_service`| Remove a service         |
@y
| Tool           | Description                |
|----------------|---------------------------|
| `list_services`| List all services         |
| `remove_service`| Remove a service         |
@z

@x
#### Cluster information
@y
#### Cluster information
@z

@x
| Tool             | Description                  |
|------------------|-----------------------------|
| `list_namespaces`| List all namespaces         |
| `list_nodes`     | List all nodes in the cluster|
@y
| Tool             | Description                  |
|------------------|-----------------------------|
| `list_namespaces`| List all namespaces         |
| `list_nodes`     | List all nodes in the cluster|
@z

@x
### Docker Scout tools
@y
### Docker Scout tools
@z

@x
Security analysis powered by Docker Scout.
@y
Security analysis powered by Docker Scout.
@z

@x
| Tool                           | Description                                                                                                             |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| `search_for_cves`              | Analyze a Docker image, project directory, or other artifacts for vulnerabilities using Docker Scout CVEs.              |
| `get_security_recommendations` | Analyze a Docker image, project directory, or other artifacts for base image update recommendations using Docker Scout. |
@y
| Tool                           | Description                                                                                                             |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| `search_for_cves`              | Analyze a Docker image, project directory, or other artifacts for vulnerabilities using Docker Scout CVEs.              |
| `get_security_recommendations` | Analyze a Docker image, project directory, or other artifacts for base image update recommendations using Docker Scout. |
@z

@x
### Developer tools
@y
### Developer tools
@z

@x
General-purpose development utilities.
@y
General-purpose development utilities.
@z

@x
| Tool              | Description                      |
|-------------------|----------------------------------|
| `fetch`           | Retrieve content from a URL      |
| `get_command_help`| Get help for CLI commands        |
| `run_command`     | Execute shell commands           |
| `filesystem`      | Perform filesystem operations    |
| `git`             | Execute git commands             |
@y
| Tool              | Description                      |
|-------------------|----------------------------------|
| `fetch`           | Retrieve content from a URL      |
| `get_command_help`| Get help for CLI commands        |
| `run_command`     | Execute shell commands           |
| `filesystem`      | Perform filesystem operations    |
| `git`             | Execute git commands             |
@z

@x
### AI model tools
@y
### AI model tools
@z

@x
| Tool           | Description                        |
|----------------|------------------------------------|
| `list_models`  | List all available Docker models   |
| `pull_model`   | Download a Docker model            |
| `run_model`    | Query a model with a prompt        |
| `remove_model` | Remove a Docker model              |
@y
| Tool           | Description                        |
|----------------|------------------------------------|
| `list_models`  | List all available Docker models   |
| `pull_model`   | Download a Docker model            |
| `run_model`    | Query a model with a prompt        |
| `remove_model` | Remove a Docker model              |
@z

@x
### Docker MCP Catalog
@y
### Docker MCP Catalog
@z

@x
If you have enabled the [MCP Toolkit feature](../../mcp-catalog-and-toolkit/_index.md),
all the tools you have enabled and configured are available for Gordon to use.
@y
If you have enabled the [MCP Toolkit feature](../../mcp-catalog-and-toolkit/_index.md),
all the tools you have enabled and configured are available for Gordon to use.
@z
