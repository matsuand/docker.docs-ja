%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Communication and information gathering
description: Gather your company's requirements from key stakeholders and communicate to your developers.
@y
title: Communication and information gathering
description: Gather your company's requirements from key stakeholders and communicate to your developers.
@z

@x
## Communicate with your developers and IT teams
@y
## Communicate with your developers and IT teams
@z

@x
Before rolling out Docker Desktop across your organization, coordinate with key stakeholders to ensure a smooth transition.
@y
Before rolling out Docker Desktop across your organization, coordinate with key stakeholders to ensure a smooth transition.
@z

@x
### Notify Docker Desktop users
@y
### Notify Docker Desktop users
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
### Engage with your MDM team
@y
### Engage with your MDM team
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
## Identify Docker organizations
@y
## Identify Docker organizations
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
## Gather requirements
@y
## Gather requirements
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
## Optional: Meet with the Docker Implementation team
@y
## Optional: Meet with the Docker Implementation team
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
