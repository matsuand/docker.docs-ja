%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Understand what happens when you force users to sign in to Docker Desktop
toc_max: 2
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security, .plist, registry key, mac, windows
title: Enforce sign-in for Docker Desktop
linkTitle: Enforce sign-in
@y
description: Understand what happens when you force users to sign in to Docker Desktop
toc_max: 2
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security, .plist, registry key, mac, windows
title: Enforce sign-in for Docker Desktop
linkTitle: Enforce sign-in
@z

@x
By default, members of your organization can use Docker Desktop without signing
in. When users don’t sign in as a member of your organization, they don’t
receive the [benefits of your organization’s
subscription](../../../subscription/details.md) and they can circumvent [Docker’s
security features](/manuals/security/for-admins/hardened-desktop/_index.md) for your organization.
@y
By default, members of your organization can use Docker Desktop without signing
in. When users don’t sign in as a member of your organization, they don’t
receive the [benefits of your organization’s
subscription](../../../subscription/details.md) and they can circumvent [Docker’s
security features](manuals/security/for-admins/hardened-desktop/_index.md) for your organization.
@z

@x
There are multiple methods for enforcing sign-in, depending on your companies' set up and preferences:
- [Registry key method (Windows only)](methods.md#registry-key-method-windows-only){{< badge color=green text="New" >}}
- [Configuration profiles method (Mac only)](methods.md#configuration-profiles-method-mac-only){{< badge color=green text="New" >}}
- [`.plist` method (Mac only)](methods.md#plist-method-mac-only){{< badge color=green text="New" >}}
- [`registry.json` method (All)](methods.md#registryjson-method-all)
@y
There are multiple methods for enforcing sign-in, depending on your companies' set up and preferences:
- [Registry key method (Windows only)](methods.md#registry-key-method-windows-only){{< badge color=green text="New" >}}
- [Configuration profiles method (Mac only)](methods.md#configuration-profiles-method-mac-only){{< badge color=green text="New" >}}
- [`.plist` method (Mac only)](methods.md#plist-method-mac-only){{< badge color=green text="New" >}}
- [`registry.json` method (All)](methods.md#registryjson-method-all)
@z

@x
## How is sign-in enforced?
@y
## How is sign-in enforced?
@z

@x
When Docker Desktop starts and it detects a registry key, `.plist` file, or `registry.json` file, the following occurs:
@y
When Docker Desktop starts and it detects a registry key, `.plist` file, or `registry.json` file, the following occurs:
@z

@x
- A **Sign in required!** prompt appears requiring the user to sign
  in as a member of your organization to use Docker Desktop. ![Enforce Sign-in
  Prompt](../../images/enforce-sign-in.png?w=400)
- When a user signs in to an account that isn’t a member of your organization,
  they are automatically signed out and can’t use Docker Desktop. The user
  can select **Sign in** and try again.
- When a user signs in to an account that is a member of your organization, they
 can use Docker Desktop.
- When a user signs out, the **Sign in required!** prompt appears and they can
  no longer use Docker Desktop.
@y
- A **Sign in required!** prompt appears requiring the user to sign
  in as a member of your organization to use Docker Desktop. ![Enforce Sign-in
  Prompt](../../images/enforce-sign-in.png?w=400)
- When a user signs in to an account that isn’t a member of your organization,
  they are automatically signed out and can’t use Docker Desktop. The user
  can select **Sign in** and try again.
- When a user signs in to an account that is a member of your organization, they
 can use Docker Desktop.
- When a user signs out, the **Sign in required!** prompt appears and they can
  no longer use Docker Desktop.
@z

@x
## Enforcing sign-in versus enforcing single sign-on (SSO)
@y
## Enforcing sign-in versus enforcing single sign-on (SSO)
@z

@x
[Enforcing SSO](/manuals/security/for-admins/single-sign-on/connect.md#optional-enforce-sso) and enforcing sign-in are different features. The following table provides a
description and benefits when using each feature.
@y
[Enforcing SSO](manuals/security/for-admins/single-sign-on/connect.md#optional-enforce-sso) and enforcing sign-in are different features. The following table provides a
description and benefits when using each feature.
@z

@x
| Enforcement                       | Description                                                     | Benefits                                                                                                                                                                                                                                                   |
|:----------------------------------|:----------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Enforce sign-in only              | Users must sign in before using Docker Desktop.                 | Ensures users receive the benefits of your subscription and ensures security features are applied. In addition, you gain insights into users’ activity.                                                                                                    |
| Enforce single sign-on (SSO) only | If users sign in, they must sign in using SSO.                  | Centralizes authentication and enforces unified policies set by the identity provider.                                                                                                                                                                     |
| Enforce both                      | Users must sign in using SSO before using Docker Desktop.       | Ensures users receive the benefits of your subscription and ensures security features are applied. In addition, you gain insights into users’ activity. Finally, it centralizes authentication and enforces unified policies set by the identity provider. |
| Enforce neither                   | If users sign in, they can use SSO or their Docker credentials. | Lets users access Docker Desktop without barriers, but at the cost of reduced security and insights.                                                                                                                                                  |
@y
| Enforcement                       | Description                                                     | Benefits                                                                                                                                                                                                                                                   |
|:----------------------------------|:----------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Enforce sign-in only              | Users must sign in before using Docker Desktop.                 | Ensures users receive the benefits of your subscription and ensures security features are applied. In addition, you gain insights into users’ activity.                                                                                                    |
| Enforce single sign-on (SSO) only | If users sign in, they must sign in using SSO.                  | Centralizes authentication and enforces unified policies set by the identity provider.                                                                                                                                                                     |
| Enforce both                      | Users must sign in using SSO before using Docker Desktop.       | Ensures users receive the benefits of your subscription and ensures security features are applied. In addition, you gain insights into users’ activity. Finally, it centralizes authentication and enforces unified policies set by the identity provider. |
| Enforce neither                   | If users sign in, they can use SSO or their Docker credentials. | Lets users access Docker Desktop without barriers, but at the cost of reduced security and insights.                                                                                                                                                  |
@z

@x
## What's next?
@y
## What's next?
@z

@x
- To enforce sign-in, review the [Methods](/manuals/security/for-admins/enforce-sign-in/methods.md) guide.
- To enforce SSO, review the [Enforce SSO](/manuals/security/for-admins/single-sign-on/connect.md) steps.
@y
- To enforce sign-in, review the [Methods](manuals/security/for-admins/enforce-sign-in/methods.md) guide.
- To enforce SSO, review the [Enforce SSO](manuals/security/for-admins/single-sign-on/connect.md) steps.
@z
