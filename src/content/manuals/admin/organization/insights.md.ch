%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Gain insights about your organization's users and their Docker usage.
keywords: organization, insights
title: Insights
@y
description: Gain insights about your organization's users and their Docker usage.
keywords: organization, insights
title: Insights
@z

@x
> [!NOTE]
> Insights requires a [Docker Business
> subscription](/subscription/core-subscription/details/#docker-business) and
> administrators must [enforce sign-in](/manuals/security/for-admins/enforce-sign-in/_index.md)
> to ensure that users sign in with an account associated with their
> organization.
@y
> [!NOTE]
> Insights requires a [Docker Business
> subscription](__SUBDIR__/subscription/core-subscription/details/#docker-business) and
> administrators must [enforce sign-in](manuals/security/for-admins/enforce-sign-in/_index.md)
> to ensure that users sign in with an account associated with their
> organization.
@z

@x
Insights helps administrators visualize and understand how Docker is used within
their organizations. With Insights, administrators can ensure their teams are
fully equipped to utilize Docker to its fullest potential, leading to improved
productivity and efficiency across the organization.
@y
Insights helps administrators visualize and understand how Docker is used within
their organizations. With Insights, administrators can ensure their teams are
fully equipped to utilize Docker to its fullest potential, leading to improved
productivity and efficiency across the organization.
@z

@x
Key benefits include:
@y
Key benefits include:
@z

@x
* Uniform working environment. Establish and maintain standardized
  configurations across teams.
* Best practices. Promote and enforce usage guidelines to ensure optimal
  performance.
* Increased visibility. Monitor and drive adoption of organizational
  configurations and policies.
* Optimized license use. Ensure that developers have access to advanced
  features provided by a Docker subscription.
@y
* Uniform working environment. Establish and maintain standardized
  configurations across teams.
* Best practices. Promote and enforce usage guidelines to ensure optimal
  performance.
* Increased visibility. Monitor and drive adoption of organizational
  configurations and policies.
* Optimized license use. Ensure that developers have access to advanced
  features provided by a Docker subscription.
@z

@x
## View Insights for organization users
@y
## View Insights for organization users
@z

@x
1. Go to the [Admin Console](https://app.docker.com/admin/) and sign in to an
   account that is an organization owner.
2. In the Admin Console, select your organization from the drop-down in the left
   navigation.
3. Select **Insights**.
4. On the **Insights** page, select the period of time for the data.
@y
1. Go to the [Admin Console](https://app.docker.com/admin/) and sign in to an
   account that is an organization owner.
2. In the Admin Console, select your organization from the drop-down in the left
   navigation.
3. Select **Insights**.
4. On the **Insights** page, select the period of time for the data.
@z

@x
> [!NOTE]
> Insights data is not real-time and is updated daily. At the top-right of the
> Insights page, view the **Last updated** date to understand when the data was
> last updated.
@y
> [!NOTE]
> Insights data is not real-time and is updated daily. At the top-right of the
> Insights page, view the **Last updated** date to understand when the data was
> last updated.
@z

@x
You can view data in the following charts:
@y
You can view data in the following charts:
@z

@x
 * [Docker Desktop users](#docker-desktop-users)
 * [Builds](#builds)
 * [Containers](#containers)
 * [Docker Desktop usage](#docker-desktop-usage)
 * [Docker Hub images](#docker-hub-images)
 * [Extensions](#extensions)
@y
 * [Docker Desktop users](#docker-desktop-users)
 * [Builds](#builds)
 * [Containers](#containers)
 * [Docker Desktop usage](#docker-desktop-usage)
 * [Docker Hub images](#docker-hub-images)
 * [Extensions](#extensions)
@z

@x
### Docker Desktop users
@y
### Docker Desktop users
@z

@x
Track active Docker Desktop users in your domain, differentiated by license
status. This chart helps you understand the engagement levels within your
organization, providing insights into how many users are actively using Docker
Desktop. Note that users who opt out of analytics aren't included in the active
counts.
@y
Track active Docker Desktop users in your domain, differentiated by license
status. This chart helps you understand the engagement levels within your
organization, providing insights into how many users are actively using Docker
Desktop. Note that users who opt out of analytics aren't included in the active
counts.
@z

@x
The chart contains the following data.
@y
The chart contains the following data.
@z

@x
| Data                         | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|:-----------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Total active users           | The number of users that have actively used Docker Desktop and either signed in with a Docker account that has a license in your organization or signed in to a Docker account with an email address from a domain associated with your organization. <br><br>Users who don’t sign in to an account associated with your organization are not represented in the data. To ensure users sign in with an account associated with your organization, you can [enforce sign-in](/security/for-admins/enforce-sign-in/).                                                                                                                                                                                                                                                     |
| Active with license          | The number of users that have actively used Docker Desktop and have signed in to a Docker account with a license in your organization.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Active without license       | The number of users that have actively used Docker Desktop, are linked to a Docker account with an email address from a domain associated with your organization, and don’t have a license assigned to their account. <br><br>Users without a license don’t receive the benefits of your subscription. You can use [domain audit](/security/for-admins/domain-audit/) to identify users without a license. You can also use [Just-in-Time provisioning](/security/for-admins/provisioning/just-in-time/) or [SCIM](/security/for-admins/provisioning/scim/) to help automatically provision users with a license. Note that when SSO is configured and enforced, active without license will be 0. |
| Users opted out of analytics | The number of users that are a member of your organization that have opted out of sending analytics. <br><br>When users opt out of sending analytics, you won't see any of their data in Insights. To ensure that the data includes all users, you can use [Settings Management](/desktop/hardened-desktop/settings-management/) to set `analyticsEnabled` for all your users.                                                                                                                                                                                                                                                                                                                                                                                          |
| Active users (graph)         | The view over time for total active users.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
@y
| Data                         | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|:-----------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Total active users           | The number of users that have actively used Docker Desktop and either signed in with a Docker account that has a license in your organization or signed in to a Docker account with an email address from a domain associated with your organization. <br><br>Users who don’t sign in to an account associated with your organization are not represented in the data. To ensure users sign in with an account associated with your organization, you can [enforce sign-in](__SUBDIR__/security/for-admins/enforce-sign-in/).                                                                                                                                                                                                                                                     |
| Active with license          | The number of users that have actively used Docker Desktop and have signed in to a Docker account with a license in your organization.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Active without license       | The number of users that have actively used Docker Desktop, are linked to a Docker account with an email address from a domain associated with your organization, and don’t have a license assigned to their account. <br><br>Users without a license don’t receive the benefits of your subscription. You can use [domain audit](__SUBDIR__/security/for-admins/domain-audit/) to identify users without a license. You can also use [Just-in-Time provisioning](__SUBDIR__/security/for-admins/provisioning/just-in-time/) or [SCIM](__SUBDIR__/security/for-admins/provisioning/scim/) to help automatically provision users with a license. Note that when SSO is configured and enforced, active without license will be 0. |
| Users opted out of analytics | The number of users that are a member of your organization that have opted out of sending analytics. <br><br>When users opt out of sending analytics, you won't see any of their data in Insights. To ensure that the data includes all users, you can use [Settings Management](__SUBDIR__/desktop/hardened-desktop/settings-management/) to set `analyticsEnabled` for all your users.                                                                                                                                                                                                                                                                                                                                                                                          |
| Active users (graph)         | The view over time for total active users.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
@z

@x
### Builds
@y
### Builds
@z

@x
Monitor development efficiency and the time your team invests in builds with
this chart. It provides a clear view of the build activity, helping you identify
patterns, optimize build times, and enhance overall development productivity.
@y
Monitor development efficiency and the time your team invests in builds with
this chart. It provides a clear view of the build activity, helping you identify
patterns, optimize build times, and enhance overall development productivity.
@z

@x
The chart contains the following data.
@y
The chart contains the following data.
@z

@x
| Data                   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|:-----------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Average build per user | The average number of builds per active user. A build includes any time a user runs one of the following commands: <ul><li>`docker build`</li><li>`docker buildx b`</li><li>`docker buildx bake`</li><li>`docker buildx build`</li><li>`docker buildx f`</li><li>`docker builder b`</li><li>`docker builder bake`</li><li>`docker builder build`</li><li>`docker builder f`</li><li>`docker compose build`</li><li>`docker compose up --build`</li><li>`docker image build`</li></ul> |
| Average build time     | The average build time per build.                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Build success rate     | The percentage of builds that were successful out of the total number of builds. A successful build includes any build that exits normally.                                                                                                                                                                                                                                                                                                                                          |
| Total builds (graph)   | The total number of builds separated into successful builds and failed builds. A successful build includes any build that exits normally. A failed build includes any build that exits abnormally.                                                                                                                                                                                                                                                                                   |
@y
| Data                   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|:-----------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Average build per user | The average number of builds per active user. A build includes any time a user runs one of the following commands: <ul><li>`docker build`</li><li>`docker buildx b`</li><li>`docker buildx bake`</li><li>`docker buildx build`</li><li>`docker buildx f`</li><li>`docker builder b`</li><li>`docker builder bake`</li><li>`docker builder build`</li><li>`docker builder f`</li><li>`docker compose build`</li><li>`docker compose up --build`</li><li>`docker image build`</li></ul> |
| Average build time     | The average build time per build.                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Build success rate     | The percentage of builds that were successful out of the total number of builds. A successful build includes any build that exits normally.                                                                                                                                                                                                                                                                                                                                          |
| Total builds (graph)   | The total number of builds separated into successful builds and failed builds. A successful build includes any build that exits normally. A failed build includes any build that exits abnormally.                                                                                                                                                                                                                                                                                   |
@z

@x
### Containers
@y
### Containers
@z

@x
View the total and average number of containers run by users with this chart. It
lets you gauge container usage across your organization, helping you understand
usage trends and manage resources effectively.
@y
View the total and average number of containers run by users with this chart. It
lets you gauge container usage across your organization, helping you understand
usage trends and manage resources effectively.
@z

@x
The chart contains the following data.
@y
The chart contains the following data.
@z

@x
| Data                                   | Description                                                                                                                                                                |
|:---------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Total containers run                   | The total number of containers run by active users. Containers run include those run using the Docker Desktop graphical user interface, `docker run`, or `docker compose`. |
| Average number of containers run       | The average number of containers run per active user.                                                                                                                      |
| Containers run by active users (graph) | The number of containers run over time by active users.                                                                                                                    |
@y
| Data                                   | Description                                                                                                                                                                |
|:---------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Total containers run                   | The total number of containers run by active users. Containers run include those run using the Docker Desktop graphical user interface, `docker run`, or `docker compose`. |
| Average number of containers run       | The average number of containers run per active user.                                                                                                                      |
| Containers run by active users (graph) | The number of containers run over time by active users.                                                                                                                    |
@z

@x
### Docker Desktop usage
@y
### Docker Desktop usage
@z

@x
Explore Docker Desktop usage patterns with this chart to optimize your team's
workflows and ensure compatibility. It provides valuable insights into how
Docker Desktop is being utilized, enabling you to streamline processes and
improve efficiency.
@y
Explore Docker Desktop usage patterns with this chart to optimize your team's
workflows and ensure compatibility. It provides valuable insights into how
Docker Desktop is being utilized, enabling you to streamline processes and
improve efficiency.
@z

@x
The chart contains the following data.
@y
The chart contains the following data.
@z

@x
| Data                              | Description                                                                                                                                                                                                                                                                       |
|:----------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Most used version                 | The most used version of Docker Desktop by users in your organization.                                                                                                                                                                                                            |
| Most used OS                      | The most used operating system by users.                                                                                                                                                                                                                                          |
| Versions by active users (graph)  | The number of active users using each version of Docker Desktop. <br><br>To learn more about each version and release dates, see the [Docker Desktop release notes](/desktop/release-notes/).                                                                                     |
| Interface by active users (graph) | The number of active users grouped into the type of interface they used to interact with Docker Desktop. <br><br>A CLI user is any active user who has run a `docker` command. A GUI user is any active user who has interacted with the Docker Desktop graphical user interface. |
@y
| Data                              | Description                                                                                                                                                                                                                                                                       |
|:----------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Most used version                 | The most used version of Docker Desktop by users in your organization.                                                                                                                                                                                                            |
| Most used OS                      | The most used operating system by users.                                                                                                                                                                                                                                          |
| Versions by active users (graph)  | The number of active users using each version of Docker Desktop. <br><br>To learn more about each version and release dates, see the [Docker Desktop release notes](__SUBDIR__/desktop/release-notes/).                                                                                     |
| Interface by active users (graph) | The number of active users grouped into the type of interface they used to interact with Docker Desktop. <br><br>A CLI user is any active user who has run a `docker` command. A GUI user is any active user who has interacted with the Docker Desktop graphical user interface. |
@z

@x
### Docker Hub images
@y
### Docker Hub images
@z

@x
Analyze image distribution activity with this chart and view the most utilized
Docker Hub images within your domain. This information helps you manage image
usage, ensuring that the most critical resources are readily available and
efficiently used.
@y
Analyze image distribution activity with this chart and view the most utilized
Docker Hub images within your domain. This information helps you manage image
usage, ensuring that the most critical resources are readily available and
efficiently used.
@z

@x
> [!NOTE]
> Data for images is only for Docker Hub. Data for third-party
> registries and mirrors aren't included.
@y
> [!NOTE]
> Data for images is only for Docker Hub. Data for third-party
> registries and mirrors aren't included.
@z

@x
The chart contains the following data.
@y
The chart contains the following data.
@z

@x
| Data                 | Description                                                                                                     |
|:---------------------|:----------------------------------------------------------------------------------------------------------------|
| Total pulled images  | The total number of images pulled by users from Docker Hub.                                                     |
| Total pushed images  | The total number of images pushed by users to Docker Hub.                                                       |
| Top 10 pulled images | A list of the top 10 images pulled by users from Docker Hub and the number of times each image has been pulled. |
@y
| Data                 | Description                                                                                                     |
|:---------------------|:----------------------------------------------------------------------------------------------------------------|
| Total pulled images  | The total number of images pulled by users from Docker Hub.                                                     |
| Total pushed images  | The total number of images pushed by users to Docker Hub.                                                       |
| Top 10 pulled images | A list of the top 10 images pulled by users from Docker Hub and the number of times each image has been pulled. |
@z

@x
### Extensions
@y
### Extensions
@z

@x
Monitor extension installation activity with this chart. It provides visibility
into the Docker Desktop extensions your team are using, letting you track
adoption and identify popular tools that enhance productivity.
@y
Monitor extension installation activity with this chart. It provides visibility
into the Docker Desktop extensions your team are using, letting you track
adoption and identify popular tools that enhance productivity.
@z

@x
The chart contains the following data.
@y
The chart contains the following data.
@z

@x
| Data                                           | Description                                                                                                                                      |
|:-----------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------|
| Percentage of org with extensions installed    | The percentage of users in your organization with at least one Docker Desktop extension installed.                                               |
| Top 5 extensions installed in the organization | A list of the top 5 Docker Desktop extensions installed by users in your organization and the number of users who have installed each extension. |
@y
| Data                                           | Description                                                                                                                                      |
|:-----------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------|
| Percentage of org with extensions installed    | The percentage of users in your organization with at least one Docker Desktop extension installed.                                               |
| Top 5 extensions installed in the organization | A list of the top 5 Docker Desktop extensions installed by users in your organization and the number of users who have installed each extension. |
@z

@x
## Troubleshoot Insights
@y
## Troubleshoot Insights
@z

@x
If you’re experiencing issues with data in Insights, consider the following
solutions to resolve common problems.
@y
If you’re experiencing issues with data in Insights, consider the following
solutions to resolve common problems.
@z

@x
* Update users to the latest version of Docker Desktop.
@y
* Update users to the latest version of Docker Desktop.
@z

@x
   Data is not shown for users using versions 4.16 or lower of Docker Desktop.
   In addition, older versions may not provide all data. Ensure all users have
   installed the latest version of Docker Desktop.
@y
   Data is not shown for users using versions 4.16 or lower of Docker Desktop.
   In addition, older versions may not provide all data. Ensure all users have
   installed the latest version of Docker Desktop.
@z

@x
* Enable **Send usage statistics** in Docker Desktop for all your users.
@y
* Enable **Send usage statistics** in Docker Desktop for all your users.
@z

@x
   If users have opted out of sending usage statistics for Docker Desktop, then
   their usage data will not be a part of Insights. To manage the setting at
   scale for all your users, you can use [Settings
   Management](/desktop/hardened-desktop/settings-management/) and enable the
   `analyticsEnabled` setting.
@y
   If users have opted out of sending usage statistics for Docker Desktop, then
   their usage data will not be a part of Insights. To manage the setting at
   scale for all your users, you can use [Settings
   Management](__SUBDIR__/desktop/hardened-desktop/settings-management/) and enable the
   `analyticsEnabled` setting.
@z

@x
* Ensure that users are using Docker Desktop and aren't using the standalone
  version of Docker Engine.
@y
* Ensure that users are using Docker Desktop and aren't using the standalone
  version of Docker Engine.
@z

@x
   Only Docker Desktop can provide data for Insights. If a user installs and
   uses Docker Engine outside of Docker Desktop, Docker Engine won't provide
   data for that user.
@y
   Only Docker Desktop can provide data for Insights. If a user installs and
   uses Docker Engine outside of Docker Desktop, Docker Engine won't provide
   data for that user.
@z

@x
* Ensure that users are signing in to an account associated with your
  organization.
@y
* Ensure that users are signing in to an account associated with your
  organization.
@z

@x
   Users who don’t sign in to an account associated with your organization are
   not represented in the data. To ensure users sign in with an account
   associated with your organization, you can [enforce
   sign-in](/security/for-admins/enforce-sign-in/).
@y
   Users who don’t sign in to an account associated with your organization are
   not represented in the data. To ensure users sign in with an account
   associated with your organization, you can [enforce
   sign-in](__SUBDIR__/security/for-admins/enforce-sign-in/).
@z
