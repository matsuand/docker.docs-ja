%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Frequently asked questions about Docker single sign-on
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, administration, security
title: General SSO FAQs
linkTitle: General
@y
description: Frequently asked questions about Docker single sign-on
keywords: Docker, Docker Hub, SSO FAQs, single sign-on, administration, security
title: General SSO FAQs
linkTitle: General
@z

@x
## What SSO flows does Docker support?
@y
## What SSO flows does Docker support?
@z

@x
Docker supports Service Provider Initiated (SP-initiated) SSO flow. Users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@y
Docker supports Service Provider Initiated (SP-initiated) SSO flow. Users must sign in to Docker Hub or Docker Desktop to initiate the SSO authentication process.
@z

@x
## Does Docker SSO support multi-factor authentication?
@y
## Does Docker SSO support multi-factor authentication?
@z

@x
When an organization uses SSO, multi-factor authentication is controlled at the identity provider level, not on the Docker platform.
@y
When an organization uses SSO, multi-factor authentication is controlled at the identity provider level, not on the Docker platform.
@z

@x
## Can I retain my Docker ID when using SSO?
@y
## Can I retain my Docker ID when using SSO?
@z

@x
Users with personal Docker IDs retain ownership of their repositories, images, and assets. When SSO is enforced, existing accounts with company domain emails are connected to the organization. Users signing in without existing accounts automatically have new accounts and Docker IDs created.
@y
Users with personal Docker IDs retain ownership of their repositories, images, and assets. When SSO is enforced, existing accounts with company domain emails are connected to the organization. Users signing in without existing accounts automatically have new accounts and Docker IDs created.
@z

@x
## Are there any firewall rules required for SSO configuration?
@y
## Are there any firewall rules required for SSO configuration?
@z

@x
No specific firewall rules are required as long as `login.docker.com` is accessible. This domain is commonly accessible by default, but some organizations may need to allow it in their firewall settings if SSO setup encounters issues.
@y
No specific firewall rules are required as long as `login.docker.com` is accessible. This domain is commonly accessible by default, but some organizations may need to allow it in their firewall settings if SSO setup encounters issues.
@z

@x
## Does Docker use my IdP's default session timeout?
@y
## Does Docker use my IdP's default session timeout?
@z

@x
Yes, Docker supports your IdP's session timeout using a custom `dockerSessionMinutes` SAML attribute instead of the standard `SessionNotOnOrAfter` element. See [SSO attributes](/manuals/enterprise/security/provisioning/_index.md#sso-attributes) for more information.
@y
Yes, Docker supports your IdP's session timeout using a custom `dockerSessionMinutes` SAML attribute instead of the standard `SessionNotOnOrAfter` element. See [SSO attributes](manuals/enterprise/security/provisioning/_index.md#sso-attributes) for more information.
@z
