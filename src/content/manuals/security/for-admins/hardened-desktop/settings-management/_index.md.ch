%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Understand how Settings Management works, who it is for, and what the
  benefits are
keywords: Settings Management, rootless, docker desktop, hardened desktop
tags: [admin]
title: What is Settings Management?
linkTitle: Settings Management
@y
description: Understand how Settings Management works, who it is for, and what the
  benefits are
keywords: Settings Management, rootless, docker desktop, hardened desktop
tags: [admin]
title: What is Settings Management?
linkTitle: Settings Management
@z

@x
> [!NOTE]
>
> Settings Management is available to Docker Business customers only.
@y
> [!NOTE]
>
> Settings Management is available to Docker Business customers only.
@z

@x
Settings Management helps you control key Docker Desktop settings, like proxies and network configurations, on your developers' machines within your organization.
@y
Settings Management helps you control key Docker Desktop settings, like proxies and network configurations, on your developers' machines within your organization.
@z

@x
For an extra layer of security, you can also use Settings Management to enable and lock in [Enhanced Container Isolation](../enhanced-container-isolation/_index.md), which prevents containers from modifying any Settings Management configurations.
@y
For an extra layer of security, you can also use Settings Management to enable and lock in [Enhanced Container Isolation](../enhanced-container-isolation/_index.md), which prevents containers from modifying any Settings Management configurations.
@z

@x
## Who is it for?
@y
## Who is it for?
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
## How does it work?
@y
## How does it work?
@z

@x
You can configure several Docker Desktop settings using either:
 - An `admin-settings.json` file. This file is located on the Docker Desktop host and can only be accessed by developers with root or administrator privileges.
 - Creating a settings policy in the Docker Admin Console 
@y
You can configure several Docker Desktop settings using either:
 - An `admin-settings.json` file. This file is located on the Docker Desktop host and can only be accessed by developers with root or administrator privileges.
 - Creating a settings policy in the Docker Admin Console 
@z

@x
Settings that are defined by an administrator override any previous values set by developers and ensure that these cannot be modified. 
@y
Settings that are defined by an administrator override any previous values set by developers and ensure that these cannot be modified. 
@z

@x
## What features can I configure with Settings Management?
@y
## What features can I configure with Settings Management?
@z

@x
Using the `admin-settings.json` file, you can:
@y
Using the `admin-settings.json` file, you can:
@z

@x
- Turn on and lock in [Enhanced Container Isolation](../enhanced-container-isolation/_index.md)
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
- Turn off Docker AI ([Ask Gordon](../../../../desktop/features/gordon.md))
- Turn off Docker Desktop's onboarding survey
- Control whether developers can use the Docker terminal
- Control the file sharing implementation for your developers on macOS
- Specify which paths your developers can add file shares to
- Configure Air-gapped containers
@y
- Turn on and lock in [Enhanced Container Isolation](../enhanced-container-isolation/_index.md)
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
- Turn off Docker AI ([Ask Gordon](../../../../desktop/features/gordon.md))
- Turn off Docker Desktop's onboarding survey
- Control whether developers can use the Docker terminal
- Control the file sharing implementation for your developers on macOS
- Specify which paths your developers can add file shares to
- Configure Air-gapped containers
@z

@x
For more details on the syntax and options, see [Configure Settings Management](configure-json-file.md).
@y
For more details on the syntax and options, see [Configure Settings Management](configure-json-file.md).
@z

@x
## How do I set up and enforce Settings Management?
@y
## How do I set up and enforce Settings Management?
@z

@x
You first need to [enforce sign-in](/manuals/security/for-admins/enforce-sign-in/_index.md) to ensure that all Docker Desktop developers authenticate with your organization. Since the Settings Management feature requires a Docker Business subscription, enforced sign-in guarantees that only authenticated users have access and that the feature consistently takes effect across all users, even though it may still work without enforced sign-in.
@y
You first need to [enforce sign-in](manuals/security/for-admins/enforce-sign-in/_index.md) to ensure that all Docker Desktop developers authenticate with your organization. Since the Settings Management feature requires a Docker Business subscription, enforced sign-in guarantees that only authenticated users have access and that the feature consistently takes effect across all users, even though it may still work without enforced sign-in.
@z

@x
Next, you must either:
 - Manually [create and configure the `admin-settings.json` file](configure-json-file.md), or use the `--admin-settings` installer flag on [macOS](/manuals/desktop/setup/install/mac-install.md#install-from-the-command-line) or [Windows](/manuals/desktop/setup/install/windows-install.md#install-from-the-command-line) to automatically create the `admin-settings.json` and save it in the correct location.
 - Fill out the **Settings policy** creation form in the [Docker Admin Console](configure-admin-console.md).
@y
Next, you must either:
 - Manually [create and configure the `admin-settings.json` file](configure-json-file.md), or use the `--admin-settings` installer flag on [macOS](manuals/desktop/setup/install/mac-install.md#install-from-the-command-line) or [Windows](manuals/desktop/setup/install/windows-install.md#install-from-the-command-line) to automatically create the `admin-settings.json` and save it in the correct location.
 - Fill out the **Settings policy** creation form in the [Docker Admin Console](configure-admin-console.md).
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
To avoid disrupting your developers' workflows, Docker doesn't automatically require that developers re-launch and re-authenticate once a change has been made.
@y
To avoid disrupting your developers' workflows, Docker doesn't automatically require that developers re-launch and re-authenticate once a change has been made.
@z

@x
## What do developers see when the settings are enforced?
@y
## What do developers see when the settings are enforced?
@z

@x
Enforced settings appear grayed out in Docker Desktop. They can't be edited via the Docker Desktop Dashboard, CLI, or `settings-store.json` (or `settings.json` for Docker Desktop 4.34 and earlier).
@y
Enforced settings appear grayed out in Docker Desktop. They can't be edited via the Docker Desktop Dashboard, CLI, or `settings-store.json` (or `settings.json` for Docker Desktop 4.34 and earlier).
@z

@x
In addition, if Enhanced Container Isolation is enforced, developers can't use privileged containers or similar techniques to modify enforced settings within the Docker Desktop Linux VM. For example, they can't reconfigure proxy and networking, or Docker Engine.
@y
In addition, if Enhanced Container Isolation is enforced, developers can't use privileged containers or similar techniques to modify enforced settings within the Docker Desktop Linux VM. For example, they can't reconfigure proxy and networking, or Docker Engine.
@z

@x
![Proxy settings grayed out](/assets/images/grayed-setting.png)
@y
![Proxy settings grayed out](__SUBDIR__/assets/images/grayed-setting.png)
@z

@x
## What's next?
@y
## What's next?
@z

@x
- [Configure Settings Management with a `.json` file](configure-json-file.md)
- [Configure Settings Management with the Docker Admin Console](configure-admin-console.md)
@y
- [Configure Settings Management with a `.json` file](configure-json-file.md)
- [Configure Settings Management with the Docker Admin Console](configure-admin-console.md)
@z
