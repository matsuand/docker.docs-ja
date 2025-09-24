%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Understand how Settings Management works, who it's for, and the benefits it provides
keywords: Settings Management, rootless, docker desktop, hardened desktop, admin control, enterprise
tags: [admin]
title: Settings Management
linkTitle: Settings Management
aliases:
 - /desktop/hardened-desktop/settings-management/
 - /security/for-admins/hardened-desktop/settings-management/
weight: 10
---
@y
---
description: Understand how Settings Management works, who it's for, and the benefits it provides
keywords: Settings Management, rootless, docker desktop, hardened desktop, admin control, enterprise
tags: [admin]
title: Settings Management
linkTitle: Settings Management
aliases:
 - /desktop/hardened-desktop/settings-management/
 - /security/for-admins/hardened-desktop/settings-management/
weight: 10
---
@z

@x
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@y
{{< summary-bar feature_name="Hardened Docker Desktop" >}}
@z

@x
Settings Management lets administrators configure and enforce Docker Desktop settings across end-user machines. It helps maintain consistent configurations and enhances security within your organization.
@y
Settings Management lets administrators configure and enforce Docker Desktop settings across end-user machines. It helps maintain consistent configurations and enhances security within your organization.
@z

@x
## Who should use Settings Management?
@y
## Who should use Settings Management?
@z

@x
Settings Management is designed for organizations that:
@y
Settings Management is designed for organizations that:
@z

@x
- Need centralized control over Docker Desktop configurations
- Want to standardize Docker Desktop environments across teams
- Operate in regulated environments and must enforce compliance policies
@y
- Need centralized control over Docker Desktop configurations
- Want to standardize Docker Desktop environments across teams
- Operate in regulated environments and must enforce compliance policies
@z

@x
## How Settings Management works
@y
## How Settings Management works
@z

@x
Administrators can define settings using one of these methods:
@y
Administrators can define settings using one of these methods:
@z

@x
- [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md): Create and assign settings policies through the
Docker Admin Console. This provides a web-based interface for managing settings
across your organization.
- [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md): Place a configuration file on the
user's machine to enforce settings. This method works well for automated
deployments and scripted installations.
@y
- [Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md): Create and assign settings policies through the
Docker Admin Console. This provides a web-based interface for managing settings
across your organization.
- [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md): Place a configuration file on the
user's machine to enforce settings. This method works well for automated
deployments and scripted installations.
@z

@x
Enforced settings override user-defined configurations and can't be modified by developers.
@y
Enforced settings override user-defined configurations and can't be modified by developers.
@z

@x
## Configurable settings
@y
## Configurable settings
@z

@x
Settings Management supports a wide range of Docker Desktop features, including:
@y
Settings Management supports a wide range of Docker Desktop features, including:
@z

@x
- Proxy configurations
- Network settings
- Container isolation options
- Registry access controls
- Resource limits
- Security policies
@y
- Proxy configurations
- Network settings
- Container isolation options
- Registry access controls
- Resource limits
- Security policies
@z

@x
For a complete list of settings you can enforce, see the [Settings reference](/manuals/enterprise/security/hardened-desktop/settings-management/settings-reference.md).
@y
For a complete list of settings you can enforce, see the [Settings reference](/manuals/enterprise/security/hardened-desktop/settings-management/settings-reference.md).
@z

@x
## Policy precedence
@y
## Policy precedence
@z

@x
When multiple policies exist, Docker Desktop applies them in this order:
@y
When multiple policies exist, Docker Desktop applies them in this order:
@z

@x
1. User-specific policies: Highest priority
1. Organization default policy: Applied when no user-specific policy exists
1. Local `admin-settings.json` file: Lowest priority, overridden by Admin Console policies
@y
1. User-specific policies: Highest priority
1. Organization default policy: Applied when no user-specific policy exists
1. Local `admin-settings.json` file: Lowest priority, overridden by Admin Console policies
@z

@x
## Set up Settings Management
@y
## Set up Settings Management
@z

@x
1. [Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md) to
ensure all developers authenticate with your organization.
2. Choose a configuration method:
    - Use the `--admin-settings` installer flag on [macOS](/manuals/desktop/setup/install/mac-install.md#install-from-the-command-line) or [Windows](/manuals/desktop/setup/install/windows-install.md#install-from-the-command-line) to automatically create the `admin-settings.json`.
    - Manually create and configure the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md).
    - Create a settings policy in the [Docker Admin Console](configure-admin-console.md).
@y
1. [Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md) to
ensure all developers authenticate with your organization.
2. Choose a configuration method:
    - Use the `--admin-settings` installer flag on [macOS](/manuals/desktop/setup/install/mac-install.md#install-from-the-command-line) or [Windows](/manuals/desktop/setup/install/windows-install.md#install-from-the-command-line) to automatically create the `admin-settings.json`.
    - Manually create and configure the [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md).
    - Create a settings policy in the [Docker Admin Console](configure-admin-console.md).
@z

@x
After configuration, developers receive the enforced settings when they:
@y
After configuration, developers receive the enforced settings when they:
@z

@x
- Quit and relaunch Docker Desktop, then sign in
- Launch and sign in to Docker Desktop for the first time
@y
- Quit and relaunch Docker Desktop, then sign in
- Launch and sign in to Docker Desktop for the first time
@z

@x
> [!NOTE]
>
> Docker Desktop doesn't automatically prompt users to restart or re-authenticate after a settings change. You may need to communicate these requirements to your developers.
@y
> [!NOTE]
>
> Docker Desktop doesn't automatically prompt users to restart or re-authenticate after a settings change. You may need to communicate these requirements to your developers.
@z

@x
## Developer experience
@y
## Developer experience
@z

@x
When settings are enforced:
@y
When settings are enforced:
@z

@x
- Settings options appear grayed out in Docker Desktop and can't be modified through the Dashboard, CLI, or configuration files
- If Enhanced Container Isolation is enabled, developers can't use privileged containers or similar methods to alter enforced settings within the Docker Desktop Linux VM
@y
- Settings options appear grayed out in Docker Desktop and can't be modified through the Dashboard, CLI, or configuration files
- If Enhanced Container Isolation is enabled, developers can't use privileged containers or similar methods to alter enforced settings within the Docker Desktop Linux VM
@z

@x
This ensures consistent environments while maintaining a clear visual indication of which settings are managed by administrators.
@y
This ensures consistent environments while maintaining a clear visual indication of which settings are managed by administrators.
@z

@x
## View applied settings
@y
## View applied settings
@z

@x
When administrators apply Settings Management policies, Docker Desktop greys out most enforced settings in the GUI.
@y
When administrators apply Settings Management policies, Docker Desktop greys out most enforced settings in the GUI.
@z

@x
The Docker Desktop GUI doesn't currently display all centralized settings,
particularly Enhanced Container Isolation (ECI) settings that administrators
apply via the Admin Console.
@y
The Docker Desktop GUI doesn't currently display all centralized settings,
particularly Enhanced Container Isolation (ECI) settings that administrators
apply via the Admin Console.
@z

@x
As a workaround, you can check the `settings-store.json` file to view all
applied settings:
@y
As a workaround, you can check the `settings-store.json` file to view all
applied settings:
@z

@x
  - Mac: `~/Library/Application Support/Docker/settings-store.json`
  - Windows: `%APPDATA%\Docker\settings-store.json`
  - Linux: `~/.docker/desktop/settings-store.json`
@y
  - Mac: `~/Library/Application Support/Docker/settings-store.json`
  - Windows: `%APPDATA%\Docker\settings-store.json`
  - Linux: `~/.docker/desktop/settings-store.json`
@z

@x
The `settings-store.json` file contains all settings, including those that
may not appear in the Docker Desktop GUI.
@y
The `settings-store.json` file contains all settings, including those that
may not appear in the Docker Desktop GUI.
@z

@x
## Limitations
@y
## Limitations
@z

@x
Settings Management has the following limitations:
@y
Settings Management has the following limitations:
@z

@x
- Doesn't work in air-gapped or offline environments
- Not compatible with environments that restrict authentication with Docker Hub
@y
- Doesn't work in air-gapped or offline environments
- Not compatible with environments that restrict authentication with Docker Hub
@z

@x
## Next steps
@y
## Next steps
@z

@x
Get started with Settings Management:
@y
Get started with Settings Management:
@z

@x
- [Configure Settings Management with the `admin-settings.json` file](configure-json-file.md)
- [Configure Settings Management with the Docker Admin Console](configure-admin-console.md)
@y
- [Configure Settings Management with the `admin-settings.json` file](configure-json-file.md)
- [Configure Settings Management with the Docker Admin Console](configure-admin-console.md)
@z
