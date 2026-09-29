%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Accounts and admin release notes
linkTitle: Release notes
description: >-
  Learn about new features, bug fixes, and breaking changes for Docker accounts
  and admin features, including Docker Home, billing, security, and
  subscriptions.
keywords: accounts, admin, Docker Home, billing, subscription, security,
  release notes, what's new
@y
title: Accounts and admin release notes
linkTitle: Release notes
description: >-
  Learn about new features, bug fixes, and breaking changes for Docker accounts
  and admin features, including Docker Home, billing, security, and
  subscriptions.
keywords: accounts, admin, Docker Home, billing, subscription, security,
  release notes, what's new
@z

@x
This page lists new features, enhancements, known issues, and bug fixes for
Docker accounts and admin features, including Docker Home, billing, security,
and subscriptions.
@y
This page lists new features, enhancements, known issues, and bug fixes for
Docker accounts and admin features, including Docker Home, billing, security,
and subscriptions.
@z

@x
## 2026-02-13
@y
## 2026-02-13
@z

@x
### New
@y
### New
@z

@x
- Administrators can now control whether organization members can push content
  to their personal namespaces on Docker Hub with
  [namespace access control](/manuals/enterprise/security/hardened-desktop/namespace-access.md).
- Administrators can now prevent creating public repositories within
  organization namespaces using the
  [Disable public repositories](/manuals/docker-hub/settings.md#disable-creation-of-public-repos)
  setting.
@y
- Administrators can now control whether organization members can push content
  to their personal namespaces on Docker Hub with
  [namespace access control](manuals/enterprise/security/hardened-desktop/namespace-access.md).
- Administrators can now prevent creating public repositories within
  organization namespaces using the
  [Disable public repositories](manuals/docker-hub/settings.md#disable-creation-of-public-repos)
  setting.
@z

@x
## 2026-01-27
@y
## 2026-01-27
@z

@x
### New
@y
### New
@z

@x
- Administrators can now use an allow list with
  [Image Access Management](/manuals/enterprise/security/hardened-desktop/image-access-management.md)
  to approve specific repositories that bypass image access controls.
@y
- Administrators can now use an allow list with
  [Image Access Management](manuals/enterprise/security/hardened-desktop/image-access-management.md)
  to approve specific repositories that bypass image access controls.
@z

@x
## 2025-01-30
@y
## 2025-01-30
@z

@x
### New
@y
### New
@z

@x
- Installing Docker Desktop via the PKG installer is now generally available.
- Enforcing sign-in via configuration profiles is now generally available.
@y
- Installing Docker Desktop via the PKG installer is now generally available.
- Enforcing sign-in via configuration profiles is now generally available.
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
- New Docker subscriptions are now available. For more information, see
  [Docker subscriptions and features](https://www.docker.com/pricing?ref=Docs&refAction=DocsPlatformReleaseNotes)
  and
  [Announcing Upgraded Docker Plans: Simpler, More Value, Better Development and Productivity](https://www.docker.com/blog/november-2024-updated-plans-announcement/).
@y
- New Docker subscriptions are now available. For more information, see
  [Docker subscriptions and features](https://www.docker.com/pricing?ref=Docs&refAction=DocsPlatformReleaseNotes)
  and
  [Announcing Upgraded Docker Plans: Simpler, More Value, Better Development and Productivity](https://www.docker.com/blog/november-2024-updated-plans-announcement/).
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
  - Enforce sign-in with
    [configuration profiles](/manuals/enterprise/security/enforce-sign-in/methods.md#configuration-profiles-method-mac-only)
    (Early Access).
  - Enforce sign-in for more than one organization at a time (Early Access).
  - Deploy Docker Desktop for Mac in bulk with the
    [PKG installer](/manuals/enterprise/enterprise-deployment/pkg-install-and-configure.md)
    (Early Access).
  - [Use Desktop Settings Management via the Docker Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
    (Early Access).
@y
- Administrators can now:
  - Enforce sign-in with
    [configuration profiles](manuals/enterprise/security/enforce-sign-in/methods.md#configuration-profiles-method-mac-only)
    (Early Access).
  - Enforce sign-in for more than one organization at a time (Early Access).
  - Deploy Docker Desktop for Mac in bulk with the
    [PKG installer](manuals/enterprise/enterprise-deployment/pkg-install-and-configure.md)
    (Early Access).
  - [Use Desktop Settings Management via the Docker Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md)
    (Early Access).
@z

@x
### Bug fixes and enhancements
@y
### Bug fixes and enhancements
@z

@x
- Enhanced Container Isolation (ECI) has been improved to:
  - Permit administrators to
    [turn off Docker socket mount restrictions](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md#allowing-all-containers-to-mount-the-docker-socket).
  - Support wildcard tags when using the
    [`allowedDerivedImages` setting](/manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md#docker-socket-mount-permissions-for-derived-images).
@y
- Enhanced Container Isolation (ECI) has been improved to:
  - Permit administrators to
    [turn off Docker socket mount restrictions](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md#allowing-all-containers-to-mount-the-docker-socket).
  - Support wildcard tags when using the
    [`allowedDerivedImages` setting](manuals/enterprise/security/hardened-desktop/enhanced-container-isolation/config.md#docker-socket-mount-permissions-for-derived-images).
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
- [Personal access tokens](/manuals/security/access-tokens/personal-access-tokens.md)
  (PATs) now support expiration dates.
@y
- [Personal access tokens](manuals/security/access-tokens/personal-access-tokens.md)
  (PATs) now support expiration dates.
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
- Beta: You can now create
  [organization access tokens](/manuals/security/access-tokens/organization-access-tokens.md)
  (OATs) to enhance security for organizations and streamline access
  management for organizations in the Docker Admin Console.
@y
- Beta: You can now create
  [organization access tokens](manuals/security/access-tokens/organization-access-tokens.md)
  (OATs) to enhance security for organizations and streamline access
  management for organizations in the Docker Admin Console.
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
- Deploying Docker Desktop via the
  [MSI installer](/manuals/enterprise/enterprise-deployment/msi-install-and-configure.md)
  is now generally available.
- Two new methods to
  [enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md)
  (Windows registry key and `.plist` file) are now generally available.
@y
- Deploying Docker Desktop via the
  [MSI installer](manuals/enterprise/enterprise-deployment/msi-install-and-configure.md)
  is now generally available.
- Two new methods to
  [enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md)
  (Windows registry key and `.plist` file) are now generally available.
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
- Administrators can now view
  [organization Insights](/manuals/accounts/organization/insights.md).
@y
- Administrators can now view
  [organization Insights](manuals/accounts/organization/insights.md).
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
- You can now centrally access and manage Docker products in
  [Docker Home](https://app.docker.com).
@y
- You can now centrally access and manage Docker products in
  [Docker Home](https://app.docker.com).
@z
