%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn how to enable two-factor authentication on Docker Hub
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor
  authentication
title: Enable two-factor authentication for Docker Hub
aliases:
- /docker-hub/2fa/
---
@y
---
description: Learn how to enable two-factor authentication on Docker Hub
keywords: Docker, docker, registry, security, Docker Hub, authentication, two-factor
  authentication
title: Enable two-factor authentication for Docker Hub
aliases:
- /docker-hub/2fa/
---
@z

@x
Two-factor authentication adds an extra layer of security to your Docker Hub
account by requiring a unique security code when you sign in to your account. The
security code is required in addition to your password.
@y
Two-factor authentication adds an extra layer of security to your Docker Hub
account by requiring a unique security code when you sign in to your account. The
security code is required in addition to your password.
@z

@x
When you enable two-factor authentication, you are also provided with a recovery
code. Each recovery code is unique and specific to your account. You can use
this code to recover your account in case you lose access to your authenticator
app. See [Recover your Docker Hub account](recover-hub-account/).
@y
When you enable two-factor authentication, you are also provided with a recovery
code. Each recovery code is unique and specific to your account. You can use
this code to recover your account in case you lose access to your authenticator
app. See [Recover your Docker Hub account](recover-hub-account/).
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
You need a mobile phone with a time-based one-time password (TOTP) authenticator
application installed. Common examples include Google Authenticator or Yubico
Authenticator with a registered YubiKey.
@y
You need a mobile phone with a time-based one-time password (TOTP) authenticator
application installed. Common examples include Google Authenticator or Yubico
Authenticator with a registered YubiKey.
@z

@x
## Enable two-factor authentication
@y
## Enable two-factor authentication
@z

@x
1. Sign in to your Docker Hub account. 
2. Select your avatar and then from the drop-down menu, select **Account settings**. 
3. Select the **Security** tab and then select **Enable Two-Factor Authentication**.
4. Enter your account password, then select **Confirm**.
5. Save your recovery code and store it somewhere safe. You can use your recovery code to recover your account in the event you lose access to your authenticator app.
6. Use a TOTP mobile app to scan the QR code or enter the text code.
7. Once you've linked your authenticator app, enter the six-digit code in the text-field.
8. Select **Enable 2FA**.
@y
1. Sign in to your Docker Hub account. 
2. Select your avatar and then from the drop-down menu, select **Account settings**. 
3. Select the **Security** tab and then select **Enable Two-Factor Authentication**.
4. Enter your account password, then select **Confirm**.
5. Save your recovery code and store it somewhere safe. You can use your recovery code to recover your account in the event you lose access to your authenticator app.
6. Use a TOTP mobile app to scan the QR code or enter the text code.
7. Once you've linked your authenticator app, enter the six-digit code in the text-field.
8. Select **Enable 2FA**.
@z

@x
Two-factor authentication is now enabled. The next time you sign
in to your Docker Hub account, you are asked for a security code.
@y
Two-factor authentication is now enabled. The next time you sign
in to your Docker Hub account, you are asked for a security code.
@z
