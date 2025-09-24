%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Frequently asked questions about Docker security, authentication, and organization management
keywords: Docker security, FAQs, authentication, SSO, vulnerability reporting, session management
title: General security FAQs
linkTitle: General
@y
description: Frequently asked questions about Docker security, authentication, and organization management
keywords: Docker security, FAQs, authentication, SSO, vulnerability reporting, session management
title: General security FAQs
linkTitle: General
@z

@x
## How do I report a vulnerability?
@y
## How do I report a vulnerability?
@z

@x
If you've discovered a security vulnerability in Docker, report it responsibly to security@docker.com so Docker can quickly address it.
@y
If you've discovered a security vulnerability in Docker, report it responsibly to security@docker.com so Docker can quickly address it.
@z

@x
## Does Docker lockout users after failed sign-ins?
@y
## Does Docker lockout users after failed sign-ins?
@z

@x
Docker Hub locks out users after 10 failed sign-in attempts within 5 minutes. The lockout duration is 5 minutes. This policy applies to Docker Hub, Docker Desktop, and Docker Scout authentication.
@y
Docker Hub locks out users after 10 failed sign-in attempts within 5 minutes. The lockout duration is 5 minutes. This policy applies to Docker Hub, Docker Desktop, and Docker Scout authentication.
@z

@x
## Do you support physical multi-factor authentication (MFA) with YubiKeys?
@y
## Do you support physical multi-factor authentication (MFA) with YubiKeys?
@z

@x
You can configure physical multi-factor authentication (MFA) through SSO using your identity provider (IdP). Check with your IdP if they support physical MFA devices like YubiKeys.
@y
You can configure physical multi-factor authentication (MFA) through SSO using your identity provider (IdP). Check with your IdP if they support physical MFA devices like YubiKeys.
@z

@x
## How are sessions managed and do they expire?
@y
## How are sessions managed and do they expire?
@z

@x
Docker uses tokens to manage user sessions with different expiration periods:
@y
Docker uses tokens to manage user sessions with different expiration periods:
@z

@x
- Docker Desktop: Signs you out after 90 days, or 30 days of inactivity
- Docker Hub and Docker Home: Sign you out after 24 hours
@y
- Docker Desktop: Signs you out after 90 days, or 30 days of inactivity
- Docker Hub and Docker Home: Sign you out after 24 hours
@z

@x
Docker also supports your IdP's default session timeout through SAML attributes. For more information, see [SSO attributes](/manuals/enterprise/security/provisioning/_index.md#sso-attributes).
@y
Docker also supports your IdP's default session timeout through SAML attributes. For more information, see [SSO attributes](manuals/enterprise/security/provisioning/_index.md#sso-attributes).
@z

@x
## How does Docker distinguish between employee users and contractor users?
@y
## How does Docker distinguish between employee users and contractor users?
@z

@x
Organizations use verified domains to distinguish user types. Team members with email domains other than verified domains appear as "Guest" users in the organization.
@y
Organizations use verified domains to distinguish user types. Team members with email domains other than verified domains appear as "Guest" users in the organization.
@z

@x
## How long are activity logs available?
@y
## How long are activity logs available?
@z

@x
Docker activity logs are available for 90 days. You're responsible for exporting logs or setting up drivers to send logs to your internal systems for longer retention.
@y
Docker activity logs are available for 90 days. You're responsible for exporting logs or setting up drivers to send logs to your internal systems for longer retention.
@z

@x
## Can I export a list of users with their roles and privileges?
@y
## Can I export a list of users with their roles and privileges?
@z

@x
Yes, use the [Export Members](../../admin/organization/members.md#export-members) feature to export a CSV file containing your organization's users with role and team information.
@y
Yes, use the [Export Members](../../admin/organization/members.md#export-members) feature to export a CSV file containing your organization's users with role and team information.
@z

@x
## How does Docker Desktop handle authentication information?
@y
## How does Docker Desktop handle authentication information?
@z

@x
Docker Desktop uses the host operating system's secure key management to store authentication tokens:
@y
Docker Desktop uses the host operating system's secure key management to store authentication tokens:
@z

@x
- macOS: [Keychain](https://support.apple.com/guide/security/keychain-data-protection-secb0694df1a/web)
- Windows: [Security and Identity API via Wincred](https://learn.microsoft.com/en-us/windows/win32/api/wincred/)
- Linux: [Pass](https://www.passwordstore.org/).
@y
- macOS: [Keychain](https://support.apple.com/guide/security/keychain-data-protection-secb0694df1a/web)
- Windows: [Security and Identity API via Wincred](https://learn.microsoft.com/en-us/windows/win32/api/wincred/)
- Linux: [Pass](https://www.passwordstore.org/).
@z

@x
## How do I remove users who aren't part of my IdP when using SSO without SCIM?
@y
## How do I remove users who aren't part of my IdP when using SSO without SCIM?
@z

@x
If SCIM isn't turned on, you must manually remove users from the organization. SCIM can automate user removal, but only for users added after SCIM is turned on. Users added before SCIM was turned on must be removed manually.
@y
If SCIM isn't turned on, you must manually remove users from the organization. SCIM can automate user removal, but only for users added after SCIM is turned on. Users added before SCIM was turned on must be removed manually.
@z

@x
For more information, see [Manage organization members](/manuals/admin/organization/members.md).
@y
For more information, see [Manage organization members](manuals/admin/organization/members.md).
@z

@x
## What metadata does Scout collect from container images?
@y
## What metadata does Scout collect from container images?
@z

@x
For information about metadata stored by Docker Scout, see [Data handling](/manuals/scout/deep-dive/data-handling.md).
@y
For information about metadata stored by Docker Scout, see [Data handling](manuals/scout/deep-dive/data-handling.md).
@z

@x
## How are Marketplace extensions vetted for security?
@y
## How are Marketplace extensions vetted for security?
@z

@x
Security vetting for extensions is on the roadmap but isn't currently implemented. Extensions aren't covered as part of Docker's Third-Party Risk Management Program.
@y
Security vetting for extensions is on the roadmap but isn't currently implemented. Extensions aren't covered as part of Docker's Third-Party Risk Management Program.
@z

@x
## Can I prevent users from pushing images to Docker Hub private repositories?
@y
## Can I prevent users from pushing images to Docker Hub private repositories?
@z

@x
No direct setting exists to disable private repositories. However, [Registry Access Management](/manuals/enterprise/security/hardened-desktop/registry-access-management.md) lets administrators control which registries developers can access through Docker Desktop via the Admin Console.
@y
No direct setting exists to disable private repositories. However, [Registry Access Management](manuals/enterprise/security/hardened-desktop/registry-access-management.md) lets administrators control which registries developers can access through Docker Desktop via the Admin Console.
@z
