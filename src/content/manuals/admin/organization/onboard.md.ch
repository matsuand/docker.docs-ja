%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Onboard your organization
@y
title: Onboard your organization
@z

@x
description: Get started onboarding your Docker Team or Business organization.
keywords: business, team, organizations, get started, onboarding
@y
description: Get started onboarding your Docker Team or Business organization.
keywords: business, team, organizations, get started, onboarding
@z

@x
{{< summary-bar feature_name="Admin orgs" >}}
@y
{{< summary-bar feature_name="Admin orgs" >}}
@z

@x
Learn how to onboard your organization using Docker Hub or the Docker Admin Console.
@y
Learn how to onboard your organization using Docker Hub or the Docker Admin Console.
@z

@x
Onboarding your organization lets administrators gain visibility into user activity and enforce security settings. In addition, members of your organization receive increased pull limits and other organization wide benefits. For more details, see [Docker subscriptions and features](../../subscription/details.md).
@y
Onboarding your organization lets administrators gain visibility into user activity and enforce security settings. In addition, members of your organization receive increased pull limits and other organization wide benefits. For more details, see [Docker subscriptions and features](../../subscription/details.md).
@z

@x
In this guide, you'll learn how to do the following:
@y
In this guide, you'll learn how to do the following:
@z

@x
- Identify your users to help you efficiently allocate your subscription seats
- Invite members and owners to your organization
- Secure authentication and authorization for your organization using Single Sign-On (SSO) and System for Cross-domain Identity Management (SCIM)
- Enforce sign-on for Docker Desktop to ensure security best practices
@y
- Identify your users to help you efficiently allocate your subscription seats
- Invite members and owners to your organization
- Secure authentication and authorization for your organization using Single Sign-On (SSO) and System for Cross-domain Identity Management (SCIM)
- Enforce sign-on for Docker Desktop to ensure security best practices
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you start onboarding your organization, ensure that you:
@y
Before you start onboarding your organization, ensure that you:
@z

@x
- Have a Docker Team or Business subscription. See [Docker Pricing](https://www.docker.com/pricing/) for details.
@y
- Have a Docker Team or Business subscription. See [Docker Pricing](https://www.docker.com/pricing/) for details.
@z

@x
  > [!NOTE]
  >
  > When purchasing a self-serve subscription, the on-screen instructions guide you through creating an organization. If you have purchased a subscription through Docker Sales and you have not yet created an organization, see [Create an organization](/admin/organization/orgs).
@y
  > [!NOTE]
  >
  > When purchasing a self-serve subscription, the on-screen instructions guide you through creating an organization. If you have purchased a subscription through Docker Sales and you have not yet created an organization, see [Create an organization](__SUBDIR__/admin/organization/orgs).
@z

@x
- Familiarize yourself with Docker concepts and terminology in the [administration overview](../_index.md) and [FAQs](/faq/admin/general-faqs/).
@y
- Familiarize yourself with Docker concepts and terminology in the [administration overview](../_index.md) and [FAQs](__SUBDIR__/faq/admin/general-faqs/).
@z

@x
## Onboard with guided setup
@y
## Onboard with guided setup
@z

@x
The Admin Console has a guided setup to help you easily
onboard your organization. The guided setup steps consist of basic onboarding
tasks. If you want to onboard outside of the guided setup,
see [Recommended onboarding steps](/manuals/admin/organization/onboard.md#recommended-onboarding-steps).
@y
The Admin Console has a guided setup to help you easily
onboard your organization. The guided setup steps consist of basic onboarding
tasks. If you want to onboard outside of the guided setup,
see [Recommended onboarding steps](manuals/admin/organization/onboard.md#recommended-onboarding-steps).
@z

@x
To onboard using the guided setup,
navigate to the [Admin Console](https://app.docker.com) and
select **Guided setup** in the left-hand navigation.
@y
To onboard using the guided setup,
navigate to the [Admin Console](https://app.docker.com) and
select **Guided setup** in the left-hand navigation.
@z

@x
The guided setup walks you through the following onboarding steps:
@y
The guided setup walks you through the following onboarding steps:
@z

@x
- **Invite your team**: Invite owners and members.
- **Manage user access**: Add and verify a domain, manage users with SSO, and
enforce Docker Desktop sign-in.
- **Docker Desktop security**: Configure image access management, registry access
management, and settings management.
@y
- **Invite your team**: Invite owners and members.
- **Manage user access**: Add and verify a domain, manage users with SSO, and
enforce Docker Desktop sign-in.
- **Docker Desktop security**: Configure image access management, registry access
management, and settings management.
@z

@x
## Recommended onboarding steps
@y
## Recommended onboarding steps
@z

@x
### Step one: Identify your Docker users
@y
### Step one: Identify your Docker users
@z

@x
Identifying your users helps you allocate seats efficiently and ensures they
receive your Docker subscription benefits.
@y
Identifying your users helps you allocate seats efficiently and ensures they
receive your Docker subscription benefits.
@z

@x
1. Identify the Docker users in your organization.
   - If your organization uses device management software, like MDM or Jamf, you can use the device management software to help identify Docker users. See your device management software's documentation for details. You can identify Docker users by checking if Docker Desktop is installed at the following location on each user's machine:
      - Mac: `/Applications/Docker.app`
      - Windows: `C:\Program Files\Docker\Docker`
      - Linux: `/opt/docker-desktop`
   - If your organization doesn't use device management software or your users haven't installed Docker Desktop yet, you can survey your users.
2. Ask users to update their Docker account email to one in your organization’s domain, or create a new account with that email.
   - To update an account's email address, instruct your users to sign in to [Docker Hub](https://hub.docker.com), and update the email address to their email address in your organization's domain.
   - To create a new account, instruct your users to go [sign up](https://hub.docker.com/signup) using their email address in your organization's domain.
3. Ask your Docker sales representative or [contact sales](https://www.docker.com/pricing/contact-sales/) to get a list of Docker accounts that use an email address in your organization's domain.
@y
1. Identify the Docker users in your organization.
   - If your organization uses device management software, like MDM or Jamf, you can use the device management software to help identify Docker users. See your device management software's documentation for details. You can identify Docker users by checking if Docker Desktop is installed at the following location on each user's machine:
      - Mac: `/Applications/Docker.app`
      - Windows: `C:\Program Files\Docker\Docker`
      - Linux: `/opt/docker-desktop`
   - If your organization doesn't use device management software or your users haven't installed Docker Desktop yet, you can survey your users.
2. Ask users to update their Docker account email to one in your organization’s domain, or create a new account with that email.
   - To update an account's email address, instruct your users to sign in to [Docker Hub](https://hub.docker.com), and update the email address to their email address in your organization's domain.
   - To create a new account, instruct your users to go [sign up](https://hub.docker.com/signup) using their email address in your organization's domain.
3. Ask your Docker sales representative or [contact sales](https://www.docker.com/pricing/contact-sales/) to get a list of Docker accounts that use an email address in your organization's domain.
@z

@x
### Step two: Invite owners
@y
### Step two: Invite owners
@z

@x
When you create an organization, you are the only owner. It is optional to add additional owners. Owners can help you onboard and manage your organization.
@y
When you create an organization, you are the only owner. It is optional to add additional owners. Owners can help you onboard and manage your organization.
@z

@x
To add an owner, invite a user and assign them the owner role. For more details, see [Invite members](/admin/organization/members/).
@y
To add an owner, invite a user and assign them the owner role. For more details, see [Invite members](__SUBDIR__/admin/organization/members/).
@z

@x
### Step three: Invite members
@y
### Step three: Invite members
@z

@x
When you add users to your organization, you gain visibility into their activity and you can enforce security settings. In addition, members of your organization receive increased pull limits and other organization wide benefits.
@y
When you add users to your organization, you gain visibility into their activity and you can enforce security settings. In addition, members of your organization receive increased pull limits and other organization wide benefits.
@z

@x
To add a member, invite a user and assign them the member role. For more details, see [Invite members](/admin/organization/members/).
@y
To add a member, invite a user and assign them the member role. For more details, see [Invite members](__SUBDIR__/admin/organization/members/).
@z

@x
### Step four: Manage user access with SSO and SCIM
@y
### Step four: Manage user access with SSO and SCIM
@z

@x
Configuring SSO and SCIM is optional and only available to Docker Business subscribers. To upgrade a Docker Team subscription to a Docker Business subscription, see [Upgrade your subscription](/subscription/upgrade/).
@y
Configuring SSO and SCIM is optional and only available to Docker Business subscribers. To upgrade a Docker Team subscription to a Docker Business subscription, see [Upgrade your subscription](__SUBDIR__/subscription/upgrade/).
@z

@x
Use your identity provider (IdP) to manage members and provision them to Docker
automatically via SSO and SCIM. See the following for more details:
@y
Use your identity provider (IdP) to manage members and provision them to Docker
automatically via SSO and SCIM. See the following for more details:
@z

@x
   - [Configure SSO](/manuals/security/for-admins/single-sign-on/configure.md) to authenticate and add members when they sign in to Docker through your identity provider.
   - Optional. [Enforce SSO](/manuals/security/for-admins/single-sign-on/connect.md) to ensure that when users sign in to Docker, they must use SSO.
@y
   - [Configure SSO](manuals/security/for-admins/single-sign-on/configure.md) to authenticate and add members when they sign in to Docker through your identity provider.
   - Optional. [Enforce SSO](manuals/security/for-admins/single-sign-on/connect.md) to ensure that when users sign in to Docker, they must use SSO.
@z

@x
     > [!NOTE]
     >
     > Enforcing single sign-on (SSO) and enforcing Docker Desktop sign in
     are different features. For more details, see
     > [Enforcing sign-in versus enforcing single sign-on (SSO)](/security/for-admins/enforce-sign-in/#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
@y
     > [!NOTE]
     >
     > Enforcing single sign-on (SSO) and enforcing Docker Desktop sign in
     are different features. For more details, see
     > [Enforcing sign-in versus enforcing single sign-on (SSO)](__SUBDIR__/security/for-admins/enforce-sign-in/#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
@z

@x
   - [Configure SCIM](/security/for-admins/provisioning/scim/) to automatically provision, add, and de-provision members to Docker through your identity provider.
@y
   - [Configure SCIM](__SUBDIR__/security/for-admins/provisioning/scim/) to automatically provision, add, and de-provision members to Docker through your identity provider.
@z

@x
### Step five: Enforce sign-in for Docker Desktop
@y
### Step five: Enforce sign-in for Docker Desktop
@z

@x
By default, members of your organization can use Docker Desktop without signing
in. When users don’t sign in as a member of your organization, they don’t
receive the [benefits of your organization’s subscription](../../subscription/details.md) and they can circumvent [Docker’s security features](/security/for-admins/hardened-desktop/).
@y
By default, members of your organization can use Docker Desktop without signing
in. When users don’t sign in as a member of your organization, they don’t
receive the [benefits of your organization’s subscription](../../subscription/details.md) and they can circumvent [Docker’s security features](__SUBDIR__/security/for-admins/hardened-desktop/).
@z

@x
There are multiple ways you can enforce sign-in, depending on your company's setup and preferences:
- [Registry key method (Windows only)](/security/for-admins/enforce-sign-in/methods/#registry-key-method-windows-only)
- [`.plist` method (Mac only)](/security/for-admins/enforce-sign-in/methods/#plist-method-mac-only)
- [`registry.json` method (All)](/security/for-admins/enforce-sign-in/methods/#registryjson-method-all)
@y
There are multiple ways you can enforce sign-in, depending on your company's setup and preferences:
- [Registry key method (Windows only)](__SUBDIR__/security/for-admins/enforce-sign-in/methods/#registry-key-method-windows-only)
- [`.plist` method (Mac only)](__SUBDIR__/security/for-admins/enforce-sign-in/methods/#plist-method-mac-only)
- [`registry.json` method (All)](__SUBDIR__/security/for-admins/enforce-sign-in/methods/#registryjson-method-all)
@z

@x
### Step six: Manage Docker Desktop security
@y
### Step six: Manage Docker Desktop security
@z

@x
Docker offers the following security features to manage your organization's
security posture:
@y
Docker offers the following security features to manage your organization's
security posture:
@z

@x
- [Image Access Management](/manuals/security/for-admins/hardened-desktop/image-access-management.md): Control which types of images your developers can pull from Docker Hub.
- [Registry Access Management](/manuals/security/for-admins/hardened-desktop/registry-access-management.md): Define which registries your developers can access.
- [Settings management](/manuals/security/for-admins/hardened-desktop/settings-management.md): Set and control Docker Desktop settings for your users.
@y
- [Image Access Management](manuals/security/for-admins/hardened-desktop/image-access-management.md): Control which types of images your developers can pull from Docker Hub.
- [Registry Access Management](manuals/security/for-admins/hardened-desktop/registry-access-management.md): Define which registries your developers can access.
- [Settings management](manuals/security/for-admins/hardened-desktop/settings-management.md): Set and control Docker Desktop settings for your users.
@z

@x
## What's next
@y
## What's next
@z

@x
- [Manage Docker products](./manage-products.md) to configure access and view usage.
- Configure [Hardened Docker Desktop](/desktop/hardened-desktop/) to improve your organization’s security posture for containerized development.
- [Audit your domains](/docker-hub/domain-audit/) to ensure that all Docker users in your domain are part of your organization.
@y
- [Manage Docker products](./manage-products.md) to configure access and view usage.
- Configure [Hardened Docker Desktop](__SUBDIR__/desktop/hardened-desktop/) to improve your organization’s security posture for containerized development.
- [Audit your domains](__SUBDIR__/docker-hub/domain-audit/) to ensure that all Docker users in your domain are part of your organization.
@z

@x
Your Docker subscription provides many more additional features. To learn more, see [Docker subscriptions and features](/subscription/details/).
@y
Your Docker subscription provides many more additional features. To learn more, see [Docker subscriptions and features](__SUBDIR__/subscription/details/).
@z
