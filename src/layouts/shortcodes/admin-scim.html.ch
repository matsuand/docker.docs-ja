%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization.
   - Organization: Select **My Hub**, your organization, **Settings**, and then **Security**.` }}
@y
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization.
   - Organization: Select **My Hub**, your organization, **Settings**, and then **Security**.` }}
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
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Actions** icon and **Setup SCIM**.
4. Copy the **SCIM Base URL** and **API Token** and paste the values into your IdP.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Actions** icon and **Setup SCIM**.
4. Copy the **SCIM Base URL** and **API Token** and paste the values into your IdP.
@z
