%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
linktitle: Quickstart
title: Docker Hardened Images quickstart
description: Follow a quickstart guide to explore and run a Docker Hardened Image.
@y
linktitle: クィックスタート
title: Docker Hardened イメージのクィックスタート
description: クィックスタートガイドを通じて Docker Hardened イメージを実行し確認します。
@z

@x
keywords: docker hardened images quickstart, run secure image
@y
keywords: docker hardened images quickstart, run secure image
@z

@x
This guide shows you how to go from zero to running a Docker Hardened Image
(DHI) using a real example. At the end, you'll compare the DHI to a standard
Docker image to better understand the differences. While the steps use a
specific image as an example, they can be applied to any DHI.
@y
本ガイドでは Docker Hardened イメージ (DHI) を使った実際の例を通じて、ゼロからその実行方法について示していきます。
ガイドを終えた時には、DHI こそが標準的な Docker イメージであり、他との違いを充分に理解できるようになります。
各手順においては例として特定のイメージを利用していきますが、どの DHI についても同様に適用できる話です。
@z

@x
> [!NOTE]
>
> Docker Hardened Images are freely available to everyone with no subscription
> required, no usage restrictions, and no vendor lock-in. You can upgrade to a
> DHI Enterprise subscription when you require enterprise features like FIPS or
> STIG compliance variants, customization capabilities, or SLA-backed support.
@y
> [!NOTE]
>
> Docker Hardened イメージは無償利用が可能になりました。
> これはサブスクリプション購入を必要とせず、利用制限やベンダーロックインもありません。
> FIPS や STIG などのコンプライアンスへの準拠、カスタマイズ機能、SLA ベースのサポートといったエンタープライズ機能を必要とする場合は DHI エンタープライズサブスクリプションへのアップグレードも可能です。
@z

@x
## Step 1: Find an image to use
@y
## 手順 1: 利用イメージの検索 {#step-1-find-an-image-to-use}
@z

@x
1. Go to the Hardened Images catalog in [Docker
   Hub](https://hub.docker.com/hardened-images/catalog) and sign in.
2. In the left sidebar, select **Hardened Images**. If you have DHI Enterprise,
   then select **Hardened Images** > **Catalog**.
3. Use the search bar or filters to find an image (e.g., `python`, `node`,
   `golang`). For this guide, use the Python image as an example.
4. Select the Python repository to view its details.
@y
1. [Docker Hub](https://hub.docker.com/hardened-images/catalog) 内にある Hardened イメージカタログにアクセスし、サインインします。
2. 左側のサイドバーから **Hardened Images** を選びます。
   DHI エンタープライズを利用している場合は **Hardened Images** > **Catalog** を選びます。
3. 検索バーや検索フィルターを使ってイメージ (`python`, `node`, `golang` など) を検索します。
   本ガイドでは例として Python イメージを用いることにします。
4. Python リポジトリを選択すれば、その詳細を確認できます。
@z

@x
Continue to the next step to pull and run the image. To dive deeper into exploring
images see [Explore Docker Hardened Images](./how-to/explore.md).
@y
次の手順に進み、イメージをプルして実行します。
イメージ内容をさらに深く確認したい場合は [Docker Hardened イメージの確認](./how-to/explore.md) を参照してください。
@z

@x
## Step 2: Pull and run the image
@y
## 手順 2: イメージのプルと実行 {#step-2-pull-and-run-the-image}
@z

@x
You can pull and run a DHI like any other Docker image. Note that Docker Hardened
Images are designed to be minimal and secure, so they may not include all the
tools or libraries you expect in a typical image. You can view the typical
differences in [Considerations when adopting
DHIs](./how-to/use.md#considerations-when-adopting-dhis).
@y
普通の Docker イメージと同じようにして DHI もプルを行って実行することができます。
なお Docker Hardened イメージは、出来るだけサイズを小さく、そしてセキュアであることを目指して設計されています。
したがってそのイメージには、どのイメージにもありそうなツールやライブラリが含まれていない、ということがあります。
よくありがちな違いについては [DHI 選定の際に考慮すべきこと](./how-to/use.md#considerations-when-adopting-dhis) を確認してください。
@z

@x
> [!TIP]
>
> On every repository page in the DHI catalog, you'll find instructions for
> pulling and scanning the image by selecting **Use this image**.
@y
> [!TIP]
>
> DHI カタログ内にある各リポジトリページでは、**Use this image** を選ぶと、イメージのプルやスキャンの手順を読むことができます。
@z

@x
The following example demonstrates that you can run the Python image and execute
a simple Python command just like you would with any other Docker image:
@y
以下は、Python イメージを起動させて、単純な Python コマンドを実行する例です。
そのコマンドは、他の Docker イメージでも実行している普通のコマンドです。
@z

@x
1. Open a terminal and sign in to the Docker Hardened Images registry using your
   Docker ID credentials.
@y
1. 端末を開いて Docker Hardened イメージのレジストリにサインインします。
   サインインにあたっては Docker ID を利用します。
@z

% snip command...

@x
2. Pull the image:
@y
2. イメージをプルします。
@z

% snip command...

@x
3. Run the image to confirm everything works:
@y
3. イメージを実行して、すべてがうまく動作することを確認します。
@z

% snip command...

@x
    This starts a container from the `python:3.13` image and runs a simple
    Python script that prints `Hello from DHI`.
@y
    上のコマンドは `python:3.13` イメージからコンテナーを起動させ、`Hello from DHI` という文字列を出力する Python コマンドを実行します。
@z

@x
To dive deeper into using images, see:
@y
イメージの利用に関して、さらなる情報は以下を参考にしてください。
@z

@x
- [Use a Docker Hardened Image](./how-to/use.md) for general usage
- [Use in Kubernetes](./how-to/k8s.md) for Kubernetes deployments
- [Use a Helm chart](./how-to/helm.md) for deploying with Helm
@y
- [Docker Hardened イメージの利用](./how-to/use.md) は、全般的な利用方法を説明しています。
- [Kubernetes とともに利用](./how-to/k8s.md) は、Kubernetes デプロイを説明しています。
- [Helm チャートの利用](./how-to/helm.md) は、Helm を使ったデプロイを説明しています。
@z

@x
## Step 3: Compare with the other images
@y
## 手順 3: 他のイメージとの比較 {#step-3-compare-with-the-other-images}
@z

@x
You can quickly compare DHIs with other images to see the security
improvements and differences. This comparison helps you understand the value of
using hardened images.
@y
DHI イメージではセキュリティを改善させています。
そういった違いを通じて、他のイメージと比較して見ることができます。
この比較によって Hardened イメージを利用する意味が理解できるはずです。
@z

@x
Run the following command to see a summary comparison between the Docker
Hardened Image for Python and the non-hardened Docker Official Image for Python
from Docker Hub:
@y
以下のコマンドを実行すると Docker Hardened イメージと、そうではない Docker イメージを比較することができます。
どちらも Docker Hub から取得できるものであり、Python 向けとして作られているものです。
@z

% snip command...

@x
Example output:
@y
出力結果は以下となります。
@z

% snip output...

@x
> [!NOTE]
>
> This is example output. Your results may vary depending on newly discovered
> CVEs and image updates.
>
> Docker maintains near-zero CVEs in Docker Hardened Images. For DHI Enterprise
> subscriptions, when new CVEs are discovered, the CVEs are remediated within
> the industry-leading SLA timeframe. Learn more about the [SLA-backed security
> features](./features.md#sla-backed-security).
@y
> [!NOTE]
>
> これは一つの出力例です。
> 実際の出力結果は、適用された CVE やイメージ更新により変化しているはずです。
>
> Docker では Docker Hardened イメージにおける CVE をほぼゼロにするように保守を行っています。
> DHI エンタープライズサブスクリプションでは、新たな CVE が検出されると、業界最短の SLA 期間内で修復を行います。
> 詳細については [SLA ベースのセキュリティ機能](./features.md#sla-backed-security) を参照してください。
@z

@x
This comparison shows that the Docker Hardened Image:
@y
この比較から Docker Hardened イメージの以下の特徴が分かります。
@z

@x
- Removes vulnerabilities: 1 high, 5 medium, 141 low, and 2 unspecified severity CVEs removed
- Reduces size: From 412 MB down to 35 MB (91% reduction)
- Minimizes packages: From 610 packages down to 80 (87% reduction)
@y
- ぜい弱性の除去: high (高) が 1 個、medium (中間) が 5 個、low (低) が 141 個 を除去、また未特定の重大な CVE 2 個を除去しています。
- サイズの軽減: 412 MB から 35 MB  (91%) にサイズ軽減しています。
- パッケージの削減: 610 パッケージから 80 パッケージ (87%) に削減しています。
@z

@x
To dive deeper into comparing images see [Compare Docker Hardened Images](./how-to/compare.md).
@y
イメージ比較に関しての詳細は [Docker Hardened イメージの比較](./how-to/compare.md) を参照してください。
@z

@x
## What's next
@y
## 次は何？ {#whats-next}
@z

@x
You've pulled and run your first Docker Hardened Image. Here are a few ways to keep going:
@y
Docker Hardened イメージをここで初めてプルし実行してみました。
ここからさらに、以下を進めていきましょう。
@z

@x
- [Migrate existing applications to DHIs](./migration/migrate-with-ai.md): Use
  Docker's AI assistant to update your Dockerfiles to use Docker Hardened Images
  as the base.
@y
- [既存アプリの DHI への移行](./migration/migrate-with-ai.md): Docker AI アシスタントを使って、Dockerfile の書き換えを行い、ベースイメージとして Docker Hardened イメージを用いるようにします。
@z

@x
- [Start a trial](https://hub.docker.com/hardened-images/start-free-trial) to
  explore the benefits of a DHI Enterprise subscription, such as access to FIPS
  and STIG variants, customized images, and SLA-backed updates.
@y
- [トライアルをはじめよう](https://hub.docker.com/hardened-images/start-free-trial) によって DHI エンタープライズサブスクリプションのメリット、すなわち FIPS や STIG 準拠へのアクセス、イメージのカスタマイズ、SLA ベースの更新を確認します。
@z

@x
- [Mirror a repository](./how-to/mirror.md): After subscribing to DHI Enterprise
  or starting a trial, learn how to mirror a DHI repository to enable
  customization, access compliance variants, and get SLA-backed updates.
@y
- [リポジトリのミラー](./how-to/mirror.md): DHI エンタープライズサブスクリプションの購入あるいはトライアルを開始した後は、DHI リポジトリのミラー方法について学びます。
  これを行うことにより、カスタマイズ、コンプライアンス準拠へのアクセス、SLA ベースの更新を可能にします。
@z

@x
- [Verify DHIs](./how-to/verify.md): Use tools like [Docker Scout](/scout/) or
  Cosign to inspect and verify signed attestations, like SBOMs and provenance.
@y
- [DHI の検証](./how-to/verify.md): [Docker Scout](__SUBDIR__/scout/) や Cosign といったツールを使って、SBOM やプロビナンス (provenance) のような署名済み証明書の確認と検証を行います。
@z

@x
- [Scan DHIs](./how-to/scan.md): Analyze the image with Docker
  Scout or other scanners to identify known CVEs.
@y
- [DHI のスキャン](./how-to/scan.md): 既知の CVE を検出できる Docker Scout や他のスキャナーを使って、イメージを分析します。
@z
