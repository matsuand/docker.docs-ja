%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization. Select **My Hub**, your organization, **Settings**, and then **Security**.` }}
@y
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization. Select **My Hub**, your organization, **Settings**, and then **Security**.` }}
@z

@x
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://app.docker.com/admin)" }}
  {{ $sso_navigation = "Select your organization or company from the Choose profile page, and then select **SSO and SCIM**. Note that when an organization is part of a company, you must select the company and configure SSO for that organization at the company level. Each organization can have its own SSO configuration and domain, but it must be configured at the company level." }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://app.docker.com/admin)" }}
  {{ $sso_navigation = "Select your organization or company from the Choose profile page, and then select **SSO and SCIM**. Note that when an organization is part of a company, you must select the company and configure SSO for that organization at the company level. Each organization can have its own SSO configuration and domain, but it must be configured at the company level." }}
{{ end }}
@z

@x
### Edit a connection
@y
### Edit a connection
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon.
4. Select **Edit connection**.
5. Follow the on-screen instructions to edit the connection.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon.
4. Select **Edit connection**.
5. Follow the on-screen instructions to edit the connection.
@z

@x
### Delete a connection
@y
### Delete a connection
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon.
4. Select **Delete connection**.
5. Follow the on-screen instructions to delete a connection.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon.
4. Select **Delete connection**.
5. Follow the on-screen instructions to delete a connection.
@z

@x
### Deleting SSO
@y
### Deleting SSO
@z

@x
When you disable SSO, you can delete the connection to remove the configuration settings and the added domains. Once you delete this connection, it can't be undone. If an SSO connection is deleted, Docker users must authenticate with their Docker ID and password.
@y
When you disable SSO, you can delete the connection to remove the configuration settings and the added domains. Once you delete this connection, it can't be undone. If an SSO connection is deleted, Docker users must authenticate with their Docker ID and password.
@z
