%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Frequently asked Docker Desktop questions for all platforms
keywords: desktop, mac, windows, faqs
title: General FAQs for Desktop
@y
description: Frequently asked Docker Desktop questions for all platforms
keywords: desktop, mac, windows, faqs
title: General FAQs for Desktop
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
- The resources in the [Learning Center](/manuals/desktop/use-desktop/_index.md)
- Pulling or pushing an image to Docker Hub
- [Image Access Management](/manuals/security/for-developers/access-tokens.md)
- [Static vulnerability scanning](/manuals/docker-hub/repos/manage/vulnerability-scanning.md)
- Viewing remote images in the Docker Dashboard
- Setting up [Dev Environments](/manuals/desktop/features/dev-environments/_index.md)
- Docker Build when using [BuildKit](/manuals/build/buildkit/_index.md#getting-started).
  You can work around this by disabling BuildKit. Run `DOCKER_BUILDKIT=0 docker build .` to disable BuildKit.
- [Kubernetes](/manuals/desktop/features/kubernetes.md) (Images are download when you enable Kubernetes for the first time)
- Checking for updates
- [In-app diagnostics](/manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md#diagnose-from-the-app) (including the [Self-diagnose tool](/manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md#diagnose-from-the-app))
- Sending usage statistics
@y
- The resources in the [Learning Center](manuals/desktop/use-desktop/_index.md)
- Pulling or pushing an image to Docker Hub
- [Image Access Management](manuals/security/for-developers/access-tokens.md)
- [Static vulnerability scanning](manuals/docker-hub/repos/manage/vulnerability-scanning.md)
- Viewing remote images in the Docker Dashboard
- Setting up [Dev Environments](manuals/desktop/features/dev-environments/_index.md)
- Docker Build when using [BuildKit](manuals/build/buildkit/_index.md#getting-started).
  You can work around this by disabling BuildKit. Run `DOCKER_BUILDKIT=0 docker build .` to disable BuildKit.
- [Kubernetes](manuals/desktop/features/kubernetes.md) (Images are download when you enable Kubernetes for the first time)
- Checking for updates
- [In-app diagnostics](manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md#diagnose-from-the-app) (including the [Self-diagnose tool](manuals/desktop/troubleshoot-and-support/troubleshoot/_index.md#diagnose-from-the-app))
- Sending usage statistics
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
For details, see [Docker Engine API](/reference/api/engine/_index.md).
@y
For details, see [Docker Engine API](reference/api/engine/_index.md).
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
For more information and examples, see [how to connect from a container to a service on the host](/manuals/desktop/features/networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@y
For more information and examples, see [how to connect from a container to a service on the host](manuals/desktop/features/networking.md#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@z

@x
### Can I pass through a USB device to a container?
@y
### Can I pass through a USB device to a container?
@z

@x
Docker Desktop does not support direct USB device passthrough. However, you can use USB over IP to connect common USB devices to the Docker Desktop VM and in turn be forwarded to a container. For more details, see [Using USB/IP with Docker Desktop](/manuals/desktop/features/usbip.md).
@y
Docker Desktop does not support direct USB device passthrough. However, you can use USB over IP to connect common USB devices to the Docker Desktop VM and in turn be forwarded to a container. For more details, see [Using USB/IP with Docker Desktop](manuals/desktop/features/usbip.md).
@z

@x
### How do I run Docker Desktop without administrator privileges?
@y
### How do I run Docker Desktop without administrator privileges?
@z

@x
Docker Desktop requires administrator privileges only for installation. Once installed, administrator privileges are not needed to run it. However, for non-admin users to run Docker Desktop, it must be installed using a specific installer flag and meet certain prerequisites, which vary by platform.
@y
Docker Desktop requires administrator privileges only for installation. Once installed, administrator privileges are not needed to run it. However, for non-admin users to run Docker Desktop, it must be installed using a specific installer flag and meet certain prerequisites, which vary by platform.
@z

@x
{{< tabs >}}
{{< tab name="Mac" >}}
@y
{{< tabs >}}
{{< tab name="Mac" >}}
@z

@x
To run Docker Desktop on Mac without requiring administrator privileges, install via the command line and pass the `—user=<userid>` installer flag:
@y
To run Docker Desktop on Mac without requiring administrator privileges, install via the command line and pass the `—user=<userid>` installer flag:
@z

@x
```console
$ /Applications/Docker.app/Contents/MacOS/install --user=<userid>
```
@y
```console
$ /Applications/Docker.app/Contents/MacOS/install --user=<userid>
```
@z

@x
You can then sign in to your machine with the user ID specified, and launch Docker Desktop. 
@y
You can then sign in to your machine with the user ID specified, and launch Docker Desktop. 
@z

@x
> [!NOTE]
> 
> Before launching Docker Desktop, if a `settings-store.json` file (or `settings.json` for Docker Desktop versions 4.34 and earlier) already exists in the `~/Library/Group Containers/group.com.docker/` directory, you will see a **Finish setting up Docker Desktop** window that prompts for administrator privileges when you select **Finish**. To avoid this, ensure you delete the `settings-store.json` file (or `settings.json` for Docker Desktop versions 4.34 and earlier) left behind from any previous installations before launching the application.
@y
> [!NOTE]
> 
> Before launching Docker Desktop, if a `settings-store.json` file (or `settings.json` for Docker Desktop versions 4.34 and earlier) already exists in the `~/Library/Group Containers/group.com.docker/` directory, you will see a **Finish setting up Docker Desktop** window that prompts for administrator privileges when you select **Finish**. To avoid this, ensure you delete the `settings-store.json` file (or `settings.json` for Docker Desktop versions 4.34 and earlier) left behind from any previous installations before launching the application.
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
> [!NOTE]
>
> If you are using the WSL 2 backend, first make sure that you meet the [minimum required version](/manuals/desktop/features/wsl/best-practices.md) for WSL 2. Otherwise, update WSL 2 first.  
@y
> [!NOTE]
>
> If you are using the WSL 2 backend, first make sure that you meet the [minimum required version](manuals/desktop/features/wsl/best-practices.md) for WSL 2. Otherwise, update WSL 2 first.  
@z

@x
To run Docker Desktop on Windows without requiring administrator privileges, install via the command line and pass the `—always-run-service` installer flag.
@y
To run Docker Desktop on Windows without requiring administrator privileges, install via the command line and pass the `—always-run-service` installer flag.
@z

@x
```console
$ "Docker Desktop Installer.exe" install —always-run-service
```
@y
```console
$ "Docker Desktop Installer.exe" install —always-run-service
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
