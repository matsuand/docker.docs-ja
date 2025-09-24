%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Enforce sign-in for Docker Desktop
linkTitle: Enforce sign-in
description: Require users to sign in to Docker Desktop to access organization benefits and security features
toc_max: 2
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security, .plist, registry key, mac, windows, organization
@y
title: Enforce sign-in for Docker Desktop
linkTitle: Enforce sign-in
description: Require users to sign in to Docker Desktop to access organization benefits and security features
toc_max: 2
keywords: authentication, registry.json, configure, enforce sign-in, docker desktop, security, .plist, registry key, mac, windows, organization
@z

@x
{{< summary-bar feature_name="Enforce sign-in" >}}
@y
{{< summary-bar feature_name="Enforce sign-in" >}}
@z

@x
By default, users can access Docker Desktop without signing in to your organization.
When users don't sign in as organization members, they miss out on subscription benefits and can bypass security features configured for your organization.
@y
By default, users can access Docker Desktop without signing in to your organization.
When users don't sign in as organization members, they miss out on subscription benefits and can bypass security features configured for your organization.
@z

@x
You can enforce sign-in using several methods, depending on your setup:
@y
You can enforce sign-in using several methods, depending on your setup:
@z

@x
- [Registry key method (Windows only)](methods.md#registry-key-method-windows-only)
- [Configuration profiles method (Mac only)](methods.md#configuration-profiles-method-mac-only)
- [`.plist` method (Mac only)](methods.md#plist-method-mac-only)
- [`registry.json` method (All)](methods.md#registryjson-method-all)
@y
- [Registry key method (Windows only)](methods.md#registry-key-method-windows-only)
- [Configuration profiles method (Mac only)](methods.md#configuration-profiles-method-mac-only)
- [`.plist` method (Mac only)](methods.md#plist-method-mac-only)
- [`registry.json` method (All)](methods.md#registryjson-method-all)
@z

@x
This page provides an overview of how sign-in enforcement works.
@y
This page provides an overview of how sign-in enforcement works.
@z

@x
## How sign-in enforcement works
@y
## How sign-in enforcement works
@z

@x
When Docker Desktop detects a registry key, `.plist` file, or
`registry.json` file:
@y
When Docker Desktop detects a registry key, `.plist` file, or
`registry.json` file:
@z

@x
- A `Sign in required!` prompt appears, requiring users to sign
  in as organization members to use Docker Desktop.
- If users sign in with accounts that aren't organization members, they're
  automatically signed out and can't use Docker Desktop. They can select **Sign in**
  to try again with a different account.
- When users sign in with organization member accounts, they can use Docker
  Desktop normally.
- When users sign out, the `Sign in required!` prompt reappears and they can
  no longer use Docker Desktop unless they sign back in.
@y
- A `Sign in required!` prompt appears, requiring users to sign
  in as organization members to use Docker Desktop.
- If users sign in with accounts that aren't organization members, they're
  automatically signed out and can't use Docker Desktop. They can select **Sign in**
  to try again with a different account.
- When users sign in with organization member accounts, they can use Docker
  Desktop normally.
- When users sign out, the `Sign in required!` prompt reappears and they can
  no longer use Docker Desktop unless they sign back in.
@z

@x
> [!NOTE]
>
> Enforcing sign-in for Docker Desktop doesn't affect Docker CLI access. CLI access is only restricted for organizations that enforce single sign-on (SSO).
@y
> [!NOTE]
>
> Enforcing sign-in for Docker Desktop doesn't affect Docker CLI access. CLI access is only restricted for organizations that enforce single sign-on (SSO).
@z

@x
## Enforcing sign-in versus enforcing single sign-on (SSO)
@y
## Enforcing sign-in versus enforcing single sign-on (SSO)
@z

@x
Enforcing Docker Desktop sign-in and [enforcing SSO](/manuals/enterprise/security/single-sign-on/connect.md#optional-enforce-sso) are different features that serve different purposes:
@y
Enforcing Docker Desktop sign-in and [enforcing SSO](manuals/enterprise/security/single-sign-on/connect.md#optional-enforce-sso) are different features that serve different purposes:
@z

@x
| Enforcement                       | Description                                                     | Benefits                                                                                                                                                                                                                                                   |
|:----------------------------------|:----------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Enforce sign-in only              | Users must sign in before using Docker Desktop                 | Ensures users receive the benefits of your subscription and ensures security features are applied. In addition, you gain insights into users’ activity.                                                                                                    |
| Enforce single sign-on (SSO) only | If users sign in, they must sign in using SSO                  | Centralizes authentication and enforces unified policies set by the identity provider.                                                                                                                                                                     |
| Enforce both                      | Users must sign in using SSO before using Docker Desktop       | Ensures users receive the benefits of your subscription and ensures security features are applied. In addition, you gain insights into users’ activity. It also centralizes authentication and enforces unified policies set by the identity provider. |
| Enforce neither                   | If users sign in, they can use SSO or their Docker credentials | Lets users access Docker Desktop without barriers, at the cost of reduced security and insights.                                                                                                                                                  |
@y
| Enforcement                       | Description                                                     | Benefits                                                                                                                                                                                                                                                   |
|:----------------------------------|:----------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Enforce sign-in only              | Users must sign in before using Docker Desktop                 | Ensures users receive the benefits of your subscription and ensures security features are applied. In addition, you gain insights into users’ activity.                                                                                                    |
| Enforce single sign-on (SSO) only | If users sign in, they must sign in using SSO                  | Centralizes authentication and enforces unified policies set by the identity provider.                                                                                                                                                                     |
| Enforce both                      | Users must sign in using SSO before using Docker Desktop       | Ensures users receive the benefits of your subscription and ensures security features are applied. In addition, you gain insights into users’ activity. It also centralizes authentication and enforces unified policies set by the identity provider. |
| Enforce neither                   | If users sign in, they can use SSO or their Docker credentials | Lets users access Docker Desktop without barriers, at the cost of reduced security and insights.                                                                                                                                                  |
@z

@x
## Next steps
@y
## Next steps
@z

@x
- To set up sign-in enforcement, see [Configure sign-in enforcement](/manuals/enterprise/security/enforce-sign-in/methods.md).
- To configure SSO enforcement, see [Enforce SSO](/manuals/enterprise/security/single-sign-on/connect.md).
@y
- To set up sign-in enforcement, see [Configure sign-in enforcement](manuals/enterprise/security/enforce-sign-in/methods.md).
- To configure SSO enforcement, see [Enforce SSO](manuals/enterprise/security/single-sign-on/connect.md).
@z
