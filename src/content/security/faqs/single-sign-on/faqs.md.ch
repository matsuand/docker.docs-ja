%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Single sign-on FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, administration, security
title: General FAQs on SSO
tags: [FAQ]
aliases:
- /single-sign-on/faqs/
- /faq/security/single-sign-on/faqs/
- /single-sign-on/saml-faqs/
- /faq/security/single-sign-on/saml-faqs/
- /security/faqs/single-sign-on/saml-faqs/
---
@y
---
description: Single sign-on FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, administration, security
title: General FAQs on SSO
tags: [FAQ]
aliases:
- /single-sign-on/faqs/
- /faq/security/single-sign-on/faqs/
- /single-sign-on/saml-faqs/
- /faq/security/single-sign-on/saml-faqs/
- /security/faqs/single-sign-on/saml-faqs/
---
@z

@x
### Is Docker SSO available for all paid subscriptions?
@y
### Is Docker SSO available for all paid subscriptions?
@z

@x
Docker single sign-on (SSO) is only available with the Docker Business subscription. [Upgrade your existing subscription](/subscription/core-subscription/upgrade/) to start using Docker SSO.
@y
Docker single sign-on (SSO) is only available with the Docker Business subscription. [Upgrade your existing subscription](/subscription/core-subscription/upgrade/) to start using Docker SSO.
@z

@x
### How does Docker SSO work?
@y
### How does Docker SSO work?
@z

@x
Docker SSO lets users authenticate using their identity providers (IdPs) to access Docker. Docker supports Entra ID (formerly Azure AD) and any SAML 2.0 identity providers. When you enable SSO, this redirects users to your provider’s authentication page to authenticate using their email and password.
@y
Docker SSO lets users authenticate using their identity providers (IdPs) to access Docker. Docker supports Entra ID (formerly Azure AD) and any SAML 2.0 identity providers. When you enable SSO, this redirects users to your provider’s authentication page to authenticate using their email and password.
@z

@x
### What SSO flows does Docker support?
@y
### What SSO flows does Docker support?
@z

@x
Docker supports Service Provider Initiated (SP-initiated) SSO flow. This means users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@y
Docker supports Service Provider Initiated (SP-initiated) SSO flow. This means users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@z

@x
### Where can I find detailed instructions on how to configure Docker SSO?
@y
### Where can I find detailed instructions on how to configure Docker SSO?
@z

@x
You first need to establish an SSO connection with your identity provider, and the company email domain needs to be verified prior to establishing an SSO connection for your users. For detailed step-by-step instructions on how to configure Docker SSO, see [Single Sign-on](../../../security/for-admins/single-sign-on/configure/_index.md).
@y
You first need to establish an SSO connection with your identity provider, and the company email domain needs to be verified prior to establishing an SSO connection for your users. For detailed step-by-step instructions on how to configure Docker SSO, see [Single Sign-on](../../../security/for-admins/single-sign-on/configure/_index.md).
@z

@x
### Does Docker SSO support multi-factor authentication (MFA)?
@y
### Does Docker SSO support multi-factor authentication (MFA)?
@z

@x
When an organization uses SSO, MFA is determined on the IdP level, not on the Docker platform.
@y
When an organization uses SSO, MFA is determined on the IdP level, not on the Docker platform.
@z

@x
### Do I need a specific version of Docker Desktop for SSO?
@y
### Do I need a specific version of Docker Desktop for SSO?
@z

@x
Yes, all users in your organization must upgrade to Docker Desktop version 4.4.2 or later. Users on older versions of Docker Desktop won't be able to sign in after SSO is enforced if the company domain email is used to sign in or as the primary email associated with an existing Docker account. Your users with existing accounts can't sign in with their username and password.
@y
Yes, all users in your organization must upgrade to Docker Desktop version 4.4.2 or later. Users on older versions of Docker Desktop won't be able to sign in after SSO is enforced if the company domain email is used to sign in or as the primary email associated with an existing Docker account. Your users with existing accounts can't sign in with their username and password.
@z

@x
### Can I retain my Docker ID when using SSO?
@y
### Can I retain my Docker ID when using SSO?
@z

@x
For a personal Docker ID, a user is the account owner. A Docker ID is associated with access to the user's repositories, images, assets. A user can choose to have a company domain email on the Docker account. When enforcing SSO, the account is connected to the organization account. When enforcing SSO for an organization(s) or company, any user logging in without an existing account using verified company domain email will automatically have an account provisioned, and a new Docker ID created.
@y
For a personal Docker ID, a user is the account owner. A Docker ID is associated with access to the user's repositories, images, assets. A user can choose to have a company domain email on the Docker account. When enforcing SSO, the account is connected to the organization account. When enforcing SSO for an organization(s) or company, any user logging in without an existing account using verified company domain email will automatically have an account provisioned, and a new Docker ID created.
@z

@x
### Does SAML authentication require additional attributes?
@y
### Does SAML authentication require additional attributes?
@z

@x
You must provide an email address as an attribute to authenticate through SAML. The ‘Name’ attribute is optional.
@y
You must provide an email address as an attribute to authenticate through SAML. The ‘Name’ attribute is optional.
@z

@x
### Does the application recognize the NameID/Unique Identifier in the `SAMLResponse` subject?
@y
### Does the application recognize the NameID/Unique Identifier in the `SAMLResponse` subject?
@z

@x
The preferred format is your email address, which should also be your Name ID.
@y
The preferred format is your email address, which should also be your Name ID.
@z
