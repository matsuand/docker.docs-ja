%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Quick install Docker Sandboxes
linkTitle: Docker Sandboxes
description: Install the sbx CLI, sign in, and prepare to run an AI coding agent in a Docker Sandbox.
keywords: Docker Sandboxes, sbx, quick install, AI agents
@y
title: Quick install Docker Sandboxes
linkTitle: Docker Sandboxes
description: Install the sbx CLI, sign in, and prepare to run an AI coding agent in a Docker Sandbox.
keywords: Docker Sandboxes, sbx, quick install, AI agents
@z

@x
Install the `sbx` CLI to run coding agents in local or cloud sandboxes.
Docker Desktop and Docker Engine are not required.
@y
Install the `sbx` CLI to run coding agents in local or cloud sandboxes.
Docker Desktop and Docker Engine are not required.
@z

@x
## Install the CLI
@y
## Install the CLI
@z

@x
{{< tabs >}}
{{< tab name="macOS" >}}
@y
{{< tabs >}}
{{< tab name="macOS" >}}
@z

@x
Requires macOS Sonoma 14 or later on Apple silicon, with Homebrew installed.
@y
Requires macOS Sonoma 14 or later on Apple silicon, with Homebrew installed.
@z

@x
```console
$ brew trust docker/tap
$ brew install docker/tap/sbx
```
@y
```console
$ brew trust docker/tap
$ brew install docker/tap/sbx
```
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
Requires Windows 11 on a 64-bit Intel or AMD processor. Install for your user
account with Windows Package Manager:
@y
Requires Windows 11 on a 64-bit Intel or AMD processor. Install for your user
account with Windows Package Manager:
@z

@x
```powershell
winget install -h Docker.sbx
```
@y
```powershell
winget install -h Docker.sbx
```
@z

@x
Open a terminal after installation so it picks up the updated `PATH`.
@y
Open a terminal after installation so it picks up the updated `PATH`.
@z

@x
{{< /tab >}}
{{< tab name="Ubuntu" >}}
@y
{{< /tab >}}
{{< tab name="Ubuntu" >}}
@z

@x
Requires Ubuntu 24.04 or later on a 64-bit Intel, AMD, or Arm processor.
Add Docker's package repository, then install `sbx`:
@y
Requires Ubuntu 24.04 or later on a 64-bit Intel, AMD, or Arm processor.
Add Docker's package repository, then install `sbx`:
@z

@x
```console
$ curl -fsSL https://get.docker.com | sudo REPO_ONLY=1 sh
$ sudo apt install docker-sbx
```
@y
```console
$ curl -fsSL https://get.docker.com | sudo REPO_ONLY=1 sh
$ sudo apt install docker-sbx
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Local sandboxes also require hardware virtualization. Before starting a local
sandbox, follow the [platform prerequisites](/manuals/ai/sandboxes/install.md#prerequisites)
to set up Windows Hypervisor Platform or KVM where needed. Cloud sandboxes do
not require local virtualization.
@y
Local sandboxes also require hardware virtualization. Before starting a local
sandbox, follow the [platform prerequisites](manuals/ai/sandboxes/install.md#prerequisites)
to set up Windows Hypervisor Platform or KVM where needed. Cloud sandboxes do
not require local virtualization.
@z

@x
For manual downloads, machine-wide deployment, and troubleshooting, see the
[full Sandboxes installation instructions](/manuals/ai/sandboxes/install.md).
@y
For manual downloads, machine-wide deployment, and troubleshooting, see the
[full Sandboxes installation instructions](manuals/ai/sandboxes/install.md).
@z

@x
## Check the installation and sign in
@y
## Check the installation and sign in
@z

@x
```console
$ sbx version
$ sbx login
```
@y
```console
$ sbx version
$ sbx login
```
@z

@x
The login command opens your browser to sign in to Docker.
@y
The login command opens your browser to sign in to Docker.
@z
