%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn how to archive or unarchive a repository on Docker Hub
keywords: Docker Hub, Hub, repositories, archive, unarchive
title: Archive or unarchive a repository
linkTitle: Archive
@y
description: Learn how to archive or unarchive a repository on Docker Hub
keywords: Docker Hub, Hub, repositories, archive, unarchive
title: Archive or unarchive a repository
linkTitle: Archive
@z

@x
You can archive a repository on Docker Hub to mark it as read-only and indicate
that it's no longer actively maintained. This helps prevent the use of outdated
or unsupported images in workflows. Archived repositories can also be unarchived
if needed.
@y
You can archive a repository on Docker Hub to mark it as read-only and indicate
that it's no longer actively maintained. This helps prevent the use of outdated
or unsupported images in workflows. Archived repositories can also be unarchived
if needed.
@z

@x
Docker Hub highlights repositories that haven't been updated in over a year by
displaying an icon ({{< inline-image src="./images/outdated-icon.webp"
alt="outdated icon" >}}) next to them on the [**Repositories**
page](https://hub.docker.com/repositories/). Consider reviewing these
highlighted repositories and archiving them if necessary.
@y
Docker Hub highlights repositories that haven't been updated in over a year by
displaying an icon ({{< inline-image src="./images/outdated-icon.webp"
alt="outdated icon" >}}) next to them on the [**Repositories**
page](https://hub.docker.com/repositories/). Consider reviewing these
highlighted repositories and archiving them if necessary.
@z

@x
When a repository is archived, the following occurs:
@y
When a repository is archived, the following occurs:
@z

@x
- The repository information can't be modified.
- New images can't be pushed to the repository.
- An **Archived** label is displayed on the public repository page.
- Users can still pull the images.
@y
- The repository information can't be modified.
- New images can't be pushed to the repository.
- An **Archived** label is displayed on the public repository page.
- Users can still pull the images.
@z

@x
You can unarchive an archived repository to remove the archived state. When
unarchived, the following occurs:
@y
You can unarchive an archived repository to remove the archived state. When
unarchived, the following occurs:
@z

@x
- The repository information can be modified.
- New images can be pushed to the repository.
- The **Archived** label is removed on the public repository page.
@y
- The repository information can be modified.
- New images can be pushed to the repository.
- The **Archived** label is removed on the public repository page.
@z

@x
## Archive a repository
@y
## Archive a repository
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Settings** tab.
5. Select **Archive repository**.
6. Enter the name of your repository to confirm.
7. Select **Archive**.
@y
4. Select the **Settings** tab.
5. Select **Archive repository**.
6. Enter the name of your repository to confirm.
7. Select **Archive**.
@z

@x
## Unarchive a repository
@y
## Unarchive a repository
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
@z

@x
   A list of your repositories appears.
@y
   A list of your repositories appears.
@z

@x
3. Select a repository.
@y
3. Select a repository.
@z

@x
   The **General** page for the repository appears.
@y
   The **General** page for the repository appears.
@z

@x
4. Select the **Settings** tab.
5. Select **Unarchive repository**.
@y
4. Select the **Settings** tab.
5. Select **Unarchive repository**.
@z
