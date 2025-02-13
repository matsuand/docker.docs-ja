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
## Manage organizations
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
> [!IMPORTANT]
>
> SSO has Just-In-Time (JIT) Provisioning enabled by default unless you have [disabled it](/security/for-admins/provisioning/just-in-time/#sso-authentication-with-jit-provisioning-disabled). This means your users are auto-provisioned to your organization.
>
> You can change this on a per-app basis. To prevent auto-provisioning users, you can create a security group in your IdP and configure the SSO app to authenticate and authorize only those users that are in the security group. Follow the instructions provided by your IdP:
>
> - [Okta](https://help.okta.com/en-us/Content/Topics/Security/policies/configure-app-signon-policies.htm)
> - [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-restrict-your-app-to-a-set-of-users)
>
> Alternatively, see the [Provisioning overview](/manuals/security/for-admins/provisioning/_index.md) guide.
@y
> [!IMPORTANT]
>
> SSO has Just-In-Time (JIT) Provisioning enabled by default unless you have [disabled it](__SUBDIR__/security/for-admins/provisioning/just-in-time/#sso-authentication-with-jit-provisioning-disabled). This means your users are auto-provisioned to your organization.
>
> You can change this on a per-app basis. To prevent auto-provisioning users, you can create a security group in your IdP and configure the SSO app to authenticate and authorize only those users that are in the security group. Follow the instructions provided by your IdP:
>
> - [Okta](https://help.okta.com/en-us/Content/Topics/Security/policies/configure-app-signon-policies.htm)
> - [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-restrict-your-app-to-a-set-of-users)
>
> Alternatively, see the [Provisioning overview](manuals/security/for-admins/provisioning/_index.md) guide.
@z

@x
### Add guest users when SSO is enabled
@y
### Add guest users when SSO is enabled
@z

@x
To add a guest that isn't verified through your IdP:
@y
To add a guest that isn't verified through your IdP:
@z

@x
1. Sign in to the [Admin Console](https://app.docker.com/admin).
2. Select your organization or company from the **Choose profile** page, then select **Members**.
3. Select **Invite**.
4. Follow the on-screen instructions to invite the user.
@y
1. Sign in to the [Admin Console](https://app.docker.com/admin).
2. Select your organization or company from the **Choose profile** page, then select **Members**.
3. Select **Invite**.
4. Follow the on-screen instructions to invite the user.
@z

@x
### Remove users from the SSO company
@y
### Remove users from the SSO company
@z

@x
To remove a user:
@y
To remove a user:
@z

@x
1. Sign in to [Admin Console](https://app.docker.com/admin).
2. Select your organization or company from the **Choose profile** page, then select **Members**.
3. Select the action icon next to a user’s name, and then select **Remove member**, if you're an organization, or **Remove user**, if you're a company.
4. Follow the on-screen instructions to remove the user.
@y
1. Sign in to [Admin Console](https://app.docker.com/admin).
2. Select your organization or company from the **Choose profile** page, then select **Members**.
3. Select the action icon next to a user’s name, and then select **Remove member**, if you're an organization, or **Remove user**, if you're a company.
4. Follow the on-screen instructions to remove the user.
@z

@x
## Manage provisioning
@y
## Manage provisioning
@z

@x
Users are provisioned with Just-in-Time (JIT) provisioning by default. If you enable SCIM, you can disable JIT. For more information, see the [Provisioning overview](/manuals/security/for-admins/provisioning/_index.md) guide.
@y
Users are provisioned with Just-in-Time (JIT) provisioning by default. If you enable SCIM, you can disable JIT. For more information, see the [Provisioning overview](manuals/security/for-admins/provisioning/_index.md) guide.
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
