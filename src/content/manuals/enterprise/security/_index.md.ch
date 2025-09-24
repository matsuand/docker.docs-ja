%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
linkTitle: Security
title: Security for enterprises
description: Learn about enterprise level security features Docker has to offer and explore best practices
keywords: docker, docker hub, docker desktop, security, enterprises, scale
@y
linkTitle: Security
title: Security for enterprises
description: Learn about enterprise level security features Docker has to offer and explore best practices
keywords: docker, docker hub, docker desktop, security, enterprises, scale
@z

% grid_admins:

@x
- title: Settings Management
  description: Learn how Settings Management can secure your developers' workflows.
  icon: shield_locked
  link: /enterprise/security/hardened-desktop/settings-management/
@y
- title: Settings Management
  description: Learn how Settings Management can secure your developers' workflows.
  icon: shield_locked
  link: __SUBDIR__/enterprise/security/hardened-desktop/settings-management/
@z

@x
- title: Enhanced Container Isolation
  description: Understand how Enhanced Container Isolation can prevent container attacks.
  icon: security
  link: /enterprise/security/hardened-desktop/enhanced-container-isolation/
@y
- title: Enhanced Container Isolation
  description: Understand how Enhanced Container Isolation can prevent container attacks.
  icon: security
  link: __SUBDIR__/enterprise/security/hardened-desktop/enhanced-container-isolation/
@z

@x
- title: Registry Access Management
  description: Control the registries developers can access while using Docker Desktop.
  icon: home_storage
  link: /enterprise/security/hardened-desktop/registry-access-management/
@y
- title: Registry Access Management
  description: Control the registries developers can access while using Docker Desktop.
  icon: home_storage
  link: __SUBDIR__/enterprise/security/hardened-desktop/registry-access-management/
@z

@x
- title: Image Access Management
  description: Control the images developers can pull from Docker Hub.
  icon: photo_library
  link: /enterprise/security/hardened-desktop/image-access-management/
@y
- title: Image Access Management
  description: Control the images developers can pull from Docker Hub.
  icon: photo_library
  link: __SUBDIR__/enterprise/security/hardened-desktop/image-access-management/
@z

@x
- title: "Air-Gapped Containers"
  description: Restrict containers from accessing unwanted network resources.
  icon: "vpn_lock"
  link: /enterprise/security/hardened-desktop/air-gapped-containers/
@y
- title: "Air-Gapped Containers"
  description: Restrict containers from accessing unwanted network resources.
  icon: "vpn_lock"
  link: __SUBDIR__/enterprise/security/hardened-desktop/air-gapped-containers/
@z

@x
- title: Enforce sign-in
  description: Configure sign-in for members of your teams and organizations.
  link: /enterprise/security/enforce-sign-in/
  icon: passkey
@y
- title: Enforce sign-in
  description: Configure sign-in for members of your teams and organizations.
  link: __SUBDIR__/enterprise/security/enforce-sign-in/
  icon: passkey
@z

@x
- title: Domain management
  description: Identify uncaptured users in your organization.
  link: /enterprise/security/domain-management/
  icon: person_search
@y
- title: Domain management
  description: Identify uncaptured users in your organization.
  link: __SUBDIR__/enterprise/security/domain-management/
  icon: person_search
@z

@x
- title: Docker Scout
  description: Explore how Docker Scout can help you create a more secure software supply chain.
  icon: query_stats
  link: /scout/
@y
- title: Docker Scout
  description: Explore how Docker Scout can help you create a more secure software supply chain.
  icon: query_stats
  link: __SUBDIR__/scout/
@z

@x
- title: SSO
  description: Learn how to configure SSO for your company or organization.
  icon: key
  link: /enterprise/security/single-sign-on/
@y
- title: SSO
  description: Learn how to configure SSO for your company or organization.
  icon: key
  link: __SUBDIR__/enterprise/security/single-sign-on/
@z

@x
- title: SCIM
  description: Set up SCIM to automatically provision and deprovision users.
  icon: checklist
  link: /enterprise/security/provisioning/scim/
@y
- title: SCIM
  description: Set up SCIM to automatically provision and deprovision users.
  icon: checklist
  link: __SUBDIR__/enterprise/security/provisioning/scim/
@z

@x
- title: Roles and permissions
  description: Assign roles to individuals giving them different permissions within an organization.
  icon: badge
  link: /enterprise/security/roles-and-permissions/
@y
- title: Roles and permissions
  description: Assign roles to individuals giving them different permissions within an organization.
  icon: badge
  link: __SUBDIR__/enterprise/security/roles-and-permissions/
@z

@x
- title: Private marketplace for Extensions (Beta)
  description: Learn how to configure and set up a private marketplace with a curated list of extensions for your Docker Desktop users.
  icon: storefront
  link: /desktop/extensions/private-marketplace/
@y
- title: Private marketplace for Extensions (Beta)
  description: Learn how to configure and set up a private marketplace with a curated list of extensions for your Docker Desktop users.
  icon: storefront
  link: __SUBDIR__/desktop/extensions/private-marketplace/
@z

@x
- title: Organization access tokens
  description: Create organization access tokens as an alternative to a password.
  link: /enterprise/security/access-tokens/
  icon: password
@y
- title: Organization access tokens
  description: Create organization access tokens as an alternative to a password.
  link: __SUBDIR__/enterprise/security/access-tokens/
  icon: password
@z

@x
Docker provides security guardrails for both administrators and developers.
@y
Docker provides security guardrails for both administrators and developers.
@z

@x
If you're an administrator, you can enforce sign-in across Docker products for your developers, and
scale, manage, and secure your instances of Docker Desktop with DevOps security controls like Enhanced Container Isolation and Registry Access Management.
@y
If you're an administrator, you can enforce sign-in across Docker products for your developers, and
scale, manage, and secure your instances of Docker Desktop with DevOps security controls like Enhanced Container Isolation and Registry Access Management.
@z

@x
## For administrators
@y
## For administrators
@z

@x
Explore the security features Docker offers to satisfy your company's security policies.
@y
Explore the security features Docker offers to satisfy your company's security policies.
@z

@x
{{< grid items="grid_admins" >}}
@y
{{< grid items="grid_admins" >}}
@z
