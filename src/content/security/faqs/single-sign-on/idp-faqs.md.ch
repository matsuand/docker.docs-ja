%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Single Sign-on IdP FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, IdP
title: Identity providers
tags: [FAQ]
aliases:
- /single-sign-on/idp-faqs/
- /faq/security/single-sign-on/idp-faqs/
---
@y
---
description: Single Sign-on IdP FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, IdP
title: Identity providers
tags: [FAQ]
aliases:
- /single-sign-on/idp-faqs/
- /faq/security/single-sign-on/idp-faqs/
---
@z

@x
### Is it possible to use more than one IdP with Docker SSO?
@y
### Is it possible to use more than one IdP with Docker SSO?
@z

@x
No. You can only configure Docker SSO to work with a single IdP. A domain can only be associated with a single IdP. Docker supports Entra ID (formerly Azure AD) and identity providers that support SAML 2.0.
@y
No. You can only configure Docker SSO to work with a single IdP. A domain can only be associated with a single IdP. Docker supports Entra ID (formerly Azure AD) and identity providers that support SAML 2.0.
@z

@x
### Is it possible to change my identity provider after configuring SSO?
@y
### Is it possible to change my identity provider after configuring SSO?
@z

@x
Yes. You must delete your existing IdP configuration in Docker Hub and follow the instructions to Configure SSO using your IdP. If you had already turned on enforcement, you should turn off enforcement before updating the provider SSO connection.
@y
Yes. You must delete your existing IdP configuration in Docker Hub and follow the instructions to Configure SSO using your IdP. If you had already turned on enforcement, you should turn off enforcement before updating the provider SSO connection.
@z

@x
### What information do I need from my identity provider to configure SSO?
@y
### What information do I need from my identity provider to configure SSO?
@z

@x
To enable SSO in Docker, you need the following from your IdP:
@y
To enable SSO in Docker, you need the following from your IdP:
@z

@x
* **SAML**: Entity ID, ACS URL, Single Logout URL and the public X.509 certificate
@y
* **SAML**: Entity ID, ACS URL, Single Logout URL and the public X.509 certificate
@z

@x
* **Entra ID (formerly Azure AD)**: Client ID, Client Secret, AD Domain.
@y
* **Entra ID (formerly Azure AD)**: Client ID, Client Secret, AD Domain.
@z

@x
### What happens if my existing certificate expires?
@y
### What happens if my existing certificate expires?
@z

@x
If your existing certificate has expired, you may need to contact your identity provider to retrieve a new x509 certificate. Then, you need to update the certificate in the SSO configuration settings page on Docker Hub.
@y
If your existing certificate has expired, you may need to contact your identity provider to retrieve a new x509 certificate. Then, you need to update the certificate in the SSO configuration settings page on Docker Hub.
@z

@x
### What happens if my IdP goes down when SSO is enabled?
@y
### What happens if my IdP goes down when SSO is enabled?
@z

@x
It's not possible to access Docker Hub when your IdP is down. However, you can access Docker Hub images from the CLI using your Personal Access Token. Or, if you had an existing account before the SSO enforcement, you can use your username and password to access Docker Hub images during the grace period for your organization.
@y
It's not possible to access Docker Hub when your IdP is down. However, you can access Docker Hub images from the CLI using your Personal Access Token. Or, if you had an existing account before the SSO enforcement, you can use your username and password to access Docker Hub images during the grace period for your organization.
@z

@x
### What happens when I turn off SSO for my organization(s) or company?
@y
### What happens when I turn off SSO for my organization(s) or company?
@z

@x
When you turn off SSO, authentication through your Identity Provider isn't required to access Docker. Users may continue to sign in through Single Sign-on as well as Docker ID and password.
@y
When you turn off SSO, authentication through your Identity Provider isn't required to access Docker. Users may continue to sign in through Single Sign-on as well as Docker ID and password.
@z

@x
### How do I handle accounts using Docker Hub as a secondary registry? Do I need a bot account?
@y
### How do I handle accounts using Docker Hub as a secondary registry? Do I need a bot account?
@z

@x
You can add a bot account to your IDP and create an access token for it to replace the other credentials.
@y
You can add a bot account to your IDP and create an access token for it to replace the other credentials.
@z

@x
### Build agents - For customers using SSO, do they need to create a bot account to fill a seat within the dockerorg?
@y
### Build agents - For customers using SSO, do they need to create a bot account to fill a seat within the dockerorg?
@z

@x
Yes, bot accounts need a seat, similar to a regular end user, having a non-aliased domain email enabled in the IdP and using a seat in Hub.
@y
Yes, bot accounts need a seat, similar to a regular end user, having a non-aliased domain email enabled in the IdP and using a seat in Hub.
@z

@x
### Does SAML SSO use Just-in-Time provisioning?
@y
### Does SAML SSO use Just-in-Time provisioning?
@z

@x
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning configuration is available in [beta](/release-lifecycle/#beta) when you use the Admin Console and enable SCIM. Otherwise, JIT is enabled by default.
{ .experimental }
@y
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning configuration is available in [beta](/release-lifecycle/#beta) when you use the Admin Console and enable SCIM. Otherwise, JIT is enabled by default.
{ .experimental }
@z

@x
The SSO implementation uses Just-in-Time (JIT) provisioning by default. You can optionally disable JIT if you prefer not to auto-provision users, or if you opt for auto-provisioning using SCIM.
@y
The SSO implementation uses Just-in-Time (JIT) provisioning by default. You can optionally disable JIT if you prefer not to auto-provision users, or if you opt for auto-provisioning using SCIM.
@z

@x
### Will there be IdP-initiated logins?
@y
### Will there be IdP-initiated logins?
@z

@x
We currently don't have any plans to enable IdP-initiated logins.
@y
We currently don't have any plans to enable IdP-initiated logins.
@z

@x
### Is it possible to connect Docker Hub directly with a Microsoft Entra (formerly Azure AD) group?
@y
### Is it possible to connect Docker Hub directly with a Microsoft Entra (formerly Azure AD) group?
@z

@x
Yes, Entra ID (formerly Azure AD) is supported with SSO for Docker Business, both through a direct integration and through SAML.
@y
Yes, Entra ID (formerly Azure AD) is supported with SSO for Docker Business, both through a direct integration and through SAML.
@z

@x
### My SSO connection with Entra ID (formerly Azure AD) isn't working and I receive an error that the application is misconfigured. How can I troubleshoot this?
@y
### My SSO connection with Entra ID (formerly Azure AD) isn't working and I receive an error that the application is misconfigured. How can I troubleshoot this?
@z

@x
Confirm that you've configured the necessary API permissions in Entra ID (formerly Azure AD) for your SSO connection. You need to grant admin consent within your Entra ID (formerly Azure AD) tenant. See [Entra ID (formerly Azure AD) documentation](https://learn.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent?pivots=portal#grant-admin-consent-in-app-registrations).
@y
Confirm that you've configured the necessary API permissions in Entra ID (formerly Azure AD) for your SSO connection. You need to grant admin consent within your Entra ID (formerly Azure AD) tenant. See [Entra ID (formerly Azure AD) documentation](https://learn.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent?pivots=portal#grant-admin-consent-in-app-registrations).
@z
