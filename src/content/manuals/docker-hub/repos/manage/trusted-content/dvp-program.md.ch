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
[The Docker Verified Publisher Program](https://hub.docker.com/search?q=&image_filter=store) provides high-quality images from commercial publishers verified by Docker.
@y
[The Docker Verified Publisher Program](https://hub.docker.com/search?q=&image_filter=store) provides high-quality images from commercial publishers verified by Docker.
@z

@x
These images help development teams build secure software supply chains, minimizing exposure to malicious content early in the process to save time and money later.
@y
These images help development teams build secure software supply chains, minimizing exposure to malicious content early in the process to save time and money later.
@z

@x
Images that are part of this program have a special badge on Docker Hub making it easier for users to identify projects that Docker has verified as high-quality commercial publishers.
@y
Images that are part of this program have a special badge on Docker Hub making it easier for users to identify projects that Docker has verified as high-quality commercial publishers.
@z

@x
![Docker-Sponsored Open Source badge](../../../images/verified-publisher-badge-iso.png)
@y
![Docker-Sponsored Open Source badge](../../../images/verified-publisher-badge-iso.png)
@z

@x
The Docker Verified Publisher Program (DVP) provides several features and benefits to Docker
Hub publishers. The program grants the following perks based on participation tier:
@y
The Docker Verified Publisher Program (DVP) provides several features and benefits to Docker
Hub publishers. The program grants the following perks based on participation tier:
@z

@x
- Repository logo
- Verified publisher badge
- Priority search ranking in Docker Hub
- Insights and analytics
- Vulnerability analysis
- Additional Docker Business seats
- Removal of rate limiting for developers
- Co-marketing opportunities
@y
- Repository logo
- Verified publisher badge
- Priority search ranking in Docker Hub
- Insights and analytics
- Vulnerability analysis
- Additional Docker Business seats
- Removal of rate limiting for developers
- Co-marketing opportunities
@z

@x
### Repository logo
@y
### Repository logo
@z

@x
DVP organizations can upload custom images for individual repositories on Docker Hub.
This lets you override the default organization-level logo on a per-repository basis.
@y
DVP organizations can upload custom images for individual repositories on Docker Hub.
This lets you override the default organization-level logo on a per-repository basis.
@z

@x
Only a user with administrative access (owner or team member with administrator permission)
over the repository can change the repository logo.
@y
Only a user with administrative access (owner or team member with administrator permission)
over the repository can change the repository logo.
@z

@x
#### Image requirements
@y
#### Image requirements
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
#### Set the repository logo
@y
#### Set the repository logo
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
#### Remove the logo
@y
#### Remove the logo
@z

@x
Select the **Clear** button ({{< inline-image src="../../../images/clear_logo_sm.png"
alt="clear button" >}}) to remove a logo.
@y
Select the **Clear** button ({{< inline-image src="../../../images/clear_logo_sm.png"
alt="clear button" >}}) to remove a logo.
@z

@x
Removing the logo makes the repository default to using the organization logo, if set, or the following default logo if not.
@y
Removing the logo makes the repository default to using the organization logo, if set, or the following default logo if not.
@z

@x
![Default logo which is a 3D grey cube](../../../images/default_logo_sm.png)
@y
![Default logo which is a 3D grey cube](../../../images/default_logo_sm.png)
@z

@x
### Verified publisher badge
@y
### Verified publisher badge
@z

@x
Images that are part of this program have a badge on Docker Hub making it easier for developers
to identify projects that Docker has verified as high quality publishers and with content they can trust.
@y
Images that are part of this program have a badge on Docker Hub making it easier for developers
to identify projects that Docker has verified as high quality publishers and with content they can trust.
@z

@x
![Docker, Inc. org with a verified publisher badge](../../../images/verified-publisher-badge.png)
@y
![Docker, Inc. org with a verified publisher badge](../../../images/verified-publisher-badge.png)
@z

@x
### Insights and analytics
@y
### Insights and analytics
@z

@x
The [insights and analytics](./insights-analytics.md) service provides usage metrics for how
the community uses Docker images, granting insight into user behavior.
@y
The [insights and analytics](./insights-analytics.md) service provides usage metrics for how
the community uses Docker images, granting insight into user behavior.
@z

@x
The usage metrics show the number of image pulls by tag or by digest, and breakdowns by
geolocation, cloud provider, client, and more.
@y
The usage metrics show the number of image pulls by tag or by digest, and breakdowns by
geolocation, cloud provider, client, and more.
@z

@x
You can select the time span for which you want to view analytics data. You can also export the data in either a summary or raw format.
@y
You can select the time span for which you want to view analytics data. You can also export the data in either a summary or raw format.
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
You can enable analysis on a per-repository
basis. For more about using this feature, see [Basic vulnerability scanning](/docker-hub/repos/manage/vulnerability-scanning/).
@y
You can enable analysis on a per-repository
basis. For more about using this feature, see [Basic vulnerability scanning](__SUBDIR__/docker-hub/repos/manage/vulnerability-scanning/).
@z

@x
### Who's eligible to become a verified publisher?
@y
### Who's eligible to become a verified publisher?
@z

@x
Any independent software vendor who distributes software on Docker Hub can join
the Verified Publisher Program. Find out more by heading to the
[Docker Verified Publisher Program](https://www.docker.com/partners/programs) page.
@y
Any independent software vendor who distributes software on Docker Hub can join
the Verified Publisher Program. Find out more by heading to the
[Docker Verified Publisher Program](https://www.docker.com/partners/programs) page.
@z
