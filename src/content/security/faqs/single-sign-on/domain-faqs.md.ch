%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Single sign-on domain FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, domains, domain verification, domain management
title: Domains
tags: [FAQ]
aliases:
- /single-sign-on/domain-faqs/
- /faq/security/single-sign-on/domain-faqs/
---
@y
---
description: Single sign-on domain FAQs
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, domains, domain verification, domain management
title: Domains
tags: [FAQ]
aliases:
- /single-sign-on/domain-faqs/
- /faq/security/single-sign-on/domain-faqs/
---
@z

@x
### Can I add sub-domains?
@y
### Can I add sub-domains?
@z

@x
Yes, you can add sub-domains to your SSO connection, however all email addresses should also be on that domain. Verify that your DNS provider supports multiple TXT records for the same domain.
@y
Yes, you can add sub-domains to your SSO connection, however all email addresses should also be on that domain. Verify that your DNS provider supports multiple TXT records for the same domain.
@z

@x
### Can the DNS provider configure it once for one-time verification and remove it later or will it be needed permanently?
@y
### Can the DNS provider configure it once for one-time verification and remove it later or will it be needed permanently?
@z

@x
You can do it one time to add the domain to a connection. If your organization ever changes IdPs and has to set up SSO again, your DNS provider will need to verify again.
@y
You can do it one time to add the domain to a connection. If your organization ever changes IdPs and has to set up SSO again, your DNS provider will need to verify again.
@z

@x
### Is adding domain required to configure SSO? What domains should I be adding? And how do I add it?
@y
### Is adding domain required to configure SSO? What domains should I be adding? And how do I add it?
@z

@x
Adding and verifying a domain is required to enable and enforce SSO. See [Step one: Add and verify your domain](/security/for-admins/single-sign-on/configure/#step-one-add-and-verify-your-domain) to learn how to specify the email domains that are allowed to authenticate through your server. This should include all email domains users will use to access Docker. Public domains, for example `gmail.com` or `outlook.com`, are not permitted. Also, the email domain should be set as the primary email.
@y
Adding and verifying a domain is required to enable and enforce SSO. See [Step one: Add and verify your domain](/security/for-admins/single-sign-on/configure/#step-one-add-and-verify-your-domain) to learn how to specify the email domains that are allowed to authenticate through your server. This should include all email domains users will use to access Docker. Public domains, for example `gmail.com` or `outlook.com`, are not permitted. Also, the email domain should be set as the primary email.
@z

@x
### Is IdP-initiated authentication supported?
@y
### Is IdP-initiated authentication supported?
@z

@x
IdP-initiated authentication isn't supported by Docker SSO. Users must initiate sign-in through Docker Desktop or Hub.
@y
IdP-initiated authentication isn't supported by Docker SSO. Users must initiate sign-in through Docker Desktop or Hub.
@z
