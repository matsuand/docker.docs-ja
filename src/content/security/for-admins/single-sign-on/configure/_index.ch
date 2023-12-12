%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to configure Single Sign-On for your organization or company.
keywords: configure, sso, docker hub, hub, docker admin, admin, security 
title: Configure Single Sign-On
aliases:
- /docker-hub/domains/
- /docker-hub/sso-connection/
- /docker-hub/enforcing-sso/
- /single-sign-on/configure/
- /admin/company/settings/sso-configuration/
- /admin/organization/security-settings/sso-configuration/
---
@y
---
description: Learn how to configure Single Sign-On for your organization or company.
keywords: configure, sso, docker hub, hub, docker admin, admin, security 
title: Configure Single Sign-On
aliases:
- /docker-hub/domains/
- /docker-hub/sso-connection/
- /docker-hub/enforcing-sso/
- /single-sign-on/configure/
- /admin/company/settings/sso-configuration/
- /admin/organization/security-settings/sso-configuration/
---
@z

@x
Follow the steps on this page to configure SSO for your organization or company.
@y
Follow the steps on this page to configure SSO for your organization or company.
@z

@x
## Step one: Add and verify your domain
@y
## Step one: Add and verify your domain
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-domains product="hub" %}}
@y
{{% admin-domains product="hub" %}}
@z

@x
{{< /tab >}}
{{< tab name="Docker Admin" >}}
@y
{{< /tab >}}
{{< tab name="Docker Admin" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
{{% admin-domains product="admin" %}}
@y
{{% admin-domains product="admin" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step two: Create an SSO connection
@y
## Step two: Create an SSO connection
@z

@x
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-sso-config product="hub" %}}
@y
{{% admin-sso-config product="hub" %}}
@z

@x
{{< /tab >}}
{{< tab name="Docker Admin" >}}
@y
{{< /tab >}}
{{< tab name="Docker Admin" >}}
@z

@x
{{% admin-sso-config product="admin" %}}
@y
{{% admin-sso-config product="admin" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## More resources
@y
## More resources
@z

@x
The following video provides an overview of configuring SSO with SAML in Entra ID (formerly Azure AD).
@y
The following video provides an overview of configuring SSO with SAML in Entra ID (formerly Azure AD).
@z

@x
<iframe title="Configure SSO with SAML in Entra ID overview" class="border-0 w-full aspect-video mb-8" allow="fullscreen" src="https://www.loom.com/embed/0a30409381f340cfb01790adbd9aa9b3?sid=7e4e10a7-7f53-437d-b593-8a4886775632"></iframe>
@y
<iframe title="Configure SSO with SAML in Entra ID overview" class="border-0 w-full aspect-video mb-8" allow="fullscreen" src="https://www.loom.com/embed/0a30409381f340cfb01790adbd9aa9b3?sid=7e4e10a7-7f53-437d-b593-8a4886775632"></iframe>
@z

@x
## What's next?
@y
## What's next?
@z

@x
- [Set up SCIM](../../scim.md)
- [Enable Group mapping](../../group-mapping.md)
- [Manage your SSO connections](../manage/_index.md)
@y
- [Set up SCIM](../../scim.md)
- [Enable Group mapping](../../group-mapping.md)
- [Manage your SSO connections](../manage/_index.md)
@z
