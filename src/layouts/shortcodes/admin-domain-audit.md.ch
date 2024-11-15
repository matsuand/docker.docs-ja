%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $domain_navigation := "Select **Organizations**, your organization, **Settings**, and then **Security**." }}
{{ $sso_link := "[SSO](/security/for-admins/single-sign-on/)" }}
{{ $scim_link := "[SCIM](/security/for-admins/provisioning/scim/)" }}
@y
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $domain_navigation := "Select **Organizations**, your organization, **Settings**, and then **Security**." }}
{{ $sso_link := "[SSO](__SUBDIR__/security/for-admins/single-sign-on/)" }}
{{ $scim_link := "[SCIM](__SUBDIR__/security/for-admins/provisioning/scim/)" }}
@z

@x
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
  {{ $domain_navigation = "Select your organization in the left navigation drop-down menu, and then select **Domain management**." }}
  {{ $sso_link = "[SSO](/security/for-admins/single-sign-on/)" }}
  {{ $scim_link = "[SCIM](/security/for-admins/provisioning/scim/)" }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
  {{ $domain_navigation = "Select your organization in the left navigation drop-down menu, and then select **Domain management**." }}
  {{ $sso_link = "[SSO](__SUBDIR__/security/for-admins/single-sign-on/)" }}
  {{ $scim_link = "[SCIM](__SUBDIR__/security/for-admins/provisioning/scim/)" }}
{{ end }}
@z

@x
To audit your domains:
@y
To audit your domains:
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $domain_navigation }}
3. In **Domain Audit**, select **Export Users** to export a CSV file of uncaptured users with the following columns:
@y
1. Sign in to {{ $product_link }}.
2. {{ $domain_navigation }}
3. In **Domain Audit**, select **Export Users** to export a CSV file of uncaptured users with the following columns:
@z

@x
   - Name: The name of the user.
   - Username: The Docker ID of the user.
   - Email: The email address of the user.
@y
   - Name: The name of the user.
   - Username: The Docker ID of the user.
   - Email: The email address of the user.
@z

@x
You can invite all the uncaptured users to your organization using the exported CSV file. For more details, see [Invite members](/admin/organization/members/). Optionally, enforce single sign-on or enable SCIM to add users to your organization automatically. For more details, see {{ $sso_link }} or {{ $scim_link }}.
@y
You can invite all the uncaptured users to your organization using the exported CSV file. For more details, see [Invite members](__SUBDIR__/admin/organization/members/). Optionally, enforce single sign-on or enable SCIM to add users to your organization automatically. For more details, see {{ $sso_link }} or {{ $scim_link }}.
@z

@x
> [!NOTE]
>
> Domain audit may identify accounts of users who are no longer a part of your organization. If you don't want to add a user to your organization and you don't want the user to appear in future domain audits, you must deactivate the account or update the associated email address.
>
> Only someone with access to the Docker account can deactivate the account or update the associated email address. For more details, see [Deactivating an account](/admin/deactivate-account/).
>
@y
> [!NOTE]
>
> Domain audit may identify accounts of users who are no longer a part of your organization. If you don't want to add a user to your organization and you don't want the user to appear in future domain audits, you must deactivate the account or update the associated email address.
>
> Only someone with access to the Docker account can deactivate the account or update the associated email address. For more details, see [Deactivating an account](/admin/deactivate-account/).
>
@z
