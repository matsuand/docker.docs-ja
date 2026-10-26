%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: View organization Insights for Docker Desktop
linkTitle: Insights
@y
title: View organization Insights for Docker Desktop
linkTitle: Insights
@z

@x
description: >-
  View Docker Desktop usage for your organization in Insights, including
  active users, builds, containers, images, and extensions.
keywords: organization, Insights, Desktop insights, Docker Desktop analytics,
  Send usage statistics, analyticsEnabled, active users, builds, containers,
  images, extensions, export Docker Desktop users, Docker Business
@y
description: >-
  View Docker Desktop usage for your organization in Insights, including
  active users, builds, containers, images, and extensions.
keywords: organization, Insights, Desktop insights, Docker Desktop analytics,
  Send usage statistics, analyticsEnabled, active users, builds, containers,
  images, extensions, export Docker Desktop users, Docker Business
@z

@x
{{< summary-bar feature_name="Insights" >}}
@y
{{< summary-bar feature_name="Insights" >}}
@z

@x
Insights shows organization administrators how people in their organization
use Docker Desktop. Use it to track adoption, spot version and platform
patterns, and see where builds, containers, images, and extensions are in
use.
@y
Insights shows organization administrators how people in their organization
use Docker Desktop. Use it to track adoption, spot version and platform
patterns, and see where builds, containers, images, and extensions are in
use.
@z

@x
> [!TIP]
>
> After
> [upgrading to Docker Business](https://www.docker.com/pricing?ref=Docs&refAction=DocsAdminInsights),
> you must reach out to your Docker account team to enable Insights for
> your organization.
@y
> [!TIP]
>
> After
> [upgrading to Docker Business](https://www.docker.com/pricing?ref=Docs&refAction=DocsAdminInsights),
> you must reach out to your Docker account team to enable Insights for
> your organization.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To use Insights, you must meet the following requirements:
@y
To use Insights, you must meet the following requirements:
@z

@x
- A Docker Business subscription
- Administrators must
  [enforce sign-in](/manuals/desktop/enterprise/enforce-sign-in/_index.md)
  for users
- Docker Desktop users must have
  [Send usage
  statistics](/manuals/desktop/enterprise/hardened-desktop/settings-management/settings-reference.md#send-usage-statistics)
  enabled (`analyticsEnabled`). You can set this for every user through
  [Settings
  Management](/manuals/desktop/enterprise/hardened-desktop/settings-management/_index.md).
@y
- A Docker Business subscription
- Administrators must
  [enforce sign-in](manuals/desktop/enterprise/enforce-sign-in/_index.md)
  for users
- Docker Desktop users must have
  [Send usage
  statistics](manuals/desktop/enterprise/hardened-desktop/settings-management/settings-reference.md#send-usage-statistics)
  enabled (`analyticsEnabled`). You can set this for every user through
  [Settings
  Management](manuals/desktop/enterprise/hardened-desktop/settings-management/_index.md).
@z

@x
## View Insights {#view-insights-for-organization-users}
@y
## View Insights {#view-insights-for-organization-users}
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Desktop**, then **Desktop insights**.
1. Select a time period: **1 Week**, **1 Month**, or **3 Months**. Data
   may be delayed 24–48 hours. **Last updated** shows the sync date.
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Desktop**, then **Desktop insights**.
1. Select a time period: **1 Week**, **1 Month**, or **3 Months**. Data
   may be delayed 24–48 hours. **Last updated** shows the sync date.
@z

@x
## Export Docker Desktop user data
@y
## Export Docker Desktop user data
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Desktop**, then **Desktop insights**.
1. Select **Export Docker Desktop users**. The CSV file downloads
   automatically. It includes the standard
   [member CSV fields](/manuals/accounts/organization/manage/members.md#export-a-member-list-csv),
   plus these Insights columns:
@y
1. Sign in to [Docker Home](https://app.docker.com/) and select your
   organization.
1. Select **Docker Desktop**, then **Desktop insights**.
1. Select **Export Docker Desktop users**. The CSV file downloads
   automatically. It includes the standard
   [member CSV fields](manuals/accounts/organization/manage/members.md#export-a-member-list-csv),
   plus these Insights columns:
@z

@x
   | Column                 | Description                                                                                                                                                                                 |
   | :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
   | Last Logged-in Date    | Last browser sign-in to Docker Hub or Docker Home                                                                                                                                           |
   | Docker Desktop Version | Last Docker Desktop version the user ran                                                                                                                                                    |
   | Last Seen Date         | Last time the user ran Docker Desktop                                                                                                                                                       |
   | Opted Out Analytics    | Whether the user turned off [Send usage statistics](/manuals/desktop/enterprise/hardened-desktop/settings-management/settings-reference.md#send-usage-statistics) |
@y
   | Column                 | Description                                                                                                                                                                                 |
   | :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
   | Last Logged-in Date    | Last browser sign-in to Docker Hub or Docker Home                                                                                                                                           |
   | Docker Desktop Version | Last Docker Desktop version the user ran                                                                                                                                                    |
   | Last Seen Date         | Last time the user ran Docker Desktop                                                                                                                                                       |
   | Opted Out Analytics    | Whether the user turned off [Send usage statistics](manuals/desktop/enterprise/hardened-desktop/settings-management/settings-reference.md#send-usage-statistics) |
@z

@x
## Reference
@y
## Reference
@z

@x
The Insights dashboard is organized into sections that capture each area of
Docker Desktop activity. Refer to these tables when a value looks
unexpected, when you need to explain a metric to someone else, or when
you're deciding which section answers a question about adoption, build
health, or image usage.
@y
The Insights dashboard is organized into sections that capture each area of
Docker Desktop activity. Refer to these tables when a value looks
unexpected, when you need to explain a metric to someone else, or when
you're deciding which section answers a question about adoption, build
health, or image usage.
@z

@x
{{< accordion title="Docker Desktop users" >}}
@y
{{< accordion title="Docker Desktop users" >}}
@z

@x
The Docker Desktop users section shows how many people in your organization
run Docker Desktop and how that number changes over time. Use it to measure
adoption and to find users missing from the active counts. Active counts
include only users who send analytics.
@y
The Docker Desktop users section shows how many people in your organization
run Docker Desktop and how that number changes over time. Use it to measure
adoption and to find users missing from the active counts. Active counts
include only users who send analytics.
@z

@x
| Data | Description |
| :--------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Active members | Users who used Docker Desktop and signed in with a licensed account in your organization, or with an email address from a domain associated with your organization. |
| Total org members | Users who have used Docker Desktop, regardless of their Insights activity. |
| Members opted out of analytics | Organization members who opted out of sending analytics. |
| Registered users | Users linked to unassociated machines whose email addresses Docker captured, and those emails are outside your organization's domain. |
| Active users (graph) | Total active users over time. |
@y
| Data | Description |
| :--------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Active members | Users who used Docker Desktop and signed in with a licensed account in your organization, or with an email address from a domain associated with your organization. |
| Total org members | Users who have used Docker Desktop, regardless of their Insights activity. |
| Members opted out of analytics | Organization members who opted out of sending analytics. |
| Registered users | Users linked to unassociated machines whose email addresses Docker captured, and those emails are outside your organization's domain. |
| Active users (graph) | Total active users over time. |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Builds" >}}
@y
{{< accordion title="Builds" >}}
@z

@x
The Builds section shows how often users build images, how long builds take,
and how many succeed. Use it to spot slow or failing builds across the
organization and to gauge how much of your Docker Desktop usage is build
activity.
@y
The Builds section shows how often users build images, how long builds take,
and how many succeed. Use it to spot slow or failing builds across the
organization and to gauge how much of your Docker Desktop usage is build
activity.
@z

@x
| Data | Description |
| :--------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Average build per user | Average builds per active user. A build includes any time a user runs one of: `docker buildx bake`, `docker buildx build`, `docker buildx f`, `docker builder build`, `docker builder f`, `docker compose build`, or `docker image build`. |
| Average build time | Average build time per build. |
| Build success rate | Percentage of builds that exited normally. A failed build is any build that exits abnormally. |
| Total builds (graph) | Successful builds versus failed builds over time. |
@y
| Data | Description |
| :--------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Average build per user | Average builds per active user. A build includes any time a user runs one of: `docker buildx bake`, `docker buildx build`, `docker buildx f`, `docker builder build`, `docker builder f`, `docker compose build`, or `docker image build`. |
| Average build time | Average build time per build. |
| Build success rate | Percentage of builds that exited normally. A failed build is any build that exits abnormally. |
| Total builds (graph) | Successful builds versus failed builds over time. |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Containers" >}}
@y
{{< accordion title="Containers" >}}
@z

@x
The Containers section shows how many containers active users run and how
that activity trends over time. Use it to see how heavily your organization
relies on Docker Desktop for running workloads, not only for building them.
@y
The Containers section shows how many containers active users run and how
that activity trends over time. Use it to see how heavily your organization
relies on Docker Desktop for running workloads, not only for building them.
@z

@x
| Data | Description |
| :------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Total containers run | Containers run by active users in the Docker Desktop GUI, with `docker run`, or with `docker compose`. |
| Average number of containers run | Average containers run per active user. |
| Containers run by active users (graph) | Containers run over time by active users. |
@y
| Data | Description |
| :------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Total containers run | Containers run by active users in the Docker Desktop GUI, with `docker run`, or with `docker compose`. |
| Average number of containers run | Average containers run per active user. |
| Containers run by active users (graph) | Containers run over time by active users. |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Docker Desktop usage" >}}
@y
{{< accordion title="Docker Desktop usage" >}}
@z

@x
The Docker Desktop usage section shows which versions, operating systems,
and interfaces your users run. Use it to plan upgrades, find users on
outdated versions, and understand whether your organization works mainly
through the CLI or the GUI.
@y
The Docker Desktop usage section shows which versions, operating systems,
and interfaces your users run. Use it to plan upgrades, find users on
outdated versions, and understand whether your organization works mainly
through the CLI or the GUI.
@z

@x
| Data | Description |
| :-------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Most used version | Most used Docker Desktop version in your organization. |
| Most used OS | Most used operating system. |
| Versions by active users (graph) | Active users per Docker Desktop version. See the [Docker Desktop release notes](/manuals/desktop/release-notes.md). |
| Interface by active users (graph) | Active users by interface. A CLI user has run a `docker` command. A GUI user has used the Docker Desktop graphical interface. |
@y
| Data | Description |
| :-------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Most used version | Most used Docker Desktop version in your organization. |
| Most used OS | Most used operating system. |
| Versions by active users (graph) | Active users per Docker Desktop version. See the [Docker Desktop release notes](manuals/desktop/release-notes.md). |
| Interface by active users (graph) | Active users by interface. A CLI user has run a `docker` command. A GUI user has used the Docker Desktop graphical interface. |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Docker Hub images" >}}
@y
{{< accordion title="Docker Hub images" >}}
@z

@x
The Docker Hub images section shows which images your users pull and push,
and how often. Use it to see which images matter most to your organization
and to confirm that users pull from the sources you expect. Image data
covers Docker Hub only. Third-party registries and mirrors are excluded.
@y
The Docker Hub images section shows which images your users pull and push,
and how often. Use it to see which images matter most to your organization
and to confirm that users pull from the sources you expect. Image data
covers Docker Hub only. Third-party registries and mirrors are excluded.
@z

@x
| Data | Description |
| :----------------- | :------------------------------------------------------------------------------------------------------ |
| Total pulled images | Images pulled by active users. |
| Total pushed images | Images pushed. |
| Top pulled images | Top images pulled, and how many times each was pulled. |
@y
| Data | Description |
| :----------------- | :------------------------------------------------------------------------------------------------------ |
| Total pulled images | Images pulled by active users. |
| Total pushed images | Images pushed. |
| Top pulled images | Top images pulled, and how many times each was pulled. |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
{{< accordion title="Extensions" >}}
@y
{{< accordion title="Extensions" >}}
@z

@x
The Extensions section shows how widely Docker Desktop extensions are used
in your organization and which ones users install most. Use it to find
popular tools worth supporting and to spot extensions you did not
expect.
@y
The Extensions section shows how widely Docker Desktop extensions are used
in your organization and which ones users install most. Use it to find
popular tools worth supporting and to spot extensions you did not
expect.
@z

@x
| Data | Description |
| :---------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------- |
| Percentage of org with extensions installed | Percentage of users with at least one extension installed. |
| Top extensions installed in the organization | Top extensions installed, and how many users installed each one. |
@y
| Data | Description |
| :---------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------- |
| Percentage of org with extensions installed | Percentage of users with at least one extension installed. |
| Top extensions installed in the organization | Top extensions installed, and how many users installed each one. |
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Activity logs](/manuals/accounts/organization/activity-logs.md) for a
  record of organization and repository changes.
- [Insights FAQs](/manuals/faqs/accounts.md#why-is-insights-data-missing-for-some-users)
  to troubleshoot missing data.
@y
- [Activity logs](manuals/accounts/organization/activity-logs.md) for a
  record of organization and repository changes.
- [Insights FAQs](manuals/faqs/accounts.md#why-is-insights-data-missing-for-some-users)
  to troubleshoot missing data.
@z
