%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Connect single sign-on
linkTitle: Connect
description: Connect Docker and your identity provider, test the setup, and enable enforcement
keywords: configure sso, set up sso, docker sso setup, docker identity provider, sso enforcement, docker hub, security
@y
title: Connect single sign-on
linkTitle: Connect
description: Connect Docker and your identity provider, test the setup, and enable enforcement
keywords: configure sso, set up sso, docker sso setup, docker identity provider, sso enforcement, docker hub, security
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
Setting up a single sign-on (SSO) connection involves configuring both Docker
and your identity provider (IdP). This guide walks you through setup
in Docker, setup in your IdP, and final connection.
@y
Setting up a single sign-on (SSO) connection involves configuring both Docker
and your identity provider (IdP). This guide walks you through setup
in Docker, setup in your IdP, and final connection.
@z

@x
> [!TIP]
>
> You’ll copy and paste values between Docker and your IdP. Complete this guide
in one session with separate browser windows open for Docker and your IdP.
@y
> [!TIP]
>
> You’ll copy and paste values between Docker and your IdP. Complete this guide
in one session with separate browser windows open for Docker and your IdP.
@z

@x
## Supported identity providers
@y
## Supported identity providers
@z

@x
Docker supports any SAML 2.0 or OIDC-compatible identity provider. This guide
provides detailed setup instructions for the most commonly
used providers: Okta and Microsoft Entra ID.
@y
Docker supports any SAML 2.0 or OIDC-compatible identity provider. This guide
provides detailed setup instructions for the most commonly
used providers: Okta and Microsoft Entra ID.
@z

@x
If you're using a
different IdP, the general process remains the same:
@y
If you're using a
different IdP, the general process remains the same:
@z

@x
1. Configure the connection in Docker.
1. Set up the application in your IdP using the values from Docker.
1. Complete the connection by entering your IdP's values back into Docker.
1. Test the connection.
@y
1. Configure the connection in Docker.
1. Set up the application in your IdP using the values from Docker.
1. Complete the connection by entering your IdP's values back into Docker.
1. Test the connection.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin:
@y
Before you begin:
@z

@x
- Verify your domain
- Set up an account with your identity provider (IdP)
- Complete the steps in the [Configure single sign-on](configure.md) guide
@y
- Verify your domain
- Set up an account with your identity provider (IdP)
- Complete the steps in the [Configure single sign-on](configure.md) guide
@z

@x
## Step one: Create an SSO connection in Docker
@y
## Step one: Create an SSO connection in Docker
@z

@x
> [!NOTE]
>
> You must [verify at least one domain](/manuals/enterprise/security/single-sign-on/configure.md) before creating an SSO connection.
@y
> [!NOTE]
>
> You must [verify at least one domain](manuals/enterprise/security/single-sign-on/configure.md) before creating an SSO connection.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com) and choose your
organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. Select **Create Connection** and provide a name for the connection.
1. Select an authentication method: **SAML** or **Azure AD (OIDC)**.
1. Copy the required values for your IdP:
    - Okta SAML: **Entity ID**, **ACS URL**
    - Azure OIDC: **Redirect URL**
@y
1. Sign in to [Docker Home](https://app.docker.com) and choose your
organization.
1. Select **Admin Console**, then **SSO and SCIM**.
1. Select **Create Connection** and provide a name for the connection.
1. Select an authentication method: **SAML** or **Azure AD (OIDC)**.
1. Copy the required values for your IdP:
    - Okta SAML: **Entity ID**, **ACS URL**
    - Azure OIDC: **Redirect URL**
@z

@x
Keep this window open to paste values from your IdP later.
@y
Keep this window open to paste values from your IdP later.
@z

@x
## Step two: Create an SSO connection in your IdP
@y
## Step two: Create an SSO connection in your IdP
@z

@x
Use the following tabs based on your IdP provider.
@y
Use the following tabs based on your IdP provider.
@z

@x
{{< tabs >}}
{{< tab name="Okta SAML" >}}
@y
{{< tabs >}}
{{< tab name="Okta SAML" >}}
@z

@x
1. Sign in to your Okta account and open the Admin portal.
1. Select **Administration** and then **Create App Integration**.
1. Select **SAML 2.0**, then **Next**.
1. Name your app "Docker".
1. Optional. Upload a logo.
1. Paste values from Docker:
    - Docker ACS URL -> **Single Sign On URL**
    - Docker Entity ID -> **Audience URI (SP Entity ID)**
1. Configure the following settings:
    - Name ID format: `EmailAddress`
    - Application username: `Email`
    - Update application on: `Create and update`
1. Optional. Add SAML attributes. See [SSO attributes](/manuals/enterprise/security/provisioning/_index.md#sso-attributes).
1. Select **Next**.
1. Select the **This is an internal app that we have created** checkbox.
1. Select **Finish**.
@y
1. Sign in to your Okta account and open the Admin portal.
1. Select **Administration** and then **Create App Integration**.
1. Select **SAML 2.0**, then **Next**.
1. Name your app "Docker".
1. Optional. Upload a logo.
1. Paste values from Docker:
    - Docker ACS URL -> **Single Sign On URL**
    - Docker Entity ID -> **Audience URI (SP Entity ID)**
1. Configure the following settings:
    - Name ID format: `EmailAddress`
    - Application username: `Email`
    - Update application on: `Create and update`
1. Optional. Add SAML attributes. See [SSO attributes](manuals/enterprise/security/provisioning/_index.md#sso-attributes).
1. Select **Next**.
1. Select the **This is an internal app that we have created** checkbox.
1. Select **Finish**.
@z

@x
{{< /tab >}}
{{< tab name="Entra ID SAML 2.0" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID SAML 2.0" >}}
@z

@x
1. Sign in to Microsoft Entra (formerly Azure AD).
1. Select **Default Directory** > **Add** > **Enterprise Application**.
1. Choose **Create your own application**, name it "Docker", and choose **Non-gallery**.
1. After creating your app, go to **Single Sign-On** and select **SAML**.
1. Select **Edit** on the **Basic SAML configuration** section.
1. Edit **Basic SAML configuration** and paste values from Docker:
    - Docker Entity ID -> **Identifier**
    - Docker ACS URL -> **Reply URL**
1. Optional. Add SAML attributes. See [SSO attributes](/manuals/enterprise/security/provisioning/_index.md#sso-attributes).
1. Save the configuration.
1. From the **SAML Signing Certificate** section, download your **Certificate (Base64)**.
@y
1. Sign in to Microsoft Entra (formerly Azure AD).
1. Select **Default Directory** > **Add** > **Enterprise Application**.
1. Choose **Create your own application**, name it "Docker", and choose **Non-gallery**.
1. After creating your app, go to **Single Sign-On** and select **SAML**.
1. Select **Edit** on the **Basic SAML configuration** section.
1. Edit **Basic SAML configuration** and paste values from Docker:
    - Docker Entity ID -> **Identifier**
    - Docker ACS URL -> **Reply URL**
1. Optional. Add SAML attributes. See [SSO attributes](manuals/enterprise/security/provisioning/_index.md#sso-attributes).
1. Save the configuration.
1. From the **SAML Signing Certificate** section, download your **Certificate (Base64)**.
@z

@x
{{< /tab >}}
{{< tab name="Azure Connect (OIDC)" >}}
@y
{{< /tab >}}
{{< tab name="Azure Connect (OIDC)" >}}
@z

@x
### Register the app
@y
### Register the app
@z

@x
1. Sign in to Microsoft Entra (formerly Azure AD).
1. Select **App Registration** > **New Registration**.
1. Name the application "Docker".
1. Set account types and paste the **Redirect URI** from Docker.
1. Select **Register**.
1. Copy the **Client ID**.
@y
1. Sign in to Microsoft Entra (formerly Azure AD).
1. Select **App Registration** > **New Registration**.
1. Name the application "Docker".
1. Set account types and paste the **Redirect URI** from Docker.
1. Select **Register**.
1. Copy the **Client ID**.
@z

@x
### Create client secrets
@y
### Create client secrets
@z

@x
1. In your app, go to **Certificates & secrets**.
1. Select **New client secret**, describe and configure duration, then **Add**.
1. Copy the **value** of the new secret.
@y
1. In your app, go to **Certificates & secrets**.
1. Select **New client secret**, describe and configure duration, then **Add**.
1. Copy the **value** of the new secret.
@z

@x
### Set API permissions
@y
### Set API permissions
@z

@x
1. In your app, go to **API permissions**.
1. Select **Grant admin consent** and confirm.
1. Select **Add a permissions** > **Delegated permissions**.
1. Search and select `User.Read`.
1. Confirm that admin consent is granted.
@y
1. In your app, go to **API permissions**.
1. Select **Grant admin consent** and confirm.
1. Select **Add a permissions** > **Delegated permissions**.
1. Search and select `User.Read`.
1. Confirm that admin consent is granted.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step three: Connect Docker to your IdP
@y
## Step three: Connect Docker to your IdP
@z

@x
Complete the integration by pasting your IdP values into Docker.
@y
Complete the integration by pasting your IdP values into Docker.
@z

@x
{{< tabs >}}
{{< tab name="Okta SAML" >}}
@y
{{< tabs >}}
{{< tab name="Okta SAML" >}}
@z

@x
1. In Okta, select your app and go to **View SAML setup instructions**.
1. Copy the **SAML Sign-in URL** and **x509 Certificate**.
@y
1. In Okta, select your app and go to **View SAML setup instructions**.
1. Copy the **SAML Sign-in URL** and **x509 Certificate**.
@z

@x
    > [!IMPORTANT]
    >
    > Copy the entire certificate, including `----BEGIN CERTIFICATE----` and `----END CERTIFICATE----` lines.
1. Return to the Docker Admin Console.
1. Paste the **SAML Sign-in URL** and **x509 Certificate** values.
1. Optional. Select a default team.
1. Review and select **Create connection**.
@y
    > [!IMPORTANT]
    >
    > Copy the entire certificate, including `----BEGIN CERTIFICATE----` and `----END CERTIFICATE----` lines.
1. Return to the Docker Admin Console.
1. Paste the **SAML Sign-in URL** and **x509 Certificate** values.
1. Optional. Select a default team.
1. Review and select **Create connection**.
@z

@x
{{< /tab >}}
{{< tab name="Entra ID SAML 2.0" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID SAML 2.0" >}}
@z

@x
1. Open your downloaded **Certificate (Base64)** in a text editor.
1. Copy the following values:
    - From Azure AD: **Login URL**
    - **Certificate (Base64)** contents
@y
1. Open your downloaded **Certificate (Base64)** in a text editor.
1. Copy the following values:
    - From Azure AD: **Login URL**
    - **Certificate (Base64)** contents
@z

@x
    > [!IMPORTANT]
    >
    > Copy the entire certificate, including `----BEGIN CERTIFICATE----` and `----END CERTIFICATE----` lines.
1. Return to the Docker Admin Console.
1. Paste the **Login URL** and **Certificate (Base64)** values.
1. Optional. Select a default team.
1. Review and select **Create connection**.
@y
    > [!IMPORTANT]
    >
    > Copy the entire certificate, including `----BEGIN CERTIFICATE----` and `----END CERTIFICATE----` lines.
1. Return to the Docker Admin Console.
1. Paste the **Login URL** and **Certificate (Base64)** values.
1. Optional. Select a default team.
1. Review and select **Create connection**.
@z

@x
{{< /tab >}}
{{< tab name="Azure Connect (OIDC)" >}}
@y
{{< /tab >}}
{{< tab name="Azure Connect (OIDC)" >}}
@z

@x
1. Return to the Docker Admin Console.
1. Paste the following values:
    - **Client ID**
    - **Client Secret**
    - **Azure AD Domain**
1. Optional. Select a default team.
1. Review and select **Create connection**.
@y
1. Return to the Docker Admin Console.
1. Paste the following values:
    - **Client ID**
    - **Client Secret**
    - **Azure AD Domain**
1. Optional. Select a default team.
1. Review and select **Create connection**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Step four: Test the connection
@y
## Step four: Test the connection
@z

@x
1. Open an incognito browser window.
1. Sign in to the Admin Console using your **domain email address**.
1. The browser will redirect to your identity provider's sign in page to authenticate. If you have [multiple IdPs](#optional-configure-multiple-idps), choose the sign sign-in option **Continue with SSO**.
1. Authenticate through your domain email instead of using your Docker ID.
@y
1. Open an incognito browser window.
1. Sign in to the Admin Console using your **domain email address**.
1. The browser will redirect to your identity provider's sign in page to authenticate. If you have [multiple IdPs](#optional-configure-multiple-idps), choose the sign sign-in option **Continue with SSO**.
1. Authenticate through your domain email instead of using your Docker ID.
@z

@x
If you're using the CLI, you must authenticate using a personal access token.
@y
If you're using the CLI, you must authenticate using a personal access token.
@z

@x
## Optional: Configure multiple IdPs
@y
## Optional: Configure multiple IdPs
@z

@x
Docker supports multiple IdP configurations. To use multiple IdPs with one domain:
@y
Docker supports multiple IdP configurations. To use multiple IdPs with one domain:
@z

@x
- Repeat Steps 1-4 on this page for each IdP.
- Each connection must use the same domain.
- Users will select **Continue with SSO** to choose their IdP at sign in.
@y
- Repeat Steps 1-4 on this page for each IdP.
- Each connection must use the same domain.
- Users will select **Continue with SSO** to choose their IdP at sign in.
@z

@x
## Optional: Enforce SSO
@y
## Optional: Enforce SSO
@z

@x
> [!IMPORTANT]
>
> If SSO is not enforced, users can still sign in using Docker usernames and passwords.
@y
> [!IMPORTANT]
>
> If SSO is not enforced, users can still sign in using Docker usernames and passwords.
@z

@x
Enforcing SSO requires users to use SSO when signing into Docker. This centralizes authentication and enforces policies set by the IdP.
@y
Enforcing SSO requires users to use SSO when signing into Docker. This centralizes authentication and enforces policies set by the IdP.
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select
your organization or company.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the SSO connections table, select the **Action** menu, then **Enable enforcement**.
1. Follow the on-screen instructions.
1. Select **Turn on enforcement**.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select
your organization or company.
1. Select **Admin Console**, then **SSO and SCIM**.
1. In the SSO connections table, select the **Action** menu, then **Enable enforcement**.
1. Follow the on-screen instructions.
1. Select **Turn on enforcement**.
@z

@x
When SSO is enforced, your users are unable to modify their email address and
password, convert a user account to an organization, or set up 2FA through
Docker Hub. If you want to use 2FA, you must enable 2FA through your IdP.
@y
When SSO is enforced, your users are unable to modify their email address and
password, convert a user account to an organization, or set up 2FA through
Docker Hub. If you want to use 2FA, you must enable 2FA through your IdP.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Provision users](/manuals/enterprise/security/provisioning/_index.md).
- [Enforce sign-in](../enforce-sign-in/_index.md).
- [Create personal access tokens](/manuals/enterprise/security/access-tokens.md).
- [Troubleshoot SSO](/manuals/enterprise/troubleshoot/troubleshoot-sso.md) issues.
@y
- [Provision users](manuals/enterprise/security/provisioning/_index.md).
- [Enforce sign-in](../enforce-sign-in/_index.md).
- [Create personal access tokens](manuals/enterprise/security/access-tokens.md).
- [Troubleshoot SSO](manuals/enterprise/troubleshoot/troubleshoot-sso.md) issues.
@z
