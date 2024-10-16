%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Set up your company for success with Docker
linkTitle: Admin set up 
summary: Get the most out of Docker by streamlining workflows, standardizing development environments, and ensuring smooth deployments across your company.
description: Learn how to onboard your company and take advantage of all of the Docker products and features. 
levels: [intermediate]
@y
title: 企業における Docker 利用を成功させるための設定
linkTitle: 管理設定
summary: 企業内においてGet the most out of Docker by streamlining workflows, standardizing development environments, and ensuring smooth deployments across your company.
description: Learn how to onboard your company and take advantage of all of the Docker products and features. 
levels: [中級者向け]
@z

% params:/resource_links:
@x
    - title: Overview of Administration in Docker
      url: /admin/
    - title: Single sign-on
      url: /security/for-admins/single-sign-on/
    - title: Enforce sign-in
      url: /security/for-admins/enforce-sign-in/
    - title: Roles and permissions
      url: /security/for-admins/roles-and-permissions/
    - title: Settings Management
      url: /security/for-admins/hardened-desktop/settings-management/
    - title: Registry Access Management
      url: /security/for-admins/hardened-desktop/registry-access-management/
    - title: Image Access Management
      url: /security/for-admins/hardened-desktop/image-access-management/
    - title: Docker Build Cloud subscription information
      url: /subscription/build-cloud/build-details/
    - title: Docker Scout subscription information
      url: /subscription/scout-details/
@y
    - title: Overview of Administration in Docker
      url: __SUBDIR__/admin/
    - title: Single sign-on
      url: __SUBDIR__/security/for-admins/single-sign-on/
    - title: Enforce sign-in
      url: __SUBDIR__/security/for-admins/enforce-sign-in/
    - title: Roles and permissions
      url: __SUBDIR__/security/for-admins/roles-and-permissions/
    - title: Settings Management
      url: __SUBDIR__/security/for-admins/hardened-desktop/settings-management/
    - title: Registry Access Management
      url: __SUBDIR__/security/for-admins/hardened-desktop/registry-access-management/
    - title: Image Access Management
      url: __SUBDIR__/security/for-admins/hardened-desktop/image-access-management/
    - title: Docker Build Cloud subscription information
      url: __SUBDIR__/subscription/build-cloud/build-details/
    - title: Docker Scout subscription information
      url: __SUBDIR__/subscription/scout-details/
@z

@x
Docker's tools provide a scalable, secure platform that empowers your developers to create, ship, and run applications faster. As an administrator, you have the ability to streamline workflows, standardize development environments, and ensure smooth deployments across your organization.
@y
Docker's tools provide a scalable, secure platform that empowers your developers to create, ship, and run applications faster. As an administrator, you have the ability to streamline workflows, standardize development environments, and ensure smooth deployments across your organization.
@z

@x
By configuring Docker products to suit your company’s needs, you can optimize performance, simplify user management, and maintain control over resources. This guide will help you set up and configure Docker products to maximize productivity and success for your team whilst meeting compliance and security policies
@y
By configuring Docker products to suit your company’s needs, you can optimize performance, simplify user management, and maintain control over resources. This guide will help you set up and configure Docker products to maximize productivity and success for your team whilst meeting compliance and security policies
@z

@x
## Who’s this for?
@y
## Who’s this for?
@z

@x
- Administrators responsible for managing Docker environments within their organization
- IT leaders looking to streamline development and deployment workflows
- Teams aiming to standardize application environments across multiple users
- Organizations seeking to optimize their use of Docker products for greater scalability and efficiency
- Organizations with [Docker Business subscriptions](https://www.docker.com/pricing/).
@y
- Administrators responsible for managing Docker environments within their organization
- IT leaders looking to streamline development and deployment workflows
- Teams aiming to standardize application environments across multiple users
- Organizations seeking to optimize their use of Docker products for greater scalability and efficiency
- Organizations with [Docker Business subscriptions](https://www.docker.com/pricing/).
@z

@x
## What you’ll learn
@y
## What you’ll learn
@z

@x
- The importance of signing in to the company's Docker organization for access to usage data and enhanced functionality.
- How to standardize Docker Desktop versions and settings to create a consistent baseline for all users, while allowing flexibility for advanced developers.
- Strategies for implementing Docker’s security configurations to meet company IT and software development security requirements without hindering developer productivity.
@y
- The importance of signing in to the company's Docker organization for access to usage data and enhanced functionality.
- How to standardize Docker Desktop versions and settings to create a consistent baseline for all users, while allowing flexibility for advanced developers.
- Strategies for implementing Docker’s security configurations to meet company IT and software development security requirements without hindering developer productivity.
@z

@x
## Features covered
@y
## Features covered
@z

@x
- Organizations. These are the core structure for managing your Docker environment, grouping users, teams, and image repositories. Your organization was created with your subscription and is managed by one or more Owners. Users signed into the organization are assigned seats based on the purchased subscription.
- Enforce sign-in. By default, Docker Desktop does not require sign-in. However, you can configure settings to enforce this and ensure your developers sign in to your Docker organization.
- SSO. Without SSO, user management in a Docker organization is manual. Setting up an SSO connection between your identity provider and Docker ensures compliance with your security policy and automates user provisioning. Adding SCIM further automates user provisioning and de-provisioning.
- General and security settings. Configuring key settings will ensure smooth onboarding and usage of Docker products within your environment. Additionally, you can enable security features based on your company's specific security needs.
@y
- Organizations. These are the core structure for managing your Docker environment, grouping users, teams, and image repositories. Your organization was created with your subscription and is managed by one or more Owners. Users signed into the organization are assigned seats based on the purchased subscription.
- Enforce sign-in. By default, Docker Desktop does not require sign-in. However, you can configure settings to enforce this and ensure your developers sign in to your Docker organization.
- SSO. Without SSO, user management in a Docker organization is manual. Setting up an SSO connection between your identity provider and Docker ensures compliance with your security policy and automates user provisioning. Adding SCIM further automates user provisioning and de-provisioning.
- General and security settings. Configuring key settings will ensure smooth onboarding and usage of Docker products within your environment. Additionally, you can enable security features based on your company's specific security needs.
@z

@x
## Who needs to be involved?
@y
## Who needs to be involved?
@z

@x
- Docker organization owner: A Docker organization owner must be involved in the process and will be required for several key steps.
- DNS team: The DNS team is needed during the SSO setup to verify the company domain.
- MDM team: Responsible for distributing Docker-specific configuration files to developer machines.
- Identity Provider team: Required for configuring the identity provider and establishing the SSO connection during setup.
- Development lead: A development lead with knowledge of Docker configurations to help establish a baseline for developer settings.
- IT team: An IT representative familiar with company desktop policies to assist with aligning Docker configuration to those policies.
- Infosec: A security team member with knowledge of company development security policies to help configure security features.
- Docker testers: A small group of developers to test the new settings and configurations before full deployment.
@y
- Docker organization owner: A Docker organization owner must be involved in the process and will be required for several key steps.
- DNS team: The DNS team is needed during the SSO setup to verify the company domain.
- MDM team: Responsible for distributing Docker-specific configuration files to developer machines.
- Identity Provider team: Required for configuring the identity provider and establishing the SSO connection during setup.
- Development lead: A development lead with knowledge of Docker configurations to help establish a baseline for developer settings.
- IT team: An IT representative familiar with company desktop policies to assist with aligning Docker configuration to those policies.
- Infosec: A security team member with knowledge of company development security policies to help configure security features.
- Docker testers: A small group of developers to test the new settings and configurations before full deployment.
@z

@x
## Tools integration
@y
## Tools integration
@z

@x
Okta, Entra ID SAML 2.0, Azure Connect (OIDC), MDM solutions like Intune
@y
Okta, Entra ID SAML 2.0, Azure Connect (OIDC), MDM solutions like Intune
@z
