%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Understand how to use the Desktop settings reporting dashboard
keywords: Settings Management, docker desktop, hardened desktop, reporting, compliance
title: Desktop settings reporting
linkTitle: Desktop settings reporting
@y
description: Understand how to use the Desktop settings reporting dashboard
keywords: Settings Management, docker desktop, hardened desktop, reporting, compliance
title: Desktop settings reporting
linkTitle: Desktop settings reporting
@z

@x
{{< summary-bar feature_name="Compliance reporting" >}}
@y
{{< summary-bar feature_name="Compliance reporting" >}}
@z

@x
Desktop settings reporting is a feature of Desktop Settings Management that
tracks and reports user compliance with the settings policies that are assigned
to them. This lets administrators track the application of settings and
monitor what actions they need to take to make users compliant.
@y
Desktop settings reporting is a feature of Desktop Settings Management that
tracks and reports user compliance with the settings policies that are assigned
to them. This lets administrators track the application of settings and
monitor what actions they need to take to make users compliant.
@z

@x
This guide provides steps for accessing Desktop settings reporting, viewing
compliance status, and resolving non-compliant users.
@y
This guide provides steps for accessing Desktop settings reporting, viewing
compliance status, and resolving non-compliant users.
@z

@x
## Access Desktop settings reporting
@y
## Access Desktop settings reporting
@z

@x
> [!IMPORTANT]
>
> Desktop settings reporting is in Early Access and is being rolled out
> gradually. You may not see this setting in the Admin Console yet.
@y
> [!IMPORTANT]
>
> Desktop settings reporting is in Early Access and is being rolled out
> gradually. You may not see this setting in the Admin Console yet.
@z

@x
1. Sign in to the [Admin Console](https://app.docker.com/admin).
2. Select your organization or company from the **Choose profile** page.
3. Under Docker Desktop, select **Reporting**.
@y
1. Sign in to the [Admin Console](https://app.docker.com/admin).
2. Select your organization or company from the **Choose profile** page.
3. Under Docker Desktop, select **Reporting**.
@z

@x
This opens the Desktop settings reporting page. From here you can:
@y
This opens the Desktop settings reporting page. From here you can:
@z

@x
- Use the **Search** field to search by username or email address
- Filter by policies
- Hide or un-hide compliant users
- View a user’s compliance status and what policy is assigned to the user
- Download a CSV file of user compliance information
@y
- Use the **Search** field to search by username or email address
- Filter by policies
- Hide or un-hide compliant users
- View a user’s compliance status and what policy is assigned to the user
- Download a CSV file of user compliance information
@z

@x
## View compliance status
@y
## View compliance status
@z

@x
> [!WARNING]
>
> Users on Docker Desktop versions older than 4.40 may appear non-compliant
> because older versions can't report compliance. To ensure accurate
> compliance status, users must update to Docker Desktop version 4.40 and later.
@y
> [!WARNING]
>
> Users on Docker Desktop versions older than 4.40 may appear non-compliant
> because older versions can't report compliance. To ensure accurate
> compliance status, users must update to Docker Desktop version 4.40 and later.
@z

@x
1. Sign in to the [Admin Console](https://app.docker.com/admin).
2. Select your organization or company from the **Choose profile** page.
3. Under **Docker Desktop**, select **Reporting**. By default, non-compliant users
are displayed.
4. Optional. Select the **Hide compliant users** checkbox to show both compliant
and non-compliant users.
5. Use the **Search** field to search by username or email address.
6. Hover over a user’s compliance status indicator to quickly view their status.
7. Select a username to view more details about their compliance status, and for
steps to resolve non-compliant users.
@y
1. Sign in to the [Admin Console](https://app.docker.com/admin).
2. Select your organization or company from the **Choose profile** page.
3. Under **Docker Desktop**, select **Reporting**. By default, non-compliant users
are displayed.
4. Optional. Select the **Hide compliant users** checkbox to show both compliant
and non-compliant users.
5. Use the **Search** field to search by username or email address.
6. Hover over a user’s compliance status indicator to quickly view their status.
7. Select a username to view more details about their compliance status, and for
steps to resolve non-compliant users.
@z

@x
## Understand compliance status
@y
## Understand compliance status
@z

@x
Docker evaluates compliance status based on:
@y
Docker evaluates compliance status based on:
@z

@x
- Compliance status: Whether a user has fetched and applied the latest settings. This is the primary label shown on the reporting page.
- Domain status: Whether the user's email matches a verified domain.
- Settings status: Whether a settings policy is applied to the user.
@y
- Compliance status: Whether a user has fetched and applied the latest settings. This is the primary label shown on the reporting page.
- Domain status: Whether the user's email matches a verified domain.
- Settings status: Whether a settings policy is applied to the user.
@z

@x
The combination of these statuses determines what actions you need to take.
@y
The combination of these statuses determines what actions you need to take.
@z

@x
### Compliance status reference
@y
### Compliance status reference
@z

@x
This reference explains how each status is determined in the reporting dashboard
based on user domain and settings data. The Admin Console displays the
highest-priority applicable status according to the following rules.
@y
This reference explains how each status is determined in the reporting dashboard
based on user domain and settings data. The Admin Console displays the
highest-priority applicable status according to the following rules.
@z

@x
**Compliance status**
@y
**Compliance status**
@z

@x
| Compliance status | What it means |
|-------------------|---------------|
| Uncontrolled domain | The user's email domain is not verified. |
| No policy assigned | The user does not have any policy assigned to them. |
| Non-compliant | The user fetched the correct policy, but hasn't applied it. |
| Outdated | The user fetched a previous version of the policy. |
| Unknown | The user hasn't fetched any policy yet, or their compliance can't be determined. |
| Compliant | The user fetched and applied the latest assigned policy. |
@y
| Compliance status | What it means |
|-------------------|---------------|
| Uncontrolled domain | The user's email domain is not verified. |
| No policy assigned | The user does not have any policy assigned to them. |
| Non-compliant | The user fetched the correct policy, but hasn't applied it. |
| Outdated | The user fetched a previous version of the policy. |
| Unknown | The user hasn't fetched any policy yet, or their compliance can't be determined. |
| Compliant | The user fetched and applied the latest assigned policy. |
@z

@x
**Domain status**
@y
**Domain status**
@z

@x
This reflects how the user’s email domain is evaluated based on the organization’s domain setup.
@y
This reflects how the user’s email domain is evaluated based on the organization’s domain setup.
@z

@x
| Domain status | What it means |
|---------------|---------------|
| Verified | The user’s email domain is verified. |
| Guest user | The user's email domain is not verified. |
| Domainless | Your organization has no verified domains, and the user's domain is unknown. |
| Unknown user | Your organization has verified domains, but the user's domain is unknown. |
@y
| Domain status | What it means |
|---------------|---------------|
| Verified | The user’s email domain is verified. |
| Guest user | The user's email domain is not verified. |
| Domainless | Your organization has no verified domains, and the user's domain is unknown. |
| Unknown user | Your organization has verified domains, but the user's domain is unknown. |
@z

@x
**Settings status**
@y
**Settings status**
@z

@x
This shows whether and how the user is assigned a settings policy.
@y
This shows whether and how the user is assigned a settings policy.
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
## Resolve compliance status
@y
## Resolve compliance status
@z

@x
To resolve compliance status, you must view a user's compliance status details
by selecting their username from the Desktop settings reporting page.
These details include the following information:
@y
To resolve compliance status, you must view a user's compliance status details
by selecting their username from the Desktop settings reporting page.
These details include the following information:
@z

@x
- **Compliance status**: Indicates whether the user is compliant with the
settings applied to them
- **Domain status**: Indicates whether the user’s email address is associated
with a verified domain
- **Settings status**: Indicates whether the user has settings applied to them
- **Resolution steps**: If a user is non-compliant, this provides information
on how to resolve the user’s compliance status
@y
- **Compliance status**: Indicates whether the user is compliant with the
settings applied to them
- **Domain status**: Indicates whether the user’s email address is associated
with a verified domain
- **Settings status**: Indicates whether the user has settings applied to them
- **Resolution steps**: If a user is non-compliant, this provides information
on how to resolve the user’s compliance status
@z

@x
### Compliant
@y
### Compliant
@z

@x
When a user is compliant, a **Compliant** icon appears next to their name on the
Desktop settings reporting dashboard. Select a compliant user to open their
compliance status details. Compliant users have the following status details:
@y
When a user is compliant, a **Compliant** icon appears next to their name on the
Desktop settings reporting dashboard. Select a compliant user to open their
compliance status details. Compliant users have the following status details:
@z

@x
- **Compliance status**: Compliant
- **Domain status**: Verified
- **Settings status**: Global policy or user policy
- **User is compliant** indicator
@y
- **Compliance status**: Compliant
- **Domain status**: Verified
- **Settings status**: Global policy or user policy
- **User is compliant** indicator
@z

@x
No resolution steps are needed for compliant users.
@y
No resolution steps are needed for compliant users.
@z

@x
### Non-compliant
@y
### Non-compliant
@z

@x
When a user is non-compliant, a **Non-compliant** or **Unknown** icon appears
next to their name on the Desktop settings reporting dashboard. Non-compliant
users must have their compliance status resolved:
@y
When a user is non-compliant, a **Non-compliant** or **Unknown** icon appears
next to their name on the Desktop settings reporting dashboard. Non-compliant
users must have their compliance status resolved:
@z

@x
1. Select a username from the Desktop settings reporting dashboard.
2. On the compliance status details page, follow the resolution steps provided
to resolve the compliance status.
3. Refresh the page to ensure the resolution steps resolved the compliance
status.
@y
1. Select a username from the Desktop settings reporting dashboard.
2. On the compliance status details page, follow the resolution steps provided
to resolve the compliance status.
3. Refresh the page to ensure the resolution steps resolved the compliance
status.
@z
