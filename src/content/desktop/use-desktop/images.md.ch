%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Understand what you can do with the Images view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual
title: Explore the Images view in Docker Desktop
---
@y
---
description: Understand what you can do with the Images view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual
title: Explore the Images view in Docker Desktop
---
@z

@x
The **Images** view lets you manage Docker images without having to use the CLI. By default, it displays a list of all Docker images on your local disk. 
@y
The **Images** view lets you manage Docker images without having to use the CLI. By default, it displays a list of all Docker images on your local disk. 
@z

@x
You can also view Hub images once you have signed in to Docker Hub. This allows you to collaborate with your team and manage your images directly through Docker Desktop.
@y
You can also view Hub images once you have signed in to Docker Hub. This allows you to collaborate with your team and manage your images directly through Docker Desktop.
@z

@x
The **Images** view lets you perform core operations such as running an image as a container, pulling the latest version of an image from Docker Hub, pushing the image to Docker Hub, and inspecting images.
@y
The **Images** view lets you perform core operations such as running an image as a container, pulling the latest version of an image from Docker Hub, pushing the image to Docker Hub, and inspecting images.
@z

@x
It also displays metadata about the image such as the:
- Tag
- Image ID
- Date created
- Size of the image.
@y
It also displays metadata about the image such as the:
- Tag
- Image ID
- Date created
- Size of the image.
@z

@x
An **In Use** tag displays next to images used by running and stopped containers. You can choose what information you want displayed by selecting the **More options** menu to the right of the search bar, and then use the toggle switches according to your preferences. 
@y
An **In Use** tag displays next to images used by running and stopped containers. You can choose what information you want displayed by selecting the **More options** menu to the right of the search bar, and then use the toggle switches according to your preferences. 
@z

@x
The **Images on disk** status bar displays the number of images and the total disk space used by the images and when this information was last refreshed.
@y
The **Images on disk** status bar displays the number of images and the total disk space used by the images and when this information was last refreshed.
@z

@x
## Manage your images
@y
## Manage your images
@z

@x
Use the **Search** field to search for any specific image.
@y
Use the **Search** field to search for any specific image.
@z

@x
You can sort images by:
@y
You can sort images by:
@z

@x
- In use
- Unused
- Dangling
@y
- In use
- Unused
- Dangling
@z

@x
## Run an image as a container
@y
## Run an image as a container
@z

@x
From the **Images view**, hover over an image and select **Run**.
@y
From the **Images view**, hover over an image and select **Run**.
@z

@x
When prompted you can either:
@y
When prompted you can either:
@z

@x
- Select the **Optional settings** drop-down to specify a name, port, volumes, environment variables and select **Run**
- Select **Run** without specifying any optional settings.
@y
- Select the **Optional settings** drop-down to specify a name, port, volumes, environment variables and select **Run**
- Select **Run** without specifying any optional settings.
@z

@x
## Inspect an image
@y
## Inspect an image
@z

@x
To inspect an image, select the image row. Inspecting an image displays detailed information about the image such as the:
@y
To inspect an image, select the image row. Inspecting an image displays detailed information about the image such as the:
@z

@x
- Image history
- Image ID
- Date the image was created
- Size of the image
- Layers making up the image
- Base images used
- Vulnerabilities found
- Packages inside the image
@y
- Image history
- Image ID
- Date the image was created
- Size of the image
- Layers making up the image
- Base images used
- Vulnerabilities found
- Packages inside the image
@z

@x
[Docker Scout](../../scout/index.md) powers this vulnerability information.
For more information about this view, see [Image details view](../../scout/image-details-view.md)
@y
[Docker Scout](../../scout/index.md) powers this vulnerability information.
For more information about this view, see [Image details view](../../scout/image-details-view.md)
@z

@x
## Pull the latest image from Docker Hub
@y
## Pull the latest image from Docker Hub
@z

@x
Select the image from the list, select the **More options** button and select **Pull**.
@y
Select the image from the list, select the **More options** button and select **Pull**.
@z

@x
> **Note**
>
> The repository must exist on Docker Hub in order to pull the latest version of an image. You must be signed in to pull private images.
@y
> **Note**
>
> The repository must exist on Docker Hub in order to pull the latest version of an image. You must be signed in to pull private images.
@z

@x
## Push an image to Docker Hub
@y
## Push an image to Docker Hub
@z

@x
Select the image from the list, select the **More options** button and select **Push to Hub**.
@y
Select the image from the list, select the **More options** button and select **Push to Hub**.
@z

@x
> **Note**
>
> You can only push an image to Docker Hub if the image belongs to your Docker ID or your organization. That is, the image must contain the correct username/organization in its tag to be able to push it to Docker Hub.
@y
> **Note**
>
> You can only push an image to Docker Hub if the image belongs to your Docker ID or your organization. That is, the image must contain the correct username/organization in its tag to be able to push it to Docker Hub.
@z

@x
## Remove an image
@y
## Remove an image
@z

@x
> **Note**
>
> To remove an image used by a running or a stopped container, you must first remove the associated container.
@y
> **Note**
>
> To remove an image used by a running or a stopped container, you must first remove the associated container.
@z

@x
You can remove individual images or use the **Clean up** option to delete unused and dangling images.
@y
You can remove individual images or use the **Clean up** option to delete unused and dangling images.
@z

@x
An unused image is an image which is not used by any running or stopped containers. An image becomes dangling when you build a new version of the image with the same tag.
@y
An unused image is an image which is not used by any running or stopped containers. An image becomes dangling when you build a new version of the image with the same tag.
@z

@x
To remove individual images, select the image from the list, select the **More options** button and select **Remove**
@y
To remove individual images, select the image from the list, select the **More options** button and select **Remove**
@z

@x
To remove an unused or a dangling image:
@y
To remove an unused or a dangling image:
@z

@x
1. Select the **Clean up** option from the **Images on disk** status bar.
2. Use the **Unused** or **Dangling** check boxes to select the type of images you would like to remove.
@y
1. Select the **Clean up** option from the **Images on disk** status bar.
2. Use the **Unused** or **Dangling** check boxes to select the type of images you would like to remove.
@z

@x
    The **Clean up** images status bar displays the total space you can reclaim by removing the selected images.
3. Select **Remove** to confirm.
@y
    The **Clean up** images status bar displays the total space you can reclaim by removing the selected images.
3. Select **Remove** to confirm.
@z

@x
## Interact with remote repositories
@y
## Interact with remote repositories
@z

@x
The **Images** view also allows you to manage and interact with images in remote repositories.
By default, when you go to **Images** in Docker Desktop, you see a list of images that exist in your local image store.
The **Local** and **Hub** tabs near the top toggles between viewing images in your local image store,
and images in remote Docker Hub repositories that you have access to.
@y
The **Images** view also allows you to manage and interact with images in remote repositories.
By default, when you go to **Images** in Docker Desktop, you see a list of images that exist in your local image store.
The **Local** and **Hub** tabs near the top toggles between viewing images in your local image store,
and images in remote Docker Hub repositories that you have access to.
@z

@x
For more information about supported integrations, see
[Integrating Docker Scout](../../scout/integrations/index.md).
@y
For more information about supported integrations, see
[Integrating Docker Scout](../../scout/integrations/index.md).
@z

@x
### Hub
@y
### Hub
@z

@x
Switching to the **Hub** tab prompts you to sign in to your Docker Hub account, if you're not already signed in.
When signed in, it shows you a list of images in Docker Hub organizations and repositories that you have access to.
@y
Switching to the **Hub** tab prompts you to sign in to your Docker Hub account, if you're not already signed in.
When signed in, it shows you a list of images in Docker Hub organizations and repositories that you have access to.
@z

@x
Select an organization from the drop-down to view a list of repositories for that organization.
@y
Select an organization from the drop-down to view a list of repositories for that organization.
@z

@x
If you have enabled [Vulnerability Scanning](../../docker-hub/vulnerability-scanning.md) in Docker Hub, the scan results appear next to the image tags.
@y
If you have enabled [Vulnerability Scanning](../../docker-hub/vulnerability-scanning.md) in Docker Hub, the scan results appear next to the image tags.
@z

@x
Hovering over an image tag reveals two options:
@y
Hovering over an image tag reveals two options:
@z

@x
- **Pull**: Pull the latest version of the image from Docker Hub.
- **View in Hub**: Open the Docker Hub page and display detailed information about the image.
@y
- **Pull**: Pull the latest version of the image from Docker Hub.
- **View in Hub**: Open the Docker Hub page and display detailed information about the image.
@z

@x
### Artifactory
@y
### Artifactory
@z

@x
The Artifactory integration lets you interact with images in JFrog Artifactory,
and JFrog container registry, directly in the **Images** view of Docker Desktop.
The integration described here connects your local Docker Desktop client with Artifactory.
You can browse, filter, save, and pull images in the Artifactory instance you configure.
@y
The Artifactory integration lets you interact with images in JFrog Artifactory,
and JFrog container registry, directly in the **Images** view of Docker Desktop.
The integration described here connects your local Docker Desktop client with Artifactory.
You can browse, filter, save, and pull images in the Artifactory instance you configure.
@z

@x
You may also want to consider activating automatic image analysis for your Artifactory repositories.
Learn more about [Artifactory integration with Docker Scout](../../scout/integrations/registry/artifactory.md).
@y
You may also want to consider activating automatic image analysis for your Artifactory repositories.
Learn more about [Artifactory integration with Docker Scout](../../scout/integrations/registry/artifactory.md).
@z

@x
#### Connect an Artifactory registry
@y
#### Connect an Artifactory registry
@z

@x
To connect a new Artifactory registry to Docker Desktop:
@y
To connect a new Artifactory registry to Docker Desktop:
@z

@x
1. Sign in to an Artifactory registry using the `docker login` command:
@y
1. Sign in to an Artifactory registry using the `docker login` command:
@z

@x
   ```console
   $ cat ./password.txt | docker login -u <username> --password-stdin <hostname>
   ```
@y
   ```console
   $ cat ./password.txt | docker login -u <username> --password-stdin <hostname>
   ```
@z

@x
   - `password.txt`: Text file containing your Artifactory password.
   - `username`: Your Artifactory username.
   - `hostname`: Hostname for your Artifactory instance.
@y
   - `password.txt`: Text file containing your Artifactory password.
   - `username`: Your Artifactory username.
   - `hostname`: Hostname for your Artifactory instance.
@z

@x
2. Open the **Images** view in Docker Desktop.
3. Select the **Artifactory** tab near the top of the image view to see Artifactory images.
@y
2. Open the **Images** view in Docker Desktop.
3. Select the **Artifactory** tab near the top of the image view to see Artifactory images.
@z

@x
When signed in, a new **Artifactory** tab appears in the **Images** view.
By default, the image list shows images sorted by push date: the newest images appear higher in the list.
@y
When signed in, a new **Artifactory** tab appears in the **Images** view.
By default, the image list shows images sorted by push date: the newest images appear higher in the list.
@z
