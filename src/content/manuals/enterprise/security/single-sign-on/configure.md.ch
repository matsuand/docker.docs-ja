%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Configure single sign-on
linkTitle: Configure
description: Learn how to configure single sign-on for your organization or company.
keywords: configure, sso, docker hub, hub, docker admin, admin, security
@y
title: Configure single sign-on
linkTitle: Configure
description: Learn how to configure single sign-on for your organization or company.
keywords: configure, sso, docker hub, hub, docker admin, admin, security
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Learn how to set up single sign-on (SSO) for your Docker organization by adding
and verifying the domains your members use to sign in.
@y
Learn how to set up single sign-on (SSO) for your Docker organization by adding
and verifying the domains your members use to sign in.
@z

@x
## Step one: Add a domain
@y
## Step one: Add a domain
@z

@x
> [!NOTE]
>
> Docker supports multiple identity provider (IdP) configurations. You can
associate one domain with more than one IdP.
@y
> [!NOTE]
>
> Docker supports multiple identity provider (IdP) configurations. You can
associate one domain with more than one IdP.
@z

@x
To add a domain:
@y
To add a domain:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and choose your
organization. If it's part of a company, select the company first to manage
the domain at that level.
1. Select **Admin Console**, then **Domain management**.
1. Select **Add a domain**.
1. Enter your domain in the text box and select **Add domain**.
1. In the modal, copy the **TXT Record Value** provided for domain verification.
@y
1. Sign in to [Docker Home](https://app.docker.com) and choose your
organization. If it's part of a company, select the company first to manage
the domain at that level.
1. Select **Admin Console**, then **Domain management**.
1. Select **Add a domain**.
1. Enter your domain in the text box and select **Add domain**.
1. In the modal, copy the **TXT Record Value** provided for domain verification.
@z

@x
## Step two: Verify your domain
@y
## Step two: Verify your domain
@z

@x
To confirm domain ownership, add a TXT record to your Domain Name System (DNS)
host using the TXT Record Value from Docker. DNS propagation can take up to
72 hours. Docker automatically checks for the record during this time.
@y
To confirm domain ownership, add a TXT record to your Domain Name System (DNS)
host using the TXT Record Value from Docker. DNS propagation can take up to
72 hours. Docker automatically checks for the record during this time.
@z

@x
> [!TIP]
>
> When adding a record name, **use `@` or leave it empty** for root domains like `example.com`. **Avoid common values** like `docker`, `docker-verification`, `www`, or your domain name itself. Always **check your DNS provider's documentation** to verify their specific record name requirements.
@y
> [!TIP]
>
> When adding a record name, **use `@` or leave it empty** for root domains like `example.com`. **Avoid common values** like `docker`, `docker-verification`, `www`, or your domain name itself. Always **check your DNS provider's documentation** to verify their specific record name requirements.
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
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@y
1. To add your TXT record to AWS, see [Creating records by using the Amazon Route 53 console](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-creating.html).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
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
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@y
1. To add your TXT record to Google Cloud DNS, see [Verifying your domain with a TXT record](https://cloud.google.com/identity/docs/verify-domain-txt).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
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
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@y
1. To add your TXT record to GoDaddy, see [Add a TXT record](https://www.godaddy.com/help/add-a-txt-record-19232).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
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
1. Add a TXT record to your DNS settings and save the record.
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@y
1. Sign in to your domain host.
1. Add a TXT record to your DNS settings and save the record.
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Connect Docker and your IdP](connect.md).
- [Troubleshoot](/manuals/enterprise/troubleshoot/troubleshoot-sso.md) SSO issues.
@y
- [Connect Docker and your IdP](connect.md).
- [Troubleshoot](manuals/enterprise/troubleshoot/troubleshoot-sso.md) SSO issues.
@z
