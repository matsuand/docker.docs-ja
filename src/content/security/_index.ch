%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn about security features Docker has to offer and explore best practices
keywords: docker, docker hub, docker desktop, security
title: Security
grid_admins:
- title: Settings Management
  description: Learn how Settings Management can secure your developers' workflows.
  icon: shield_locked
  link: /desktop/hardened-desktop/settings-management/
- title: Enhanced Container Isolation
  description: Understand how Enhanced Container Isolation can prevent container attacks.
  icon: security
  link: /desktop/hardened-desktop/enhanced-container-isolation/
- title: Registry Access Management
  description: Control the registries developers can access while using Docker Desktop.
  icon: home_storage
  link: /security/for-admins/registry-access-management/
- title: Image Access Management
  description: Control the images developers can pull from Docker Hub.
  icon: photo_library
  link: /security/for-admins/image-access-management/
- title: Enforce sign-in
  description: Configure sign-in for members of your teams and organizations.
  link: /security/for-admins/configure-sign-in/
  icon: passkey
- title: Domain audit
  description: Identify uncaptured users in your organization.
  link: /security/for-admins/domain-audit/
  icon: person_search
- title: Docker Scout
  description: Explore how Docker Scout can help you create a more secure software supply chain.
  icon: query_stats
  link: /scout/
- title: SSO
  description: Learn how to configure SSO for your company or organization.
  icon: key
  link: /security/for-admins/single-sign-on/
- title: SCIM
  description: Set up SCIM to automatically provision and deprovision users.
  icon: checklist
  link: /security/for-admins/scim/
- title: Roles and permissions
  description: Assign roles to individuals giving them different permissions within an organization. 
  icon: badge
  link: /security/for-admins/roles-and-permissions/
- title: Private marketplace for Extensions (Early Access)
  description: Learn how to configure and set up a private marketplace with a curated list of extensions for your Docker Desktop users.
  icon: storefront
  link: /desktop/extensions/private-marketplace/
grid_developers: 
- title: Set up two-factor authentication
  description: Add an extra layer of authentication to your Docker account.
  link: /security/for-developers/2fa/
  icon: phonelink_lock
- title: Manage access tokens
  description: Create personal access tokens as an alternative to your password.
  icon: password
  link: /security/for-developers/access-tokens/
- title: Static vulnerability scanning
  description: Automatically run a point-in-time scan on your Docker images for vulnerabilities.
  icon: image_search
  link: /docker-hub/vulnerability-scanning/
- title: Docker Engine security
  description: Understand how to keep Docker Engine secure.
  icon: security
  link: /engine/security/
- title: Secrets in Docker Compose
  description: Learn how to use secrets in Docker Compose.
  icon: privacy_tip
  link: /compose/use-secrets/
grid_resources:
- title: Security FAQs
  description: Explore common security FAQs.
  icon: help
  link: /faq/security/general/
- title: Security best practices
  description: Understand the steps you can take to improve the security of your container.
  icon: category
  link: /develop/security-best-practices/
- title: Docker Scout
  description: Explore how Docker Scout can help you create a more secure software supply chain.
  icon: query_stats
  link: /scout/
---
@y
---
description: Learn about security features Docker has to offer and explore best practices
keywords: docker, docker hub, docker desktop, security
title: Security
grid_admins:
- title: Settings Management
  description: Learn how Settings Management can secure your developers' workflows.
  icon: shield_locked
  link: /desktop/hardened-desktop/settings-management/
- title: Enhanced Container Isolation
  description: Understand how Enhanced Container Isolation can prevent container attacks.
  icon: security
  link: /desktop/hardened-desktop/enhanced-container-isolation/
- title: Registry Access Management
  description: Control the registries developers can access while using Docker Desktop.
  icon: home_storage
  link: /security/for-admins/registry-access-management/
- title: Image Access Management
  description: Control the images developers can pull from Docker Hub.
  icon: photo_library
  link: /security/for-admins/image-access-management/
- title: Enforce sign-in
  description: Configure sign-in for members of your teams and organizations.
  link: /security/for-admins/configure-sign-in/
  icon: passkey
- title: Domain audit
  description: Identify uncaptured users in your organization.
  link: /security/for-admins/domain-audit/
  icon: person_search
- title: Docker Scout
  description: Explore how Docker Scout can help you create a more secure software supply chain.
  icon: query_stats
  link: /scout/
- title: SSO
  description: Learn how to configure SSO for your company or organization.
  icon: key
  link: /security/for-admins/single-sign-on/
- title: SCIM
  description: Set up SCIM to automatically provision and deprovision users.
  icon: checklist
  link: /security/for-admins/scim/
- title: Roles and permissions
  description: Assign roles to individuals giving them different permissions within an organization. 
  icon: badge
  link: /security/for-admins/roles-and-permissions/
- title: Private marketplace for Extensions (Early Access)
  description: Learn how to configure and set up a private marketplace with a curated list of extensions for your Docker Desktop users.
  icon: storefront
  link: /desktop/extensions/private-marketplace/
grid_developers: 
- title: Set up two-factor authentication
  description: Add an extra layer of authentication to your Docker account.
  link: /security/for-developers/2fa/
  icon: phonelink_lock
- title: Manage access tokens
  description: Create personal access tokens as an alternative to your password.
  icon: password
  link: /security/for-developers/access-tokens/
- title: Static vulnerability scanning
  description: Automatically run a point-in-time scan on your Docker images for vulnerabilities.
  icon: image_search
  link: /docker-hub/vulnerability-scanning/
- title: Docker Engine security
  description: Understand how to keep Docker Engine secure.
  icon: security
  link: /engine/security/
- title: Secrets in Docker Compose
  description: Learn how to use secrets in Docker Compose.
  icon: privacy_tip
  link: /compose/use-secrets/
grid_resources:
- title: Security FAQs
  description: Explore common security FAQs.
  icon: help
  link: /faq/security/general/
- title: Security best practices
  description: Understand the steps you can take to improve the security of your container.
  icon: category
  link: /develop/security-best-practices/
- title: Docker Scout
  description: Explore how Docker Scout can help you create a more secure software supply chain.
  icon: query_stats
  link: /scout/
---
@z

@x
Docker provides security guardrails for both administrators and developers. 
@y
Docker provides security guardrails for both administrators and developers. 
@z

@x
If you're an administrator, you can enforce sign in across Docker products for your developers, and 
scale, manage, and secure your instances of Docker Desktop with DevOps security controls like Enhanced Container Isolation and Registry Access Management. 
@y
If you're an administrator, you can enforce sign in across Docker products for your developers, and 
scale, manage, and secure your instances of Docker Desktop with DevOps security controls like Enhanced Container Isolation and Registry Access Management. 
@z

@x
For both administrators and developers, Docker provides security-specific products such as Docker Scout, for securing your software supply chain with proactive image vulnerability monitoring and remediation strategies. 
@y
For both administrators and developers, Docker provides security-specific products such as Docker Scout, for securing your software supply chain with proactive image vulnerability monitoring and remediation strategies. 
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

@x
## For developers
@y
## For developers
@z

@x
See how you can protect your local environments, infrastructure, and networks without impeding productivity.
@y
See how you can protect your local environments, infrastructure, and networks without impeding productivity.
@z

@x
{{< grid items="grid_developers" >}}
@y
{{< grid items="grid_developers" >}}
@z

@x
## Further resources
@y
## Further resources
@z

@x
{{< grid items="grid_resources" >}}
@y
{{< grid items="grid_resources" >}}
@z
