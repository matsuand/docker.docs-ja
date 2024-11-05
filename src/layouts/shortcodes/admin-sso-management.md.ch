%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization. Select **Organizations**, your organization, **Settings**, and then **Security**.` }}
@y
{{ $product_link := "[Docker Hub](https://hub.docker.com)" }}
{{ $sso_navigation := `Navigate to the SSO settings page for your organization. Select **Organizations**, your organization, **Settings**, and then **Security**.` }}
@z

@x
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://app.docker.com/admin)" }}
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO and SCIM**." }}
{{ end }}
@y
{{ if eq (.Get "product") "admin" }}
  {{ $product_link = "the [Admin Console](https://app.docker.com/admin)" }}
  {{ $sso_navigation = "Select your organization or company in the left navigation drop-down menu, and then select **SSO and SCIM**." }}
{{ end }}
@z

@x
### Remove a domain from an SSO connection
@y
### Remove a domain from an SSO connection
@z

@x
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon and then **Edit connection**.
4. Select **Next** to navigate to the section where the connected domains are listed.
5. In the **Domain** drop-down, select the **x** icon next to the domain that you want to remove.
6. Select **Next** to confirm or change the connected organization(s).
7. Select **Next** to confirm or change the default organization and team provisioning selections.
8. Review the **Connection Summary** and select **Update connection**.
@y
1. Sign in to {{ $product_link }}.
2. {{ $sso_navigation }}
3. In the SSO connections table, select the **Action** icon and then **Edit connection**.
4. Select **Next** to navigate to the section where the connected domains are listed.
5. In the **Domain** drop-down, select the **x** icon next to the domain that you want to remove.
6. Select **Next** to confirm or change the connected organization(s).
7. Select **Next** to confirm or change the default organization and team provisioning selections.
8. Review the **Connection Summary** and select **Update connection**.
@z

@x
> [!Note]
>
> If you want to re-add the domain, a new TXT record value is assigned. You must then complete the verification steps with the new TXT record value.
@y
> [!Note]
>
> If you want to re-add the domain, a new TXT record value is assigned. You must then complete the verification steps with the new TXT record value.
@z
