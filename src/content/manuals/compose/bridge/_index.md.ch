%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
description: Learn how Compose Bridge transforms Docker Compose files into Kubernetes manifests for seamless platform transitions
keywords: docker compose bridge, compose to kubernetes, docker compose kubernetes integration, docker compose kustomize, compose bridge docker desktop
title: Overview of Compose Bridge
linkTitle: Compose Bridge
@y
description: Learn how Compose Bridge transforms Docker Compose files into Kubernetes manifests for seamless platform transitions
keywords: docker compose bridge, compose to kubernetes, docker compose kubernetes integration, docker compose kustomize, compose bridge docker desktop
title: Overview of Compose Bridge
linkTitle: Compose Bridge
@z

% snip include ...

@x
Compose Bridge converts your Docker Compose configuration into platform-specific formats—primarily Kubernetes manifests. The default transformation generates Kubernetes manifests and a Kustomize overlay which are designed for deployment on Docker Desktop with Kubernetes enabled.  
@y
Compose Bridge converts your Docker Compose configuration into platform-specific formats—primarily Kubernetes manifests. The default transformation generates Kubernetes manifests and a Kustomize overlay which are designed for deployment on Docker Desktop with Kubernetes enabled.  
@z

@x
It's a flexible tool that lets you either take advantage of the [default transformation](usage.md) or [create a custom transformation](customize.md) to suit specific project needs and requirements.  
@y
It's a flexible tool that lets you either take advantage of the [default transformation](usage.md) or [create a custom transformation](customize.md) to suit specific project needs and requirements.  
@z

@x
Compose Bridge significantly simplifies the transition from Docker Compose to Kubernetes, making it easier for you to leverage the power of Kubernetes while maintaining the simplicity and efficiency of Docker Compose.
@y
Compose Bridge significantly simplifies the transition from Docker Compose to Kubernetes, making it easier for you to leverage the power of Kubernetes while maintaining the simplicity and efficiency of Docker Compose.
@z

@x
## How it works
@y
## How it works
@z

@x
Compose Bridge uses transformations to let you convert a Compose model into another form. 
@y
Compose Bridge uses transformations to let you convert a Compose model into another form. 
@z

@x
A transformation is packaged as a Docker image that receives the fully resolved Compose model as `/in/compose.yaml` and can produce any target format file under `/out`.
@y
A transformation is packaged as a Docker image that receives the fully resolved Compose model as `/in/compose.yaml` and can produce any target format file under `/out`.
@z

@x
Compose Bridge provides its own transformation for Kubernetes using Go templates, so that it is easy to extend for customization by replacing or appending your own templates.
@y
Compose Bridge provides its own transformation for Kubernetes using Go templates, so that it is easy to extend for customization by replacing or appending your own templates.
@z

@x
For more detailed information on how these transformations work and how you can customize them for your projects, see [Customize](customize.md).
@y
For more detailed information on how these transformations work and how you can customize them for your projects, see [Customize](customize.md).
@z

@x
## What's next?
@y
## What's next?
@z

@x
- [Use Compose Bridge](usage.md)
- [Explore how you can customize Compose Bridge](customize.md)
@y
- [Use Compose Bridge](usage.md)
- [Explore how you can customize Compose Bridge](customize.md)
@z
