%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Desktop settings reporting
linkTitle: Desktop settings reporting
description: Track and monitor user compliance with Docker Desktop settings policies using the reporting dashboard
keywords: settings management, compliance reporting, admin console, policy enforcement, docker desktop
@y
title: Desktop settings reporting
linkTitle: Desktop settings reporting
description: Track and monitor user compliance with Docker Desktop settings policies using the reporting dashboard
keywords: settings management, compliance reporting, admin console, policy enforcement, docker desktop
@z

@x
{{< summary-bar feature_name="Compliance reporting" >}}
@y
{{< summary-bar feature_name="Compliance reporting" >}}
@z

@x
Desktop settings reporting tracks user compliance with Docker Desktop settings policies. Use this feature to monitor policy application across your organization and identify users who need assistance with compliance.
@y
Desktop settings reporting tracks user compliance with Docker Desktop settings policies. Use this feature to monitor policy application across your organization and identify users who need assistance with compliance.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you can use Docker Desktop settings reporting, make sure you have:
@y
Before you can use Docker Desktop settings reporting, make sure you have:
@z

@x
- [Docker Desktop 4.37.1 or later](/manuals/desktop/release-notes.md) installed across your organization
- [A verified domain](/manuals/enterprise/security/single-sign-on/configure.md#step-one-add-and-verify-your-domain)
- [Enforced sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md) for your organization
- A Docker Business subscription
- At least one settings policy configured
@y
- [Docker Desktop 4.37.1 or later](manuals/desktop/release-notes.md) installed across your organization
- [A verified domain](manuals/enterprise/security/single-sign-on/configure.md#step-one-add-and-verify-your-domain)
- [Enforced sign-in](manuals/enterprise/security/enforce-sign-in/_index.md) for your organization
- A Docker Business subscription
- At least one settings policy configured
@z

@x
> [!WARNING]
>
> Users on Docker Desktop versions older than 4.40 may appear non-compliant because older versions can't report compliance status. For accurate reporting, update users to Docker Desktop version 4.40 or later.
@y
> [!WARNING]
>
> Users on Docker Desktop versions older than 4.40 may appear non-compliant because older versions can't report compliance status. For accurate reporting, update users to Docker Desktop version 4.40 or later.
@z

@x
## Access the reporting dashboard
@y
## Access the reporting dashboard
@z

@x
To view compliance reporting:
@y
To view compliance reporting:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization.
1. Select **Admin Console**, then **Desktop settings reporting**.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization.
1. Select **Admin Console**, then **Desktop settings reporting**.
@z

@x
The reporting dashboard provides these tools:
@y
The reporting dashboard provides these tools:
@z

@x
- A search field to find users by username or email address
- Filter options to show users assigned to specific policies
- Toggles to hide or un-hide compliant users
- Compliance status indicators
- CSV export option to download compliance data
@y
- A search field to find users by username or email address
- Filter options to show users assigned to specific policies
- Toggles to hide or un-hide compliant users
- Compliance status indicators
- CSV export option to download compliance data
@z

@x
## User compliance statuses
@y
## User compliance statuses
@z

@x
Docker Desktop evaluates three types of status to determine overall compliance:
@y
Docker Desktop evaluates three types of status to determine overall compliance:
@z

@x
### Compliance status
@y
### Compliance status
@z

@x
This is the primary status shown in the dashboard:
@y
This is the primary status shown in the dashboard:
@z

@x
| Compliance status | What it means |
|-------------------|---------------|
| Compliant | The user fetched and applied the latest assigned policy. |
| Non-compliant | The user fetched the correct policy, but hasn't applied it. |
| Outdated | The user fetched a previous version of the policy. |
| No policy assigned | The user does not have any policy assigned to them. |
| Uncontrolled domain | The user's email domain is not verified. |
@y
| Compliance status | What it means |
|-------------------|---------------|
| Compliant | The user fetched and applied the latest assigned policy. |
| Non-compliant | The user fetched the correct policy, but hasn't applied it. |
| Outdated | The user fetched a previous version of the policy. |
| No policy assigned | The user does not have any policy assigned to them. |
| Uncontrolled domain | The user's email domain is not verified. |
@z

@x
### Domain status
@y
### Domain status
@z

@x
Shows how the user's email domain relates to your organization:
@y
Shows how the user's email domain relates to your organization:
@z

@x
| Domain status | What it means |
|---------------|---------------|
| Verified | The user’s email domain is verified. |
| Guest user | The user's email domain is not verified. |
| Domainless | Your organization has no verified domains, and the user's domain is unknown. |
@y
| Domain status | What it means |
|---------------|---------------|
| Verified | The user’s email domain is verified. |
| Guest user | The user's email domain is not verified. |
| Domainless | Your organization has no verified domains, and the user's domain is unknown. |
@z

@x
### Settings status
@y
### Settings status
@z

@x
Indicates the user's policy assignment:
@y
Indicates the user's policy assignment:
@z

@x
| Settings status | What it means |
|-----------------|---------------|
| Global policy | The user is assigned your organzation's default policy. |
| User policy | The user is assigned a specific custom policy. |
| No policy assigned | The user is not assigned to any policy. |
@y
| Settings status | What it means |
|-----------------|---------------|
| Global policy | The user is assigned your organzation's default policy. |
| User policy | The user is assigned a specific custom policy. |
| No policy assigned | The user is not assigned to any policy. |
@z

@x
## Monitor compliance
@y
## Monitor compliance
@z

@x
From the **Desktop settings reporting** dashboard, you can:
@y
From the **Desktop settings reporting** dashboard, you can:
@z

@x
- Review organization-wide compliance at a glance
- Turn on **Hide compliant users** to focus on issues
- Filter by specific policies to check targeted compliance
- Export compliance data
- Select any user's name for detailed status and resolution steps
@y
- Review organization-wide compliance at a glance
- Turn on **Hide compliant users** to focus on issues
- Filter by specific policies to check targeted compliance
- Export compliance data
- Select any user's name for detailed status and resolution steps
@z

@x
When you select a user's name, you'll see their detailed compliance information including current status, domain verification, assigned policy, last policy fetch time, and Docker Desktop version.
@y
When you select a user's name, you'll see their detailed compliance information including current status, domain verification, assigned policy, last policy fetch time, and Docker Desktop version.
@z

@x
## Resolve compliance issues
@y
## Resolve compliance issues
@z

@x
You can select a non-compliant user's name in the dashboard for recommended status resolution steps. The following sections are general resolution steps for non-compliant statuses:
@y
You can select a non-compliant user's name in the dashboard for recommended status resolution steps. The following sections are general resolution steps for non-compliant statuses:
@z

@x
### Non-compliant or outdated users
@y
### Non-compliant or outdated users
@z

@x
- Ask the user to fully quit and relaunch Docker Desktop
- Verify the user is signed in to Docker Desktop
- Confirm the user has Docker Desktop 4.40 or later
@y
- Ask the user to fully quit and relaunch Docker Desktop
- Verify the user is signed in to Docker Desktop
- Confirm the user has Docker Desktop 4.40 or later
@z

@x
### Uncontrolled domain users
@y
### Uncontrolled domain users
@z

@x
- Verify the user's email domain in your organization settings
- If the domain should be controlled, add and verify it, then wait for verification
- If the user is a guest and shouldn't be controlled, no action is needed
@y
- Verify the user's email domain in your organization settings
- If the domain should be controlled, add and verify it, then wait for verification
- If the user is a guest and shouldn't be controlled, no action is needed
@z

@x
### No policy assigned users
@y
### No policy assigned users
@z

@x
- Assign the user to an existing policy
- Create a new user-specific policy for them
- Verify they're included in your organization's default policy scope
@y
- Assign the user to an existing policy
- Create a new user-specific policy for them
- Verify they're included in your organization's default policy scope
@z

@x
After users take corrective action, refresh the reporting dashboard to verify status changes.
@y
After users take corrective action, refresh the reporting dashboard to verify status changes.
@z

@x
## Policy update timing
@y
## Policy update timing
@z

@x
Docker Desktop checks for policy updates:
@y
Docker Desktop checks for policy updates:
@z

@x
- At startup
- Every 60 minutes while Docker Desktop is running
- When users restart Docker Desktop
@y
- At startup
- Every 60 minutes while Docker Desktop is running
- When users restart Docker Desktop
@z

@x
Changes to policies in the Admin Console are available immediately, but users must restart Docker Desktop to apply them.
@y
Changes to policies in the Admin Console are available immediately, but users must restart Docker Desktop to apply them.
@z
