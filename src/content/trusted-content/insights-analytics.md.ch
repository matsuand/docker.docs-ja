%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Insights and analytics
description: Discover how to access usage statistics of your images on Docker Hub
keywords: docker hub, hub, insights, analytics, api, verified publisher
aliases:
- /docker-hub/publish/insights-analytics/
- /docker-hub/insights-analytics/
---
@y
---
title: Insights and analytics
description: Discover how to access usage statistics of your images on Docker Hub
keywords: docker hub, hub, insights, analytics, api, verified publisher
aliases:
- /docker-hub/publish/insights-analytics/
- /docker-hub/insights-analytics/
---
@z

@x
Insights and analytics provides usage analytics for Docker Verified
Publisher (DVP) and Docker-Sponsored Open Source (DSOS) images on Docker Hub. This includes self-serve access to image and extension usage metrics for a desired time span. You can also display the number of image pulls by tag or by digest, and get breakdowns by geolocation, cloud provider, client, and more.
@y
Insights and analytics provides usage analytics for Docker Verified
Publisher (DVP) and Docker-Sponsored Open Source (DSOS) images on Docker Hub. This includes self-serve access to image and extension usage metrics for a desired time span. You can also display the number of image pulls by tag or by digest, and get breakdowns by geolocation, cloud provider, client, and more.
@z

@x
<!-- prettier-ignore -->
> **Tip**
>
> Head to the
[Docker Verified Publisher Program](https://www.docker.com/partners/programs/) or [Docker-Sponsored Open Source](https://www.docker.com/community/open-source/application/#) pages
to learn more about the programs.
{ .tip }
@y
<!-- prettier-ignore -->
> **Tip**
>
> Head to the
[Docker Verified Publisher Program](https://www.docker.com/partners/programs/) or [Docker-Sponsored Open Source](https://www.docker.com/community/open-source/application/#) pages
to learn more about the programs.
{ .tip }
@z

@x
## View the image's analytics data
@y
## View the image's analytics data
@z

@x
You can find analytics data for your repositories on the **Insights and
analytics** dashboard at the following URL:
`https://hub.docker.com/orgs/{namespace}/insights/images`. The dashboard contains a
visualization of the usage data and a table where you can download
the data as CSV files.
@y
You can find analytics data for your repositories on the **Insights and
analytics** dashboard at the following URL:
`https://hub.docker.com/orgs/{namespace}/insights/images`. The dashboard contains a
visualization of the usage data and a table where you can download
the data as CSV files.
@z

@x
To view data in the chart:
@y
To view data in the chart:
@z

@x
- Select the data granularity: weekly or monthly
- Select the time interval: 3, 6, or 12 months
- Select one or more repositories in the list
@y
- Select the data granularity: weekly or monthly
- Select the time interval: 3, 6, or 12 months
- Select one or more repositories in the list
@z

@x
![Insights and analytics chart visualization](./images/chart.png)
@y
![Insights and analytics chart visualization](./images/chart.png)
@z

@x
<!-- prettier-ignore -->
> **Tip**
>
> Hovering your cursor over the chart displays a tooltip, showing precise data
> for points in time.
{ .tip }
@y
<!-- prettier-ignore -->
> **Tip**
>
> Hovering your cursor over the chart displays a tooltip, showing precise data
> for points in time.
{ .tip }
@z

@x
### Share analytics data
@y
### Share analytics data
@z

@x
You can share the visualization with others using the **Share** icon above the chart.
This is a convenient way to share statistics with others in your organization.
@y
You can share the visualization with others using the **Share** icon above the chart.
This is a convenient way to share statistics with others in your organization.
@z

@x
![Chart share icon](./images/chart-share-icon.png)
@y
![Chart share icon](./images/chart-share-icon.png)
@z

@x
Selecting the icon generates a link that's copied to your clipboard. The link
preserves the display selections you made. When someone follows the link, the
**Insights and analytics** page opens and displays the chart with the same
configuration as you had set up when creating the link.
@y
Selecting the icon generates a link that's copied to your clipboard. The link
preserves the display selections you made. When someone follows the link, the
**Insights and analytics** page opens and displays the chart with the same
configuration as you had set up when creating the link.
@z

@x
## Extension analytics data
@y
## Extension analytics data
@z

@x
If you have published Docker Extensions in the Extension marketplace, you can also get analytics about your extension usage, available as CSV files.
You can download extension CSV reports from the **Insights and analytics** dashboard at the following URL:
`https://hub.docker.com/orgs/{namespace}/insights/extensions`. If your Docker namespace contains extensions known in the marketplace, you will see an **Extensions** tab listing CSV files for your extension(s).
@y
If you have published Docker Extensions in the Extension marketplace, you can also get analytics about your extension usage, available as CSV files.
You can download extension CSV reports from the **Insights and analytics** dashboard at the following URL:
`https://hub.docker.com/orgs/{namespace}/insights/extensions`. If your Docker namespace contains extensions known in the marketplace, you will see an **Extensions** tab listing CSV files for your extension(s).
@z

@x
## Exporting analytics data
@y
## Exporting analytics data
@z

@x
You can export the analytics data either from the web dashboard, or using the
[DVP Data API](/docker-hub/api/dvp/). All members of an organization have access to the analytics data.
@y
You can export the analytics data either from the web dashboard, or using the
[DVP Data API](/docker-hub/api/dvp/). All members of an organization have access to the analytics data.
@z

@x
The data is available as a downloadable CSV file, in a weekly (Monday through
Sunday) or monthly format. Monthly data is available from the first day of the
following calendar month. You can import this data into your own systems, or you
can analyze it manually as a spreadsheet.
@y
The data is available as a downloadable CSV file, in a weekly (Monday through
Sunday) or monthly format. Monthly data is available from the first day of the
following calendar month. You can import this data into your own systems, or you
can analyze it manually as a spreadsheet.
@z

@x
### Export data
@y
### Export data
@z

@x
Export usage data for your organization's images using the Docker Hub website by following these steps:
@y
Export usage data for your organization's images using the Docker Hub website by following these steps:
@z

@x
1.  Sign in to [Docker Hub](https://hub.docker.com/) and select **Organizations**.
@y
1.  Sign in to [Docker Hub](https://hub.docker.com/) and select **Organizations**.
@z

@x
2.  Choose your organization and select **Insights and analytics**.
@y
2.  Choose your organization and select **Insights and analytics**.
@z

@x
    ![Organization overview page, with the Insights and Analytics tab](./images/organization-tabs.png)
@y
    ![Organization overview page, with the Insights and Analytics tab](./images/organization-tabs.png)
@z

@x
3.  Set the time span for which you want to export analytics data.
@y
3.  Set the time span for which you want to export analytics data.
@z

@x
    The downloadable CSV files for summary and raw data appear on the right-hand
    side.
@y
    The downloadable CSV files for summary and raw data appear on the right-hand
    side.
@z

@x
    ![Filtering options and download links for analytics data](./images/download-analytics-data.png)
@y
    ![Filtering options and download links for analytics data](./images/download-analytics-data.png)
@z

@x
### Export data using the API
@y
### Export data using the API
@z

@x
The HTTP API endpoints are available at:
`https://hub.docker.com/api/publisher/analytics/v1`. Learn how to export data
using the API in the [DVP Data API documentation](/docker-hub/api/dvp/).
@y
The HTTP API endpoints are available at:
`https://hub.docker.com/api/publisher/analytics/v1`. Learn how to export data
using the API in the [DVP Data API documentation](/docker-hub/api/dvp/).
@z

@x
## Data points
@y
## Data points
@z

@x
Export data in either raw or summary format. Each format contains different data
points and with different structure.
@y
Export data in either raw or summary format. Each format contains different data
points and with different structure.
@z

@x
The following sections describe the available data points for each format. The
**Date added** column shows when the field was first introduced.
@y
The following sections describe the available data points for each format. The
**Date added** column shows when the field was first introduced.
@z

@x
### Image pulls raw data
@y
### Image pulls raw data
@z

@x
The raw data format contains the following data points. Each row in the CSV file
represents an image pull.
@y
The raw data format contains the following data points. Each row in the CSV file
represents an image pull.
@z

@x
| Data point                    | Description                                                                                                  | Date added        |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------ | ----------------- |
| Action                        | Request type, see [Action classification rules][1]. One of `pull_by_tag`, `pull_by_digest`, `version_check`. | January 1, 2022   |
| Action day                    | The date part of the timestamp: `YYYY-MM-DD`.                                                                 | January 1, 2022   |
| Country                       | Request origin country.                                                                                      | January 1, 2022   |
| Digest                        | Image digest.                                                                                                | January 1, 2022   |
| HTTP method                   | HTTP method used in the request, see [registry API documentation][2] for details.                            | January 1, 2022   |
| Host                          | The cloud service provider used in an event.                                                                 | January 1, 2022   |
| Namespace                     | Docker [organization][3] (image namespace).                                                                  | January 1, 2022   |
| Reference                     | Image digest or tag used in the request.                                                                     | January 1, 2022   |
| Repository                    | Docker [repository][4] (image name).                                                                         | January 1, 2022   |
| Tag (included when available) | Tag name that's only available if the request referred to a tag.                                             | January 1, 2022   |
| Timestamp                     | Date and time of the request: `YYYY-MM-DD 00:00:00`.                                                          | January 1, 2022   |
| Type                          | The industry from which the event originates. One of `business`, `isp`, `hosting`, `education`, `null`.       | January 1, 2022   |
| User agent tool               | The application a user used to pull an image (for example, `docker` or `containerd`).                        | January 1, 2022   |
| User agent version            | The version of the application used to pull an image.                                                        | January 1, 2022   |
| Domain                        | Request origin domain, see [Privacy](#privacy).                                                              | October 11, 2022  |
| Owner                         | The name of the organization that owns the repository.                                                       | December 19, 2022 |
@y
| Data point                    | Description                                                                                                  | Date added        |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------ | ----------------- |
| Action                        | Request type, see [Action classification rules][1]. One of `pull_by_tag`, `pull_by_digest`, `version_check`. | January 1, 2022   |
| Action day                    | The date part of the timestamp: `YYYY-MM-DD`.                                                                 | January 1, 2022   |
| Country                       | Request origin country.                                                                                      | January 1, 2022   |
| Digest                        | Image digest.                                                                                                | January 1, 2022   |
| HTTP method                   | HTTP method used in the request, see [registry API documentation][2] for details.                            | January 1, 2022   |
| Host                          | The cloud service provider used in an event.                                                                 | January 1, 2022   |
| Namespace                     | Docker [organization][3] (image namespace).                                                                  | January 1, 2022   |
| Reference                     | Image digest or tag used in the request.                                                                     | January 1, 2022   |
| Repository                    | Docker [repository][4] (image name).                                                                         | January 1, 2022   |
| Tag (included when available) | Tag name that's only available if the request referred to a tag.                                             | January 1, 2022   |
| Timestamp                     | Date and time of the request: `YYYY-MM-DD 00:00:00`.                                                          | January 1, 2022   |
| Type                          | The industry from which the event originates. One of `business`, `isp`, `hosting`, `education`, `null`.       | January 1, 2022   |
| User agent tool               | The application a user used to pull an image (for example, `docker` or `containerd`).                        | January 1, 2022   |
| User agent version            | The version of the application used to pull an image.                                                        | January 1, 2022   |
| Domain                        | Request origin domain, see [Privacy](#privacy).                                                              | October 11, 2022  |
| Owner                         | The name of the organization that owns the repository.                                                       | December 19, 2022 |
@z

@x
[1]: #image-pulls-action-classification-rules
[2]: /registry/spec/api/
[3]: /admin/organization/orgs/
[4]: /docker-hub/repos/
@y
[1]: #image-pulls-action-classification-rules
[2]: /registry/spec/api/
[3]: /admin/organization/orgs/
[4]: /docker-hub/repos/
@z

@x
### Image pulls summary data
@y
### Image pulls summary data
@z

@x
There are two levels of summary data available:
@y
There are two levels of summary data available:
@z

@x
- Repository-level, a summary of every namespace and repository
- Tag- or digest-level, a summary of every namespace, repository, and reference
  (tag or digest)
@y
- Repository-level, a summary of every namespace and repository
- Tag- or digest-level, a summary of every namespace, repository, and reference
  (tag or digest)
@z

@x
The summary data formats contain the following data points for the selected time
span:
@y
The summary data formats contain the following data points for the selected time
span:
@z

@x
| Data point        | Description                                             | Date added        |
| ----------------- | ------------------------------------------------------- | ----------------- |
| Unique IP address | Number of unique IP addresses, see [Privacy](#privacy). | January 1, 2022   |
| Pull by tag       | GET request, by digest or by tag.                       | January 1, 2022   |
| Pull by digest    | GET or HEAD request by digest, or HEAD by digest.       | January 1, 2022   |
| Version check     | HEAD by tag, not followed by a GET                      | January 1, 2022   |
| Owner             | The name of the organization that owns the repository.  | December 19, 2022 |
@y
| Data point        | Description                                             | Date added        |
| ----------------- | ------------------------------------------------------- | ----------------- |
| Unique IP address | Number of unique IP addresses, see [Privacy](#privacy). | January 1, 2022   |
| Pull by tag       | GET request, by digest or by tag.                       | January 1, 2022   |
| Pull by digest    | GET or HEAD request by digest, or HEAD by digest.       | January 1, 2022   |
| Version check     | HEAD by tag, not followed by a GET                      | January 1, 2022   |
| Owner             | The name of the organization that owns the repository.  | December 19, 2022 |
@z

@x
### Image pulls action classification rules
@y
### Image pulls action classification rules
@z

@x
An action represents the multiple request events associated with a
`docker pull`. Pulls are grouped by category to make the data more meaningful
for understanding user behavior and intent. The categories are:
@y
An action represents the multiple request events associated with a
`docker pull`. Pulls are grouped by category to make the data more meaningful
for understanding user behavior and intent. The categories are:
@z

@x
- Version check
- Pull by tag
- Pull by digest
@y
- Version check
- Pull by tag
- Pull by digest
@z

@x
Automated systems frequently check for new versions of your images. Being able
to distinguish between "version checks" in CI versus actual image pulls by a
user grants you more insight into your users' behavior.
@y
Automated systems frequently check for new versions of your images. Being able
to distinguish between "version checks" in CI versus actual image pulls by a
user grants you more insight into your users' behavior.
@z

@x
The following table describes the rules applied for determining intent behind
pulls. To provide feedback or ask questions about these rules,
[fill out the Google Form](https://forms.gle/nb7beTUQz9wzXy1b6).
@y
The following table describes the rules applied for determining intent behind
pulls. To provide feedback or ask questions about these rules,
[fill out the Google Form](https://forms.gle/nb7beTUQz9wzXy1b6).
@z

@x
| Starting event | Reference | Followed by                                                     | Resulting action | Use case(s)                                                                                                    | Notes                                                                                                                                                                                                                                                                                 |
| :------------- | :-------- | :-------------------------------------------------------------- | :--------------- | :------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| HEAD           | tag       | N/A                                                             | Version check    | User already has all layers existing on local machine                                                          | This is similar to the use case of a pull by tag when the user already has all the image layers existing locally, however, it differentiates the user intent and classifies accordingly.                                                                                              |
| GET            | tag       | N/A                                                             | Pull by tag      | User already has all layers existing on local machine and/or the image is single-arch                          |                                                                                                                                                                                                                                                                                       |
| GET            | tag       | Get by different digest                                         | Pull by tag      | Image is multi-arch                                                                                            | Second GET by digest must be different from the first.                                                                                                                                                                                                                                |
| HEAD           | tag       | GET by same digest                                              | Pull by tag      | Image is multi-arch but some or all image layers already exist on the local machine                            | The HEAD by tag sends the most current digest, the following GET must be by that same digest. There may occur an additional GET, if the image is multi-arch (see the next row in this table). If the user doesn't want the most recent digest, then the user performs HEAD by digest. |
| HEAD           | tag       | GET by the same digest, then a second GET by a different digest | Pull by tag      | Image is multi-arch                                                                                            | The HEAD by tag sends the most recent digest, the following GET must be by that same digest. Since the image is multi-arch, there is a second GET by a different digest. If the user doesn't want the most recent digest, then the user performs HEAD by digest.                      |
| HEAD           | tag       | GET by same digest, then a second GET by different digest       | Pull by tag      | Image is multi-arch                                                                                            | The HEAD by tag sends the most current digest, the following GET must be by that same digest. Since the image is multi-arch, there is a second GET by a different digest. If the user doesn't want the most recent digest, then the user performs HEAD by digest.                     |
| GET            | digest    | N/A                                                             | Pull by digest   | User already has all layers existing on local machine and/or the image is single-arch                          |                                                                                                                                                                                                                                                                                       |
| HEAD           | digest    | N/A                                                             | Pull by digest   | User already has all layers existing on their local machine                                                    |                                                                                                                                                                                                                                                                                       |
| GET            | digest    | GET by different digest                                         | Pull by digest   | Image is multi-arch                                                                                            | The second GET by digest must be different from the first.                                                                                                                                                                                                                            |
| HEAD           | digest    | GET by same digest                                              | Pull by digest   | Image is single-arch and/or image is multi-arch but some part of the image already exists on the local machine |                                                                                                                                                                                                                                                                                       |
| HEAD           | digest    | GET by same digest, then a second GET by different digest       | Pull by Digest   | Image is multi-arch                                                                                            |                                                                                                                                                                                                                                                                                       |
@y
| Starting event | Reference | Followed by                                                     | Resulting action | Use case(s)                                                                                                    | Notes                                                                                                                                                                                                                                                                                 |
| :------------- | :-------- | :-------------------------------------------------------------- | :--------------- | :------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| HEAD           | tag       | N/A                                                             | Version check    | User already has all layers existing on local machine                                                          | This is similar to the use case of a pull by tag when the user already has all the image layers existing locally, however, it differentiates the user intent and classifies accordingly.                                                                                              |
| GET            | tag       | N/A                                                             | Pull by tag      | User already has all layers existing on local machine and/or the image is single-arch                          |                                                                                                                                                                                                                                                                                       |
| GET            | tag       | Get by different digest                                         | Pull by tag      | Image is multi-arch                                                                                            | Second GET by digest must be different from the first.                                                                                                                                                                                                                                |
| HEAD           | tag       | GET by same digest                                              | Pull by tag      | Image is multi-arch but some or all image layers already exist on the local machine                            | The HEAD by tag sends the most current digest, the following GET must be by that same digest. There may occur an additional GET, if the image is multi-arch (see the next row in this table). If the user doesn't want the most recent digest, then the user performs HEAD by digest. |
| HEAD           | tag       | GET by the same digest, then a second GET by a different digest | Pull by tag      | Image is multi-arch                                                                                            | The HEAD by tag sends the most recent digest, the following GET must be by that same digest. Since the image is multi-arch, there is a second GET by a different digest. If the user doesn't want the most recent digest, then the user performs HEAD by digest.                      |
| HEAD           | tag       | GET by same digest, then a second GET by different digest       | Pull by tag      | Image is multi-arch                                                                                            | The HEAD by tag sends the most current digest, the following GET must be by that same digest. Since the image is multi-arch, there is a second GET by a different digest. If the user doesn't want the most recent digest, then the user performs HEAD by digest.                     |
| GET            | digest    | N/A                                                             | Pull by digest   | User already has all layers existing on local machine and/or the image is single-arch                          |                                                                                                                                                                                                                                                                                       |
| HEAD           | digest    | N/A                                                             | Pull by digest   | User already has all layers existing on their local machine                                                    |                                                                                                                                                                                                                                                                                       |
| GET            | digest    | GET by different digest                                         | Pull by digest   | Image is multi-arch                                                                                            | The second GET by digest must be different from the first.                                                                                                                                                                                                                            |
| HEAD           | digest    | GET by same digest                                              | Pull by digest   | Image is single-arch and/or image is multi-arch but some part of the image already exists on the local machine |                                                                                                                                                                                                                                                                                       |
| HEAD           | digest    | GET by same digest, then a second GET by different digest       | Pull by Digest   | Image is multi-arch                                                                                            |                                                                                                                                                                                                                                                                                       |
@z

@x
### Extension Summary data
@y
### Extension Summary data
@z

@x
There are two levels of extension summary data available:
@y
There are two levels of extension summary data available:
@z

@x
- Core summary, with basic extension usage information: number of extension installs, uninstalls, and total install all times
@y
- Core summary, with basic extension usage information: number of extension installs, uninstalls, and total install all times
@z

@x
The core-summary-data file contains the following data points for the selected time
span:
@y
The core-summary-data file contains the following data points for the selected time
span:
@z

@x
| Data point        | Description                                             | Date added        |
| ----------------- | ------------------------------------------------------- | ----------------- |
| Installs          | Number of installs for the extension                    | Feb 1, 2024       |
| TotalInstalls     | Number of installs for the extension all times          | Feb 1, 2024       |
| Uninstalls        | Number of uninstalls for the extension                  | Feb 1, 2024       |
| TotalUninstalls   | Number of uninstalls for the extension all times        | Feb 1, 2024       |
| Updates           | Number of updates for the extension                     | Feb 1, 2024       |
@y
| Data point        | Description                                             | Date added        |
| ----------------- | ------------------------------------------------------- | ----------------- |
| Installs          | Number of installs for the extension                    | Feb 1, 2024       |
| TotalInstalls     | Number of installs for the extension all times          | Feb 1, 2024       |
| Uninstalls        | Number of uninstalls for the extension                  | Feb 1, 2024       |
| TotalUninstalls   | Number of uninstalls for the extension all times        | Feb 1, 2024       |
| Updates           | Number of updates for the extension                     | Feb 1, 2024       |
@z

@x
- Premium summary, with advanced extension usage information: installs, uninstalls by unique users, extension opening by unique users.
@y
- Premium summary, with advanced extension usage information: installs, uninstalls by unique users, extension opening by unique users.
@z

@x
The core-summary-data file contains the following data points for the selected time
span:
@y
The core-summary-data file contains the following data points for the selected time
span:
@z

@x
| Data point        | Description                                             | Date added        |
| ----------------- | ------------------------------------------------------- | ----------------- |
| Installs          | Number of installs for the extension                    | Feb 1, 2024       |
| UniqueInstalls    | Number of unique users installing the extension         | Feb 1, 2024       |
| Uninstalls        | Number of uninstalls for the extension                  | Feb 1, 2024       |
| UniqueUninstalls  | Number of unique users uninstalling the extension       | Feb 1, 2024       |
| Usage             | Number of openings of the extension tab                 | Feb 1, 2024       |
| UniqueUsers       | Number of unique users openings the extension tab       | Feb 1, 2024       |
@y
| Data point        | Description                                             | Date added        |
| ----------------- | ------------------------------------------------------- | ----------------- |
| Installs          | Number of installs for the extension                    | Feb 1, 2024       |
| UniqueInstalls    | Number of unique users installing the extension         | Feb 1, 2024       |
| Uninstalls        | Number of uninstalls for the extension                  | Feb 1, 2024       |
| UniqueUninstalls  | Number of unique users uninstalling the extension       | Feb 1, 2024       |
| Usage             | Number of openings of the extension tab                 | Feb 1, 2024       |
| UniqueUsers       | Number of unique users openings the extension tab       | Feb 1, 2024       |
@z

@x
## Changes in data over time
@y
## Changes in data over time
@z

@x
The insights and analytics service is continuously improved to increase the
value it brings to publishers. Some changes might include adding new data
points, or improving existing data to make it more useful.
@y
The insights and analytics service is continuously improved to increase the
value it brings to publishers. Some changes might include adding new data
points, or improving existing data to make it more useful.
@z

@x
Changes in the dataset, such as added or removed fields, generally only apply
from the date of when the field was first introduced, and going forward.
@y
Changes in the dataset, such as added or removed fields, generally only apply
from the date of when the field was first introduced, and going forward.
@z

@x
Refer to the tables in the [Data points](#data-points) section to see from which
date a given data point is available.
@y
Refer to the tables in the [Data points](#data-points) section to see from which
date a given data point is available.
@z

@x
## Privacy
@y
## Privacy
@z

@x
This section contains information about privacy-protecting measures that ensures
consumers of content on Docker Hub remain completely anonymous.
@y
This section contains information about privacy-protecting measures that ensures
consumers of content on Docker Hub remain completely anonymous.
@z

@x
<!-- prettier-ignore -->
> **Important**
>
> Docker never shares any Personally Identifiable Information (PII) as part of
> analytics data.
{ .important }
@y
<!-- prettier-ignore -->
> **Important**
>
> Docker never shares any Personally Identifiable Information (PII) as part of
> analytics data.
{ .important }
@z

@x
The image pulls summary dataset includes unique IP address count. This data point only
includes the number of distinct unique IP addresses that request an image.
Individual IP addresses are never shared.
@y
The image pulls summary dataset includes unique IP address count. This data point only
includes the number of distinct unique IP addresses that request an image.
Individual IP addresses are never shared.
@z

@x
The image pulls raw dataset includes user IP domains as a data point. This is the domain name
associated with the IP address used to pull an image. If the IP type is
`business`, the domain represents the company or organization associated with
that IP address (for example, `docker.com`). For any other IP type that's not
`business`, the domain represents the internet service provider or hosting
provider used to make the request. On average, only about 30% of all pulls
classify as the `business` IP type (this varies between publishers and images).
@y
The image pulls raw dataset includes user IP domains as a data point. This is the domain name
associated with the IP address used to pull an image. If the IP type is
`business`, the domain represents the company or organization associated with
that IP address (for example, `docker.com`). For any other IP type that's not
`business`, the domain represents the internet service provider or hosting
provider used to make the request. On average, only about 30% of all pulls
classify as the `business` IP type (this varies between publishers and images).
@z
