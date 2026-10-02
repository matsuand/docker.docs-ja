%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Manage two-factor authentication for your Docker account
linkTitle: Manage
description: >-
  Turn on two-factor authentication for your Docker account, save the
  recovery code, move 2FA to a new device, or turn 2FA off.
keywords: enable 2FA, disable 2FA, turn on 2FA, turn off 2FA, two-factor
  authentication, Docker account, TOTP, authenticator app, QR code,
  recovery code, new device, personal access token, Docker Hub
@y
title: Manage two-factor authentication for your Docker account
linkTitle: Manage
description: >-
  Turn on two-factor authentication for your Docker account, save the
  recovery code, move 2FA to a new device, or turn 2FA off.
keywords: enable 2FA, disable 2FA, turn on 2FA, turn off 2FA, two-factor
  authentication, Docker account, TOTP, authenticator app, QR code,
  recovery code, new device, personal access token, Docker Hub
@z

@x
{{< summary-bar feature_name="2FA" >}}
@y
{{< summary-bar feature_name="2FA" >}}
@z

@x
Turn two-factor authentication (2FA) on or off for your Docker account
in **Account settings**. For how 2FA works, when Docker asks for the
code, and what the recovery code does, see
[Two-factor authentication][overview].
@y
Turn two-factor authentication (2FA) on or off for your Docker account
in **Account settings**. For how 2FA works, when Docker asks for the
code, and what the recovery code does, see
[Two-factor authentication][overview].
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you turn on 2FA, you need:
@y
Before you turn on 2FA, you need:
@z

@x
- A time-based one-time password (TOTP) authenticator app on your phone or
  another device
- Your Docker account password
- A verified email address on your account
@y
- A time-based one-time password (TOTP) authenticator app on your phone or
  another device
- Your Docker account password
- A verified email address on your account
@z

@x
## Enable two-factor authentication
@y
## Enable two-factor authentication
@z

@x
To turn on 2FA for your Docker account:
@y
To turn on 2FA for your Docker account:
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner, then select **Account
   settings**.
1. Select **2FA**.
1. Enter your account password, then select **Confirm**.
1. Save your recovery code. Select **Copy**, or open the menu next to
   **Copy** and select **Download** or **Print**.
1. Open your authenticator app. Scan the code on the **QR Code** tab, or
   enter the code from the **Text Code** tab.
1. Enter the six-digit code from your authenticator app in
   **Authentication code**.
1. Select **Enable 2FA**.
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner, then select **Account
   settings**.
1. Select **2FA**.
1. Enter your account password, then select **Confirm**.
1. Save your recovery code. Select **Copy**, or open the menu next to
   **Copy** and select **Download** or **Print**.
1. Open your authenticator app. Scan the code on the **QR Code** tab, or
   enter the code from the **Text Code** tab.
1. Enter the six-digit code from your authenticator app in
   **Authentication code**.
1. Select **Enable 2FA**.
@z

@x
Two-factor authentication is on. When you sign in with your password,
Docker asks for a code from your authenticator app. Docker also emails
you a reminder to save your recovery code.
@y
Two-factor authentication is on. When you sign in with your password,
Docker asks for a code from your authenticator app. Docker also emails
you a reminder to save your recovery code.
@z

@x
## Disable two-factor authentication
@y
## Disable two-factor authentication
@z

@x
> [!WARNING]
>
> Turning off 2FA leaves your account protected by your password alone.
@y
> [!WARNING]
>
> Turning off 2FA leaves your account protected by your password alone.
@z

@x
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner, then select **Account
   settings**.
1. Select **2FA**.
1. Enter your password, then select **Confirm**.
1. Select **Disable 2FA**.
@y
1. Sign in to your [Docker account](https://app.docker.com/login).
1. Select your avatar in the top-right corner, then select **Account
   settings**.
1. Select **2FA**.
1. Enter your password, then select **Confirm**.
1. Select **Disable 2FA**.
@z

@x
Two-factor authentication is off. Docker emails you to confirm the
change.
@y
Two-factor authentication is off. Docker emails you to confirm the
change.
@z

@x
## Move 2FA to a new device
@y
## Move 2FA to a new device
@z

@x
To move 2FA to a new phone or device,
[turn 2FA off](#disable-two-factor-authentication), then
[turn it on again](#enable-two-factor-authentication) from the new
device.
@y
To move 2FA to a new phone or device,
[turn 2FA off](#disable-two-factor-authentication), then
[turn it on again](#enable-two-factor-authentication) from the new
device.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Recover your account][recover] if you lose your authenticator app or
  recovery code.
- Create a [personal access token][pat] to sign in from the Docker CLI,
  scripts, and CI.
@y
- [Recover your account][recover] if you lose your authenticator app or
  recovery code.
- Create a [personal access token][pat] to sign in from the Docker CLI,
  scripts, and CI.
@z

@x
[overview]: /manuals/security/authentication/2fa/_index.md
[pat]: /manuals/security/access-tokens/personal-access-tokens.md
[recover]: /manuals/security/authentication/2fa/recover-hub-account.md
@y
[overview]: /manuals/security/authentication/2fa/_index.md
[pat]: /manuals/security/access-tokens/personal-access-tokens.md
[recover]: /manuals/security/authentication/2fa/recover-hub-account.md
@z
