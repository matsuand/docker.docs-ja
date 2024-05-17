%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn how to complete your single-sign on connection and next steps for enabling SSO.
keywords: configure, sso, docker hub, hub, docker admin, admin, security
title: Complete your single sign-on connection
@y
description: Learn how to complete your single-sign on connection and next steps for enabling SSO.
keywords: configure, sso, docker hub, hub, docker admin, admin, security
title: Complete your single sign-on connection
@z

@x
The steps to set up your SSO configuration are:
@y
The steps to set up your SSO configuration are:
@z

@x
1. [Add and verify the domain or domains](/security/for-admins/single-sign-on/configure#step-one-add-and-verify-your-domain) that your members use to sign in to Docker.
2. [Create your SSO connection](/security/for-admins/single-sign-on/configure#step-two-create-an-sso-connection-in-docker) in Docker.
3. [Configure your IdP](/security/for-admins/single-sign-on/configure/configure-idp#step-three-configure-your-idp-to-work-with-docker) to work with Docker.
4. [Complete your SSO connection](#step-four-complete-your-sso-connection) in Docker.
@y
1. [Add and verify the domain or domains](__SUBDIR__/security/for-admins/single-sign-on/configure#step-one-add-and-verify-your-domain) that your members use to sign in to Docker.
2. [Create your SSO connection](__SUBDIR__/security/for-admins/single-sign-on/configure#step-two-create-an-sso-connection-in-docker) in Docker.
3. [Configure your IdP](__SUBDIR__/security/for-admins/single-sign-on/configure/configure-idp#step-three-configure-your-idp-to-work-with-docker) to work with Docker.
4. [Complete your SSO connection](#step-four-complete-your-sso-connection) in Docker.
@z

@x
This page walks you through the final steps of creating your SSO connection. You can then test your connection and optionally enforce SSO for your organization.
@y
This page walks you through the final steps of creating your SSO connection. You can then test your connection and optionally enforce SSO for your organization.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Make sure you have completed the following before you begin:
@y
Make sure you have completed the following before you begin:
@z

@x
- Your domain is verified
- You have created your SSO connection in Docker
- You configured your IdP using the appropriate values from your Docker connection
- You have pasted the following from your IdP into the settings in the Docker console:
    - SAML: **SAML Sign-on URL**, **x509 Certificate**
    - Azure AD (OIDC): **Client ID**, **Client Secret**, **Azure AD Domain**
@y
- Your domain is verified
- You have created your SSO connection in Docker
- You configured your IdP using the appropriate values from your Docker connection
- You have pasted the following from your IdP into the settings in the Docker console:
    - SAML: **SAML Sign-on URL**, **x509 Certificate**
    - Azure AD (OIDC): **Client ID**, **Client Secret**, **Azure AD Domain**
@z

@x
## Step four: Complete your SSO connection
@y
## Step four: Complete your SSO connection
@z

@x
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning is available in [beta](/release-lifecycle/#beta) when you use the Admin Console and enable SCIM. With this feature, you have the option to disable JIT provisioning. See [SSO authentication with JIT provisioning disabled](/security/for-admins/group-mapping/#sso-authentication-with-jit-provisioning-disabled).
{ .experimental }
@y
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning is available in [beta](__SUBDIR__/release-lifecycle/#beta) when you use the Admin Console and enable SCIM. With this feature, you have the option to disable JIT provisioning. See [SSO authentication with JIT provisioning disabled](__SUBDIR__/security/for-admins/group-mapping/#sso-authentication-with-jit-provisioning-disabled).
{ .experimental }
@z

@x
{{< tabs >}}
{{< tab name="Admin Console" >}}
@y
{{< tabs >}}
{{< tab name="Admin Console" >}}
@z

@x
{{% admin-sso-connect product="admin" %}}
@y
{{% admin-sso-connect product="admin" %}}
@z

@x
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@y
{{< /tab >}}
{{< tab name="Docker Hub" >}}
@z

@x
{{% admin-sso-connect product="hub" %}}
@y
{{% admin-sso-connect product="hub" %}}
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## What's next
@y
## What's next
@z

@x
Learn how you can [manage your SSO connection](../manage/_index.md), domain, and users for your organization or company.
@y
Learn how you can [manage your SSO connection](../manage/_index.md), domain, and users for your organization or company.
@z
