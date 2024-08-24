%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization or company.
   - Organization: Select **Organizations**, your organization, **Settings**, and then **Security**.
   - Company: Select **Organizations**, your company, and then **Settings**.` }}
@y
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization or company.
   - Organization: Select **Organizations**, your organization, **Settings**, and then **Security**.
   - Company: Select **Organizations**, your company, and then **Settings**.` }}
@z

@x
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO and SCIM.**" }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO and SCIM.**" }}
{{ end }}
@z

@x
> [!IMPORTANT]
>
> If your IdP setup requires an Entity ID and the ACS URL, you must select the
> **SAML** tab in the **Authentication Method** section. For example, if your
> Entra ID (formerly Azure AD) Open ID Connect (OIDC) setup uses SAML configuration within Azure
> AD, you must select **SAML**. If you are [configuring Open ID Connect with Entra ID (formerly Azure AD)](https://docs.microsoft.com/en-us/powerapps/maker/portals/configure/configure-openid-settings) select
> **Azure AD (OIDC)** as the authentication method. Also, IdP initiated connections
> aren't supported at this time.
@y
> [!IMPORTANT]
>
> If your IdP setup requires an Entity ID and the ACS URL, you must select the
> **SAML** tab in the **Authentication Method** section. For example, if your
> Entra ID (formerly Azure AD) Open ID Connect (OIDC) setup uses SAML configuration within Azure
> AD, you must select **SAML**. If you are [configuring Open ID Connect with Entra ID (formerly Azure AD)](https://docs.microsoft.com/en-us/powerapps/maker/portals/configure/configure-openid-settings) select
> **Azure AD (OIDC)** as the authentication method. Also, IdP initiated connections
> aren't supported at this time.
@z

@x
After your domain is verified, create an SSO connection.
@y
After your domain is verified, create an SSO connection.
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
@z

@x
   > [!NOTE]
   >
   > When an organization is part of a company, you must select the company and
   > configure SSO for that organization at the company level. Each organization
   > can have its own SSO configuration and domain, but it must be configured at
   > the company level.
@y
   > [!NOTE]
   >
   > When an organization is part of a company, you must select the company and
   > configure SSO for that organization at the company level. Each organization
   > can have its own SSO configuration and domain, but it must be configured at
   > the company level.
@z

@x
3. In the SSO connections table select **Create Connection**, and create a name for the connection.
@y
3. In the SSO connections table select **Create Connection**, and create a name for the connection.
@z

@x
   > [!NOTE]
   >
   > You have to verify at least one domain before creating the connections.
@y
   > [!NOTE]
   >
   > You have to verify at least one domain before creating the connections.
@z

@x
4. Select an authentication method, **SAML** or **Azure AD (OIDC)**.
5. Copy the following fields to add to your IdP:
@y
4. Select an authentication method, **SAML** or **Azure AD (OIDC)**.
5. Copy the following fields to add to your IdP:
@z

@x
   - SAML: **Entity ID**, **ACS URL**
   - Azure AD (OIDC): **Redirect URL**
@y
   - SAML: **Entity ID**, **ACS URL**
   - Azure AD (OIDC): **Redirect URL**
@z

@x
   ![SAML](/docker-hub/images/saml-create-connection.png)
@y
   ![SAML](__SUBDIR__/docker-hub/images/saml-create-connection.png)
@z

@x
   ![Azure AD](/docker-hub/images/azure-create-connection.png)
@y
   ![Azure AD](__SUBDIR__/docker-hub/images/azure-create-connection.png)
@z
