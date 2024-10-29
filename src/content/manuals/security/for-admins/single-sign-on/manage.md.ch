%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn how to manage Single Sign-On for your organization or company.
keywords: manage, single sign-on, SSO, sign-on, docker hub, admin console, admin, security
title: Manage single sign-on
linkTitle: Manage
@y
description: Learn how to manage Single Sign-On for your organization or company.
keywords: manage, single sign-on, SSO, sign-on, docker hub, admin console, admin, security
title: Manage single sign-on
linkTitle: Manage
@z

@x
## Manage organizations
@y
## 組織の管理 {#manage-organizations}
@z

@x
> [!NOTE]
>
> You must have a [company](/admin/company/) to manage more than one organization.
@y
> [!NOTE]
>
> You must have a [company](__SUBDIR__/admin/company/) to manage more than one organization.
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
{{% admin-sso-management-orgs product="admin" %}}
@y
{{% admin-sso-management-orgs product="admin" %}}
@z

@x
## Manage domains
@y
## Manage domains
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
{{% admin-sso-management product="admin" %}}
@y
{{% admin-sso-management product="admin" %}}
@z

@x
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@y
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-sso-management product="hub" %}}
@y
{{% admin-sso-management product="hub" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Manage SSO connections
@y
## Manage SSO connections
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
{{% admin-sso-management-connections product="admin" %}}
@y
{{% admin-sso-management-connections product="admin" %}}
@z

@x
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@y
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-sso-management-connections product="hub" %}}
@y
{{% admin-sso-management-connections product="hub" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Manage users
@y
## Manage users
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
{{% admin-sso-management-users product="admin" %}}
@y
{{% admin-sso-management-users product="admin" %}}
@z

@x
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@y
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-sso-management-users product="hub" %}}
@y
{{% admin-sso-management-users product="hub" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Manage provisioning
@y
## Manage provisioning
@z

@x
Users are provisioned with Just-in-Time (JIT) provisioning by default. If you enable SCIM, you can disable JIT. For more information, see the [Provisioning overview](/manuals/security/for-admins/provisioning/_index.md) [Just-in-Time](/manuals/security/for-admins/provisioning/just-in-time.md) guides.
@y
Users are provisioned with Just-in-Time (JIT) provisioning by default. If you enable SCIM, you can disable JIT. For more information, see the [Provisioning overview](manuals/security/for-admins/provisioning/_index.md) [Just-in-Time](manuals/security/for-admins/provisioning/just-in-time.md) guides.
@z

@x
## What's next?
@y
## What's next?
@z

@x
- [Set up SCIM](../provisioning/scim.md)
- [Enable Group mapping](../provisioning/group-mapping.md)
@y
- [Set up SCIM](../provisioning/scim.md)
- [Enable Group mapping](../provisioning/group-mapping.md)
@z
