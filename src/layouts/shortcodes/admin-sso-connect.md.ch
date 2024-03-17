%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO & SCIM.**" }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO & SCIM.**" }}
{{ end }}
@z

@x
1. In {{ $product_link }}, select the verified domains you want to apply the connection to.
2. To provision your users, select the organization(s) and/or team(s).
3. Review your summary and select **Create Connection**.
@y
1. In {{ $product_link }}, select the verified domains you want to apply the connection to.
2. To provision your users, select the organization(s) and/or team(s).
3. Review your summary and select **Create Connection**.
@z

@x
## Test your SSO configuration
@y
## Test your SSO configuration
@z

@x
After you’ve completed the SSO configuration process in Docker, you can test the configuration when you sign in to {{ $product_link }} using an incognito browser. Sign in to {{ $product_link }} using your domain email address. You are then redirected to your IdP's login page to authenticate.
@y
After you’ve completed the SSO configuration process in Docker, you can test the configuration when you sign in to {{ $product_link }} using an incognito browser. Sign in to {{ $product_link }} using your domain email address. You are then redirected to your IdP's login page to authenticate.
@z

@x
1. Authenticate through email instead of using your Docker ID, and test the login process.
2. To authenticate through CLI, your users must have a PAT before you enforce SSO for CLI users.
@y
1. Authenticate through email instead of using your Docker ID, and test the login process.
2. To authenticate through CLI, your users must have a PAT before you enforce SSO for CLI users.
@z

@x
>**Important**
>
> SSO has Just-In-Time (JIT) Provisioning enabled by default. This means your users are auto-provisioned to your organization on Docker Hub.
>
> You can change this on a per-app basis. To prevent auto-provisioning users, you can create a security group in your IdP and configure the SSO app to authenticate and authorize only those users that are in the security group. Follow the instructions provided by your IdP:
>
> - [Okta](https://help.okta.com/en-us/Content/Topics/Security/policies/configure-app-signon-policies.htm)
> - [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-restrict-your-app-to-a-set-of-users)
{ .important}
@y
>**Important**
>
> SSO has Just-In-Time (JIT) Provisioning enabled by default. This means your users are auto-provisioned to your organization on Docker Hub.
>
> You can change this on a per-app basis. To prevent auto-provisioning users, you can create a security group in your IdP and configure the SSO app to authenticate and authorize only those users that are in the security group. Follow the instructions provided by your IdP:
>
> - [Okta](https://help.okta.com/en-us/Content/Topics/Security/policies/configure-app-signon-policies.htm)
> - [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-restrict-your-app-to-a-set-of-users)
{ .important}
@z

@x
The SSO connection is now created. You can continue to set up SCIM without enforcing SSO log-in. For more information about setting up SCIM, see [Set up SCIM](/security/for-admins/scim/).
@y
The SSO connection is now created. You can continue to set up SCIM without enforcing SSO log-in. For more information about setting up SCIM, see [Set up SCIM](/security/for-admins/scim/).
@z

@x
## Optional: Enforce SSO
@y
## Optional: Enforce SSO
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon and then **Enable enforcement**.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon and then **Enable enforcement**.
@z

@x
   When SSO is enforced, your users are unable to modify their email address and password, convert a user account to an organization, or set up 2FA through Docker Hub. You must enable 2FA through your IdP.
@y
   When SSO is enforced, your users are unable to modify their email address and password, convert a user account to an organization, or set up 2FA through Docker Hub. You must enable 2FA through your IdP.
@z

@x
4. Continue with the on-screen instructions and verify that you’ve completed the tasks.
5. Select **Turn on enforcement** to complete.
@y
4. Continue with the on-screen instructions and verify that you’ve completed the tasks.
5. Select **Turn on enforcement** to complete.
@z

@x
Your users must now sign in to Docker with SSO.
@y
Your users must now sign in to Docker with SSO.
@z

@x
> **Important**
>
> If SSO isn't enforced, users can choose to sign in with either their Docker ID or SSO.
{ .important}
@y
> **Important**
>
> If SSO isn't enforced, users can choose to sign in with either their Docker ID or SSO.
{ .important}
@z
