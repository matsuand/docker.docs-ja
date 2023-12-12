%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Create and manage access tokens
description: Learn how to create and manage your personal Docker Hub access tokens
  to securely push and pull images programmatically.
keywords: docker hub, hub, security, PAT, personal access token
aliases: 
- /docker-hub/access-tokens/
---
@y
---
title: Create and manage access tokens
description: Learn how to create and manage your personal Docker Hub access tokens
  to securely push and pull images programmatically.
keywords: docker hub, hub, security, PAT, personal access token
aliases: 
- /docker-hub/access-tokens/
---
@z

@x
You can create personal access tokens (PAT) to use as alternatives to your password for Docker CLI authentication.
@y
You can create personal access tokens (PAT) to use as alternatives to your password for Docker CLI authentication.
@z

@x
Compared to passwords, personal access tokens provide the following advantages:
@y
Compared to passwords, personal access tokens provide the following advantages:
@z

@x
- You can investigate when the PAT was last used and then disable or delete it if you find any suspicious activity.
- When using an access token, you can't perform any admin activity on the account, including changing the password. It protects your account if your computer is compromised.
@y
- You can investigate when the PAT was last used and then disable or delete it if you find any suspicious activity.
- When using an access token, you can't perform any admin activity on the account, including changing the password. It protects your account if your computer is compromised.
@z

@x
Access tokens are also valuable for building integrations, as you can issue multiple tokens, one for each integration, and revoke them at
any time.
   > **Note**
   >
   > If you have [two-factor authentication (2FA)](2fa/index.md) enabled on
   > your account, you must create at least one personal access token. Otherwise,
   > you won't be able to sign in to your account from the Docker CLI.
@y
Access tokens are also valuable for building integrations, as you can issue multiple tokens, one for each integration, and revoke them at
any time.
   > **Note**
   >
   > If you have [two-factor authentication (2FA)](2fa/index.md) enabled on
   > your account, you must create at least one personal access token. Otherwise,
   > you won't be able to sign in to your account from the Docker CLI.
@z

@x
## Create an access token
@y
## Create an access token
@z

@x
> **Important**
>
> Treat access tokens like your password and keep them secret. Store your tokens securely in a credential manager for example.
{ .important }
@y
> **Important**
>
> Treat access tokens like your password and keep them secret. Store your tokens securely in a credential manager for example.
{ .important }
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Select your avatar in the top-right corner and from the drop-down menu select **My Account**.
@y
2. Select your avatar in the top-right corner and from the drop-down menu select **My Account**.
@z

@x
3. Select the **Security** tab and then **New Access Token**.
@y
3. Select the **Security** tab and then **New Access Token**.
@z

@x
4. Add a description for your token. Use something that indicates the use case or purpose of the token.
@y
4. Add a description for your token. Use something that indicates the use case or purpose of the token.
@z

@x
5. Set the access permissions.
   The access permissions are scopes that set restrictions in your
   repositories. For example, for Read & Write permissions, an automation
   pipeline can build an image and then push it to a repository. However, it
   can not delete the repository.
@y
5. Set the access permissions.
   The access permissions are scopes that set restrictions in your
   repositories. For example, for Read & Write permissions, an automation
   pipeline can build an image and then push it to a repository. However, it
   can not delete the repository.
@z

@x
6. Select **Generate** and then copy the token that appears on the screen and save it. You won't be able
   to retrieve the token once you close this prompt.
@y
6. Select **Generate** and then copy the token that appears on the screen and save it. You won't be able
   to retrieve the token once you close this prompt.
@z

@x
## Use an access token
@y
## Use an access token
@z

@x
You can use an access token in place of your password when you log in using Docker CLI.
@y
You can use an access token in place of your password when you log in using Docker CLI.
@z

@x
Log in from your Docker CLI client with the following command, replacing `YOUR_USERNAME` with your Docker ID:
@y
Log in from your Docker CLI client with the following command, replacing `YOUR_USERNAME` with your Docker ID:
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
> **Note**
>
> If you have [two-factor authentication (2FA)](2fa/index.md) enabled, you must
> use a personal access token when logging in from the Docker CLI. 2FA is an
> optional, but more secure method of authentication.
@y
> **Note**
>
> If you have [two-factor authentication (2FA)](2fa/index.md) enabled, you must
> use a personal access token when logging in from the Docker CLI. 2FA is an
> optional, but more secure method of authentication.
@z

@x
## Modify existing tokens
@y
## Modify existing tokens
@z

@x
You can rename, activate, deactivate, or delete a token as needed.
@y
You can rename, activate, deactivate, or delete a token as needed.
@z

@x
1. Access your tokens under **My Account > Security**.
   This page shows an overview of all your tokens, and lists if the token was generated manually or if it was [auto-generated](#auto-generated-tokens). You can also view the number
   of tokens that are activated and deactivated in the toolbar.
@y
1. Access your tokens under **My Account > Security**.
   This page shows an overview of all your tokens, and lists if the token was generated manually or if it was [auto-generated](#auto-generated-tokens). You can also view the number
   of tokens that are activated and deactivated in the toolbar.
@z

@x
2. Select a token and then select **Delete** or **Edit**, or use the actions menu on the far right of a token row to bring up the edit screen.
   You can also select multiple tokens to delete at once.
@y
2. Select a token and then select **Delete** or **Edit**, or use the actions menu on the far right of a token row to bring up the edit screen.
   You can also select multiple tokens to delete at once.
@z

@x
3. After modifying the token, select **Save**.
@y
3. After modifying the token, select **Save**.
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
You can have up to 5 auto-generated tokens associated with your account. These are deleted and created automatically based on usage and creation dates. You can also delete your auto-generated tokens as needed. See [Modify existing tokens](#modify-existing-tokens).
@y
You can have up to 5 auto-generated tokens associated with your account. These are deleted and created automatically based on usage and creation dates. You can also delete your auto-generated tokens as needed. See [Modify existing tokens](#modify-existing-tokens).
@z
