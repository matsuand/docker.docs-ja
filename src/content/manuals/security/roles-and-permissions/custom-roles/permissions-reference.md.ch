%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Custom role permissions reference
linkTitle: Permissions reference
description: >-
  Permissions available for Docker custom roles across organization management,
  Docker Hub, billing, licensing, AI Governance, Docker Hardened Images,
  Docker Offload, and Docker Cloud Sandboxes.
keywords: >-
  custom roles, custom role permissions, Docker, Docker Hub, organization
  management, billing, licensing, licenses, AI Governance, access tokens, SSO,
  SCIM, OIDC, DHI, Docker Offload, Cloud Sandboxes, security
@y
title: Custom role permissions reference
linkTitle: Permissions reference
description: >-
  Permissions available for Docker custom roles across organization management,
  Docker Hub, billing, licensing, AI Governance, Docker Hardened Images,
  Docker Offload, and Docker Cloud Sandboxes.
keywords: >-
  custom roles, custom role permissions, Docker, Docker Hub, organization
  management, billing, licensing, licenses, AI Governance, access tokens, SSO,
  SCIM, OIDC, DHI, Docker Offload, Cloud Sandboxes, security
@z

@x
{{< summary-bar feature_name="Custom roles" >}}
@y
{{< summary-bar feature_name="Custom roles" >}}
@z

@x
Custom roles use permissions from organization management, Docker Hub,
billing, licensing, AI Governance, Docker Hardened Images, Docker
Offload, and Docker Cloud Sandboxes. Use the following tables to [create
or edit a custom role](manage.md).
@y
Custom roles use permissions from organization management, Docker Hub,
billing, licensing, AI Governance, Docker Hardened Images, Docker
Offload, and Docker Cloud Sandboxes. Use the following tables to [create
or edit a custom role](manage.md).
@z

@x
{{% custom_role_permissions.inline %}}
{{- $data := hugo.Data.custom_role_permissions -}}
{{- if not $data.groups -}}
  {{- errorf "custom-role-permissions: no groups found in data/custom_role_permissions.yaml: %s" .Position -}}
{{- end -}}
{{- range $group := $data.groups -}}
  {{- if not $group.name -}}
    {{- errorf "custom-role-permissions: group without a name: %s" $.Position -}}
  {{- end -}}
  {{- if $group.relations }}
@y
{{% custom_role_permissions.inline %}}
{{- $data := hugo.Data.custom_role_permissions -}}
{{- if not $data.groups -}}
  {{- errorf "custom-role-permissions: no groups found in data/custom_role_permissions.yaml: %s" .Position -}}
{{- end -}}
{{- range $group := $data.groups -}}
  {{- if not $group.name -}}
    {{- errorf "custom-role-permissions: group without a name: %s" $.Position -}}
  {{- end -}}
  {{- if $group.relations }}
@z

@x
## {{ $group.name }}
@y
## {{ $group.name }}
@z

@x
| Permission | Description |
| :--------- | :---------- |
{{ range $group.relations -}}
  {{- if or (not .name) (not .description) -}}
    {{- errorf "custom-role-permissions: relation %q in group %q needs a name and description: %s" .name $group.name $.Position -}}
  {{- end -}}
| {{ replace .name "|" "\\|" }} | {{ replace .description "|" "\\|" }} |
{{ end -}}
  {{- end -}}
{{- end }}
{{% /custom_role_permissions.inline %}}
@y
| Permission | Description |
| :--------- | :---------- |
{{ range $group.relations -}}
  {{- if or (not .name) (not .description) -}}
    {{- errorf "custom-role-permissions: relation %q in group %q needs a name and description: %s" .name $group.name $.Position -}}
  {{- end -}}
| {{ replace .name "|" "\\|" }} | {{ replace .description "|" "\\|" }} |
{{ end -}}
  {{- end -}}
{{- end }}
{{% /custom_role_permissions.inline %}}
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Manage custom roles](manage.md): Create, assign, and delete custom
  roles
- [Core roles and permissions](/manuals/security/roles-and-permissions/core-roles.md):
  Compare built-in Member, Editor, and Owner permissions
@y
- [Manage custom roles](manage.md): Create, assign, and delete custom
  roles
- [Core roles and permissions](manuals/security/roles-and-permissions/core-roles.md):
  Compare built-in Member, Editor, and Owner permissions
@z
