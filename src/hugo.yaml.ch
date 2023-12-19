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
permalinks: __SUBDIR__
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
markup:
  tableOfContents:
    startLevel: 2
    endLevel: 3
  goldmark:
    extensions:
      typographer: false
    parser:
      wrapStandAloneImageWithinParagraph: false
      attribute:
        block: true
    renderer:
      unsafe: true
  highlight:
    noClasses: false
@y
markup:
  tableOfContents:
    startLevel: 2
    endLevel: 3
  goldmark:
    extensions:
      typographer: false
    parser:
      wrapStandAloneImageWithinParagraph: false
      attribute:
        block: true
    renderer:
      unsafe: true
  highlight:
    noClasses: false
@z

@x
related:
  includeNewer: true
  indices:
  - name: keywords
    weight: 80
  - name: fragmentrefs
    applyFilter: false
    type: fragments
    weight: 80
  threshold: 20
  toLower: false
@y
related:
  includeNewer: true
  indices:
  - name: keywords
    weight: 80
  - name: fragmentrefs
    applyFilter: false
    type: fragments
    weight: 80
  threshold: 20
  toLower: false
@z

@x
build:
  writeStats: true
  cachebusters:
    - source: "assets/watching/hugo_stats\\.json"
      target: "styles\\.css"
    - source: "(postcss|tailwind)\\.config\\.js"
      target: "css"
    - source: "assets/.*\\.(js|ts|jsx|tsx)"
      target: "js"
    - source: "(assets|layouts)/.*\\.(.*)$"
      target: "$1"
@y
build:
  writeStats: true
  cachebusters:
    - source: "assets/watching/hugo_stats\\.json"
      target: "styles\\.css"
    - source: "(postcss|tailwind)\\.config\\.js"
      target: "css"
    - source: "assets/.*\\.(js|ts|jsx|tsx)"
      target: "js"
    - source: "(assets|layouts)/.*\\.(.*)$"
      target: "$1"
@z

@x
outputFormats:
  redirects:
    baseName: redirects
    isPlainText: true
    mediaType: "application/json"
    notAlternative: true
  robots:
    baseName: robots
    isPlainText: true
    mediaType: "text/plain"
    notAlternative: true
@y
outputFormats:
  redirects:
    baseName: redirects
    isPlainText: true
    mediaType: "application/json"
    notAlternative: true
  robots:
    baseName: robots
    isPlainText: true
    mediaType: "text/plain"
    notAlternative: true
@z

@x
outputs:
  home:
    - html
    - redirects
    - robots
  term:
    - html
    - json
@y
outputs:
  home:
    - html
    - redirects
    - robots
  term:
    - html
    - json
@z

@x
taxonomies:
@y
taxonomies:
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
params:
  analytics:
    hotjar:
      prod: 3169877
      stage: 3218181
    google: GTM-WL2QLG5
    onetrust: 8e0ebfd9-035d-4ec2-9b2f-a2de9c09f906
  algolia:
    appid: 3XRLW0LZH9
    apikey: 2899036ce47dba191b8dc1758e4bc6a4
    indexname: docker
@y
params:
  analytics:
    hotjar:
      prod: 3169877
      stage: 3218181
    google: GTM-WL2QLG5
    onetrust: 8e0ebfd9-035d-4ec2-9b2f-a2de9c09f906
  algolia:
    appid: 3XRLW0LZH9
    apikey: 2899036ce47dba191b8dc1758e4bc6a4
    indexname: docker
@z

@x
  repo: https://github.com/docker/docs
  docs_url: https://docs.docker.com
@y
  repo: https://github.com/matsuand/docker.docs-ja
  docs_url: https://docs.docker.com
@z

@x
  latest_engine_api_version: "1.43"
  docker_ce_version: "24.0.7"
  compose_version: "v2.23.3"
  compose_file_v3: "3.8"
  compose_file_v2: "2.4"
  buildkit_version: "0.12.3"
@y
  latest_engine_api_version: "1.43"
  docker_ce_version: "24.0.7"
  compose_version: "v2.23.3"
  compose_file_v3: "3.8"
  compose_file_v2: "2.4"
  buildkit_version: "0.12.3"
@z

@x
  example_go_version: "1.21"
  example_golangci_lint_version: "v1.52"
@y
  example_go_version: "1.21"
  example_golangci_lint_version: "v1.52"
@z

@x
  min_api_threshold: 1.41
@y
  min_api_threshold: 1.41
  suburldir: /docker.docs-ja
@z

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

@x
module:
  proxy: https://proxy.golang.org,direct
  hugoVersion:
    extended: false
    min: "0.116.1"
  mounts:
    - source: assets
      target: assets
    - source: hugo_stats.json
      target: assets/watching/hugo_stats.json
  imports:
@y
module:
  proxy: https://proxy.golang.org,direct
  hugoVersion:
    extended: false
    min: "0.116.1"
  mounts:
    - source: assets
      target: assets
    - source: hugo_stats.json
      target: assets/watching/hugo_stats.json
  imports:
@z

@x
    - path: github.com/moby/moby
      mounts:
        - source: docs/api
          target: content/engine/api
          includeFiles: "*.md"
        - source: docs/api
          target: static/reference/engine
          includeFiles: "*.yaml"
@y
    - path: github.com/moby/moby
      mounts:
        - source: docs/api
          target: content/engine/api
          includeFiles: "*.md"
        - source: docs/api
          target: static/reference/engine
          includeFiles: "*.yaml"
@z

@x
    - path: github.com/moby/buildkit
      mounts:
        - source: frontend/dockerfile/docs/reference.md
          target: content/engine/reference/builder.md
        - source: docs/buildkitd.toml.md
          target: content/build/buildkit/toml-configuration.md
        - source: docs/attestations/slsa-definitions.md
          target: content/build/attestations/slsa-definitions.md
        - source: docs/attestations/attestation-storage.md
          target: content/build/attestations/attestation-storage.md
@y
    - path: github.com/moby/buildkit
      mounts:
        - source: frontend/dockerfile/docs/reference.md
          target: content/engine/reference/builder.md
        - source: docs/buildkitd.toml.md
          target: content/build/buildkit/toml-configuration.md
        - source: docs/attestations/slsa-definitions.md
          target: content/build/attestations/slsa-definitions.md
        - source: docs/attestations/attestation-storage.md
          target: content/build/attestations/attestation-storage.md
@z

@x
    - path: github.com/docker/buildx
      mounts:
        - source: docs/bake-reference.md
          target: content/build/bake/reference.md
@y
    - path: github.com/docker/buildx
      mounts:
        - source: docs/bake-reference.md
          target: content/build/bake/reference.md
@z

@x
    - path: github.com/docker/scout-cli
      mounts:
        - source: docs
          includeFiles: "*.yaml"
          target: data/scout-cli
@y
    - path: github.com/docker/scout-cli
      mounts:
        - source: docs
          includeFiles: "*.yaml"
          target: data/scout-cli
@z

@x
    - path: github.com/docker/cli
      mounts:
        - source: docs/extend
          target: content/engine/extend
          excludefiles: "index.md"
        - source: docs/extend/index.md
          target: content/engine/extend/_index.md
        - source: docs/deprecated.md
          target: content/engine/deprecated.md
        - source: docs/reference/run.md
          target: content/engine/reference/run.md
        - source: docs/reference/commandline/cli.md
          target: content/engine/reference/commandline/cli.md
        - source: docs/reference/commandline/dockerd.md
          target: content/engine/reference/commandline/dockerd.md
@y
    - path: github.com/docker/cli
      mounts:
        - source: docs/extend
          target: content/engine/extend
          excludefiles: "index.md"
        - source: docs/extend/index.md
          target: content/engine/extend/_index.md
        - source: docs/deprecated.md
          target: content/engine/deprecated.md
        - source: docs/reference/run.md
          target: content/engine/reference/run.md
        - source: docs/reference/commandline/cli.md
          target: content/engine/reference/commandline/cli.md
        - source: docs/reference/commandline/dockerd.md
          target: content/engine/reference/commandline/dockerd.md
@z

@x
    - path: github.com/compose-spec/compose-spec
      mounts:
      - source: 01-status.md
        target: content/compose/compose-file/01-status.md
      - source: 02-model.md
        target: content/compose/compose-file/02-model.md
      - source: 03-compose-file.md
        target: content/compose/compose-file/03-compose-file.md
      - source: 04-version-and-name.md
        target: content/compose/compose-file/04-version-and-name.md
      - source: 05-services.md
        target: content/compose/compose-file/05-services.md
      - source: 06-networks.md
        target: content/compose/compose-file/06-networks.md
      - source: 07-volumes.md
        target: content/compose/compose-file/07-volumes.md
      - source: 08-configs.md
        target: content/compose/compose-file/08-configs.md
      - source: 09-secrets.md
        target: content/compose/compose-file/09-secrets.md
      - source: 10-fragments.md
        target: content/compose/compose-file/10-fragments.md
      - source: 11-extension.md
        target: content/compose/compose-file/11-extension.md
      - source: 12-interpolation.md
        target: content/compose/compose-file/12-interpolation.md
      - source: 13-merge.md
        target: content/compose/compose-file/13-merge.md
      - source: 14-include.md
        target: content/compose/compose-file/14-include.md
      - source: 15-profiles.md
        target: content/compose/compose-file/15-profiles.md
      - source: build.md
        target: content/compose/compose-file/build.md
      - source: deploy.md
        target: content/compose/compose-file/deploy.md
      - source: develop.md
        target: content/compose/compose-file/develop.md
@y
    - path: github.com/compose-spec/compose-spec
      mounts:
      - source: 01-status.md
        target: content/compose/compose-file/01-status.md
      - source: 02-model.md
        target: content/compose/compose-file/02-model.md
      - source: 03-compose-file.md
        target: content/compose/compose-file/03-compose-file.md
      - source: 04-version-and-name.md
        target: content/compose/compose-file/04-version-and-name.md
      - source: 05-services.md
        target: content/compose/compose-file/05-services.md
      - source: 06-networks.md
        target: content/compose/compose-file/06-networks.md
      - source: 07-volumes.md
        target: content/compose/compose-file/07-volumes.md
      - source: 08-configs.md
        target: content/compose/compose-file/08-configs.md
      - source: 09-secrets.md
        target: content/compose/compose-file/09-secrets.md
      - source: 10-fragments.md
        target: content/compose/compose-file/10-fragments.md
      - source: 11-extension.md
        target: content/compose/compose-file/11-extension.md
      - source: 12-interpolation.md
        target: content/compose/compose-file/12-interpolation.md
      - source: 13-merge.md
        target: content/compose/compose-file/13-merge.md
      - source: 14-include.md
        target: content/compose/compose-file/14-include.md
      - source: 15-profiles.md
        target: content/compose/compose-file/15-profiles.md
      - source: build.md
        target: content/compose/compose-file/build.md
      - source: deploy.md
        target: content/compose/compose-file/deploy.md
      - source: develop.md
        target: content/compose/compose-file/develop.md
@z

@x
    - path: github.com/docker/compose/v2
      mounts:
        - source: docs/reference
          target: data/compose-cli
          includeFiles: "*.yaml"
@y
    - path: github.com/docker/compose/v2
      mounts:
        - source: docs/reference
          target: data/compose-cli
          includeFiles: "*.yaml"
@z
