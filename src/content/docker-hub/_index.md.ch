%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
@x
---
description: Learn about Docker Hub features and the administrative tasks available
  in Docker Hub
keywords: Docker, docker, docker hub, hub, repositories, docker account
title: Overview of Docker Hub
grid:
- title: Create a Docker ID
  description: Register and create a new Docker ID.
  icon: fingerprint
  link: /docker-id
- title: Quickstart
  description: Step-by-step instructions on getting started on Docker Hub.
  icon: explore
  link: /docker-hub/quickstart
- title: Create a repository
  description: Create a repository to share your images with your team, customers,
    or the Docker community.
  icon: inbox
  link: /docker-hub/repos
- title: Manage repository access
  description: Manage access to push and pull to your repository and assign permissions.
  icon: key
  link: /docker-hub/repos/access
- title: Automated builds
  description: Learn how you can automatically build images from source code to push to your repositories.
  icon: build
  link: /docker-hub/builds/how-builds-work
- title: Release notes
  description: Find out about new features, improvements, and bug fixes.
  icon: note_add
  link: /docker-hub/release-notes
---
@y
---
description: Learn about Docker Hub features and the administrative tasks available
  in Docker Hub
keywords: Docker, docker, docker hub, hub, repositories, docker account
title: Docker Hub 概要
grid:
- title: Docker ID の生成
  description: 新規 Docker ID を生成登録します。
  icon: fingerprint
  link: __SUBDIR__/docker-id
- title: クィックスタート
  description: Docker Hub をつかった手順を一つひとつ説明します。
  icon: explore
  link: __SUBDIR__/docker-hub/quickstart
- title: リポジトリの生成
  description: 生成したリポジトリを開発チーム、顧客、Docker コミュニティと共有します。
  icon: inbox
  link: __SUBDIR__/docker-hub/repos
- title: リポジトリのアクセス管理
  description: Manage access to push and pull to your repository and assign permissions.
  icon: key
  link: __SUBDIR__/docker-hub/repos/access
- title: 自動ビルド
  description: Learn how you can automatically build images from source code to push to your repositories.
  icon: build
  link: __SUBDIR__/docker-hub/builds/how-builds-work
- title: リリースノート
  description: 新機能、改善、バグフィックスを確認します。
  icon: note_add
  link: __SUBDIR__/docker-hub/release-notes
---
@z

@x
Docker Hub is a service provided by Docker for finding and sharing container images.
@y
Docker Hub は Docker が提供するサービスであり、コンテナーイメージの検索と共有を行います。
@z

@x
It's the world’s largest repository of container images with an array of content sources including container community developers, open source projects, and independent software vendors (ISV) building and distributing their code in containers.
@y
これは世界最大のコンテナーイメージのリポジトリであり、コンテナーコミュニティの開発者、オープンソースプロジェクトや独立系ソフトウェアベンダー（independent software vendors; ISV）が、コンテナー内でのソースビルドと配布を行うコンテンツを提供しています。
@z

@x
Docker Hub is also where you can go to [change your Docker account settings and carry out administrative tasks](/admin/). If you have a Docker Team or Business subscription, you can also carry out administrative tasks in the [Docker Admin Console](https://admin.docker.com).
@y
Docker Hub is also where you can go to [change your Docker account settings and carry out administrative tasks](/admin/). If you have a Docker Team or Business subscription, you can also carry out administrative tasks in the [Docker Admin Console](https://admin.docker.com).
@z

@x
{{< tabs >}}
{{< tab name="What key features are included in Docker Hub?" >}}
* [Repositories](../docker-hub/repos/index.md): Push and pull container images.
* [Builds](builds/index.md): Automatically build container images from
GitHub and Bitbucket and push them to Docker Hub.
* [Webhooks](webhooks.md): Trigger actions after a successful push
  to a repository to integrate Docker Hub with other services.
* [Docker Hub CLI](https://github.com/docker/hub-tool#readme) tool (currently experimental) and an API that allows you to interact with Docker Hub.
  * Browse through the [Docker Hub API](/docker-hub/api/latest/) documentation to explore the supported endpoints.
{{< /tab >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub の主要機能は何か" >}}
* [リポジトリ](../docker-hub/repos/index.md): コンテナーイメージをプッシュおよびプルします。
* [ビルド](builds/index.md): GitHub や Bitbucket にあるコンテナーイメージをを自動ビルドして Docker Hub にプッシュします。
* [ウェブフック](webhooks.md): Trigger actions after a successful push
  to a repository to integrate Docker Hub with other services.
* [Docker Hub CLI](https://github.com/docker/hub-tool#readme) tool (currently experimental) and an API that allows you to interact with Docker Hub.
  * Browse through the [Docker Hub API](/docker-hub/api/latest/) documentation to explore the supported endpoints.
{{< /tab >}}
@z

@x
{{< tab name="What administrative tasks can I perform in Docker Hub?" >}}
* [Create and manage teams and organizations](orgs.md)
* [Create a company](../admin/company/new-company.md)
* [Enforce sign in](configure-sign-in.md)
* Set up [SSO](../security/for-admins/single-sign-on/index.md) and [SCIM](../security/for-admins/scim.md)
* Use [Group mapping](group-mapping.md)
* [Carry out domain audits](domain-audit.md)
* [Use Image Access Management](image-access-management.md) to control developers' access to certain types of images
* [Turn on Registry Access Management](../security/for-admins/registry-access-management.md)
{{< /tab >}}
{{< /tabs >}}
@y
{{< tab name="What administrative tasks can I perform in Docker Hub?" >}}
* [Create and manage teams and organizations](orgs.md)
* [Create a company](../admin/company/new-company.md)
* [Enforce sign in](configure-sign-in.md)
* Set up [SSO](../security/for-admins/single-sign-on/index.md) and [SCIM](../security/for-admins/scim.md)
* Use [Group mapping](group-mapping.md)
* [Carry out domain audits](domain-audit.md)
* [Use Image Access Management](image-access-management.md) to control developers' access to certain types of images
* [Turn on Registry Access Management](../security/for-admins/registry-access-management.md)
{{< /tab >}}
{{< /tabs >}}
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
