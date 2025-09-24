%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
Title: Docker Desktop in Microsoft Dev Box
linkTitle: Microsoft Dev Box
description: Learn about the benefits of and  how to setup Docker Desktop in Microsoft Dev Box
keywords: desktop, docker, windows, microsoft dev box
weight: 60
aliases:
 - /desktop/features/dev-box/
 - /desktop/setup/install/enterprise-deployment/dev-box/
---
@y
---
Title: Docker Desktop in Microsoft Dev Box
linkTitle: Microsoft Dev Box
description: Learn about the benefits of and  how to setup Docker Desktop in Microsoft Dev Box
keywords: desktop, docker, windows, microsoft dev box
weight: 60
aliases:
 - /desktop/features/dev-box/
 - /desktop/setup/install/enterprise-deployment/dev-box/
---
@z

@x
Docker Desktop is available as a pre-configured image in the Microsoft Azure Marketplace for use with Microsoft Dev Box, allowing developers to quickly set up consistent development environments in the cloud.
@y
Docker Desktop is available as a pre-configured image in the Microsoft Azure Marketplace for use with Microsoft Dev Box, allowing developers to quickly set up consistent development environments in the cloud.
@z

@x
Microsoft Dev Box provides cloud-based, pre-configured developer workstations that allow you to code, build, and test applications without configuring a local development environment. The Docker Desktop image for Microsoft Dev Box comes with Docker Desktop and its dependencies pre-installed, giving you a ready-to-use containerized development environment.
@y
Microsoft Dev Box provides cloud-based, pre-configured developer workstations that allow you to code, build, and test applications without configuring a local development environment. The Docker Desktop image for Microsoft Dev Box comes with Docker Desktop and its dependencies pre-installed, giving you a ready-to-use containerized development environment.
@z

@x
## Key benefits
@y
## Key benefits
@z

@x
- Pre-configured environment: Docker Desktop, WSL2, and other requirements come pre-installed and configured
- Consistent development: Ensure all team members work with the same Docker environment
- Powerful resources: Access more compute power and storage than might be available on local machines
- State persistence: Dev Box maintains your state between sessions, similar to hibernating a local machine
- Seamless licensing: Use your existing Docker subscription or purchase a new one directly through Azure Marketplace
@y
- Pre-configured environment: Docker Desktop, WSL2, and other requirements come pre-installed and configured
- Consistent development: Ensure all team members work with the same Docker environment
- Powerful resources: Access more compute power and storage than might be available on local machines
- State persistence: Dev Box maintains your state between sessions, similar to hibernating a local machine
- Seamless licensing: Use your existing Docker subscription or purchase a new one directly through Azure Marketplace
@z

@x
## Setup
@y
## Setup
@z

@x
### Prerequisites 
@y
### Prerequisites 
@z

@x
- An Azure subscription
- Access to Microsoft Dev Box
- A Docker subscription (Pro, Team, or Business). You can use Docker Desktop in Microsoft Dev Box with any of the following subscription options:
   - An existing or new Docker subscription 
   - A new Docker subscription purchased through Azure Marketplace
   - A Docker Business subscription with SSO configured for your organization
@y
- An Azure subscription
- Access to Microsoft Dev Box
- A Docker subscription (Pro, Team, or Business). You can use Docker Desktop in Microsoft Dev Box with any of the following subscription options:
   - An existing or new Docker subscription 
   - A new Docker subscription purchased through Azure Marketplace
   - A Docker Business subscription with SSO configured for your organization
@z

@x
### Set up Docker Desktop in Dev Box
@y
### Set up Docker Desktop in Dev Box
@z

@x
1. Navigate to the [Docker Desktop for Microsoft Dev Box](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/dockerinc1694120899427.devbox_azuremachine?tab=Overview) listing in Azure Marketplace.
2. Select **Get It Now** to add the virtual machine image to your subscription.
3. Follow the Azure workflow to complete the setup.
4. Use the image to create VMs, assign to Dev Centers, or create Dev Box Pools according to your organization's setup.
@y
1. Navigate to the [Docker Desktop for Microsoft Dev Box](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/dockerinc1694120899427.devbox_azuremachine?tab=Overview) listing in Azure Marketplace.
2. Select **Get It Now** to add the virtual machine image to your subscription.
3. Follow the Azure workflow to complete the setup.
4. Use the image to create VMs, assign to Dev Centers, or create Dev Box Pools according to your organization's setup.
@z

@x
### Activate Docker Desktop
@y
### Activate Docker Desktop
@z

@x
Once your Dev Box is provisioned with the Docker Desktop image:
@y
Once your Dev Box is provisioned with the Docker Desktop image:
@z

@x
1. Start your Dev Box instance.
2. Launch Docker Desktop. 
3. Sign in with your Docker ID.
@y
1. Start your Dev Box instance.
2. Launch Docker Desktop. 
3. Sign in with your Docker ID.
@z

@x
## Support
@y
## Support
@z

@x
For issues related to:
@y
For issues related to:
@z

@x
- Docker Desktop configuration, usage, or licensing: Create a support ticket through [Docker Support](https://hub.docker.com/support).
- Dev Box creation, Azure portal configuration, or networking: Contact Azure Support.
@y
- Docker Desktop configuration, usage, or licensing: Create a support ticket through [Docker Support](https://hub.docker.com/support).
- Dev Box creation, Azure portal configuration, or networking: Contact Azure Support.
@z

@x
## Limitations
@y
## Limitations
@z

@x
- Microsoft Dev Box is currently only available on Windows 10 and 11 (Linux VMs are not supported).
- Performance may vary based on your Dev Box configuration and network conditions.
@y
- Microsoft Dev Box is currently only available on Windows 10 and 11 (Linux VMs are not supported).
- Performance may vary based on your Dev Box configuration and network conditions.
@z
