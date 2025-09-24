%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: Learn how to create a repository on Docker Hub
keywords: Docker Hub, Hub, repositories, create
title: Create a repository
linkTitle: Create
@y
description: Learn how to create a repository on Docker Hub
keywords: Docker Hub, Hub, repositories, create
title: Create a repository
linkTitle: Create
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. Near the top-right corner, select **Create repository**.
4. Select a **Namespace**.
@y
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. Near the top-right corner, select **Create repository**.
4. Select a **Namespace**.
@z

@x
   You can choose to locate it under your own user account, or under any
   organization where you are an owner or editor.
@y
   You can choose to locate it under your own user account, or under any
   organization where you are an owner or editor.
@z

@x
5. Specify the **Repository Name**.
@y
5. Specify the **Repository Name**.
@z

@x
   The repository name needs to:
    - Be unique
    - Have between 2 and 255 characters
    - Only contain lowercase letters, numbers, hyphens (`-`), and underscores
      (`_`)
@y
   The repository name needs to:
    - Be unique
    - Have between 2 and 255 characters
    - Only contain lowercase letters, numbers, hyphens (`-`), and underscores
      (`_`)
@z

@x
   > [!NOTE]
   >
   > You can't rename a Docker Hub repository once it's created.
@y
   > [!NOTE]
   >
   > You can't rename a Docker Hub repository once it's created.
@z

@x
6. Specify the **Short description**.
@y
6. Specify the **Short description**.
@z

@x
   The description can be up to 100 characters. It appears in search results.
@y
   The description can be up to 100 characters. It appears in search results.
@z

@x
7. Select the default visibility.
@y
7. Select the default visibility.
@z

@x
   - **Public**: The repository appears in Docker Hub search results and can be
     pulled by everyone.
   - **Private**: The repository doesn't appear in Docker Hub search results and
     is only accessible to you and collaborators. In addition, if you selected
     an organization's namespace, then the repository is accessible to those
     with applicable roles or permissions. For more details, see [Roles and
     permissions](/manuals/enterprise/security/roles-and-permissions.md).
@y
   - **Public**: The repository appears in Docker Hub search results and can be
     pulled by everyone.
   - **Private**: The repository doesn't appear in Docker Hub search results and
     is only accessible to you and collaborators. In addition, if you selected
     an organization's namespace, then the repository is accessible to those
     with applicable roles or permissions. For more details, see [Roles and
@z

@x
   > [!NOTE]
   >
   > For organizations creating a new repository, if you're unsure which
   > visibility to choose, then Docker recommends that you select **Private**.
@y
   > [!NOTE]
   >
   > For organizations creating a new repository, if you're unsure which
   > visibility to choose, then Docker recommends that you select **Private**.
@z

@x
8. Select **Create**.
@y
8. Select **Create**.
@z

@x
After the repository is created, the **General** page appears. You are now able to manage:
@y
After the repository is created, the **General** page appears. You are now able to manage:
@z

@x
- [Repository information](./manage/information.md)
- [Access](./manage/access.md)
- [Images](./manage/hub-images/_index.md)
- [Automated builds](./manage/builds/_index.md)
- [Webhooks](./manage/webhooks.md)
- [Image security insights](./manage/vulnerability-scanning.md)
@y
- [Repository information](./manage/information.md)
- [Access](./manage/access.md)
- [Images](./manage/hub-images/_index.md)
- [Automated builds](./manage/builds/_index.md)
- [Webhooks](./manage/webhooks.md)
- [Image security insights](./manage/vulnerability-scanning.md)
@z
