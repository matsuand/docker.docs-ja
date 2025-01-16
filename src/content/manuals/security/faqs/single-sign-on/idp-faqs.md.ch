%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Single sign-on IdP FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, IdP
title: FAQs on SSO and identity providers
tags: [FAQ]
@y
description: Single sign-on IdP FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, IdP
title: FAQs on SSO and identity providers
tags: [FAQ]
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
Yes. You must delete your existing IdP configuration in your Docker SSO connection and then [configure SSO using your new IdP](/manuals/security/for-admins/single-sign-on/connect.md). If you had already turned on enforcement, you should turn off enforcement before updating the provider SSO connection.
@y
Yes. You must delete your existing IdP configuration in your Docker SSO connection and then [configure SSO using your new IdP](manuals/security/for-admins/single-sign-on/connect.md). If you had already turned on enforcement, you should turn off enforcement before updating the provider SSO connection.
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
If your existing certificate has expired, you may need to contact your identity provider to retrieve a new X.509 certificate. Then, you need to update the certificate in the [SSO configuration settings](/security/for-admins/single-sign-on/manage/#manage-sso-connections) in Docker Hub or Docker Admin Console.
@y
If your existing certificate has expired, you may need to contact your identity provider to retrieve a new X.509 certificate. Then, you need to update the certificate in the [SSO configuration settings](__SUBDIR__/security/for-admins/single-sign-on/manage/#manage-sso-connections) in Docker Hub or Docker Admin Console.
@z

@x
### What happens if my IdP goes down when SSO is enabled?
@y
### What happens if my IdP goes down when SSO is enabled?
@z

@x
If SSO is enforced, then it is not possible to access Docker Hub when your IdP is down. You can still access Docker Hub images from the CLI using your Personal Access Token.
@y
If SSO is enforced, then it is not possible to access Docker Hub when your IdP is down. You can still access Docker Hub images from the CLI using your Personal Access Token.
@z

@x
If SSO is enabled but not enforced, then users could fallback to authenticate with username/password and trigger a reset password flow (if necessary).
@y
If SSO is enabled but not enforced, then users could fallback to authenticate with username/password and trigger a reset password flow (if necessary).
@z

@x
### How do I handle accounts using Docker Hub as a secondary registry? Do I need a bot account?
@y
### How do I handle accounts using Docker Hub as a secondary registry? Do I need a bot account?
@z

@x
You can add a bot account to your IdP and create an access token for it to replace the other credentials.
@y
You can add a bot account to your IdP and create an access token for it to replace the other credentials.
@z

@x
### Does a bot account need a seat to access an organization using SSO?
@y
### Does a bot account need a seat to access an organization using SSO?
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
The SSO implementation uses Just-in-Time (JIT) provisioning by default. You can optionally disable JIT in the Admin Console if you enable auto-provisioning using SCIM. See [Just-in-Time provisioning](/security/for-admins/provisioning/just-in-time/).
@y
The SSO implementation uses Just-in-Time (JIT) provisioning by default. You can optionally disable JIT in the Admin Console if you enable auto-provisioning using SCIM. See [Just-in-Time provisioning](__SUBDIR__/security/for-admins/provisioning/just-in-time/).
@z

@x
### Is IdP-initiated sign-in available?
@y
### Is IdP-initiated sign-in available?
@z

@x
Docker SSO doesn't support IdP-initiated sign-in, only Service Provider Initiated (SP-initiated) sign-in.
@y
Docker SSO doesn't support IdP-initiated sign-in, only Service Provider Initiated (SP-initiated) sign-in.
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
### My SSO connection with Entra ID isn't working and I receive an error that the application is misconfigured. How can I troubleshoot this?
@y
### My SSO connection with Entra ID isn't working and I receive an error that the application is misconfigured. How can I troubleshoot this?
@z

@x
Confirm that you've configured the necessary API permissions in Entra ID (formerly Azure AD) for your SSO connection. You need to grant admin consent within your Entra ID (formerly Azure AD) tenant. See [Entra ID (formerly Azure AD) documentation](https://learn.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent?pivots=portal#grant-admin-consent-in-app-registrations).
@y
Confirm that you've configured the necessary API permissions in Entra ID (formerly Azure AD) for your SSO connection. You need to grant admin consent within your Entra ID (formerly Azure AD) tenant. See [Entra ID (formerly Azure AD) documentation](https://learn.microsoft.com/en-us/azure/active-directory/manage-apps/grant-admin-consent?pivots=portal#grant-admin-consent-in-app-registrations).
@z
