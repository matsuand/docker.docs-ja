%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Use Docker Model Runner with Compose Bridge 
linkTitle: Use Model Runner
@y
title: Use Docker Model Runner with Compose Bridge 
linkTitle: Use Model Runner
@z

@x
description: How to use Docker Model Runner with Compose Bridge for consistent deployments
keywords: docker compose bridge, customize compose bridge, compose bridge templates, compose to kubernetes, compose bridge transformation, go templates docker, model runner, ai, llms
@y
description: How to use Docker Model Runner with Compose Bridge for consistent deployments
keywords: docker compose bridge, customize compose bridge, compose bridge templates, compose to kubernetes, compose bridge transformation, go templates docker, model runner, ai, llms
@z

@x
Compose Bridge supports model-aware deployments. It can deploy and configure Docker Model Runner, a lightweight service that hosts and serves machine LLMs.
@y
Compose Bridge supports model-aware deployments. It can deploy and configure Docker Model Runner, a lightweight service that hosts and serves machine LLMs.
@z

@x
This reduces manual setup for LLM-enabled services and keeps deployments consistent across Docker Desktop and Kubernetes environments.
@y
This reduces manual setup for LLM-enabled services and keeps deployments consistent across Docker Desktop and Kubernetes environments.
@z

@x
If you have a `models` top-level element in your `compose.yaml` file, Compose Bridge:
@y
If you have a `models` top-level element in your `compose.yaml` file, Compose Bridge:
@z

@x
- Automatically injects environment variables for each model’s endpoint and name.
- Configures model endpoints differently for Docker Desktop vs Kubernetes.
- Optionally deploys Docker Model Runner in Kubernetes when enabled in Helm values
@y
- Automatically injects environment variables for each model’s endpoint and name.
- Configures model endpoints differently for Docker Desktop vs Kubernetes.
- Optionally deploys Docker Model Runner in Kubernetes when enabled in Helm values
@z

@x
## Configure model runner settings
@y
## Configure model runner settings
@z

@x
When deploying using generated Helm Charts, you can control the model runner configuration through Helm values.
@y
When deploying using generated Helm Charts, you can control the model runner configuration through Helm values.
@z

@x within code
# Model Runner settings
@y
# Model Runner settings
@z
@x
    # Set to false for Docker Desktop (uses host instance)
    # Set to true for standalone Kubernetes clusters
@y
    # Set to false for Docker Desktop (uses host instance)
    # Set to true for standalone Kubernetes clusters
@z
@x
    # Endpoint used when enabled=false (Docker Desktop)
@y
    # Endpoint used when enabled=false (Docker Desktop)
@z
@x
    # Deployment settings when enabled=true
@y
    # Deployment settings when enabled=true
@z
@x
    # GPU support
@y
    # GPU support
@z
@x
    # Node scheduling (uncomment and customize as needed)
@y
    # Node scheduling (uncomment and customize as needed)
@z
@x
    # Security context
@y
    # Security context
@z
@x
    # Environment variables (uncomment and add as needed)
@y
    # Environment variables (uncomment and add as needed)
@z
@x
    # Storage for models
@y
    # Storage for models
@z
@x
    # Models to pre-pull
@y
    # Models to pre-pull
@z

@x
## Deploying a model runner
@y
## Deploying a model runner
@z

@x
### Docker Desktop
@y
### Docker Desktop
@z

@x
When `modelRunner.enabled` is `false`, Compose Bridge configures your workloads to connect to Docker Model Runner running on the host:
@y
When `modelRunner.enabled` is `false`, Compose Bridge configures your workloads to connect to Docker Model Runner running on the host:
@z

% snip text...

@x
The endpoint is automatically injected into your service containers.
@y
The endpoint is automatically injected into your service containers.
@z

@x
### Kubernetes
@y
### Kubernetes
@z

@x
When `modelRunner.enabled` is `true`, Compose Bridge uses the generated manifests to deploy Docker Model Runner in your cluster, including:
@y
When `modelRunner.enabled` is `true`, Compose Bridge uses the generated manifests to deploy Docker Model Runner in your cluster, including:
@z

@x
- Deployment: Runs the `docker-model-runner` container
- Service: Exposes port `80` (maps to container port `12434`)
- `PersistentVolumeClaim`: Stores model files
@y
- Deployment: Runs the `docker-model-runner` container
- Service: Exposes port `80` (maps to container port `12434`)
- `PersistentVolumeClaim`: Stores model files
@z

@x
The `modelRunner.enabled` setting also determines the number of replicas for the `model-runner-deployment`:
@y
The `modelRunner.enabled` setting also determines the number of replicas for the `model-runner-deployment`:
@z

@x
- When `true`, the deployment replica count is set to 1, and Docker Model Runner is deployed in the Kubernetes cluster.
- When `false`, the replica count is 0, and no Docker Model Runner resources are deployed.
@y
- When `true`, the deployment replica count is set to 1, and Docker Model Runner is deployed in the Kubernetes cluster.
- When `false`, the replica count is 0, and no Docker Model Runner resources are deployed.
@z
