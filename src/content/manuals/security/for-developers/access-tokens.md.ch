%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create and manage access tokens
linkTitle: Access tokens
description: Learn how to create and manage your personal Docker access tokens
  to securely push and pull images programmatically.
keywords: docker hub, hub, security, PAT, personal access token
@y
title: Create and manage access tokens
linkTitle: Access tokens
description: Learn how to create and manage your personal Docker access tokens
  to securely push and pull images programmatically.
keywords: docker hub, hub, security, PAT, personal access token
@z

@x
You can create a personal access token (PAT) to use as an alternative to your password for Docker CLI authentication.
@y
You can create a personal access token (PAT) to use as an alternative to your password for Docker CLI authentication.
@z

@x
Compared to passwords, PATs provide the following advantages:
@y
Compared to passwords, PATs provide the following advantages:
@z

@x
- You can investigate when the PAT was last used and then disable or delete it if you find any suspicious activity.
- When using an access token, you can't perform any administrative activity on the account, including changing the password. It protects your account if your computer is compromised.
- Access tokens are valuable for building integrations, as you can issue multiple tokens, one for each integration, and revoke them at
any time.
@y
- You can investigate when the PAT was last used and then disable or delete it if you find any suspicious activity.
- When using an access token, you can't perform any administrative activity on the account, including changing the password. It protects your account if your computer is compromised.
- Access tokens are valuable for building integrations, as you can issue multiple tokens, one for each integration, and revoke them at
any time.
@z

@x
## Create an access token
@y
## Create an access token
@z

@x
> [!IMPORTANT]
>
> Treat access tokens like your password and keep them secret. Store your tokens securely in a credential manager for example.
@y
> [!IMPORTANT]
>
> Treat access tokens like your password and keep them secret. Store your tokens securely in a credential manager for example.
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
@z

@x
2. Select your avatar in the top-right corner and from the drop-down menu select **Account settings**.
@y
2. Select your avatar in the top-right corner and from the drop-down menu select **Account settings**.
@z

@x
3. In the **Security** section, select **Personal access tokens**.
@y
3. In the **Security** section, select **Personal access tokens**.
@z

@x
4. Select **Generate new token**.
@y
4. Select **Generate new token**.
@z

@x
5. Add a description for your token. Use something that indicates the use case or purpose of the token.
@y
5. Add a description for your token. Use something that indicates the use case or purpose of the token.
@z

@x
6. Select the expiration date for the token.
@y
6. Select the expiration date for the token.
@z

@x
7. Set the access permissions.
   The access permissions are scopes that set restrictions in your
   repositories. For example, for Read & Write permissions, an automation
   pipeline can build an image and then push it to a repository. However, it
   can't delete the repository.
@y
7. Set the access permissions.
   The access permissions are scopes that set restrictions in your
   repositories. For example, for Read & Write permissions, an automation
   pipeline can build an image and then push it to a repository. However, it
   can't delete the repository.
@z

@x
8. Select **Generate** and then copy the token that appears on the screen and save it. You won't be able to retrieve the token once you close this prompt.
@y
8. Select **Generate** and then copy the token that appears on the screen and save it. You won't be able to retrieve the token once you close this prompt.
@z

@x
## Use an access token
@y
## Use an access token
@z

@x
You can use an access token in place of your password when you sign in using Docker CLI.
@y
You can use an access token in place of your password when you sign in using Docker CLI.
@z

@x
Sign in from your Docker CLI client with the following command, replacing `YOUR_USERNAME` with your Docker ID:
@y
Sign in from your Docker CLI client with the following command, replacing `YOUR_USERNAME` with your Docker ID:
@z

@x
```console
$ docker login --username <YOUR_USERNAME>
```
@y
```console
$ docker login --username <YOUR_USERNAME>
```
@z

@x
When prompted for a password, enter your personal access token instead of a password.
@y
When prompted for a password, enter your personal access token instead of a password.
@z

@x
> [!NOTE]
>
> If you have [two-factor authentication (2FA)](2fa/_index.md) enabled, you must
> use a personal access token when logging in from the Docker CLI. 2FA is an
> optional, but more secure method of authentication.
@y
> [!NOTE]
>
> If you have [two-factor authentication (2FA)](2fa/_index.md) enabled, you must
> use a personal access token when logging in from the Docker CLI. 2FA is an
> optional, but more secure method of authentication.
@z

@x
## Modify existing tokens
@y
## Modify existing tokens
@z

@x
You can rename, activate, deactivate, or delete a token as needed. You can manage your tokens in your account settings.
@y
You can rename, activate, deactivate, or delete a token as needed. You can manage your tokens in your account settings.
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
@z

@x
2. Select your avatar in the top-right corner and from the drop-down menu select **Account settings**.
@y
2. Select your avatar in the top-right corner and from the drop-down menu select **Account settings**.
@z

@x
3. In the **Security** section, select **Personal access tokens**.
   This page shows an overview of all your tokens, and lists if the token was generated manually or if it was [auto-generated](#auto-generated-tokens). You can also view the number
   of tokens that are activated and deactivated in the toolbar.
@y
3. In the **Security** section, select **Personal access tokens**.
   This page shows an overview of all your tokens, and lists if the token was generated manually or if it was [auto-generated](#auto-generated-tokens). You can also view the number
   of tokens that are activated and deactivated in the toolbar.
@z

@x
4. Select the actions menu on the far right of a token row, then select **Deactivate**, **Edit**, or **Delete** to modify the token.
@y
4. Select the actions menu on the far right of a token row, then select **Deactivate**, **Edit**, or **Delete** to modify the token.
@z

@x
5. After modifying the token, select **Save token**.
@y
5. After modifying the token, select **Save token**.
@z

@x
## Auto-generated tokens
@y
## Auto-generated tokens
@z

@x
When you sign in to your Docker account with Docker Desktop, Docker Desktop generates an authentication token on your behalf. When you interact with Docker Hub using the Docker CLI, the CLI uses this token for authentication. The token scope has Read, Write, and Delete access. If your Docker Desktop session expires, the token is automatically removed locally.
@y
When you sign in to your Docker account with Docker Desktop, Docker Desktop generates an authentication token on your behalf. When you interact with Docker Hub using the Docker CLI, the CLI uses this token for authentication. The token scope has Read, Write, and Delete access. If your Docker Desktop session expires, the token is automatically removed locally.
@z

@x
You can have up to 5 auto-generated tokens associated with your account. These are deleted and created automatically based on usage and creation dates. You can also delete your auto-generated tokens as needed. For more information, see [Modify existing tokens](#modify-existing-tokens).
@y
You can have up to 5 auto-generated tokens associated with your account. These are deleted and created automatically based on usage and creation dates. You can also delete your auto-generated tokens as needed. For more information, see [Modify existing tokens](#modify-existing-tokens).
@z
