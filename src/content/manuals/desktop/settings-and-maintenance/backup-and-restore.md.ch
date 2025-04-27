%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: How to back up and restore your Docker Desktop data
linkTitle: Backup and restore data
keywords: Docker Desktop, backup, restore, migration, reinstall, containers, images,
  volumes
@y
title: How to back up and restore your Docker Desktop data
linkTitle: Backup and restore data
keywords: Docker Desktop, backup, restore, migration, reinstall, containers, images,
  volumes
@z

@x
Use this procedure to back up and restore your images and container data. This is useful if you want to reset your VM disk or to move your Docker environment to a new computer.
@y
Use this procedure to back up and restore your images and container data. This is useful if you want to reset your VM disk or to move your Docker environment to a new computer.
@z

@x
> [!IMPORTANT]
>
> If you use volumes or bind-mounts to store your container data, backing up your containers may not be needed, but make sure to remember the options that were used when creating the container or use a [Docker Compose file](/reference/compose-file/_index.md) if you want to re-create your containers with the same configuration after re-installation.
@y
> [!IMPORTANT]
>
> If you use volumes or bind-mounts to store your container data, backing up your containers may not be needed, but make sure to remember the options that were used when creating the container or use a [Docker Compose file](reference/compose-file/_index.md) if you want to re-create your containers with the same configuration after re-installation.
@z

@x
## Save your data
@y
## Save your data
@z

@x
1. Commit your containers to an image with [`docker container commit`](/reference/cli/docker/container/commit.md).
@y
1. Commit your containers to an image with [`docker container commit`](reference/cli/docker/container/commit.md).
@z

@x
   Committing a container stores filesystem changes and some container configurations, such as labels and environment variables, as a local image. Be aware that environment variables may contain sensitive
   information such as passwords or proxy-authentication, so take care when pushing the resulting image to a registry.
@y
   Committing a container stores filesystem changes and some container configurations, such as labels and environment variables, as a local image. Be aware that environment variables may contain sensitive
   information such as passwords or proxy-authentication, so take care when pushing the resulting image to a registry.
@z

@x
   Also note that filesystem changes in a volume that are attached to the
   container are not included in the image, and must be backed up separately.
@y
   Also note that filesystem changes in a volume that are attached to the
   container are not included in the image, and must be backed up separately.
@z

@x
   If you used a [named volume](/manuals/engine/storage/_index.md#more-details-about-mount-types) to store container data, such as databases, refer to the [back up, restore, or migrate data volumes](/manuals/engine/storage/volumes.md#back-up-restore-or-migrate-data-volumes) page in the storage section.
@y
   If you used a [named volume](manuals/engine/storage/_index.md#more-details-about-mount-types) to store container data, such as databases, refer to the [back up, restore, or migrate data volumes](manuals/engine/storage/volumes.md#back-up-restore-or-migrate-data-volumes) page in the storage section.
@z

@x
2. Use [`docker push`](/reference/cli/docker/image/push.md) to push any
   images you have built locally and want to keep to the [Docker Hub registry](/manuals/docker-hub/_index.md).
@y
2. Use [`docker push`](reference/cli/docker/image/push.md) to push any
   images you have built locally and want to keep to the [Docker Hub registry](manuals/docker-hub/_index.md).
@z

@x
   > [!TIP]
   >
   > [Set the repository visibility to private](/manuals/docker-hub/repos/_index.md) if your image includes sensitive content.
@y
   > [!TIP]
   >
   > [Set the repository visibility to private](manuals/docker-hub/repos/_index.md) if your image includes sensitive content.
@z

@x
   Alternatively, use [`docker image save -o images.tar image1 [image2 ...]`](/reference/cli/docker/image/save.md)
   to save any images you want to keep to a local `.tar` file. 
@y
   Alternatively, use [`docker image save -o images.tar image1 [image2 ...]`](reference/cli/docker/image/save.md)
   to save any images you want to keep to a local `.tar` file. 
@z

@x
After backing up your data, you can uninstall the current version of Docker Desktop
and [install a different version](/manuals/desktop/release-notes.md) or reset Docker Desktop to factory defaults.
@y
After backing up your data, you can uninstall the current version of Docker Desktop
and [install a different version](manuals/desktop/release-notes.md) or reset Docker Desktop to factory defaults.
@z

@x
## Restore your data
@y
## Restore your data
@z

@x
1. Load your images.
@y
1. Load your images.
@z

@x
   - If you pushed to Docker Hub:
@y
   - If you pushed to Docker Hub:
@z

@x
      ```console
      $ docker pull <my-backup-image>
      ```
@y
      ```console
      $ docker pull <my-backup-image>
      ```
@z

@x
   - If you saved a `.tar` file:
@y
   - If you saved a `.tar` file:
@z

@x
      ```console
      $ docker image load -i images.tar
      ```
@y
      ```console
      $ docker image load -i images.tar
      ```
@z

@x
2. Re-create your containers if needed, using [`docker run`](/reference/cli/docker/container/run.md),
   or [Docker Compose](/manuals/compose/_index.md).
@y
2. Re-create your containers if needed, using [`docker run`](reference/cli/docker/container/run.md),
   or [Docker Compose](manuals/compose/_index.md).
@z

@x
To restore volume data, refer to [backup, restore, or migrate data volumes](/manuals/engine/storage/volumes.md#back-up-restore-or-migrate-data-volumes). 
@y
To restore volume data, refer to [backup, restore, or migrate data volumes](manuals/engine/storage/volumes.md#back-up-restore-or-migrate-data-volumes). 
@z
