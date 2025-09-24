%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configure Settings Management with the Admin Console
linkTitle: Use the Admin Console
description: Configure and enforce Docker Desktop settings across your organization using the Docker Admin Console
keywords: admin console, settings management, policy configuration, enterprise controls, docker desktop
@y
title: Configure Settings Management with the Admin Console
linkTitle: Use the Admin Console
description: Configure and enforce Docker Desktop settings across your organization using the Docker Admin Console
keywords: admin console, settings management, policy configuration, enterprise controls, docker desktop
@z

@x
{{< summary-bar feature_name="Admin Console" >}}
@y
{{< summary-bar feature_name="Admin Console" >}}
@z

@x
Use the Docker Admin Console to create and manage settings policies for Docker Desktop across your organization. Settings policies let you standardize configurations, enforce security requirements, and maintain consistent Docker Desktop environments.
@y
Use the Docker Admin Console to create and manage settings policies for Docker Desktop across your organization. Settings policies let you standardize configurations, enforce security requirements, and maintain consistent Docker Desktop environments.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, make sure you have:
@y
Before you begin, make sure you have:
@z

@x
- [Docker Desktop 4.37.1 or later](/manuals/desktop/release-notes.md) installed
- [A verified domain](/manuals/enterprise/security/single-sign-on/configure.md#step-one-add-and-verify-your-domain)
- [Enforced sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md) for your organization
- A Docker Business subscription
@y
- [Docker Desktop 4.37.1 or later](manuals/desktop/release-notes.md) installed
- [A verified domain](manuals/enterprise/security/single-sign-on/configure.md#step-one-add-and-verify-your-domain)
- [Enforced sign-in](manuals/enterprise/security/enforce-sign-in/_index.md) for your organization
- A Docker Business subscription
@z

@x
> [!IMPORTANT]
>
> You must add users to your verified domain for settings to take effect.
@y
> [!IMPORTANT]
>
> You must add users to your verified domain for settings to take effect.
@z

@x
## Create a settings policy
@y
## Create a settings policy
@z

@x
To create a new settings policy:
@y
To create a new settings policy:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select
your organization.
1. Select **Admin Console**, then **Desktop Settings Management**.
1. Select **Create a settings policy**.
1. Provide a name and optional description.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select
your organization.
1. Select **Admin Console**, then **Desktop Settings Management**.
1. Select **Create a settings policy**.
1. Provide a name and optional description.
@z

@x
      > [!TIP]
      >
      > You can upload an existing `admin-settings.json` file to pre-fill the form.
      Admin Console policies override local `admin-settings.json` files.
@y
      > [!TIP]
      >
      > You can upload an existing `admin-settings.json` file to pre-fill the form.
      Admin Console policies override local `admin-settings.json` files.
@z

@x
1. Choose who the policy applies to:
   - All users
   - Specific users
@y
1. Choose who the policy applies to:
   - All users
   - Specific users
@z

@x
      > [!NOTE]
      >
      > User-specific policies override global default policies. Test your policy with a small group before applying it organization-wide.
@y
      > [!NOTE]
      >
      > User-specific policies override global default policies. Test your policy with a small group before applying it organization-wide.
@z

@x
1. Configure each setting using a state:
   - **User-defined**: Users can change the setting.
   - **Always enabled**: Setting is on and locked.
   - **Enabled**: Setting is on but can be changed.
   - **Always disabled**: Setting is off and locked.
   - **Disabled**: Setting is off but can be changed.
@y
1. Configure each setting using a state:
   - **User-defined**: Users can change the setting.
   - **Always enabled**: Setting is on and locked.
   - **Enabled**: Setting is on but can be changed.
   - **Always disabled**: Setting is off and locked.
   - **Disabled**: Setting is off but can be changed.
@z

@x
      > [!TIP]
      >
      > For a complete list of configurable settings, supported platforms, and configuration methods, see the [Settings reference](settings-reference.md).
@y
      > [!TIP]
      >
      > For a complete list of configurable settings, supported platforms, and configuration methods, see the [Settings reference](settings-reference.md).
@z

@x
1. Select **Create** to save your policy.
@y
1. Select **Create** to save your policy.
@z

@x
## Apply the policy
@y
## Apply the policy
@z

@x
Settings policies take effect after Docker Desktop restarts and users sign in.
@y
Settings policies take effect after Docker Desktop restarts and users sign in.
@z

@x
For new installations:
@y
For new installations:
@z

@x
1. Launch Docker Desktop.
1. Sign in with your Docker account.
@y
1. Launch Docker Desktop.
1. Sign in with your Docker account.
@z

@x
For existing installations:
@y
For existing installations:
@z

@x
1. Quit Docker Desktop completely.
1. Relaunch Docker Desktop.
@y
1. Quit Docker Desktop completely.
1. Relaunch Docker Desktop.
@z

@x
> [!IMPORTANT]
>
> Users must fully quit and reopen Docker Desktop. Restarting from the Docker Desktop menu isn't sufficient.
@y
> [!IMPORTANT]
>
> Users must fully quit and reopen Docker Desktop. Restarting from the Docker Desktop menu isn't sufficient.
@z

@x
Docker Desktop checks for policy updates when it launches and every 60 minutes while running.
@y
Docker Desktop checks for policy updates when it launches and every 60 minutes while running.
@z

@x
## Verify applied settings
@y
## Verify applied settings
@z

@x
After you apply policies:
@y
After you apply policies:
@z

@x
- Docker Desktop displays most settings as greyed out
- Some settings, particularly Enhanced Container Isolation configurations,
may not appear in the GUI
- You can verify all applied settings by checking the [`settings-store.json`
file](/manuals/desktop/settings-and-maintenance/settings.md) on your system
@y
- Docker Desktop displays most settings as greyed out
- Some settings, particularly Enhanced Container Isolation configurations,
may not appear in the GUI
- You can verify all applied settings by checking the [`settings-store.json`
file](manuals/desktop/settings-and-maintenance/settings.md) on your system
@z

@x
## Manage existing policies
@y
## Manage existing policies
@z

@x
From the **Desktop Settings Management** page in the Admin Console, use the **Actions** menu to:
@y
From the **Desktop Settings Management** page in the Admin Console, use the **Actions** menu to:
@z

@x
- Edit or delete an existing settings policy
- Export a settings policy as an `admin-settings.json` file
- Promote a user-specific policy to be the new global default
@y
- Edit or delete an existing settings policy
- Export a settings policy as an `admin-settings.json` file
- Promote a user-specific policy to be the new global default
@z

@x
## Roll back policies
@y
## Roll back policies
@z

@x
To roll back a settings policy:
@y
To roll back a settings policy:
@z

@x
- Complete rollback: Delete the entire policy.
- Partial rollback: Set specific settings to **User-defined**.
@y
- Complete rollback: Delete the entire policy.
- Partial rollback: Set specific settings to **User-defined**.
@z

@x
When you roll back settings, users regain control over those settings configurations.
@y
When you roll back settings, users regain control over those settings configurations.
@z
