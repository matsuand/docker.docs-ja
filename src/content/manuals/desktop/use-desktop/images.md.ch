%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Understand what you can do with the Images view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual
title: Explore the Images view in Docker Desktop
linkTitle: Images
@y
description: Understand what you can do with the Images view on Docker Dashboard
keywords: Docker Dashboard, manage, containers, gui, dashboard, images, user manual
title: Explore the Images view in Docker Desktop
linkTitle: Images
@z

@x
The **Images** view displays a list of your Docker images and allows you to run an image as a container, pull the latest version of an image from Docker Hub, and inspect images. It also displays a summary of image vulnerabilities. In addition, the **Images** view contains clean-up options to remove unwanted images from the disk to reclaim space. If you are signed in, you can also see the images you and your organization have shared on Docker Hub.
@y
The **Images** view displays a list of your Docker images and allows you to run an image as a container, pull the latest version of an image from Docker Hub, and inspect images. It also displays a summary of image vulnerabilities. In addition, the **Images** view contains clean-up options to remove unwanted images from the disk to reclaim space. If you are signed in, you can also see the images you and your organization have shared on Docker Hub.
@z

@x
By default, the **Images** view displays a list of all Docker images on your local disk. You can view Docker Hub images once you've signed in to Docker Hub.
@y
By default, the **Images** view displays a list of all Docker images on your local disk. You can view Docker Hub images once you've signed in to Docker Hub.
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
An unused image is an image that isn't used by any running or stopped container. An image becomes dangling when you build a new version of the image with the same tag.
@y
An unused image is an image that isn't used by any running or stopped container. An image becomes dangling when you build a new version of the image with the same tag.
@z

@x
Select the **Columns** icon to choose which columns are displayed, and toggle each one on or off according to your preference. By default, the grid shows:
@y
Select the **Columns** icon to choose which columns are displayed, and toggle each one on or off according to your preference. By default, the grid shows:
@z

@x
- Tag
- Image ID
- Date created
- Size of the image.
@y
- Tag
- Image ID
- Date created
- Size of the image.
@z

@x
A status icon next to each image indicates whether it's **In use** or **Unused**. Hover over an image's name, tag, or ID to reveal a copy-to-clipboard button. An architecture warning chip (for example, `amd64`) appears next to an image's name when it's running under emulation, which can cause poor performance or failures.
@y
A status icon next to each image indicates whether it's **In use** or **Unused**. Hover over an image's name, tag, or ID to reveal a copy-to-clipboard button. An architecture warning chip (for example, `amd64`) appears next to an image's name when it's running under emulation, which can cause poor performance or failures.
@z

@x
Above the grid, a header shows the total number of images, the disk space they use, and when this information was last refreshed.
@y
Above the grid, a header shows the total number of images, the disk space they use, and when this information was last refreshed.
@z

@x
Select the checkbox on one or more images to select them, then use the bulk **Delete** action to remove them all at once. While images are selected, the toolbar shows how much disk space you'd reclaim by deleting them.
@y
Select the checkbox on one or more images to select them, then use the bulk **Delete** action to remove them all at once. While images are selected, the toolbar shows how much disk space you'd reclaim by deleting them.
@z

@x
If Gordon is available, each image row can surface AI-suggested diagnostic questions and flag issues, such as an image being dangling, unused, or unusually large.
@y
If Gordon is available, each image row can surface AI-suggested diagnostic questions and flag issues, such as an image being dangling, unused, or unusually large.
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
To inspect an image, select the image row, or select **View packages and CVEs** from its actions menu. The image's detail page shows information such as:
@y
To inspect an image, select the image row, or select **View packages and CVEs** from its actions menu. The image's detail page shows information such as:
@z

@x
- Image history (with a copy button)
- Image ID
- Date the image was created
- Size of the image
- Layers making up the image
- Base images used
- Vulnerabilities found
- Packages inside the image
@y
- Image history (with a copy button)
- Image ID
- Date the image was created
- Size of the image
- Layers making up the image
- Base images used
- Vulnerabilities found
- Packages inside the image
@z

@x
From an image's row, you can also select **View container usage** to jump to the Containers view, filtered to containers using that image.
@y
From an image's row, you can also select **View container usage** to jump to the Containers view, filtered to containers using that image.
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
> [!NOTE]
>
> The repository must exist on Docker Hub in order to pull the latest version of an image. You must be signed in to pull private images.
@y
> [!NOTE]
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
> [!NOTE]
>
> You can only push an image to Docker Hub if the image belongs to your Docker ID or your organization. That is, the image must contain the correct username/organization in its tag to be able to push it to Docker Hub.
@y
> [!NOTE]
>
> You can only push an image to Docker Hub if the image belongs to your Docker ID or your organization. That is, the image must contain the correct username/organization in its tag to be able to push it to Docker Hub.
@z

@x
## Remove an image
@y
## Remove an image
@z

@x
To remove an individual image, select the bin icon on its row. To remove several at once, select their checkboxes and use the bulk **Delete** action.
@y
To remove an individual image, select the bin icon on its row. To remove several at once, select their checkboxes and use the bulk **Delete** action.
@z

@x
> [!NOTE]
>
> To remove an image used by a running or a stopped container, you must first remove the associated container.
@y
> [!NOTE]
>
> To remove an image used by a running or a stopped container, you must first remove the associated container.
@z

@x
## Docker Hub repositories
@y
## Docker Hub repositories
@z

@x
The **Images** view also allows you to manage and interact with images in Docker Hub repositories.
By default, when you go to **Images** in Docker Desktop, you see a list of images that exist in your local image store.
The **Local** and **My Hub** tabs near the top toggles between viewing images in your local image store,
and images in remote Docker Hub repositories that you have access to.
@y
The **Images** view also allows you to manage and interact with images in Docker Hub repositories.
By default, when you go to **Images** in Docker Desktop, you see a list of images that exist in your local image store.
The **Local** and **My Hub** tabs near the top toggles between viewing images in your local image store,
and images in remote Docker Hub repositories that you have access to.
@z

@x
Switching to the **My Hub** tab prompts you to sign in to your Docker Hub account, if you're not already signed in.
When signed in, it shows you a list of images in Docker Hub organizations and repositories that you have access to.
@y
Switching to the **My Hub** tab prompts you to sign in to your Docker Hub account, if you're not already signed in.
When signed in, it shows you a list of images in Docker Hub organizations and repositories that you have access to.
@z

@x
Select an organization from the drop-down to view a list of repositories for that organization.
@y
Select an organization from the drop-down to view a list of repositories for that organization.
@z

@x
If you have enabled [Docker Scout](../../scout/_index.md) on the repositories,
image analysis results appear next to the image tags.
@y
If you have enabled [Docker Scout](../../scout/_index.md) on the repositories,
image analysis results appear next to the image tags.
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
## Additional resources
@y
## Additional resources
@z

@x
- [What is an image?](/get-started/docker-concepts/the-basics/what-is-an-image.md)
@y
- [What is an image?](get-started/docker-concepts/the-basics/what-is-an-image.md)
@z
