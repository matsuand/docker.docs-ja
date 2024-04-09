%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Understand how Settings Management works, who it is for, and what the
  benefits are
keywords: Settings Management, rootless, docker desktop, hardened desktop
title: What is Settings Management?
@y
description: Understand how Settings Management works, who it is for, and what the
  benefits are
keywords: Settings Management, rootless, docker desktop, hardened desktop
title: What is Settings Management?
@z

@x
>**Note**
>
>Settings Management is available to Docker Business customers only.
@y
>**Note**
>
>Settings Management is available to Docker Business customers only.
@z

@x
Settings Management is a feature that helps admins to control certain Docker Desktop settings on client machines within their organization.
@y
Settings Management is a feature that helps admins to control certain Docker Desktop settings on client machines within their organization.
@z

@x
With a few lines of JSON, admins can configure controls for Docker Desktop settings such as proxies and network settings. For an extra layer of security, admins can also use Settings Management to enable and lock in [Enhanced Container Isolation](../enhanced-container-isolation/index.md) which ensures that any configurations set with Settings Management cannot be modified by containers.
@y
With a few lines of JSON, admins can configure controls for Docker Desktop settings such as proxies and network settings. For an extra layer of security, admins can also use Settings Management to enable and lock in [Enhanced Container Isolation](../enhanced-container-isolation/index.md) which ensures that any configurations set with Settings Management cannot be modified by containers.
@z

@x
It is available with [Docker Desktop 4.13.0 and later](../../release-notes.md).
@y
It is available with [Docker Desktop 4.13.0 and later](../../release-notes.md).
@z

@x
### Who is it for?
@y
### Who is it for?
@z

@x
- For organizations that want to configure Docker Desktop to be within their organization's centralized control.
- For organizations that want to create a standardized Docker Desktop environment at scale.
- For Docker Business customers who want to confidently manage their use of Docker Desktop within tightly regulated environments.
@y
- For organizations that want to configure Docker Desktop to be within their organization's centralized control.
- For organizations that want to create a standardized Docker Desktop environment at scale.
- For Docker Business customers who want to confidently manage their use of Docker Desktop within tightly regulated environments.
@z

@x
### How does it work?
@y
### How does it work?
@z

@x
Administrators can configure several Docker Desktop settings using an `admin-settings.json` file. This file is located on the Docker Desktop host and can only be accessed by developers with root or admin privileges.
@y
Administrators can configure several Docker Desktop settings using an `admin-settings.json` file. This file is located on the Docker Desktop host and can only be accessed by developers with root or admin privileges.
@z

@x
Values that are set to `locked: true` within the `admin-settings.json` override any previous values set by developers and ensure that these cannot be modified. For more information, see [Configure Settings Management](../settings-management/configure.md#step-two-configure-the-settings-you-want-to-lock-in).
@y
Values that are set to `locked: true` within the `admin-settings.json` override any previous values set by developers and ensure that these cannot be modified. For more information, see [Configure Settings Management](../settings-management/configure.md#step-two-configure-the-settings-you-want-to-lock-in).
@z

@x
### What features can I configure with Settings Management?
@y
### What features can I configure with Settings Management?
@z

@x
Using the `admin-settings.json` file, admins can:
@y
Using the `admin-settings.json` file, admins can:
@z

@x
- Turn on and lock in [Enhanced Container Isolation](../enhanced-container-isolation/index.md)
- Configure HTTP proxies
- Configure network settings
- Configure Kubernetes settings
- Enforce the use of WSL 2 based engine or Hyper-V
- Enforce the use of Rosetta for x86_64/amd64 emulation on Apple Silicon
- Configure Docker Engine
- Turn off Docker Desktop's ability to checks for updates
- Turn off Docker Extensions
- Turn off Docker Scout SBOM indexing
- Turn off beta and experimental features
- Control the file sharing implementation for your developers on macOS
- Specify which paths your developers can add file shares to
- Configure air-gapped containers (Beta)
@y
- Turn on and lock in [Enhanced Container Isolation](../enhanced-container-isolation/index.md)
- Configure HTTP proxies
- Configure network settings
- Configure Kubernetes settings
- Enforce the use of WSL 2 based engine or Hyper-V
- Enforce the use of Rosetta for x86_64/amd64 emulation on Apple Silicon
- Configure Docker Engine
- Turn off Docker Desktop's ability to checks for updates
- Turn off Docker Extensions
- Turn off Docker Scout SBOM indexing
- Turn off beta and experimental features
- Control the file sharing implementation for your developers on macOS
- Specify which paths your developers can add file shares to
- Configure air-gapped containers (Beta)
@z

@x
For more details on the syntax and options admins can set, see [Configure Settings Management](configure.md).
@y
For more details on the syntax and options admins can set, see [Configure Settings Management](configure.md).
@z

@x
### How do I set up and enforce Settings Management?
@y
### How do I set up and enforce Settings Management?
@z

@x
As an administrator, you first need to [configure a registry.json to enforce sign-in](../../../security/for-admins/configure-sign-in.md). This is because the Settings Management feature requires a Docker Business subscription and therefore your Docker Desktop developers must authenticate to your organization for this configuration to take effect.
@y
As an administrator, you first need to [configure a registry.json to enforce sign-in](../../../security/for-admins/configure-sign-in.md). This is because the Settings Management feature requires a Docker Business subscription and therefore your Docker Desktop developers must authenticate to your organization for this configuration to take effect.
@z

@x
Next, you must either manually [create and configure the admin-settings.json file](configure.md), or use the `--admin-settings` installer flag on [macOS](../../install/mac-install.md#install-from-the-command-line) or [Windows](../../install/windows-install.md#install-from-the-command-line) to automatically create the `admin-settings.json` and save it in the correct location.
@y
Next, you must either manually [create and configure the admin-settings.json file](configure.md), or use the `--admin-settings` installer flag on [macOS](../../install/mac-install.md#install-from-the-command-line) or [Windows](../../install/windows-install.md#install-from-the-command-line) to automatically create the `admin-settings.json` and save it in the correct location.
@z

@x
Once this is done, Docker Desktop developers receive the changed settings when they either:
- Quit, re-launch, and sign in to Docker Desktop
- Launch and sign in to Docker Desktop for the first time
@y
Once this is done, Docker Desktop developers receive the changed settings when they either:
- Quit, re-launch, and sign in to Docker Desktop
- Launch and sign in to Docker Desktop for the first time
@z

@x
Docker doesn't automatically mandate that developers re-launch and re-authenticate once a change has been made, so as not to disrupt your developers' workflow.
@y
Docker doesn't automatically mandate that developers re-launch and re-authenticate once a change has been made, so as not to disrupt your developers' workflow.
@z

@x
### What do developers see when the settings are enforced?
@y
### What do developers see when the settings are enforced?
@z

@x
Any settings that are enforced, are grayed out in Docker Desktop and the user is unable to edit them, either via the Docker Desktop UI, CLI, or the `settings.json` file. In addition, if Enhanced Container Isolation is enforced, developers can't use privileged containers or similar techniques to modify enforced settings within the Docker Desktop Linux VM, for example, reconfigure proxy and networking of reconfigure Docker Engine.
@y
Any settings that are enforced, are grayed out in Docker Desktop and the user is unable to edit them, either via the Docker Desktop UI, CLI, or the `settings.json` file. In addition, if Enhanced Container Isolation is enforced, developers can't use privileged containers or similar techniques to modify enforced settings within the Docker Desktop Linux VM, for example, reconfigure proxy and networking of reconfigure Docker Engine.
@z

@x
![Proxy settings grayed out](/assets/images/grayed-setting.png)
@y
![Proxy settings grayed out](__SUBDIR__/assets/images/grayed-setting.png)
@z
