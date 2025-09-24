%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Finalize plans and begin setup
description: Collaborate with your MDM team to distribute configurations and set up SSO and Docker product trials.
@y
title: Finalize plans and begin setup
description: Collaborate with your MDM team to distribute configurations and set up SSO and Docker product trials.
@z

@x
## Step one: Send finalized settings files to the MDM team 
@y
## Step one: Send finalized settings files to the MDM team 
@z

@x
After reaching an agreement with the relevant teams about your baseline and security configurations as outlined in module one, configure Settings Management using either the [Docker Admin Console](/manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md) or an [`admin-settings.json` file](/manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md).
@y
After reaching an agreement with the relevant teams about your baseline and security configurations as outlined in module one, configure Settings Management using either the [Docker Admin Console](manuals/enterprise/security/hardened-desktop/settings-management/configure-admin-console.md) or an [`admin-settings.json` file](manuals/enterprise/security/hardened-desktop/settings-management/configure-json-file.md).
@z

@x
Once the file is ready, collaborate with your MDM team to deploy your chosen settings, along with your chosen method for [enforcing sign-in](/manuals/enterprise/security/enforce-sign-in/_index.md).
@y
Once the file is ready, collaborate with your MDM team to deploy your chosen settings, along with your chosen method for [enforcing sign-in](manuals/enterprise/security/enforce-sign-in/_index.md).
@z

@x
> [!IMPORTANT]
>
> It’s highly recommended that you test this first with a small number of Docker Desktop developers to verify the functionality works as expected before deploying more widely.
@y
> [!IMPORTANT]
>
> It’s highly recommended that you test this first with a small number of Docker Desktop developers to verify the functionality works as expected before deploying more widely.
@z

@x
## Step two: Manage your organizations
@y
## Step two: Manage your organizations
@z

@x
If you have more than one organization, it’s recommended that you either consolidate them into one organization or create a [Docker company](/manuals/admin/company/_index.md) to manage multiple organizations. Work with the Docker Customer Success and Implementation teams to make this happen.
@y
If you have more than one organization, it’s recommended that you either consolidate them into one organization or create a [Docker company](manuals/admin/company/_index.md) to manage multiple organizations. Work with the Docker Customer Success and Implementation teams to make this happen.
@z

@x
## Step three: Begin setup
@y
## Step three: Begin setup
@z

@x
### Set up single sign-on SSO domain verification
@y
### Set up single sign-on SSO domain verification
@z

@x
Single sign-on (SSO) lets developers authenticate using their identity providers (IdPs) to access Docker. SSO is available for a whole company, and all associated organizations, or an individual organization that has a Docker Business subscription. For more information, see the [documentation](/manuals/enterprise/security/single-sign-on/_index.md).
@y
Single sign-on (SSO) lets developers authenticate using their identity providers (IdPs) to access Docker. SSO is available for a whole company, and all associated organizations, or an individual organization that has a Docker Business subscription. For more information, see the [documentation](manuals/enterprise/security/single-sign-on/_index.md).
@z

@x
You can also enable [SCIM](/manuals/enterprise/security/provisioning/scim.md) for further automation of provisioning and deprovisioning of users.
@y
You can also enable [SCIM](manuals/enterprise/security/provisioning/scim.md) for further automation of provisioning and deprovisioning of users.
@z

@x
### Set up Docker product entitlements included in the subscription
@y
### Set up Docker product entitlements included in the subscription
@z

@x
[Docker Build Cloud](/manuals/build-cloud/_index.md) significantly reduces build times, both locally and in CI, by providing a dedicated remote builder and shared cache. Powered by the cloud, developer time and local resources are freed up so your team can focus on more important things, like innovation. To get started, [set up a cloud builder](https://app.docker.com/build/). 
@y
[Docker Build Cloud](manuals/build-cloud/_index.md) significantly reduces build times, both locally and in CI, by providing a dedicated remote builder and shared cache. Powered by the cloud, developer time and local resources are freed up so your team can focus on more important things, like innovation. To get started, [set up a cloud builder](https://app.docker.com/build/). 
@z

@x
[Docker Scout](manuals/scout/_index.md) is a solution for proactively enhancing your software supply chain security. By analyzing your images, Docker Scout compiles an inventory of components, also known as a Software Bill of Materials (SBOM). The SBOM is matched against a continuously updated vulnerability database to pinpoint security weaknesses. To get started, see [Quickstart](/manuals/scout/quickstart.md).
@y
[Docker Scout](manuals/scout/_index.md) is a solution for proactively enhancing your software supply chain security. By analyzing your images, Docker Scout compiles an inventory of components, also known as a Software Bill of Materials (SBOM). The SBOM is matched against a continuously updated vulnerability database to pinpoint security weaknesses. To get started, see [Quickstart](manuals/scout/quickstart.md).
@z

@x
### Ensure you're running a supported version of Docker Desktop
@y
### Ensure you're running a supported version of Docker Desktop
@z

@x
> [!WARNING]
>
> This step could affect the experience for users on older versions of Docker Desktop.  
@y
> [!WARNING]
>
> This step could affect the experience for users on older versions of Docker Desktop.  
@z

@x
Existing users may be running outdated or unsupported versions of Docker Desktop. It is highly recommended that all users update to a supported version. Docker Desktop versions released within the past 6 months from the latest release are supported.
@y
Existing users may be running outdated or unsupported versions of Docker Desktop. It is highly recommended that all users update to a supported version. Docker Desktop versions released within the past 6 months from the latest release are supported.
@z

@x
It's recommended that you use a MDM solution to manage the version of Docker Desktop for users. Users may also get Docker Desktop directly from Docker or through a company software portal.  
@y
It's recommended that you use a MDM solution to manage the version of Docker Desktop for users. Users may also get Docker Desktop directly from Docker or through a company software portal.  
@z
