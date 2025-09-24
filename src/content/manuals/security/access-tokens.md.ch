%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Personal access tokens
linkTitle: Personal access tokens
description: Create and manage personal Docker access tokens for secure CLI authentication and automation
keywords: personal access tokens, PAT, docker cli authentication, docker hub security, programmatic access
@y
title: Personal access tokens
linkTitle: Personal access tokens
description: Create and manage personal Docker access tokens for secure CLI authentication and automation
keywords: personal access tokens, PAT, docker cli authentication, docker hub security, programmatic access
@z

@x
Personal access tokens (PATs) provide a secure alternative to passwords for Docker CLI authentication. Use PATs to authenticate automated systems, CI/CD pipelines, and development tools without exposing your Docker Hub password.
@y
Personal access tokens (PATs) provide a secure alternative to passwords for Docker CLI authentication. Use PATs to authenticate automated systems, CI/CD pipelines, and development tools without exposing your Docker Hub password.
@z

@x
## Key benefits
@y
## Key benefits
@z

@x
PATs offer significant security advantages over password authentication:
@y
PATs offer significant security advantages over password authentication:
@z

@x
- Enhanced security: Investigate token usage, disable suspicious tokens, and prevent administrative actions that could compromise your account if your system is compromised.
- Better automation: Issue multiple tokens for different integrations, each with specific permissions, and revoke them independently when no longer needed.
- Two-factor authentication compatibility: Required when you have two-factor authentication turned on, providing secure CLI access without bypassing 2FA protection.
- Usage tracking: Monitor when and how tokens are used to identify potential security issues or unused automation.
@y
- Enhanced security: Investigate token usage, disable suspicious tokens, and prevent administrative actions that could compromise your account if your system is compromised.
- Better automation: Issue multiple tokens for different integrations, each with specific permissions, and revoke them independently when no longer needed.
- Two-factor authentication compatibility: Required when you have two-factor authentication turned on, providing secure CLI access without bypassing 2FA protection.
- Usage tracking: Monitor when and how tokens are used to identify potential security issues or unused automation.
@z

@x
## Who should use personal access tokens?
@y
## Who should use personal access tokens?
@z

@x
Use PATs for these common scenarios:
@y
Use PATs for these common scenarios:
@z

@x
- Development workflows: Authenticate Docker CLI during local development
- CI/CD pipelines: Automate image builds and deployments in continuous integration systems
- Automation scripts: Push and pull images in automated deployment or backup scripts
- Development tools: Integrate Docker Hub access with IDEs, container management tools, or monitoring systems
- Two-factor authentication: Required for CLI access when 2FA is turned on
@y
- Development workflows: Authenticate Docker CLI during local development
- CI/CD pipelines: Automate image builds and deployments in continuous integration systems
- Automation scripts: Push and pull images in automated deployment or backup scripts
- Development tools: Integrate Docker Hub access with IDEs, container management tools, or monitoring systems
- Two-factor authentication: Required for CLI access when 2FA is turned on
@z

@x
> [!NOTE]
>
> For organization-wide automation, consider [organization access tokens](/manuals/enterprise/security/access-tokens.md) which aren't tied to individual user accounts.
@y
> [!NOTE]
>
> For organization-wide automation, consider [organization access tokens](manuals/enterprise/security/access-tokens.md) which aren't tied to individual user accounts.
@z

@x
## Create a personal access token
@y
## Create a personal access token
@z

@x
> [!IMPORTANT]
>
> Treat access tokens like passwords and keep them secure. Store tokens in credential managers and never commit them to source code repositories.
@y
> [!IMPORTANT]
>
> Treat access tokens like passwords and keep them secure. Store tokens in credential managers and never commit them to source code repositories.
@z

@x
To create a personal access token:
@y
To create a personal access token:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your avatar in the top-right corner and from the drop-down menu select **Account settings**.
1. Select **Personal access tokens**.
1. Select **Generate new token**.
1. Configure your token:
   - **Description:** Use a descriptive name that indicates the token's purpose
   - **Expiration date:** Set an expiration date based on your security policies
   - **Access permissions:** **Read**, **Write**, or **Delete**.
1. Select **Generate**. Copy the token that appears on the screen and save it. You won't be able to retrieve the token once you exit the screen.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your avatar in the top-right corner and from the drop-down menu select **Account settings**.
1. Select **Personal access tokens**.
1. Select **Generate new token**.
1. Configure your token:
   - **Description:** Use a descriptive name that indicates the token's purpose
   - **Expiration date:** Set an expiration date based on your security policies
   - **Access permissions:** **Read**, **Write**, or **Delete**.
1. Select **Generate**. Copy the token that appears on the screen and save it. You won't be able to retrieve the token once you exit the screen.
@z

@x
## Use personal access tokens
@y
## Use personal access tokens
@z

@x
Sign in to the Docker CLI using your personal access token:
@y
Sign in to the Docker CLI using your personal access token:
@z

@x
```console
$ docker login --username <YOUR_USERNAME>
Password: [paste your PAT here]
```
@y
```console
$ docker login --username <YOUR_USERNAME>
Password: [paste your PAT here]
```
@z

@x
When prompted for a password, enter your personal access token instead of your Docker Hub password.
@y
When prompted for a password, enter your personal access token instead of your Docker Hub password.
@z

@x
## Modify personal access tokens
@y
## Modify personal access tokens
@z

@x
> [!NOTE]
>
> You can't edit the expiration date on an existing personal access token. You must create a new PAT if you need to set a new expiration date.
@y
> [!NOTE]
>
> You can't edit the expiration date on an existing personal access token. You must create a new PAT if you need to set a new expiration date.
@z

@x
You can rename, activate, deactivate, or delete a token as needed. You can manage your tokens in your account settings.
@y
You can rename, activate, deactivate, or delete a token as needed. You can manage your tokens in your account settings.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and from the drop-down menu select **Account settings**.
1. Select **Personal access tokens**.
      - This page shows an overview of all your tokens, and lists if the token was generated manually or if it was
   [auto-generated](#auto-generated-tokens). You can also view the scope of the
   tokens, which tokens are activate and inactive, when they were created, when
   they were last used, and their expiration date.
1. Select the actions menu on the far right of a token row, then select **Deactivate** or **Activate**, **Edit**, or **Delete** to modify the token.
1. After editing the token, select **Save token**.
@y
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and from the drop-down menu select **Account settings**.
1. Select **Personal access tokens**.
      - This page shows an overview of all your tokens, and lists if the token was generated manually or if it was
   [auto-generated](#auto-generated-tokens). You can also view the scope of the
   tokens, which tokens are activate and inactive, when they were created, when
   they were last used, and their expiration date.
1. Select the actions menu on the far right of a token row, then select **Deactivate** or **Activate**, **Edit**, or **Delete** to modify the token.
1. After editing the token, select **Save token**.
@z

@x
## Auto-generated tokens
@y
## Auto-generated tokens
@z

@x
Docker Desktop automatically creates authentication tokens when you sign in, with these characteristics:
@y
Docker Desktop automatically creates authentication tokens when you sign in, with these characteristics:
@z

@x
- Automatic creation: Generated when you sign in to Docker Desktop
- Full permissions: Include Read, Write, and Delete access
- Session-based: Automatically removed when Docker Desktop session expires
- Account limits: Up to 5 auto-generated tokens per account
- Automatic cleanup: Older tokens are deleted when new ones are created
@y
- Automatic creation: Generated when you sign in to Docker Desktop
- Full permissions: Include Read, Write, and Delete access
- Session-based: Automatically removed when Docker Desktop session expires
- Account limits: Up to 5 auto-generated tokens per account
- Automatic cleanup: Older tokens are deleted when new ones are created
@z

@x
You can manually delete auto-generated tokens if needed, but they'll be recreated when you use Docker Desktop.
@y
You can manually delete auto-generated tokens if needed, but they'll be recreated when you use Docker Desktop.
@z

@x
## Fair use policy
@y
## Fair use policy
@z

@x
When using personal access tokens, be aware that excessive token creation may result in throttling or additional charges. Docker reserves the right to impose restrictions on accounts with excessive PAT usage to ensure fair resource allocation and maintain service quality.
@y
When using personal access tokens, be aware that excessive token creation may result in throttling or additional charges. Docker reserves the right to impose restrictions on accounts with excessive PAT usage to ensure fair resource allocation and maintain service quality.
@z

@x
Best practices for fair use include:
@y
Best practices for fair use include:
@z

@x
- Reuse tokens across similar use cases instead of creating many single-purpose tokens
- Delete unused tokens regularly
- Use [organization access tokens](/manuals/enterprise/security/access-tokens.md) for organization-wide automation
- Monitor token usage to identify optimization opportunities
@y
- Reuse tokens across similar use cases instead of creating many single-purpose tokens
- Delete unused tokens regularly
- Use [organization access tokens](manuals/enterprise/security/access-tokens.md) for organization-wide automation
- Monitor token usage to identify optimization opportunities
@z
