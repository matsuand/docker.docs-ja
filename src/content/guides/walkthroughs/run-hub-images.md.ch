%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Run Docker Hub images
keywords: get started, quick start, intro, concepts
description: Learn how to run Docker Hub images
aliases:
- /get-started/run-docker-hub-images/
---
@y
---
title: Run Docker Hub images
keywords: get started, quick start, intro, concepts
description: Learn how to run Docker Hub images
aliases:
- /get-started/run-docker-hub-images/
---
@z

@x
You can share and store images in Docker Hub
([http://hub.docker.com](http://hub.docker.com)). Docker Hub has over 100,000
images created by developers that you can run locally. You can search for Docker
Hub images and run them directly from Docker Desktop.
@y
You can share and store images in Docker Hub
([http://hub.docker.com](http://hub.docker.com)). Docker Hub has over 100,000
images created by developers that you can run locally. You can search for Docker
Hub images and run them directly from Docker Desktop.
@z

@x
{{< include "guides-get-docker.md" >}}
@y
{{< include "guides-get-docker.md" >}}
@z

@x
## Step 1: Search for the image
@y
## Step 1: Search for the image
@z

@x
You can search for Docker Hub images on Docker Desktop. To search for the image used in this walkthrough:
@y
You can search for Docker Hub images on Docker Desktop. To search for the image used in this walkthrough:
@z

@x
1. Open Docker Desktop and select the search.
2. Specify `docker/welcome-to-docker` in the search.
@y
1. Open Docker Desktop and select the search.
2. Specify `docker/welcome-to-docker` in the search.
@z

@x
![Search Docker Desktop for the welcome-to-docker image](images/getting-started-search.webp?w=650&border=true)
@y
![Search Docker Desktop for the welcome-to-docker image](images/getting-started-search.webp?w=650&border=true)
@z

@x
## Step 2: Run the image
@y
## Step 2: Run the image
@z

@x
To run the `docker/welcome-to-docker` image:
@y
To run the `docker/welcome-to-docker` image:
@z

@x
1. After finding the image using search, select **Run**.
2. Expand the **Optional settings**.
3. In **Host port**, specify `8090`.
   ![Specifying host port 8090](images/getting-started-run.webp?w=500&border=true)
4. Select **Run**.
@y
1. After finding the image using search, select **Run**.
2. Expand the **Optional settings**.
3. In **Host port**, specify `8090`.
   ![Specifying host port 8090](images/getting-started-run.webp?w=500&border=true)
4. Select **Run**.
@z

@x
> **Note**
>
> Many images hosted on Docker Hub have a description that highlights what
> settings must be set in order to run them. You can read the description for
> the image on Docker Hub by selecting the image name in the search or by
> searching for the image directly on
> [https://hub.docker.com](https://hub.docker.com).
@y
> **Note**
>
> Many images hosted on Docker Hub have a description that highlights what
> settings must be set in order to run them. You can read the description for
> the image on Docker Hub by selecting the image name in the search or by
> searching for the image directly on
> [https://hub.docker.com](https://hub.docker.com).
@z

@x
## Step 3: Explore the container
@y
## Step 3: Explore the container
@z

@x
That's it! The container is ready to use. Go to the **Containers** tab in Docker Desktop to view the container.
@y
That's it! The container is ready to use. Go to the **Containers** tab in Docker Desktop to view the container.
@z

@x
![Viewing the Containers tab in Docker Desktop](images/getting-started-view.webp?border=true)
@y
![Viewing the Containers tab in Docker Desktop](images/getting-started-view.webp?border=true)
@z

@x
## Summary
@y
## Summary
@z

@x
In this walkthrough, you searched for an image on Docker Hub and ran it as a container. Docker Hub has over 100,000 more images that you can use to help build your own application.
@y
In this walkthrough, you searched for an image on Docker Hub and ran it as a container. Docker Hub has over 100,000 more images that you can use to help build your own application.
@z

@x
Related information:
@y
Related information:
@z

@x
- Deep dive into the [Docker Hub manual](../../docker-hub/_index.md)
- Explore more images on [Docker Hub](https://hub.docker.com)
@y
- Deep dive into the [Docker Hub manual](../../docker-hub/_index.md)
- Explore more images on [Docker Hub](https://hub.docker.com)
@z

@x
## Next steps
@y
## Next steps
@z

@x
Continue to the next walkthrough to learn how you can use Docker to run
multi-container applications.
@y
Continue to the next walkthrough to learn how you can use Docker to run
multi-container applications.
@z

@x
{{< button url="./multi-container-apps.md" text="Run multi-container apps" >}}
@y
{{< button url="./multi-container-apps.md" text="Run multi-container apps" >}}
@z
