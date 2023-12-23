%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x enableGitInfo to false
title: Docker Docs
baseURL: https://docs.docker.com
refLinksErrorLevel: ERROR
enableGitInfo: true
disablePathToLower: true
enableInlineShortcodes: true
disableKinds:
  - taxonomy
  - term
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
disableKinds:
  - taxonomy
  - term
@z

@x
languages:
  en:
    languageName: English
@y
languages:
  en:
    languageName: English
@z

@x
  repo: https://github.com/docker/docs
  docs_url: https://docs.docker.com
@y
  repo: https://github.com/docker/docs
  docs_url: https://docs.docker.com
@z

------------------------------
suburldir 追加
------------------------------
@x
  min_api_threshold: 1.41
@y
  min_api_threshold: 1.41
  suburldir: /docker.docs-ja
@z

------------------------------
日本語訳化
------------------------------
@x
menus:
  main:
  - name: Guides
    url: /get-started/overview/
    weight: 1
  - name: Manuals
    url: /desktop/
    weight: 2
  - name: Reference
    url: /reference/
    weight: 3
  - name: Samples
    url: /samples/
    weight: 4
  - name: FAQ
    url: /faq/
    weight: 5
@y
menus:
  main:
  - name: ガイド
    url: /get-started/overview/
    weight: 1
  - name: マニュアル
    url: /desktop/
    weight: 2
  - name: リファレンス
    url: /reference/
    weight: 3
  - name: サンプル
    url: /samples/
    weight: 4
  - name: FAQ
    url: /faq/
    weight: 5
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
    - url: https://www.docker.com/partners
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
      name: Block
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
    - url: https://www.docker.com/blog/
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
    - url: https://www.docker.com/company
      name: 会社情報
    - url: https://www.docker.com/what-container
      name: コンテナーって何？
      parent: 会社情報
    - url: https://www.docker.com/why-docker
      name: なぜ Docker？
      parent: 会社情報
    - url: https://www.docker.com/events
      name: 仮想イベント
      parent: 会社情報
    - url: https://www.docker.com/swag
      name: Swag ストア
      parent: 会社情報
    - url: https://www.docker.com/company/newsroom
      name: ニュースルーム
      parent: 会社情報
    - url: https://www.docker.com/careers
      name: 採用情報
      parent: 会社情報
    - url: https://www.docker.com/company/contact
      name: 連絡先
      parent: 会社情報
    - url: https://www.docker.com/customers
      name: 顧客
      parent: 会社情報
    - url: https://www.docker.com/newsletter-subscription
      name: ニュースレター
      parent: 会社情報
@z
