%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Demo: Using Docker Build Cloud in CI"
description: Learn how to use Docker Build Cloud to build your app faster in CI.
@y
title: "デモ: CI での Docker Build Cloud の利用"
description: Docker Build Cloud を使って CI 上においてアプリビルドをすばやく行う方法を学びます。
@z

@x
Docker Build Cloud can significantly decrease the time it takes for your CI builds
take to run, saving you time and money. 
@y
Docker Build Cloud を用いると CI ビルドに要する時間を大幅に短縮できます。
それはつまり時間とコストを削減できることを意味します。
@z

@x
Since the builds run remotely, your CI runner can still use the Docker tooling CLI
without needing elevated permissions, making your builds more secure by default.
@y
ビルド処理はリモートにおいて行われるため、手元において実行する CI は Docker CLI を特別な実行権限を必要とせずに利用可能です。
デフォルトにおいてビルド処理はよりセキュアに実現できます。
@z

@x
In this demo, you will see:
@y
このデモでは以下を見ていきます。
@z

@x
- How to integrate Docker Build Cloud into a variety of CI platforms
- How to use Docker Build Cloud in GitHub Actions to build multi-architecture images
- Speed differences between a workflow using Docker Build Cloud and a workflow running natively
- How to use Docker Build Cloud in a GitLab Pipeline
@y
- Docker Build Cloud をさまざまな CI プラットフォームに統合していく方法
- GitHub Actions 内での Docker Build Cloud によりマルチアーキテクチャーイメージをビルドしていく方法
- Docker Build Cloud を用いた場合とネイティブに実行した場合におけるワークフロー速度の違い
- GitLab パイプラインでの Docker Build Cloud の利用方法
@z

@x
{{< youtube-embed "wvLdInoVBGg" >}}
@y
{{< youtube-embed "wvLdInoVBGg" >}}
@z

@x
<div id="dbc-lp-survey-anchor"></div>
@y
<div id="dbc-lp-survey-anchor"></div>
@z
