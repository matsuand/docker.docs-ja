%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: SSO domain FAQs
linkTitle: Domains
description: Frequently asked questions about domain verification and management for Docker single sign-on
keywords: SSO domains, domain verification, DNS, TXT records, single sign-on
@y
title: SSO domain FAQs
linkTitle: Domains
description: Frequently asked questions about domain verification and management for Docker single sign-on
keywords: SSO domains, domain verification, DNS, TXT records, single sign-on
@z

@x
## Can I add sub-domains?
@y
## Can I add sub-domains?
@z

@x
Yes, you can add sub-domains to your SSO connection. All email addresses must use domains you've added to the connection. Verify that your DNS provider supports multiple TXT records for the same domain.
@y
Yes, you can add sub-domains to your SSO connection. All email addresses must use domains you've added to the connection. Verify that your DNS provider supports multiple TXT records for the same domain.
@z

@x
## Do I need to keep the DNS TXT record permanently?
@y
## Do I need to keep the DNS TXT record permanently?
@z

@x
You can remove the TXT record after one-time verification to add the domain. However, if your organization changes identity providers and needs to set up SSO again, you'll need to verify the domain again.
@y
You can remove the TXT record after one-time verification to add the domain. However, if your organization changes identity providers and needs to set up SSO again, you'll need to verify the domain again.
@z

@x
## Can I verify the same domain for multiple organizations?
@y
## Can I verify the same domain for multiple organizations?
@z

@x
You can't verify the same domain for multiple organizations at the organization level. To verify one domain for multiple organizations, you must have a Docker Business subscription and create a company. Companies allow centralized management of organizations and domain verification at the company level.
@y
You can't verify the same domain for multiple organizations at the organization level. To verify one domain for multiple organizations, you must have a Docker Business subscription and create a company. Companies allow centralized management of organizations and domain verification at the company level.
@z
