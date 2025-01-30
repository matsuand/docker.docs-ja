%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Overview of the Extensions SDK
linkTitle: Extensions SDK
@y
title: Overview of the Extensions SDK
linkTitle: Extensions SDK
@z

@x
description: Overall index for Docker Extensions SDK documentation
keywords: Docker, Extensions, sdk
@y
description: Overall index for Docker Extensions SDK documentation
keywords: Docker, Extensions, sdk
@z

% snip aliases...
% snip grid:

@x
  - title: "The build and publish process"
    description: Understand the process for building and publishing an extension.
    icon: "checklist"
    link: "/extensions/extensions-sdk/process/"
@y
  - title: "The build and publish process"
    description: Understand the process for building and publishing an extension.
    icon: "checklist"
    link: "__SUBDIR__/extensions/extensions-sdk/process/"
@z

@x
  - title: "Quickstart guide"
    description: Follow the quickstart guide to create a basic Docker extension quickly.
    icon: "explore"
    link: "/extensions/extensions-sdk/quickstart/"
@y
  - title: "Quickstart guide"
    description: Follow the quickstart guide to create a basic Docker extension quickly.
    icon: "explore"
    link: "__SUBDIR__/extensions/extensions-sdk/quickstart/"
@z

@x
  - title: "View the design guidelines"
    description: Ensure your extension aligns to Docker's design guidelines and principles.
    icon: "design_services"
    link: "/extensions/extensions-sdk/design/design-guidelines/"
@y
  - title: "View the design guidelines"
    description: Ensure your extension aligns to Docker's design guidelines and principles.
    icon: "design_services"
    link: "__SUBDIR__/extensions/extensions-sdk/design/design-guidelines/"
@z

@x
  - title: "Publish your extension"
    description: Understand how to publish your extension to the Marketplace.
    icon: "publish"
    link: "/extensions/extensions-sdk/extensions/"
@y
  - title: "Publish your extension"
    description: Understand how to publish your extension to the Marketplace.
    icon: "publish"
    link: "__SUBDIR__/extensions/extensions-sdk/extensions/"
@z

@x
  - title: "Interacting with Kubernetes"
    description: Find information on how to interact indirectly with a Kubernetes cluster from your Docker extension.
    icon: "multiple_stop"
    link: "/extensions/extensions-sdk/guides/kubernetes/"
@y
  - title: "Interacting with Kubernetes"
    description: Find information on how to interact indirectly with a Kubernetes cluster from your Docker extension.
    icon: "multiple_stop"
    link: "__SUBDIR__/extensions/extensions-sdk/guides/kubernetes/"
@z

@x
  - title: "Multi-arch extensions"
    description: Build your extension for multiple architectures.
    icon: "content_copy"
    link: "/extensions/extensions-sdk/extensions/multi-arch/"
@y
  - title: "Multi-arch extensions"
    description: Build your extension for multiple architectures.
    icon: "content_copy"
    link: "__SUBDIR__/extensions/extensions-sdk/extensions/multi-arch/"
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
For further information, see [Architecture](architecture/_index.md).
@y
An extension can contain a UI part and backend parts that run either on the host or in the Desktop virtual machine.
For further information, see [Architecture](architecture/_index.md).
@z

@x
You distribute extensions through Docker Hub. However, you can develop them locally without the need to push 
the extension to Docker Hub. See [Extensions distribution](extensions/DISTRIBUTION.md) for further details.
@y
You distribute extensions through Docker Hub. However, you can develop them locally without the need to push 
the extension to Docker Hub. See [Extensions distribution](extensions/DISTRIBUTION.md) for further details.
@z

@x
{{% include "extensions-form.md" %}}
@y
{{% include "extensions-form.md" %}}
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
