%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization or company.
   - Organization: Select **Organizations**, your organization, **Settings**, and then **Security**.
   - Company: Select **Organizations**, your company, and then **Settings**.` }}
{{ $member_navigation := "Select **Organizations**, your organization, and then **Members**." }}
{{ $invite_button := "**Invite members**" }}
{{ $remove_button := "**Remove member**" }}
{{ $provisioning_steps := "This feature is only available in the Admin Console."}}
@y
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization or company.
   - Organization: Select **Organizations**, your organization, **Settings**, and then **Security**.
   - Company: Select **Organizations**, your company, and then **Settings**.` }}
{{ $member_navigation := "Select **Organizations**, your organization, and then **Members**." }}
{{ $invite_button := "**Invite members**" }}
{{ $remove_button := "**Remove member**" }}
{{ $provisioning_steps := "This feature is only available in the Admin Console."}}
@z

@x
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
  {{ $invite_button = "**Invite**" }}
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO & SCIM**." }}
  {{ $member_navigation = `Navigate to the user management page for your organization or company. 
    - Organization: Select your organization in the left navigation drop-down menu, and then select **Members**.
    - Company: Select your company in the left navigation drop-down menu, and then select **Users**.` }}
  {{ $remove_button = "**Remove member**, if you're an organization, or **Remove user**, is you're a company" }}
  {{ $provisioning_steps = `To choose how your users are provisioned:
  1. Sign in to the [Admin Console](https://admin.docker.com).
  2. Select your organization or company in the left navigation drop-down menu, and then select **SSO & SCIM**.
  3. In the SSO connections table, select the **Action** icon and then **Edit connection**.
  4. Select **Next** to navigate to the section where you can choose how to provision users. 
  5. Choose to enable or disable Just-in-Time (JIT) provisioning (default).
  6. Follow the on-screen instructions to save your configuration.` }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
  {{ $invite_button = "**Invite**" }}
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO & SCIM**." }}
  {{ $member_navigation = `Navigate to the user management page for your organization or company. 
    - Organization: Select your organization in the left navigation drop-down menu, and then select **Members**.
    - Company: Select your company in the left navigation drop-down menu, and then select **Users**.` }}
  {{ $remove_button = "**Remove member**, if you're an organization, or **Remove user**, is you're a company" }}
  {{ $provisioning_steps = `To choose how your users are provisioned:
  1. Sign in to the [Admin Console](https://admin.docker.com).
  2. Select your organization or company in the left navigation drop-down menu, and then select **SSO & SCIM**.
  3. In the SSO connections table, select the **Action** icon and then **Edit connection**.
  4. Select **Next** to navigate to the section where you can choose how to provision users. 
  5. Choose to enable or disable Just-in-Time (JIT) provisioning (default).
  6. Follow the on-screen instructions to save your configuration.` }}
{{ end }}
@z

@x
> **Important**
>
> SSO has Just-In-Time (JIT) Provisioning enabled by default. This means your users are auto-provisioned to your organization.
>
> You can change this on a per-app basis. To prevent auto-provisioning users, you can create a security group in your IdP and configure the SSO app to authenticate and authorize only those users that are in the security group. Follow the instructions provided by your IdP:
>
> - [Okta](https://help.okta.com/en-us/Content/Topics/Security/policies/configure-app-signon-policies.htm)
> - [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-restrict-your-app-to-a-set-of-users)
>
> Alternatively, see [Manage how users are provisioned](#manage-how-users-are-provisioned).
{ .important}
@y
> **Important**
>
> SSO has Just-In-Time (JIT) Provisioning enabled by default. This means your users are auto-provisioned to your organization.
>
> You can change this on a per-app basis. To prevent auto-provisioning users, you can create a security group in your IdP and configure the SSO app to authenticate and authorize only those users that are in the security group. Follow the instructions provided by your IdP:
>
> - [Okta](https://help.okta.com/en-us/Content/Topics/Security/policies/configure-app-signon-policies.htm)
> - [Entra ID (formerly Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-restrict-your-app-to-a-set-of-users)
>
> Alternatively, see [Manage how users are provisioned](#manage-how-users-are-provisioned).
{ .important}
@z

@x
### Add guest users when SSO is enabled
@y
### Add guest users when SSO is enabled
@z

@x
To add a guest that isn't verified through your IdP:
@y
To add a guest that isn't verified through your IdP:
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $member_navigation }}
3. Select {{ $invite_button }}.
4. Follow the on-screen instructions to invite the user.
@y
1. Sign in to {{ $product_link }}.
2. {{ $member_navigation }}
3. Select {{ $invite_button }}.
4. Follow the on-screen instructions to invite the user.
@z

@x
### Remove users from the SSO company
@y
### Remove users from the SSO company
@z

@x
To remove a user:
@y
To remove a user:
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $member_navigation }}
3. Select the action icon next to a user’s name, and then select {{ $remove_button }}.
4. Follow the on-screen instructions to remove the user.
@y
1. Sign in to {{ $product_link }}.
2. {{ $member_navigation }}
3. Select the action icon next to a user’s name, and then select {{ $remove_button }}.
4. Follow the on-screen instructions to remove the user.
@z

@x
### Manage how users are provisioned
@y
### Manage how users are provisioned
@z

@x
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning is available in Private Beta when you use the Admin Console. If you're participating in this program, you have the option to turn off this default provisioning and disable JIT. This configuration is recommended if you're using SCIM to auto-provision users. See [SSO authentication with JIT provisioning disabled](/security/for-admins/group-mapping/#sso-authentication-with-jit-provisioning-disabled).
{ .experimental }
@y
> **Beta feature**
>
> Optional Just-in-Time (JIT) provisioning is available in Private Beta when you use the Admin Console. If you're participating in this program, you have the option to turn off this default provisioning and disable JIT. This configuration is recommended if you're using SCIM to auto-provision users. See [SSO authentication with JIT provisioning disabled](/security/for-admins/group-mapping/#sso-authentication-with-jit-provisioning-disabled).
{ .experimental }
@z

@x
{{ $provisioning_steps }}
@y
{{ $provisioning_steps }}
@z
