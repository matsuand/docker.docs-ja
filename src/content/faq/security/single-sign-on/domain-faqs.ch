%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Single Sign-on FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on
title: Domains
aliases:
- /single-sign-on/domain-faqs/
---
@y
---
description: Single Sign-on FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on
title: Domains
aliases:
- /single-sign-on/domain-faqs/
---
@z

@x
### Can I add sub-domains?
@y
### Can I add sub-domains?
@z

@x
Yes, you can add sub-domains to your SSO , however all email addresses should also be on that domain. Verify that your DNS provider supports multiple txt fields for the same domain.
@y
Yes, you can add sub-domains to your SSO , however all email addresses should also be on that domain. Verify that your DNS provider supports multiple txt fields for the same domain.
@z

@x
### Can the DNS provider configure it once for one-time verification and remove it later OR will it be needed permanently?
@y
### Can the DNS provider configure it once for one-time verification and remove it later OR will it be needed permanently?
@z

@x
They can do it one time to add it to a connection. If they ever change IdPs and have to set up SSO again, they will need to verify again.
@y
They can do it one time to add it to a connection. If they ever change IdPs and have to set up SSO again, they will need to verify again.
@z

@x
### Is adding domain required to configure SSO? What domains should I be adding? And how do I add it?
@y
### Is adding domain required to configure SSO? What domains should I be adding? And how do I add it?
@z

@x
Adding and verifying a domain is required to enable and enforce SSO. Select **Add Domain** and specify the email domains that's allowed to authenticate through your server. This should include all email domains users will use to access Docker. Public domains are not permitted, such as gmail.com, outlook.com, etc. Also, the email domain should be set as the primary email.
@y
Adding and verifying a domain is required to enable and enforce SSO. Select **Add Domain** and specify the email domains that's allowed to authenticate through your server. This should include all email domains users will use to access Docker. Public domains are not permitted, such as gmail.com, outlook.com, etc. Also, the email domain should be set as the primary email.
@z

@x
### If users are using their personal email, do they have to convert to using the Org’s domain before they can be invited to join an Org? Is this just a quick change in their Hub account?
@y
### If users are using their personal email, do they have to convert to using the Org’s domain before they can be invited to join an Org? Is this just a quick change in their Hub account?
@z

@x
No, they don't. Though they can add multiple emails to a Docker ID if they choose to. However, that email can only be used once across Docker. The other thing to note is that (as of January 2022) SSO will not work for multi domains as an MVP and it will not work for personal emails either.
@y
No, they don't. Though they can add multiple emails to a Docker ID if they choose to. However, that email can only be used once across Docker. The other thing to note is that (as of January 2022) SSO will not work for multi domains as an MVP and it will not work for personal emails either.
@z

@x
### Since Docker ID is tracked from SAML, at what point is the login required to be tracked from SAML? Runtime or install time?
@y
### Since Docker ID is tracked from SAML, at what point is the login required to be tracked from SAML? Runtime or install time?
@z

@x
Runtime for Docker Desktop if they configure Docker Desktop to require authentication to their org.
@y
Runtime for Docker Desktop if they configure Docker Desktop to require authentication to their org.
@z

@x
### Do you support IdP-initiated authentication (e.g., Okta tile support)?
@y
### Do you support IdP-initiated authentication (e.g., Okta tile support)?
@z

@x
We don't support IdP-initiated authentication. Users must initiate login through Docker Desktop or Hub.
@y
We don't support IdP-initiated authentication. Users must initiate login through Docker Desktop or Hub.
@z
