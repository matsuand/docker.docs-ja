%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Language-specific guides overview
keywords: guides, docker, language, node, java, python, go, golang, .net
title: Language-specific guides overview
toc_min: 1
toc_max: 2
---
@y
---
description: 言語別ガイドの概要。
keywords: guides, docker, language, node, java, python, go, golang, .net
title: 言語別ガイドの概要
toc_min: 1
toc_max: 2
---
@z

@x
The language-specific guides walk you through the process of:
* Containerizing language-specific applications
* Setting up a development environment
* Configuring a CI/CD pipeline
* Deploying an application locally using Kubernetes
@y
この言語別ガイドでは、以下に示す作業を進めていきます。
* その言語によるアプリケーションをコンテナー化します。
* 開発環境を構築します。
* CI/CD パイプラインを設定します。
* Kubernetes を使ってローカル内でアプリケーションをデプロイします。
@z

@x
In addition to the language-specific modules, Docker documentation also provides guidelines to build images and efficiently manage your development environment. For more information, refer to the following topics:
@y
プログラミング言語に特有の情報に加えて、この Docker ドキュメントでは開発環境の構築および効率的な管理方法についてのガイドも示します。
詳しくは以下のトピックを参照してください。
@z

@x
* [Best practices for writing Dockerfiles](../develop/develop-images/dockerfile_best-practices.md)
* [Docker development best practices](../develop/dev-best-practices.md)
* [Build images with BuildKit](../build/buildkit/index.md#getting-started)
* [Build with Docker](../build/guide/_index.md)
@y
* [Dockerfile 記述のベストプラクティス](../develop/develop-images/dockerfile_best-practices.md)
* [Docker 開発のベストプラクティス](../develop/dev-best-practices.md)
* [BuildKit を使ったイメージビルド](../build/buildkit/index.md#getting-started)
* [Docker を使ったビルド](../build/guide/_index.md)
@z

@x
## Language-specific guides
@y
## 言語別ガイド {#language-specific-guides}
@z

@x
Learn how to containerize your applications and start developing using Docker. Choose one of the following languages to get started.
@y
Docker を使ったアプリケーションのコンテナー化を学び、開発を進めていきます。
以下の中から、はじめてみたいプログラミング言語を選んでください。
@z

@x
<div class="grid grid-cols-3 auto-rows-fr sm:flex-col sm:h-auto gap-4">
    <div class="flex items-center flex-1 shadow p-4">
        <a href="/language/nodejs/"><img class="m-auto rounded" src="/language/images/nodejs.webp" alt="Develop with Node"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="/language/python/"><img class="m-auto rounded" src="/language/images/python.webp" alt="Develop with Python"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="/language/java/"><img class="m-auto rounded" src="/language/images/java.webp" alt="Develop with Java"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="/language/golang/"><img class="m-auto rounded" src="/language/images/golang.webp" alt="Develop with Go"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="/language/dotnet/"><img class="m-auto rounded" src="/language/images/c-sharp.webp" alt="Develop with C#"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="/language/rust/"><img class="m-auto rounded" src="/language/images/rust-logo.webp" alt="Develop with Rust"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="/language/php/"><img class="m-auto rounded" src="/language/images/php-logo.webp" alt="Develop with PHP"></a>
    </div>
</div>
@y
<div class="grid grid-cols-3 auto-rows-fr sm:flex-col sm:h-auto gap-4">
    <div class="flex items-center flex-1 shadow p-4">
        <a href="__SUBDIR__/language/nodejs/"><img class="m-auto rounded" src="__SUBDIR__/language/images/nodejs.webp" alt="Develop with Node"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="__SUBDIR__/language/python/"><img class="m-auto rounded" src="__SUBDIR__/language/images/python.webp" alt="Develop with Python"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="__SUBDIR__/language/java/"><img class="m-auto rounded" src="__SUBDIR__/language/images/java.webp" alt="Develop with Java"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="__SUBDIR__/language/golang/"><img class="m-auto rounded" src="__SUBDIR__/language/images/golang.webp" alt="Develop with Go"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="__SUBDIR__/language/dotnet/"><img class="m-auto rounded" src="__SUBDIR__/language/images/c-sharp.webp" alt="Develop with C#"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="__SUBDIR__/language/rust/"><img class="m-auto rounded" src="__SUBDIR__/language/images/rust-logo.webp" alt="Develop with Rust"></a>
    </div>
    <div class="flex items-center flex-1 shadow p-4">
        <a href="__SUBDIR__/language/php/"><img class="m-auto rounded" src="__SUBDIR__/language/images/php-logo.webp" alt="Develop with PHP"></a>
    </div>
</div>
@z
