%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Release notes for Docker Home, the Admin Console, billing, security, and subscription features
linkTitle: Release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Home, the Admin Console, and billing and subscription features
keywords: Docker Home, Docker Admin Console, billing, subscription, security, admin, releases, what's new
@y
title: Release notes for Docker Home, the Admin Console, billing, security, and subscription features
linkTitle: Release notes
description: Learn about the new features, bug fixes, and breaking changes for Docker Home, the Admin Console, and billing and subscription features
keywords: Docker Home, Docker Admin Console, billing, subscription, security, admin, releases, what's new
@z

@x
This page provides details on new features, enhancements, known issues, and bug fixes across Docker Home, the Admin Console, billing, security, and subscription functionalities.
@y
This page provides details on new features, enhancements, known issues, and bug fixes across Docker Home, the Admin Console, billing, security, and subscription functionalities.
@z

@x
Take a look at the [Docker Public Roadmap](https://github.com/orgs/docker/projects/51/views/1?filterQuery=) to see what's coming next.
@y
Take a look at the [Docker Public Roadmap](https://github.com/orgs/docker/projects/51/views/1?filterQuery=) to see what's coming next.
@z

@x
## 2024-12-10
@y
## 2024-12-10
@z

@x
### New
@y
### New
@z

@x
- New Docker subscriptions are now available. For more information, see [Docker
  subscriptions and features](/manuals/subscription/details.md) and [Announcing
  Upgraded Docker Plans: Simpler, More Value, Better Development and
  Productivity](https://www.docker.com/blog/november-2024-updated-plans-announcement/).
@y
- New Docker subscriptions are now available. For more information, see [Docker
  subscriptions and features](manuals/subscription/details.md) and [Announcing
  Upgraded Docker Plans: Simpler, More Value, Better Development and
  Productivity](https://www.docker.com/blog/november-2024-updated-plans-announcement/).
@z

@x
## 2024-11-18
@y
## 2024-11-18
@z

@x
### New
@y
### New
@z

@x
- Administrators can now:
  - Enforce sign-in with macOS [configuration profiles](/manuals/security/for-admins/enforce-sign-in/methods.md#configuration-profiles-method-mac-only) (Early Access).
  - Enforce sign-in for more than one organization at a time (Early Access).
  - Deploy Docker Desktop for Mac in bulk with the [PKG installer](/manuals/desktop/setup/install/enterprise-deployment/pkg-install-and-configure.md) (Early Access).
  - [Use Desktop Settings Management via the Docker Admin Console](/manuals/security/for-admins/hardened-desktop/settings-management/configure-admin-console.md) (Early Access).
@y
- Administrators can now:
  - Enforce sign-in with macOS [configuration profiles](manuals/security/for-admins/enforce-sign-in/methods.md#configuration-profiles-method-mac-only) (Early Access).
  - Enforce sign-in for more than one organization at a time (Early Access).
  - Deploy Docker Desktop for Mac in bulk with the [PKG installer](manuals/desktop/setup/install/enterprise-deployment/pkg-install-and-configure.md) (Early Access).
  - [Use Desktop Settings Management via the Docker Admin Console](manuals/security/for-admins/hardened-desktop/settings-management/configure-admin-console.md) (Early Access).
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Enhance Container Isolation (ECI) has been improved to:
  - Permit admins to [turn off Docker socket mount restrictions](/manuals/security/for-admins/hardened-desktop/enhanced-container-isolation/config.md#allowing-all-containers-to-mount-the-docker-socket).
  - Support wildcard tags when using the [`allowedDerivedImages` setting](/manuals/security/for-admins/hardened-desktop/enhanced-container-isolation/config.md#docker-socket-mount-permissions-for-derived-images).
@y
- Enhance Container Isolation (ECI) has been improved to:
  - Permit admins to [turn off Docker socket mount restrictions](manuals/security/for-admins/hardened-desktop/enhanced-container-isolation/config.md#allowing-all-containers-to-mount-the-docker-socket).
  - Support wildcard tags when using the [`allowedDerivedImages` setting](manuals/security/for-admins/hardened-desktop/enhanced-container-isolation/config.md#docker-socket-mount-permissions-for-derived-images).
@z

@x
## 2024-11-11
@y
## 2024-11-11
@z

@x
### New
@y
### New
@z

@x
- [Personal access tokens](/security/for-developers/access-tokens/) (PATs) now support expiration dates.
@y
- [Personal access tokens](__SUBDIR__/security/for-developers/access-tokens/) (PATs) now support expiration dates.
@z

@x
## 2024-10-15
@y
## 2024-10-15
@z

@x
### New
@y
### New
@z

@x
- Beta: You can now create [organization access tokens](/security/for-admins/access-tokens/) (OATs) to enhance security for organizations and streamline access management for organizations in the Docker Admin Console.
@y
- Beta: You can now create [organization access tokens](__SUBDIR__/security/for-admins/access-tokens/) (OATs) to enhance security for organizations and streamline access management for organizations in the Docker Admin Console.
@z

@x
## 2024-08-29
@y
## 2024-08-29
@z

@x
### New
@y
### New
@z

@x
- Deploying Docker Desktop via the [MSI installer](/manuals/desktop/setup/install/enterprise-deployment/msi-install-and-configure.md) is now generally available.
- Two new methods to [enforce sign-in](/manuals/security/for-admins/enforce-sign-in/_index.md) (Windows registry key and `.plist` file) are now generally available.
@y
- Deploying Docker Desktop via the [MSI installer](manuals/desktop/setup/install/enterprise-deployment/msi-install-and-configure.md) is now generally available.
- Two new methods to [enforce sign-in](manuals/security/for-admins/enforce-sign-in/_index.md) (Windows registry key and `.plist` file) are now generally available.
@z

@x
## 2024-08-24
@y
## 2024-08-24
@z

@x
### New
@y
### New
@z

@x
- Administrators can now view [organization insights](/manuals/admin/organization/insights.md) (Early Access).
@y
- Administrators can now view [organization insights](manuals/admin/organization/insights.md) (Early Access).
@z

@x
## 2024-07-17
@y
## 2024-07-17
@z

@x
### New
@y
### New
@z

@x
- You can now centrally access and manage Docker products in [Docker Home](https://app.docker.com) (Early Access).
@y
- You can now centrally access and manage Docker products in [Docker Home](https://app.docker.com) (Early Access).
@z
