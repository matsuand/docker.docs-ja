%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Manage a Docker account
linkTitle: Manage
@y
title: Manage a Docker account
linkTitle: Manage
@z

@x
description: Update account settings, email, password, 2FA, tokens, and
  connected accounts
keywords:
  manage docker account, account settings, update email, change password,
  Gravatar, two-factor authentication, personal access tokens, Google, GitHub,
  connected accounts, convert account, deactivate account, Docker Home
@y
description: Update account settings, email, password, 2FA, tokens, and
  connected accounts
keywords:
  manage docker account, account settings, update email, change password,
  Gravatar, two-factor authentication, personal access tokens, Google, GitHub,
  connected accounts, convert account, deactivate account, Docker Home
@z

@x
You can manage your Docker account in Docker Home, including administrative
and security settings.
@y
You can manage your Docker account in Docker Home, including administrative
and security settings.
@z

@x
> [!TIP]
>
> If your account is associated with an organization that enforces single
> sign-on (SSO), you may not have permissions to update your account settings.
> Contact your administrator to update your settings.
@y
> [!TIP]
>
> If your account is associated with an organization that enforces single
> sign-on (SSO), you may not have permissions to update your account settings.
> Contact your administrator to update your settings.
@z

@x
## Update account information
@y
## Update account information
@z

@x
Account information is visible on your **Account settings** page. You can
update the following:
@y
Account information is visible on your **Account settings** page. You can
update the following:
@z

@x
- Full name
- Company
- Location
- Website
- Gravatar email
@y
- Full name
- Company
- Location
- Website
- Gravatar email
@z

@x
To add or update your avatar using Gravatar:
@y
To add or update your avatar using Gravatar:
@z

@x
1. Create a [Gravatar account](https://gravatar.com/).
1. Create your avatar.
1. Add your Gravatar email to your Docker account settings.
@y
1. Create a [Gravatar account](https://gravatar.com/).
1. Create your avatar.
1. Add your Gravatar email to your Docker account settings.
@z

@x
It may take some time for your avatar to update in Docker.
@y
It may take some time for your avatar to update in Docker.
@z

@x
## Update email address
@y
## Update email address
@z

@x
To update your email address:
@y
To update your email address:
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **Email**.
1. Enter your new email address and confirm your identity with your password.
   Select **Verify email**.
1. Go to the new Docker email and copy the 6-digit verification code.
1. Paste the verification code to complete updating your email.
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **Email**.
1. Enter your new email address and confirm your identity with your password.
   Select **Verify email**.
1. Go to the new Docker email and copy the 6-digit verification code.
1. Paste the verification code to complete updating your email.
@z

@x
Your verification session expires after 15 minutes.
@y
Your verification session expires after 15 minutes.
@z

@x
> [!NOTE]
>
> Docker accounts only support one verified email address at a time, which
> is used for account notifications and security-related communications. You
> can't add multiple verified email addresses to your account.
@y
> [!NOTE]
>
> Docker accounts only support one verified email address at a time, which
> is used for account notifications and security-related communications. You
> can't add multiple verified email addresses to your account.
@z

@x
## Change your password
@y
## Change your password
@z

@x
Initiate your password reset through email:
@y
Initiate your password reset through email:
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **Password**, then **Reset password**.
1. Docker sends you a password reset email with instructions to reset your
   password.
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **Password**, then **Reset password**.
1. Docker sends you a password reset email with instructions to reset your
   password.
@z

@x
## Manage two-factor authentication
@y
## Manage two-factor authentication
@z

@x
To update your two-factor authentication (2FA) settings:
@y
To update your two-factor authentication (2FA) settings:
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **2FA**.
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **2FA**.
@z

@x
For more information, see
[Enable two-factor authentication](/manuals/security/authentication/2fa/_index.md).
@y
For more information, see
[Enable two-factor authentication](manuals/security/authentication/2fa/_index.md).
@z

@x
## Manage personal access tokens
@y
## Manage personal access tokens
@z

@x
To manage personal access tokens:
@y
To manage personal access tokens:
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **Personal access tokens**.
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **Personal access tokens**.
@z

@x
For more information, see
[Create and manage access tokens](/manuals/security/access-tokens/personal-access-tokens.md).
@y
For more information, see
[Create and manage access tokens](manuals/security/access-tokens/personal-access-tokens.md).
@z

@x
## Manage connected accounts
@y
## Manage connected accounts
@z

@x
If you signed up with Google or GitHub, that provider appears under
**Connected accounts**. Disconnecting it removes the OAuth connection. It
doesn't change your Docker ID, and it doesn't let you add a different sign-in
method. You can't connect both Google and GitHub to the same account.
@y
If you signed up with Google or GitHub, that provider appears under
**Connected accounts**. Disconnecting it removes the OAuth connection. It
doesn't change your Docker ID, and it doesn't let you add a different sign-in
method. You can't connect both Google and GitHub to the same account.
@z

@x
To disconnect a connected account:
@y
To disconnect a connected account:
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **Connected accounts**.
1. Select **Disconnect** on your connected account.
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select **Account settings**.
1. Select **Connected accounts**.
1. Select **Disconnect** on your connected account.
@z

@x
To fully unlink your Docker account, you must also unlink Docker from Google
or GitHub. See Google or GitHub's documentation for more information:
@y
To fully unlink your Docker account, you must also unlink Docker from Google
or GitHub. See Google or GitHub's documentation for more information:
@z

@x
- [Manage connections between your Google Account and
  third-parties](https://support.google.com/accounts/answer/13533235?hl=en)
- [Reviewing and revoking authorization of GitHub
  Apps](https://docs.github.com/en/apps/using-github-apps/reviewing-and-revoking-authorization-of-github-apps)
@y
- [Manage connections between your Google Account and
  third-parties](https://support.google.com/accounts/answer/13533235?hl=en)
- [Reviewing and revoking authorization of GitHub
  Apps](https://docs.github.com/en/apps/using-github-apps/reviewing-and-revoking-authorization-of-github-apps)
@z

@x
## Convert your account
@y
## Convert your account
@z

@x
For information on converting your account into an organization, see
[Convert an account into an
organization](/manuals/accounts/organization/setup/convert-account.md).
@y
For information on converting your account into an organization, see
[Convert an account into an
organization](manuals/accounts/organization/setup/convert-account.md).
@z

@x
## Deactivate your account
@y
## Deactivate your account
@z

@x
For information on deactivating your account, see
[Deactivate a Docker account](/manuals/accounts/individual/deactivate-user-account.md).
@y
For information on deactivating your account, see
[Deactivate a Docker account](manuals/accounts/individual/deactivate-user-account.md).
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Docker individual accounts overview](/manuals/accounts/individual/_index.md)
- [Create a Docker account](/manuals/accounts/individual/create-account.md)
- [Enable two-factor authentication](/manuals/security/authentication/2fa/_index.md)
@y
- [Docker individual accounts overview](manuals/accounts/individual/_index.md)
- [Create a Docker account](manuals/accounts/individual/create-account.md)
- [Enable two-factor authentication](manuals/security/authentication/2fa/_index.md)
@z
