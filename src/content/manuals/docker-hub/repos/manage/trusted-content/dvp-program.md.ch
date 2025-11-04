%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Learn what the Docker Verified Publisher Program is and how it works
title: Docker Verified Publisher Program
@y
description: Learn what the Docker Verified Publisher Program is and how it works
title: Docker Verified Publisher Program
@z

@x
[The Docker Verified Publisher
Program](https://hub.docker.com/search?badges=verified_publisher) provides
high-quality images from commercial publishers verified by Docker.
@y
[The Docker Verified Publisher
Program](https://hub.docker.com/search?badges=verified_publisher) provides
high-quality images from commercial publishers verified by Docker.
@z

@x
These images help development teams build secure software supply chains,
minimizing exposure to malicious content early in the process to save time and
money later.
@y
These images help development teams build secure software supply chains,
minimizing exposure to malicious content early in the process to save time and
money later.
@z

@x
## Who's eligible to become a verified publisher?
@y
## Who's eligible to become a verified publisher?
@z

@x
Any independent software vendor who distributes software on Docker Hub can join
the Verified Publisher Program. Find out more by heading to the [Docker Verified
Publisher Program](https://www.docker.com/partners/programs) page.
@y
Any independent software vendor who distributes software on Docker Hub can join
the Verified Publisher Program. Find out more by heading to the [Docker Verified
Publisher Program](https://www.docker.com/partners/programs) page.
@z

@x
> [!NOTE]
>
> DVP entitlements are applied per namespace (organization). If you operate
> multiple Docker Hub namespaces, each requires a separate DVP application and
> verification process.
@y
> [!NOTE]
>
> DVP entitlements are applied per namespace (organization). If you operate
> multiple Docker Hub namespaces, each requires a separate DVP application and
> verification process.
@z

@x
## Program benefits
@y
## Program benefits
@z

@x
The Docker Verified Publisher Program (DVP) provides several features and
benefits to Docker Hub publishers. The program grants the following perks based
on participation tier:
@y
The Docker Verified Publisher Program (DVP) provides several features and
benefits to Docker Hub publishers. The program grants the following perks based
on participation tier:
@z

@x
- [Enterprise-grade infrastructure](#enterprise-grade-infrastructure): High
  availability hosting with 99.9% uptime
- [Verified publisher badge](#verified-publisher-badge): Special badge
  identifying high-quality commercial publishers
- [Repository logo](#repository-logo): Upload custom logos for individual
  repositories
- [Insights and analytics](#insights-and-analytics): Detailed usage metrics and
  community engagement data
- [Vulnerability analysis](#vulnerability-analysis): Automated security scanning
  with Docker Scout
- [Priority search ranking](#priority-search-ranking): Enhanced discoverability
  in Docker Hub search results
- [Removal of rate limiting](#removal-of-rate-limiting): Unrestricted pulls for
  development teams
- [Co-marketing opportunities](#co-marketing-opportunities): Joint promotional
  activities with Docker
@y
- [Enterprise-grade infrastructure](#enterprise-grade-infrastructure): High
  availability hosting with 99.9% uptime
- [Verified publisher badge](#verified-publisher-badge): Special badge
  identifying high-quality commercial publishers
- [Repository logo](#repository-logo): Upload custom logos for individual
  repositories
- [Insights and analytics](#insights-and-analytics): Detailed usage metrics and
  community engagement data
- [Vulnerability analysis](#vulnerability-analysis): Automated security scanning
  with Docker Scout
- [Priority search ranking](#priority-search-ranking): Enhanced discoverability
  in Docker Hub search results
- [Removal of rate limiting](#removal-of-rate-limiting): Unrestricted pulls for
  development teams
- [Co-marketing opportunities](#co-marketing-opportunities): Joint promotional
  activities with Docker
@z

@x
### Enterprise-grade infrastructure
@y
### Enterprise-grade infrastructure
@z

@x
The Docker Verified Publisher Program runs on Docker Hub's enterprise-scale
infrastructure, serving millions of developers globally. Your published content
benefits from:
@y
The Docker Verified Publisher Program runs on Docker Hub's enterprise-scale
infrastructure, serving millions of developers globally. Your published content
benefits from:
@z

@x
- High availability and uptime: Docker's systems are designed for failover
  across multiple availability zones, with load-balanced autoscaling, enabling
  99.9% uptime.
- Global delivery and fast downloads: Docker leverages Cloudflare's CDN and
  caching (with Cache Reserve) to achieve cache hit ratios more than 99%,
  reducing reliance on origin traffic and ensuring fast access for developers
  everywhere.
- Durability: Docker maintains a documented backup policy and performs full
  daily backups of production data.
@y
- High availability and uptime: Docker's systems are designed for failover
  across multiple availability zones, with load-balanced autoscaling, enabling
  99.9% uptime.
- Global delivery and fast downloads: Docker leverages Cloudflare's CDN and
  caching (with Cache Reserve) to achieve cache hit ratios more than 99%,
  reducing reliance on origin traffic and ensuring fast access for developers
  everywhere.
- Durability: Docker maintains a documented backup policy and performs full
  daily backups of production data.
@z

@x
You simply push your images to Docker Hub as usual, and Docker takes care of the
rest, serving your image to millions of developers worldwide.
@y
You simply push your images to Docker Hub as usual, and Docker takes care of the
rest, serving your image to millions of developers worldwide.
@z

@x
![DVP flow in Docker Hub](./images/dvp-hub-flow.svg)
@y
![DVP flow in Docker Hub](./images/dvp-hub-flow.svg)
@z

@x
To learn more, see [Availability at
Docker](https://www.docker.com/trust/availability/).
@y
To learn more, see [Availability at
Docker](https://www.docker.com/trust/availability/).
@z

@x
### Verified publisher badge
@y
### Verified publisher badge
@z

@x
Images that are part of this program have a special badge on Docker Hub making
it easier for users to identify projects that Docker has verified as
high-quality commercial publishers.
@y
Images that are part of this program have a special badge on Docker Hub making
it easier for users to identify projects that Docker has verified as
high-quality commercial publishers.
@z

@x
![Docker-Sponsored Open Source
badge](../../../images/verified-publisher-badge.png)
@y
![Docker-Sponsored Open Source
badge](../../../images/verified-publisher-badge.png)
@z

@x
### Repository logo
@y
### Repository logo
@z

@x
DVP organizations can upload custom images for individual repositories on Docker
Hub. This lets you override the default organization-level logo on a
per-repository basis.
@y
DVP organizations can upload custom images for individual repositories on Docker
Hub. This lets you override the default organization-level logo on a
per-repository basis.
@z

@x
To manage the repository logo, see [Manage repository logo](#manage-repository-logo).
@y
To manage the repository logo, see [Manage repository logo](#manage-repository-logo).
@z

@x
### Vulnerability analysis
@y
### Vulnerability analysis
@z

@x
[Docker Scout](/scout/) provides automatic vulnerability analysis
for DVP images published to Docker Hub.
Scanning images ensures that the published content is secure, and proves to
developers that they can trust the image.
@y
[Docker Scout](__SUBDIR__/scout/) provides automatic vulnerability analysis
for DVP images published to Docker Hub.
Scanning images ensures that the published content is secure, and proves to
developers that they can trust the image.
@z

@x
You can enable analysis on a per-repository basis. For more about using this
feature, see [Basic vulnerability
scanning](/docker-hub/repos/manage/vulnerability-scanning/).
@y
You can enable analysis on a per-repository basis. For more about using this
feature, see [Basic vulnerability
scanning](__SUBDIR__/docker-hub/repos/manage/vulnerability-scanning/).
@z

@x
### Priority search ranking
@y
### Priority search ranking
@z

@x
Verified publisher images receive enhanced visibility in Docker Hub search
results, making it easier for developers to discover your content. This improved
discoverability helps drive adoption of your images within the developer
community.
@y
Verified publisher images receive enhanced visibility in Docker Hub search
results, making it easier for developers to discover your content. This improved
discoverability helps drive adoption of your images within the developer
community.
@z

@x
### Removal of rate limiting
@y
### Removal of rate limiting
@z

@x
Verified publisher images are exempt from standard [Docker Hub rate
limits](../../../usage/_index.md), ensuring developers can pull your images
without restrictions. **This applies to all users, including unauthenticated users**,
who get unlimited pulls for DVP images. This eliminates potential barriers to adoption and
provides a seamless experience for users of your content.
@y
Verified publisher images are exempt from standard [Docker Hub rate
limits](../../../usage/_index.md), ensuring developers can pull your images
without restrictions. **This applies to all users, including unauthenticated users**,
who get unlimited pulls for DVP images. This eliminates potential barriers to adoption and
provides a seamless experience for users of your content.
@z

@x
DVP partners can verify this unlimited access by checking the absence of rate
limiting headers when pulling their images. When pulling DVP images, users won't
see `ratelimit-limit` or `ratelimit-remaining` headers, indicating unlimited
access. For more details on checking rate limits, see [View pull rate and
limit](../../../usage/pulls.md#view-pull-rate-and-limit).
@y
DVP partners can verify this unlimited access by checking the absence of rate
limiting headers when pulling their images. When pulling DVP images, users won't
see `ratelimit-limit` or `ratelimit-remaining` headers, indicating unlimited
access. For more details on checking rate limits, see [View pull rate and
limit](../../../usage/pulls.md#view-pull-rate-and-limit).
@z

@x
### Co-marketing opportunities
@y
### Co-marketing opportunities
@z

@x
Docker collaborates with verified publishers on joint marketing initiatives,
including blog posts, case studies, webinars, and conference presentations.
These opportunities help amplify your brand visibility within the Docker
ecosystem.
@y
Docker collaborates with verified publishers on joint marketing initiatives,
including blog posts, case studies, webinars, and conference presentations.
These opportunities help amplify your brand visibility within the Docker
ecosystem.
@z

@x
### Insights and analytics
@y
### Insights and analytics
@z

@x
The insights and analytics service provides usage metrics for how
the community uses Docker images, granting insight into user behavior.
@y
The insights and analytics service provides usage metrics for how
the community uses Docker images, granting insight into user behavior.
@z

@x
There is both a [web interface](./insights-analytics.md) and an
[API](/reference/api/dvp/latest/) for accessing the analytics data.
@y
There is both a [web interface](./insights-analytics.md) and an
[API](__SUBDIR__/reference/api/dvp/latest/) for accessing the analytics data.
@z

@x
The usage metrics show the number of image pulls by tag or by digest,
geolocation, cloud provider, client, and more.
@y
The usage metrics show the number of image pulls by tag or by digest,
geolocation, cloud provider, client, and more.
@z

@x
## Manage repository logo
@y
## Manage repository logo
@z

@x
After joining the Docker Verified Publisher Program, you can set a custom logo
for each repository in your organization. The following requirements apply:
@y
After joining the Docker Verified Publisher Program, you can set a custom logo
for each repository in your organization. The following requirements apply:
@z

@x
- The supported filetypes for the logo image are JPEG and PNG.
- The minimum allowed image size in pixels is 120×120.
- The maximum allowed image size in pixels is 1000×1000.
- The maximum allowed image file size is 5MB.
@y
- The supported filetypes for the logo image are JPEG and PNG.
- The minimum allowed image size in pixels is 120×120.
- The maximum allowed image size in pixels is 1000×1000.
- The maximum allowed image file size is 5MB.
@z

@x
Only a user with an owner or editor role for the organization can change the repository logo.
@y
Only a user with an owner or editor role for the organization can change the repository logo.
@z

@x
### Set the repository logo
@y
### Set the repository logo
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Go to the page of the repository that you want to change the logo for.
3. Select the upload logo button, represented by a camera icon ({{< inline-image
   src="../../../images/upload_logo_sm.png" alt="camera icon" >}}) overlaying the
current repository logo.
4. In the dialog that opens, select the PNG image that you want to upload to
   set it as the logo for the repository.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Go to the page of the repository that you want to change the logo for.
3. Select the upload logo button, represented by a camera icon ({{< inline-image
   src="../../../images/upload_logo_sm.png" alt="camera icon" >}}) overlaying the
current repository logo.
4. In the dialog that opens, select the PNG image that you want to upload to
   set it as the logo for the repository.
@z

@x
### Remove the logo
@y
### Remove the logo
@z

@x
Select the **Clear** button ({{< inline-image src="../../../images/clear_logo_sm.png"
alt="clear button" >}}) to remove a logo.
@y
Select the **Clear** button ({{< inline-image src="../../../images/clear_logo_sm.png"
alt="clear button" >}}) to remove a logo.
@z

@x
Removing the logo makes the repository default to using the organization logo,
if set, or the following default logo if not.
@y
Removing the logo makes the repository default to using the organization logo,
if set, or the following default logo if not.
@z

@x
![Default logo which is a 3D grey cube](../../../images/default_logo_sm.png)
@y
![Default logo which is a 3D grey cube](../../../images/default_logo_sm.png)
@z
