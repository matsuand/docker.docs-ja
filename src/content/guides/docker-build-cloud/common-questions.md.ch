%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Common challenges and questions
description: Explore common challenges and questions related to Docker Build Cloud.
@y
title: 共通する課題や質問
description: Docker Build Cloud に関して共通する課題や質問を確認します。
@z

@x
### Is Docker Build Cloud a standalone product or a part of Docker Desktop?
@y
### Docker Build Cloud は標準製品なのか Docker Desktop の一部なのか？ {#is-docker-build-cloud-a-standalone-product-or-a-part-of-docker-desktop}
@z

@x
Docker Build Cloud is a service that can be used both with Docker Desktop and
standalone. It lets you build your container images faster, both locally and in
CI, with builds running on cloud infrastructure. The service uses a remote
build cache, ensuring fast builds anywhere and for all team members.
@y
Docker Build Cloud は Docker Desktop においても、また単独でも利用できるサービスです。
これによってコンテナーイメージのビルドがより早くなり、クラウドインフラストラクチャー内で処理されるので、ローカルでも CI 内でも同じです。
このサービスではリモートにあるビルドキャッシュを利用します。
したがってどこからでも、またどの開発チームメンバーに対しても高速なビルドを保証します。
@z

@x
When used with Docker Desktop, the [Builds view](/desktop/use-desktop/builds/)
works with Docker Build Cloud out-of-the-box. It shows information about your
builds and those initiated by your team members using the same builder,
enabling collaborative troubleshooting.
@y
Docker Desktop とともに利用している場合は [Builds 画面](__SUBDIR__/desktop/use-desktop/builds/) から Docker Build Cloud は簡単に確認することができます。
同一のビルダーを使って自身や他の開発メンバーが実行したビルドの情報を確認することができ、共同して問題解決に当たることができます。
@z

@x
To use Docker Build Cloud without Docker Desktop, you must
[download and install](/build-cloud/setup/#use-docker-build-cloud-without-docker-desktop)
a version of Buildx with support for Docker Build Cloud (the `cloud` driver).
If you plan on building with Docker Build Cloud using the `docker compose
build` command, you also need a version of Docker Compose that supports Docker
Build Cloud.
@y
Docker Desktop をなしにして Docker Build Cloud を利用する場合は、Docker Build Cloud (`cloud` ドライバー) に対応している Buildx バージョンを [ダウンロードおよびインストール](__SUBDIR__/build-cloud/setup/#use-docker-build-cloud-without-docker-desktop) する必要があります。
`docker compose build` コマンドを使って Docker Build Cloud によるビルドを行おうとする場合は、同じように Docker Build Cloud に対応している Docker Compose バージョンを必要とします。
@z

@x
### How does Docker Build Cloud work with Docker Compose?
@y
### Docker Compose とともに用いた場合に Docker Build Cloud はどのように動作するのか？ {#how-does-docker-build-cloud-work-with-docker-compose}
@z

@x
Docker Compose works out of the box with Docker Build Cloud. Install the Docker
Build Cloud-compatible client (buildx) and it works with both commands.
@y
Docker Compose では Docker Build Cloud を簡単に利用することができます。
Docker Build Cloud 互換のクライアント (buildx) をインストールすれば、どちらのコマンドも動作することになります。
@z

@x
### How many minutes are included in Docker Build Cloud Team plans?
@y
### Docker Build Cloud チームプランでは何分まで実行できるか？ {#how-many-minutes-are-included-in-docker-build-cloud-team-plans}
@z

@x
Pricing details for Docker Build Cloud can be found on the [pricing page](https://www.docker.com/pricing/).
@y
Docker Build Cloud の価格については [価格のページ](https://www.docker.com/pricing/) を参照してください。
@z

@x
### I’m a Docker personal user. Can I try Docker Build Cloud?
@y
### 個人ユーザーは Docker Build Cloud を試すことができるのか？ {#im-a-docker-personal-user-can-i-try-docker-build-cloud}
@z

@x
Docker subscribers (Pro, Team, Business) receive a set number of minutes each
month, shared across the account, to use Build Cloud.
@y
Docker 購入者 (Pro, Team, Business) は Build Cloud を利用するために、複数アカウントにわたって共有できる所定時間が与えられます。
@z

@x
If you do not have a Docker subscription, you may sign up for a free Personal
account and start a trial of Docker Build Cloud. Personal accounts are limited to a
single user.
@y
Docker 購入者でない場合には、無償の個人アカウントにサインアップすれば、Docker Build Cloud のトライアル版の利用が可能になります。
個人アカウントは 1 ユーザーに限定されます。
@z

@x
For teams to receive the shared cache benefit, they must either be on a Docker
Team or Docker Business subscription.
@y
チームを通じてキャッシュ共有機能を利用するためには、Docker Team、Docker Business の有償チームサブスクリプションを購入する必要があります。
@z

@x
### Does Docker Build Cloud support CI platforms? Does it work with GitHub Actions?
@y
### Docker Build Cloud は CI プラットフォームをサポートするのか？ GitHub Actions とともに動作するのか？ {#does-docker-build-cloud-support-ci-platforms-does-it-work-with-github-actions}
@z

@x
Yes, Docker Build Cloud can be used with various CI platforms including GitHub
Actions, CircleCI, Jenkins, and others. It can speed up your build pipelines,
which means less time spent waiting and context switching.
@y
答えは「はい」です。
Docker Build Cloud は CI プラットフォームとして GitHub Actions, CircleCI, Jenkins など数多くのものにおいて利用可能です。
これはビルドパイプラインを迅速に処理できるものであり、処理待機時間やコンテキストの切り替えに伴う時間を削減します。
@z

@x
Docker Build Cloud can be used with GitHub Actions to automate your build,
test, and deployment pipeline. Docker provides a set of official GitHub Actions
that you can use in your workflows.
@y
Docker Build Cloud を GitHub Actions において利用すれば、ビルド処理、テスト、開発パイプラインをを自動化できます。
Docker ではユーザーのワークフローにおいて利用可能な公式の GitHub Actions も数多く提供しています。
@z

@x
Using GitHub Actions with Docker Build Cloud is straightforward. With a
one-line change in your GitHub Actions configuration, everything else stays the
same. You don't need to create new pipelines. Learn more in the [CI
documentation](/build-cloud/ci/) for Docker Build Cloud.
@y
Docker Build Cloud に対しての GitHub Actions の利用は、実にわかりやすいものです。
GitHub Actions の設定が 1 行だけ変更されたとしても、その他は変わらずそのままです。
新たにパイプラインを生成する必要などありません。
詳しくは Docker Build Cloud に対応した [CI ドキュメント](__SUBDIR__/build-cloud/ci/) を参照してください。
@z

@x
<div id="dbc-lp-survey-anchor"></div>
@y
<div id="dbc-lp-survey-anchor"></div>
@z
