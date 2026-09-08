%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Set up your company for success with Docker
linkTitle: Admin set up
summary: Get the most out of Docker by streamlining workflows, standardizing development environments, and ensuring smooth deployments across your company.
description: Learn how to onboard your company and take advantage of all of the Docker products and features.
keywords: admin, onboarding, deployment, organization setup, docker business, rollout
@y
title: Set up your company for success with Docker
linkTitle: Admin set up
summary: Get the most out of Docker by streamlining workflows, standardizing development environments, and ensuring smooth deployments across your company.
description: Learn how to onboard your company and take advantage of all of the Docker products and features.
keywords: admin, onboarding, deployment, organization setup, docker business, rollout
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
Docker's tools provide a scalable, secure platform that empowers your
developers to create, ship, and run applications faster. As an administrator,
you can streamline workflows, standardize development environments, and ensure
smooth deployments across your organization.
@y
Docker's tools provide a scalable, secure platform that empowers your
developers to create, ship, and run applications faster. As an administrator,
you can streamline workflows, standardize development environments, and ensure
smooth deployments across your organization.
@z

@x
By configuring Docker products to suit your company's needs, you can optimize
performance, simplify user management, and maintain control over resources.
This guide helps you set up and configure Docker products to maximize
productivity and success for your team while meeting compliance and security
policies.
@y
By configuring Docker products to suit your company's needs, you can optimize
performance, simplify user management, and maintain control over resources.
This guide helps you set up and configure Docker products to maximize
productivity and success for your team while meeting compliance and security
policies.
@z

@x
## Who’s this for?
@y
## Who’s this for?
@z

@x
- Administrators responsible for managing Docker environments within their
  organization
- IT leaders looking to streamline development and deployment workflows
- Teams aiming to standardize application environments across multiple users
- Organizations seeking to optimize their use of Docker products for greater
  scalability and efficiency
- Organizations with a
  [Docker Business subscription](https://www.docker.com/pricing?ref=DocsGuides&refAction=DocsGuidesCTAClicked)
@y
- Administrators responsible for managing Docker environments within their
  organization
- IT leaders looking to streamline development and deployment workflows
- Teams aiming to standardize application environments across multiple users
- Organizations seeking to optimize their use of Docker products for greater
  scalability and efficiency
- Organizations with a
  [Docker Business subscription](https://www.docker.com/pricing?ref=DocsGuides&refAction=DocsGuidesCTAClicked)
@z

@x
## What you’ll learn
@y
## What you’ll learn
@z

@x
- Why signing into your company's Docker organization provides access to usage
  data and enhanced functionality
- How to standardize Docker Desktop versions and settings to create a consistent
  baseline for all users, while allowing flexibility for advanced developers
- Strategies for implementing Docker's security configurations to meet company
  IT and software development security requirements without hindering developer productivity
@y
- Why signing into your company's Docker organization provides access to usage
  data and enhanced functionality
- How to standardize Docker Desktop versions and settings to create a consistent
  baseline for all users, while allowing flexibility for advanced developers
- Strategies for implementing Docker's security configurations to meet company
  IT and software development security requirements without hindering developer productivity
@z

@x
## Features covered
@y
## Features covered
@z

@x
This guide covers the following Docker features:
@y
This guide covers the following Docker features:
@z

@x
- [Organizations](/manuals/admin/organization/_index.md): The core structure
  for managing your Docker environment, grouping users, teams, and image
  repositories. Your organization was created with your subscription and is
  managed by one or more owners. Users signed into the organization are
  assigned seats based on the purchased subscription.
@y
- [Organizations](manuals/admin/organization/_index.md): The core structure
  for managing your Docker environment, grouping users, teams, and image
  repositories. Your organization was created with your subscription and is
  managed by one or more owners. Users signed into the organization are
  assigned seats based on the purchased subscription.
@z

@x
- [Enforce sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md):
  By default, Docker Desktop doesn't require sign-in. You can configure
  settings to enforce this and ensure your developers sign in to your
  Docker organization.
@y
- [Enforce sign-in](manuals/enterprise/security/enforce-sign-in/_index.md):
  By default, Docker Desktop doesn't require sign-in. You can configure
  settings to enforce this and ensure your developers sign in to your
  Docker organization.
@z

@x
- [SSO](/manuals/enterprise/security/single-sign-on/_index.md): Without SSO,
  user management in a Docker organization is manual. Setting
  up an SSO connection between your identity provider and Docker ensures
  compliance with your security policy and automates user provisioning. Adding
  SCIM further automates user provisioning and de-provisioning.
@y
- [SSO](manuals/enterprise/security/single-sign-on/_index.md): Without SSO,
  user management in a Docker organization is manual. Setting
  up an SSO connection between your identity provider and Docker ensures
  compliance with your security policy and automates user provisioning. Adding
  SCIM further automates user provisioning and de-provisioning.
@z

@x
- General and security settings: Configuring key settings ensures smooth
  onboarding and usage of Docker products within your environment. You can also
  enable security features based on your company's specific security needs.
@y
- General and security settings: Configuring key settings ensures smooth
  onboarding and usage of Docker products within your environment. You can also
  enable security features based on your company's specific security needs.
@z

@x
## Who needs to be involved
@y
## Who needs to be involved
@z

@x
- Docker organization owner: Must be involved in the process and is required
  for several key steps
- DNS team: Needed during the SSO setup to verify the company domain
- MDM team: Responsible for distributing Docker-specific configuration files to
  developer machines
- Identity Provider team: Required for configuring the identity provider and
  establishing the SSO connection during setup
- Development lead: A development lead with knowledge of Docker configurations
  to help establish a baseline for developer settings
- IT team: An IT representative familiar with company desktop policies to
  assist with aligning Docker configuration to those policies
- Infosec: A security team member with knowledge of company development
  security policies to help configure security features
- Docker testers: A small group of developers to test the new settings and
  configurations before full deployment
@y
- Docker organization owner: Must be involved in the process and is required
  for several key steps
- DNS team: Needed during the SSO setup to verify the company domain
- MDM team: Responsible for distributing Docker-specific configuration files to
  developer machines
- Identity Provider team: Required for configuring the identity provider and
  establishing the SSO connection during setup
- Development lead: A development lead with knowledge of Docker configurations
  to help establish a baseline for developer settings
- IT team: An IT representative familiar with company desktop policies to
  assist with aligning Docker configuration to those policies
- Infosec: A security team member with knowledge of company development
  security policies to help configure security features
- Docker testers: A small group of developers to test the new settings and
  configurations before full deployment
@z

@x
## Tools integration
@y
## Tools integration
@z

@x
This guide covers integration with:
@y
This guide covers integration with:
@z

@x
- Okta
- Entra ID SAML 2.0
- Azure Connect (OIDC)
- MDM solutions like Intune
@y
- Okta
- Entra ID SAML 2.0
- Azure Connect (OIDC)
- MDM solutions like Intune
@z

@x
## Communication and information gathering
@y
## Communication and information gathering
@z

@x
### Communicate with your developers and IT teams
@y
### Communicate with your developers and IT teams
@z

@x
Before rolling out Docker Desktop across your organization, coordinate with key stakeholders to ensure a smooth transition.
@y
Before rolling out Docker Desktop across your organization, coordinate with key stakeholders to ensure a smooth transition.
@z

@x
#### Notify Docker Desktop users
@y
#### Notify Docker Desktop users
@z

@x
You may already have Docker Desktop users within your company. Some steps in
this onboarding process may affect how they interact with the platform.
@y
You may already have Docker Desktop users within your company. Some steps in
this onboarding process may affect how they interact with the platform.
@z

@x
Communicate early with users to inform them that:
@y
Communicate early with users to inform them that:
@z

@x
- They'll be upgraded to a supported version of Docker Desktop as part of the subscription onboarding
- Settings will be reviewed and optimized for productivity
- They'll need to sign in to the company's Docker organization using their
  business email to access subscription benefits
@y
- They'll be upgraded to a supported version of Docker Desktop as part of the subscription onboarding
- Settings will be reviewed and optimized for productivity
- They'll need to sign in to the company's Docker organization using their
  business email to access subscription benefits
@z

@x
#### Engage with your MDM team
@y
#### Engage with your MDM team
@z

@x
Device management solutions, such as Intune and Jamf, are commonly used for
software distribution across enterprises. These tools are typically managed by a dedicated MDM team.
@y
Device management solutions, such as Intune and Jamf, are commonly used for
software distribution across enterprises. These tools are typically managed by a dedicated MDM team.
@z

@x
Engage with this team early in the process to:
@y
Engage with this team early in the process to:
@z

@x
- Understand their requirements and lead time for deploying changes
- Coordinate the distribution of configuration files
@y
- Understand their requirements and lead time for deploying changes
- Coordinate the distribution of configuration files
@z

@x
Several setup steps in this guide require JSON files, registry keys, or .plist
files to be distributed to developer machines. Use MDM tools to deploy these configuration files and ensure their integrity.
@y
Several setup steps in this guide require JSON files, registry keys, or .plist
files to be distributed to developer machines. Use MDM tools to deploy these configuration files and ensure their integrity.
@z

@x
### Identify Docker organizations
@y
### Identify Docker organizations
@z

@x
Some companies may have more than one
[Docker organization](/manuals/admin/organization/_index.md) created. These
organizations may have been created for specific purposes, or may not be
needed anymore.
@y
Some companies may have more than one
[Docker organization](manuals/admin/organization/_index.md) created. These
organizations may have been created for specific purposes, or may not be
needed anymore.
@z

@x
If you suspect your company has multiple Docker organizations:
@y
If you suspect your company has multiple Docker organizations:
@z

@x
- Survey your teams to see if they have their own organizations
- Contact your Docker Support to get a list of organizations with users whose
  emails match your domain name
@y
- Survey your teams to see if they have their own organizations
- Contact your Docker Support to get a list of organizations with users whose
  emails match your domain name
@z

@x
### Gather requirements
@y
### Gather requirements
@z

@x
[Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/_index.md) lets you preset numerous configuration parameters for Docker Desktop.
@y
[Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/_index.md) lets you preset numerous configuration parameters for Docker Desktop.
@z

@x
Work with the following stakeholders to establish your company's baseline
configuration:
@y
Work with the following stakeholders to establish your company's baseline
configuration:
@z

@x
- Docker organization owner
- Development lead
- Information security representative
@y
- Docker organization owner
- Development lead
- Information security representative
@z

@x
Review these areas together:
@y
Review these areas together:
@z

@x
- Security features and
  [enforcing sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md)
  for Docker Desktop users
- Additional Docker products included in your subscriptions
@y
- Security features and
  [enforcing sign-in](manuals/enterprise/security/enforce-sign-in/_index.md)
  for Docker Desktop users
- Additional Docker products included in your subscriptions
@z

@x
To view the parameters that can be preset, see [Configure Settings Management](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#step-two-configure-the-settings-you-want-to-lock-in).
@y
To view the parameters that can be preset, see [Configure Settings Management](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md#step-two-configure-the-settings-you-want-to-lock-in).
@z

@x
### Optional: Meet with the Docker Implementation team
@y
### Optional: Meet with the Docker Implementation team
@z

@x
The Docker Implementation team can help you set up your organization,
configure SSO, enforce sign-in, and configure Docker Desktop.
@y
The Docker Implementation team can help you set up your organization,
configure SSO, enforce sign-in, and configure Docker Desktop.
@z

@x
To schedule a meeting, email successteam@docker.com.
@y
To schedule a meeting, email successteam@docker.com.
@z

@x
## Finalize plans and begin setup
@y
## Finalize plans and begin setup
@z

@x
### Send finalized settings files to the MDM team
@y
### Send finalized settings files to the MDM team
@z

@x
After reaching an agreement with the relevant teams about your baseline and
security configurations as outlined in the previous section, configure Settings Management either via [Docker Home](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md) or with an
[`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md).
@y
After reaching an agreement with the relevant teams about your baseline and
security configurations as outlined in the previous section, configure Settings Management either via [Docker Home](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md) or with an
[`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md).
@z

@x
Once the file is ready, collaborate with your MDM team to deploy your chosen
settings, along with your chosen method for [enforcing sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md).
@y
Once the file is ready, collaborate with your MDM team to deploy your chosen
settings, along with your chosen method for [enforcing sign-in](manuals/enterprise/security/enforce-sign-in/_index.md).
@z

@x
> [!IMPORTANT]
>
> Test this first with a small number of Docker Desktop developers to verify the functionality works as expected before deploying more widely.
@y
> [!IMPORTANT]
>
> Test this first with a small number of Docker Desktop developers to verify the functionality works as expected before deploying more widely.
@z

@x
### Manage your organizations
@y
### Manage your organizations
@z

@x
If you have more than one organization, consider either [consolidating them
into one organization](/manuals/admin/organization/setup/orgs.md) or creating a
[Docker company](/manuals/admin/company/_index.md) to manage multiple
organizations.
@y
If you have more than one organization, consider either [consolidating them
into one organization](manuals/admin/organization/setup/orgs.md) or creating a
[Docker company](manuals/admin/company/_index.md) to manage multiple
organizations.
@z

@x
### Begin setup
@y
### Begin setup
@z

@x
#### Set up single sign-on and domain verification
@y
#### Set up single sign-on and domain verification
@z

@x
Single sign-on (SSO) lets developers authenticate using their identity
providers (IdPs) to access Docker. SSO is available for a whole company and all associated organizations, or an individual organization that has a Docker
Business subscription. For more information, see the
[documentation](/manuals/enterprise/security/single-sign-on/_index.md).
@y
Single sign-on (SSO) lets developers authenticate using their identity
providers (IdPs) to access Docker. SSO is available for a whole company and all associated organizations, or an individual organization that has a Docker
Business subscription. For more information, see the
[documentation](manuals/enterprise/security/single-sign-on/_index.md).
@z

@x
You can also enable [SCIM](/manuals/enterprise/security/provisioning/scim/_index.md)
for further automation of provisioning and deprovisioning of users.
@y
You can also enable [SCIM](manuals/enterprise/security/provisioning/scim/_index.md)
for further automation of provisioning and deprovisioning of users.
@z

@x
#### Set up Docker product entitlements included in the subscription
@y
#### Set up Docker product entitlements included in the subscription
@z

@x
[Docker Build Cloud](/manuals/build-cloud/_index.md) significantly reduces
build times, both locally and in CI, by providing a dedicated remote builder
and shared cache. Powered by the cloud, developer time and local resources are
freed up so your team can focus on more important things, like innovation.
To get started, [set up a cloud builder](https://app.docker.com/build/).
@y
[Docker Build Cloud](manuals/build-cloud/_index.md) significantly reduces
build times, both locally and in CI, by providing a dedicated remote builder
and shared cache. Powered by the cloud, developer time and local resources are
freed up so your team can focus on more important things, like innovation.
To get started, [set up a cloud builder](https://app.docker.com/build/).
@z

@x
[Docker Scout](manuals/scout/_index.md) is a solution for proactively enhancing
your software supply chain security. By analyzing your images, Docker Scout
compiles an inventory of components, also known as a Software Bill of Materials
(SBOM). The SBOM is matched against a continuously updated vulnerability
database to pinpoint security weaknesses. To get started, see
[Quickstart](/manuals/scout/quickstart.md).
@y
[Docker Scout](manuals/scout/_index.md) is a solution for proactively enhancing
your software supply chain security. By analyzing your images, Docker Scout
compiles an inventory of components, also known as a Software Bill of Materials
(SBOM). The SBOM is matched against a continuously updated vulnerability
database to pinpoint security weaknesses. To get started, see
[Quickstart](manuals/scout/quickstart.md).
@z

@x
[Testcontainers Cloud](https://testcontainers.com/cloud/docs/) allows
developers to run containers in the cloud, removing the need to run heavy
containers on your local machine.
@y
[Testcontainers Cloud](https://testcontainers.com/cloud/docs/) allows
developers to run containers in the cloud, removing the need to run heavy
containers on your local machine.
@z

@x
[Docker Hardened Images](/manuals/dhi/_index.md) are minimal, secure, and production-ready container base and application images maintained by Docker.
Designed to reduce vulnerabilities and simplify compliance, DHIs integrate
easily into your existing Docker-based workflows with little to no retooling
required.
@y
[Docker Hardened Images](manuals/dhi/_index.md) are minimal, secure, and production-ready container base and application images maintained by Docker.
Designed to reduce vulnerabilities and simplify compliance, DHIs integrate
easily into your existing Docker-based workflows with little to no retooling
required.
@z

@x
#### Ensure you're running a supported version of Docker Desktop
@y
#### Ensure you're running a supported version of Docker Desktop
@z

@x
> [!WARNING]
>
> This step could affect the experience for users on older versions of Docker
> Desktop.
@y
> [!WARNING]
>
> This step could affect the experience for users on older versions of Docker
> Desktop.
@z

@x
Existing users may be running outdated or unsupported versions of
Docker Desktop. All users should update to a supported version. Docker Desktop
versions released within the past 6 months from the latest release are supported.
@y
Existing users may be running outdated or unsupported versions of
Docker Desktop. All users should update to a supported version. Docker Desktop
versions released within the past 6 months from the latest release are supported.
@z

@x
Use an MDM solution to manage the version of Docker Desktop for users. Users
may also get Docker Desktop directly from Docker or through a company software
portal.
@y
Use an MDM solution to manage the version of Docker Desktop for users. Users
may also get Docker Desktop directly from Docker or through a company software
portal.
@z

@x
## Testing
@y
## Testing
@z

@x
### SSO and SCIM testing
@y
### SSO and SCIM testing
@z

@x
Test SSO and SCIM by signing in to Docker Desktop or Docker Hub with the email
address linked to a Docker account that is part of the verified domain.
Developers who sign in using their Docker usernames remain unaffected by the
SSO and SCIM setup.
@y
Test SSO and SCIM by signing in to Docker Desktop or Docker Hub with the email
address linked to a Docker account that is part of the verified domain.
Developers who sign in using their Docker usernames remain unaffected by the
SSO and SCIM setup.
@z

@x
> [!IMPORTANT]
>
> Some users may need CLI based logins to Docker Hub, and for this they will
> need a [personal access token (PAT)](/manuals/security/access-tokens.md).
@y
> [!IMPORTANT]
>
> Some users may need CLI based logins to Docker Hub, and for this they will
> need a [personal access token (PAT)](manuals/security/access-tokens.md).
@z

@x
### Test Registry Access Management and Image Access Management
@y
### Test Registry Access Management and Image Access Management
@z

@x
> [!WARNING]
>
> Communicate with your users before proceeding, as this step will impact all
> existing users signing into your Docker organization.
@y
> [!WARNING]
>
> Communicate with your users before proceeding, as this step will impact all
> existing users signing into your Docker organization.
@z

@x
If you plan to use [Registry Access Management (RAM)](/manuals/enterprise/security/hardened-desktop/registry-access-management.md) and/or [Image Access Management (IAM)](/manuals/enterprise/security/hardened-desktop/image-access-management.md):
@y
If you plan to use [Registry Access Management (RAM)](manuals/enterprise/security/hardened-desktop/registry-access-management.md) and/or [Image Access Management (IAM)](manuals/enterprise/security/hardened-desktop/image-access-management.md):
@z

@x
1. Ensure your test developer signs in to Docker Desktop using their
   organization credentials
2. Have them attempt to pull an unauthorized image or one from a disallowed
   registry via the Docker CLI
3. Verify they receive an error message indicating that the registry is
   restricted by the organization
@y
1. Ensure your test developer signs in to Docker Desktop using their
   organization credentials
2. Have them attempt to pull an unauthorized image or one from a disallowed
   registry via the Docker CLI
3. Verify they receive an error message indicating that the registry is
   restricted by the organization
@z

@x
### Deploy settings and enforce sign in to test group
@y
### Deploy settings and enforce sign in to test group
@z

@x
Deploy the Docker settings and enforce sign-in for a small group of test users
via MDM. Have this group test their development workflows with containers on
Docker Desktop and Docker Hub to ensure all settings and the sign-in enforcement
function as expected.
@y
Deploy the Docker settings and enforce sign-in for a small group of test users
via MDM. Have this group test their development workflows with containers on
Docker Desktop and Docker Hub to ensure all settings and the sign-in enforcement
function as expected.
@z

@x
### Test Docker Build Cloud capabilities
@y
### Test Docker Build Cloud capabilities
@z

@x
Have one of your Docker Desktop testers [connect to the cloud builder you created and use it to build](/manuals/build-cloud/usage.md).
@y
Have one of your Docker Desktop testers [connect to the cloud builder you created and use it to build](manuals/build-cloud/usage.md).
@z

@x
### Test Testcontainers Cloud
@y
### Test Testcontainers Cloud
@z

@x
Have a test developer [connect to Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started) and run a container in
the cloud to verify the setup is working correctly.
@y
Have a test developer [connect to Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started) and run a container in
the cloud to verify the setup is working correctly.
@z

@x
### Verify Docker Scout monitoring of repositories
@y
### Verify Docker Scout monitoring of repositories
@z

@x
Check the [Docker Scout dashboard](https://scout.docker.com/) to confirm that
data is being properly received for the repositories where Docker Scout has
been enabled.
@y
Check the [Docker Scout dashboard](https://scout.docker.com/) to confirm that
data is being properly received for the repositories where Docker Scout has
been enabled.
@z

@x
### Verify access to Docker Hardened Images
@y
### Verify access to Docker Hardened Images
@z

@x
Have a test developer attempt to [pull a Docker Hardened Image](/manuals/dhi/get-started.md) to confirm that
the team has proper access and can integrate these images into their workflows.
@y
Have a test developer attempt to [pull a Docker Hardened Image](manuals/dhi/get-started.md) to confirm that
the team has proper access and can integrate these images into their workflows.
@z

@x
## Deploy your Docker setup
@y
## Deploy your Docker setup
@z

@x
> [!WARNING]
>
> Communicate with your users before proceeding, and confirm that your IT and
> MDM teams are prepared to handle any unexpected issues, as these steps will
> affect all existing users signing into your Docker organization.
@y
> [!WARNING]
>
> Communicate with your users before proceeding, and confirm that your IT and
> MDM teams are prepared to handle any unexpected issues, as these steps will
> affect all existing users signing into your Docker organization.
@z

@x
### Enforce SSO
@y
### Enforce SSO
@z

@x
Enforcing SSO means that anyone who has a Docker profile with an email address
that matches your verified domain must sign in using your SSO connection. Make
sure the Identity provider groups associated with your SSO connection cover all
the developer groups that you want to have access to the Docker subscription.
@y
Enforcing SSO means that anyone who has a Docker profile with an email address
that matches your verified domain must sign in using your SSO connection. Make
sure the Identity provider groups associated with your SSO connection cover all
the developer groups that you want to have access to the Docker subscription.
@z

@x
For instructions on how to enforce SSO, see [Enforce SSO](/manuals/enterprise/security/single-sign-on/connect.md).
@y
For instructions on how to enforce SSO, see [Enforce SSO](manuals/enterprise/security/single-sign-on/connect.md).
@z

@x
### Deploy configuration settings and enforce sign-in to users
@y
### Deploy configuration settings and enforce sign-in to users
@z

@x
Have the MDM team deploy the configuration files for Docker to all users.
@y
Have the MDM team deploy the configuration files for Docker to all users.
@z

@x
### Next steps
@y
### Next steps
@z

@x
Congratulations, you've successfully completed the admin implementation process
for Docker.
@y
Congratulations, you've successfully completed the admin implementation process
for Docker.
@z

@x
To continue optimizing your Docker environment:
@y
To continue optimizing your Docker environment:
@z

@x
- Review your [organization's usage data](/manuals/admin/insights.md) to track adoption
- Monitor [Docker Scout findings](/manuals/scout/explore/analysis.md) for security insights
- Explore [additional security features](/manuals/enterprise/security/_index.md) to enhance your configuration
@y
- Review your [organization's usage data](manuals/admin/insights.md) to track adoption
- Monitor [Docker Scout findings](manuals/scout/explore/analysis.md) for security insights
- Explore [additional security features](manuals/enterprise/security/_index.md) to enhance your configuration
@z
