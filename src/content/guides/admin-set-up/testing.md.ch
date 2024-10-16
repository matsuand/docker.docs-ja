%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Testing
description: Test your Docker setup.
@y
title: Testing
description: Test your Docker setup.
@z

@x
## SSO and SCIM testing
@y
## SSO and SCIM testing
@z

@x
You can test SSO and SCIM by signing in to Docker Desktop or Docker Hub with the email address linked to a Docker account that is part of the verified domain. Developers who sign in using their Docker usernames will remain unaffected by the SSO and/or SCIM setup. 
@y
You can test SSO and SCIM by signing in to Docker Desktop or Docker Hub with the email address linked to a Docker account that is part of the verified domain. Developers who sign in using their Docker usernames will remain unaffected by the SSO and/or SCIM setup. 
@z

@x
> [!IMPORTANT] 
>
> Some users may need CLI based logins to Docker Hub, and for this they will need a [personal access token (PAT)](/manuals/security/for-developers/access-tokens.md).
@y
> [!IMPORTANT] 
>
> Some users may need CLI based logins to Docker Hub, and for this they will need a [personal access token (PAT)](manuals/security/for-developers/access-tokens.md).
@z

@x
## Test RAM and IAM
@y
## Test RAM and IAM
@z

@x
> [!WARNING]
> Be sure to communicate with your users before proceeding, as this step will impact all existing users signing into your Docker organization
@y
> [!WARNING]
> Be sure to communicate with your users before proceeding, as this step will impact all existing users signing into your Docker organization
@z

@x
If you plan to use [Registry Access Management (RAM)](/manuals/security/for-admins/hardened-desktop/registry-access-management.md) and/or [Image Access Management (IAM)](/manuals/security/for-admins/hardened-desktop/image-access-management.md), ensure your test developer signs in to Docker Desktop using their organization credentials. Once authenticated, have them attempt to pull an unauthorized image or one from a disallowed registry via the Docker CLI. They should receive an error message indicating that the registry is restricted by the organization.
@y
If you plan to use [Registry Access Management (RAM)](manuals/security/for-admins/hardened-desktop/registry-access-management.md) and/or [Image Access Management (IAM)](manuals/security/for-admins/hardened-desktop/image-access-management.md), ensure your test developer signs in to Docker Desktop using their organization credentials. Once authenticated, have them attempt to pull an unauthorized image or one from a disallowed registry via the Docker CLI. They should receive an error message indicating that the registry is restricted by the organization.
@z

@x
## Deploy settings and enforce sign in to test group
@y
## Deploy settings and enforce sign in to test group
@z

@x
Deploy the Docker settings and enforce sign-in for a small group of test users via MDM. Have this group test their development workflows with containers on Docker Desktop and Docker Hub to ensure all settings and the sign-in enforcement function as expected.
@y
Deploy the Docker settings and enforce sign-in for a small group of test users via MDM. Have this group test their development workflows with containers on Docker Desktop and Docker Hub to ensure all settings and the sign-in enforcement function as expected.
@z

@x
## Test Build Cloud capabilities
@y
## Test Build Cloud capabilities
@z

@x
Have one of your Docker Desktop testers [connect to the cloud builder you created and use it to build](/manuals/build-cloud/usage.md). 
@y
Have one of your Docker Desktop testers [connect to the cloud builder you created and use it to build](manuals/build-cloud/usage.md). 
@z

@x
## Verify Scout monitoring of repositories
@y
## Verify Scout monitoring of repositories
@z

@x
Check the [Docker Scout dashboard](https://scout.docker.com/) to confirm that data is being properly received for the repositories where Docker Scout has been enabled.
@y
Check the [Docker Scout dashboard](https://scout.docker.com/) to confirm that data is being properly received for the repositories where Docker Scout has been enabled.
@z
