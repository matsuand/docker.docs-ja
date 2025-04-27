%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn how to configure single sign-on for your organization or company.
keywords: configure, sso, docker hub, hub, docker admin, admin, security
title: Configure single sign-on
linkTitle: Configure
@y
description: Learn how to configure single sign-on for your organization or company.
keywords: configure, sso, docker hub, hub, docker admin, admin, security
title: Configure single sign-on
linkTitle: Configure
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Get started creating a single sign-on (SSO) connection for your organization or company. This guide walks through the steps to add and verify the domains your members use to sign in to Docker.
@y
Get started creating a single sign-on (SSO) connection for your organization or company. This guide walks through the steps to add and verify the domains your members use to sign in to Docker.
@z

@x
## Step one: Add your domain
@y
## Step one: Add your domain
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
1. Sign in to the [Admin Console](https://admin.docker.com/).
2. Select your organization or company from the **Choose profile** page. Note that when an organization is part of a company, you must select the company and configure the domain for the organization at the company level.
3. Under **Security and access**, select **Domain management**.
4. Select **Add a domain**.
5. Enter your domain in the text box and select **Add domain**.
6. The pop-up modal will prompt you with steps to verify your domain. Copy the **TXT Record Value**.
@y
1. Sign in to the [Admin Console](https://admin.docker.com/).
2. Select your organization or company from the **Choose profile** page. Note that when an organization is part of a company, you must select the company and configure the domain for the organization at the company level.
3. Under **Security and access**, select **Domain management**.
4. Select **Add a domain**.
5. Enter your domain in the text box and select **Add domain**.
6. The pop-up modal will prompt you with steps to verify your domain. Copy the **TXT Record Value**.
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
1. Sign in to [Docker Hub](https://hub.docker.com/).
2. Select **My Hub** and then your organization from the list.
3. On your organization page, select **Settings** and then **Security**.
4. Select **Add a domain**.
5. Enter your domain in the text box and select **Add domain**.
6. The pop-up modal will prompt you with steps to verify your domain. Copy the **TXT Record Value**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com/).
2. Select **My Hub** and then your organization from the list.
3. On your organization page, select **Settings** and then **Security**.
4. Select **Add a domain**.
5. Enter your domain in the text box and select **Add domain**.
6. The pop-up modal will prompt you with steps to verify your domain. Copy the **TXT Record Value**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step two: Verify your domain
@y
## Step two: Verify your domain
@z

@x
Verifying your domain ensures Docker knows you own it. To verify, you add a TXT record to your Domain Name System (DNS) host using the value Docker provides. The TXT Record Value proves ownership, which signals the DNS to add this record. It can take up to 72 hours for DNS to recognize the change. When the change is reflected in DNS, Docker automatically checks the record to confirm your ownership.
@y
Verifying your domain ensures Docker knows you own it. To verify, you add a TXT record to your Domain Name System (DNS) host using the value Docker provides. The TXT Record Value proves ownership, which signals the DNS to add this record. It can take up to 72 hours for DNS to recognize the change. When the change is reflected in DNS, Docker automatically checks the record to confirm your ownership.
@z

@x
Use the **TXT Record Value** provided by Docker and follow the steps based on your DNS host. If your provider isn't listed, use the instructions for other providers.
@y
Use the **TXT Record Value** provided by Docker and follow the steps based on your DNS host. If your provider isn't listed, use the instructions for other providers.
@z

@x
> [!TIP]
>
> The record name field controls where the TXT record is applied in your domain, for example root or subdomain. In general, refer to the following tips for adding a record name:
>
> - Use `@` or leave the record name empty for root domains like `example.com`, depending on your provider.
> - Don't enter values like `docker`, `docker-verification`, `www`, or your domain name. These values may direct to the wrong place.
>
> Check your DNS provider's documentation to verify record name requirements.
@y
> [!TIP]
>
> The record name field controls where the TXT record is applied in your domain, for example root or subdomain. In general, refer to the following tips for adding a record name:
>
> - Use `@` or leave the record name empty for root domains like `example.com`, depending on your provider.
> - Don't enter values like `docker`, `docker-verification`, `www`, or your domain name. These values may direct to the wrong place.
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
2. TXT record verification can take 72 hours. Once you have waited for TXT record verification, return to the **Domain management** page of the [Admin Console](https://app.docker.com/admin) and select **Verify** next to your domain name.
@y
1. To add your TXT record to AWS, see [Creating records by using the Amazon Route 53 console](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-creating.html).
2. TXT record verification can take 72 hours. Once you have waited for TXT record verification, return to the **Domain management** page of the [Admin Console](https://app.docker.com/admin) and select **Verify** next to your domain name.
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
2. TXT record verification can take 72 hours. Once you have waited for TXT record verification, return to the **Domain management** page of the [Admin Console](https://app.docker.com/admin) and select **Verify** next to your domain name.
@y
1. To add your TXT record to Google Cloud DNS, see [Verifying your domain with a TXT record](https://cloud.google.com/identity/docs/verify-domain-txt).
2. TXT record verification can take 72 hours. Once you have waited for TXT record verification, return to the **Domain management** page of the [Admin Console](https://app.docker.com/admin) and select **Verify** next to your domain name.
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
2. TXT record verification can take 72 hours. Once you have waited for TXT record verification, return to the **Domain management** page of the [Admin Console](https://app.docker.com/admin) and select **Verify** next to your domain name.
@y
1. To add your TXT record to GoDaddy, see [Add a TXT record](https://www.godaddy.com/help/add-a-txt-record-19232).
2. TXT record verification can take 72 hours. Once you have waited for TXT record verification, return to the **Domain management** page of the [Admin Console](https://app.docker.com/admin) and select **Verify** next to your domain name.
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
3. TXT record verification can take 72 hours. Once you have waited for TXT record verification, return to the **Domain management** page of the [Admin Console](https://app.docker.com/admin) and select **Verify** next to your domain name.
@y
1. Sign in to your domain host.
2. Add a TXT record to your DNS settings and save the record.
3. TXT record verification can take 72 hours. Once you have waited for TXT record verification, return to the **Domain management** page of the [Admin Console](https://app.docker.com/admin) and select **Verify** next to your domain name.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Once you have added and verified your domain, you are ready to create an SSO connection between Docker and your identity provider (IdP).
@y
Once you have added and verified your domain, you are ready to create an SSO connection between Docker and your identity provider (IdP).
@z

@x
## More resources
@y
## More resources
@z

@x
The following videos walk through verifying your domain to create your SSO connection in Docker.
@y
The following videos walk through verifying your domain to create your SSO connection in Docker.
@z

@x
- [Video: Verify your domain for SSO with Okta](https://youtu.be/c56YECO4YP4?feature=shared&t=529)
- [Video: Verify your domain for SSO with Azure AD (OIDC)](https://youtu.be/bGquA8qR9jU?feature=shared&t=496)
@y
- [Video: Verify your domain for SSO with Okta](https://youtu.be/c56YECO4YP4?feature=shared&t=529)
- [Video: Verify your domain for SSO with Azure AD (OIDC)](https://youtu.be/bGquA8qR9jU?feature=shared&t=496)
@z

@x
## What's next?
@y
## What's next?
@z

@x
[Connect Docker and your IdP](../single-sign-on/connect.md).
@y
[Connect Docker and your IdP](../single-sign-on/connect.md).
@z
