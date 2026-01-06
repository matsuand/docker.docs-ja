%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x enableGitInfo to false
title: Docker Docs
baseURL: https://docs.docker.com
refLinksErrorLevel: ERROR
enableGitInfo: true
disablePathToLower: true
enableInlineShortcodes: true
@y
title: Docker Docs
baseURL: https://docs.docker.com
canonicalURLs: true
refLinksErrorLevel: ERROR
enableGitInfo: false
disablePathToLower: true
enableInlineShortcodes: true
ignoreFiles:
  - Makefile$
  - Makefile\.sub$
  - copyfiles\.sub$
defaultContentLanguage: ja
languageCode: ja
@z

@x
languages:
  en:
    languageName: English
@y
languages:
  ja:
    languageName: 日本語
@z

@x
  repo: https://github.com/docker/docs
@y
  repo: https://github.com/docker/docs
@z

------------------------------
suburldir 追加
------------------------------
@x
  example_node_version: "20"
@y
  example_node_version: "20"

  suburldir: /docker.docs-ja
@z

------------------------------
日本語訳化
------------------------------
@x
menus:
  # Site header menu
  main:
  - name: Get started
    pageRef: /get-started/
    weight: 1
  - name: Guides
    pageRef: /guides/
    weight: 2
  - name: Manuals
    pageRef: /manuals/
    weight: 3
  - name: Reference
    pageRef: /reference/
    weight: 4
@y
menus:
  # Site header menu
  main:
  - name: はじめよう
    pageRef: /get-started/
    weight: 1
  - name: ガイド
    pageRef: /guides/
    weight: 2
  - name: マニュアル
    pageRef: /manuals/
    weight: 3
  - name: リファレンス
    pageRef: /reference/
    weight: 4
@z

------------------------------
日本語訳化
------------------------------
@x
  footer:
    - url: https://www.docker.com/products
      name: Product offerings
    - url: https://www.docker.com/products/personal
      name: Docker Personal
      parent: Product offerings
    - url: https://www.docker.com/products/pro
      name: Docker Pro
      parent: Product offerings
    - url: https://www.docker.com/products/team
      name: Docker Team
      parent: Product offerings
    - url: https://www.docker.com/products/business
      name: Docker Business
      parent: Product offerings
    - url: https://www.docker.com/pricing/faq
      name: Pricing FAQs
      parent: Product offerings
    - url: https://www.docker.com/partners/programs
      name: Docker Verified Publisher
      parent: Product offerings
    - url: https://www.docker.com/partners
      name: Partners
      parent: Product offerings
@y
  footer:
    - url: https://www.docker.com/products
      name: 提供製品
    - url: https://www.docker.com/products/personal
      name: Docker Personal
      parent: 提供製品
    - url: https://www.docker.com/products/pro
      name: Docker Pro
      parent: 提供製品
    - url: https://www.docker.com/products/team
      name: Docker Team
      parent: 提供製品
    - url: https://www.docker.com/products/business
      name: Docker Business
      parent: 提供製品
    - url: https://www.docker.com/pricing/faq
      name: 価格に関する FAQ
      parent: 提供製品
    - url: https://www.docker.com/partners/programs
      name: Docker Verified Publisher
      parent: 提供製品
    - url: https://www.docker.com/ja-jp/partners/
      name: パートナー
      parent: 提供製品
@z

------------------------------
日本語訳化
------------------------------
@x
    - url: https://www.docker.com/
      name: Features
    - url: https://www.docker.com/products/docker-desktop
      name: Docker Desktop
      parent: Features
    - url: https://www.docker.com/products/docker-hub
      name: Docker Hub
      parent: Features
    - url: https://www.docker.com/products/secure-software-supply-chain
      name: Secure Software Supply Chain
      parent: Features
    - url: https://www.docker.com/products/container-runtime
      name: Container Runtime
      parent: Features
    - url: https://www.docker.com/products/developer-tools
      name: Developer Tools
      parent: Features
    - url: https://www.docker.com/partners
      name: Trusted Content
      parent: Features
    - url: https://www.docker.com/roadmap
      name: Docker Product Roadmap
      parent: Features
@y
    - url: https://www.docker.com/
      name: 特徴
    - url: https://www.docker.com/products/docker-desktop
      name: Docker Desktop
      parent: 特徴
    - url: https://www.docker.com/products/docker-hub
      name: Docker Hub
      parent: 特徴
    - url: https://www.docker.com/products/secure-software-supply-chain
      name: セキュアソフトウェアのサプライチェーン
      parent: 特徴
    - url: https://www.docker.com/products/container-runtime
      name: コンテナーランタイム
      parent: 特徴
    - url: https://www.docker.com/products/developer-tools
      name: 開発ツール
      parent: 特徴
    - url: https://www.docker.com/partners
      name: Trusted Content
      parent: 特徴
    - url: https://www.docker.com/roadmap
      name: Docker 製品ロードマップ
      parent: 特徴
@z

------------------------------
日本語訳化
------------------------------
@x
    - name: Developers
    - url: https://www.docker.com/use-cases
      name: Use cases
      parent: Developers
    - url: /get-started/
      name: Get started
      parent: Developers
    - url: https://www.docker.com/blog/
      name: Blog
      parent: Developers
    - url: https://www.docker.com/docker-community
      name: Community
      parent: Developers
    - url: https://www.docker.com/open-source
      name: Open Source
      parent: Developers
    - url: https://www.docker.com/community/get-involved/developer-preview
      name: Preview Program
      parent: Developers
@y
    - name: 開発者
    - url: https://www.docker.com/use-cases
      name: ユースケース
      parent: 開発者
    - url: /get-started/
      name: はじめよう
      parent: 開発者
    - url: https://www.docker.com/ja-jp/blog/
      name: ブログ
      parent: 開発者
    - url: https://www.docker.com/docker-community
      name: コミュニティ
      parent: 開発者
    - url: https://www.docker.com/open-source
      name: オープンソース
      parent: 開発者
    - url: https://www.docker.com/community/get-involved/developer-preview
      name: プレビュープログラム
      parent: 開発者
@z

------------------------------
日本語訳化
------------------------------
@x
    - url: https://www.docker.com/company
      name: About us
    - url: https://www.docker.com/what-container
      name: What is a container?
      parent: About us
    - url: https://www.docker.com/why-docker
      name: Why Docker?
      parent: About us
    - url: https://www.docker.com/events
      name: Virtual events
      parent: About us
    - url: https://www.docker.com/swag
      name: Swag store
      parent: About us
    - url: https://www.docker.com/company/newsroom
      name: Newsroom
      parent: About us
    - url: https://www.docker.com/careers
      name: Careers
      parent: About us
    - url: https://www.docker.com/company/contact
      name: Contact us
      parent: About us
    - url: https://www.docker.com/customers
      name: Customers
      parent: About us
    - url: https://www.docker.com/newsletter-subscription
      name: Newsletter
      parent: About us
@y
    - url: https://www.docker.com/ja-jp/company/
      name: 会社情報
    - url: https://www.docker.com/ja-jp/resources/what-container/
      name: コンテナーって何？
      parent: 会社情報
    - url: https://www.docker.com/ja-jp/why-docker/
      name: なぜ Docker？
      parent: 会社情報
    - url: https://www.docker.com/events
      name: 仮想イベント
      parent: 会社情報
    - url: https://www.docker.com/swag
      name: Swag ストア
      parent: 会社情報
    - url: https://www.docker.com/ja-jp/company/newsroom/
      name: ニュースルーム
      parent: 会社情報
    - url: https://www.docker.com/ja-jp/careers/
      name: 採用情報
      parent: 会社情報
    - url: https://www.docker.com/ja-jp/company/contact/
      name: お問合わせ
      parent: 会社情報
    - url: https://www.docker.com/ja-jp/customers/
      name: お客様
      parent: 会社情報
    - url: https://www.docker.com/newsletter-subscription
      name: ニュースレター
      parent: 会社情報
@z
