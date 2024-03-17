%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to configure single sign-on for your organization or company.
keywords: configure, sso, docker hub, hub, docker admin, admin, security 
title: Configure single sign-on
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
description: Learn how to configure single sign-on for your organization or company.
keywords: configure, sso, docker hub, hub, docker admin, admin, security 
title: Configure single sign-on
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
Get started creating a single sign-on (SSO) connection for your organization or company.
@y
Get started creating a single sign-on (SSO) connection for your organization or company.
@z

@x
The steps to set up your SSO configuration are:
@y
The steps to set up your SSO configuration are:
@z

@x
1. [Add and verify the domain or domains](#step-one-add-and-verify-your-domain) that your members use to sign in to Docker.
2. [Create your SSO connection](#step-two-create-an-sso-connection-in-docker) in Docker.
3. [Configure your IdP](./configure-idp.md) to work with Docker.
4. [Complete your SSO connection](../connect/_index.md) in Docker.
@y
1. [Add and verify the domain or domains](#step-one-add-and-verify-your-domain) that your members use to sign in to Docker.
2. [Create your SSO connection](#step-two-create-an-sso-connection-in-docker) in Docker.
3. [Configure your IdP](./configure-idp.md) to work with Docker.
4. [Complete your SSO connection](../connect/_index.md) in Docker.
@z

@x
This page walks through steps 1 and 2 using Docker Hub or the Admin Console.
@y
This page walks through steps 1 and 2 using Docker Hub or the Admin Console.
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
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
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
## Step two: Create an SSO connection in Docker
@y
## Step two: Create an SSO connection in Docker
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
{{< tab name="Admin Console" >}}
@y
{{< /tab >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
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
## What's next?
@y
## What's next?
@z

@x
[Continue configuration in your IdP](./configure-idp.md).
@y
[Continue configuration in your IdP](./configure-idp.md).
@z
