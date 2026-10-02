%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Recover your Docker account and two-factor recovery code
linkTitle: Recover your account
description: >-
  Sign in with a recovery code, generate a new recovery code, or contact
  Support when you lose your authenticator app.
keywords: account recovery, two-factor authentication, 2FA, recovery code,
  Lost Authentication Device, lost authenticator app, 2FA lockout, Docker
  account, Generate new code, Docker Support
@y
title: Recover your Docker account and two-factor recovery code
linkTitle: Recover your account
description: >-
  Sign in with a recovery code, generate a new recovery code, or contact
  Support when you lose your authenticator app.
keywords: account recovery, two-factor authentication, 2FA, recovery code,
  Lost Authentication Device, lost authenticator app, 2FA lockout, Docker
  account, Generate new code, Docker Support
@z

@x
{{< summary-bar feature_name="2FA" >}}
@y
{{< summary-bar feature_name="2FA" >}}
@z

@x
Get back into your Docker account when you lose your authenticator app,
your recovery code, or both. Docker asks for your password before it
shows or replaces the recovery code.
@y
Get back into your Docker account when you lose your authenticator app,
your recovery code, or both. Docker asks for your password before it
shows or replaces the recovery code.
@z

@x
> [!IMPORTANT]
>
> The recovery code works once. Using it on the **Lost Authentication
> Device** page signs you in, turns 2FA off, and deletes the code. Turn
> 2FA on again from your new device as soon as you're signed in.
@y
> [!IMPORTANT]
>
> The recovery code works once. Using it on the **Lost Authentication
> Device** page signs you in, turns 2FA off, and deletes the code. Turn
> 2FA on again from your new device as soon as you're signed in.
@z

@x
## Generate a new recovery code
@y
## Generate a new recovery code
@z

@x
If you lost your recovery code and can still sign in, generate a new one.
The new code replaces the previous code.
@y
If you lost your recovery code and can still sign in, generate a new one.
The new code replaces the previous code.
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login). Enter
   your password, then the code from your authenticator app.
1. Select your avatar in the top-right corner, then select **Account
   settings**.
1. Select **2FA**.
1. Enter your password, then select **Confirm**.
1. Select **Generate new code**.
@y
1. Sign in to your [Docker account](https://app.docker.com/login). Enter
   your password, then the code from your authenticator app.
1. Select your avatar in the top-right corner, then select **Account
   settings**.
1. Select **2FA**.
1. Enter your password, then select **Confirm**.
1. Select **Generate new code**.
@z

@x
Select the visibility icon to view the new code. Then select **Copy**,
**Download**, or **Print**, and store the code somewhere safe.
@y
Select the visibility icon to view the new code. Then select **Copy**,
**Download**, or **Print**, and store the code somewhere safe.
@z

@x
## Sign in with your recovery code
@y
## Sign in with your recovery code
@z

@x
If you lost your authenticator app and still have your recovery code, use
the code to sign in.
@y
If you lost your authenticator app and still have your recovery code, use
the code to sign in.
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login) with your
   username and password.
1. On the **Two-Factor Authentication** page, select **I've lost my
   authentication device**.
1. Enter your recovery code, then select **Verify**.
@y
1. Sign in to your [Docker account](https://app.docker.com/login) with your
   username and password.
1. On the **Two-Factor Authentication** page, select **I've lost my
   authentication device**.
1. Enter your recovery code, then select **Verify**.
@z

@x
You're signed in and 2FA is off. To protect your account again, follow
[Turn on 2FA][enable].
@y
You're signed in and 2FA is off. To protect your account again, follow
[Turn on 2FA][enable].
@z

@x
## Contact Docker Support
@y
## Contact Docker Support
@z

@x
If you lost both your authenticator app and your recovery code, open the
[Contact Support form](https://hub.docker.com/support/contact/?category=2fa-lockout).
The subject and description already describe a 2FA lockout. Enter the
email address on your Docker account, then follow the instructions from
Docker Support.
@y
If you lost both your authenticator app and your recovery code, open the
[Contact Support form](https://hub.docker.com/support/contact/?category=2fa-lockout).
The subject and description already describe a 2FA lockout. Enter the
email address on your Docker account, then follow the instructions from
Docker Support.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Turn on 2FA][enable] again after you recover your account.
- Create a [personal access token][pat] for the Docker CLI and automation.
@y
- [Turn on 2FA][enable] again after you recover your account.
- Create a [personal access token][pat] for the Docker CLI and automation.
@z

@x
[enable]: /manuals/security/authentication/2fa/manage.md
[pat]: /manuals/security/access-tokens/personal-access-tokens.md
@y
[enable]: /manuals/security/authentication/2fa/manage.md
[pat]: /manuals/security/access-tokens/personal-access-tokens.md
@z
