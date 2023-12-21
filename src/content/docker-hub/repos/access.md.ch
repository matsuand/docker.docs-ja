%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Discover how to access repositories on Docker Hub
keywords: Docker, docker, trusted, registry, accounts, plans, Dockerfile, Docker Hub,
  webhooks, docs, documentation, collaborators, viewing, searching, starring
title: Access repositories
---
@y
---
description: Discover how to access repositories on Docker Hub
keywords: Docker, docker, trusted, registry, accounts, plans, Dockerfile, Docker Hub,
  webhooks, docs, documentation, collaborators, viewing, searching, starring
title: Access repositories
---
@z

@x
Within your repository, you can give others access to push and pull to your repository, and you can assign permissions. You can also view your repository tags and the associated images.
@y
Within your repository, you can give others access to push and pull to your repository, and you can assign permissions. You can also view your repository tags and the associated images.
@z

@x
## Collaborators and their role
@y
## Collaborators and their role
@z

@x
A collaborator is someone you want to give access to a private repository. Once designated, they can `push` and `pull` to your repositories. They're not
allowed to perform any administrative tasks such as deleting the repository or changing its status from private to public.
@y
A collaborator is someone you want to give access to a private repository. Once designated, they can `push` and `pull` to your repositories. They're not
allowed to perform any administrative tasks such as deleting the repository or changing its status from private to public.
@z

@x
You can choose collaborators and manage their access to a private
repository from that repository's **Settings** page.
@y
You can choose collaborators and manage their access to a private
repository from that repository's **Settings** page.
@z

@x
> **Note**
>
> A collaborator can't add other collaborators. Only the owner of
> the repository has administrative access. Also, you can't add collaborators to organization repositories. Organization owners can control repository access with member roles and teams. See [Roles and permissions](../../security/for-admins/roles-and-permissions.md).
@y
> **Note**
>
> A collaborator can't add other collaborators. Only the owner of
> the repository has administrative access. Also, you can't add collaborators to organization repositories. Organization owners can control repository access with member roles and teams. See [Roles and permissions](../../security/for-admins/roles-and-permissions.md).
@z

@x
You can also assign more granular collaborator rights ("Read", "Write", or
"Admin") on Docker Hub by using organizations and teams. For more information
see the [organizations documentation](../../admin/organization/orgs.md#create-an-organization).
@y
You can also assign more granular collaborator rights ("Read", "Write", or
"Admin") on Docker Hub by using organizations and teams. For more information
see the [organizations documentation](../../admin/organization/orgs.md#create-an-organization).
@z

@x
## View repository tags
@y
## View repository tags
@z

@x
You can view the available tags and the size of the associated image. Go to the **Repositories** view and select a repository to see its tags. To view individual tags, select the **Tags** tab.
@y
You can view the available tags and the size of the associated image. Go to the **Repositories** view and select a repository to see its tags. To view individual tags, select the **Tags** tab.
@z

@x
To delete a tag, select the corresponding checkbox and select **Delete** from the **Action** drop-down list.
@y
To delete a tag, select the corresponding checkbox and select **Delete** from the **Action** drop-down list.
@z

@x
> **Note**
>
> Only a user with administrative access (owner or team member with Admin
> permission) over the repository can delete tags.
@y
> **Note**
>
> Only a user with administrative access (owner or team member with Admin
> permission) over the repository can delete tags.
@z

@x
You can select a tag's digest to access more details.
@y
You can select a tag's digest to access more details.
@z

@x
Image sizes are the cumulative space taken up by the image and all its parent
images. This is also the disk space used by the contents of the `.tar` file
created when you `docker save` an image. 
@y
Image sizes are the cumulative space taken up by the image and all its parent
images. This is also the disk space used by the contents of the `.tar` file
created when you `docker save` an image. 
@z

@x
An image is stale if there has been no push or pull activity for more than one month. A multi-architecture image is stale if all single-architecture images part of its manifest are stale.
@y
An image is stale if there has been no push or pull activity for more than one month. A multi-architecture image is stale if all single-architecture images part of its manifest are stale.
@z

@x
## Search for repositories
@y
## Search for repositories
@z

@x
You can search the [Docker Hub](https://hub.docker.com) registry through its
search interface or by using the command line interface. You can search by image name, username, or description:
@y
You can search the [Docker Hub](https://hub.docker.com) registry through its
search interface or by using the command line interface. You can search by image name, username, or description:
@z

@x
```console
$ docker search centos
@y
```console
$ docker search centos
@z

@x
NAME                                 DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
centos                               The official build of CentOS.                   1034      [OK]
ansible/centos7-ansible              Ansible on Centos7                              43                   [OK]
tutum/centos                         Centos image with SSH access. For the root...   13                   [OK]
...
```
@y
NAME                                 DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
centos                               The official build of CentOS.                   1034      [OK]
ansible/centos7-ansible              Ansible on Centos7                              43                   [OK]
tutum/centos                         Centos image with SSH access. For the root...   13                   [OK]
...
```
@z

@x
In the previous example, you can see two example results, `centos` and `ansible/centos7-ansible`.
@y
In the previous example, you can see two example results, `centos` and `ansible/centos7-ansible`.
@z

@x
The second result shows that it comes from the public repository of a user,
named `ansible/`, while the first result, `centos`, doesn't explicitly list a
repository which means that it comes from the top-level namespace for
[Docker Official Images](../../../trusted-content/official-images.md).
The `/` character separates a user's repository from the image name.
@y
The second result shows that it comes from the public repository of a user,
named `ansible/`, while the first result, `centos`, doesn't explicitly list a
repository which means that it comes from the top-level namespace for
[Docker Official Images](../../../trusted-content/official-images.md).
The `/` character separates a user's repository from the image name.
@z

@x
Once you've found the image you want, you can download it with `docker pull <imagename>`:
@y
Once you've found the image you want, you can download it with `docker pull <imagename>`:
@z

@x
```console
$ docker pull centos
@y
```console
$ docker pull centos
@z

@x
latest: Pulling from centos
6941bfcbbfca: Pull complete
41459f052977: Pull complete
fd44297e2ddb: Already exists
centos:latest: The image you are pulling has been verified. Important: image verification is a tech preview feature and should not be relied on to provide security.
Digest: sha256:d601d3b928eb2954653c59e65862aabb31edefa868bd5148a41fa45004c12288
Status: Downloaded newer image for centos:latest
```
@y
latest: Pulling from centos
6941bfcbbfca: Pull complete
41459f052977: Pull complete
fd44297e2ddb: Already exists
centos:latest: The image you are pulling has been verified. Important: image verification is a tech preview feature and should not be relied on to provide security.
Digest: sha256:d601d3b928eb2954653c59e65862aabb31edefa868bd5148a41fa45004c12288
Status: Downloaded newer image for centos:latest
```
@z

@x
You now have an image from which you can run containers.
@y
You now have an image from which you can run containers.
@z

@x
## Star repositories
@y
## Star repositories
@z

@x
Stars are a way to show that you like a repository. They're also an easy way of bookmarking your favorites.
@y
Stars are a way to show that you like a repository. They're also an easy way of bookmarking your favorites.
@z
