%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Frequently asked Docker Desktop questions for all platforms
keywords: desktop, mac, windows, faqs
title: General FAQs for Desktop
aliases:
- /mackit/faqs/
- /docker-for-mac/faqs/
- /docker-for-windows/faqs/
- /desktop/faqs/
---
@y
---
description: Frequently asked Docker Desktop questions for all platforms
keywords: desktop, mac, windows, faqs
title: General FAQs for Desktop
aliases:
- /mackit/faqs/
- /docker-for-mac/faqs/
- /docker-for-windows/faqs/
- /desktop/faqs/
---
@z

@x
### What are the system requirements for Docker Desktop?
@y
### What are the system requirements for Docker Desktop?
@z

@x
For information about Docker Desktop system requirements, see:
@y
For information about Docker Desktop system requirements, see:
@z

@x
- [Mac system requirements](../install/mac-install.md#system-requirements)
- [Windows system requirements](../install/windows-install.md#system-requirements)
- [Linux system requirements](../install/linux-install.md#system-requirements)
@y
- [Mac system requirements](../install/mac-install.md#system-requirements)
- [Windows system requirements](../install/windows-install.md#system-requirements)
- [Linux system requirements](../install/linux-install.md#system-requirements)
@z

@x
### Where does Docker Desktop get installed on my machine?
@y
### Where does Docker Desktop get installed on my machine?
@z

@x
By default, Docker Desktop is installed at the following location:
@y
By default, Docker Desktop is installed at the following location:
@z

@x
- On Mac: `/Applications/Docker.app`
- On Windows: `C:\Program Files\Docker\Docker`
- On Linux: `/opt/docker-desktop`
@y
- On Mac: `/Applications/Docker.app`
- On Windows: `C:\Program Files\Docker\Docker`
- On Linux: `/opt/docker-desktop`
@z

@x
### Do I need to pay to use Docker Desktop?
@y
### Do I need to pay to use Docker Desktop?
@z

@x
Docker Desktop is free for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open-source projects. Otherwise, it requires a paid subscription for professional use. Paid subscriptions are also required for government entities. When downloading and installing Docker Desktop, you are asked to agree to the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement).
@y
Docker Desktop is free for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open-source projects. Otherwise, it requires a paid subscription for professional use. Paid subscriptions are also required for government entities. When downloading and installing Docker Desktop, you are asked to agree to the [Docker Subscription Service Agreement](https://www.docker.com/legal/docker-subscription-service-agreement).
@z

@x
Read the [Blog](https://www.docker.com/blog/updating-product-subscriptions/) and [FAQs](https://www.docker.com/pricing/faq) to learn more.
@y
Read the [Blog](https://www.docker.com/blog/updating-product-subscriptions/) and [FAQs](https://www.docker.com/pricing/faq) to learn more.
@z

@x
### Do I need to pay to create or share Docker Extensions?
@y
### Do I need to pay to create or share Docker Extensions?
@z

@x
No, the [Docker Extension SDK](https://www.npmjs.com/package/@docker/extension-api-client) is licensed under the Apache 2.0 License and is free to use. Anyone can create new Docker Extensions and share them without constraints.
@y
No, the [Docker Extension SDK](https://www.npmjs.com/package/@docker/extension-api-client) is licensed under the Apache 2.0 License and is free to use. Anyone can create new Docker Extensions and share them without constraints.
@z

@x
### Do I need to use a specific license when I create a Docker Extension?
@y
### Do I need to use a specific license when I create a Docker Extension?
@z

@x
No, there is no constraint on how each extension should be licensed, this is up to the extension authors to decide when creating a new extension.
@y
No, there is no constraint on how each extension should be licensed, this is up to the extension authors to decide when creating a new extension.
@z

@x
### Can I use Docker Desktop offline?
@y
### Can I use Docker Desktop offline?
@z

@x
Yes, you can use Docker Desktop offline. However, you
cannot access features that require an active internet
connection. Additionally, any functionality that requires you to sign in won't work while using Docker Desktop offline or in air-gapped environments.
This includes:
@y
Yes, you can use Docker Desktop offline. However, you
cannot access features that require an active internet
connection. Additionally, any functionality that requires you to sign in won't work while using Docker Desktop offline or in air-gapped environments.
This includes:
@z

@x
- The resources in the [Learning Center](../use-desktop/index.md)
- Pulling or pushing an image to Docker Hub
- [Image Access Management](../../security/for-developers/access-tokens.md)
- [Static vulnerability scanning](../../docker-hub/vulnerability-scanning.md)
- Viewing remote images in the Docker Dashboard
- Setting up [Dev Environments](../dev-environments/index.md)
- Docker Build when using [BuildKit](../../build/buildkit/index.md#getting-started).
  You can work around this by disabling BuildKit. Run `DOCKER_BUILDKIT=0 docker build .` to disable BuildKit.
- [Kubernetes](../kubernetes.md) (Images are download when you enable Kubernetes for the first time)
- Checking for updates
- [In-app diagnostics](../troubleshoot/overview.md#diagnose-from-the-app) (including the [Self-diagnose tool](../troubleshoot/overview.md#diagnose-from-the-app))
- Sending usage statistics
@y
- The resources in the [Learning Center](../use-desktop/index.md)
- Pulling or pushing an image to Docker Hub
- [Image Access Management](../../security/for-developers/access-tokens.md)
- [Static vulnerability scanning](../../docker-hub/vulnerability-scanning.md)
- Viewing remote images in the Docker Dashboard
- Setting up [Dev Environments](../dev-environments/index.md)
- Docker Build when using [BuildKit](../../build/buildkit/index.md#getting-started).
  You can work around this by disabling BuildKit. Run `DOCKER_BUILDKIT=0 docker build .` to disable BuildKit.
- [Kubernetes](../kubernetes.md) (Images are download when you enable Kubernetes for the first time)
- Checking for updates
- [In-app diagnostics](../troubleshoot/overview.md#diagnose-from-the-app) (including the [Self-diagnose tool](../troubleshoot/overview.md#diagnose-from-the-app))
- Sending usage statistics
@z

@x
### Where can I find information about diagnosing and troubleshooting Docker Desktop issues?
@y
### Where can I find information about diagnosing and troubleshooting Docker Desktop issues?
@z

@x
You can find information about diagnosing and troubleshooting common issues in the [Troubleshooting topic](../troubleshoot/overview.md).
@y
You can find information about diagnosing and troubleshooting common issues in the [Troubleshooting topic](../troubleshoot/overview.md).
@z

@x
If you do not find a solution in troubleshooting, browse the GitHub repositories or create a new issue:
@y
If you do not find a solution in troubleshooting, browse the GitHub repositories or create a new issue:
@z

@x
- [docker/for-mac](https://github.com/docker/for-mac/issues)
- [docker/for-win](https://github.com/docker/for-win/issues)
- [docker/for-linux](https://github.com/docker/for-linux/issues)
@y
- [docker/for-mac](https://github.com/docker/for-mac/issues)
- [docker/for-win](https://github.com/docker/for-win/issues)
- [docker/for-linux](https://github.com/docker/for-linux/issues)
@z

@x
### How do I connect to the remote Docker Engine API?
@y
### How do I connect to the remote Docker Engine API?
@z

@x
To connect to the remote Engine API, you might need to provide the location of the Engine API for Docker clients and development tools.
@y
To connect to the remote Engine API, you might need to provide the location of the Engine API for Docker clients and development tools.
@z

@x
Mac and Windows WSL 2 users can connect to the Docker Engine through a Unix socket: `unix:///var/run/docker.sock`.
@y
Mac and Windows WSL 2 users can connect to the Docker Engine through a Unix socket: `unix:///var/run/docker.sock`.
@z

@x
If you are working with applications like [Apache Maven](https://maven.apache.org/)
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
@y
If you are working with applications like [Apache Maven](https://maven.apache.org/)
that expect settings for `DOCKER_HOST` and `DOCKER_CERT_PATH` environment
variables, specify these to connect to Docker instances through Unix sockets.
@z

@x
For example:
@y
For example:
@z

@x
```console
$ export DOCKER_HOST=unix:///var/run/docker.sock
```
@y
```console
$ export DOCKER_HOST=unix:///var/run/docker.sock
```
@z

@x
Docker Desktop Windows users can connect to the Docker Engine through a **named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@y
Docker Desktop Windows users can connect to the Docker Engine through a **named pipe**: `npipe:////./pipe/docker_engine`, or **TCP socket** at this URL:
`tcp://localhost:2375`.
@z

@x
For details, see [Docker Engine API](../../engine/api/index.md).
@y
For details, see [Docker Engine API](../../engine/api/index.md).
@z

@x
### How do I connect from a container to a service on the host?
@y
### How do I connect from a container to a service on the host?
@z

@x
The host has a changing IP address, or none if you have no network access.
We recommend that you connect to the special DNS name `host.docker.internal`,
which resolves to the internal IP address used by the host.
@y
The host has a changing IP address, or none if you have no network access.
We recommend that you connect to the special DNS name `host.docker.internal`,
which resolves to the internal IP address used by the host.
@z

@x
For more information and examples, see [how to connect from a container to a service on the host](../networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@y
For more information and examples, see [how to connect from a container to a service on the host](../networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@z

@x
### Can I pass through a USB device to a container?
@y
### Can I pass through a USB device to a container?
@z

@x
It is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
@y
It is not possible to pass through a USB device (or a
serial port) to a container as it requires support at the hypervisor level.
@z

@x
### Can I run Docker Desktop in nested virtualization scenarios?
@y
### Can I run Docker Desktop in nested virtualization scenarios?
@z

@x
In general, Docker recommends running Docker Desktop natively on either Mac, Linux, or Windows. However, Docker Desktop for Windows can run inside a virtual desktop provided the virtual desktop is properly configured. For more information, see [Run Docker Desktop in a VM or VDI environment](../vm-vdi.md)
@y
In general, Docker recommends running Docker Desktop natively on either Mac, Linux, or Windows. However, Docker Desktop for Windows can run inside a virtual desktop provided the virtual desktop is properly configured. For more information, see [Run Docker Desktop in a VM or VDI environment](../vm-vdi.md)
@z

@x
### Docker Desktop's UI appears green, distorted, or has visual artifacts. How do I fix this?
@y
### Docker Desktop's UI appears green, distorted, or has visual artifacts. How do I fix this?
@z

@x
Docker Desktop uses hardware-accelerated graphics by default, which may cause problems for some GPUs. In such cases,
Docker Desktop will launch successfully, but some screens may appear green, distorted,
or have some visual artifacts.
@y
Docker Desktop uses hardware-accelerated graphics by default, which may cause problems for some GPUs. In such cases,
Docker Desktop will launch successfully, but some screens may appear green, distorted,
or have some visual artifacts.
@z

@x
To work around this issue, disable hardware acceleration by creating a `"disableHardwareAcceleration": true` entry in Docker Desktop's `settings.json` file. You can find this file at:
@y
To work around this issue, disable hardware acceleration by creating a `"disableHardwareAcceleration": true` entry in Docker Desktop's `settings.json` file. You can find this file at:
@z

@x
- Mac: `~/Library/Group Containers/group.com.docker/settings.json`
- Windows: `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings.json`
- Linux: `~/.docker/desktop/settings.json.`
@y
- Mac: `~/Library/Group Containers/group.com.docker/settings.json`
- Windows: `C:\Users\[USERNAME]\AppData\Roaming\Docker\settings.json`
- Linux: `~/.docker/desktop/settings.json.`
@z

@x
After updating the `settings.json` file, close and restart Docker Desktop to apply the changes.
@y
After updating the `settings.json` file, close and restart Docker Desktop to apply the changes.
@z

@x
### Can I run Docker Desktop on Virtualized hardware?
@y
### Can I run Docker Desktop on Virtualized hardware?
@z

@x
Yes, see section [Run Docker Desktop for Windows in a VM or VDI environment](../vm-vdi.md) for more information on how to do this.
@y
Yes, see section [Run Docker Desktop for Windows in a VM or VDI environment](../vm-vdi.md) for more information on how to do this.
@z
