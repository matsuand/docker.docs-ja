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
## Test Registry Access Management and Image Access Management
@y
## Test Registry Access Management and Image Access Management
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
## Deploy settings and enforce sign in to test group
@y
## Deploy settings and enforce sign in to test group
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
## Test Docker Build Cloud capabilities
@y
## Test Docker Build Cloud capabilities
@z

@x
Have one of your Docker Desktop testers [connect to the cloud builder you created and use it to build](/manuals/build-cloud/usage.md).
@y
Have one of your Docker Desktop testers [connect to the cloud builder you created and use it to build](manuals/build-cloud/usage.md).
@z

@x
## Test Testcontainers Cloud
@y
## Test Testcontainers Cloud
@z

@x
Have a test developer [connect to Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started) and run a container in
the cloud to verify the setup is working correctly.
@y
Have a test developer [connect to Testcontainers Cloud](https://testcontainers.com/cloud/docs/#getting-started) and run a container in
the cloud to verify the setup is working correctly.
@z

@x
## Verify Docker Scout monitoring of repositories
@y
## Verify Docker Scout monitoring of repositories
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
## Verify access to Docker Hardened Images
@y
## Verify access to Docker Hardened Images
@z

@x
Have a test developer attempt to [pull a Docker Hardened Image](/manuals/dhi/get-started.md) to confirm that
the team has proper access and can integrate these images into their workflows.
@y
Have a test developer attempt to [pull a Docker Hardened Image](manuals/dhi/get-started.md) to confirm that
the team has proper access and can integrate these images into their workflows.
@z
