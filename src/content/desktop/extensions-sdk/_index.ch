%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Overview of the Extensions SDK
description: Overall index for Docker Extensions SDK documentation
keywords: Docker, Extensions, sdk
aliases:
- /desktop/extensions-sdk/dev/overview/
grid:
  - title: "The build and publish process"
    description: Understand the process for building and publishing an extension.
    icon: "checklist"
    link: "/desktop/extensions-sdk/process/"
  - title: "Quickstart guide"
    description: Follow the quickstart guide to create a basic Docker Extension quickly.
    icon: "explore"
    link: "/desktop/extensions-sdk/quickstart/"
  - title: "View the design guidelines"
    description: Ensure your extension aligns to Docker's design guidelines and principles.
    icon: "design_services"
    link: "/desktop/extensions-sdk/design/design-guidelines/"
  - title: "Publish your extension"
    description: Understand how to publish your extension to the Marketplace.
    icon: "publish"
    link: "/desktop/extensions-sdk/extensions/"
  - title: "Interacting with Kubernetes"
    description: Find information on how to interact indirectly with a Kubernetes cluster from your Docker Extension.
    icon: "multiple_stop"
    link: "/desktop/extensions-sdk/dev/kubernetes/"
  - title: "Multi-arch extensions"
    description: Build your extension for multiple architectures.
    icon: "content_copy"
    link: "/desktop/extensions-sdk/extensions/multi-arch/"
---
@y
---
title: Overview of the Extensions SDK
description: Overall index for Docker Extensions SDK documentation
keywords: Docker, Extensions, sdk
aliases:
- /desktop/extensions-sdk/dev/overview/
grid:
  - title: "The build and publish process"
    description: Understand the process for building and publishing an extension.
    icon: "checklist"
    link: "/desktop/extensions-sdk/process/"
  - title: "Quickstart guide"
    description: Follow the quickstart guide to create a basic Docker Extension quickly.
    icon: "explore"
    link: "/desktop/extensions-sdk/quickstart/"
  - title: "View the design guidelines"
    description: Ensure your extension aligns to Docker's design guidelines and principles.
    icon: "design_services"
    link: "/desktop/extensions-sdk/design/design-guidelines/"
  - title: "Publish your extension"
    description: Understand how to publish your extension to the Marketplace.
    icon: "publish"
    link: "/desktop/extensions-sdk/extensions/"
  - title: "Interacting with Kubernetes"
    description: Find information on how to interact indirectly with a Kubernetes cluster from your Docker Extension.
    icon: "multiple_stop"
    link: "/desktop/extensions-sdk/dev/kubernetes/"
  - title: "Multi-arch extensions"
    description: Build your extension for multiple architectures.
    icon: "content_copy"
    link: "/desktop/extensions-sdk/extensions/multi-arch/"
---
@z

@x
The resources in this section help you create your own Docker extension.
@y
The resources in this section help you create your own Docker extension.
@z

@x
The Docker CLI tool provides a set of commands to help you build and publish your extension, packaged as a 
specially formatted Docker image.
@y
The Docker CLI tool provides a set of commands to help you build and publish your extension, packaged as a 
specially formatted Docker image.
@z

@x
At the root of the image filesystem is a `metadata.json` file which describes the content of the extension. 
It's a fundamental element of a Docker extension.
@y
At the root of the image filesystem is a `metadata.json` file which describes the content of the extension. 
It's a fundamental element of a Docker extension.
@z

@x
An extension can contain a UI part and backend parts that run either on the host or in the Desktop virtual machine.
For further information, see [Architecture](architecture/index.md).
@y
An extension can contain a UI part and backend parts that run either on the host or in the Desktop virtual machine.
For further information, see [Architecture](architecture/index.md).
@z

@x
You distribute extensions through Docker Hub. However, you can develop them locally without the need to push 
the extension to Docker Hub. See [Extensions distribution](extensions/DISTRIBUTION.md) for further details.
@y
You distribute extensions through Docker Hub. However, you can develop them locally without the need to push 
the extension to Docker Hub. See [Extensions distribution](extensions/DISTRIBUTION.md) for further details.
@z

@x
{{< include "extensions-form.md" >}}
@y
{{< include "extensions-form.md" >}}
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
