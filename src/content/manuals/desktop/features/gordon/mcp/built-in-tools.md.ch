%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Built-in tools
description: How to use Gordon's built-in tools
keywords: ai, mcp, gordon
@y
title: Built-in tools
description: How to use Gordon's built-in tools
keywords: ai, mcp, gordon
@z

@x
Gordon comes with an integrated toolbox providing access to various system tools
and capabilities. These tools extend Gordon's functionality by allowing it to
interact with the Docker Engine, Kubernetes, Docker Scout's security scanning,
and other developer utilities. This documentation covers the available tools,
their configuration, and usage patterns.
@y
Gordon comes with an integrated toolbox providing access to various system tools
and capabilities. These tools extend Gordon's functionality by allowing it to
interact with the Docker Engine, Kubernetes, Docker Scout's security scanning,
and other developer utilities. This documentation covers the available tools,
their configuration, and usage patterns.
@z

@x
## Configuration
@y
## Configuration
@z

@x
Tools can be configured globally in the toolbox, making them accessible
throughout the Gordon interfaces, including both Docker Desktop and the CLI.
@y
Tools can be configured globally in the toolbox, making them accessible
throughout the Gordon interfaces, including both Docker Desktop and the CLI.
@z

@x
To configure:
@y
To configure:
@z

@x
1. On the **Ask Gordon** view in Docker Desktop, select the `Toolbox` button in the bottom left of the input area.
@y
1. On the **Ask Gordon** view in Docker Desktop, select the `Toolbox` button in the bottom left of the input area.
@z

@x
   ![Gordon page with the toolbox button](../images/gordon.webp)
@y
   ![Gordon page with the toolbox button](../images/gordon.webp)
@z

@x
2. Choose the tools you want to make available. Selecting a card lets you view extra information regarding each tool and what it does.
@y
2. Choose the tools you want to make available. Selecting a card lets you view extra information regarding each tool and what it does.
@z

@x
   ![Gordon's Toolbox](../images/toolbox.webp)
@y
   ![Gordon's Toolbox](../images/toolbox.webp)
@z

@x
   For more information on the possible tools, see [Reference](#reference).
@y
   For more information on the possible tools, see [Reference](#reference).
@z

@x
## Usage examples
@y
## Usage examples
@z

@x
This section provides task-oriented examples for common operations with Gordon
tools.
@y
This section provides task-oriented examples for common operations with Gordon
tools.
@z

@x
### Managing Docker containers
@y
### Managing Docker containers
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
### Working with Docker images
@y
### Working with Docker images
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
### Managing Docker volumes
@y
### Managing Docker volumes
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
# Backup data from a container to a volume
$ docker ai "Create a backup of my postgres container data to a new volume"
```
@y
# Backup data from a container to a volume
$ docker ai "Create a backup of my postgres container data to a new volume"
```
@z

@x
### Kubernetes operations
@y
### Kubernetes operations
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
### Security analysis
@y
### Security analysis
@z

@x
```console
# Scan  for CVEs
$ docker ai "Scan my application for security vulnerabilities"
@y
```console
# Scan  for CVEs
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
### Development workflows
@y
### Development workflows
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
This section provides a comprehensive listing of the built-in tools you can find
in Gordon's toolbox.
@y
This section provides a comprehensive listing of the built-in tools you can find
in Gordon's toolbox.
@z

@x
### Docker tools
@y
### Docker tools
@z

@x
Tools to interact with your Docker containers, images, and volumes.
@y
Tools to interact with your Docker containers, images, and volumes.
@z

@x
#### Container management
@y
#### Container management
@z

@x
| Name | Description |
|------|-------------|
| `list_containers` | List all Docker containers |
| `remove_containers` | Remove one or more Docker containers |
| `stop_container` | Stop a running Docker container |
| `fetch_container_logs` | Retrieve logs from a Docker container |
| `run_container` | Run a new Docker container |
@y
| Name | Description |
|------|-------------|
| `list_containers` | List all Docker containers |
| `remove_containers` | Remove one or more Docker containers |
| `stop_container` | Stop a running Docker container |
| `fetch_container_logs` | Retrieve logs from a Docker container |
| `run_container` | Run a new Docker container |
@z

@x
#### Volume management
@y
#### Volume management
@z

@x
| Tool | Description |
|------|-------------|
| `list_volumes` | List all Docker volumes |
| `remove_volume` | Remove a Docker volume |
| `create_volume` | Create a new Docker volume |
@y
| Tool | Description |
|------|-------------|
| `list_volumes` | List all Docker volumes |
| `remove_volume` | Remove a Docker volume |
| `create_volume` | Create a new Docker volume |
@z

@x
#### Image management
@y
#### Image management
@z

@x
| Tool | Description |
|------|-------------|
| `list_images` | List all Docker images |
| `remove_images` | Remove Docker images |
| `pull_image` | Pull an image from a registry |
| `push_image` | Push an image to a registry |
| `build_image` | Build a Docker image |
| `tag_image` | Tag a Docker image |
| `inspect` | Inspect a Docker object |
@y
| Tool | Description |
|------|-------------|
| `list_images` | List all Docker images |
| `remove_images` | Remove Docker images |
| `pull_image` | Pull an image from a registry |
| `push_image` | Push an image to a registry |
| `build_image` | Build a Docker image |
| `tag_image` | Tag a Docker image |
| `inspect` | Inspect a Docker object |
@z

@x
### Kubernetes tools
@y
### Kubernetes tools
@z

@x
Tools to interact with your Kubernetes cluster
@y
Tools to interact with your Kubernetes cluster
@z

@x
#### Pods
@y
#### Pods
@z

@x
| Tool | Description |
|------|-------------|
| `list_pods` | List all pods in the cluster |
| `get_pod_logs` | Get logs from a specific pod |
@y
| Tool | Description |
|------|-------------|
| `list_pods` | List all pods in the cluster |
| `get_pod_logs` | Get logs from a specific pod |
@z

@x
#### Deployment management
@y
#### Deployment management
@z

@x
| Tool | Description |
|------|-------------|
| `list_deployments` | List all deployments |
| `create_deployment` | Create a new deployment |
| `expose_deployment` | Expose a deployment as a service |
| `remove_deployment` | Remove a deployment |
@y
| Tool | Description |
|------|-------------|
| `list_deployments` | List all deployments |
| `create_deployment` | Create a new deployment |
| `expose_deployment` | Expose a deployment as a service |
| `remove_deployment` | Remove a deployment |
@z

@x
#### Service management
@y
#### Service management
@z

@x
| Tool | Description |
|------|-------------|
| `list_services` | List all services |
| `remove_service` | Remove a service |
@y
| Tool | Description |
|------|-------------|
| `list_services` | List all services |
| `remove_service` | Remove a service |
@z

@x
#### Cluster information
@y
#### Cluster information
@z

@x
| Tool | Description |
|------|-------------|
| `list_namespaces` | List all namespaces |
| `list_nodes` | List all nodes in the cluster |
@y
| Tool | Description |
|------|-------------|
| `list_namespaces` | List all namespaces |
| `list_nodes` | List all nodes in the cluster |
@z

@x
### Docker Scout tools
@y
### Docker Scout tools
@z

@x
Security analysis tools powered by Docker Scout.
@y
Security analysis tools powered by Docker Scout.
@z

@x
| Tool | Description |
|------|-------------|
| `search_for_cves` | Analyze a Docker image, a project directory, or other artifacts for vulnerabilities using Docker Scout CVEs.search for cves |
| `get_security_recommendations` | Analyze a Docker image, a project directory, or other artifacts for base image update recommendations using Docker Scout. |
@y
| Tool | Description |
|------|-------------|
| `search_for_cves` | Analyze a Docker image, a project directory, or other artifacts for vulnerabilities using Docker Scout CVEs.search for cves |
| `get_security_recommendations` | Analyze a Docker image, a project directory, or other artifacts for base image update recommendations using Docker Scout. |
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
| Tool | Description |
|------|-------------|
| `fetch` | Retrieve content from a URL |
| `get_command_help` | Get help for CLI commands |
| `run_command` | Execute shell commands |
| `filesystem` | Perform filesystem operations |
| `git` | Execute git commands |
@y
| Tool | Description |
|------|-------------|
| `fetch` | Retrieve content from a URL |
| `get_command_help` | Get help for CLI commands |
| `run_command` | Execute shell commands |
| `filesystem` | Perform filesystem operations |
| `git` | Execute git commands |
@z

@x
### AI model tools
@y
### AI model tools
@z

@x
| Tool | Description |
|------|-------------|
| `list_models` | List all available AI models |
| `pull_model` | Download an AI model |
| `run_model` | Query a model with a prompt |
| `remove_model` | Remove an AI model |
@y
| Tool | Description |
|------|-------------|
| `list_models` | List all available AI models |
| `pull_model` | Download an AI model |
| `run_model` | Query a model with a prompt |
| `remove_model` | Remove an AI model |
@z

@x
### AI Tool Catalog
@y
### AI Tool Catalog
@z

@x
When the [AI Tool
Catalog](https://open.docker.com/extensions/marketplace?extensionId=docker/labs-ai-tools-for-devs)
Docker Desktop extension is installed, all the tools enabled in the catalog are
available for Gordon to use. After installation, you can enable the usage of the
AI Tool Catalog tools in the toolbox section of Gordon.
@y
When the [AI Tool
Catalog](https://open.docker.com/extensions/marketplace?extensionId=docker/labs-ai-tools-for-devs)
Docker Desktop extension is installed, all the tools enabled in the catalog are
available for Gordon to use. After installation, you can enable the usage of the
AI Tool Catalog tools in the toolbox section of Gordon.
@z
