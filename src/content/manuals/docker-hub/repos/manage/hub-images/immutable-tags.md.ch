%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn about immutable tags and how they help maintain image version consistency on Docker Hub.
keywords: Docker Hub, Hub, repository content, tags, immutable tags, version control
title: Immutable tags on Docker Hub
linkTitle: Immutable tags
@y
description: Learn about immutable tags and how they help maintain image version consistency on Docker Hub.
keywords: Docker Hub, Hub, repository content, tags, immutable tags, version control
title: Docker Hub における不変タグ
linkTitle: 不変タグ
@z

@x
{{< summary-bar feature_name="Immutable tags" >}}
@y
{{< summary-bar feature_name="Immutable tags" >}}
@z

@x
Immutable tags provide a way to ensure that specific image versions remain unchanged once they are published to Docker Hub. This feature helps maintain consistency and reliability in your container deployments by preventing accidental overwrites of important image versions.
@y
不変タグ (immutable tags) は、Docker Hub にイメージを公開した後においても、特定のバージョンを不変のまま保つための手段を提供するものです。
この機能は、意図せずに重要な特定バージョンのイメージを上書きしてしまうことを防止することで、コンテナーデプロイ作業の一貫性と信頼性を維持します。
@z

@x
## What are immutable tags?
@y
## 不変タグとは何か {#what-are-immutable-tags}
@z

@x
Immutable tags are image tags that, once pushed to Docker Hub, cannot be overwritten or deleted. This ensures that a specific version of an image remains exactly the same throughout its lifecycle, providing:
@y
不変タグとはイメージタグの一種であって、Docker Hub にプッシュされた後は、上書きや削除ができなくなるものです。
特定バージョンのイメージを、そのライフサイクルを通して同一のものとして保持し続けるものです。
そして以下を提供します。
@z

@x
- Version consistency
- Reproducible builds
- Protection against accidental overwrites
- Better security and compliance
@y
- バージョンの一貫性
- 再ビルド
- 予期しない上書きの防止
- セキュリティとコンプライアンスの向上
@z

@x
## Enable immutable tags
@y
## 不変タグの有効化 {#enable-immutable-tags}
@z

@x
To enable immutable tags for your repository:
@y
リポジトリに対して不変タグ機能を有効にするには以下を行います。
@z

@x
1. Sign in to [Docker Hub](https://hub.docker.com).
2. Select **My Hub** > **Repositories**.
3. Select the repository where you want to enable immutable tags.
4. Go to **Settings** > **General**.
5. Under **Tag mutability settings**, select one of the following options:
   - **All tags are mutable (Default)**:  
     Tags can be changed to reference a different image. This lets you retarget a tag without creating a new one.
   - **All tags are immutable**:  
     Tags cannot be updated to point to a different image after creation. This ensures consistency and prevents accidental changes. This includes the `latest` tag.
   - **Specific tags are immutable**:  
     Define specific tags that cannot be updated after creation using regex values.
6. Select **Save**.
@y
1. [Docker Hub](https://hub.docker.com) にサインインします。
2. **My Hub** > **Repositories** を選びます。
3. 不変タグを有効にしたいリポジトリを選びます。
4. **Settings** > **General** を開きます。
5. **Tag mutability settings** (タグの変更設定) において、以下のいずれかのオプションを選びます。
   - **All tags are mutable (Default)** (全タグを変更可能 (デフォルト)):  
     どのタグも、別イメージへの参照を行うような変更を可能とします。
     この場合、イメージを新たに生成することなくタグの参照先を変更することができます。
   - **All tags are immutable** (全タグの変更不可):  
     既に生成済みの別イメージに対して、タグを更新してそのイメージを指し示すような変更はできません。
     これによって一貫性を確保し、意図しない変更を防止します。
     ここには `latest` タグも含まれます。
   - **Specific tags are immutable** (特定タグの変更不可):  
     イメージ生成後に変更を不可とするタグを指定します。
     その際には正規表現による指定が可能です。
6. **Save** を選びます。
@z

@x
Once enabled, all tags are locked to their specific images, ensuring that each tag always points to the same image version and cannot be modified.
@y
本機能を有効化すると、特定のイメージに対応するタグがすべてロックされます。
そして各タグは同一イメージバージョンを常に指し示すものとなり、修正することはできなくなります。
@z

@x
> [!NOTE]
> This implementation of regular expressions follows the [Go regexp package](https://pkg.go.dev/regexp), which is based on the RE2 engine. For more information, visit [RE2 Regular Expression Syntax](https://github.com/google/re2/wiki/Syntax).
@y
> [!NOTE]
> その正規表現機能の実装は [Go 言語の regexp ぱっけーい](https://pkg.go.dev/regexp) に準拠しています。
> これは RE2 エンジンに基づいています。
> 詳細は [RE2 正規表現文法](https://github.com/google/re2/wiki/Syntax) を参照してください。
@z

@x
## Working with immutable tags
@y
## 不変タグの活用 {#working-with-immutable-tags}
@z

@x
When immutable tags are enabled:
@y
不変タグを有効化したら以下の点に留意します。
@z

@x
- You cannot push a new image with the same tag name
- You must use a new tag name for each new image version
@y
- 新たなイメージのプッシュにあたって、同一のタグ名を用いることはできません。
- 新たなイメージバージョンについては、常に新しいタグ名を用いなければなりません。
@z

@x
To push an image, create a new tag for your updated image and push it to the repository.
@y
更新したイメージをプッシュする際には、新たなタグを生成してリポジトリにプッシュすることになります。
@z
