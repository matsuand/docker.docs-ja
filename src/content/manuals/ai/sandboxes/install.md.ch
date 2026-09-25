%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Install Docker Sandboxes
linkTitle: Install
@y
title: Install Docker Sandboxes
linkTitle: Install
@z

@x
description: Install the sbx CLI on macOS, Windows, or Linux and sign in to Docker Sandboxes.
keywords: sandbox, sbx, install, macOS, Windows, Linux, Ubuntu
@y
description: Install the sbx CLI on macOS, Windows, or Linux and sign in to Docker Sandboxes.
keywords: sandbox, sbx, install, macOS, Windows, Linux, Ubuntu
@z

@x
Install the `sbx` CLI to run AI coding agents in local or cloud sandboxes. You
don't need Docker Desktop or Docker Engine to use `sbx`. Cloud sandboxes require
version 0.45.0 or later for the workflows in these guides.
@y
Install the `sbx` CLI to run AI coding agents in local or cloud sandboxes. You
don't need Docker Desktop or Docker Engine to use `sbx`. Cloud sandboxes require
version 0.45.0 or later for the workflows in these guides.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
The operating system and processor requirements apply to the CLI installation.
Hypervisor and KVM setup is required only to run local sandboxes. For cloud
account requirements, see [Cloud sandboxes](cloud/_index.md#prerequisites).
@y
The operating system and processor requirements apply to the CLI installation.
Hypervisor and KVM setup is required only to run local sandboxes. For cloud
account requirements, see [Cloud sandboxes](cloud/_index.md#prerequisites).
@z

@x
### macOS
@y
### macOS
@z

@x
- macOS Sonoma version 14 or later
- Apple silicon
@y
- macOS Sonoma version 14 or later
- Apple silicon
@z

@x
### Windows
@y
### Windows
@z

@x
- Windows 11
- A 64-bit Intel or AMD processor
- Windows Hypervisor Platform for local sandboxes
@y
- Windows 11
- A 64-bit Intel or AMD processor
- Windows Hypervisor Platform for local sandboxes
@z

@x
To run local sandboxes, open an elevated PowerShell prompt and turn on Windows
Hypervisor Platform:
@y
To run local sandboxes, open an elevated PowerShell prompt and turn on Windows
Hypervisor Platform:
@z

@x
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
```
@y
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
```
@z

@x
### Linux
@y
### Linux
@z

@x
- Ubuntu 24.04 or later
- A 64-bit Intel or AMD processor, or a 64-bit Arm processor
- For local sandboxes, KVM hardware virtualization supported and turned on by
  the CPU, and your user account in the `kvm` group
@y
- Ubuntu 24.04 or later
- A 64-bit Intel or AMD processor, or a 64-bit Arm processor
- For local sandboxes, KVM hardware virtualization supported and turned on by
  the CPU, and your user account in the `kvm` group
@z

@x
To run local sandboxes inside a virtual machine or virtual desktop
infrastructure environment, the environment must support nested virtualization.
Cloud sandboxes don't require this setup.
@y
To run local sandboxes inside a virtual machine or virtual desktop
infrastructure environment, the environment must support nested virtualization.
Cloud sandboxes don't require this setup.
@z

@x
For local sandboxes, verify that KVM is available:
@y
For local sandboxes, verify that KVM is available:
@z

@x
```console
$ lsmod | grep kvm
```
@y
```console
$ lsmod | grep kvm
```
@z

@x
A working setup shows `kvm_intel`, `kvm_amd`, `kvm_arm64`, or `kvm` in the
output. If the output is empty, run `kvm-ok` for diagnostics. The local sandbox
runtime requires KVM to start.
@y
A working setup shows `kvm_intel`, `kvm_amd`, `kvm_arm64`, or `kvm` in the
output. If the output is empty, run `kvm-ok` for diagnostics. The local sandbox
runtime requires KVM to start.
@z

@x
Add your user to the `kvm` group:
@y
Add your user to the `kvm` group:
@z

@x
```console
$ sudo usermod -aG kvm $USER
```
@y
```console
$ sudo usermod -aG kvm $USER
```
@z

@x
Sign out and back in, or run `newgrp kvm`, for the group change to take effect.
@y
Sign out and back in, or run `newgrp kvm`, for the group change to take effect.
@z

@x
## Install on macOS
@y
## Install on macOS
@z

@x
Install `sbx` using Homebrew:
@y
Install `sbx` using Homebrew:
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
## Install on Windows
@y
## Install on Windows
@z

@x
### Install for the current user
@y
### Install for the current user
@z

@x
Install `sbx` using Windows Package Manager:
@y
Install `sbx` using Windows Package Manager:
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
WinGet installs the per-user `DockerSandboxes.msi` package in
`%LOCALAPPDATA%\DockerSandboxes` and adds its `bin` directory to your user
`PATH`. You can install it without administrator privileges.
@y
WinGet installs the per-user `DockerSandboxes.msi` package in
`%LOCALAPPDATA%\DockerSandboxes` and adds its `bin` directory to your user
`PATH`. You can install it without administrator privileges.
@z

@x
### Install for all users
@y
### Install for all users
@z

@x
For administrator-managed deployments, download
`DockerSandboxesMachine.msi` from the
[Docker Sandboxes releases](https://github.com/docker/sbx-releases/releases).
From an elevated PowerShell prompt, install the package silently:
@y
For administrator-managed deployments, download
`DockerSandboxesMachine.msi` from the
[Docker Sandboxes releases](https://github.com/docker/sbx-releases/releases).
From an elevated PowerShell prompt, install the package silently:
@z

@x
```powershell
msiexec.exe /i DockerSandboxesMachine.msi /quiet
```
@y
```powershell
msiexec.exe /i DockerSandboxesMachine.msi /quiet
```
@z

@x
The machine-wide package installs in `%ProgramFiles%\DockerSandboxes` and adds
its `bin` directory to the system `PATH`.
@y
The machine-wide package installs in `%ProgramFiles%\DockerSandboxes` and adds
its `bin` directory to the system `PATH`.
@z

@x
A machine-wide upgrade might require restarting Windows if an `sbx` daemon in
another user's session is using the installed files.
@y
A machine-wide upgrade might require restarting Windows if an `sbx` daemon in
another user's session is using the installed files.
@z

@x
## Install on Ubuntu
@y
## Install on Ubuntu
@z

@x
> [!NOTE]
>
> Docker does not test or support Docker Sandboxes on Ubuntu derivatives, such
> as Linux Mint and Pop!_OS. The convenience script can configure an incorrect
> package repository on these distributions.
@y
> [!NOTE]
>
> Docker does not test or support Docker Sandboxes on Ubuntu derivatives, such
> as Linux Mint and Pop!_OS. The convenience script can configure an incorrect
> package repository on these distributions.
@z

@x
You can install `sbx` with Docker Engine or install only the `sbx` package.
@y
You can install `sbx` with Docker Engine or install only the `sbx` package.
@z

@x
### Install Docker Engine and SBX
@y
### Install Docker Engine and SBX
@z

@x
Run Docker's convenience script with `SBX=1` to install Docker Engine and the
`docker-sbx` package together:
@y
Run Docker's convenience script with `SBX=1` to install Docker Engine and the
`docker-sbx` package together:
@z

@x
```console
$ curl -fsSL https://get.docker.com | sudo SBX=1 sh
```
@y
```console
$ curl -fsSL https://get.docker.com | sudo SBX=1 sh
```
@z

@x
### Install SBX only
@y
### Install SBX only
@z

@x
To install `sbx` without Docker Engine on the host, add Docker's `apt`
repository and install the `docker-sbx` package:
@y
To install `sbx` without Docker Engine on the host, add Docker's `apt`
repository and install the `docker-sbx` package:
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
## Install from release artifacts
@y
## Install from release artifacts
@z

@x
To install `sbx` from a package or archive, follow the
[manual installation instructions](https://github.com/docker/sbx-releases#manual-install-from-release-artifacts).
The availability of a Linux release artifact does not indicate that Docker
tests or supports the corresponding distribution.
@y
To install `sbx` from a package or archive, follow the
[manual installation instructions](https://github.com/docker/sbx-releases#manual-install-from-release-artifacts).
The availability of a Linux release artifact does not indicate that Docker
tests or supports the corresponding distribution.
@z

@x
## Sign in
@y
## Sign in
@z

@x
Sign in to Docker:
@y
Sign in to Docker:
@z

@x
```console
$ sbx login
```
@y
```console
$ sbx login
```
@z

@x
The command opens a browser for Docker OAuth. See the [FAQ](faq.md) for why
sign-in is required and how Docker handles your data.
@y
The command opens a browser for Docker OAuth. See the [FAQ](faq.md) for why
sign-in is required and how Docker handles your data.
@z

@x
After signing in, [run your first local sandbox](get-started.md) or
[get started with cloud sandboxes](cloud/_index.md#get-started).
@y
After signing in, [run your first local sandbox](get-started.md) or
[get started with cloud sandboxes](cloud/_index.md#get-started).
@z
