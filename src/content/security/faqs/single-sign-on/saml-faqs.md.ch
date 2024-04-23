%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Single Sign-on SAML FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, SAML
title: SAML
tags: [FAQ]
aliases:
- /single-sign-on/saml-faqs/
- /faq/security/single-sign-on/saml-faqs/
---
@y
---
description: Single Sign-on SAML FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, SAML
title: SAML
tags: [FAQ]
aliases:
- /single-sign-on/saml-faqs/
- /faq/security/single-sign-on/saml-faqs/
---
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
### Does the application recognize the NameID/Unique Identifier in the SAMLResponse subject?
@y
### Does the application recognize the NameID/Unique Identifier in the SAMLResponse subject?
@z

@x
The preferred format is your email address, which should also be your Name ID.
@y
The preferred format is your email address, which should also be your Name ID.
@z

@x
### When you enforce SAML SSO, at what stage is the login required for tracking through SAML? At runtime or install time?
@y
### When you enforce SAML SSO, at what stage is the login required for tracking through SAML? At runtime or install time?
@z

@x
At runtime for Docker Desktop if it’s configured to require authentication to the organization.
@y
At runtime for Docker Desktop if it’s configured to require authentication to the organization.
@z

@x
### Do you have any information on how to use the Docker Desktop application in accordance with the SSO users we provide? How can we verify that we're handling the licensing correctly?
@y
### Do you have any information on how to use the Docker Desktop application in accordance with the SSO users we provide? How can we verify that we're handling the licensing correctly?
@z

@x
Verify that your users have downloaded the latest version of Docker Desktop. An enhancement in user management observability and capabilities will become available in the future.
@y
Verify that your users have downloaded the latest version of Docker Desktop. An enhancement in user management observability and capabilities will become available in the future.
@z
