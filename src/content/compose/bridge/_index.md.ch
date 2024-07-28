%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Understand what Compose Bridge is and how it can be useful
keywords: compose, orchestration, kubernetes, bridge
title: Overview of Compose Bridge
@y
description: Understand what Compose Bridge is and how it can be useful
keywords: compose, orchestration, kubernetes, bridge
title: Overview of Compose Bridge
@z

% snip include ...

@x
Compose Bridge lets you transform your Compose configuration file into configuration files for different platforms, primarily focusing on Kubernetes. The default transformation generates Kubernetes manifests and a Kustomize overlay which are designed for deployment on Docker Desktop with Kubernetes enabled.  
@y
Compose Bridge lets you transform your Compose configuration file into configuration files for different platforms, primarily focusing on Kubernetes. The default transformation generates Kubernetes manifests and a Kustomize overlay which are designed for deployment on Docker Desktop with Kubernetes enabled.  
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
## Setup
@y
## Setup
@z

@x
To get started with Compose Bridge, you need to:
@y
To get started with Compose Bridge, you need to:
@z

@x
1. Download and install a version of Docker Desktop that supports Compose Bridge.
2. Sign in to your Docker account.
3. Navigate to the **Features in development** tab in **Settings**. 
4. From the **Experimental features** tab, select **Enable Compose Bridge**.
@y
1. Download and install a version of Docker Desktop that supports Compose Bridge.
2. Sign in to your Docker account.
3. Navigate to the **Features in development** tab in **Settings**. 
4. From the **Experimental features** tab, select **Enable Compose Bridge**.
@z

@x
## Feedback
@y
## Feedback
@z

@x
To give feedback, report bugs, or receive support, email `desktop-preview@docker.com`. There is also a dedicated Slack channel. To join, simply send an email to the provided address.
@y
To give feedback, report bugs, or receive support, email `desktop-preview@docker.com`. There is also a dedicated Slack channel. To join, simply send an email to the provided address.
@z

@x
## What's next?
@y
## What's next?
@z

@x
- [Use Compose Bridge](usage.md)
- [Explore how you can customize Compose Bridge](customize.md)
- [Explore the advanced integration](advanced-integration.md)
@y
- [Use Compose Bridge](usage.md)
- [Explore how you can customize Compose Bridge](customize.md)
- [Explore the advanced integration](advanced-integration.md)
@z
