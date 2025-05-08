%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn how to manage domains and users in the Admin Console
keywords: domain management, security, identify users, manage users
title: Domain management
@y
description: Learn how to manage domains and users in the Admin Console
keywords: domain management, security, identify users, manage users
title: Domain management
@z

@x
{{< summary-bar feature_name="Domain management" >}}
@y
{{< summary-bar feature_name="Domain management" >}}
@z

@x
Domain management lets you add and verify domains, and enable
auto-provisioning for users. Auto-provisioning adds users to your
organization when they sign in with an email address that matches a verified
domain.
@y
Domain management lets you add and verify domains, and enable
auto-provisioning for users. Auto-provisioning adds users to your
organization when they sign in with an email address that matches a verified
domain.
@z

@x
This simplifies user management, ensures consistent security settings, and
reduces the risk of unmanaged users accessing Docker without visibility
or control.
@y
This simplifies user management, ensures consistent security settings, and
reduces the risk of unmanaged users accessing Docker without visibility
or control.
@z

@x
## Add a domain
@y
## Add a domain
@z

@x
1. Sign in to the [Admin Console](https://admin.docker.com/).
2. Select your organization or company from the **Choose profile** page.
If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
3. Under **Security and access**, select **Domain management**.
4. Select **Add a domain**.
5. Enter your domain and select **Add domain**.
6. In the pop-up modal, copy the **TXT Record Value** to verify your domain.
@y
1. Sign in to the [Admin Console](https://admin.docker.com/).
2. Select your organization or company from the **Choose profile** page.
If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
3. Under **Security and access**, select **Domain management**.
4. Select **Add a domain**.
5. Enter your domain and select **Add domain**.
6. In the pop-up modal, copy the **TXT Record Value** to verify your domain.
@z

@x
## Verify a domain
@y
## Verify a domain
@z

@x
Verifying your domain confirms that you own it. To verify, add a TXT record to
your Domain Name System (DNS) host using the value provided by Docker. This
value proves ownership and instructs your DNS to publish the record.
@y
Verifying your domain confirms that you own it. To verify, add a TXT record to
your Domain Name System (DNS) host using the value provided by Docker. This
value proves ownership and instructs your DNS to publish the record.
@z

@x
It can take up to 72 hours for the DNS change to propagate. Docker automatically
checks for the record and confirms ownership once the change is recognized.
@y
It can take up to 72 hours for the DNS change to propagate. Docker automatically
checks for the record and confirms ownership once the change is recognized.
@z

@x
Follow your DNS provider’s documentation to add the **TXT Record Value**. If
your provider isn't listed, use the steps for other providers.
@y
Follow your DNS provider’s documentation to add the **TXT Record Value**. If
your provider isn't listed, use the steps for other providers.
@z

@x
> [!TIP]
>
> The record name field determines where the TXT record is added in your domain
(root or subdomain). In general, refer to the following tips for
adding a record name:
>
> - Use `@` or leave the record name empty for root domains like `example.com`,
depending on your provider.
> - Don't enter values like `docker`, `docker-verification`, `www`, or your
domain name. These values may direct to the wrong place.
>
> Check your DNS provider's documentation to verify record name requirements.
@y
> [!TIP]
>
> The record name field determines where the TXT record is added in your domain
(root or subdomain). In general, refer to the following tips for
adding a record name:
>
> - Use `@` or leave the record name empty for root domains like `example.com`,
depending on your provider.
> - Don't enter values like `docker`, `docker-verification`, `www`, or your
domain name. These values may direct to the wrong place.
>
> Check your DNS provider's documentation to verify record name requirements.
@z

@x
{{< tabs >}}
{{< tab name="AWS Route 53" >}}
@y
{{< tabs >}}
{{< tab name="AWS Route 53" >}}
@z

@x
1. To add your TXT record to AWS, see [Creating records by using the Amazon Route 53 console](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-creating.html).
2. TXT record verification can take 72 hours. Once you have waited for
TXT record verification, return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@y
1. To add your TXT record to AWS, see [Creating records by using the Amazon Route 53 console](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-creating.html).
2. TXT record verification can take 72 hours. Once you have waited for
TXT record verification, return to the **Domain management** page of the
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
1. To add your TXT record to Google Cloud DNS, see [Verifying your domain with a TXT record](https://cloud.google.com/identity/docs/verify-domain-txt).
2. TXT record verification can take 72 hours. Once you have waited for TXT
record verification, return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@y
1. To add your TXT record to Google Cloud DNS, see [Verifying your domain with a TXT record](https://cloud.google.com/identity/docs/verify-domain-txt).
2. TXT record verification can take 72 hours. Once you have waited for TXT
record verification, return to the **Domain management** page of the
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
1. To add your TXT record to GoDaddy, see [Add a TXT record](https://www.godaddy.com/help/add-a-txt-record-19232).
2. TXT record verification can take 72 hours. Once you have waited for TXT
record verification, return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to your
domain name.
@y
1. To add your TXT record to GoDaddy, see [Add a TXT record](https://www.godaddy.com/help/add-a-txt-record-19232).
2. TXT record verification can take 72 hours. Once you have waited for TXT
record verification, return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to your
domain name.
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
2. Add a TXT record to your DNS settings and save the record.
3. TXT record verification can take 72 hours. Once you have waited for TXT
record verification, return to the **Domain management** page of the
[Admin Console](https://app.docker.com/admin) and select **Verify** next to
your domain name.
@y
1. Sign in to your domain host.
2. Add a TXT record to your DNS settings and save the record.
3. TXT record verification can take 72 hours. Once you have waited for TXT
record verification, return to the **Domain management** page of the
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
## Delete a domain
@y
## Delete a domain
@z

@x
Deleting a domain removes the assigned TXT record value. To delete a domain:
@y
Deleting a domain removes the assigned TXT record value. To delete a domain:
@z

@x
1. Sign in to the [Admin Console](https://admin.docker.com/).
2. Select your organization or company from the **Choose profile** page.
If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
3. Under **Security and access**, select **Domain management**.
4. For the domain you want to delete, section the **Actions** menu, then
**Delete domain**.
5. To confirm, select **Delete domain** in the pop-up modal.
@y
1. Sign in to the [Admin Console](https://admin.docker.com/).
2. Select your organization or company from the **Choose profile** page.
If your organization is part of a company, select the company
and configure the domain for the organization at the company level.
3. Under **Security and access**, select **Domain management**.
4. For the domain you want to delete, section the **Actions** menu, then
**Delete domain**.
5. To confirm, select **Delete domain** in the pop-up modal.
@z

@x
## Auto-provisioning
@y
## Auto-provisioning
@z

@x
You must add and verify a domain before enabling auto-provisioning. This
confirms your organization owns the domain. Once a domain is verified,
Docker can automatically associate matching users with your organization.
Auto-provisioning does not require an SSO connection.
@y
You must add and verify a domain before enabling auto-provisioning. This
confirms your organization owns the domain. Once a domain is verified,
Docker can automatically associate matching users with your organization.
Auto-provisioning does not require an SSO connection.
@z

@x
> [!IMPORTANT]
>
> For domains that are part of an SSO connection, Just-in-Time (JIT) overrides
auto-provisioning to add users to an organization.
@y
> [!IMPORTANT]
>
> For domains that are part of an SSO connection, Just-in-Time (JIT) overrides
auto-provisioning to add users to an organization.
@z

@x
### How it works
@y
### How it works
@z

@x
When auto-provisioning is enabled for a verified domain, the next time a user
signs into Docker with an email address that is associated with your verified
domain, they are automatically added to your organization. Auto-provisioning
does not create accounts for new users, it adds existing unassociated users to
your organization. Users will *not* experience any sign in or user experience
changes.
@y
When auto-provisioning is enabled for a verified domain, the next time a user
signs into Docker with an email address that is associated with your verified
domain, they are automatically added to your organization. Auto-provisioning
does not create accounts for new users, it adds existing unassociated users to
your organization. Users will *not* experience any sign in or user experience
changes.
@z

@x
When a new user is auto-provisioned, company and organization owners will
receive an email notifying them that a new user has been added to their
organization. If you need to add more seats to your organization to
to accomodate new users, see [Manage seats](/manuals/subscription/manage-seats.md).
@y
When a new user is auto-provisioned, company and organization owners will
receive an email notifying them that a new user has been added to their
organization. If you need to add more seats to your organization to
to accomodate new users, see [Manage seats](manuals/subscription/manage-seats.md).
@z

@x
### Enable auto-provisioning
@y
### Enable auto-provisioning
@z

@x
Auto-provisioning is enabled per user. To enable
auto-provisioning:
@y
Auto-provisioning is enabled per user. To enable
auto-provisioning:
@z

@x
1. Open the [Admin Console](https://app.docker.com/admin).
2. Select **Domain management** from the left-hand navigation.
3. Select the **Actions menu** next to the user you want to enable
auto-provisioning for.
4. Select **Enable auto-provisioning**.
5. Optional. If enabling auto-provisioning at the company level, select an
organization for the user.
6. Select **Enable** to confirm.
@y
1. Open the [Admin Console](https://app.docker.com/admin).
2. Select **Domain management** from the left-hand navigation.
3. Select the **Actions menu** next to the user you want to enable
auto-provisioning for.
4. Select **Enable auto-provisioning**.
5. Optional. If enabling auto-provisioning at the company level, select an
organization for the user.
6. Select **Enable** to confirm.
@z

@x
The **Auto-provisioning** column will update to **Enabled**.
@y
The **Auto-provisioning** column will update to **Enabled**.
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
1. Open the [Admin Console](https://app.docker.com/admin).
2. Select **Domain management** from the left-hand navigation.
3. Select the **Actions menu** next to your user.
4. Select **Disable auto-provisioning**.
5. Select **Disable**.
@y
1. Open the [Admin Console](https://app.docker.com/admin).
2. Select **Domain management** from the left-hand navigation.
3. Select the **Actions menu** next to your user.
4. Select **Disable auto-provisioning**.
5. Select **Disable**.
@z
