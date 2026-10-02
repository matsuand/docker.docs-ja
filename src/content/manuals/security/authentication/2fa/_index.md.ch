%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Two-factor authentication for your individual Docker account
linkTitle: Two-factor authentication
description: >-
  Learn how two-factor authentication protects a Docker account, when Docker
  asks for the code, and what the recovery code does.
keywords: two-factor authentication, 2FA, individual Docker account, TOTP,
  authenticator app, authentication code, recovery code, personal access
  token, docker login, Account settings, Docker Hub, account security
@y
title: Two-factor authentication for your individual Docker account
linkTitle: Two-factor authentication
description: >-
  Learn how two-factor authentication protects a Docker account, when Docker
  asks for the code, and what the recovery code does.
keywords: two-factor authentication, 2FA, individual Docker account, TOTP,
  authenticator app, authentication code, recovery code, personal access
  token, docker login, Account settings, Docker Hub, account security
@z

% grid:

@x
  - title: Turn 2FA on or off
    description: >-
      Set up an authenticator app, save the recovery code, or turn 2FA off.
    icon: device-phone-mobile
    link: /security/authentication/2fa/manage/
@y
  - title: Turn 2FA on or off
    description: >-
      Set up an authenticator app, save the recovery code, or turn 2FA off.
    icon: device-phone-mobile
    link: __SUBDIR__/security/authentication/2fa/manage/
@z

@x
  - title: Recover your account
    description: >-
      Sign in with a recovery code, generate a new one, or contact Support.
    icon: key
    link: /security/authentication/2fa/recover-hub-account/
@y
  - title: Recover your account
    description: >-
      Sign in with a recovery code, generate a new one, or contact Support.
    icon: key
    link: __SUBDIR__/security/authentication/2fa/recover-hub-account/
@z

@x
{{< summary-bar feature_name="2FA" >}}
@y
{{< summary-bar feature_name="2FA" >}}
@z

@x
Two-factor authentication (2FA) adds a code from an authenticator app to
your password when you sign in to your Docker account. Someone who knows
your password still needs the code from your device to sign in.
@y
Two-factor authentication (2FA) adds a code from an authenticator app to
your password when you sign in to your Docker account. Someone who knows
your password still needs the code from your device to sign in.
@z

@x
> [!TIP]
>
> Organization and company settings do not include 2FA. To control how
> members sign in across an organization, use
> [single sign-on](/manuals/security/authentication/single-sign-on/_index.md).
@y
> [!TIP]
>
> Organization and company settings do not include 2FA. To control how
> members sign in across an organization, use
> [single sign-on](manuals/security/authentication/single-sign-on/_index.md).
@z

@x
## How two-factor authentication works
@y
## How two-factor authentication works
@z

@x
When you turn on 2FA, you pair a time-based one-time password (TOTP)
authenticator app with your account by scanning a QR code or entering a
text code. Any authenticator app that supports TOTP works. Docker keeps
one authenticator per account.
@y
When you turn on 2FA, you pair a time-based one-time password (TOTP)
authenticator app with your account by scanning a QR code or entering a
text code. Any authenticator app that supports TOTP works. Docker keeps
one authenticator per account.
@z

@x
After repeated wrong codes, Docker returns `Too many failed login
attempts` and blocks further attempts for a short time.
@y
After repeated wrong codes, Docker returns `Too many failed login
attempts` and blocks further attempts for a short time.
@z

@x
## When Docker asks for the code
@y
## When Docker asks for the code
@z

@x
| Sign-in | What Docker asks for |
| --- | --- |
| Browser sign-in to Docker Home or Docker Hub | Your password, then the code from your authenticator app |
| `docker login` with no username | The same browser sign-in, if the browser is not already signed in |
| `docker login -u`, scripts, and CI | A [personal access token](/manuals/security/access-tokens/personal-access-tokens.md) in the password prompt. Password sign-in from the CLI is not supported when 2FA is on |
@y
| Sign-in | What Docker asks for |
| --- | --- |
| Browser sign-in to Docker Home or Docker Hub | Your password, then the code from your authenticator app |
| `docker login` with no username | The same browser sign-in, if the browser is not already signed in |
| `docker login -u`, scripts, and CI | A [personal access token](manuals/security/access-tokens/personal-access-tokens.md) in the password prompt. Password sign-in from the CLI is not supported when 2FA is on |
@z

@x
## Recovery code
@y
## Recovery code
@z

@x
Docker gives you one recovery code when you turn on 2FA. The code signs
you in if you lose your authenticator app, so copy, download, or print it
and store it somewhere safe.
@y
Docker gives you one recovery code when you turn on 2FA. The code signs
you in if you lose your authenticator app, so copy, download, or print it
and store it somewhere safe.
@z

@x
Docker emails the verified address on your account when you turn 2FA on
or off, when a recovery code is generated, and when a recovery code is
used to sign in. The email does not contain the code.
@y
Docker emails the verified address on your account when you turn 2FA on
or off, when a recovery code is generated, and when a recovery code is
used to sign in. The email does not contain the code.
@z

@x
## Next steps
@y
## Next steps
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
