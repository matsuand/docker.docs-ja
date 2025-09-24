%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Manage domains
description: Add, verify, and manage domains to control user access and enable auto-provisioning in Docker organizations
keywords: domain management, domain verification, auto-provisioning, user management, DNS, TXT record, Admin Console
weight: 55
aliases:
 - /security/for-admins/domain-management/
---
@y
---
title: Manage domains
description: Add, verify, and manage domains to control user access and enable auto-provisioning in Docker organizations
keywords: domain management, domain verification, auto-provisioning, user management, DNS, TXT record, Admin Console
weight: 55
aliases:
 - /security/for-admins/domain-management/
---
@z

@x
{{< summary-bar feature_name="Domain management" >}}
@y
{{< summary-bar feature_name="Domain management" >}}
@z

@x
Domain management lets you add and verify domains for your organization, then enable auto-provisioning to automatically add users when they sign in with email addresses that match your verified domains. This approach simplifies user management, ensures consistent security settings, and reduces the risk of unmanaged users accessing Docker without visibility or control.
@y
Domain management lets you add and verify domains for your organization, then enable auto-provisioning to automatically add users when they sign in with email addresses that match your verified domains. This approach simplifies user management, ensures consistent security settings, and reduces the risk of unmanaged users accessing Docker without visibility or control.
@z

@x
This page provides steps to add and delete domains, configure auto-provisioning, and audit uncaptured users.
@y
This page provides steps to add and delete domains, configure auto-provisioning, and audit uncaptured users.
@z

@x
## Add and verify a domain
@y
## Add and verify a domain
@z

@x
Adding a domain requires verification to confirm ownership. The verification process uses DNS records to prove you control the domain.
@y
Adding a domain requires verification to confirm ownership. The verification process uses DNS records to prove you control the domain.
@z

@x
### Add a domain
@y
### Add a domain
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization. If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
1. Select **Admin Console**, then **Domain management**.
1. Select **Add a domain**.
1. Enter your domain and select **Add domain**.
1. In the pop-up modal, copy the **TXT Record Value** to verify your domain.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization. If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
1. Select **Admin Console**, then **Domain management**.
1. Select **Add a domain**.
1. Enter your domain and select **Add domain**.
1. In the pop-up modal, copy the **TXT Record Value** to verify your domain.
@z

@x
### Verify a domain
@y
### Verify a domain
@z

@x
Verification confirms that you own the domain by adding a TXT record to your Domain Name System (DNS) host. It can take up to 72 hours for the DNS change to propagate. Docker automatically checks for the record and confirms ownership once the change is recognized.
@y
Verification confirms that you own the domain by adding a TXT record to your Domain Name System (DNS) host. It can take up to 72 hours for the DNS change to propagate. Docker automatically checks for the record and confirms ownership once the change is recognized.
@z

@x
> [!TIP]
>
> The record name field determines where the TXT record is added in your domain (root or subdomain). For root domains like `example.com`, use `@` or leave the record name empty, depending on your provider. Don't enter values like docker, `docker-verification`, `www`, or your domain name, as these may direct to the wrong place. Check your DNS provider's documentation to verify record name requirements.
@y
> [!TIP]
>
> The record name field determines where the TXT record is added in your domain (root or subdomain). For root domains like `example.com`, use `@` or leave the record name empty, depending on your provider. Don't enter values like docker, `docker-verification`, `www`, or your domain name, as these may direct to the wrong place. Check your DNS provider's documentation to verify record name requirements.
@z

@x
Follow the steps for your DNS provider to add the **TXT Record Value**. If
your provider isn't listed, use the steps for "Other providers":
@y
Follow the steps for your DNS provider to add the **TXT Record Value**. If
your provider isn't listed, use the steps for "Other providers":
@z

@x
{{< tabs >}}
{{< tab name="AWS Route 53" >}}
@y
{{< tabs >}}
{{< tab name="AWS Route 53" >}}
@z

@x
1. Add your TXT record to AWS by following [Creating records by using the Amazon Route 53 console](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-creating.html).
1. Wait up to 72 hours for TXT record verification.
1. Return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@y
1. Add your TXT record to AWS by following [Creating records by using the Amazon Route 53 console](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-creating.html).
1. Wait up to 72 hours for TXT record verification.
1. Return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@z

@x
{{< /tab >}}
{{< tab name="Google Cloud DNS" >}}
@y
{{< /tab >}}
{{< tab name="Google Cloud DNS" >}}
@z

@x
1. Add your TXT record to Google Cloud DNS by following [Verifying your domain with a TXT record](https://cloud.google.com/identity/docs/verify-domain-txt).
1. Wait up to 72 hours for TXT record verification.
1. Return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@y
1. Add your TXT record to Google Cloud DNS by following [Verifying your domain with a TXT record](https://cloud.google.com/identity/docs/verify-domain-txt).
1. Wait up to 72 hours for TXT record verification.
1. Return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@z

@x
{{< /tab >}}
{{< tab name="GoDaddy" >}}
@y
{{< /tab >}}
{{< tab name="GoDaddy" >}}
@z

@x
1. Add your TXT record to GoDaddy by following [Add a TXT record](https://www.godaddy.com/help/add-a-txt-record-19232).
1. Wait up to 72 hours for TXT record verification.
1. Return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@y
1. Add your TXT record to GoDaddy by following [Add a TXT record](https://www.godaddy.com/help/add-a-txt-record-19232).
1. Wait up to 72 hours for TXT record verification.
1. Return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@z

@x
{{< /tab >}}
{{< tab name="Other providers" >}}
@y
{{< /tab >}}
{{< tab name="Other providers" >}}
@z

@x
1. Sign in to your domain host.
1. Add a TXT record to your DNS settings using the **TXT Record Value** from Docker.
1. Wait up to 72 hours for TXT record verification.
1. Return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@y
1. Sign in to your domain host.
1. Add a TXT record to your DNS settings using the **TXT Record Value** from Docker.
1. Wait up to 72 hours for TXT record verification.
1. Return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Configure auto-provisioning
@y
## Configure auto-provisioning
@z

@x
Auto-provisioning automatically adds users to your organization when they sign in with email addresses that match your verified domains. You must verify a domain before enabling auto-provisioning.
@y
Auto-provisioning automatically adds users to your organization when they sign in with email addresses that match your verified domains. You must verify a domain before enabling auto-provisioning.
@z

@x
> [!IMPORTANT]
>
> For domains that are part of an SSO connection, Just-in-Time (JIT) provisioning takes precedence over auto-provisioning when adding users to an organization.
@y
> [!IMPORTANT]
>
> For domains that are part of an SSO connection, Just-in-Time (JIT) provisioning takes precedence over auto-provisioning when adding users to an organization.
@z

@x
### How auto-provisioning works
@y
### How auto-provisioning works
@z

@x
When auto-provisioning is enabled for a verified domain:
@y
When auto-provisioning is enabled for a verified domain:
@z

@x
- Users who sign in to Docker with matching email addresses are automatically added to your organization.
- Auto-provisioning only adds existing Docker users to your organization, it doesn't create new accounts.
- Users experience no changes to their sign-in process.
- Company and organization owners receive email notifications when new users are added.
- You may need to [manage seats](/manuals/subscription/manage-seats.md) to accommodate new users.
@y
- Users who sign in to Docker with matching email addresses are automatically added to your organization.
- Auto-provisioning only adds existing Docker users to your organization, it doesn't create new accounts.
- Users experience no changes to their sign-in process.
- Company and organization owners receive email notifications when new users are added.
- You may need to [manage seats](/manuals/subscription/manage-seats.md) to accommodate new users.
@z

@x
### Enable auto-provisioning
@y
### Enable auto-provisioning
@z

@x
Auto-provisioning is configured per domain. To enable it:
@y
Auto-provisioning is configured per domain. To enable it:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
your company or organization.
1. Select **Admin Console**, then **Domain management**.
1. Select the **Actions menu** next to the domain you want to enable
auto-provisioning for.
1. Select **Enable auto-provisioning**.
1. Optional. If enabling auto-provisioning at the company level, select an
organization.
1. Select **Enable** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
your company or organization.
1. Select **Admin Console**, then **Domain management**.
1. Select the **Actions menu** next to the domain you want to enable
auto-provisioning for.
1. Select **Enable auto-provisioning**.
1. Optional. If enabling auto-provisioning at the company level, select an
organization.
1. Select **Enable** to confirm.
@z

@x
The **Auto-provisioning** column will update to **Enabled** for the domain.
@y
The **Auto-provisioning** column will update to **Enabled** for the domain.
@z

@x
### Disable auto-provisioning
@y
### Disable auto-provisioning
@z

@x
To disable auto-provisioning for a user:
@y
To disable auto-provisioning for a user:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization. If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
1. Select **Admin Console**, then **Domain management**.
1. Select the **Actions menu** next to your domain.
1. Select **Disable auto-provisioning**.
1. Select **Disable** to confirm.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization. If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
1. Select **Admin Console**, then **Domain management**.
1. Select the **Actions menu** next to your domain.
1. Select **Disable auto-provisioning**.
1. Select **Disable** to confirm.
@z

@x
## Audit domains for uncaptured users
@y
## Audit domains for uncaptured users
@z

@x
{{< summary-bar feature_name="Domain audit" >}}
@y
{{< summary-bar feature_name="Domain audit" >}}
@z

@x
Domain audit identifies uncaptured users. Uncaptured users are Docker users who have authenticated using an email address associated with your verified domains but aren't members of your Docker organization.
@y
Domain audit identifies uncaptured users. Uncaptured users are Docker users who have authenticated using an email address associated with your verified domains but aren't members of your Docker organization.
@z

@x
### Limitations
@y
### Limitations
@z

@x
Domain audit can't identify:
@y
Domain audit can't identify:
@z

@x
- Users who access Docker Desktop without authenticating
- Users who authenticate using an account that doesn't have an
email address associated with one of your verified domains
@y
- Users who access Docker Desktop without authenticating
- Users who authenticate using an account that doesn't have an
email address associated with one of your verified domains
@z

@x
To prevent unidentifiable users from accessing Docker Desktop, [enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md).
@y
To prevent unidentifiable users from accessing Docker Desktop, [enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md).
@z

@x
### Run a domain audit
@y
### Run a domain audit
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and choose your
company.
1. Select **Admin Console**, then **Domain management**.
1. In **Domain audit**, select **Export Users** to export a CSV file
of uncaptured users.
@y
1. Sign in to [Docker Home](https://app.docker.com) and choose your
company.
1. Select **Admin Console**, then **Domain management**.
1. In **Domain audit**, select **Export Users** to export a CSV file
of uncaptured users.
@z

@x
The CSV file contains the following columns:
- Name: Docker user's display name
- Username: Docker ID of the user
- Email: Email address of the user
@y
The CSV file contains the following columns:
- Name: Docker user's display name
- Username: Docker ID of the user
- Email: Email address of the user
@z

@x
### Invite uncaptured users
@y
### Invite uncaptured users
@z

@x
You can bulk invite uncaptured users to your organization using the exported
CSV file. For more information on bulk inviting users, see
[Manage organization members](/manuals/admin/organization/members.md).
@y
You can bulk invite uncaptured users to your organization using the exported
CSV file. For more information on bulk inviting users, see
[Manage organization members](/manuals/admin/organization/members.md).
@z

@x
## Delete a domain
@y
## Delete a domain
@z

@x
Deleting a domain removes its TXT record value and disables any associated auto-provisioning.
@y
Deleting a domain removes its TXT record value and disables any associated auto-provisioning.
@z

@x
>[!WARNING]
>
> Deleting a domain will disable auto-provisioning for that domain and remove verification. This action cannot be undone.
@y
>[!WARNING]
>
> Deleting a domain will disable auto-provisioning for that domain and remove verification. This action cannot be undone.
@z

@x
To delete a domain:
@y
To delete a domain:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization. If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
1. Select **Admin Console**, then **Domain management**.
1. For the domain you want to delete, select the **Actions** menu, then
**Delete domain**.
1. To confirm, select **Delete domain** in the pop-up modal.
@y
1. Sign in to [Docker Home](https://app.docker.com) and select
your organization. If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
1. Select **Admin Console**, then **Domain management**.
1. For the domain you want to delete, select the **Actions** menu, then
**Delete domain**.
1. To confirm, select **Delete domain** in the pop-up modal.
@z
