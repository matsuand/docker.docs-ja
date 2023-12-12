%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: How to back up and restore your Docker Desktop data
keywords: Docker Desktop, backup, restore, migration, reinstall, containers, images,
  volumes
---
@y
---
title: How to back up and restore your Docker Desktop data
keywords: Docker Desktop, backup, restore, migration, reinstall, containers, images,
  volumes
---
@z

@x
Use the following procedure to save and restore your images and container data. This is useful if you want to reset your VM disk or to move your Docker environment to a new
computer, for example.
@y
Use the following procedure to save and restore your images and container data. This is useful if you want to reset your VM disk or to move your Docker environment to a new
computer, for example.
@z

@x
> Should I back up my containers?
>
> If you use volumes or bind-mounts to store your container data, backing up your containers may not be needed, but make sure to remember the options that were used when creating the container or use a [Docker Compose file](../compose/compose-file/index.md) if you want to re-create your containers with the same configuration after re-installation.
{ .tip }
@y
> Should I back up my containers?
>
> If you use volumes or bind-mounts to store your container data, backing up your containers may not be needed, but make sure to remember the options that were used when creating the container or use a [Docker Compose file](../compose/compose-file/index.md) if you want to re-create your containers with the same configuration after re-installation.
{ .tip }
@z

@x
## Save your data
@y
## Save your data
@z

@x
1. Commit your containers to an image with [`docker container commit`](../engine/reference/commandline/commit.md).
@y
1. Commit your containers to an image with [`docker container commit`](../engine/reference/commandline/commit.md).
@z

@x
   Committing a container stores the container filesystem changes and some of the
   container's configuration, for example labels and environment-variables, as a local image. Be aware that environment variables may contain sensitive
   information such as passwords or proxy-authentication, so care should be taken
   when pushing the resulting image to a registry.
@y
   Committing a container stores the container filesystem changes and some of the
   container's configuration, for example labels and environment-variables, as a local image. Be aware that environment variables may contain sensitive
   information such as passwords or proxy-authentication, so care should be taken
   when pushing the resulting image to a registry.
@z

@x
   Also note that filesystem changes in volume that are attached to the
   container are not included in the image, and must be backed up separately.
@y
   Also note that filesystem changes in volume that are attached to the
   container are not included in the image, and must be backed up separately.
@z

@x
   If you used a [named volume](../storage/index.md#more-details-about-mount-types) to store container data, such as databases, refer to the [back up, restore, or migrate data volumes](../storage/volumes.md#back-up-restore-or-migrate-data-volumes) page in the storage section.
@y
   If you used a [named volume](../storage/index.md#more-details-about-mount-types) to store container data, such as databases, refer to the [back up, restore, or migrate data volumes](../storage/volumes.md#back-up-restore-or-migrate-data-volumes) page in the storage section.
@z

@x
2. Use [`docker push`](../engine/reference/commandline/push.md) to push any
   images you have built locally and want to keep to the [Docker Hub registry](../docker-hub/index.md).
@y
2. Use [`docker push`](../engine/reference/commandline/push.md) to push any
   images you have built locally and want to keep to the [Docker Hub registry](../docker-hub/index.md).
@z

@x
   Make sure to configure the [repository's visibility as "private"](../docker-hub/repos/index.md)
   for images that should not be publicly accessible. 
@y
   Make sure to configure the [repository's visibility as "private"](../docker-hub/repos/index.md)
   for images that should not be publicly accessible. 
@z

@x
   Alternatively, use [`docker image save -o images.tar image1 [image2 ...]`](../engine/reference/commandline/save.md)
   to save any images you want to keep to a local tar file. 
@y
   Alternatively, use [`docker image save -o images.tar image1 [image2 ...]`](../engine/reference/commandline/save.md)
   to save any images you want to keep to a local tar file. 
@z

@x
After backing up your data, you can uninstall the current version of Docker Desktop
and [install a different version](release-notes.md) or reset Docker Desktop to factory defaults.
@y
After backing up your data, you can uninstall the current version of Docker Desktop
and [install a different version](release-notes.md) or reset Docker Desktop to factory defaults.
@z

@x
## Restore your data
@y
## Restore your data
@z

@x
1. Use [`docker pull`](../engine/reference/commandline/pull.md) to restore images
   you pushed to Docker Hub.
@y
1. Use [`docker pull`](../engine/reference/commandline/pull.md) to restore images
   you pushed to Docker Hub.
@z

@x
   If you backed up your images to a local tar file, use [`docker image load -i images.tar`](../engine/reference/commandline/load.md)
   to restore previously saved images.
@y
   If you backed up your images to a local tar file, use [`docker image load -i images.tar`](../engine/reference/commandline/load.md)
   to restore previously saved images.
@z

@x
2. Re-create your containers if needed, using [`docker run`](../engine/reference/commandline/run.md),
   or [Docker Compose](../compose/index.md).
@y
2. Re-create your containers if needed, using [`docker run`](../engine/reference/commandline/run.md),
   or [Docker Compose](../compose/index.md).
@z

@x
Refer to the [backup, restore, or migrate data volumes](../storage/volumes.md#back-up-restore-or-migrate-data-volumes) page in the storage section to restore volume data.
@y
Refer to the [backup, restore, or migrate data volumes](../storage/volumes.md#back-up-restore-or-migrate-data-volumes) page in the storage section to restore volume data.
@z
