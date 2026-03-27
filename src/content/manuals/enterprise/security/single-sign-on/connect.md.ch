%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Set up single sign-on
linkTitle: Set up
@y
title: Set up single sign-on
linkTitle: Set up
@z

@x
description: Connect Docker and your identity provider, test the setup, and enable enforcement
keywords: configure sso, set up sso, docker sso setup, docker identity provider, sso enforcement, docker hub, security
@y
description: Connect Docker and your identity provider, test the setup, and enable enforcement
keywords: configure sso, set up sso, docker sso setup, docker identity provider, sso enforcement, docker hub, security
@z

@x
{{< summary-bar feature_name="SSO" >}}
@y
{{< summary-bar feature_name="SSO" >}}
@z

@x
To set up a single sign-on (SSO), you need to establish a connection between Docker
and your identity provider (IdP). While this guide
uses Okta and Microsoft Entra ID as a working example, the general process remains the same for other IdPs. 
@y
To set up a single sign-on (SSO), you need to establish a connection between Docker
and your identity provider (IdP). While this guide
uses Okta and Microsoft Entra ID as a working example, the general process remains the same for other IdPs. 
@z

@x
If you're unfamiliar with the SSO process, first review [SSO overview](/enterprise/security/single-sign-on/) to learn about how SSO works. 
@y
If you're unfamiliar with the SSO process, first review [SSO overview](__SUBDIR__/enterprise/security/single-sign-on/) to learn about how SSO works. 
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Docker supports any SAML 2.0 or OIDC-compatible identity provider. Before you begin, make sure the following conditions are met:
@y
Docker supports any SAML 2.0 or OIDC-compatible identity provider. Before you begin, make sure the following conditions are met:
@z

@x
- Notify your company about the upcoming SSO sign-in process.
- Confirm that each Docker user has a valid IdP account using the same
email address as their Unique Primary Identifier (UPN).
- Ensure CI/CD pipelines use PATs or OATs instead of passwords.
@y
- Notify your company about the upcoming SSO sign-in process.
- Confirm that each Docker user has a valid IdP account using the same
email address as their Unique Primary Identifier (UPN).
- Ensure CI/CD pipelines use PATs or OATs instead of passwords.
@z

@x
## Set up an SSO connection 
@y
## Set up an SSO connection 
@z

@x
> [!TIP]
> These procedures have you copy and paste values between Docker and your IdP. Complete this guide in one session with separate browser windows open for Docker and your IdP. 
@y
> [!TIP]
> These procedures have you copy and paste values between Docker and your IdP. Complete this guide in one session with separate browser windows open for Docker and your IdP. 
@z

@x
### Step 1: Add a domain
@y
### Step 1: Add a domain
@z

@x
To add a domain:
@y
To add a domain:
@z

@x
1. Sign in to [app.docker.com](https://app.docker.com), then choose your
organization. If your organization is part of a company, then select the company to manage
the domain at the company level.
1. Select **Admin Console**, then **Domain management**.
1. Select **Add a domain**.
1. Enter your domain in the text box and select **Add domain**.
1. In the modal, copy the **TXT Record Value** provided for domain verification.
@y
1. Sign in to [app.docker.com](https://app.docker.com), then choose your
organization. If your organization is part of a company, then select the company to manage
the domain at the company level.
1. Select **Admin Console**, then **Domain management**.
1. Select **Add a domain**.
1. Enter your domain in the text box and select **Add domain**.
1. In the modal, copy the **TXT Record Value** provided for domain verification.
@z

@x
### Step 2: Verify your domain
@y
### Step 2: Verify your domain
@z

@x
To confirm domain ownership, add a TXT record to your Domain Name System (DNS)
host using the TXT Record Value from Docker. DNS propagation can take up to
72 hours. Docker automatically checks for the record during this time.
@y
To confirm domain ownership, add a TXT record to your Domain Name System (DNS)
host using the TXT Record Value from Docker. DNS propagation can take up to
72 hours. Docker automatically checks for the record during this time.
@z

@x
> [!TIP]
>
> When adding a record name, use `@` or leave it empty for root domains like `example.com`. Avoid common values like `docker`, `docker-verification`, `www`, or your domain name itself. Always check your DNS provider's documentation to verify their specific record name requirements.
@y
> [!TIP]
>
> When adding a record name, use `@` or leave it empty for root domains like `example.com`. Avoid common values like `docker`, `docker-verification`, `www`, or your domain name itself. Always check your DNS provider's documentation to verify their specific record name requirements.
@z

@x
{{< tabs >}}
{{< tab name="AWS Route 53" >}}
@y
{{< tabs >}}
{{< tab name="AWS Route 53" >}}
@z

@x
1. To add your TXT record to AWS, see [Creating records by using the Amazon Route 53 console](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-creating.html).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@y
1. To add your TXT record to AWS, see [Creating records by using the Amazon Route 53 console](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-creating.html).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@z

@x
{{< /tab >}}
{{< tab name="Google Cloud DNS" >}}
@y
{{< /tab >}}
{{< tab name="Google Cloud DNS" >}}
@z

@x
1. To add your TXT record to Google Cloud DNS, see [Verifying your domain with a TXT record](https://cloud.google.com/identity/docs/verify-domain-txt).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@y
1. To add your TXT record to Google Cloud DNS, see [Verifying your domain with a TXT record](https://cloud.google.com/identity/docs/verify-domain-txt).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@z

@x
{{< /tab >}}
{{< tab name="GoDaddy" >}}
@y
{{< /tab >}}
{{< tab name="GoDaddy" >}}
@z

@x
1. To add your TXT record to GoDaddy, see [Add a TXT record](https://www.godaddy.com/help/add-a-txt-record-19232).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@y
1. To add your TXT record to GoDaddy, see [Add a TXT record](https://www.godaddy.com/help/add-a-txt-record-19232).
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@z

@x
{{< /tab >}}
{{< tab name="Other providers" >}}
@y
{{< /tab >}}
{{< tab name="Other providers" >}}
@z

@x
1. Sign in to your domain host.
1. Add a TXT record to your DNS settings and save the record.
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@y
1. Sign in to your domain host.
1. Add a TXT record to your DNS settings and save the record.
1. Wait up to 72 hours for TXT record verification.
1. After the record is live, go to **Domain management** in the [Admin Console](https://app.docker.com/admin) and select **Verify**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Step 3: Create an SSO connection in Docker
@y
### Step 3: Create an SSO connection in Docker
@z

@x
1. From [app.docker.com](https://app.docker.com), choose your
organization. Select **Admin Console**. 
1. Choose **SSO and SCIM** from the **Security** section. 
1. Select **Create Connection**. Name the connection, then choose **SAML 2.0**.
1. Keep this window open. You need to copy and paste these values in your Okta window:
    - **Entity ID**
    - **ACS URL**
    - **Connection ID**
@y
1. From [app.docker.com](https://app.docker.com), choose your
organization. Select **Admin Console**. 
1. Choose **SSO and SCIM** from the **Security** section. 
1. Select **Create Connection**. Name the connection, then choose **SAML 2.0**.
1. Keep this window open. You need to copy and paste these values in your Okta window:
    - **Entity ID**
    - **ACS URL**
    - **Connection ID**
@z

@x
You will return here to finish connecting after creating an SSO connection in your IdP.
@y
You will return here to finish connecting after creating an SSO connection in your IdP.
@z

@x
### Step 4: Create an SSO connection in your IdP
@y
### Step 4: Create an SSO connection in your IdP
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
You need [super admin permissions](https://help.okta.com/en-us/content/topics/security/administrators-super-admin.htm) for the Okta org. 
@y
You need [super admin permissions](https://help.okta.com/en-us/content/topics/security/administrators-super-admin.htm) for the Okta org. 
@z

@x
1. Sign in to your Okta Admin account. From the top nav, select the **Admin** button to go to Okta's Admin Console. 
1. From the **Applications** section in the left nav, choose **Applications**. Select **Create App Integration**.
1. Choose SAML 2.0 to match your selection from Docker's Admin Console.    
1. For **General Settings**, name your app "Docker." Uploading a logo is optional. 
1. For **Configure SAML**, input the following values: 
    - For the **Single Sign On URL** value, paste the Docker ACS URL. 
    - For the **Audience URI (SP Entity ID)** value, paste the Docker Entity ID. 
    - For **Name ID format**, choose `EmailAddress`
    - For **Application username**, choose `Email`
    - For **Update application username on**, choose `Create and update`
    - Optional. Add [SAML attributes](/manuals/enterprise/security/provisioning/_index.md#sso-attributes), if required by your org. 
1. For **Feedback**, choose **This is an internal app that we have created** checkbox before finishing. 
@y
1. Sign in to your Okta Admin account. From the top nav, select the **Admin** button to go to Okta's Admin Console. 
1. From the **Applications** section in the left nav, choose **Applications**. Select **Create App Integration**.
1. Choose SAML 2.0 to match your selection from Docker's Admin Console.    
1. For **General Settings**, name your app "Docker." Uploading a logo is optional. 
1. For **Configure SAML**, input the following values: 
    - For the **Single Sign On URL** value, paste the Docker ACS URL. 
    - For the **Audience URI (SP Entity ID)** value, paste the Docker Entity ID. 
    - For **Name ID format**, choose `EmailAddress`
    - For **Application username**, choose `Email`
    - For **Update application username on**, choose `Create and update`
    - Optional. Add [SAML attributes](manuals/enterprise/security/provisioning/_index.md#sso-attributes), if required by your org. 
1. For **Feedback**, choose **This is an internal app that we have created** checkbox before finishing. 
@z

@x
Keep your Okta window open for the next step. 
@y
Keep your Okta window open for the next step. 
@z

@x
{{< /tab >}}
{{< tab name="Entra ID SAML 2.0" >}}
@y
{{< /tab >}}
{{< tab name="Entra ID SAML 2.0" >}}
@z

@x
To enable SSO with Microsoft Entra, you need [Cloud Application Administrator](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference#cloud-application-administrator) permissions. 
@y
To enable SSO with Microsoft Entra, you need [Cloud Application Administrator](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference#cloud-application-administrator) permissions. 
@z

@x
1. From Microsoft Entra admin center, select **Entra ID**, then go to **Enterprise apps**. Select **All applications**.  
1. Choose **Create your own application** and name your app "Docker". Select **Non-gallery**.
1. After creating your app, go to **Single Sign-On** and select **SAML**.
1. Select **Edit** on the **Basic SAML configuration** section. From **Basic SAML configuration**, choose **Edit** and paste the values you copied from creating an SSO connection in Docker:
    - For the **Identifier** value, paste the Docker Entity ID.
    - For the **Reply URL** value, paste Docker ACS URL. 
1. Optional. Add [SAML attributes](/manuals/enterprise/security/provisioning/_index.md#sso-attributes), if required by your org. 
1. From the **SAML Signing Certificate** section, download your **Certificate (Base64)**.
@y
1. From Microsoft Entra admin center, select **Entra ID**, then go to **Enterprise apps**. Select **All applications**.  
1. Choose **Create your own application** and name your app "Docker". Select **Non-gallery**.
1. After creating your app, go to **Single Sign-On** and select **SAML**.
1. Select **Edit** on the **Basic SAML configuration** section. From **Basic SAML configuration**, choose **Edit** and paste the values you copied from creating an SSO connection in Docker:
    - For the **Identifier** value, paste the Docker Entity ID.
    - For the **Reply URL** value, paste Docker ACS URL. 
1. Optional. Add [SAML attributes](manuals/enterprise/security/provisioning/_index.md#sso-attributes), if required by your org. 
1. From the **SAML Signing Certificate** section, download your **Certificate (Base64)**.
@z

@x
{{< /tab >}}
{{< tab name="Azure OpenID Connect (OIDC)" >}}
@y
{{< /tab >}}
{{< tab name="Azure OpenID Connect (OIDC)" >}}
@z

@x
#### Register the app
@y
#### Register the app
@z

@x
1. Sign in to [Microsoft Entra admin center](https://entra.microsoft.com/).
1. Go to **App Registration** and select **New Registration**.
1. Name the application "Docker".
1. Set account types and paste the **Redirect URI** from Docker.
1. Select **Register**.
1. Copy the **Client ID**.
@y
1. Sign in to [Microsoft Entra admin center](https://entra.microsoft.com/).
1. Go to **App Registration** and select **New Registration**.
1. Name the application "Docker".
1. Set account types and paste the **Redirect URI** from Docker.
1. Select **Register**.
1. Copy the **Client ID**.
@z

@x
#### Create client secrets
@y
#### Create client secrets
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
#### Set API permissions
@y
#### Set API permissions
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
### Step 5: Connect Docker to your IdP
@y
### Step 5: Connect Docker to your IdP
@z

@x
Complete the integration by pasting your IdP values into Docker.
@y
Complete the integration by pasting your IdP values into Docker.
@z

@x
> [!IMPORTANT]
> When prompted to copy a certificate, copy the entire certificate starting with 
> `----BEGIN CERTIFICATE----` and including the `----END CERTIFICATE----` lines.
@y
> [!IMPORTANT]
> When prompted to copy a certificate, copy the entire certificate starting with 
> `----BEGIN CERTIFICATE----` and including the `----END CERTIFICATE----` lines.
@z

@x
{{< tabs >}}
{{< tab name="Okta SAML" >}}
@y
{{< tabs >}}
{{< tab name="Okta SAML" >}}
@z

@x
1. Go to **Applications** and choose **Applications**. Choose your app from the **ACTIVE** table.
1. From **Sign on**, go to **View SAML setup instructions**. This page contains the **SAML Sign-in URL** and **x509 Certificate**. Keep this page open. 
1. Return to your opened Docker window for the **Create single sign-on connection** step. Paste in the **SAML Sign-in URL** and **x509 Certificate** values.
1. Optional. Select a default team, if required by your org.
1. Review and select **Create connection**.
@y
1. Go to **Applications** and choose **Applications**. Choose your app from the **ACTIVE** table.
1. From **Sign on**, go to **View SAML setup instructions**. This page contains the **SAML Sign-in URL** and **x509 Certificate**. Keep this page open. 
1. Return to your opened Docker window for the **Create single sign-on connection** step. Paste in the **SAML Sign-in URL** and **x509 Certificate** values.
1. Optional. Select a default team, if required by your org.
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
1. Return to the Docker Admin Console, then paste the **Login URL** and **Certificate (Base64)** values.
1. Choose your domain from the dropdown. 
1. Optional. Select a default team, if required by your org.
1. Review and select **Create connection**.
@y
1. Open your downloaded **Certificate (Base64)** in a text editor.
1. Copy the following values:
    - From Azure AD: **Login URL**
    - **Certificate (Base64)** contents
1. Return to the Docker Admin Console, then paste the **Login URL** and **Certificate (Base64)** values.
1. Choose your domain from the dropdown. 
1. Optional. Select a default team, if required by your org.
1. Review and select **Create connection**.
@z

@x
{{< /tab >}}
{{< tab name="Azure OpenID Connect (OIDC)" >}}
@y
{{< /tab >}}
{{< tab name="Azure OpenID Connect (OIDC)" >}}
@z

@x
1. Return to the Docker Admin Console.
1. Paste the following values:
    - **Client ID**
    - **Client Secret**
    - **Azure AD Domain**
1. Optional. Select a default team, if required by your org.
1. Review and select **Create connection**.
@y
1. Return to the Docker Admin Console.
1. Paste the following values:
    - **Client ID**
    - **Client Secret**
    - **Azure AD Domain**
1. Optional. Select a default team, if required by your org.
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
### Step 6: Test the connection
@y
### Step 6: Test the connection
@z

@x
IdPs like Microsoft Entra and Okta may require that you assign a user to an application before testing SSO. You can review [Microsoft Entra](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/add-application-portal-setup-sso#test-single-sign-on)'s documentation and [Okta](https://help.okta.com/wf/en-us/content/topics/workflows/connector-reference/okta/actions/assignusertoapplicationforsso.htm)'s documentation to learn how to assign yourself or other users to an app.
@y
IdPs like Microsoft Entra and Okta may require that you assign a user to an application before testing SSO. You can review [Microsoft Entra](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/add-application-portal-setup-sso#test-single-sign-on)'s documentation and [Okta](https://help.okta.com/wf/en-us/content/topics/workflows/connector-reference/okta/actions/assignusertoapplicationforsso.htm)'s documentation to learn how to assign yourself or other users to an app.
@z

@x
After assigning yourself to an app: 
@y
After assigning yourself to an app: 
@z

@x
1. Open an incognito browser window and sign in to the Admin Console using your domain email address.
1. When redirected to your IdP's sign in page, authenticate with your domain email instead of using your Docker ID. 
@y
1. Open an incognito browser window and sign in to the Admin Console using your domain email address.
1. When redirected to your IdP's sign in page, authenticate with your domain email instead of using your Docker ID. 
@z

@x
If you have multiple IdPs, choose the sign-in option **Continue with SSO**. If you're using the CLI, you must authenticate using a personal access token.
@y
If you have multiple IdPs, choose the sign-in option **Continue with SSO**. If you're using the CLI, you must authenticate using a personal access token.
@z

@x
## Configure multiple IdPs
@y
## Configure multiple IdPs
@z

@x
Docker supports multiple identity provider (IdP) configurations by letting you associate one domain with more than one IdP. Each connection must use the same domain, which lets users choose their IdP when they select **Continue with SSO** at login. 
@y
Docker supports multiple identity provider (IdP) configurations by letting you associate one domain with more than one IdP. Each connection must use the same domain, which lets users choose their IdP when they select **Continue with SSO** at login. 
@z

@x
To add multiple IdPs:
@y
To add multiple IdPs:
@z

@x
1. Use the same domain for each connection. 
1. Repeat steps 3-6 from the [Set up an SSO connection](/enterprise/security/single-sign-on/connect/#set-up-an-sso-connection) procedures on this page. Repeat these steps for each IdP your organization intends to use.
@y
1. Use the same domain for each connection. 
1. Repeat steps 3-6 from the [Set up an SSO connection](__SUBDIR__/enterprise/security/single-sign-on/connect/#set-up-an-sso-connection) procedures on this page. Repeat these steps for each IdP your organization intends to use.
@z

@x
Because you must use the same domain for each IdP, you won't need to repeat steps to add and verify your domains. 
@y
Because you must use the same domain for each IdP, you won't need to repeat steps to add and verify your domains. 
@z

@x
## Enforce SSO
@y
## Enforce SSO
@z

@x
If SSO is not enforced, users can still sign in using Docker usernames and passwords. Enforcing SSO requires users to use SSO when signing into Docker, which centralizes authentication and enforces policies set by the IdP.
@y
If SSO is not enforced, users can still sign in using Docker usernames and passwords. Enforcing SSO requires users to use SSO when signing into Docker, which centralizes authentication and enforces policies set by the IdP.
@z

@x
Before enforcing SSO, users accessing Docker through the CLI must [create a personal access token (PAT)](/docker-hub/access-tokens/). The PAT replaces their username and password for authentication.
@y
Before enforcing SSO, users accessing Docker through the CLI must [create a personal access token (PAT)](__SUBDIR__/docker-hub/access-tokens/). The PAT replaces their username and password for authentication.
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
When you enforce SSO, your users cannot modify their email address and
password, convert a user account to an organization, or set up 2FA through
Docker Hub. If you want to use 2FA, you must enable 2FA through your IdP.
@y
When you enforce SSO, your users cannot modify their email address and
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
