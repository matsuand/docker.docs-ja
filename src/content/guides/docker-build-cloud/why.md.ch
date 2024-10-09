%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Why Docker Build Cloud?
description: Learn how Docker Build Cloud makes your builds faster.
@y
title: なぜ Docker Build Cloud なのか？
description: Docker Build Cloud がいかにビルドを早めるのかについて学びます。
@z

@x
Docker Build Cloud is a service that lets you build container images faster,
both locally and in CI. Builds run on cloud infrastructure optimally
dimensioned for your workloads, with no configuration required. The service
uses a remote build cache, ensuring fast builds anywhere and for all team
members.
@y
Docker Build Cloud はコンテナーイメージのビルドを早めるためのサービスです。
これはローカル環境でも CI でも動作します。
ビルド処理は作業内容に最適化された上でクラウドインフラストラクチャー上で実行されます。
その際の設定は不要です。
このサービスではリモート内でのビルドキャッシュを利用して、どこからでも、またどの開発チームメンバーに対しても高速なビルドを保証します。
@z

@x
Docker Build Cloud provides several benefits over local builds:
@y
Docker Build Cloud はローカルビルドに比べていくつもの利点があります。
@z

@x
- Improved build speed
- Shared build cache
- Native multi-platform builds
@y
- ビルド速度の改善
- ビルドキャッシュの共有
- マルチプラットフォームのネイティブビルド
@z

@x
There’s no need to worry about managing builders or infrastructure — simply
connect to your builders and start building. Each cloud builder provisioned to
an organization is completely isolated to a single Amazon EC2 instance, with a
dedicated EBS volume for build cache and encryption in transit. That means
there are no shared processes or data between cloud builders.
@y
ビルダーやインフラストラクチャーの管理に関して気にかける必要はありません。
手元のビルダーに単に接続してビルドを開始するだけです。
開発組織に提供されるクラウドビルダーは、個々に単独の Amazon EC2 インスタンスとして独立しており、ビルドキャッシュは専用の EBS を利用し、転送処理は暗号化されます。
これはつまりクラウドビルダー間でのプロセスやデータの共有はないことを意味します。
@z

@x
{{< youtube-embed "8AqKhEO2PQA" >}}
@y
{{< youtube-embed "8AqKhEO2PQA" >}}
@z

@x
<div id="dbc-lp-survey-anchor"></div>
@y
<div id="dbc-lp-survey-anchor"></div>
@z
