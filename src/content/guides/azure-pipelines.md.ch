%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Introduction to Azure Pipelines with Docker
linkTitle: Azure Pipelines and Docker
summary: |
  Learn how to automate Docker image build and push using Azure Pipelines.
keywords: azure pipelines, azure devops, ci/cd, docker hub, build and push, automation
@y
title: Introduction to Azure Pipelines with Docker
linkTitle: Azure Pipelines and Docker
summary: |
  Learn how to automate Docker image build and push using Azure Pipelines.
keywords: azure pipelines, azure devops, ci/cd, docker hub, build and push, automation
@z

@x
  time: 10 minutes
@y
  time: 10 分
@z

@x
> This guide is a community contribution. Docker would like to thank [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for his valuable contribution.
@y
> This guide is a community contribution. Docker would like to thank [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for his valuable contribution.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, ensure you have the following requirements:
@y
Before you begin, ensure you have the following requirements:
@z

@x
- A [Docker Hub account](https://hub.docker.com) with a generated access token.
- An active [Azure DevOps project](https://dev.azure.com/) with a connected [Git repository](https://learn.microsoft.com/en-us/azure/devops/repos/git/?view=azure-devops).
- A project that includes a valid [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) at its root or appropriate build context.
@y
- A [Docker Hub account](https://hub.docker.com) with a generated access token.
- An active [Azure DevOps project](https://dev.azure.com/) with a connected [Git repository](https://learn.microsoft.com/en-us/azure/devops/repos/git/?view=azure-devops).
- A project that includes a valid [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) at its root or appropriate build context.
@z

@x
## Overview
@y
## Overview
@z

@x
This guide walks you through building and pushing Docker images using [Azure Pipelines](https://azure.microsoft.com/en-us/products/devops/pipelines), enabling a streamlined and secure CI workflow for containerized applications. You’ll learn how to:
@y
This guide walks you through building and pushing Docker images using [Azure Pipelines](https://azure.microsoft.com/en-us/products/devops/pipelines), enabling a streamlined and secure CI workflow for containerized applications. You’ll learn how to:
@z

@x
- Configure Docker authentication securely.
- Set up an automated pipeline to build and push images.
@y
- Configure Docker authentication securely.
- Set up an automated pipeline to build and push images.
@z

@x
## Set up Azure DevOps to work with Docker Hub
@y
## Set up Azure DevOps to work with Docker Hub
@z

@x
### Step 1: Configure a Docker Hub service connection
@y
### Step 1: Configure a Docker Hub service connection
@z

@x
To securely authenticate with Docker Hub using Azure Pipelines:
@y
To securely authenticate with Docker Hub using Azure Pipelines:
@z

@x
1. Navigate to **Project Settings > Service Connections** in your Azure DevOps project.
2. Select **New service connection > Docker Registry**.
3. Choose **Docker Hub** and provide your Docker Hub credentials or access token.
4. Give the service connection a recognizable name, such as `my-docker-registry`.
5. Grant access only to the specific pipeline(s) that require it for improved security and least privilege.
@y
1. Navigate to **Project Settings > Service Connections** in your Azure DevOps project.
2. Select **New service connection > Docker Registry**.
3. Choose **Docker Hub** and provide your Docker Hub credentials or access token.
4. Give the service connection a recognizable name, such as `my-docker-registry`.
5. Grant access only to the specific pipeline(s) that require it for improved security and least privilege.
@z

@x
> [!IMPORTANT]
>
> Avoid selecting the option to grant access to all pipelines unless absolutely necessary. Always apply the principle of least privilege.
@y
> [!IMPORTANT]
>
> Avoid selecting the option to grant access to all pipelines unless absolutely necessary. Always apply the principle of least privilege.
@z

@x
### Step 2: Create your pipeline
@y
### Step 2: Create your pipeline
@z

@x
Add the following `azure-pipelines.yml` file to the root of your repository:
@y
Add the following `azure-pipelines.yml` file to the root of your repository:
@z

@x
```yaml
# Trigger pipeline on commits to the main branch
trigger:
  - main
@y
```yaml
# Trigger pipeline on commits to the main branch
trigger:
  - main
@z

@x
# Trigger pipeline on pull requests targeting the main branch
pr:
  - main
@y
# Trigger pipeline on pull requests targeting the main branch
pr:
  - main
@z

@x
# Define variables for reuse across the pipeline
variables:
  imageName: 'docker.io/$(dockerUsername)/my-image'
  buildTag: '$(Build.BuildId)'
  latestTag: 'latest'
@y
# Define variables for reuse across the pipeline
variables:
  imageName: 'docker.io/$(dockerUsername)/my-image'
  buildTag: '$(Build.BuildId)'
  latestTag: 'latest'
@z

@x
stages:
  - stage: BuildAndPush
    displayName: Build and Push Docker Image
    jobs:
      - job: DockerJob
        displayName: Build and Push
        pool:
          vmImage: ubuntu-latest
          demands:
            - docker
        steps:
          - checkout: self
            displayName: Checkout Code
@y
stages:
  - stage: BuildAndPush
    displayName: Build and Push Docker Image
    jobs:
      - job: DockerJob
        displayName: Build and Push
        pool:
          vmImage: ubuntu-latest
          demands:
            - docker
        steps:
          - checkout: self
            displayName: Checkout Code
@z

@x
          - task: Docker@2
            displayName: Docker Login
            inputs:
              command: login
              containerRegistry: 'my-docker-registry'  # Service connection name
@y
          - task: Docker@2
            displayName: Docker Login
            inputs:
              command: login
              containerRegistry: 'my-docker-registry'  # Service connection name
@z

@x
          - task: Docker@2
            displayName: Build Docker Image
            inputs:
              command: build
              repository: $(imageName)
              tags: |
                $(buildTag)
                $(latestTag)
              dockerfile: './Dockerfile'
              arguments: |
                --sbom=true
                --attest type=provenance
                --cache-from $(imageName):latest
            env:
              DOCKER_BUILDKIT: 1
@y
          - task: Docker@2
            displayName: Build Docker Image
            inputs:
              command: build
              repository: $(imageName)
              tags: |
                $(buildTag)
                $(latestTag)
              dockerfile: './Dockerfile'
              arguments: |
                --sbom=true
                --attest type=provenance
                --cache-from $(imageName):latest
            env:
              DOCKER_BUILDKIT: 1
@z

@x
          - task: Docker@2
            displayName: Push Docker Image
            condition: eq(variables['Build.SourceBranch'], 'refs/heads/main')
            inputs:
              command: push
              repository: $(imageName)
              tags: |
                $(buildTag)
                $(latestTag)
@y
          - task: Docker@2
            displayName: Push Docker Image
            condition: eq(variables['Build.SourceBranch'], 'refs/heads/main')
            inputs:
              command: push
              repository: $(imageName)
              tags: |
                $(buildTag)
                $(latestTag)
@z

@x
          # Optional: logout for self-hosted agents
          - script: docker logout
            displayName: Docker Logout (Self-hosted only)
            condition: ne(variables['Agent.OS'], 'Windows_NT')
```
@y
          # Optional: logout for self-hosted agents
          - script: docker logout
            displayName: Docker Logout (Self-hosted only)
            condition: ne(variables['Agent.OS'], 'Windows_NT')
```
@z

@x
## What this pipeline does
@y
## What this pipeline does
@z

@x
This pipeline automates the Docker image build and deployment process for the main branch. It ensures a secure and efficient workflow with best practices like caching, tagging, and conditional cleanup. Here's what it does:
@y
This pipeline automates the Docker image build and deployment process for the main branch. It ensures a secure and efficient workflow with best practices like caching, tagging, and conditional cleanup. Here's what it does:
@z

@x
- Triggers on commits and pull requests targeting the `main` branch.
- Authenticates securely with Docker Hub using an Azure DevOps service connection.
- Builds and tags the Docker image using Docker BuildKit for caching.
- Pushes both buildId and latest tags to Docker Hub.
- Logs out from Docker if running on a self-hosted Linux agent.
@y
- Triggers on commits and pull requests targeting the `main` branch.
- Authenticates securely with Docker Hub using an Azure DevOps service connection.
- Builds and tags the Docker image using Docker BuildKit for caching.
- Pushes both buildId and latest tags to Docker Hub.
- Logs out from Docker if running on a self-hosted Linux agent.
@z

@x
## How the pipeline works
@y
## How the pipeline works
@z

@x
### Step 1: Define pipeline triggers 
@y
### Step 1: Define pipeline triggers 
@z

@x
```yaml
trigger:
  - main
@y
```yaml
trigger:
  - main
@z

@x
pr:
  - main
```
@y
pr:
  - main
```
@z

@x
This pipeline is triggered automatically on:
- Commits pushed to the `main` branch
- Pull requests targeting `main` main branch
@y
This pipeline is triggered automatically on:
- Commits pushed to the `main` branch
- Pull requests targeting `main` main branch
@z

@x
> [!TIP]
> Learn more: [Define pipeline triggers in Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/build/triggers?view=azure-devops)
@y
> [!TIP]
> Learn more: [Define pipeline triggers in Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/build/triggers?view=azure-devops)
@z

@x
### Step 2: Define common variables
@y
### Step 2: Define common variables
@z

@x
```yaml
variables:
  imageName: 'docker.io/$(dockerUsername)/my-image'
  buildTag: '$(Build.BuildId)'
  latestTag: 'latest'
```
@y
```yaml
variables:
  imageName: 'docker.io/$(dockerUsername)/my-image'
  buildTag: '$(Build.BuildId)'
  latestTag: 'latest'
```
@z

@x
These variables ensure consistent naming, versioning, and reuse throughout the pipeline steps:
@y
These variables ensure consistent naming, versioning, and reuse throughout the pipeline steps:
@z

@x
- `imageName`: your image path on Docker Hub
- `buildTag`: a unique tag for each pipeline run
- `latestTag`: a stable alias for your most recent image
@y
- `imageName`: your image path on Docker Hub
- `buildTag`: a unique tag for each pipeline run
- `latestTag`: a stable alias for your most recent image
@z

@x
> [!IMPORTANT]
>
> The variable `dockerUsername` is not set automatically.  
> Set it securely in your Azure DevOps pipeline variables:  
>   1. Go to **Pipelines > Edit > Variables**  
>   2. Add `dockerUsername` with your Docker Hub username  
>
> Learn more: [Define and use variables in Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch)
@y
> [!IMPORTANT]
>
> The variable `dockerUsername` is not set automatically.  
> Set it securely in your Azure DevOps pipeline variables:  
>   1. Go to **Pipelines > Edit > Variables**  
>   2. Add `dockerUsername` with your Docker Hub username  
>
> Learn more: [Define and use variables in Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch)
@z

@x
### Step 3: Define pipeline stages and jobs
@y
### Step 3: Define pipeline stages and jobs
@z

@x
```yaml
stages:
  - stage: BuildAndPush
    displayName: Build and Push Docker Image
```
@y
```yaml
stages:
  - stage: BuildAndPush
    displayName: Build and Push Docker Image
```
@z

@x
This stage executes only if the source branch is `main`.
@y
This stage executes only if the source branch is `main`.
@z

@x
> [!TIP]
>
> Learn more: [Stage conditions in Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml)
@y
> [!TIP]
>
> Learn more: [Stage conditions in Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml)
@z

@x
### Step 4: Job configuration
@y
### Step 4: Job configuration
@z

@x
```yaml
jobs:
  - job: DockerJob
  displayName: Build and Push
  pool:
    vmImage: ubuntu-latest
    demands:
      - docker
```
@y
```yaml
jobs:
  - job: DockerJob
  displayName: Build and Push
  pool:
    vmImage: ubuntu-latest
    demands:
      - docker
```
@z

@x
This job utilizes the latest Ubuntu VM image with Docker support, provided by Microsoft-hosted agents. It can be replaced with a custom pool for self-hosted agents if necessary.
@y
This job utilizes the latest Ubuntu VM image with Docker support, provided by Microsoft-hosted agents. It can be replaced with a custom pool for self-hosted agents if necessary.
@z

@x
> [!TIP]
>
> Learn more: [Specify a pool in your pipeline](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/pools-queues?view=azure-devops&tabs=yaml%2Cbrowser)
@y
> [!TIP]
>
> Learn more: [Specify a pool in your pipeline](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/pools-queues?view=azure-devops&tabs=yaml%2Cbrowser)
@z

@x
#### Step 4.1: Checkout code
@y
#### Step 4.1: Checkout code
@z

@x
```yaml
steps:
  - checkout: self
    displayName: Checkout Code
```
@y
```yaml
steps:
  - checkout: self
    displayName: Checkout Code
```
@z

@x
This step pulls your repository code into the build agent, so the pipeline can access the Dockerfile and application files.
@y
This step pulls your repository code into the build agent, so the pipeline can access the Dockerfile and application files.
@z

@x
> [!TIP]
>
> Learn more: [checkout step documentation](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-checkout?view=azure-pipelines)
@y
> [!TIP]
>
> Learn more: [checkout step documentation](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-checkout?view=azure-pipelines)
@z

@x
#### Step 4.2: Authenticate to Docker Hub
@y
#### Step 4.2: Authenticate to Docker Hub
@z

@x
```yaml
- task: Docker@2
  displayName: Docker Login
  inputs:
    command: login
    containerRegistry: 'my-docker-registry'  # Replace with your service connection name
```
@y
```yaml
- task: Docker@2
  displayName: Docker Login
  inputs:
    command: login
    containerRegistry: 'my-docker-registry'  # Replace with your service connection name
```
@z

@x
Uses a pre-configured Azure DevOps Docker registry service connection to authenticate securely without exposing credentials directly.
@y
Uses a pre-configured Azure DevOps Docker registry service connection to authenticate securely without exposing credentials directly.
@z

@x
> [!TIP]
>
> Learn more: [Use service connections for Docker Hub](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops#docker-hub-or-others)
@y
> [!TIP]
>
> Learn more: [Use service connections for Docker Hub](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops#docker-hub-or-others)
@z

@x
#### Step 4.3: Build the Docker image
@y
#### Step 4.3: Build the Docker image
@z

@x
```yaml
 - task: Docker@2
    displayName: Build Docker Image
    inputs:
      command: build
      repository: $(imageName)
      tags: |
          $(buildTag)
          $(latestTag)
      dockerfile: './Dockerfile'
      arguments: |
          --sbom=true
          --attest type=provenance
          --cache-from $(imageName):latest
    env:
      DOCKER_BUILDKIT: 1
```
@y
```yaml
 - task: Docker@2
    displayName: Build Docker Image
    inputs:
      command: build
      repository: $(imageName)
      tags: |
          $(buildTag)
          $(latestTag)
      dockerfile: './Dockerfile'
      arguments: |
          --sbom=true
          --attest type=provenance
          --cache-from $(imageName):latest
    env:
      DOCKER_BUILDKIT: 1
```
@z

@x
This builds the image with:
@y
This builds the image with:
@z

@x
- Two tags: one with the unique Build ID and one as latest
- Docker BuildKit enabled for faster builds and efficient layer caching
- Cache pull from the most recent pushed latest image
- Software Bill of Materials (SBOM) for supply chain transparency
- Provenance attestation to verify how and where the image was built
@y
- Two tags: one with the unique Build ID and one as latest
- Docker BuildKit enabled for faster builds and efficient layer caching
- Cache pull from the most recent pushed latest image
- Software Bill of Materials (SBOM) for supply chain transparency
- Provenance attestation to verify how and where the image was built
@z

@x
> [!TIP]
>
> Learn more: 
> - [Docker task for Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/docker-v2?view=azure-pipelines&tabs=yaml)
> - [Docker SBOM Attestations](/manuals/build/metadata/attestations/slsa-provenance.md)
@y
> [!TIP]
>
> Learn more: 
> - [Docker task for Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/docker-v2?view=azure-pipelines&tabs=yaml)
> - [Docker SBOM Attestations](manuals/build/metadata/attestations/slsa-provenance.md)
@z

@x
#### Step 4.4: Push the Docker image
@y
#### Step 4.4: Push the Docker image
@z

@x
```yaml
- task: Docker@2
  displayName: Push Docker Image
  condition: eq(variables['Build.SourceBranch'], 'refs/heads/main')
  inputs:
      command: push
      repository: $(imageName)
      tags: |
        $(buildTag)
        $(latestTag)
```
@y
```yaml
- task: Docker@2
  displayName: Push Docker Image
  condition: eq(variables['Build.SourceBranch'], 'refs/heads/main')
  inputs:
      command: push
      repository: $(imageName)
      tags: |
        $(buildTag)
        $(latestTag)
```
@z

@x
By applying this condition, the pipeline builds the Docker image on every run to ensure early detection of issues, but only pushes the image to the registry when changes are merged into the main branch—keeping your Docker Hub clean and focused
@y
By applying this condition, the pipeline builds the Docker image on every run to ensure early detection of issues, but only pushes the image to the registry when changes are merged into the main branch—keeping your Docker Hub clean and focused
@z

@x
This uploads both tags to Docker Hub:
- `$(buildTag)` ensures traceability per run.
- `latest` is used for most recent image references.
@y
This uploads both tags to Docker Hub:
- `$(buildTag)` ensures traceability per run.
- `latest` is used for most recent image references.
@z

@x
#### Step 4.5  Logout of Docker (self-hosted agents)
@y
#### Step 4.5  Logout of Docker (self-hosted agents)
@z

@x
```yaml
- script: docker logout
  displayName: Docker Logout (Self-hosted only)
  condition: ne(variables['Agent.OS'], 'Windows_NT')
```
@y
```yaml
- script: docker logout
  displayName: Docker Logout (Self-hosted only)
  condition: ne(variables['Agent.OS'], 'Windows_NT')
```
@z

@x
Executes docker logout at the end of the pipeline on Linux-based self-hosted agents to proactively clean up credentials and enhance security posture.
@y
Executes docker logout at the end of the pipeline on Linux-based self-hosted agents to proactively clean up credentials and enhance security posture.
@z

@x
## Summary
@y
## Summary
@z

@x
With this Azure Pipelines CI setup, you get:
@y
With this Azure Pipelines CI setup, you get:
@z

@x
- Secure Docker authentication using a built-in service connection.
- Automated image building and tagging triggered by code changes.
- Efficient builds leveraging Docker BuildKit cache.
- Safe cleanup with logout on persistent agents.
- Build images that meet modern software supply chain requirements with SBOM and attestation
@y
- Secure Docker authentication using a built-in service connection.
- Automated image building and tagging triggered by code changes.
- Efficient builds leveraging Docker BuildKit cache.
- Safe cleanup with logout on persistent agents.
- Build images that meet modern software supply chain requirements with SBOM and attestation
@z

@x
## Learn more
@y
## Learn more
@z

@x
- [Azure Pipelines Documentation](https://learn.microsoft.com/en-us/azure/devops/pipelines/?view=azure-devops): Comprehensive guide to configuring and managing CI/CD pipelines in Azure DevOps.
- [Docker Task for Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/build/docker): Detailed reference for using the Docker task in Azure Pipelines to build and push images.
- [Docker Buildx Bake](/manuals/build/bake/_index.md): Explore Docker's advanced build tool for complex, multi-stage, and multi-platform build setups. See also the [Mastering Buildx Bake Guide](/guides/bake/) for practical examples and best practices.
- [Docker Build Cloud](/guides/docker-build-cloud/_index.md): Learn about Docker's managed build service for faster, scalable, and multi-platform image builds in the cloud.
@y
- [Azure Pipelines Documentation](https://learn.microsoft.com/en-us/azure/devops/pipelines/?view=azure-devops): Comprehensive guide to configuring and managing CI/CD pipelines in Azure DevOps.
- [Docker Task for Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/build/docker): Detailed reference for using the Docker task in Azure Pipelines to build and push images.
- [Docker Buildx Bake](manuals/build/bake/_index.md): Explore Docker's advanced build tool for complex, multi-stage, and multi-platform build setups. See also the [Mastering Buildx Bake Guide](__SUBDIR__/guides/bake/) for practical examples and best practices.
- [Docker Build Cloud](guides/docker-build-cloud/_index.md): Learn about Docker's managed build service for faster, scalable, and multi-platform image builds in the cloud.
@z
