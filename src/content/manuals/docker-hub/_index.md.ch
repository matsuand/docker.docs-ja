%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
description: Find a comprehensive overview of Docker Hub, including its features, administrative settings, how to get started quickly, and more
keywords: Docker, docker, docker hub, hub, repositories, docker account
title: Overview of Docker Hub
@y
description: Find a comprehensive overview of Docker Hub, including its features, administrative settings, how to get started quickly, and more
keywords: Docker, docker, docker hub, hub, repositories, docker account
title: Docker Hub 概要
@z

% grid:

@x
- title: Quickstart
  description: Step-by-step instructions on getting started on Docker Hub.
  icon: explore
  link: /docker-hub/quickstart
@y
- title: クィックスタート
  description: Docker Hub をつかった手順を一つひとつ説明します。
  icon: explore
  link: __SUBDIR__/docker-hub/quickstart
@z

@x
- title: Create a repository
  description: Create a repository to share your images with your team, customers,
    or the Docker community.
  icon: inbox
  link: /docker-hub/repos
@y
- title: リポジトリの生成
  description: 生成したリポジトリを開発チーム、顧客、Docker コミュニティと共有します。
  icon: inbox
  link: __SUBDIR__/docker-hub/repos
@z

@x
- title: Manage repository access
  description: Manage access to push and pull to your repository and assign permissions.
  icon: key
  link: /docker-hub/repos/access
@y
- title: リポジトリのアクセス管理
  description: リポジトリとのプッシュ、プルを行うためのアクセス管理と権限割り当てを行います。
  icon: key
  link: __SUBDIR__/docker-hub/repos/access
@z

@x
- title: Automated builds
  description: Learn how you can automatically build images from source code to push to your repositories.
  icon: build
  link: /docker-hub/builds/how-builds-work
@y
- title: 自動ビルド
  description: ソースコードからイメージを自動ビルドしてリポジトリにプッシュする方法を学びます。
  icon: build
  link: __SUBDIR__/docker-hub/builds/how-builds-work
@z

@x
- title: Release notes
  description: Find out about new features, improvements, and bug fixes.
  icon: note_add
  link: /docker-hub/release-notes
---
@y
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

@x __SUBDIR__ 対応
Docker Hub is also where you can go to [carry out administrative tasks for organizations](/admin/). If you have a Docker Team or Business subscription, you can also carry out administrative tasks in the [Docker Admin Console](https://admin.docker.com).
@y
Docker Hub はまた、[組織に関する管理タスクの実行](__SUBDIR__/admin/) 場所でもあります。
Docker チームに参加、または Business サブスクリプションを購入している場合は [Docker 管理コンソール](https://admin.docker.com) において管理タスクを実行することもできます。
@z

@x __SUBDIR__ 対応
{{< tabs >}}
{{< tab name="What key features are included in Docker Hub?" >}}
* [Repositories](../docker-hub/repos/_index.md): Push and pull container images.
* [Builds](builds/_index.md): Automatically build container images from
GitHub and Bitbucket and push them to Docker Hub.
* [Webhooks](webhooks.md): Trigger actions after a successful push
  to a repository to integrate Docker Hub with other services.
* [Docker Hub CLI](https://github.com/docker/hub-tool#readme) tool (currently experimental) and an API that allows you to interact with Docker Hub.
  * Browse through the [Docker Hub API](/reference/api/hub/latest/) documentation to explore the supported endpoints.
{{< /tab >}}
@y
{{< tabs >}}
{{< tab name="Docker Hub の主要機能は何か" >}}
* [リポジトリ](../docker-hub/repos/_index.md): コンテナーイメージをプッシュおよびプルします。
* [ビルド](builds/_index.md): GitHub や Bitbucket にあるコンテナーイメージをを自動ビルドして Docker Hub にプッシュします。
* [ウェブフック](webhooks.md): リポジトリへのプッシュが正常終了した際にアクションを起動することで、Docker Hub と他サービスの統合を図ります。
* [Docker Hub CLI](https://github.com/docker/hub-tool#readme) ツール (現時点は試験的な提供) と API により、Docker Hub との対話処理を実現します。
  * [Docker Hub API](__SUBDIR__//reference/api/hub/latest/) ドキュメントを一とおり見てみることで、サポートされているエンドポイントを確認します。
{{< /tab >}}
@z

@x
{{< tab name="What administrative tasks can I perform in Docker Hub?" >}}
* [Create and manage teams and organizations](orgs.md)
* [Create a company](../admin/company/new-company.md)
* [Enforce sign in](../security/for-admins/enforce-sign-in/_index.md)
* Set up [SSO](../security/for-admins/single-sign-on/_index.md) and [SCIM](../security/for-admins/provisioning/scim.md)
* Use [Group mapping](group-mapping.md)
* [Carry out domain audits](domain-audit.md)
* [Use Image Access Management](/manuals/security/for-admins/hardened-desktop/image-access-management.md) to control developers' access to certain types of images
* [Turn on Registry Access Management](/manuals/security/for-admins/hardened-desktop/registry-access-management.md)
{{< /tab >}}
{{< /tabs >}}
@y
{{< tab name="Docker Hub ではどんな管理タスクが実行できるか" >}}
* [チームや組織の生成と管理](orgs.md)
* [企業の生成](../admin/company/new-company.md)
* [サインインの強制](../security/for-admins/enforce-sign-in/_index.md)
* [SSO](../security/for-admins/single-sign-on/_index.md) と [SCIM](../security/for-admins/provisioning/scim.md) のセットアップ
* [グループマッピング](group-mapping.md) の利用
* [ドメイン監査の実行](domain-audit.md)
* [イメージアクセス管理の利用](manuals/security/for-admins/hardened-desktop/image-access-management.md) による特定タイプのイメージに対する開発者アクセス制御
* [レジストリアクセス管理の有効化](manuals/security/for-admins/hardened-desktop/registry-access-management.md)
{{< /tab >}}
{{< /tabs >}}
@z

@x
{{< grid >}}
@y
{{< grid >}}
@z
