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
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO and SCIM**." }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://admin.docker.com)" }}
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO and SCIM**." }}
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
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
@z

@x
   > [!NOTE]
   >
   > When an organization is part of a company, you must select the company and
   > manage the SSO settings for that organization at the company level. Each
   > organization can have its own domain and SSO configuration, but it must be
   > managed at the company level.
@y
   > [!NOTE]
   >
   > When an organization is part of a company, you must select the company and
   > manage the SSO settings for that organization at the company level. Each
   > organization can have its own domain and SSO configuration, but it must be
   > managed at the company level.
@z

@x
3. In the SSO connections table, select the **Action** icon.
4. Select **Edit connection** to edit your connection.
5. Follow the on-screen instructions to edit the connection.
@y
3. In the SSO connections table, select the **Action** icon.
4. Select **Edit connection** to edit your connection.
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
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
@z

@x
   > [!NOTE]
   >
   > When an organization is part of a company, you must select the company and
   > delete the SSO connection for that organization at the company level. If a
   > connection is used by mulitple organizations and you only want to delete
   > the connection for specific organizations, you can [remove those
   > organizations](/security/for-admins/single-sign-on/manage/#remove-an-organization).
@y
   > [!NOTE]
   >
   > When an organization is part of a company, you must select the company and
   > delete the SSO connection for that organization at the company level. If a
   > connection is used by mulitple organizations and you only want to delete
   > the connection for specific organizations, you can [remove those
   > organizations](/security/for-admins/single-sign-on/manage/#remove-an-organization).
@z

@x
3. In the SSO connections table, select the **Action** icon.
4. Select **Delete connection**.
5. Follow the on-screen instructions to delete a connection.
@y
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
When you disable SSO, you can delete the connection to remove the configuration settings and the added domains. Once you delete this connection, it can't be undone. Users must authenticate with their Docker ID and password or create a password reset if they don't have one.
@y
When you disable SSO, you can delete the connection to remove the configuration settings and the added domains. Once you delete this connection, it can't be undone. Users must authenticate with their Docker ID and password or create a password reset if they don't have one.
@z
