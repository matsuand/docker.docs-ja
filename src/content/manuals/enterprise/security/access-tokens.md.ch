%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

%  .md リンクへの (no slash) 対応

@x
title: Organization access tokens
linkTitle: Organization access tokens
description: Create and manage organization access tokens to securely authenticate automated systems and CI/CD pipelines with Docker Hub
keywords: organization access tokens, OAT, docker hub security, programmatic access, automation
@y
title: Organization access tokens
linkTitle: Organization access tokens
description: Create and manage organization access tokens to securely authenticate automated systems and CI/CD pipelines with Docker Hub
keywords: organization access tokens, OAT, docker hub security, programmatic access, automation
@z

@x
{{< summary-bar feature_name="OATs" >}}
@y
{{< summary-bar feature_name="OATs" >}}
@z

@x
Organization access tokens (OATs) provide secure, programmatic access to Docker Hub for automated systems, CI/CD pipelines, and other business-critical tasks. Unlike personal access tokens tied to individual users, OATs are associated with your organization and can be managed by any organization owner.
@y
Organization access tokens (OATs) provide secure, programmatic access to Docker Hub for automated systems, CI/CD pipelines, and other business-critical tasks. Unlike personal access tokens tied to individual users, OATs are associated with your organization and can be managed by any organization owner.
@z

@x
> [!WARNING]
>
> Organization access tokens are incompatible with Docker Desktop, Image Access Management, and Registry Access Management. If you use these features, use [personal access tokens](/manuals/security/access-tokens.md) instead.
@y
> [!WARNING]
>
> Organization access tokens are incompatible with Docker Desktop, Image Access Management, and Registry Access Management. If you use these features, use [personal access tokens](manuals/security/access-tokens.md) instead.
@z

@x
## Who should use organization access tokens?
@y
## Who should use organization access tokens?
@z

@x
Use OATs for automated systems that need Docker Hub access without depending on individual user accounts:
@y
Use OATs for automated systems that need Docker Hub access without depending on individual user accounts:
@z

@x
- CI/CD pipelines: Build and deployment systems that push and pull images
- Production systems: Applications that pull images during deployment
- Monitoring tools: Systems that need to check repository status or pull images
- Backup systems: Tools that periodically pull images for archival
- Integration services: Third-party tools that integrate with your Docker Hub repositories
@y
- CI/CD pipelines: Build and deployment systems that push and pull images
- Production systems: Applications that pull images during deployment
- Monitoring tools: Systems that need to check repository status or pull images
- Backup systems: Tools that periodically pull images for archival
- Integration services: Third-party tools that integrate with your Docker Hub repositories
@z

@x
## Key benefits
@y
## Key benefits
@z

@x
Benefits of using organization access tokens include:
@y
Benefits of using organization access tokens include:
@z

@x
- Organizational ownership: Not tied to individual users who might leave the company
- Shared management: All organization owners can create and manage OATs
- Separate usage limits: OATs have their own Docker Hub rate limits, not counting against personal accounts
- Better security audit: Track when tokens were last used and identify suspicious activity
- Granular permissions: Limit access to specific repositories and operations
@y
- Organizational ownership: Not tied to individual users who might leave the company
- Shared management: All organization owners can create and manage OATs
- Separate usage limits: OATs have their own Docker Hub rate limits, not counting against personal accounts
- Better security audit: Track when tokens were last used and identify suspicious activity
- Granular permissions: Limit access to specific repositories and operations
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To create and use organization access tokens, you must have:
@y
To create and use organization access tokens, you must have:
@z

@x
- A Docker Team or Business subscription
- Owner permissions
- Repositories you want to grant access to
@y
- A Docker Team or Business subscription
- Owner permissions
- Repositories you want to grant access to
@z

@x
## Create an organization access token
@y
## Create an organization access token
@z

@x
Owners can create tokens with these limits:
@y
Owners can create tokens with these limits:
@z

@x
- Team subscription: Up to 10 OATs per organization
- Business subscription: Up to 100 OATs per organization
@y
- Team subscription: Up to 10 OATs per organization
- Business subscription: Up to 100 OATs per organization
@z

@x
Expired tokens count toward your total limit.
@y
Expired tokens count toward your total limit.
@z

@x
To create an OAT:
@y
To create an OAT:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Admin Console**, then **Access tokens**.
1. Select **Generate access token**.
1. Configure token details:
    - Label: Descriptive name indicating the token's purpose
    - Description (optional): Additional details
    - Expiration date: When the token should expire
1. Expand the **Repository** drop-down to set access permissions:
    1. Optional. Select **Read public repositories** for access to public repositories.
    1. Select **Add repository** and choose a repository from the drop-down.
    1. Set permissions for each repository: **Image Pull** or **Image Push**.
    1. Add up to 50 repositories as needed.
1. Optional. Configure organization management permissions by expanding the **Organization** drop-down and selecting the **Allow management access to this organization's resources**:
    - **Member Edit**: Edit members of the organization
    - **Member Read**: Read members of the organization
    - **Invite Edit**: Invite members to the organization
    - **Invite Read**: Read invites to the organization
    - **Group Edit**: Edit groups of the organization
    - **Group Read**: Read groups of the organization
1. Select **Generate token**. Copy the token that appears on the screen and save it. You won't be able to retrieve the token once you exit the screen.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Admin Console**, then **Access tokens**.
1. Select **Generate access token**.
1. Configure token details:
    - Label: Descriptive name indicating the token's purpose
    - Description (optional): Additional details
    - Expiration date: When the token should expire
1. Expand the **Repository** drop-down to set access permissions:
    1. Optional. Select **Read public repositories** for access to public repositories.
    1. Select **Add repository** and choose a repository from the drop-down.
    1. Set permissions for each repository: **Image Pull** or **Image Push**.
    1. Add up to 50 repositories as needed.
1. Optional. Configure organization management permissions by expanding the **Organization** drop-down and selecting the **Allow management access to this organization's resources**:
    - **Member Edit**: Edit members of the organization
    - **Member Read**: Read members of the organization
    - **Invite Edit**: Invite members to the organization
    - **Invite Read**: Read invites to the organization
    - **Group Edit**: Edit groups of the organization
    - **Group Read**: Read groups of the organization
1. Select **Generate token**. Copy the token that appears on the screen and save it. You won't be able to retrieve the token once you exit the screen.
@z

@x
> [!IMPORTANT]
>
> Treat organization access tokens like passwords. Store them securely in a credential manager and never commit them to source code repositories.
@y
> [!IMPORTANT]
>
> Treat organization access tokens like passwords. Store them securely in a credential manager and never commit them to source code repositories.
@z

@x
## Use organization access tokens
@y
## Use organization access tokens
@z

@x
Sign in to the Docker CLI using your organization access token:
@y
Sign in to the Docker CLI using your organization access token:
@z

@x
```console
$ docker login --username <YOUR_ORGANIZATION_NAME>
Password: [paste your OAT here]
```
@y
```console
$ docker login --username <YOUR_ORGANIZATION_NAME>
Password: [paste your OAT here]
```
@z

@x
When prompted for a password, enter your organization access token.
@y
When prompted for a password, enter your organization access token.
@z

@x
## Modify existing tokens
@y
## Modify existing tokens
@z

@x
To manage existing tokens:
@y
To manage existing tokens:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Admin Console**, then **Access tokens**.
1. Select the actions menu in the token row, you can:
    - **Edit**
    - **Deactivate**
    - **Delete**
1. Select **Save** after making changes to a token.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
organization.
1. Select **Admin Console**, then **Access tokens**.
1. Select the actions menu in the token row, you can:
    - **Edit**
    - **Deactivate**
    - **Delete**
1. Select **Save** after making changes to a token.
@z

@x
## Organization access token best practices
@y
## Organization access token best practices
@z

@x
- Regular token rotation: Set reasonable expiration dates and rotate tokens regularly to minimize security risks.
- Principle of least privilege: Grant only the minimum repository access and permissions needed for each use case.
- Monitor token usage: Regularly review when tokens were last used to identify unused or suspicious tokens.
- Secure storage: Store tokens in secure credential management systems, never in plain text or source code.
- Immediate revocation: Deactivate or delete tokens immediately if they're compromised or no longer needed.
@y
- Regular token rotation: Set reasonable expiration dates and rotate tokens regularly to minimize security risks.
- Principle of least privilege: Grant only the minimum repository access and permissions needed for each use case.
- Monitor token usage: Regularly review when tokens were last used to identify unused or suspicious tokens.
- Secure storage: Store tokens in secure credential management systems, never in plain text or source code.
- Immediate revocation: Deactivate or delete tokens immediately if they're compromised or no longer needed.
@z
