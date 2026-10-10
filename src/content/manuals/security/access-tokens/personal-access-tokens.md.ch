%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Create and manage personal access tokens
linkTitle: Personal access tokens
description: >-
  Create a personal access token, set its permissions and expiration,
  and sign in to the Docker CLI.
keywords: >-
  personal access token, PAT, Docker Hub, docker login,
  CLI authentication, token permissions, token expiration,
  two-factor authentication, SSO
@y
title: Create and manage personal access tokens
linkTitle: Personal access tokens
description: >-
  Create a personal access token, set its permissions and expiration,
  and sign in to the Docker CLI.
keywords: >-
  personal access token, PAT, Docker Hub, docker login,
  CLI authentication, token permissions, token expiration,
  two-factor authentication, SSO
@z

@x
{{< summary-bar feature_name="PATs" >}}
@y
{{< summary-bar feature_name="PATs" >}}
@z

@x
A personal access token (PAT) lets you sign in to Docker Hub without
your password. Use a token for the Docker CLI, scripts, continuous
integration (CI) jobs, and other tools that should act as your account.
@y
A personal access token (PAT) lets you sign in to Docker Hub without
your password. Use a token for the Docker CLI, scripts, continuous
integration (CI) jobs, and other tools that should act as your account.
@z

@x
Each token has one permission level. You can create several tokens and
revoke one without changing your password. The token list shows when
each token was last used.
@y
Each token has one permission level. You can create several tokens and
revoke one without changing your password. The token list shows when
each token was last used.
@z

@x
When two-factor authentication is turned on, or single sign-on is
enforced, password sign-in to the CLI isn't supported. Sign in with a
PAT instead.
@y
When two-factor authentication is turned on, or single sign-on is
enforced, password sign-in to the CLI isn't supported. Sign in with a
PAT instead.
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
## Create a personal access token
@y
## Create a personal access token
@z

@x
Treat PATs like passwords and keep them secure. Store tokens in a
credential manager and never commit them to source code. Before you create a PAT, you must verify your email address. To create a PAT:
@y
Treat PATs like passwords and keep them secure. Store tokens in a
credential manager and never commit them to source code. Before you create a PAT, you must verify your email address. To create a PAT:
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
   - **Expiration date:** Optional. Select **30 days**, **90 days**, or
     **Custom**. With **Custom**, choose a date and hour up to one year
     from today. The default, **None**, creates a token that doesn't
     expire.
   - **Access permissions:** Select one
     [permission level](/manuals/security/access-tokens/reference.md#personal-access-token-permissions).
     The default is **Repo Public Read-only**.
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
   - **Expiration date:** Optional. Select **30 days**, **90 days**, or
     **Custom**. With **Custom**, choose a date and hour up to one year
     from today. The default, **None**, creates a token that doesn't
     expire.
   - **Access permissions:** Select one
     [permission level](manuals/security/access-tokens/reference.md#personal-access-token-permissions).
     The default is **Repo Public Read-only**.
1. Select **Generate**. Copy the token and save it. Docker shows the
   token once and doesn't store it. You can't retrieve it after you
   leave the page.
@z

@x
## Sign in
@y
## Sign in
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
## Update or delete
@y
## Update or delete
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
   **Scopes**, then select **Save token**.
@y
1. If you selected **Edit**, change the **Access token description** or
   **Scopes**, then select **Save token**.
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
- [Create an OAT](/manuals/security/access-tokens/organization-access-tokens.md)
- [Turn on two-factor authentication](/manuals/security/authentication/2fa/_index.md)
@y
- [Choose a PAT or OAT](manuals/security/access-tokens/_index.md)
- [Look up PAT permissions](manuals/security/access-tokens/reference.md#personal-access-token-permissions)
- [Create an OAT](manuals/security/access-tokens/organization-access-tokens.md)
- [Turn on two-factor authentication](manuals/security/authentication/2fa/_index.md)
@z
