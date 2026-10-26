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
description: Update your profile, email, password, and connected Google or
  GitHub accounts
keywords:
  manage docker account, account settings, account information, full name,
  update email, verify email, change password, reset password, Google,
  GitHub, connected accounts, two-factor authentication, personal access
  tokens, convert account, deactivate account, Docker Home
@y
description: Update your profile, email, password, and connected Google or
  GitHub accounts
keywords:
  manage docker account, account settings, account information, full name,
  update email, verify email, change password, reset password, Google,
  GitHub, connected accounts, two-factor authentication, personal access
  tokens, convert account, deactivate account, Docker Home
@z

@x
Update your profile, email, password, and Google or GitHub sign-in.
@y
Update your profile, email, password, and Google or GitHub sign-in.
@z

@x
## Update account information
@y
## Update account information
@z

@x
Other Docker users can see your account information.
@y
Other Docker users can see your account information.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select
   **Account settings**.
1. Select **Account information**.
1. Update any of these fields, then select **Save**:
   - **Full name**
   - **Company**
   - **Location**
   - **Website**
   - **Gravatar email**
@y
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select
   **Account settings**.
1. Select **Account information**.
1. Update any of these fields, then select **Save**:
   - **Full name**
   - **Company**
   - **Location**
   - **Website**
   - **Gravatar email**
@z

@x
## Update email address
@y
## Update email address
@z

@x
A Docker account has one verified email address. If your account uses
single sign-on (SSO) or System for Cross-domain Identity Management
(SCIM) provisioning, contact your administrator to change your email.
@y
A Docker account has one verified email address. If your account uses
single sign-on (SSO) or System for Cross-domain Identity Management
(SCIM) provisioning, contact your administrator to change your email.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select
   **Account settings**.
1. Select **Email**.
1. Enter the new address in **New email address**.
1. Enter your password in **Enter your password to confirm**.
1. Select **Verify email**.
1. Enter the six-digit code in **Enter code**. The code expires after 15
   minutes.
1. Sign in again to finish the update.
@y
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select
   **Account settings**.
1. Select **Email**.
1. Enter the new address in **New email address**.
1. Enter your password in **Enter your password to confirm**.
1. Select **Verify email**.
1. Enter the six-digit code in **Enter code**. The code expires after 15
   minutes.
1. Sign in again to finish the update.
@z

@x
## Change your password
@y
## Change your password
@z

@x
If your account uses single sign-on (SSO), contact your administrator to
change your password.
@y
If your account uses single sign-on (SSO), contact your administrator to
change your password.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select
   **Account settings**.
1. Select **Password**.
1. Select **Reset password**.
@y
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select
   **Account settings**.
1. Select **Password**.
1. Select **Reset password**.
@z

@x
Docker emails you instructions to reset your password.
@y
Docker emails you instructions to reset your password.
@z

@x
You can also
[update or delete personal access tokens](/manuals/security/access-tokens/personal-access-tokens.md#update-or-delete)
and
[update your two-factor authentication](/manuals/security/authentication/2fa/manage.md#disable-two-factor-authentication).
@y
You can also
[update or delete personal access tokens](manuals/security/access-tokens/personal-access-tokens.md#update-or-delete)
and
[update your two-factor authentication](manuals/security/authentication/2fa/manage.md#disable-two-factor-authentication).
@z

@x
## Manage connected accounts
@y
## Manage connected accounts
@z

@x
Google or GitHub appears under **Connected accounts** after you connect
that provider. There is no connect button on this page. You connect by
signing in with the provider.
@y
Google or GitHub appears under **Connected accounts** after you connect
that provider. There is no connect button on this page. You connect by
signing in with the provider.
@z

@x
### Connect provider
@y
### Connect provider
@z

@x
> [!IMPORTANT]
>
> If the Google or GitHub email does not match your Docker account email,
> Docker starts a new sign-up and creates a second account instead of
> linking the provider.
@y
> [!IMPORTANT]
>
> If the Google or GitHub email does not match your Docker account email,
> Docker starts a new sign-up and creates a second account instead of
> linking the provider.
@z

@x
Sign in with Google or GitHub using the same email as your Docker account
to add that provider as a sign-in method.
@y
Sign in with Google or GitHub using the same email as your Docker account
to add that provider as a sign-in method.
@z

@x
1. Sign out of Docker if you are already signed in.
1. Go to the [Docker sign-in page](https://app.docker.com/login).
1. Select **Continue with Google** or **Continue with GitHub**.
1. Choose a Google or GitHub account that uses the same email address as
   your Docker account, then finish the provider sign-in.
@y
1. Sign out of Docker if you are already signed in.
1. Go to the [Docker sign-in page](https://app.docker.com/login).
1. Select **Continue with Google** or **Continue with GitHub**.
1. Choose a Google or GitHub account that uses the same email address as
   your Docker account, then finish the provider sign-in.
@z

@x
Docker links the provider to your account and emails you a confirmation.
The provider then appears in **Connected accounts** under **Account
settings**.
@y
Docker links the provider to your account and emails you a confirmation.
The provider then appears in **Connected accounts** under **Account
settings**.
@z

@x
### Disconnect provider
@y
### Disconnect provider
@z

@x
Remove Google or GitHub as a sign-in method from **Connected accounts**.
Your Docker ID stays the same.
@y
Remove Google or GitHub as a sign-in method from **Connected accounts**.
Your Docker ID stays the same.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select
   **Account settings**.
1. Select **Connected accounts**.
1. Select **Disconnect** on that provider.
@y
1. Sign in to [Docker Home](https://app.docker.com/login).
1. Select your avatar in the top-right corner and select
   **Account settings**.
1. Select **Connected accounts**.
1. Select **Disconnect** on that provider.
@z

@x
To remove Docker from the Google or GitHub account, see that provider's
documentation:
@y
To remove Docker from the Google or GitHub account, see that provider's
documentation:
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
## Next steps
@y
## Next steps
@z

@x
- [Manage two-factor authentication](/manuals/security/authentication/2fa/manage.md)
- [Create and manage personal access tokens](/manuals/security/access-tokens/personal-access-tokens.md)
- [Convert a Docker account to an organization](/manuals/accounts/organization/setup/convert-account.md)
@y
- [Manage two-factor authentication](manuals/security/authentication/2fa/manage.md)
- [Create and manage personal access tokens](manuals/security/access-tokens/personal-access-tokens.md)
- [Convert a Docker account to an organization](manuals/accounts/organization/setup/convert-account.md)
@z
