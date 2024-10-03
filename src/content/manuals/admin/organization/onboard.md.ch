%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Onboard your organization
weight: 20
description: Get started onboarding your Docker Team or Business organization.
keywords: business, team, organizations, get started, onboarding
@y
title: Onboard your organization
weight: 20
description: Get started onboarding your Docker Team or Business organization.
keywords: business, team, organizations, get started, onboarding
@z

@x
{{< include "admin-early-access.md" >}}
@y
{{< include "admin-early-access.md" >}}
@z

@x
Learn how to onboard your organization using Docker Hub or the Docker Admin Console.
@y
Learn how to onboard your organization using Docker Hub or the Docker Admin Console.
@z

@x
Onboarding your organization lets you gain visibility into the activity of your users and enforce security settings. In addition, members of your organization receive increased pull limits and other organization wide benefits. For more details, see [Docker subscriptions and features](/subscription/core-subscription/details/).
@y
Onboarding your organization lets you gain visibility into the activity of your users and enforce security settings. In addition, members of your organization receive increased pull limits and other organization wide benefits. For more details, see [Docker subscriptions and features](__SUBDIR__/subscription/core-subscription/details/).
@z

@x
In this guide, you'll learn how to get started with the following:
@y
In this guide, you'll learn how to get started with the following:
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
Before you start to onboard your organization, ensure that you:
- Have a Docker Team or Business subscription. See [Pricing & Subscriptions](https://www.docker.com/pricing/) for details.
@y
Before you start to onboard your organization, ensure that you:
- Have a Docker Team or Business subscription. See [Pricing & Subscriptions](https://www.docker.com/pricing/) for details.
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
- Familiarize yourself with Docker concepts and terminology in the [glossary](/glossary/) and [FAQs](/faq/admin/general-faqs/).
@y
- Familiarize yourself with Docker concepts and terminology in the [glossary](__SUBDIR__/glossary/) and [FAQs](__SUBDIR__/faq/admin/general-faqs/).
@z

@x
## Step 1: Identify your Docker users and their Docker accounts
@y
## Step 1: Identify your Docker users and their Docker accounts
@z

@x
Identifying your users will ensure that you allocate your subscription seats efficiently and that all your Docker users receive the benefits of your subscription.
@y
Identifying your users will ensure that you allocate your subscription seats efficiently and that all your Docker users receive the benefits of your subscription.
@z

@x
1. Identify the Docker users in your organization.
   - If your organization uses device management software, like MDM or JAMF, you may use the device management software to help identify Docker users. See your device management software's documentation for details. You can identify Docker users by checking if Docker Desktop is installed at the following location on each user's machine:
      - Mac: `/Applications/Docker.app`
      - Windows: `C:\Program Files\Docker\Docker`
      - Linux: `/opt/docker-desktop`
   - If your organization doesn't use device management software or your users haven't installed Docker Desktop yet, you may survey your users.
2. Instruct all your Docker users in your organization to update their existing Docker account's email address to an address that's in your organization's domain, or to create a new account using an email address in your organization's domain.
   - To update an account's email address, instruct your users to sign in to [Docker Hub](https://hub.docker.com), and update the email address to their email address in your organization's domain.
   - To create a new account, instruct your users to go [sign up](https://hub.docker.com/signup) using their email address in your organization's domain.
3. Ask your Docker sales representative or [contact sales](https://www.docker.com/pricing/contact-sales/) to get a list of Docker accounts that use an email address in your organization's domain.
@y
1. Identify the Docker users in your organization.
   - If your organization uses device management software, like MDM or JAMF, you may use the device management software to help identify Docker users. See your device management software's documentation for details. You can identify Docker users by checking if Docker Desktop is installed at the following location on each user's machine:
      - Mac: `/Applications/Docker.app`
      - Windows: `C:\Program Files\Docker\Docker`
      - Linux: `/opt/docker-desktop`
   - If your organization doesn't use device management software or your users haven't installed Docker Desktop yet, you may survey your users.
2. Instruct all your Docker users in your organization to update their existing Docker account's email address to an address that's in your organization's domain, or to create a new account using an email address in your organization's domain.
   - To update an account's email address, instruct your users to sign in to [Docker Hub](https://hub.docker.com), and update the email address to their email address in your organization's domain.
   - To create a new account, instruct your users to go [sign up](https://hub.docker.com/signup) using their email address in your organization's domain.
3. Ask your Docker sales representative or [contact sales](https://www.docker.com/pricing/contact-sales/) to get a list of Docker accounts that use an email address in your organization's domain.
@z

@x
## Step 2: Invite owners
@y
## Step 2: Invite owners
@z

@x
When you create an organization, you are the only owner. You may optionally add additional owners. Owners can help you onboard and manage your organization.
@y
When you create an organization, you are the only owner. You may optionally add additional owners. Owners can help you onboard and manage your organization.
@z

@x
To add an owner, invite a user and assign them the owner role. For more details, see [Invite members](/admin/organization/members/).
@y
To add an owner, invite a user and assign them the owner role. For more details, see [Invite members](__SUBDIR__/admin/organization/members/).
@z

@x
## Step 3: Invite members
@y
## Step 3: Invite members
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
## Step 4: Manage members with SSO and SCIM
@y
## Step 4: Manage members with SSO and SCIM
@z

@x
Configuring SSO and SCIM is optional and only available to Docker Business subscribers. To upgrade a Docker Team subscription to a Docker Business subscription, see [Upgrade your subscription](/subscription/upgrade/).
@y
Configuring SSO and SCIM is optional and only available to Docker Business subscribers. To upgrade a Docker Team subscription to a Docker Business subscription, see [Upgrade your subscription](__SUBDIR__/subscription/upgrade/).
@z

@x
You can manage your members in your identity provider and automatically provision them to your Docker organization with SSO and SCIM. See the following for more details.
   - [Configure SSO](/security/for-admins/single-sign-on/) to authenticate and add members when they sign in to Docker through your identity provider.
   - Optional: [Enforce SSO](/security/for-admins/single-sign-on/connect/#optional-enforce-sso) to ensure that when users sign in to Docker, they must use SSO.
     > [!NOTE]
     >
     > Enforcing single sign-on (SSO) and [Step 5: Enforce sign-in for Docker
     > Desktop](#step-5-enforce-sign-in-for-docker-desktop) are different
     > features. For more details, see
     > [Enforcing sign-in versus enforcing single sign-on (SSO)](/security/for-admins/enforce-sign-in/#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
   - [Configure SCIM](/security/for-admins/provisioning/scim/) to automatically provision, add, and de-provision members to Docker through your identity provider.
@y
You can manage your members in your identity provider and automatically provision them to your Docker organization with SSO and SCIM. See the following for more details.
   - [Configure SSO](__SUBDIR__/security/for-admins/single-sign-on/) to authenticate and add members when they sign in to Docker through your identity provider.
   - Optional: [Enforce SSO](__SUBDIR__/security/for-admins/single-sign-on/connect/#optional-enforce-sso) to ensure that when users sign in to Docker, they must use SSO.
     > [!NOTE]
     >
     > Enforcing single sign-on (SSO) and [Step 5: Enforce sign-in for Docker
     > Desktop](#step-5-enforce-sign-in-for-docker-desktop) are different
     > features. For more details, see
     > [Enforcing sign-in versus enforcing single sign-on (SSO)](__SUBDIR__/security/for-admins/enforce-sign-in/#enforcing-sign-in-versus-enforcing-single-sign-on-sso).
   - [Configure SCIM](__SUBDIR__/security/for-admins/provisioning/scim/) to automatically provision, add, and de-provision members to Docker through your identity provider.
@z

@x
## Step 5: Enforce sign-in for Docker Desktop
@y
## Step 5: Enforce sign-in for Docker Desktop
@z

@x
By default, members of your organization can use Docker Desktop without signing
in. When users don’t sign in as a member of your organization, they don’t
receive the [benefits of your organization’s
subscription](/subscription/core-subscription/details/) and they can circumvent
[Docker’s security features](/security/for-admins/hardened-desktop/) for your
organization.
@y
By default, members of your organization can use Docker Desktop without signing
in. When users don’t sign in as a member of your organization, they don’t
receive the [benefits of your organization’s
subscription](__SUBDIR__/subscription/core-subscription/details/) and they can circumvent
[Docker’s security features](__SUBDIR__/security/for-admins/hardened-desktop/) for your
organization.
@z

@x
There are multiple ways you can enforce sign-in, depending on your company's
set up and preferences:
- [Registry key method (Windows only)](/security/for-admins/enforce-sign-in/methods/#registry-key-method-windows-only)
- [`.plist` method (Mac only)](/security/for-admins/enforce-sign-in/methods/#plist-method-mac-only)
- [`registry.json` method (All)](/security/for-admins/enforce-sign-in/methods/#registryjson-method-all)
@y
There are multiple ways you can enforce sign-in, depending on your company's
set up and preferences:
- [Registry key method (Windows only)](__SUBDIR__/security/for-admins/enforce-sign-in/methods/#registry-key-method-windows-only)
- [`.plist` method (Mac only)](__SUBDIR__/security/for-admins/enforce-sign-in/methods/#plist-method-mac-only)
- [`registry.json` method (All)](__SUBDIR__/security/for-admins/enforce-sign-in/methods/#registryjson-method-all)
@z

@x
## What's next
@y
## What's next
@z

@x
- [Create](/docker-hub/repos/create/) and [manage](/docker-hub/repos/) repositories.
- Create [teams](/admin/organization/manage-a-team/) for fine-grained repository access.
- Configure [Hardened Docker Desktop](/desktop/hardened-desktop/) to improve your organization’s security posture for containerized development.
- [Audit your domains](/docker-hub/domain-audit/) to ensure that all Docker users in your domain are part of your organization.
@y
- [Create](__SUBDIR__/docker-hub/repos/create/) and [manage](__SUBDIR__/docker-hub/repos/) repositories.
- Create [teams](__SUBDIR__/admin/organization/manage-a-team/) for fine-grained repository access.
- Configure [Hardened Docker Desktop](__SUBDIR__/desktop/hardened-desktop/) to improve your organization’s security posture for containerized development.
- [Audit your domains](__SUBDIR__/docker-hub/domain-audit/) to ensure that all Docker users in your domain are part of your organization.
@z

@x
Your Docker subscription provides many more additional features. To learn more, see [Docker subscriptions and features](/subscription/details/).
@y
Your Docker subscription provides many more additional features. To learn more, see [Docker subscriptions and features](__SUBDIR__/subscription/details/).
@z
