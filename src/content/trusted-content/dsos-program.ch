%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Learn about the Docker-Sponsored Open Source Program and how it works
title: Docker-Sponsored Open Source Program
keywords: docker hub, hub, insights, analytics, open source, Docker sponsored, program
aliases:
  - /docker-hub/dsos-program/
---
@y
---
description: Learn about the Docker-Sponsored Open Source Program and how it works
title: Docker-Sponsored Open Source Program
keywords: docker hub, hub, insights, analytics, open source, Docker sponsored, program
aliases:
  - /docker-hub/dsos-program/
---
@z

@x
[Docker Sponsored Open Source images](https://hub.docker.com/search?q=&image_filter=open_source) are published and maintained by open-source projects sponsored by Docker through the program.
@y
[Docker Sponsored Open Source images](https://hub.docker.com/search?q=&image_filter=open_source) are published and maintained by open-source projects sponsored by Docker through the program.
@z

@x
Images that are part of this program have a special badge on Docker Hub making it easier for users to identify projects that Docker has verified as trusted, secure, and active open-source projects.
@y
Images that are part of this program have a special badge on Docker Hub making it easier for users to identify projects that Docker has verified as trusted, secure, and active open-source projects.
@z

@x
![Docker-Sponsored Open Source badge](images/sponsored-badge-iso.png)
@y
![Docker-Sponsored Open Source badge](images/sponsored-badge-iso.png)
@z

@x
## For content publishers
@y
## For content publishers
@z

@x
The Docker-Sponsored Open Source (DSOS) Program provides several features and benefits to non-commercial open source developers.
@y
The Docker-Sponsored Open Source (DSOS) Program provides several features and benefits to non-commercial open source developers.
@z

@x
The program grants the following perks to eligible projects:
@y
The program grants the following perks to eligible projects:
@z

@x
- Repository logo
- Verified Docker-Sponsored Open Source badge
- Insights and analytics
- Vulnerability analysis
- Removal of rate limiting for developers
- Improved discoverability on Docker Hub
@y
- Repository logo
- Verified Docker-Sponsored Open Source badge
- Insights and analytics
- Vulnerability analysis
- Removal of rate limiting for developers
- Improved discoverability on Docker Hub
@z

@x
These benefits are valid for one year and publishers can renew annually if the project still meets the program requirements. Program members and all users pulling public images from the project namespace get access to unlimited pulls and unlimited egress.
@y
These benefits are valid for one year and publishers can renew annually if the project still meets the program requirements. Program members and all users pulling public images from the project namespace get access to unlimited pulls and unlimited egress.
@z

@x
### Repository logo
@y
### Repository logo
@z

@x
DSOS organizations can upload custom images for individual repositories on Docker Hub.
This lets you override the default organization-level logo on a per-repository basis.
@y
DSOS organizations can upload custom images for individual repositories on Docker Hub.
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
3. Select the upload logo button, represented by a camera icon
   ({{< inline-image src="images/upload_logo_sm.png" alt="camera icon" >}})
   overlaying the current repository logo.
4. In the dialog that opens, select the PNG image that you want to upload to
   set it as the logo for the repository.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Go to the page of the repository that you want to change the logo for.
3. Select the upload logo button, represented by a camera icon
   ({{< inline-image src="images/upload_logo_sm.png" alt="camera icon" >}})
   overlaying the current repository logo.
4. In the dialog that opens, select the PNG image that you want to upload to
   set it as the logo for the repository.
@z

@x
#### Remove the logo
@y
#### Remove the logo
@z

@x
Select the **Clear** button ({{< inline-image src="images/clear_logo_sm.png"
alt="clear button" >}}) to remove a logo.
@y
Select the **Clear** button ({{< inline-image src="images/clear_logo_sm.png"
alt="clear button" >}}) to remove a logo.
@z

@x
Removing the logo makes the repository default to using the organization logo, if set, or the following default logo if not.
@y
Removing the logo makes the repository default to using the organization logo, if set, or the following default logo if not.
@z

@x
![Default logo which is a 3D grey cube](images/default_logo_sm.png)
@y
![Default logo which is a 3D grey cube](images/default_logo_sm.png)
@z

@x
### Verified Docker-Sponsored Open Source badge
@y
### Verified Docker-Sponsored Open Source badge
@z

@x
Docker verifies that developers can trust images with this badge on Docker Hub as an active open source project.
@y
Docker verifies that developers can trust images with this badge on Docker Hub as an active open source project.
@z

@x
![Fluent org with a Docker-Sponsored Open Source badge](images/sponsored-badge.png)
@y
![Fluent org with a Docker-Sponsored Open Source badge](images/sponsored-badge.png)
@z

@x
### Insights and analytics
@y
### Insights and analytics
@z

@x
The [insights and analytics](/docker-hub/publish/insights-analytics) service provides usage metrics for how
the community uses Docker images, granting insight into user behavior.
@y
The [insights and analytics](/docker-hub/publish/insights-analytics) service provides usage metrics for how
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
![The insights and analytics tab on the Docker Hub website](images/insights-and-analytics-tab.png)
@y
![The insights and analytics tab on the Docker Hub website](images/insights-and-analytics-tab.png)
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
[Docker Scout](/scout/) provides automatic vulnerability analysis
for DVP images published to Docker Hub.
Scanning images ensures that the published content is secure, and proves to
developers that they can trust the image.
@z

@x
You can enable analysis on a per-repository
basis. For more about using this feature, see [Basic vulnerability scanning](/docker-hub/vulnerability-scanning/).
@y
You can enable analysis on a per-repository
basis. For more about using this feature, see [Basic vulnerability scanning](/docker-hub/vulnerability-scanning/).
@z

@x
> **Note**
>
> Content publishers in the Docker-Sponsored Open Source Program receive 3 free
> Docker Team Seats
@y
> **Note**
>
> Content publishers in the Docker-Sponsored Open Source Program receive 3 free
> Docker Team Seats
@z

@x
### Who's eligible for the Docker-Sponsored Open Source program?
@y
### Who's eligible for the Docker-Sponsored Open Source program?
@z

@x
To qualify for the program, a publisher must share the project namespace in public repositories, meet [the Open Source Initiative definition](https://opensource.org/docs/osd), and be in active development with no pathway to commercialization.
@y
To qualify for the program, a publisher must share the project namespace in public repositories, meet [the Open Source Initiative definition](https://opensource.org/docs/osd), and be in active development with no pathway to commercialization.
@z

@x
Find out more by heading to the
[Docker-Sponsored Open Source Program](https://www.docker.com/community/open-source/application/) application page.
@y
Find out more by heading to the
[Docker-Sponsored Open Source Program](https://www.docker.com/community/open-source/application/) application page.
@z
