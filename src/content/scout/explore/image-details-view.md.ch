%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% (no slash) 対応

@x
---
title: Image details view
keywords: scout, supply chain, vulnerabilities, packages, cves, image, tag, scan,
  analysis, analyze
description: The Docker Scout image detail view analyzes images to show their heirachy,
  layers, packages, and vulnerabilities
aliases:
  - /scout/image-details-view
---
@y
---
title: Image details view
keywords: scout, supply chain, vulnerabilities, packages, cves, image, tag, scan,
  analysis, analyze
description: The Docker Scout image detail view analyzes images to show their heirachy,
  layers, packages, and vulnerabilities
aliases:
  - /scout/image-details-view
---
@z

@x
The image details view shows a breakdown of the Docker Scout analysis. You can
access the image view from the Docker Scout Dashboard, the Docker Desktop
**Images** view, and from the image tag page on Docker Hub. The image details
show a breakdown of the image hierarchy (base images), image layers, packages,
and vulnerabilities.
@y
The image details view shows a breakdown of the Docker Scout analysis. You can
access the image view from the Docker Scout Dashboard, the Docker Desktop
**Images** view, and from the image tag page on Docker Hub. The image details
show a breakdown of the image hierarchy (base images), image layers, packages,
and vulnerabilities.
@z

@x
![The image details view in Docker Desktop](../images/dd-image-view.png)
@y
![The image details view in Docker Desktop](../images/dd-image-view.png)
@z

@x (no slash) 対応
Docker Desktop first analyzes images locally, where it generates a software bill of materials (SBOM).
Docker Desktop, Docker Hub, and the Docker Scout Dashboard and CLI all use the [package URL (PURL) links](https://github.com/package-url/purl-spec)
in this SBOM to query for matching Common Vulnerabilities and Exposures (CVEs) in [Docker Scout's advisory database](/scout/deep-dive/advisory-db-sources.md).
@y
Docker Desktop first analyzes images locally, where it generates a software bill of materials (SBOM).
Docker Desktop, Docker Hub, and the Docker Scout Dashboard and CLI all use the [package URL (PURL) links](https://github.com/package-url/purl-spec)
in this SBOM to query for matching Common Vulnerabilities and Exposures (CVEs) in [Docker Scout's advisory database](scout/deep-dive/advisory-db-sources.md).
@z

@x
## Image hierarchy
@y
## Image hierarchy
@z

@x
The image you inspect may have one or more base images represented under
**Image hierarchy**. This means the author of the image used other images as
starting points when building the image. Often these base images are either
operating system images such as Debian, Ubuntu, and Alpine, or programming
language images such as PHP, Python, and Java.
@y
The image you inspect may have one or more base images represented under
**Image hierarchy**. This means the author of the image used other images as
starting points when building the image. Often these base images are either
operating system images such as Debian, Ubuntu, and Alpine, or programming
language images such as PHP, Python, and Java.
@z

@x
Selecting each image in the chain lets you see which layers originate from each
base image. Selecting the **ALL** row selects all layers and base images.
@y
Selecting each image in the chain lets you see which layers originate from each
base image. Selecting the **ALL** row selects all layers and base images.
@z

@x
One or more of the base images may have updates available, which may include
updated security patches that remove vulnerabilities from your image. Any base
images with available updates are noted to the right of **Image hierarchy**.
@y
One or more of the base images may have updates available, which may include
updated security patches that remove vulnerabilities from your image. Any base
images with available updates are noted to the right of **Image hierarchy**.
@z

@x
## Layers
@y
## Layers
@z

@x
A Docker image consists of layers. Image layers are listed from top to bottom,
with the earliest layer at the top and the most recent layer at the bottom.
Often, the layers at the top of the list originate from a base image, and the
layers towards the bottom added by the image author, often using
commands in a Dockerfile. Selecting a base image under **Image hierarchy** 
highlights with layers originate from a base image.
@y
A Docker image consists of layers. Image layers are listed from top to bottom,
with the earliest layer at the top and the most recent layer at the bottom.
Often, the layers at the top of the list originate from a base image, and the
layers towards the bottom added by the image author, often using
commands in a Dockerfile. Selecting a base image under **Image hierarchy** 
highlights with layers originate from a base image.
@z

@x
Selecting individual or multiple layers filters the packages and vulnerabilities
on the right-hand side to show what the selected layers added.
@y
Selecting individual or multiple layers filters the packages and vulnerabilities
on the right-hand side to show what the selected layers added.
@z

@x
## Vulnerabilities
@y
## Vulnerabilities
@z

@x
The **Vulnerabilities** tab displays a list of vulnerabilities and exploits detected in the image. The list is grouped by package, and sorted in order of severity.
@y
The **Vulnerabilities** tab displays a list of vulnerabilities and exploits detected in the image. The list is grouped by package, and sorted in order of severity.
@z

@x
You can find further information on the vulnerability or exploit, including if a fix is available, by expanding the list item.
@y
You can find further information on the vulnerability or exploit, including if a fix is available, by expanding the list item.
@z

@x
## Remediation recommendations
@y
## Remediation recommendations
@z

@x
When you inspect an image in Docker Desktop or Docker Hub,
Docker Scout can provide recommendations for improving the security of that image.
@y
When you inspect an image in Docker Desktop or Docker Hub,
Docker Scout can provide recommendations for improving the security of that image.
@z

@x
### Recommendations in Docker Desktop
@y
### Recommendations in Docker Desktop
@z

@x
To view security recommendations for an image in Docker Desktop:
@y
To view security recommendations for an image in Docker Desktop:
@z

@x
1. Go to the **Images** view in Docker Desktop.
2. Select the image tag that you want to view recommendations for.
3. Near the top, select the **Recommended fixes** drop-down button.
@y
1. Go to the **Images** view in Docker Desktop.
2. Select the image tag that you want to view recommendations for.
3. Near the top, select the **Recommended fixes** drop-down button.
@z

@x
The drop-down menu lets you choose whether you want to see recommendations for
the current image or any base images used to build it:
@y
The drop-down menu lets you choose whether you want to see recommendations for
the current image or any base images used to build it:
@z

@x
- [**Recommendations for this image**](#recommendations-for-current-image)
  provides recommendations for the current image that you're inspecting.
- [**Recommendations for base image**](#recommendations-for-base-image) provides
  recommendations for base images used to build the image.
@y
- [**Recommendations for this image**](#recommendations-for-current-image)
  provides recommendations for the current image that you're inspecting.
- [**Recommendations for base image**](#recommendations-for-base-image) provides
  recommendations for base images used to build the image.
@z

@x
If the image you're viewing has no associated base images, the drop-down menu only 
shows the option to view recommendations for the current image.
@y
If the image you're viewing has no associated base images, the drop-down menu only 
shows the option to view recommendations for the current image.
@z

@x
### Recommendations in Docker Hub
@y
### Recommendations in Docker Hub
@z

@x
To view security recommendations for an image in Docker Hub:
@y
To view security recommendations for an image in Docker Hub:
@z

@x
1. Go to the repository page for an image where you have activated Docker Scout
   image analysis.
2. Open the **Tags** tab.
3. Select the tag that you want to view recommendations for.
4. Select the **View recommended base image fixes** button.
@y
1. Go to the repository page for an image where you have activated Docker Scout
   image analysis.
2. Open the **Tags** tab.
3. Select the tag that you want to view recommendations for.
4. Select the **View recommended base image fixes** button.
@z

@x
   This opens a window which gives you recommendations for you can improve the
   security of your image by using better base images. See
   [Recommendations for base image](#recommendations-for-base-image) for more
   details.
@y
   This opens a window which gives you recommendations for you can improve the
   security of your image by using better base images. See
   [Recommendations for base image](#recommendations-for-base-image) for more
   details.
@z

@x
### Recommendations for current image
@y
### Recommendations for current image
@z

@x
The recommendations for the current image view helps you determine whether the image
version that you're using is out of date. If the tag you're using is referencing an
old digest, the view shows a recommendation to update the tag by pulling the
latest version.
@y
The recommendations for the current image view helps you determine whether the image
version that you're using is out of date. If the tag you're using is referencing an
old digest, the view shows a recommendation to update the tag by pulling the
latest version.
@z

@x
Select the **Pull new image** button to get the updated version. Check the
checkbox to remove the old version after pulling the latest.
@y
Select the **Pull new image** button to get the updated version. Check the
checkbox to remove the old version after pulling the latest.
@z

@x
### Recommendations for base image
@y
### Recommendations for base image
@z

@x
The base image recommendations view contains two tabs for toggling between
different types of recommendations:
@y
The base image recommendations view contains two tabs for toggling between
different types of recommendations:
@z

@x
- **Refresh base image**
- **Change base image**
@y
- **Refresh base image**
- **Change base image**
@z

@x
These base image recommendations are only actionable if you're the author of the
image you're inspecting. This is because changing the base image for an image
requires you to update the Dockerfile and re-build the image.
@y
These base image recommendations are only actionable if you're the author of the
image you're inspecting. This is because changing the base image for an image
requires you to update the Dockerfile and re-build the image.
@z

@x
#### Refresh base image
@y
#### Refresh base image
@z

@x
This tab shows if the selected base image tag is the latest available version,
or if it's outdated.
@y
This tab shows if the selected base image tag is the latest available version,
or if it's outdated.
@z

@x
If the base image tag used to build the current image isn't the latest, then the
delta between the two versions shows in this window. The delta information
includes:
@y
If the base image tag used to build the current image isn't the latest, then the
delta between the two versions shows in this window. The delta information
includes:
@z

@x
- The tag name, and aliases, of the recommended (newer) version
- The age of the current base image version
- The age of the latest available version
- The number of CVEs affecting each version
@y
- The tag name, and aliases, of the recommended (newer) version
- The age of the current base image version
- The age of the latest available version
- The number of CVEs affecting each version
@z

@x
At the bottom of the window, you also receive command snippets that you can 
run to re-build the image using the latest version.
@y
At the bottom of the window, you also receive command snippets that you can 
run to re-build the image using the latest version.
@z

@x
#### Change base image
@y
#### Change base image
@z

@x
This tab shows different alternative tags that you can use, and outlines the
benefits and disadvantages of each tag version. Selecting the base image shows
recommended options for that tag.
@y
This tab shows different alternative tags that you can use, and outlines the
benefits and disadvantages of each tag version. Selecting the base image shows
recommended options for that tag.
@z

@x
For example, if the image you're inspecting is using an old version of `debian`
as a base image, it shows recommendations for newer and more secure versions
of `debian` to use. By providing more than one alternative to choose from, you
can see for yourself how the options compare with each other, and decide which
one to use.
@y
For example, if the image you're inspecting is using an old version of `debian`
as a base image, it shows recommendations for newer and more secure versions
of `debian` to use. By providing more than one alternative to choose from, you
can see for yourself how the options compare with each other, and decide which
one to use.
@z

@x
![Base image recommendations](../images/change-base-image.png)
@y
![Base image recommendations](../images/change-base-image.png)
@z

@x
Select a tag recommendation to see further details of the recommendation.
It shows the benefits and potential disadvantages of the tag, why it's a
recommended, and how to update your Dockerfile to use this version.
@y
Select a tag recommendation to see further details of the recommendation.
It shows the benefits and potential disadvantages of the tag, why it's a
recommended, and how to update your Dockerfile to use this version.
@z
