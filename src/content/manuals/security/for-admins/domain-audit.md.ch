%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn how to audit your domains for uncaptured users.
keywords: domain audit, security, identify users, manage users
title: Domain audit
@y
description: Learn how to audit your domains for uncaptured users.
keywords: domain audit, security, identify users, manage users
title: Domain audit
@z

@x
{{< summary-bar feature_name="Domain audit" >}}
@y
{{< summary-bar feature_name="Domain audit" >}}
@z

@x
Domain audit identifies uncaptured users in an organization. Uncaptured users are Docker users who have authenticated to Docker using an email address associated with one of your verified domains, but they're not a member of your organization in Docker. You can audit domains on organizations that are part of the Docker Business subscription. To upgrade your existing account to a Docker Business subscription, see [Upgrade your subscription](/subscription/upgrade/).
@y
Domain audit identifies uncaptured users in an organization. Uncaptured users are Docker users who have authenticated to Docker using an email address associated with one of your verified domains, but they're not a member of your organization in Docker. You can audit domains on organizations that are part of the Docker Business subscription. To upgrade your existing account to a Docker Business subscription, see [Upgrade your subscription](__SUBDIR__/subscription/upgrade/).
@z

@x
Uncaptured users who access Docker Desktop in your environment may pose a security risk because your organization's security settings, like Image Access Management and Registry Access Management, aren't applied to a user's session. In addition, you won't have visibility into the activity of uncaptured users. You can add uncaptured users to your organization to gain visibility into their activity and apply your organization's security settings.
@y
Uncaptured users who access Docker Desktop in your environment may pose a security risk because your organization's security settings, like Image Access Management and Registry Access Management, aren't applied to a user's session. In addition, you won't have visibility into the activity of uncaptured users. You can add uncaptured users to your organization to gain visibility into their activity and apply your organization's security settings.
@z

@x
Domain audit can't identify the following Docker users in your environment:
@y
Domain audit can't identify the following Docker users in your environment:
@z

@x
- Users who access Docker Desktop without authenticating
- Users who authenticate using an account that doesn't have an email address associated with one of your verified domains
@y
- Users who access Docker Desktop without authenticating
- Users who authenticate using an account that doesn't have an email address associated with one of your verified domains
@z

@x
Although domain audit can't identify all Docker users in your environment, you can enforce sign-in to prevent unidentifiable users from accessing Docker Desktop in your environment. For more details about enforcing sign-in, see [Configure registry.json to enforce sign-in](../for-admins/enforce-sign-in/_index.md).
@y
Although domain audit can't identify all Docker users in your environment, you can enforce sign-in to prevent unidentifiable users from accessing Docker Desktop in your environment. For more details about enforcing sign-in, see [Configure registry.json to enforce sign-in](../for-admins/enforce-sign-in/_index.md).
@z

@x
> [!TIP]
>
> You can use endpoint management (MDM) software to identify the number of Docker Desktop instances and their versions within your environment. This can provide accurate license reporting, help ensure your machines use the latest version of Docker Desktop, and enable you to [enforce sign-in](enforce-sign-in/_index.md).
> - [Intune](https://learn.microsoft.com/en-us/mem/intune/apps/app-discovered-apps)
> - [Jamf](https://docs.jamf.com/10.25.0/jamf-pro/administrator-guide/Application_Usage.html)
> - [Kandji](https://support.kandji.io/support/solutions/articles/72000559793-view-a-device-application-list)
> - [Kolide](https://www.kolide.com/features/device-inventory/properties/mac-apps)
> - [Workspace One](https://blogs.vmware.com/euc/2022/11/how-to-use-workspace-one-intelligence-to-manage-app-licenses-and-reduce-costs.html)
@y
> [!TIP]
>
> You can use endpoint management (MDM) software to identify the number of Docker Desktop instances and their versions within your environment. This can provide accurate license reporting, help ensure your machines use the latest version of Docker Desktop, and enable you to [enforce sign-in](enforce-sign-in/_index.md).
> - [Intune](https://learn.microsoft.com/en-us/mem/intune/apps/app-discovered-apps)
> - [Jamf](https://docs.jamf.com/10.25.0/jamf-pro/administrator-guide/Application_Usage.html)
> - [Kandji](https://support.kandji.io/support/solutions/articles/72000559793-view-a-device-application-list)
> - [Kolide](https://www.kolide.com/features/device-inventory/properties/mac-apps)
> - [Workspace One](https://blogs.vmware.com/euc/2022/11/how-to-use-workspace-one-intelligence-to-manage-app-licenses-and-reduce-costs.html)
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you audit your domains, review the following required prerequisites:
@y
Before you audit your domains, review the following required prerequisites:
@z

@x
- Your organization must be part of a Docker Business subscription. To upgrade your existing account to a Docker Business subscription, see [Upgrade your subscription](../../subscription/change.md).
- You must [add and verify your domains](./single-sign-on/configure/_index.md#step-one-add-and-verify-your-domain).
@y
- Your organization must be part of a Docker Business subscription. To upgrade your existing account to a Docker Business subscription, see [Upgrade your subscription](../../subscription/change.md).
- You must [add and verify your domains](./single-sign-on/configure/_index.md#step-one-add-and-verify-your-domain).
@z

@x
> [!IMPORTANT]
>
> Domain audit is not supported for companies or organizations within a company.
@y
> [!IMPORTANT]
>
> Domain audit is not supported for companies or organizations within a company.
@z

@x
## Audit your domains for uncaptured users
@y
## Audit your domains for uncaptured users
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
{{% admin-domain-audit product="admin" %}}
@y
{{% admin-domain-audit product="admin" %}}
@z

@x
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@y
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% include "hub-org-management.md" %}}
@y
{{% include "hub-org-management.md" %}}
@z

@x
{{% admin-domain-audit product="hub" %}}
@y
{{% admin-domain-audit product="hub" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
