%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := "Select **My Hub**, your organization, and then **Settings**." }}
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://app.docker.com/admin)" }}
  {{ $sso_navigation = "Select your company from the **Choose profile** page, and then select **SSO and SCIM**." }}
{{ end }}
@y
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := "Select **My Hub**, your organization, and then **Settings**." }}
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://app.docker.com/admin)" }}
  {{ $sso_navigation = "Select your company from the **Choose profile** page, and then select **SSO and SCIM**." }}
{{ end }}
@z

@x
### Connect an organization
@y
### Connect an organization
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon and then **Edit connection**.
4. Select **Next** to navigate to the section where connected organizations are listed.
5. In the **Organizations** drop-down, select the organization to add to the connection.
6. Select **Next** to confirm or change the default organization and team provisioning.
7. Review the **Connection Summary** and select **Update connection**.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon and then **Edit connection**.
4. Select **Next** to navigate to the section where connected organizations are listed.
5. In the **Organizations** drop-down, select the organization to add to the connection.
6. Select **Next** to confirm or change the default organization and team provisioning.
7. Review the **Connection Summary** and select **Update connection**.
@z

@x
### Remove an organization
@y
### Remove an organization
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon and then **Edit connection**.
4. Select **Next** to navigate to the section where connected organizations are listed.
5. In the **Organizations** drop-down, select **Remove** to remove the connection.
6. Select **Next** to confirm or change the default organization and team provisioning.
7. Review the **Connection Summary** and select **Update connection**.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon and then **Edit connection**.
4. Select **Next** to navigate to the section where connected organizations are listed.
5. In the **Organizations** drop-down, select **Remove** to remove the connection.
6. Select **Next** to confirm or change the default organization and team provisioning.
7. Review the **Connection Summary** and select **Update connection**.
@z
