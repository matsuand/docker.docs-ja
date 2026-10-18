%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Create and manage personal access tokens
linkTitle: Personal access tokens
description: >-
  Create a personal access token, set repository permissions and Cloud
  Sandboxes access, set expiration, and sign in to the Docker CLI.
keywords: >-
  personal access token, PAT, Docker Hub, docker login,
  CLI authentication, token permissions, repository permissions,
  token expiration, two-factor authentication, SSO, Cloud Sandboxes,
  sandbox:use, Allow Cloud Sandboxes access, No repository access
@y
title: Create and manage personal access tokens
linkTitle: Personal access tokens
description: >-
  Create a personal access token, set repository permissions and Cloud
  Sandboxes access, set expiration, and sign in to the Docker CLI.
keywords: >-
  personal access token, PAT, Docker Hub, docker login,
  CLI authentication, token permissions, repository permissions,
  token expiration, two-factor authentication, SSO, Cloud Sandboxes,
  sandbox:use, Allow Cloud Sandboxes access, No repository access
@z

@x
{{< summary-bar feature_name="PATs" >}}
@y
{{< summary-bar feature_name="PATs" >}}
@z

@x
A personal access token (PAT) lets you sign in to Docker Hub without
your password. You can create several tokens and revoke one without
changing your password. From Docker Home, you can view the token list,
which shows when each token was last used.
@y
A personal access token (PAT) lets you sign in to Docker Hub without
your password. You can create several tokens and revoke one without
changing your password. From Docker Home, you can view the token list,
which shows when each token was last used.
@z

@x
Treat PATs like passwords and keep them secure. Store tokens in a
credential manager and never commit them to source code. Before you
create a PAT, you must verify your email address.
@y
Treat PATs like passwords and keep them secure. Store tokens in a
credential manager and never commit them to source code. Before you
create a PAT, you must verify your email address.
@z

@x
> [!TIP]
>
> For organization-wide automation, consider
> [organization access tokens (OATs)](/manuals/security/access-tokens/organization-access-tokens.md),
> which aren't tied to individual user accounts.
@y
> [!TIP]
>
> For organization-wide automation, consider
> [organization access tokens (OATs)](manuals/security/access-tokens/organization-access-tokens.md),
> which aren't tied to individual user accounts.
@z

@x
## Create a personal access token {#create}
@y
## Create a personal access token {#create}
@z

@x
When you create a PAT, you choose one repository permission and whether
the token can use Cloud Sandboxes. You can combine these to fit the
task. For example, a token can use Cloud Sandboxes with no repository
access, or it can push images and use Cloud Sandboxes.
@y
When you create a PAT, you choose one repository permission and whether
the token can use Cloud Sandboxes. You can combine these to fit the
task. For example, a token can use Cloud Sandboxes with no repository
access, or it can push images and use Cloud Sandboxes.
@z

@x
To create a PAT:
@y
To create a PAT:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your avatar in the top-right corner, then select
   **Account settings**.
1. Select **Personal access tokens**.
1. Select **Generate new token**.
1. Configure your token:
   - **Access token description:** Enter a name for the token, up to
     100 characters. This field is required.
   - **Expiration date:** Optional. The default is **None**, which
     creates a token that doesn't expire.
     - Select **30 days**, **90 days**, or **Custom**.
     - With **Custom**, choose a date and hour up to one year from
       today.
   - **Access permissions:** Set a repository permission and, if you
     need it, Cloud Sandboxes access. Select at least
     [one permission](/manuals/security/access-tokens/reference.md#personal-access-token-permissions).
     - **Repository permissions:** The default is **Repo Public
       Read-only**.
       - Select one level.
       - Select **No repository access** when the token should not
         access repositories.
     - **Allow Cloud Sandboxes access:** Select this to let the token
       create and use Cloud Sandboxes. You can add it to any
       repository permission, or use it with **No repository
       access**.
1. Select **Generate**. Copy the token and save it. Docker shows the
   token once and doesn't store it. You can't retrieve it after you
   leave the page.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your avatar in the top-right corner, then select
   **Account settings**.
1. Select **Personal access tokens**.
1. Select **Generate new token**.
1. Configure your token:
   - **Access token description:** Enter a name for the token, up to
     100 characters. This field is required.
   - **Expiration date:** Optional. The default is **None**, which
     creates a token that doesn't expire.
     - Select **30 days**, **90 days**, or **Custom**.
     - With **Custom**, choose a date and hour up to one year from
       today.
   - **Access permissions:** Set a repository permission and, if you
     need it, Cloud Sandboxes access. Select at least
     [one permission](manuals/security/access-tokens/reference.md#personal-access-token-permissions).
     - **Repository permissions:** The default is **Repo Public
       Read-only**.
       - Select one level.
       - Select **No repository access** when the token should not
         access repositories.
     - **Allow Cloud Sandboxes access:** Select this to let the token
       create and use Cloud Sandboxes. You can add it to any
       repository permission, or use it with **No repository
       access**.
1. Select **Generate**. Copy the token and save it. Docker shows the
   token once and doesn't store it. You can't retrieve it after you
   leave the page.
@z

@x
## Sign in with a personal access token {#sign-in}
@y
## Sign in with a personal access token {#sign-in}
@z

@x
Run `docker login` with your Docker ID. When the CLI asks for a
password, paste the PAT.
@y
Run `docker login` with your Docker ID. When the CLI asks for a
password, paste the PAT.
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
If sign-in fails with `Incorrect authentication credentials`, see
[Why does sign-in fail with "Incorrect authentication credentials"?](/manuals/faqs/accounts.md#why-does-sign-in-fail-with-incorrect-authentication-credentials).
@y
If sign-in fails with `Incorrect authentication credentials`, see
[Why does sign-in fail with "Incorrect authentication credentials"?](manuals/faqs/accounts.md#why-does-sign-in-fail-with-incorrect-authentication-credentials).
@z

@x
## Update or delete a personal access token {#update-or-delete}
@y
## Update or delete a personal access token {#update-or-delete}
@z

@x
You can rename a token, change its permissions, deactivate it, activate
it again, or delete it. You can't edit the expiration date on an
existing PAT. Create a new token if you need a different expiration
date.
@y
You can rename a token, change its permissions, deactivate it, activate
it again, or delete it. You can't edit the expiration date on an
existing PAT. Create a new token if you need a different expiration
date.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your avatar in the top-right corner, then select
   **Account settings**.
1. Select **Personal access tokens**.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
1. Select your avatar in the top-right corner, then select
   **Account settings**.
1. Select **Personal access tokens**.
@z

@x
   The list shows each token's description, scope, and status
   (**Active**, **Inactive**, or **Revoked**). It also shows whether
   the token is **Manual** or
   [**Auto-generated**](#auto-generated-tokens), when it was created,
   when it was last used, and when it expires.
@y
   The list shows each token's description, scope, and status
   (**Active**, **Inactive**, or **Revoked**). It also shows whether
   the token is **Manual** or
   [**Auto-generated**](#auto-generated-tokens), when it was created,
   when it was last used, and when it expires.
@z

@x
1. Select the actions menu on the far right of a token row, then select
   **Deactivate**, **Activate**, **Edit**, or **Delete**.
@y
1. Select the actions menu on the far right of a token row, then select
   **Deactivate**, **Activate**, **Edit**, or **Delete**.
@z

@x
   A deactivated token stops working until you activate it again.
   Expired and revoked tokens can only be deleted.
@y
   A deactivated token stops working until you activate it again.
   Expired and revoked tokens can only be deleted.
@z

@x
1. If you selected **Edit**, change the **Access token description** or
   **Access permissions**, then select **Save token**.
@y
1. If you selected **Edit**, change the **Access token description** or
   **Access permissions**, then select **Save token**.
@z

@x
## Auto-generated tokens
@y
## Auto-generated tokens
@z

@x
Signing in to Docker Desktop creates a PAT for CLI
authentication. These tokens show **Auto-generated** in the **Source**
column. A token with no description is listed as "Generated by Docker
Desktop for CLI usage".
@y
Signing in to Docker Desktop creates a PAT for CLI
authentication. These tokens show **Auto-generated** in the **Source**
column. A token with no description is listed as "Generated by Docker
Desktop for CLI usage".
@z

@x
You can have up to five auto-generated tokens on your account. When
Docker Desktop creates another one, the least recently used
auto-generated token is deleted. A token that has never been used is
ranked by when it was created. Tokens you create yourself are not
deleted.
@y
You can have up to five auto-generated tokens on your account. When
Docker Desktop creates another one, the least recently used
auto-generated token is deleted. A token that has never been used is
ranked by when it was created. Tokens you create yourself are not
deleted.
@z

@x
You can deactivate or delete an auto-generated token the same way as
any other token.
@y
You can deactivate or delete an auto-generated token the same way as
any other token.
@z

@x
## Fair use policy
@y
## Fair use policy
@z

@x
When using PATs, be aware that excessive token
creation may result in throttling or additional charges. Docker
reserves the right to impose restrictions on accounts with excessive
PAT usage to ensure fair resource allocation and maintain service
quality.
@y
When using PATs, be aware that excessive token
creation may result in throttling or additional charges. Docker
reserves the right to impose restrictions on accounts with excessive
PAT usage to ensure fair resource allocation and maintain service
quality.
@z

@x
Best practices for fair use include:
@y
Best practices for fair use include:
@z

@x
- Reuse tokens across similar use cases instead of creating many
  single-purpose tokens
- Delete unused tokens regularly
- Use [OATs](/manuals/security/access-tokens/organization-access-tokens.md)
  for organization-wide automation
- Monitor token usage to identify optimization opportunities
@y
- Reuse tokens across similar use cases instead of creating many
  single-purpose tokens
- Delete unused tokens regularly
- Use [OATs](manuals/security/access-tokens/organization-access-tokens.md)
  for organization-wide automation
- Monitor token usage to identify optimization opportunities
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Choose a PAT or OAT](/manuals/security/access-tokens/_index.md)
- [Look up PAT permissions](/manuals/security/access-tokens/reference.md#personal-access-token-permissions)
- [Authenticate to Cloud Sandboxes](/manuals/ai/sandboxes-api/authentication.md)
- [Create an OAT](/manuals/security/access-tokens/organization-access-tokens.md)
- [Turn on two-factor authentication](/manuals/security/authentication/2fa/_index.md)
@y
- [Choose a PAT or OAT](manuals/security/access-tokens/_index.md)
- [Look up PAT permissions](manuals/security/access-tokens/reference.md#personal-access-token-permissions)
- [Authenticate to Cloud Sandboxes](manuals/ai/sandboxes-api/authentication.md)
- [Create an OAT](manuals/security/access-tokens/organization-access-tokens.md)
- [Turn on two-factor authentication](manuals/security/authentication/2fa/_index.md)
@z
