%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Manage unassociated machines
description: Learn how to manage unassociated machines in Docker Home
keywords: unassociated machines, insights, manage users, enforce sign-in
@y
title: Manage unassociated machines
description: Learn how to manage unassociated machines in Docker Home
keywords: unassociated machines, insights, manage users, enforce sign-in
@z

@x
{{< summary-bar feature_name="Unassociated machines" >}}
@y
{{< summary-bar feature_name="Unassociated machines" >}}
@z

@x
Organization owners can identify, view, and manage Docker Desktop machines
that are likely associated with their organization, based on usage, but aren't currently linked
to user accounts. This self-service capability helps you understand Docker
Desktop usage across your organization and streamline user onboarding without
IT involvement.
@y
Organization owners can identify, view, and manage Docker Desktop machines
that are likely associated with their organization, based on usage, but aren't currently linked
to user accounts. This self-service capability helps you understand Docker
Desktop usage across your organization and streamline user onboarding without
IT involvement.
@z

@x
## How Docker identifies unassociated machines
@y
## How Docker identifies unassociated machines
@z

@x
Docker uses telemetry data to identify which machines likely belong to your
organization:
@y
Docker uses telemetry data to identify which machines likely belong to your
organization:
@z

@x
- Domain matching: Users signed in with email domains associated with your
  organization
- Registry patterns: Analysis of container registry access patterns that
  indicate organizational usage
@y
- Domain matching: Users signed in with email domains associated with your
  organization
- Registry patterns: Analysis of container registry access patterns that
  indicate organizational usage
@z

@x
## View unassociated machines
@y
## View unassociated machines
@z

@x
To see detailed information about unassociated machines:
@y
To see detailed information about unassociated machines:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
@z

@x
The machine list displays:
@y
The machine list displays:
@z

@x
- Machine ID (Docker-generated identifier)
- The registry address used to predict whether a user is part of your
  organization
- User email (only displays if the user is signed into Docker Desktop while
  using it)
- Docker Desktop version
- Operating system (OS)
- Last activity date
- Sign-in enforced status
@y
- Machine ID (Docker-generated identifier)
- The registry address used to predict whether a user is part of your
  organization
- User email (only displays if the user is signed into Docker Desktop while
  using it)
- Docker Desktop version
- Operating system (OS)
- Last activity date
- Sign-in enforced status
@z

@x
You can:
@y
You can:
@z

@x
- Export the list as CSV
- Take actions on individual or multiple machines
@y
- Export the list as CSV
- Take actions on individual or multiple machines
@z

@x
## Enable sign-in enforcement for unassociated machines
@y
## Enable sign-in enforcement for unassociated machines
@z

@x
> [!IMPORTANT]
>
> Sign-in enforcement for unassociated machines is different from
> the [organization-level sign-in enforcement](/manuals/desktop/enterprise/enforce-sign-in/_index.md)
> available through `registry.json` and configuration profiles. This sign-in
> enforcement only requires users to sign in so admins can identify who is
> using the machine, meaning users can sign in with any email address. For more
> stringent security controls that limit sign-ins to users who are already part
> of your organization, see [Enforce sign-in](/manuals/desktop/enterprise/enforce-sign-in/_index.md).
@y
> [!IMPORTANT]
>
> Sign-in enforcement for unassociated machines is different from
> the [organization-level sign-in enforcement](manuals/desktop/enterprise/enforce-sign-in/_index.md)
> available through `registry.json` and configuration profiles. This sign-in
> enforcement only requires users to sign in so admins can identify who is
> using the machine, meaning users can sign in with any email address. For more
> stringent security controls that limit sign-ins to users who are already part
> of your organization, see [Enforce sign-in](manuals/desktop/enterprise/enforce-sign-in/_index.md).
@z

@x
Sign-in enforcement helps you identify who is using unassociated machines in
your organization. When you enable enforcement, users on these machines will
be required to sign in to Docker Desktop. Once they sign in, their email
addresses will appear in the Unassociated list, allowing you to then add them
to your organization.
@y
Sign-in enforcement helps you identify who is using unassociated machines in
your organization. When you enable enforcement, users on these machines will
be required to sign in to Docker Desktop. Once they sign in, their email
addresses will appear in the Unassociated list, allowing you to then add them
to your organization.
@z

@x
You can enable sign-in enforcement using two methods:
@y
You can enable sign-in enforcement using two methods:
@z

@x
- For all unassociated machines in your organization
- For individual unassociated machines
@y
- For all unassociated machines in your organization
- For individual unassociated machines
@z

@x
### Enable for all unassociated machines
@y
### Enable for all unassociated machines
@z

@x
To enable sign-in enforcement for all unassociated machines:
@y
To enable sign-in enforcement for all unassociated machines:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Turn on the **Enforce sign-in** toggle.
1. In the pop-up modal, select **Require sign-in** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Turn on the **Enforce sign-in** toggle.
1. In the pop-up modal, select **Require sign-in** to confirm.
@z

@x
The **Sign-in required** status updates all unassociated machines to
**Yes**.
@y
The **Sign-in required** status updates all unassociated machines to
**Yes**.
@z

@x
Sign-in enforcement only takes effect after Docker Desktop is restarted.
Users can continue using Docker Desktop until their next restart.
@y
Sign-in enforcement only takes effect after Docker Desktop is restarted.
Users can continue using Docker Desktop until their next restart.
@z

@x
> [!NOTE]
>
> When you enable sign-in enforcement for all unassociated machines, any new
> machines detected in the future automatically have sign-in enforcement
> enabled.
@y
> [!NOTE]
>
> When you enable sign-in enforcement for all unassociated machines, any new
> machines detected in the future automatically have sign-in enforcement
> enabled.
@z

@x
### Enable for individual unassociated machines
@y
### Enable for individual unassociated machines
@z

@x
To enable sign-in enforcement for individual unassociated machines:
@y
To enable sign-in enforcement for individual unassociated machines:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Locate the machine you want to enable sign-in enforcement for.
1. Select the **Actions** menu and choose **Turn on sign-in enforcement**.
1. In the pop-up modal, select **Require sign-in** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Locate the machine you want to enable sign-in enforcement for.
1. Select the **Actions** menu and choose **Turn on sign-in enforcement**.
1. In the pop-up modal, select **Require sign-in** to confirm.
@z

@x
The **Sign-in required** status updates for the individual machine to
**Yes**.
@y
The **Sign-in required** status updates for the individual machine to
**Yes**.
@z

@x
### What happens when sign-in is enforced
@y
### What happens when sign-in is enforced
@z

@x
After you enable sign-in enforcement:
@y
After you enable sign-in enforcement:
@z

@x
- When users open Docker Desktop, they see a sign-in prompt. They must sign
   in to continue using Docker Desktop.
- User email addresses appear in the **Unassociated** list.
- You can add users to your organization.
@y
- When users open Docker Desktop, they see a sign-in prompt. They must sign
   in to continue using Docker Desktop.
- User email addresses appear in the **Unassociated** list.
- You can add users to your organization.
@z

@x
Users can continue using Docker Desktop immediately after signing in, even
before being added to your organization.
@y
Users can continue using Docker Desktop immediately after signing in, even
before being added to your organization.
@z

@x
## Add unassociated machines to your organization
@y
## Add unassociated machines to your organization
@z

@x
When users in your organization use Docker without signing in, their machines
appear in the **Unassociated** list. You can add these users to your
organization in two ways:
@y
When users in your organization use Docker without signing in, their machines
appear in the **Unassociated** list. You can add these users to your
organization in two ways:
@z

@x
- Automatic addition:
  - Auto-provisioning: If you have verified domains with auto-provisioning
    enabled, users who sign in with a matching email domain will automatically
    be added to your organization. For more information on verifying domains and
    auto-provisioning, see [Domain management](/manuals/security/provisioning/domain-management.md).
  - SSO user provisioning: If you have SSO configured with
    [Just-in-Time provisioning](/manuals/security/provisioning/just-in-time.md),
    users who sign in through your SSO connection will automatically be added
    to your organization.
- Manual addition: If you don't have auto-provisioning or SSO set up, or if a
  user's email domain doesn't match your configured domains, their email will
  appear in the **Unassociated** list where you can choose to add them directly.
@y
- Automatic addition:
  - Auto-provisioning: If you have verified domains with auto-provisioning
    enabled, users who sign in with a matching email domain will automatically
    be added to your organization. For more information on verifying domains and
    auto-provisioning, see [Domain management](manuals/security/provisioning/domain-management.md).
  - SSO user provisioning: If you have SSO configured with
    [Just-in-Time provisioning](manuals/security/provisioning/just-in-time.md),
    users who sign in through your SSO connection will automatically be added
    to your organization.
- Manual addition: If you don't have auto-provisioning or SSO set up, or if a
  user's email domain doesn't match your configured domains, their email will
  appear in the **Unassociated** list where you can choose to add them directly.
@z

@x
> [!NOTE]
>
> If you add users and do not have enough seats in your organization, a
> pop-up appears prompting you to **Get more seats**.
@y
> [!NOTE]
>
> If you add users and do not have enough seats in your organization, a
> pop-up appears prompting you to **Get more seats**.
@z

@x
### Add individual users
@y
### Add individual users
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Locate the machine you want to add to your organization.
1. Select the **Actions** menu and choose **Add to organization**.
1. In the pop-up modal, select **Add user**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Locate the machine you want to add to your organization.
1. Select the **Actions** menu and choose **Add to organization**.
1. In the pop-up modal, select **Add user**.
@z

@x
### Bulk add users
@y
### Bulk add users
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Use the **checkboxes** to select the machines you want to add to your
   organizations.
1. Select the **Add to organization** button.
1. In the pop-up modal, select **Add users** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Use the **checkboxes** to select the machines you want to add to your
   organizations.
1. Select the **Add to organization** button.
1. In the pop-up modal, select **Add users** to confirm.
@z

@x
## Disable sign-in enforcement
@y
## Disable sign-in enforcement
@z

@x
### Disable for all unassociated machines
@y
### Disable for all unassociated machines
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Turn off the **Enforce sign-in** toggle.
1. In the pop-up modal, select **Turn off sign-in requirement** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Turn off the **Enforce sign-in** toggle.
1. In the pop-up modal, select **Turn off sign-in requirement** to confirm.
@z

@x
The **Sign-in required** status updates for all unassociated machines to
**No**.
@y
The **Sign-in required** status updates for all unassociated machines to
**No**.
@z

@x
### Disable for specific unassociated machines
@y
### Disable for specific unassociated machines
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Locate the machine you want to disable sign-in enforcement for.
1. Select the **Actions** menu and choose **Turn off sign-in enforcement**.
1. In the pop-up modal, select **Turn off sign-in requirement** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select your organization.
1. Select **Docker Desktop**, then **Unassociated**.
1. Locate the machine you want to disable sign-in enforcement for.
1. Select the **Actions** menu and choose **Turn off sign-in enforcement**.
1. In the pop-up modal, select **Turn off sign-in requirement** to confirm.
@z

@x
The **Sign-in required** status updates for the individual machine to
**No**.
@y
The **Sign-in required** status updates for the individual machine to
**No**.
@z
