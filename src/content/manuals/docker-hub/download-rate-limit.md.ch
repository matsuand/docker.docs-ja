%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
description: Learn about usage and rate limits for Docker Hub.
keywords: Docker Hub, pulls, download, limit, usage, storage
title: Docker Hub usage and rate limits
linkTitle: Usage and rate limits
@y
description: Learn about usage and rate limits for Docker Hub.
keywords: Docker Hub, pulls, download, limit, usage, storage
title: Docker Hub usage and rate limits
linkTitle: Usage and rate limits
@z

@x
Docker may impose usage and rate limits for Docker Hub to ensure fair resource
consumption and maintain service quality. Understanding your usage helps you
manage your and your organization's usage effectively.
@y
Docker may impose usage and rate limits for Docker Hub to ensure fair resource
consumption and maintain service quality. Understanding your usage helps you
manage your and your organization's usage effectively.
@z

@x
## Usage
@y
## Usage
@z

@x
Usage refers to both:
- Pulls: The amount of data transferred from Docker Hub
- Storage: The amount of data stored on Docker Hub
@y
Usage refers to both:
- Pulls: The amount of data transferred from Docker Hub
- Storage: The amount of data stored on Docker Hub
@z

@x
### Fair use
@y
### Fair use
@z

@x
When utilizing the Docker Platform, users should be aware that excessive data
transfer, pull rates, or data storage can lead to throttling, or additional
charges. To ensure fair resource usage and maintain service quality, we reserve
the right to impose restrictions or apply additional charges to accounts
exhibiting excessive data and storage consumption.
@y
When utilizing the Docker Platform, users should be aware that excessive data
transfer, pull rates, or data storage can lead to throttling, or additional
charges. To ensure fair resource usage and maintain service quality, we reserve
the right to impose restrictions or apply additional charges to accounts
exhibiting excessive data and storage consumption.
@z

@x
### View Docker Hub usage
@y
### View Docker Hub usage
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
   If you want to download usage for all members of an organization, you must
   sign in to an account that is an owner for that organization. Otherwise,
   you can only view your own personal usage.
@y
   If you want to download usage for all members of an organization, you must
   sign in to an account that is an owner for that organization. Otherwise,
   you can only view your own personal usage.
@z

@x
2. In Docker Hub, select **Usage** from the top-level navigation menu.
3. In the drop-down, select whether you want to view your personal or organization data.
4. The usage page displays **Pulls** and **Storage** usage.
5. Select a usage type and use the available filters to view usage.
@y
2. In Docker Hub, select **Usage** from the top-level navigation menu.
3. In the drop-down, select whether you want to view your personal or organization data.
4. The usage page displays **Pulls** and **Storage** usage.
5. Select a usage type and use the available filters to view usage.
@z

@x
### Download Docker Hub pulls usage
@y
### Download Docker Hub pulls usage
@z

@x
You can download a CSV file of your or your organization's Docker Hub pulls usage. You can't download a CSV file for storage usage.
@y
You can download a CSV file of your or your organization's Docker Hub pulls usage. You can't download a CSV file for storage usage.
@z

@x
To download the pulls usage file:
@y
To download the pulls usage file:
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
@z

@x
   If you want to download usage for all members of an organization, you must
   sign in to an account that is an owner for that organization. Otherwise,
   you can only view your own personal usage.
@y
   If you want to download usage for all members of an organization, you must
   sign in to an account that is an owner for that organization. Otherwise,
   you can only view your own personal usage.
@z

@x
2. In Docker Hub, select **Usage** from the top-level navigation menu.
3. In the drop-down, select whether you want to view your personal or organization data.
4. Optional. Use the **Filter by privacy** drop-down to select **Public** or **Private** pulls.
5. Use the **From** and **To** filters to select a date range for the data.
6. Select **Send report to email** to have Docker email you a link to the data
   file. Note that email processing time may vary.
@y
2. In Docker Hub, select **Usage** from the top-level navigation menu.
3. In the drop-down, select whether you want to view your personal or organization data.
4. Optional. Use the **Filter by privacy** drop-down to select **Public** or **Private** pulls.
5. Use the **From** and **To** filters to select a date range for the data.
6. Select **Send report to email** to have Docker email you a link to the data
   file. Note that email processing time may vary.
@z

@x
The file contains the following comma separated values:
@y
The file contains the following comma separated values:
@z

@x
| CSV column           | Definition                                                                                                                                                                                                                 | Usage guidance                                                                                                                                                                      |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `datehour`           | The date and hour (`yyyy/mm/dd/hh`) of the pull that resulted in the data transfer.                                                                                                                                        | This helps in identifying peak usage times and patterns.                                                                                                                            |
| `user_name`          | The Docker ID of the user that pulled the image                                                                                                                                                                            | This lets organization owners track data consumption per user and manage resources effectively.                                                                                     |
| `repository`         | The name of the repository of the image that was pulled.                                                                                                                                                                   | This lets you identify which repositories are most frequently accessed and consume most of the data transfer.                                                                       |
| `access_token_name`  | Name of the access token that was used for authentication with Docker CLI. `generated` tokens are automatically generated by the Docker client when a user signs in.                                              | Personal access tokens are usually used to authenticate automated tools (Docker Desktop, CI/CD tools, etc.). This is useful for identifying which automated system issued the pull. |
| `ips`                | The IP address that was used to pull the image. This field is aggregated, so more than one IP address may appear, representing all the IPs used to pull an image within the same date and hour.                            | This helps you understand the origin of the data transfer, which is useful for diagnosing and identifying patterns in automated or manual pulls.                                    |
| `repository_privacy` | The privacy state of the image repository that was pulled. This can either be `public` or `private`.                                                                                                                       | This distinguishes between public and private repositories to identify which data transfer threshold the pull impacts.                                                              |
| `tag`                | The tag for the image. The tag is only available if the pull included a tag.                                                                                                                                       | This helps in identifying the image. Tags are often used to identify specific versions or variants of an image.                                                                     |
| `digest`             | The unique image digest for the image.                                                                                                                                                                                     | This helps in identifying the image.                                                                                                                                                |
| `version_checks`     | The number of version checks accumulated for the date and hour of each image repository. Depending on the client, a pull can do a version check to verify the existence of an image or tag without downloading it. | This helps identify the frequency of version checks, which you can use to analyze usage trends and potential unexpected behaviors.                                                  |
| `pulls`              | The number of pulls accumulated for the date and hour of each image repository.                                                                                                                                            | This helps identify the frequency of repository pulls, which you can use to analyze usage trends and potential unexpected behaviors.                                                |
@y
| CSV column           | Definition                                                                                                                                                                                                                 | Usage guidance                                                                                                                                                                      |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `datehour`           | The date and hour (`yyyy/mm/dd/hh`) of the pull that resulted in the data transfer.                                                                                                                                        | This helps in identifying peak usage times and patterns.                                                                                                                            |
| `user_name`          | The Docker ID of the user that pulled the image                                                                                                                                                                            | This lets organization owners track data consumption per user and manage resources effectively.                                                                                     |
| `repository`         | The name of the repository of the image that was pulled.                                                                                                                                                                   | This lets you identify which repositories are most frequently accessed and consume most of the data transfer.                                                                       |
| `access_token_name`  | Name of the access token that was used for authentication with Docker CLI. `generated` tokens are automatically generated by the Docker client when a user signs in.                                              | Personal access tokens are usually used to authenticate automated tools (Docker Desktop, CI/CD tools, etc.). This is useful for identifying which automated system issued the pull. |
| `ips`                | The IP address that was used to pull the image. This field is aggregated, so more than one IP address may appear, representing all the IPs used to pull an image within the same date and hour.                            | This helps you understand the origin of the data transfer, which is useful for diagnosing and identifying patterns in automated or manual pulls.                                    |
| `repository_privacy` | The privacy state of the image repository that was pulled. This can either be `public` or `private`.                                                                                                                       | This distinguishes between public and private repositories to identify which data transfer threshold the pull impacts.                                                              |
| `tag`                | The tag for the image. The tag is only available if the pull included a tag.                                                                                                                                       | This helps in identifying the image. Tags are often used to identify specific versions or variants of an image.                                                                     |
| `digest`             | The unique image digest for the image.                                                                                                                                                                                     | This helps in identifying the image.                                                                                                                                                |
| `version_checks`     | The number of version checks accumulated for the date and hour of each image repository. Depending on the client, a pull can do a version check to verify the existence of an image or tag without downloading it. | This helps identify the frequency of version checks, which you can use to analyze usage trends and potential unexpected behaviors.                                                  |
| `pulls`              | The number of pulls accumulated for the date and hour of each image repository.                                                                                                                                            | This helps identify the frequency of repository pulls, which you can use to analyze usage trends and potential unexpected behaviors.                                                |
@z

@x
### Best practices for managing Docker Hub usage
@y
### Best practices for managing Docker Hub usage
@z

@x
Use the following steps to help optimize and manage your Docker Hub usage for
both individuals and organizations:
@y
Use the following steps to help optimize and manage your Docker Hub usage for
both individuals and organizations:
@z

@x
1. [View your Docker Hub usage](#view-docker-hub-usage).
@y
1. [View your Docker Hub usage](#view-docker-hub-usage).
@z

@x
2. Use the Docker Hub usage data to identify which accounts consume the most
   data, determine peak usage times, and identify which images are related to
   the most data usage. In addition, look for usage trends, such as the
   following:
@y
2. Use the Docker Hub usage data to identify which accounts consume the most
   data, determine peak usage times, and identify which images are related to
   the most data usage. In addition, look for usage trends, such as the
   following:
@z

@x
   - Inefficient pull behavior: Identify frequently accessed repositories to
     assess whether you can optimize caching practices or consolidate usage to
     reduce pulls.
   - Inefficient automated systems: Check which automated tools, such as CI/CD
     pipelines, may be causing higher pull rates, and configure them to avoid
     unnecessary image pulls.
@y
   - Inefficient pull behavior: Identify frequently accessed repositories to
     assess whether you can optimize caching practices or consolidate usage to
     reduce pulls.
   - Inefficient automated systems: Check which automated tools, such as CI/CD
     pipelines, may be causing higher pull rates, and configure them to avoid
     unnecessary image pulls.
@z

@x
3. Optimize image pulls by:
@y
3. Optimize image pulls by:
@z

@x
   - Use caching: Implement local image caching via
     [mirroring](/docker-hub/mirror/) or within your CI/CD pipelines to reduce
     redundant pulls.
   - Automate manual workflows: Avoid unnecessary pulls by configuring automated
     systems to pull only when a new version of an image is available.
@y
   - Use caching: Implement local image caching via
     [mirroring](__SUBDIR__/docker-hub/mirror/) or within your CI/CD pipelines to reduce
     redundant pulls.
   - Automate manual workflows: Avoid unnecessary pulls by configuring automated
     systems to pull only when a new version of an image is available.
@z

@x
4. Optimize your storage by:
@y
4. Optimize your storage by:
@z

@x
    - Regularly audit and remove repositories with untagged, unused, or outdated images.
    - Look for private repositories in Hub storage that exceed your plan's limits.
@y
    - Regularly audit and remove repositories with untagged, unused, or outdated images.
    - Look for private repositories in Hub storage that exceed your plan's limits.
@z

@x
5. Increase your limits by upgrading or purchasing additional consumption. For
   details, see [Scale your subscription](../subscription/scale.md).
@y
5. Increase your limits by upgrading or purchasing additional consumption. For
   details, see [Scale your subscription](../subscription/scale.md).
@z

@x
6. For organizations, monitor and enforce organizational policies by doing the
   following:
@y
6. For organizations, monitor and enforce organizational policies by doing the
   following:
@z

@x
   - Routinely [view Docker Hub usage](#view-docker-hub-usage) to monitor usage.
   - [Enforce sign-in](/security/for-admins/enforce-sign-in/) to ensure that you
     can monitor the usage of your users and users receive higher usage limits.
   - Look for duplicate user accounts in Docker and remove accounts from your organization
   as needed.
@y
   - Routinely [view Docker Hub usage](#view-docker-hub-usage) to monitor usage.
   - [Enforce sign-in](__SUBDIR__/security/for-admins/enforce-sign-in/) to ensure that you
     can monitor the usage of your users and users receive higher usage limits.
   - Look for duplicate user accounts in Docker and remove accounts from your organization
   as needed.
@z

@x
## Storage and repository limits
@y
## Storage and repository limits
@z

@x
{{< include "hub-limits.md" >}}
@y
{{< include "hub-limits.md" >}}
@z

@x
The following storage and repository limits apply based on your subscription, subject to fair use:
@y
The following storage and repository limits apply based on your subscription, subject to fair use:
@z

@x
| Plan     | Public repositories | Public repository storage | Private repositories       | Private repository storage |
|----------|---------------------|---------------------------|----------------------------|----------------------------|
| Personal | Unlimited           | Unlimited                 | Up to 1 private repository | Up to 2 GB                 |
| Pro      | Unlimited           | Unlimited                 | Unlimited                  | Up to 5 GB                 |
| Team     | Unlimited           | Unlimited                 | Unlimited                  | Up to 50 GB                |
| Business | Unlimited           | Unlimited                 | Unlimited                  | Up to 500 GB               |
@y
| Plan     | Public repositories | Public repository storage | Private repositories       | Private repository storage |
|----------|---------------------|---------------------------|----------------------------|----------------------------|
| Personal | Unlimited           | Unlimited                 | Up to 1 private repository | Up to 2 GB                 |
| Pro      | Unlimited           | Unlimited                 | Unlimited                  | Up to 5 GB                 |
| Team     | Unlimited           | Unlimited                 | Unlimited                  | Up to 50 GB                |
| Business | Unlimited           | Unlimited                 | Unlimited                  | Up to 500 GB               |
@z

@x
Private repository storage is calculated on a monthly basis based on the average
storage used throughout the month per organization. Docker measures your storage
usage in the amount of Bytes stored per hour, which are accumulated throughout
the month to determine your monthly storage. If a repository is private at any
point within an hour, it is counted as private for the full hour. The total
hours are calculated based on the actual number of days in the month. Any
storage usage beyond the included amounts in each paid subscription tier will be
charged at an on-demand rate. You can [scale your
limit](../subscription/scale.md) or [upgrade](../subscription/change.md) to get
a higher limit.
@y
Private repository storage is calculated on a monthly basis based on the average
storage used throughout the month per organization. Docker measures your storage
usage in the amount of Bytes stored per hour, which are accumulated throughout
the month to determine your monthly storage. If a repository is private at any
point within an hour, it is counted as private for the full hour. The total
hours are calculated based on the actual number of days in the month. Any
storage usage beyond the included amounts in each paid subscription tier will be
charged at an on-demand rate. You can [scale your
limit](../subscription/scale.md) or [upgrade](../subscription/change.md) to get
a higher limit.
@z

@x
For more information on how Docker Hub storage pricing is calculated, see the [Docker Hub storage pricing](/manuals/billing/docker-hub-pricing.md) guide.
@y
For more information on how Docker Hub storage pricing is calculated, see the [Docker Hub storage pricing](manuals/billing/docker-hub-pricing.md) guide.
@z

@x
## Pull limit and rate limit
@y
## Pull limit and rate limit
@z

@x
A pull is defined as the following:
@y
A pull is defined as the following:
@z

@x
 - A Docker pull includes both a version check and any download that
   occurs as a result of the pull. Depending on the client, a `docker pull` can
   verify the existence of an image or tag without downloading it by performing
   a version check.
 - Version checks do not count towards usage pricing.
 - A pull for a normal image makes one pull for a [single
   manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md).
 - A pull for a multi-arch image will count as one pull for each
   different architecture.
@y
 - A Docker pull includes both a version check and any download that
   occurs as a result of the pull. Depending on the client, a `docker pull` can
   verify the existence of an image or tag without downloading it by performing
   a version check.
 - Version checks do not count towards usage pricing.
 - A pull for a normal image makes one pull for a [single
   manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md).
 - A pull for a multi-arch image will count as one pull for each
   different architecture.
@z

@x
### Pull attribution
@y
### Pull attribution
@z

@x
Pulls can be attributed to either a personal or organization [namespace](https://docs.docker.com/contribute/style/terminology/#namespace).
@y
Pulls can be attributed to either a personal or organization [namespace](https://docs.docker.com/contribute/style/terminology/#namespace).
@z

@x
#### Private pulls
@y
#### Private pulls
@z

@x
Pulls for private repositories are attributed to the repository's namespace owner.
@y
Pulls for private repositories are attributed to the repository's namespace owner.
@z

@x
#### Public pulls
@y
#### Public pulls
@z

@x
When pulling images from a public repository, attribution is determined based on domain affiliation and organization membership.
@y
When pulling images from a public repository, attribution is determined based on domain affiliation and organization membership.
@z

@x
#### Verified domain ownership
@y
#### Verified domain ownership
@z

@x
When pulling an image from an account linked to a verified domain, the attribution is set to be the owner of that [domain](https://docs.docker.com/security/faqs/single-sign-on/domain-faqs/)
@y
When pulling an image from an account linked to a verified domain, the attribution is set to be the owner of that [domain](https://docs.docker.com/security/faqs/single-sign-on/domain-faqs/)
@z

@x
#### Single organization membership
@y
#### Single organization membership
@z

@x
- If the owner of the verified domain is a company and the user is part of only one organization within that [company](https://docs.docker.com/admin/faqs/company-faqs/#what-features-are-supported-at-the-company-level), the pull is attributed to that specific organization.
- If the user is part of only one organization, the pull is attributed to that specific organization.
@y
- If the owner of the verified domain is a company and the user is part of only one organization within that [company](https://docs.docker.com/admin/faqs/company-faqs/#what-features-are-supported-at-the-company-level), the pull is attributed to that specific organization.
- If the user is part of only one organization, the pull is attributed to that specific organization.
@z

@x
#### Multiple organization memberships
@y
#### Multiple organization memberships
@z

@x
If the user is part of multiple organizations under the company, the pull is attributed to the user's personal namespace.
@y
If the user is part of multiple organizations under the company, the pull is attributed to the user's personal namespace.
@z

@x
### Pull limit
@y
### Pull limit
@z

@x
Rate limits apply to pull usage. A user's rate limit is equal to the highest entitlement of their personal account or any organization they belong to. To take advantage of this, you must sign in to [Docker Hub](https://hub.docker.com/) as an authenticated user. For
more information, see [How do I authenticate pull
requests](#how-do-i-authenticate-pulls). Unauthenticated (anonymous)
users will have the limits enforced via IP.
@y
Rate limits apply to pull usage. A user's rate limit is equal to the highest entitlement of their personal account or any organization they belong to. To take advantage of this, you must sign in to [Docker Hub](https://hub.docker.com/) as an authenticated user. For
more information, see [How do I authenticate pull
requests](#how-do-i-authenticate-pulls). Unauthenticated (anonymous)
users will have the limits enforced via IP.
@z

@x
Pull limit refers to the total number of image pulls allowed within a specific time frame. For example, a Business plan has a total pull limit of 1M pulls per month.
@y
Pull limit refers to the total number of image pulls allowed within a specific time frame. For example, a Business plan has a total pull limit of 1M pulls per month.
@z

@x
The pull limit is calculated on a per month basis and only applies to
Docker Pro, Docker Team, and Docker Business users. The limit automatically
scales on-demand, but on-demand rates do apply. You can [scale your
limit](../subscription/scale.md) or [upgrade](../subscription/change.md) to get
a higher limit.
@y
The pull limit is calculated on a per month basis and only applies to
Docker Pro, Docker Team, and Docker Business users. The limit automatically
scales on-demand, but on-demand rates do apply. You can [scale your
limit](../subscription/scale.md) or [upgrade](../subscription/change.md) to get
a higher limit.
@z

@x
| User type                | Pull count per month |
|--------------------------|----------------------|
| Business (authenticated) | 1M                   |
| Team (authenticated)     | 100K                 |
| Pro (authenticated)      | 25K                  |
| Personal (authenticated) | Not applicable       |
| Unauthenticated users    | Not applicable       |
@y
| User type                | Pull count per month |
|--------------------------|----------------------|
| Business (authenticated) | 1M                   |
| Team (authenticated)     | 100K                 |
| Pro (authenticated)      | 25K                  |
| Personal (authenticated) | Not applicable       |
| Unauthenticated users    | Not applicable       |
@z

@x
### Pull rate limit
@y
### Pull rate limit
@z

@x
Pull rate limit refers to the frequency of image pulls per unit of time, specifying how quickly you can pull images within a specific time.
@y
Pull rate limit refers to the frequency of image pulls per unit of time, specifying how quickly you can pull images within a specific time.
@z

@x
The pull rate limit is calculated on a per hour basis. There is no
pull rate limit for users or automated systems with a paid subscription.
Unauthenticated and Docker Personal users using Docker Hub will experience rate
limits on image pulls.
@y
The pull rate limit is calculated on a per hour basis. There is no
pull rate limit for users or automated systems with a paid subscription.
Unauthenticated and Docker Personal users using Docker Hub will experience rate
limits on image pulls.
@z

@x
The following table describes the pull rate limit per hour
for each subscription tier, subject to fair use:
@y
The following table describes the pull rate limit per hour
for each subscription tier, subject to fair use:
@z

@x
| User type                | Pull rate limit per hour |
|--------------------------|--------------------------|
| Business (authenticated) | No limit                 |
| Team (authenticated)     | No limit                 |
| Pro (authenticated)      | No limit                 |
| Personal (authenticated) | 40                       |
| Unauthenticated users    | 10 per IP address        |
@y
| User type                | Pull rate limit per hour |
|--------------------------|--------------------------|
| Business (authenticated) | No limit                 |
| Team (authenticated)     | No limit                 |
| Pro (authenticated)      | No limit                 |
| Personal (authenticated) | 40                       |
| Unauthenticated users    | 10 per IP address        |
@z

@x
> [!TIP]
>
> Always sign in to Docker. Authenticated Docker Personal users receive
> increased rate limits, while authenticated Docker Pro, Team, and Business
> users are not rate limited. For more information, see [How do I authenticate
> pulls](#how-do-i-authenticate-pulls).
@y
> [!TIP]
>
> Always sign in to Docker. Authenticated Docker Personal users receive
> increased rate limits, while authenticated Docker Pro, Team, and Business
> users are not rate limited. For more information, see [How do I authenticate
> pulls](#how-do-i-authenticate-pulls).
@z

@x
#### How do I know my pulls are being limited?
@y
#### How do I know my pulls are being limited?
@z

@x
When you issue a pull and you are over the limit, Docker Hub returns a
`429` response code with the following body when the manifest is requested:
@y
When you issue a pull and you are over the limit, Docker Hub returns a
`429` response code with the following body when the manifest is requested:
@z

@x
```text
You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits
```
@y
```text
You have reached your pull rate limit. You may increase the limit by authenticating and upgrading: https://www.docker.com/increase-rate-limits
```
@z

@x
This error message appears in the Docker CLI or in the Docker Engine logs.
@y
This error message appears in the Docker CLI or in the Docker Engine logs.
@z

@x
#### How can I check my current rate?
@y
#### How can I check my current rate?
@z

@x
Valid API requests to Hub usually include the following rate limit headers in
the response:
@y
Valid API requests to Hub usually include the following rate limit headers in
the response:
@z

@x
```text
ratelimit-limit
ratelimit-remaining
docker-ratelimit-source
```
@y
```text
ratelimit-limit
ratelimit-remaining
docker-ratelimit-source
```
@z

@x
These headers are returned on both GET and HEAD requests.
@y
These headers are returned on both GET and HEAD requests.
@z

@x
> [!NOTE]
>
> Using GET emulates a real pull and counts towards the limit. Using HEAD won't.
> To check your limits, you need `curl`, `grep`, and `jq` installed.
@y
> [!NOTE]
>
> Using GET emulates a real pull and counts towards the limit. Using HEAD won't.
> To check your limits, you need `curl`, `grep`, and `jq` installed.
@z

@x
To get a token anonymously, if you are pulling anonymously:
@y
To get a token anonymously, if you are pulling anonymously:
@z

@x
```console
$ TOKEN=$(curl "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@y
```console
$ TOKEN=$(curl "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@z

@x
To get a token with a user account, if you are authenticated (insert your
username and password in the following command):
@y
To get a token with a user account, if you are authenticated (insert your
username and password in the following command):
@z

@x
```console
$ TOKEN=$(curl --user 'username:password' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@y
```console
$ TOKEN=$(curl --user 'username:password' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
```
@z

@x
Then to get the headers showing your limits, run the following:
@y
Then to get the headers showing your limits, run the following:
@z

@x
```console
$ curl --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest
```
@y
```console
$ curl --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest
```
@z

@x
Which should return the following headers:
@y
Which should return the following headers:
@z

@x
```http
ratelimit-limit: 100;w=21600
ratelimit-remaining: 76;w=21600
docker-ratelimit-source: 192.0.2.1
```
@y
```http
ratelimit-limit: 100;w=21600
ratelimit-remaining: 76;w=21600
docker-ratelimit-source: 192.0.2.1
```
@z

@x
In the previous example, the pull limit is 100 pulls per 21600 seconds (6
hours), and there are 76 pulls remaining.
@y
In the previous example, the pull limit is 100 pulls per 21600 seconds (6
hours), and there are 76 pulls remaining.
@z

@x
If you don't see any RateLimit header, it could be because the image or your IP
is unlimited in partnership with a publisher, provider, or an open source
organization. It could also mean that the user you are pulling as is part of a
paid Docker plan. Pulling that image won’t count toward pull rate limits if you
don't see these headers. Note that users with a paid subscription have a monthly
pull limit that can be viewed in the Docker Hub [usage dashboard](#view-docker-hub-usage).
@y
If you don't see any RateLimit header, it could be because the image or your IP
is unlimited in partnership with a publisher, provider, or an open source
organization. It could also mean that the user you are pulling as is part of a
paid Docker plan. Pulling that image won’t count toward pull rate limits if you
don't see these headers. Note that users with a paid subscription have a monthly
pull limit that can be viewed in the Docker Hub [usage dashboard](#view-docker-hub-usage).
@z

@x
#### I'm being limited to a lower rate even though I have a paid Docker subscription
@y
#### I'm being limited to a lower rate even though I have a paid Docker subscription
@z

@x
To take advantage of the unlimited limits included in a paid Docker subscription,
you must [authenticate pulls](#how-do-i-authenticate-pulls) with your
user account.
@y
To take advantage of the unlimited limits included in a paid Docker subscription,
you must [authenticate pulls](#how-do-i-authenticate-pulls) with your
user account.
@z

@x
A Pro, Team, or a Business tier doesn't increase limits on your images for other
users. See Docker's [Open
Source](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/),
[Publisher](https://www.docker.com/partners/programs), or [Large
Organization](https://www.docker.com/pricing) offerings.
@y
A Pro, Team, or a Business tier doesn't increase limits on your images for other
users. See Docker's [Open
Source](https://www.docker.com/blog/expanded-support-for-open-source-software-projects/),
[Publisher](https://www.docker.com/partners/programs), or [Large
Organization](https://www.docker.com/pricing) offerings.
@z

@x
#### Other limits
@y
#### Other limits
@z

@x
Docker Hub also has an abuse rate limit to protect the application and
infrastructure. This limit applies to all requests to Hub properties including
web pages, APIs, and image pulls. The limit is applied per-IP, and while the
limit changes over time depending on load and other factors, it's in the order
of thousands of requests per minute. The abuse limit applies to all users
equally regardless of account level.
@y
Docker Hub also has an abuse rate limit to protect the application and
infrastructure. This limit applies to all requests to Hub properties including
web pages, APIs, and image pulls. The limit is applied per-IP, and while the
limit changes over time depending on load and other factors, it's in the order
of thousands of requests per minute. The abuse limit applies to all users
equally regardless of account level.
@z

@x
You can differentiate between these limits by looking at the error code. The
"abuse limit" returns a simple `429 Too Many Requests` response. The pull
limit returns a longer error message that includes a link to this page.
@y
You can differentiate between these limits by looking at the error code. The
"abuse limit" returns a simple `429 Too Many Requests` response. The pull
limit returns a longer error message that includes a link to this page.
@z

@x
### How do I authenticate pulls?
@y
### How do I authenticate pulls?
@z

@x
The following section contains information on how to sign in to Docker Hub to
authenticate pulls.
@y
The following section contains information on how to sign in to Docker Hub to
authenticate pulls.
@z

@x
#### Docker Desktop
@y
#### Docker Desktop
@z

@x
If you are using Docker Desktop, you can sign in to Docker Hub from the Docker
Desktop menu.
@y
If you are using Docker Desktop, you can sign in to Docker Hub from the Docker
Desktop menu.
@z

@x
Select **Sign in / Create Docker ID** from the Docker Desktop menu and follow
the on-screen instructions to complete the sign-in process.
@y
Select **Sign in / Create Docker ID** from the Docker Desktop menu and follow
the on-screen instructions to complete the sign-in process.
@z

@x
#### Docker Engine
@y
#### Docker Engine
@z

@x
If you're using a standalone version of Docker Engine, run the `docker login`
command from a terminal to authenticate with Docker Hub. For information on how
to use the command, see [docker login](/reference/cli/docker/login.md).
@y
If you're using a standalone version of Docker Engine, run the `docker login`
command from a terminal to authenticate with Docker Hub. For information on how
to use the command, see [docker login](reference/cli/docker/login.md).
@z

@x
#### Docker Swarm
@y
#### Docker Swarm
@z

@x
If you're running Docker Swarm, you must use the `--with-registry-auth` flag to
authenticate with Docker Hub. For more information, see [Create a
service](/reference/cli/docker/service/create.md#with-registry-auth). If you
are using a Docker Compose file to deploy an application stack, see [docker
stack deploy](/reference/cli/docker/stack/deploy.md).
@y
If you're running Docker Swarm, you must use the `--with-registry-auth` flag to
authenticate with Docker Hub. For more information, see [Create a
service](reference/cli/docker/service/create.md#with-registry-auth). If you
are using a Docker Compose file to deploy an application stack, see [docker
stack deploy](reference/cli/docker/stack/deploy.md).
@z

@x
#### GitHub Actions
@y
#### GitHub Actions
@z

@x
If you're using GitHub Actions to build and push Docker images to Docker Hub,
see [login action](https://github.com/docker/login-action#dockerhub). If you are
using another Action, you must add your username and access token in a similar
way for authentication.
@y
If you're using GitHub Actions to build and push Docker images to Docker Hub,
see [login action](https://github.com/docker/login-action#dockerhub). If you are
using another Action, you must add your username and access token in a similar
way for authentication.
@z

@x
#### Kubernetes
@y
#### Kubernetes
@z

@x
If you're running Kubernetes, follow the instructions in [Pull an Image from a
Private
Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)
for information on authentication.
@y
If you're running Kubernetes, follow the instructions in [Pull an Image from a
Private
Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)
for information on authentication.
@z

@x
#### Third-party platforms
@y
#### Third-party platforms
@z

@x
If you're using any third-party platforms, follow your provider’s instructions on using registry authentication.
@y
If you're using any third-party platforms, follow your provider’s instructions on using registry authentication.
@z

@x
- [Artifactory](https://www.jfrog.com/confluence/display/JFROG/Advanced+Settings#AdvancedSettings-RemoteCredentials)
- [AWS CodeBuild](https://aws.amazon.com/blogs/devops/how-to-use-docker-images-from-a-private-registry-in-aws-codebuild-for-your-build-environment/)
- [AWS ECS/Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html)
- [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#sep-docreg)
- [Chipper CI](https://docs.chipperci.com/builds/docker/#rate-limit-auth)
- [CircleCI](https://circleci.com/docs/2.0/private-images/)
- [Codefresh](https://codefresh.io/docs/docs/docker-registries/external-docker-registries/docker-hub/)
- [Drone.io](https://docs.drone.io/pipeline/docker/syntax/images/#pulling-private-images)
- [GitLab](https://docs.gitlab.com/ee/user/packages/container_registry/#authenticate-with-the-container-registry)
- [LayerCI](https://layerci.com/docs/advanced-workflows#logging-in-to-docker)
- [TeamCity](https://www.jetbrains.com/help/teamcity/integrating-teamcity-with-docker.html#Conforming+with+Docker+download+rate+limits)
@y
- [Artifactory](https://www.jfrog.com/confluence/display/JFROG/Advanced+Settings#AdvancedSettings-RemoteCredentials)
- [AWS CodeBuild](https://aws.amazon.com/blogs/devops/how-to-use-docker-images-from-a-private-registry-in-aws-codebuild-for-your-build-environment/)
- [AWS ECS/Fargate](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html)
- [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#sep-docreg)
- [Chipper CI](https://docs.chipperci.com/builds/docker/#rate-limit-auth)
- [CircleCI](https://circleci.com/docs/2.0/private-images/)
- [Codefresh](https://codefresh.io/docs/docs/docker-registries/external-docker-registries/docker-hub/)
- [Drone.io](https://docs.drone.io/pipeline/docker/syntax/images/#pulling-private-images)
- [GitLab](https://docs.gitlab.com/ee/user/packages/container_registry/#authenticate-with-the-container-registry)
- [LayerCI](https://layerci.com/docs/advanced-workflows#logging-in-to-docker)
- [TeamCity](https://www.jetbrains.com/help/teamcity/integrating-teamcity-with-docker.html#Conforming+with+Docker+download+rate+limits)
@z
