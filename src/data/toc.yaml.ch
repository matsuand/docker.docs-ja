%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
Guides:
- title: Overview
  path: /guides/
- title: Docker overview
  path: /guides/docker-overview/
@y
ガイド:
- title: 概要
  path: __SUBDIR__/guides/
- title: Docker 概要
  path: __SUBDIR__/guides/docker-overview/
@z

@x
- sectiontitle: "Getting started"
  section:
  - title: "Overview"
    path: /guides/getting-started/
  - title: "Get Docker Desktop"
    path: /guides/getting-started/get-docker-desktop/
  - title: "Develop with containers"
    path: /guides/getting-started/develop-with-containers/
  - title: "Build and push your first image"
    path: /guides/getting-started/build-and-push-first-image/
  - title: "What's next"
    path: /guides/getting-started/whats-next/
@y
- sectiontitle: "はじめよう"
  section:
  - title: "Overview"
    path: __SUBDIR__/guides/getting-started/
  - title: "Docker Desktop の入手"
    path: __SUBDIR__/guides/getting-started/get-docker-desktop/
  - title: "Develop with containers"
    path: __SUBDIR__/guides/getting-started/develop-with-containers/
  - title: "Build and push your first image"
    path: __SUBDIR__/guides/getting-started/build-and-push-first-image/
  - title: "What's next"
    path: __SUBDIR__/guides/getting-started/whats-next/
@z

@x
- sectiontitle: "Docker concepts"
  section:
  - sectiontitle: "The basics"
    section:
    - title: "What is a container?"
      path: /guides/docker-concepts/the-basics/what-is-a-container/
    - title: "What is an image?"
      path: /guides/docker-concepts/the-basics/what-is-an-image/
    - title: "What is a registry?"
      path: /guides/docker-concepts/the-basics/what-is-a-registry/
    - title: "What is Docker Compose?"
      path: /guides/docker-concepts/the-basics/what-is-docker-compose/
@y
- sectiontitle: "Docker の考え方"
  section:
  - sectiontitle: "基本"
    section:
    - title: "コンテナーとは?"
      path: __SUBDIR__/guides/docker-concepts/the-basics/what-is-a-container/
    - title: "イメージとは?"
      path: __SUBDIR__/guides/docker-concepts/the-basics/what-is-an-image/
    - title: "レジストリとは?"
      path: __SUBDIR__/guides/docker-concepts/the-basics/what-is-a-registry/
    - title: "Docker Compose とは?"
      path: __SUBDIR__/guides/docker-concepts/the-basics/what-is-docker-compose/
@z

@x
  - sectiontitle: "Building images"
    section:
    - title: "Understanding image layers"
      path: /guides/docker-concepts/building-images/understanding-image-layers/
    - title: "Writing a Dockerfile"
      path: /guides/docker-concepts/building-images/writing-a-dockerfile/
    - title: "Build, tag and publish an image"
      path: /guides/docker-concepts/building-images/build-tag-and-publish-an-image/
    - title: "Using the build cache"
      path: /guides/docker-concepts/building-images/using-the-build-cache/
    - title: "Multi-stage builds"
      path: /guides/docker-concepts/building-images/multi-stage-builds/
@y
  - sectiontitle: "イメージのビルド"
    section:
    - title: "イメージレイヤーの理解"
      path: __SUBDIR__/guides/docker-concepts/building-images/understanding-image-layers/
    - title: "Dockerfile の書き方"
      path: __SUBDIR__/guides/docker-concepts/building-images/writing-a-dockerfile/
    - title: "イメージのビルド、タグづけ、公開"
      path: __SUBDIR__/guides/docker-concepts/building-images/build-tag-and-publish-an-image/
    - title: "ビルドキャッシュの利用"
      path: __SUBDIR__/guides/docker-concepts/building-images/using-the-build-cache/
    - title: "マルチステージビルド"
      path: __SUBDIR__/guides/docker-concepts/building-images/multi-stage-builds/
@z

@x
  - sectiontitle: "Running containers"
    section:
    - title: "Publishing ports"
      path: /guides/docker-concepts/running-containers/publishing-ports/
    - title: "Overriding container defaults"
      path: /guides/docker-concepts/running-containers/overriding-container-defaults/
    - title: "Persisting container data"
      path: /guides/docker-concepts/running-containers/persisting-container-data/
    - title: "Sharing local files with containers"
      path: /guides/docker-concepts/running-containers/sharing-local-files/
    - title: "Multi-container applications"
      path: /guides/docker-concepts/running-containers/multi-container-applications/
@y
  - sectiontitle: "Running containers"
    section:
    - title: "Publishing ports"
      path: __SUBDIR__/guides/docker-concepts/running-containers/publishing-ports/
    - title: "Overriding container defaults"
      path: __SUBDIR__/guides/docker-concepts/running-containers/overriding-container-defaults/
    - title: "Persisting container data"
      path: __SUBDIR__/guides/docker-concepts/running-containers/persisting-container-data/
    - title: "Sharing local files with containers"
      path: __SUBDIR__/guides/docker-concepts/running-containers/sharing-local-files/
    - title: "Multi-container applications"
      path: __SUBDIR__/guides/docker-concepts/running-containers/multi-container-applications/
@z

@x
- sectiontitle: Language-specific guides
  section:
  - path: /language/
    title: Overview
  - sectiontitle: Node.js
    section:
    - title: "Overview"
      path: /language/nodejs/
    - title: "Containerize your app"
      path: /language/nodejs/containerize/
    - title: "Develop your app"
      path: /language/nodejs/develop/
    - title: "Run your tests"
      path: /language/nodejs/run-tests/
    - title: "Configure CI/CD"
      path: /language/nodejs/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/nodejs/deploy/
@y
- sectiontitle: 各種言語別ガイド
  section:
  - path: __SUBDIR__/language/
    title: 概要
  - sectiontitle: Node.js
    section:
    - title: "概要"
      path: __SUBDIR__/language/nodejs/
    - title: "アプリのコンテナー化"
      path: __SUBDIR__/language/nodejs/containerize/
    - title: "アプリの開発"
      path: __SUBDIR__/language/nodejs/develop/
    - title: "テストの実行"
      path: __SUBDIR__/language/nodejs/run-tests/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/nodejs/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/nodejs/deploy/
@z

@x
  - sectiontitle: Python
    section:
    - title: "Overview"
      path: /language/python/
    - title: "Containerize your app"
      path: /language/python/containerize/
    - title: "Develop your app"
      path: /language/python/develop/
    - title: "Configure CI/CD"
      path: /language/python/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/python/deploy/
@y
  - sectiontitle: Python
    section:
    - title: "概要"
      path: __SUBDIR__/language/python/
    - title: "アプリのコンテナー化"
      path: __SUBDIR__/language/python/containerize/
    - title: "アプリの開発"
      path: __SUBDIR__/language/python/develop/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/python/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/python/deploy/
@z

@x
  - sectiontitle: R
    section:
    - title: "Overview"
      path: /language/r/
    - title: "Containerize your app"
      path: /language/r/containerize/
    - title: "Develop your app"
      path: /language/r/develop/
    - title: "Configure CI/CD"
      path: /language/r/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/r/deploy/
@y
  - sectiontitle: R
    section:
    - title: "概要"
      path: __SUBDIR__/language/r/
    - title: "アプリのコンテナー化"
      path: __SUBDIR__/language/r/containerize/
    - title: "アプリの開発"
      path: __SUBDIR__/language/r/develop/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/r/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/r/deploy/
@z

@x
  - sectiontitle: Java
    section:
    - title: "Overview"
      path: /language/java/
    - title: "Containerize your app"
      path: /language/java/containerize/
    - title: "Develop your app"
      path: /language/java/develop/
    - title: "Run your tests"
      path: /language/java/run-tests/
    - title: "Configure CI/CD"
      path: /language/java/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/java/deploy/
@y
  - sectiontitle: Java
    section:
    - title: "概要"
      path: __SUBDIR__/language/java/
    - title: "アプリのコンテナー化"
      path: __SUBDIR__/language/java/containerize/
    - title: "アプリの開発"
      path: __SUBDIR__/language/java/develop/
    - title: "テストの実行"
      path: __SUBDIR__/language/java/run-tests/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/java/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/java/deploy/
@z

@x
  - sectiontitle: Go
    section:
    - title: "Overview"
      path: /language/golang/
    - title: "Build images"
      path: /language/golang/build-images/
    - title: "Run containers"
      path: /language/golang/run-containers/
    - title: "Develop your app"
      path: /language/golang/develop/
    - title: "Run your tests"
      path: /language/golang/run-tests/
    - title: "Configure CI/CD"
      path: /language/golang/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/golang/deploy/
@y
  - sectiontitle: Go
    section:
    - title: "概要"
      path: __SUBDIR__/language/golang/
    - title: "イメージのビルド"
      path: __SUBDIR__/language/golang/build-images/
    - title: "コンテナーの実行"
      path: __SUBDIR__/language/golang/run-containers/
    - title: "アプリの開発"
      path: __SUBDIR__/language/golang/develop/
    - title: "テストの実行"
      path: __SUBDIR__/language/golang/run-tests/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/golang/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/golang/deploy/
@z

@x
  - sectiontitle: C# (.NET)
    section:
    - title: "Overview"
      path: /language/dotnet/
    - title: "Containerize your app"
      path: /language/dotnet/containerize/
    - title: "Develop your app"
      path: /language/dotnet/develop/
    - title: "Run your tests"
      path: /language/dotnet/run-tests/
    - title: "Configure CI/CD"
      path: /language/dotnet/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/dotnet/deploy/
@y
  - sectiontitle: C# (.NET)
    section:
    - title: "概要"
      path: __SUBDIR__/language/dotnet/
    - title: "アプリのコンテナー化"
      path: __SUBDIR__/language/dotnet/containerize/
    - title: "アプリの開発"
      path: __SUBDIR__/language/dotnet/develop/
    - title: "テストの実行"
      path: __SUBDIR__/language/dotnet/run-tests/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/dotnet/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/dotnet/deploy/
@z

@x
  - sectiontitle: C++
    section:
    - title: "Overview"
      path: /language/cpp/
    - title: "Containerize your app"
      path: /language/cpp/containerize/
    - title: "Develop your app"
      path: /language/cpp/develop/
    - title: "Configure CI/CD"
      path: /language/cpp/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/cpp/deploy/
@y
  - sectiontitle: C++
    section:
    - title: "概要"
      path: __SUBDIR__/language/cpp/
    - title: "アプリのコンテナー化"
      path: __SUBDIR__/language/cpp/containerize/
    - title: "アプリの開発"
      path: __SUBDIR__/language/cpp/develop/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/cpp/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/cpp/deploy/
@z

@x
  - sectiontitle: Rust
    section:
    - title: "Overview"
      path: /language/rust/
    - title: "Build images"
      path: /language/rust/build-images/
    - title: "Run containers"
      path: /language/rust/run-containers/
    - title: "Develop your app"
      path: /language/rust/develop/
    - title: "Configure CI/CD"
      path: /language/rust/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/rust/deploy/
@y
  - sectiontitle: Rust
    section:
    - title: "概要"
      path: __SUBDIR__/language/rust/
    - title: "イメージのビルド"
      path: __SUBDIR__/language/rust/build-images/
    - title: "コンテナーの実行"
      path: __SUBDIR__/language/rust/run-containers/
    - title: "アプリの開発"
      path: __SUBDIR__/language/rust/develop/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/rust/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/rust/deploy/
@z

@x
  - sectiontitle: PHP
    section:
    - title: "Overview"
      path: /language/php/
    - title: "Containerize your app"
      path: /language/php/containerize/
    - title: "Develop your app"
      path: /language/php/develop/
    - title: "Run your tests"
      path: /language/php/run-tests/
    - title: "Configure CI/CD"
      path: /language/php/configure-ci-cd/
    - title: "Test your deployment"
      path: /language/php/deploy/
@y
  - sectiontitle: PHP
    section:
    - title: "概要"
      path: __SUBDIR__/language/php/
    - title: "アプリのコンテナー化"
      path: __SUBDIR__/language/php/containerize/
    - title: "アプリの開発"
      path: __SUBDIR__/language/php/develop/
    - title: "テストの実行"
      path: __SUBDIR__/language/php/run-tests/
    - title: "CI/CD の設定"
      path: __SUBDIR__/language/php/configure-ci-cd/
    - title: "デプロイのテスト"
      path: __SUBDIR__/language/php/deploy/
@z

@x
- sectiontitle: Use-case guides
  section:
    - path: /guides/use-case/
      title: Overview
@y
- sectiontitle: ユースケースガイド
  section:
    - path: __SUBDIR__/guides/use-case/
      title: 概要
@z

@x
    - sectiontitle: Machine learning & AI
      section:
      - sectiontitle: PDF analysis and chat
        section:
        - path: /guides/use-case/genai-pdf-bot/
          title: Overview
        - path: /guides/use-case/genai-pdf-bot/containerize/
          title: Containerize your app
        - path: /guides/use-case/genai-pdf-bot/develop/
          title: Develop your app
@y
    - sectiontitle: マシン学習と AI
      section:
      - sectiontitle: PDF 分析とチャット
        section:
        - path: __SUBDIR__/guides/use-case/genai-pdf-bot/
          title: 概要
        - path: __SUBDIR__/guides/use-case/genai-pdf-bot/containerize/
          title: アプリのコンテナー化
        - path: __SUBDIR__/guides/use-case/genai-pdf-bot/develop/
          title: アプリの開発
@z

@x
      - path: /guides/use-case/genai-video-bot/
        title: Video transcription and chat
      - path: /guides/use-case/tensorflowjs/
        title: Face detection with TensorFlow.js
@y
      - path: __SUBDIR__/guides/use-case/genai-video-bot/
        title: Video transcription and chat
      - path: __SUBDIR__/guides/use-case/tensorflowjs/
        title: Face detection with TensorFlow.js
@z

@x
      - sectiontitle: Natural language processing
        section:
        - path: /guides/use-case/nlp/
          title: Overview
        - path: /guides/use-case/nlp/language-translation/
          title: Language translation
        - path: /guides/use-case/nlp/named-entity-recognition/
          title: Named entity recognition
        - path: /guides/use-case/nlp/sentiment-analysis/
          title: Sentiment analysis
        - path: /guides/use-case/nlp/text-classification/
          title: Text classification
        - path: /guides/use-case/nlp/text-summarization/
          title: Text summarization
@y
      - sectiontitle: 自然言語処理
        section:
        - path: __SUBDIR__/guides/use-case/nlp/
          title: 概要
        - path: __SUBDIR__/guides/use-case/nlp/language-translation/
          title: Language translation
        - path: __SUBDIR__/guides/use-case/nlp/named-entity-recognition/
          title: Named entity recognition
        - path: __SUBDIR__/guides/use-case/nlp/sentiment-analysis/
          title: Sentiment analysis
        - path: __SUBDIR__/guides/use-case/nlp/text-classification/
          title: Text classification
        - path: __SUBDIR__/guides/use-case/nlp/text-summarization/
          title: Text summarization
@z

@x
    - path: /guides/use-case/jupyter/
      title: Data science with JupyterLab
    - path: /scout/guides/vex/
      title: Suppress CVEs with VEX
    - path: /guides/use-case/databases/
      title: Use containerized databases
@y
    - path: __SUBDIR__/guides/use-case/jupyter/
      title: Data science with JupyterLab
    - path: __SUBDIR__/scout/guides/vex/
      title: Suppress CVEs with VEX
    - path: __SUBDIR__/guides/use-case/databases/
      title: コンテナー化データベースの利用
@z

@x
- sectiontitle: Build with Docker
  section:
  - path: /build/guide/
    title: Overview
  - path: /build/guide/intro/
    title: 1. Introduction
  - path: /build/guide/layers/
    title: 2. Layers
  - path: /build/guide/multi-stage/
    title: 3. Multi-stage
  - path: /build/guide/mounts/
    title: 4. Mounts
  - path: /build/guide/build-args/
    title: 5. Build arguments
  - path: /build/guide/export/
    title: 6. Export binaries
  - path: /build/guide/test/
    title: 7. Test
  - path: /build/guide/multi-platform/
    title: 8. Multi-platform
  - path: /build/guide/next-steps/
    title: Next steps
@y
- sectiontitle: Docker を使ったビルド
  section:
  - path: __SUBDIR__/build/guide/
    title: 概要
  - path: __SUBDIR__/build/guide/intro/
    title: 1. はじめに
  - path: __SUBDIR__/build/guide/layers/
    title: 2. レイヤー
  - path: __SUBDIR__/build/guide/multi-stage/
    title: 3. マルチステージ
  - path: __SUBDIR__/build/guide/mounts/
    title: 4. マウント
  - path: __SUBDIR__/build/guide/build-args/
    title: 5. ビルド引数
  - path: __SUBDIR__/build/guide/export/
    title: 6. バイナリのエクスポート
  - path: __SUBDIR__/build/guide/test/
    title: 7. テスト
  - path: __SUBDIR__/build/guide/multi-platform/
    title: 8. マルチプラットフォーム
  - path: __SUBDIR__/build/guide/next-steps/
    title: 次のステップ
@z

@x
- sectiontitle: Deployment and orchestration
  section:
  - title: "Overview"
    path: /guides/deployment-orchestration/orchestration/
  - title: "Deploy to Kubernetes"
    path: /guides/deployment-orchestration/kube-deploy/
  - title: "Deploy to Swarm"
    path: /guides/deployment-orchestration/swarm-deploy/
  - title: Cloud integrations
    path: /cloud/
@y
- sectiontitle: デプロイとオーケストレーション
  section:
  - title: "概要"
    path: __SUBDIR__/guides/deployment-orchestration/orchestration/
  - title: "Kubernetes へのデプロイ"
    path: __SUBDIR__/guides/deployment-orchestration/kube-deploy/
  - title: "Swarm へのデプロイ"
    path: __SUBDIR__/guides/deployment-orchestration/swarm-deploy/
  - title: クラウドインテグレーション
    path: __SUBDIR__/cloud/
@z

@x
- sectiontitle: Docker workshop
  section:
  - title: "Part 1: Overview"
    path: /guides/workshop/
  - title: "Part 2: Containerize an application"
    path: /guides/workshop/02_our_app/
  - title: "Part 3: Update the application"
    path: /guides/workshop/03_updating_app/
  - title: "Part 4: Share the application"
    path: /guides/workshop/04_sharing_app/
  - title: "Part 5: Persist the DB"
    path: /guides/workshop/05_persisting_data/
@y
- sectiontitle: Docker ワークショップ
  section:
  - title: "1部: 概要"
    path: __SUBDIR__/guides/workshop/
  - title: "2部: アプリのコンテナー化"
    path: __SUBDIR__/guides/workshop/02_our_app/
  - title: "3部: アプリの更新"
    path: __SUBDIR__/guides/workshop/03_updating_app/
  - title: "4部: アプリの共有"
    path: __SUBDIR__/guides/workshop/04_sharing_app/
  - title: "5部: DB への保存"
    path: __SUBDIR__/guides/workshop/05_persisting_data/
@z

@x
  - title: "Part 6: Use bind mounts"
    path: /guides/workshop/06_bind_mounts/
  - title: "Part 7: Multi-container apps"
    path: /guides/workshop/07_multi_container/
  - title: "Part 8: Use Docker Compose"
    path: /guides/workshop/08_using_compose/
  - title: "Part 9: Image-building best practices"
    path: /guides/workshop/09_image_best/
  - title: "Part 10: What next?"
    path: /guides/workshop/10_what_next/
@y
  - title: "6部: バインドマウントの利用"
    path: __SUBDIR__/guides/workshop/06_bind_mounts/
  - title: "7部: マルチコンテナーアプリ"
    path: __SUBDIR__/guides/workshop/07_multi_container/
  - title: "8部: Docker Compose の利用"
    path: __SUBDIR__/guides/workshop/08_using_compose/
  - title: "9部: イメージビルドのベストプラクティス"
    path: __SUBDIR__/guides/workshop/09_image_best/
  - title: "10部: 次は何？"
    path: __SUBDIR__/guides/workshop/10_what_next/
@z

@x
- sectiontitle: Contribute
  section:
  - path: /contribute/
    title: Contribute to Docker's docs
  - sectiontitle: Style guide
    section:
    - path: /contribute/style/grammar/
      title: Grammar and style
    - path: /contribute/style/formatting/
      title: Formatting
    - path: /contribute/style/recommended-words/
      title: Recommended word list
    - path: /contribute/style/terminology/
      title: Docker terminology
    - path: /contribute/style/voice-tone/
      title: Voice and tone
  - path: /contribute/file-conventions/
    title: Source file conventions
  - path: /contribute/ui/
    title: UI elements in content
@y
- sectiontitle: ドキュメントへの貢献
  section:
  - path: __SUBDIR__/contribute/
    title: Docker ドキュメントへの貢献
  - sectiontitle: スタイルガイド
    section:
    - path: __SUBDIR__/contribute/style/grammar/
      title: 文法とスタイル
    - path: __SUBDIR__/contribute/style/formatting/
      title: フォーマット
    - path: __SUBDIR__/contribute/style/recommended-words/
      title: 推奨される語句リスト
    - path: __SUBDIR__/contribute/style/terminology/
      title: Docker 用語
    - path: __SUBDIR__/contribute/style/voice-tone/
      title: 表現とトーン
  - path: __SUBDIR__/contribute/file-conventions/
    title: ソースファイル規則
  - path: __SUBDIR__/contribute/ui/
    title: ページ内の UI 要素
@z

@x
  - sectiontitle: Useful components
    section:
    - path: /contribute/components/accordions/
      title: Accordions
    - path: /contribute/components/badges/
      title: Badges
    - path: /contribute/components/call-outs/
      title: Callouts
    - path: /contribute/components/cards/
      title: Cards
    - path: /contribute/components/code-blocks/
      title: Code blocks
    - path: /contribute/components/icons/
      title: Icons
    - path: /contribute/components/images/
      title: Images
    - path: /contribute/components/links/
      title: Links
    - path: /contribute/components/lists/
      title: Lists
    - path: /contribute/components/tables/
      title: Tables
    - path: /contribute/components/tabs/
      title: Tabs
    - path: /contribute/components/videos/
      title: Videos
    - path: /contribute/components/buttons/
      title: Buttons
  - path: /contribute/checklist/
    title: Writing checklist
@y
  - sectiontitle: Useful components
    section:
    - path: __SUBDIR__/contribute/components/accordions/
      title: Accordions
    - path: __SUBDIR__/contribute/components/badges/
      title: Badges
    - path: __SUBDIR__/contribute/components/call-outs/
      title: Callouts
    - path: __SUBDIR__/contribute/components/cards/
      title: Cards
    - path: __SUBDIR__/contribute/components/code-blocks/
      title: Code blocks
    - path: __SUBDIR__/contribute/components/icons/
      title: Icons
    - path: __SUBDIR__/contribute/components/images/
      title: Images
    - path: __SUBDIR__/contribute/components/links/
      title: Links
    - path: __SUBDIR__/contribute/components/lists/
      title: Lists
    - path: __SUBDIR__/contribute/components/tables/
      title: Tables
    - path: __SUBDIR__/contribute/components/tabs/
      title: Tabs
    - path: __SUBDIR__/contribute/components/videos/
      title: Videos
    - path: __SUBDIR__/contribute/components/buttons/
      title: Buttons
  - path: __SUBDIR__/contribute/checklist/
    title: Writing checklist
@z

@x
Reference:
- path: /reference/
  title: Reference documentation
- sectiontitle: CLI reference
  section:
  - path: /reference/cli/docker/
    title: docker (base command)
  - path: /reference/cli/docker/build/
    title: docker build
@y
リファレンス:
- path: __SUBDIR__/reference/
  title: リファレンスドキュメント
- sectiontitle: CLI リファレンス
  section:
  - path: __SUBDIR__/reference/cli/docker/
    title: docker (基本コマンド)
  - path: __SUBDIR__/reference/cli/docker/build/
    title: docker build
@z

@x
  - sectiontitle: docker builder
    section:
      - path: /reference/cli/docker/builder/
        title: docker builder
      - path: /reference/cli/docker/builder/build/
        title: docker builder build
      - path: /reference/cli/docker/builder/prune/
        title: docker builder prune
@y
  - sectiontitle: docker builder
    section:
      - path: __SUBDIR__/reference/cli/docker/builder/
        title: docker builder
      - path: __SUBDIR__/reference/cli/docker/builder/build/
        title: docker builder build
      - path: __SUBDIR__/reference/cli/docker/builder/prune/
        title: docker builder prune
@z

@x
  - sectiontitle: docker buildx
    section:
      - path: /reference/cli/docker/buildx/
        title: docker buildx
      - path: /reference/cli/docker/buildx/bake/
        title: docker buildx bake
      - path: /reference/cli/docker/buildx/build/
        title: docker buildx build
      - path: /reference/cli/docker/buildx/create/
        title: docker buildx create
      - path: /reference/cli/docker/buildx/debug/
        title: docker buildx debug
      - path: /reference/cli/docker/buildx/debug/build/
        title: docker buildx debug build
      - path: /reference/cli/docker/buildx/du/
        title: docker buildx du
      - path: /reference/cli/docker/buildx/imagetools/
        title: docker buildx imagetools
      - path: /reference/cli/docker/buildx/imagetools/create/
        title: docker buildx imagetools create
      - path: /reference/cli/docker/buildx/imagetools/inspect/
        title: docker buildx imagetools inspect
      - path: /reference/cli/docker/buildx/inspect/
        title: docker buildx inspect
      - path: /reference/cli/docker/buildx/ls/
        title: docker buildx ls
      - path: /reference/cli/docker/buildx/prune/
        title: docker buildx prune
      - path: /reference/cli/docker/buildx/rm/
        title: docker buildx rm
      - path: /reference/cli/docker/buildx/stop/
        title: docker buildx stop
      - path: /reference/cli/docker/buildx/use/
        title: docker buildx use
      - path: /reference/cli/docker/buildx/version/
        title: docker buildx version
@y
  - sectiontitle: docker buildx
    section:
      - path: __SUBDIR__/reference/cli/docker/buildx/
        title: docker buildx
      - path: __SUBDIR__/reference/cli/docker/buildx/bake/
        title: docker buildx bake
      - path: __SUBDIR__/reference/cli/docker/buildx/build/
        title: docker buildx build
      - path: __SUBDIR__/reference/cli/docker/buildx/create/
        title: docker buildx create
      - path: __SUBDIR__/reference/cli/docker/buildx/debug/
        title: docker buildx debug
      - path: __SUBDIR__/reference/cli/docker/buildx/debug/build/
        title: docker buildx debug build
      - path: __SUBDIR__/reference/cli/docker/buildx/du/
        title: docker buildx du
      - path: __SUBDIR__/reference/cli/docker/buildx/imagetools/
        title: docker buildx imagetools
      - path: __SUBDIR__/reference/cli/docker/buildx/imagetools/create/
        title: docker buildx imagetools create
      - path: __SUBDIR__/reference/cli/docker/buildx/imagetools/inspect/
        title: docker buildx imagetools inspect
      - path: __SUBDIR__/reference/cli/docker/buildx/inspect/
        title: docker buildx inspect
      - path: __SUBDIR__/reference/cli/docker/buildx/ls/
        title: docker buildx ls
      - path: __SUBDIR__/reference/cli/docker/buildx/prune/
        title: docker buildx prune
      - path: __SUBDIR__/reference/cli/docker/buildx/rm/
        title: docker buildx rm
      - path: __SUBDIR__/reference/cli/docker/buildx/stop/
        title: docker buildx stop
      - path: __SUBDIR__/reference/cli/docker/buildx/use/
        title: docker buildx use
      - path: __SUBDIR__/reference/cli/docker/buildx/version/
        title: docker buildx version
@z

@x
  - sectiontitle: docker checkpoint
    section:
    - path: /reference/cli/docker/checkpoint/
      title: docker checkpoint
    - path: /reference/cli/docker/checkpoint/create/
      title: docker checkpoint create
    - path: /reference/cli/docker/checkpoint/ls/
      title: docker checkpoint ls
    - path: /reference/cli/docker/checkpoint/rm/
      title: docker checkpoint rm
@y
  - sectiontitle: docker checkpoint
    section:
    - path: __SUBDIR__/reference/cli/docker/checkpoint/
      title: docker checkpoint
    - path: __SUBDIR__/reference/cli/docker/checkpoint/create/
      title: docker checkpoint create
    - path: __SUBDIR__/reference/cli/docker/checkpoint/ls/
      title: docker checkpoint ls
    - path: __SUBDIR__/reference/cli/docker/checkpoint/rm/
      title: docker checkpoint rm
@z

@x
  - sectiontitle: docker compose
    section:
      - path: /compose/reference/
        title: overview
      - path: /reference/cli/docker/compose/alpha/
        title: docker compose alpha
      - path: /reference/cli/docker/compose/alpha/dry-run/
        title: docker compose alpha dry-run
      - path: /reference/cli/docker/compose/alpha/publish/
        title: docker compose alpha publish
      - path: /reference/cli/docker/compose/alpha/scale/
        title: docker compose alpha scale
      - path: /reference/cli/docker/compose/alpha/viz/
        title: docker compose alpha viz
      - path: /reference/cli/docker/compose/
        title: docker compose
      - path: /reference/cli/docker/compose/build/
        title: docker compose build
      - path: /reference/cli/docker/compose/config/
        title: docker compose config
      - path: /reference/cli/docker/compose/cp/
        title: docker compose cp
      - path: /reference/cli/docker/compose/create/
        title: docker compose create
      - path: /reference/cli/docker/compose/down/
        title: docker compose down
      - path: /reference/cli/docker/compose/events/
        title: docker compose events
      - path: /reference/cli/docker/compose/exec/
        title: docker compose exec
      - path: /reference/cli/docker/compose/images/
        title: docker compose images
      - path: /reference/cli/docker/compose/kill/
        title: docker compose kill
      - path: /reference/cli/docker/compose/logs/
        title: docker compose logs
      - path: /reference/cli/docker/compose/ls/
        title: docker compose ls
      - path: /reference/cli/docker/compose/pause/
        title: docker compose pause
      - path: /reference/cli/docker/compose/port/
        title: docker compose port
      - path: /reference/cli/docker/compose/ps/
        title: docker compose ps
      - path: /reference/cli/docker/compose/pull/
        title: docker compose pull
      - path: /reference/cli/docker/compose/push/
        title: docker compose push
      - path: /reference/cli/docker/compose/restart/
        title: docker compose restart
      - path: /reference/cli/docker/compose/rm/
        title: docker compose rm
      - path: /reference/cli/docker/compose/run/
        title: docker compose run
      - path: /reference/cli/docker/compose/start/
        title: docker compose start
      - path: /reference/cli/docker/compose/stop/
        title: docker compose stop
      - path: /reference/cli/docker/compose/top/
        title: docker compose top
      - path: /reference/cli/docker/compose/unpause/
        title: docker compose unpause
      - path: /reference/cli/docker/compose/up/
        title: docker compose up
      - path: /reference/cli/docker/compose/version/
        title: docker compose version
      - path: /reference/cli/docker/compose/wait/
        title: docker compose wait
      - path: /reference/cli/docker/compose/watch/
        title: docker compose watch
@y
  - sectiontitle: docker compose
    section:
      - path: __SUBDIR__/compose/reference/
        title: overview
      - path: __SUBDIR__/reference/cli/docker/compose/alpha/
        title: docker compose alpha
      - path: __SUBDIR__/reference/cli/docker/compose/alpha/dry-run/
        title: docker compose alpha dry-run
      - path: __SUBDIR__/reference/cli/docker/compose/alpha/publish/
        title: docker compose alpha publish
      - path: __SUBDIR__/reference/cli/docker/compose/alpha/scale/
        title: docker compose alpha scale
      - path: __SUBDIR__/reference/cli/docker/compose/alpha/viz/
        title: docker compose alpha viz
      - path: __SUBDIR__/reference/cli/docker/compose/
        title: docker compose
      - path: __SUBDIR__/reference/cli/docker/compose/build/
        title: docker compose build
      - path: __SUBDIR__/reference/cli/docker/compose/config/
        title: docker compose config
      - path: __SUBDIR__/reference/cli/docker/compose/cp/
        title: docker compose cp
      - path: __SUBDIR__/reference/cli/docker/compose/create/
        title: docker compose create
      - path: __SUBDIR__/reference/cli/docker/compose/down/
        title: docker compose down
      - path: __SUBDIR__/reference/cli/docker/compose/events/
        title: docker compose events
      - path: __SUBDIR__/reference/cli/docker/compose/exec/
        title: docker compose exec
      - path: __SUBDIR__/reference/cli/docker/compose/images/
        title: docker compose images
      - path: __SUBDIR__/reference/cli/docker/compose/kill/
        title: docker compose kill
      - path: __SUBDIR__/reference/cli/docker/compose/logs/
        title: docker compose logs
      - path: __SUBDIR__/reference/cli/docker/compose/ls/
        title: docker compose ls
      - path: __SUBDIR__/reference/cli/docker/compose/pause/
        title: docker compose pause
      - path: __SUBDIR__/reference/cli/docker/compose/port/
        title: docker compose port
      - path: __SUBDIR__/reference/cli/docker/compose/ps/
        title: docker compose ps
      - path: __SUBDIR__/reference/cli/docker/compose/pull/
        title: docker compose pull
      - path: __SUBDIR__/reference/cli/docker/compose/push/
        title: docker compose push
      - path: __SUBDIR__/reference/cli/docker/compose/restart/
        title: docker compose restart
      - path: __SUBDIR__/reference/cli/docker/compose/rm/
        title: docker compose rm
      - path: __SUBDIR__/reference/cli/docker/compose/run/
        title: docker compose run
      - path: __SUBDIR__/reference/cli/docker/compose/start/
        title: docker compose start
      - path: __SUBDIR__/reference/cli/docker/compose/stop/
        title: docker compose stop
      - path: __SUBDIR__/reference/cli/docker/compose/top/
        title: docker compose top
      - path: __SUBDIR__/reference/cli/docker/compose/unpause/
        title: docker compose unpause
      - path: __SUBDIR__/reference/cli/docker/compose/up/
        title: docker compose up
      - path: __SUBDIR__/reference/cli/docker/compose/version/
        title: docker compose version
      - path: __SUBDIR__/reference/cli/docker/compose/wait/
        title: docker compose wait
      - path: __SUBDIR__/reference/cli/docker/compose/watch/
        title: docker compose watch
@z

@x
  - sectiontitle: docker config
    section:
    - path: /reference/cli/docker/config/
      title: docker config
    - path: /reference/cli/docker/config/create/
      title: docker config create
    - path: /reference/cli/docker/config/inspect/
      title: docker config inspect
    - path: /reference/cli/docker/config/ls/
      title: docker config ls
    - path: /reference/cli/docker/config/rm/
      title: docker config rm
@y
  - sectiontitle: docker config
    section:
    - path: __SUBDIR__/reference/cli/docker/config/
      title: docker config
    - path: __SUBDIR__/reference/cli/docker/config/create/
      title: docker config create
    - path: __SUBDIR__/reference/cli/docker/config/inspect/
      title: docker config inspect
    - path: __SUBDIR__/reference/cli/docker/config/ls/
      title: docker config ls
    - path: __SUBDIR__/reference/cli/docker/config/rm/
      title: docker config rm
@z

@x
  - sectiontitle: docker container
    section:
    - path: /reference/cli/docker/container/
      title: docker container
    - path: /reference/cli/docker/container/attach/
      title: docker container attach
    - path: /reference/cli/docker/container/commit/
      title: docker container commit
    - path: /reference/cli/docker/container/cp/
      title: docker container cp
    - path: /reference/cli/docker/container/create/
      title: docker container create
    - path: /reference/cli/docker/container/diff/
      title: docker container diff
    - path: /reference/cli/docker/container/exec/
      title: docker container exec
    - path: /reference/cli/docker/container/export/
      title: docker container export
    - path: /reference/cli/docker/container/inspect/
      title: docker container inspect
    - path: /reference/cli/docker/container/kill/
      title: docker container kill
    - path: /reference/cli/docker/container/logs/
      title: docker container logs
    - path: /reference/cli/docker/container/ls/
      title: docker container ls
    - path: /reference/cli/docker/container/pause/
      title: docker container pause
    - path: /reference/cli/docker/container/port/
      title: docker container port
    - path: /reference/cli/docker/container/prune/
      title: docker container prune
    - path: /reference/cli/docker/container/rename/
      title: docker container rename
    - path: /reference/cli/docker/container/restart/
      title: docker container restart
    - path: /reference/cli/docker/container/rm/
      title: docker container rm
    - path: /reference/cli/docker/container/run/
      title: docker container run
    - path: /reference/cli/docker/container/start/
      title: docker container start
    - path: /reference/cli/docker/container/stats/
      title: docker container stats
    - path: /reference/cli/docker/container/stop/
      title: docker container stop
    - path: /reference/cli/docker/container/top/
      title: docker container top
    - path: /reference/cli/docker/container/unpause/
      title: docker container unpause
    - path: /reference/cli/docker/container/update/
      title: docker container update
    - path: /reference/cli/docker/container/wait/
      title: docker container wait
@y
  - sectiontitle: docker container
    section:
    - path: __SUBDIR__/reference/cli/docker/container/
      title: docker container
    - path: __SUBDIR__/reference/cli/docker/container/attach/
      title: docker container attach
    - path: __SUBDIR__/reference/cli/docker/container/commit/
      title: docker container commit
    - path: __SUBDIR__/reference/cli/docker/container/cp/
      title: docker container cp
    - path: __SUBDIR__/reference/cli/docker/container/create/
      title: docker container create
    - path: __SUBDIR__/reference/cli/docker/container/diff/
      title: docker container diff
    - path: __SUBDIR__/reference/cli/docker/container/exec/
      title: docker container exec
    - path: __SUBDIR__/reference/cli/docker/container/export/
      title: docker container export
    - path: __SUBDIR__/reference/cli/docker/container/inspect/
      title: docker container inspect
    - path: __SUBDIR__/reference/cli/docker/container/kill/
      title: docker container kill
    - path: __SUBDIR__/reference/cli/docker/container/logs/
      title: docker container logs
    - path: __SUBDIR__/reference/cli/docker/container/ls/
      title: docker container ls
    - path: __SUBDIR__/reference/cli/docker/container/pause/
      title: docker container pause
    - path: __SUBDIR__/reference/cli/docker/container/port/
      title: docker container port
    - path: __SUBDIR__/reference/cli/docker/container/prune/
      title: docker container prune
    - path: __SUBDIR__/reference/cli/docker/container/rename/
      title: docker container rename
    - path: __SUBDIR__/reference/cli/docker/container/restart/
      title: docker container restart
    - path: __SUBDIR__/reference/cli/docker/container/rm/
      title: docker container rm
    - path: __SUBDIR__/reference/cli/docker/container/run/
      title: docker container run
    - path: __SUBDIR__/reference/cli/docker/container/start/
      title: docker container start
    - path: __SUBDIR__/reference/cli/docker/container/stats/
      title: docker container stats
    - path: __SUBDIR__/reference/cli/docker/container/stop/
      title: docker container stop
    - path: __SUBDIR__/reference/cli/docker/container/top/
      title: docker container top
    - path: __SUBDIR__/reference/cli/docker/container/unpause/
      title: docker container unpause
    - path: __SUBDIR__/reference/cli/docker/container/update/
      title: docker container update
    - path: __SUBDIR__/reference/cli/docker/container/wait/
      title: docker container wait
@z

@x
  - sectiontitle: docker context
    section:
      - path: /reference/cli/docker/context/
        title: docker context
      - path: /reference/cli/docker/context/create/
        title: docker context create
      - path: /reference/cli/docker/context/export/
        title: docker context export
      - path: /reference/cli/docker/context/import/
        title: docker context import
      - path: /reference/cli/docker/context/inspect/
        title: docker context inspect
      - path: /reference/cli/docker/context/ls/
        title: docker context ls
      - path: /reference/cli/docker/context/rm/
        title: docker context rm
      - path: /reference/cli/docker/context/show/
        title: docker context show
      - path: /reference/cli/docker/context/update/
        title: docker context update
      - path: /reference/cli/docker/context/use/
        title: docker context use
@y
  - sectiontitle: docker context
    section:
      - path: __SUBDIR__/reference/cli/docker/context/
        title: docker context
      - path: __SUBDIR__/reference/cli/docker/context/create/
        title: docker context create
      - path: __SUBDIR__/reference/cli/docker/context/export/
        title: docker context export
      - path: __SUBDIR__/reference/cli/docker/context/import/
        title: docker context import
      - path: __SUBDIR__/reference/cli/docker/context/inspect/
        title: docker context inspect
      - path: __SUBDIR__/reference/cli/docker/context/ls/
        title: docker context ls
      - path: __SUBDIR__/reference/cli/docker/context/rm/
        title: docker context rm
      - path: __SUBDIR__/reference/cli/docker/context/show/
        title: docker context show
      - path: __SUBDIR__/reference/cli/docker/context/update/
        title: docker context update
      - path: __SUBDIR__/reference/cli/docker/context/use/
        title: docker context use
@z

@x
  - path: /reference/cli/docker/debug/
    title: docker debug (Beta)
  - path: /reference/cli/docker/exec/
    title: docker exec
@y
  - path: __SUBDIR__/reference/cli/docker/debug/
    title: docker debug (ベータ)
  - path: __SUBDIR__/reference/cli/docker/exec/
    title: docker exec
@z

@x
  - sectiontitle: docker image
    section:
    - path: /reference/cli/docker/image/
      title: docker image
    - path: /reference/cli/docker/image/build/
      title: docker image build
    - path: /reference/cli/docker/image/history/
      title: docker image history
    - path: /reference/cli/docker/image/import/
      title: docker image import
    - path: /reference/cli/docker/image/inspect/
      title: docker image inspect
    - path: /reference/cli/docker/image/load/
      title: docker image load
    - path: /reference/cli/docker/image/ls/
      title: docker image ls
    - path: /reference/cli/docker/image/prune/
      title: docker image prune
    - path: /reference/cli/docker/image/pull/
      title: docker image pull
    - path: /reference/cli/docker/image/push/
      title: docker image push
    - path: /reference/cli/docker/image/rm/
      title: docker image rm
    - path: /reference/cli/docker/image/save/
      title: docker image save
    - path: /reference/cli/docker/image/tag/
      title: docker image tag
@y
  - sectiontitle: docker image
    section:
    - path: __SUBDIR__/reference/cli/docker/image/
      title: docker image
    - path: __SUBDIR__/reference/cli/docker/image/build/
      title: docker image build
    - path: __SUBDIR__/reference/cli/docker/image/history/
      title: docker image history
    - path: __SUBDIR__/reference/cli/docker/image/import/
      title: docker image import
    - path: __SUBDIR__/reference/cli/docker/image/inspect/
      title: docker image inspect
    - path: __SUBDIR__/reference/cli/docker/image/load/
      title: docker image load
    - path: __SUBDIR__/reference/cli/docker/image/ls/
      title: docker image ls
    - path: __SUBDIR__/reference/cli/docker/image/prune/
      title: docker image prune
    - path: __SUBDIR__/reference/cli/docker/image/pull/
      title: docker image pull
    - path: __SUBDIR__/reference/cli/docker/image/push/
      title: docker image push
    - path: __SUBDIR__/reference/cli/docker/image/rm/
      title: docker image rm
    - path: __SUBDIR__/reference/cli/docker/image/save/
      title: docker image save
    - path: __SUBDIR__/reference/cli/docker/image/tag/
      title: docker image tag
@z

@x
  - path: /reference/cli/docker/images/
    title: docker images
  - path: /reference/cli/docker/info/
    title: docker info
  - path: /reference/cli/docker/init/
    title: docker init
  - path: /reference/cli/docker/inspect/
    title: docker inspect
  - path: /reference/cli/docker/login/
    title: docker login
  - path: /reference/cli/docker/logout/
    title: docker logout
@y
  - path: __SUBDIR__/reference/cli/docker/images/
    title: docker images
  - path: __SUBDIR__/reference/cli/docker/info/
    title: docker info
  - path: __SUBDIR__/reference/cli/docker/init/
    title: docker init
  - path: __SUBDIR__/reference/cli/docker/inspect/
    title: docker inspect
  - path: __SUBDIR__/reference/cli/docker/login/
    title: docker login
  - path: __SUBDIR__/reference/cli/docker/logout/
    title: docker logout
@z

@x
  - sectiontitle: docker manifest
    section:
    - path: /reference/cli/docker/manifest/
      title: docker manifest
    - path: /reference/cli/docker/manifest/annotate/
      title: docker manifest annotate
    - path: /reference/cli/docker/manifest/create/
      title: docker manifest create
    - path: /reference/cli/docker/manifest/inspect/
      title: docker manifest inspect
    - path: /reference/cli/docker/manifest/push/
      title: docker manifest push
    - path: /reference/cli/docker/manifest/rm/
      title: docker manifest rm
@y
  - sectiontitle: docker manifest
    section:
    - path: __SUBDIR__/reference/cli/docker/manifest/
      title: docker manifest
    - path: __SUBDIR__/reference/cli/docker/manifest/annotate/
      title: docker manifest annotate
    - path: __SUBDIR__/reference/cli/docker/manifest/create/
      title: docker manifest create
    - path: __SUBDIR__/reference/cli/docker/manifest/inspect/
      title: docker manifest inspect
    - path: __SUBDIR__/reference/cli/docker/manifest/push/
      title: docker manifest push
    - path: __SUBDIR__/reference/cli/docker/manifest/rm/
      title: docker manifest rm
@z

@x
  - sectiontitle: docker network
    section:
    - path: /reference/cli/docker/network/
      title: docker network
    - path: /reference/cli/docker/network/connect/
      title: docker network connect
    - path: /reference/cli/docker/network/create/
      title: docker network create
    - path: /reference/cli/docker/network/disconnect/
      title: docker network disconnect
    - path: /reference/cli/docker/network/inspect/
      title: docker network inspect
    - path: /reference/cli/docker/network/ls/
      title: docker network ls
    - path: /reference/cli/docker/network/prune/
      title: docker network prune
    - path: /reference/cli/docker/network/rm/
      title: docker network rm
@y
  - sectiontitle: docker network
    section:
    - path: __SUBDIR__/reference/cli/docker/network/
      title: docker network
    - path: __SUBDIR__/reference/cli/docker/network/connect/
      title: docker network connect
    - path: __SUBDIR__/reference/cli/docker/network/create/
      title: docker network create
    - path: __SUBDIR__/reference/cli/docker/network/disconnect/
      title: docker network disconnect
    - path: __SUBDIR__/reference/cli/docker/network/inspect/
      title: docker network inspect
    - path: __SUBDIR__/reference/cli/docker/network/ls/
      title: docker network ls
    - path: __SUBDIR__/reference/cli/docker/network/prune/
      title: docker network prune
    - path: __SUBDIR__/reference/cli/docker/network/rm/
      title: docker network rm
@z

@x
  - sectiontitle: docker node
    section:
    - path: /reference/cli/docker/node/
      title: docker node
    - path: /reference/cli/docker/node/demote/
      title: docker node demote
    - path: /reference/cli/docker/node/inspect/
      title: docker node inspect
    - path: /reference/cli/docker/node/ls/
      title: docker node ls
    - path: /reference/cli/docker/node/promote/
      title: docker node promote
    - path: /reference/cli/docker/node/ps/
      title: docker node ps
    - path: /reference/cli/docker/node/rm/
      title: docker node rm
    - path: /reference/cli/docker/node/update/
      title: docker node update
@y
  - sectiontitle: docker node
    section:
    - path: __SUBDIR__/reference/cli/docker/node/
      title: docker node
    - path: __SUBDIR__/reference/cli/docker/node/demote/
      title: docker node demote
    - path: __SUBDIR__/reference/cli/docker/node/inspect/
      title: docker node inspect
    - path: __SUBDIR__/reference/cli/docker/node/ls/
      title: docker node ls
    - path: __SUBDIR__/reference/cli/docker/node/promote/
      title: docker node promote
    - path: __SUBDIR__/reference/cli/docker/node/ps/
      title: docker node ps
    - path: __SUBDIR__/reference/cli/docker/node/rm/
      title: docker node rm
    - path: __SUBDIR__/reference/cli/docker/node/update/
      title: docker node update
@z

@x
  - sectiontitle: docker plugin
    section:
    - path: /reference/cli/docker/plugin/
      title: docker plugin
    - path: /reference/cli/docker/plugin/create/
      title: docker plugin create
    - path: /reference/cli/docker/plugin/disable/
      title: docker plugin disable
    - path: /reference/cli/docker/plugin/enable/
      title: docker plugin enable
    - path: /reference/cli/docker/plugin/inspect/
      title: docker plugin inspect
    - path: /reference/cli/docker/plugin/install/
      title: docker plugin install
    - path: /reference/cli/docker/plugin/ls/
      title: docker plugin ls
    - path: /reference/cli/docker/plugin/rm/
      title: docker plugin rm
    - path: /reference/cli/docker/plugin/set/
      title: docker plugin set
    - path: /reference/cli/docker/plugin/upgrade/
      title: docker plugin upgrade
@y
  - sectiontitle: docker plugin
    section:
    - path: __SUBDIR__/reference/cli/docker/plugin/
      title: docker plugin
    - path: __SUBDIR__/reference/cli/docker/plugin/create/
      title: docker plugin create
    - path: __SUBDIR__/reference/cli/docker/plugin/disable/
      title: docker plugin disable
    - path: __SUBDIR__/reference/cli/docker/plugin/enable/
      title: docker plugin enable
    - path: __SUBDIR__/reference/cli/docker/plugin/inspect/
      title: docker plugin inspect
    - path: __SUBDIR__/reference/cli/docker/plugin/install/
      title: docker plugin install
    - path: __SUBDIR__/reference/cli/docker/plugin/ls/
      title: docker plugin ls
    - path: __SUBDIR__/reference/cli/docker/plugin/rm/
      title: docker plugin rm
    - path: __SUBDIR__/reference/cli/docker/plugin/set/
      title: docker plugin set
    - path: __SUBDIR__/reference/cli/docker/plugin/upgrade/
      title: docker plugin upgrade
@z

@x
  - path: /reference/cli/docker/ps/
    title: docker ps
  - path: /reference/cli/docker/pull/
    title: docker pull
  - path: /reference/cli/docker/push/
    title: docker push
  - path: /reference/cli/docker/run/
    title: docker run
@y
  - path: __SUBDIR__/reference/cli/docker/ps/
    title: docker ps
  - path: __SUBDIR__/reference/cli/docker/pull/
    title: docker pull
  - path: __SUBDIR__/reference/cli/docker/push/
    title: docker push
  - path: __SUBDIR__/reference/cli/docker/run/
    title: docker run
@z

@x
  - sectiontitle: docker scout
    section:
    - path: /reference/cli/docker/scout/
      title: docker scout
    - path: /reference/cli/docker/scout/attestation/
      title: docker scout attestation
    - path: /reference/cli/docker/scout/attestation/add/
      title: docker scout attestation add
    - path: /reference/cli/docker/scout/cache/
      title: docker scout cache
    - path: /reference/cli/docker/scout/cache/df/
      title: docker scout cache df
    - path: /reference/cli/docker/scout/cache/prune/
      title: docker scout cache prune
    - path: /reference/cli/docker/scout/compare/
      title: docker scout compare
    - path: /reference/cli/docker/scout/config/
      title: docker scout config
    - path: /reference/cli/docker/scout/cves/
      title: docker scout cves
@y
  - sectiontitle: docker scout
    section:
    - path: __SUBDIR__/reference/cli/docker/scout/
      title: docker scout
    - path: __SUBDIR__/reference/cli/docker/scout/attestation/
      title: docker scout attestation
    - path: __SUBDIR__/reference/cli/docker/scout/attestation/add/
      title: docker scout attestation add
    - path: __SUBDIR__/reference/cli/docker/scout/cache/
      title: docker scout cache
    - path: __SUBDIR__/reference/cli/docker/scout/cache/df/
      title: docker scout cache df
    - path: __SUBDIR__/reference/cli/docker/scout/cache/prune/
      title: docker scout cache prune
    - path: __SUBDIR__/reference/cli/docker/scout/compare/
      title: docker scout compare
    - path: __SUBDIR__/reference/cli/docker/scout/config/
      title: docker scout config
    - path: __SUBDIR__/reference/cli/docker/scout/cves/
      title: docker scout cves
@z

@x
    - path: /reference/cli/docker/scout/enroll/
      title: docker scout enroll
    - path: /reference/cli/docker/scout/environment/
      title: docker scout environment
    - path: /reference/cli/docker/scout/integration/
      title: docker scout integration
    - path: /reference/cli/docker/scout/integration/configure/
      title: docker scout integration configure
    - path: /reference/cli/docker/scout/integration/delete/
      title: docker scout integration delete
    - path: /reference/cli/docker/scout/integration/list/
      title: docker scout integration list
@y
    - path: __SUBDIR__/reference/cli/docker/scout/enroll/
      title: docker scout enroll
    - path: __SUBDIR__/reference/cli/docker/scout/environment/
      title: docker scout environment
    - path: __SUBDIR__/reference/cli/docker/scout/integration/
      title: docker scout integration
    - path: __SUBDIR__/reference/cli/docker/scout/integration/configure/
      title: docker scout integration configure
    - path: __SUBDIR__/reference/cli/docker/scout/integration/delete/
      title: docker scout integration delete
    - path: __SUBDIR__/reference/cli/docker/scout/integration/list/
      title: docker scout integration list
@z

@x
    - path: /reference/cli/docker/scout/policy/
      title: docker scout policy
    - path: /reference/cli/docker/scout/push/
      title: docker scout push
    - path: /reference/cli/docker/scout/quickview/
      title: docker scout quickview
    - path: /reference/cli/docker/scout/recommendations/
      title: docker scout recommendations
    - path: /reference/cli/docker/scout/repo/
      title: docker scout repo
    - path: /reference/cli/docker/scout/repo/disable/
      title: docker scout repo disable
@y
    - path: __SUBDIR__/reference/cli/docker/scout/policy/
      title: docker scout policy
    - path: __SUBDIR__/reference/cli/docker/scout/push/
      title: docker scout push
    - path: __SUBDIR__/reference/cli/docker/scout/quickview/
      title: docker scout quickview
    - path: __SUBDIR__/reference/cli/docker/scout/recommendations/
      title: docker scout recommendations
    - path: __SUBDIR__/reference/cli/docker/scout/repo/
      title: docker scout repo
    - path: __SUBDIR__/reference/cli/docker/scout/repo/disable/
      title: docker scout repo disable
@z

@x
    - path: /reference/cli/docker/scout/repo/enable/
      title: docker scout repo enable
    - path: /reference/cli/docker/scout/repo/list/
      title: docker scout repo list
    - path: /reference/cli/docker/scout/sbom/
      title: docker scout sbom
    - path: /reference/cli/docker/scout/stream/
      title: docker scout stream
    - path: /reference/cli/docker/scout/version/
      title: docker scout version
    - path: /reference/cli/docker/scout/watch/
      title: docker scout watch
@y
    - path: __SUBDIR__/reference/cli/docker/scout/repo/enable/
      title: docker scout repo enable
    - path: __SUBDIR__/reference/cli/docker/scout/repo/list/
      title: docker scout repo list
    - path: __SUBDIR__/reference/cli/docker/scout/sbom/
      title: docker scout sbom
    - path: __SUBDIR__/reference/cli/docker/scout/stream/
      title: docker scout stream
    - path: __SUBDIR__/reference/cli/docker/scout/version/
      title: docker scout version
    - path: __SUBDIR__/reference/cli/docker/scout/watch/
      title: docker scout watch
@z

@x
  - path: /reference/cli/docker/search/
    title: docker search
@y
  - path: __SUBDIR__/reference/cli/docker/search/
    title: docker search
@z

@x
  - sectiontitle: docker secret
    section:
    - path: /reference/cli/docker/secret/
      title: docker secret
    - path: /reference/cli/docker/secret/create/
      title: docker secret create
    - path: /reference/cli/docker/secret/inspect/
      title: docker secret inspect
    - path: /reference/cli/docker/secret/ls/
      title: docker secret ls
    - path: /reference/cli/docker/secret/rm/
      title: docker secret rm
@y
  - sectiontitle: docker secret
    section:
    - path: __SUBDIR__/reference/cli/docker/secret/
      title: docker secret
    - path: __SUBDIR__/reference/cli/docker/secret/create/
      title: docker secret create
    - path: __SUBDIR__/reference/cli/docker/secret/inspect/
      title: docker secret inspect
    - path: __SUBDIR__/reference/cli/docker/secret/ls/
      title: docker secret ls
    - path: __SUBDIR__/reference/cli/docker/secret/rm/
      title: docker secret rm
@z

@x
  - sectiontitle: docker service
    section:
    - path: /reference/cli/docker/service/
      title: docker service
    - path: /reference/cli/docker/service/create/
      title: docker service create
    - path: /reference/cli/docker/service/inspect/
      title: docker service inspect
    - path: /reference/cli/docker/service/logs/
      title: docker service logs
    - path: /reference/cli/docker/service/ls/
      title: docker service ls
    - path: /reference/cli/docker/service/ps/
      title: docker service ps
    - path: /reference/cli/docker/service/rollback/
      title: docker service rollback
    - path: /reference/cli/docker/service/rm/
      title: docker service rm
    - path: /reference/cli/docker/service/scale/
      title: docker service scale
    - path: /reference/cli/docker/service/update/
      title: docker service update
@y
  - sectiontitle: docker service
    section:
    - path: __SUBDIR__/reference/cli/docker/service/
      title: docker service
    - path: __SUBDIR__/reference/cli/docker/service/create/
      title: docker service create
    - path: __SUBDIR__/reference/cli/docker/service/inspect/
      title: docker service inspect
    - path: __SUBDIR__/reference/cli/docker/service/logs/
      title: docker service logs
    - path: __SUBDIR__/reference/cli/docker/service/ls/
      title: docker service ls
    - path: __SUBDIR__/reference/cli/docker/service/ps/
      title: docker service ps
    - path: __SUBDIR__/reference/cli/docker/service/rollback/
      title: docker service rollback
    - path: __SUBDIR__/reference/cli/docker/service/rm/
      title: docker service rm
    - path: __SUBDIR__/reference/cli/docker/service/scale/
      title: docker service scale
    - path: __SUBDIR__/reference/cli/docker/service/update/
      title: docker service update
@z

@x
  - sectiontitle: docker stack
    section:
    - path: /reference/cli/docker/stack/
      title: docker stack
    - path: /reference/cli/docker/stack/config/
      title: docker stack config
    - path: /reference/cli/docker/stack/deploy/
      title: docker stack deploy
    - path: /reference/cli/docker/stack/ls/
      title: docker stack ls
    - path: /reference/cli/docker/stack/ps/
      title: docker stack ps
    - path: /reference/cli/docker/stack/rm/
      title: docker stack rm
    - path: /reference/cli/docker/stack/services/
      title: docker stack services
@y
  - sectiontitle: docker stack
    section:
    - path: __SUBDIR__/reference/cli/docker/stack/
      title: docker stack
    - path: __SUBDIR__/reference/cli/docker/stack/config/
      title: docker stack config
    - path: __SUBDIR__/reference/cli/docker/stack/deploy/
      title: docker stack deploy
    - path: __SUBDIR__/reference/cli/docker/stack/ls/
      title: docker stack ls
    - path: __SUBDIR__/reference/cli/docker/stack/ps/
      title: docker stack ps
    - path: __SUBDIR__/reference/cli/docker/stack/rm/
      title: docker stack rm
    - path: __SUBDIR__/reference/cli/docker/stack/services/
      title: docker stack services
@z

@x
  - sectiontitle: docker swarm
    section:
    - path: /reference/cli/docker/swarm/
      title: docker swarm
    - path: /reference/cli/docker/swarm/ca/
      title: docker swarm ca
    - path: /reference/cli/docker/swarm/init/
      title: docker swarm init
    - path: /reference/cli/docker/swarm/join-token/
      title: docker swarm join-token
    - path: /reference/cli/docker/swarm/join/
      title: docker swarm join
    - path: /reference/cli/docker/swarm/leave/
      title: docker swarm leave
    - path: /reference/cli/docker/swarm/unlock-key/
      title: docker swarm unlock-key
    - path: /reference/cli/docker/swarm/unlock/
      title: docker swarm unlock
    - path: /reference/cli/docker/swarm/update/
      title: docker swarm update
@y
  - sectiontitle: docker swarm
    section:
    - path: __SUBDIR__/reference/cli/docker/swarm/
      title: docker swarm
    - path: __SUBDIR__/reference/cli/docker/swarm/ca/
      title: docker swarm ca
    - path: __SUBDIR__/reference/cli/docker/swarm/init/
      title: docker swarm init
    - path: __SUBDIR__/reference/cli/docker/swarm/join-token/
      title: docker swarm join-token
    - path: __SUBDIR__/reference/cli/docker/swarm/join/
      title: docker swarm join
    - path: __SUBDIR__/reference/cli/docker/swarm/leave/
      title: docker swarm leave
    - path: __SUBDIR__/reference/cli/docker/swarm/unlock-key/
      title: docker swarm unlock-key
    - path: __SUBDIR__/reference/cli/docker/swarm/unlock/
      title: docker swarm unlock
    - path: __SUBDIR__/reference/cli/docker/swarm/update/
      title: docker swarm update
@z

@x
  - sectiontitle: docker system
    section:
    - path: /reference/cli/docker/system/
      title: docker system
    - path: /reference/cli/docker/system/df/
      title: docker system df
    - path: /reference/cli/docker/system/events/
      title: docker system events
    - path: /reference/cli/docker/system/info/
      title: docker system info
    - path: /reference/cli/docker/system/prune/
      title: docker system prune
@y
  - sectiontitle: docker system
    section:
    - path: __SUBDIR__/reference/cli/docker/system/
      title: docker system
    - path: __SUBDIR__/reference/cli/docker/system/df/
      title: docker system df
    - path: __SUBDIR__/reference/cli/docker/system/events/
      title: docker system events
    - path: __SUBDIR__/reference/cli/docker/system/info/
      title: docker system info
    - path: __SUBDIR__/reference/cli/docker/system/prune/
      title: docker system prune
@z

@x
  - sectiontitle: docker trust
    section:
    - path: /reference/cli/docker/trust/
      title: docker trust
    - path: /reference/cli/docker/trust/inspect/
      title: docker trust inspect
    - path: /reference/cli/docker/trust/key/
      title: docker trust key
    - path: /reference/cli/docker/trust/key/generate/
      title: docker trust key generate
    - path: /reference/cli/docker/trust/key/load/
      title: docker trust key load
    - path: /reference/cli/docker/trust/revoke/
      title: docker trust revoke
    - path: /reference/cli/docker/trust/sign/
      title: docker trust sign
    - path: /reference/cli/docker/trust/signer/
      title: docker trust signer
    - path: /reference/cli/docker/trust/signer/add/
      title: docker trust signer add
    - path: /reference/cli/docker/trust/signer/remove/
      title: docker trust signer remove
@y
  - sectiontitle: docker trust
    section:
    - path: __SUBDIR__/reference/cli/docker/trust/
      title: docker trust
    - path: __SUBDIR__/reference/cli/docker/trust/inspect/
      title: docker trust inspect
    - path: __SUBDIR__/reference/cli/docker/trust/key/
      title: docker trust key
    - path: __SUBDIR__/reference/cli/docker/trust/key/generate/
      title: docker trust key generate
    - path: __SUBDIR__/reference/cli/docker/trust/key/load/
      title: docker trust key load
    - path: __SUBDIR__/reference/cli/docker/trust/revoke/
      title: docker trust revoke
    - path: __SUBDIR__/reference/cli/docker/trust/sign/
      title: docker trust sign
    - path: __SUBDIR__/reference/cli/docker/trust/signer/
      title: docker trust signer
    - path: __SUBDIR__/reference/cli/docker/trust/signer/add/
      title: docker trust signer add
    - path: __SUBDIR__/reference/cli/docker/trust/signer/remove/
      title: docker trust signer remove
@z

@x
  - path: /reference/cli/docker/version/
    title: docker version
@y
  - path: __SUBDIR__/reference/cli/docker/version/
    title: docker version
@z

@x
  - sectiontitle: docker volume
    section:
    - path: /reference/cli/docker/volume/create/
      title: docker volume create
    - path: /reference/cli/docker/volume/inspect/
      title: docker volume inspect
    - path: /reference/cli/docker/volume/ls/
      title: docker volume ls
    - path: /reference/cli/docker/volume/prune/
      title: docker volume prune
    - path: /reference/cli/docker/volume/rm/
      title: docker volume rm
    - path: /reference/cli/docker/volume/update/
      title: docker volume update
@y
  - sectiontitle: docker volume
    section:
    - path: __SUBDIR__/reference/cli/docker/volume/create/
      title: docker volume create
    - path: __SUBDIR__/reference/cli/docker/volume/inspect/
      title: docker volume inspect
    - path: __SUBDIR__/reference/cli/docker/volume/ls/
      title: docker volume ls
    - path: __SUBDIR__/reference/cli/docker/volume/prune/
      title: docker volume prune
    - path: __SUBDIR__/reference/cli/docker/volume/rm/
      title: docker volume rm
    - path: __SUBDIR__/reference/cli/docker/volume/update/
      title: docker volume update
@z

@x
- title: Dockerfile reference
  path: /reference/dockerfile/
@y
- title: Dockerfile リファレンス
  path: __SUBDIR__/reference/dockerfile/
@z

@x
- sectiontitle: Build checks
  section:
  - path: /reference/build-checks/
    title: Overview
  - path: /reference/build-checks/stage-name-casing/
    title: StageNameCasing
  - path: /reference/build-checks/from-as-casing/
    title: FromAsCasing
  - path: /reference/build-checks/no-empty-continuation/
    title: NoEmptyContinuation
  - path: /reference/build-checks/consistent-instruction-casing/
    title: ConsistentInstructionCasing
@y
- sectiontitle: Build checks
  section:
  - path: __SUBDIR__/reference/build-checks/
    title: Overview
  - path: __SUBDIR__/reference/build-checks/stage-name-casing/
    title: StageNameCasing
  - path: __SUBDIR__/reference/build-checks/from-as-casing/
    title: FromAsCasing
  - path: __SUBDIR__/reference/build-checks/no-empty-continuation/
    title: NoEmptyContinuation
  - path: __SUBDIR__/reference/build-checks/consistent-instruction-casing/
    title: ConsistentInstructionCasing
@z

@x
  - path: /reference/build-checks/file-consistent-command-casing/
    title: FileConsistentCommandCasing
  - path: /reference/build-checks/duplicate-stage-name/
    title: DuplicateStageName
  - path: /reference/build-checks/reserved-stage-name/
    title: ReservedStageName
  - path: /reference/build-checks/json-args-recommended/
    title: JSONArgsRecommended
  - path: /reference/build-checks/maintainer-deprecated/
    title: MaintainerDeprecated
@y
  - path: __SUBDIR__/reference/build-checks/file-consistent-command-casing/
    title: FileConsistentCommandCasing
  - path: __SUBDIR__/reference/build-checks/duplicate-stage-name/
    title: DuplicateStageName
  - path: __SUBDIR__/reference/build-checks/reserved-stage-name/
    title: ReservedStageName
  - path: __SUBDIR__/reference/build-checks/json-args-recommended/
    title: JSONArgsRecommended
  - path: __SUBDIR__/reference/build-checks/maintainer-deprecated/
    title: MaintainerDeprecated
@z

@x
  - path: /reference/build-checks/undefined-arg-in-from/
    title: UndefinedArgInFrom
  - path: /reference/build-checks/workdir-relative-path/
    title: WorkdirRelativePath
  - path: /reference/build-checks/undefined-var/
    title: UndefinedVar
  - path: /reference/build-checks/multiple-instructions-disallowed/
    title: MultipleInstructionsDisallowed
  - path: /reference/build-checks/legacy-key-value-format/
    title: LegacyKeyValueFormat
@y
  - path: __SUBDIR__/reference/build-checks/undefined-arg-in-from/
    title: UndefinedArgInFrom
  - path: __SUBDIR__/reference/build-checks/workdir-relative-path/
    title: WorkdirRelativePath
  - path: __SUBDIR__/reference/build-checks/undefined-var/
    title: UndefinedVar
  - path: __SUBDIR__/reference/build-checks/multiple-instructions-disallowed/
    title: MultipleInstructionsDisallowed
  - path: __SUBDIR__/reference/build-checks/legacy-key-value-format/
    title: LegacyKeyValueFormat
@z

@x
- title: Daemon CLI (dockerd)
  path: /reference/cli/dockerd/
@y
- title: デーモン CLI (dockerd)
  path: __SUBDIR__/reference/cli/dockerd/
@z

@x
- sectiontitle: API reference
  section:
  - sectiontitle: Docker Engine API
    section:
    - path: /engine/api/
      title: Overview
    - path: /engine/api/sdk/
      title: SDKs
    - path: /engine/api/sdk/examples/
      title: SDK examples
@y
- sectiontitle: API リファレンス
  section:
  - sectiontitle: Docker Engine API
    section:
    - path: __SUBDIR__/engine/api/
      title: Overview
    - path: __SUBDIR__/engine/api/sdk/
      title: SDKs
    - path: __SUBDIR__/engine/api/sdk/examples/
      title: SDK 利用例
@z

@x
    - path: /engine/api/latest/
      title: v{{< param latest_engine_api_version >}} reference (latest)
@y
    - path: __SUBDIR__/engine/api/latest/
      title: v{{< param latest_engine_api_version >}} リファレンス (最新)
@z

@x
    - sectiontitle: API reference by version
      section:
      - path: /engine/api/version-history/
        title: Version history overview
@y
    - sectiontitle: 各バージョンの API
      section:
      - path: __SUBDIR__/engine/api/version-history/
        title: バージョンの履歴概要
@z

@x
      - path: /engine/api/v1.45/
        title: v1.45 reference
      - path: /engine/api/v1.44/
        title: v1.44 reference
      - path: /engine/api/v1.43/
        title: v1.43 reference
      - path: /engine/api/v1.42/
        title: v1.42 reference
      - path: /engine/api/v1.41/
        title: v1.41 reference
      - path: /engine/api/v1.40/
        title: v1.40 reference
      - path: /engine/api/v1.39/
        title: v1.39 reference
      - path: /engine/api/v1.38/
        title: v1.38 reference
      - path: /engine/api/v1.37/
        title: v1.37 reference
      - path: /engine/api/v1.36/
        title: v1.36 reference
      - path: /engine/api/v1.35/
        title: v1.35 reference
      - path: /engine/api/v1.34/
        title: v1.34 reference
      - path: /engine/api/v1.33/
        title: v1.33 reference
      - path: /engine/api/v1.32/
        title: v1.32 Reference
      - path: /engine/api/v1.31/
        title: v1.31 Reference
      - path: /engine/api/v1.30/
        title: v1.30 Reference
      - path: /engine/api/v1.29/
        title: v1.29 Reference
      - path: /engine/api/v1.28/
        title: v1.28 reference
      - path: /engine/api/v1.27/
        title: v1.27 reference
      - path: /engine/api/v1.26/
        title: v1.26 reference
      - path: /engine/api/v1.25/
        title: v1.25 reference
      - path: /engine/api/v1.24/
        title: v1.24 reference
@y
      - path: __SUBDIR__/engine/api/v1.45/
        title: v1.45 リファレンス
      - path: __SUBDIR__/engine/api/v1.44/
        title: v1.44 リファレンス
      - path: __SUBDIR__/engine/api/v1.43/
        title: v1.43 リファレンス
      - path: __SUBDIR__/engine/api/v1.42/
        title: v1.42 リファレンス
      - path: __SUBDIR__/engine/api/v1.41/
        title: v1.41 リファレンス
      - path: __SUBDIR__/engine/api/v1.40/
        title: v1.40 リファレンス
      - path: __SUBDIR__/engine/api/v1.39/
        title: v1.39 リファレンス
      - path: __SUBDIR__/engine/api/v1.38/
        title: v1.38 リファレンス
      - path: __SUBDIR__/engine/api/v1.37/
        title: v1.37 リファレンス
      - path: __SUBDIR__/engine/api/v1.36/
        title: v1.36 リファレンス
      - path: __SUBDIR__/engine/api/v1.35/
        title: v1.35 リファレンス
      - path: __SUBDIR__/engine/api/v1.34/
        title: v1.34 リファレンス
      - path: __SUBDIR__/engine/api/v1.33/
        title: v1.33 リファレンス
      - path: __SUBDIR__/engine/api/v1.32/
        title: v1.32 リファレンス
      - path: __SUBDIR__/engine/api/v1.31/
        title: v1.31 リファレンス
      - path: __SUBDIR__/engine/api/v1.30/
        title: v1.30 リファレンス
      - path: __SUBDIR__/engine/api/v1.29/
        title: v1.29 リファレンス
      - path: __SUBDIR__/engine/api/v1.28/
        title: v1.28 リファレンス
      - path: __SUBDIR__/engine/api/v1.27/
        title: v1.27 リファレンス
      - path: __SUBDIR__/engine/api/v1.26/
        title: v1.26 リファレンス
      - path: __SUBDIR__/engine/api/v1.25/
        title: v1.25 リファレンス
      - path: __SUBDIR__/engine/api/v1.24/
        title: v1.24 リファレンス
@z

@x
  - sectiontitle: Docker Hub API
    section:
      - title: Docker Hub API
        path: /docker-hub/api/latest/
      - title: DVP Data API
        path: /docker-hub/api/dvp/
      - title: Deprecated API
        path: /docker-hub/api/deprecated/
@y
  - sectiontitle: Docker Hub API
    section:
      - title: Docker Hub API
        path: __SUBDIR__/docker-hub/api/latest/
      - title: DVP Data API
        path: __SUBDIR__/docker-hub/api/dvp/
      - title: 非推奨となった API
        path: __SUBDIR__/docker-hub/api/deprecated/
@z

@x
  - sectiontitle: Docker Extension SDK API
    section:
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/DesktopUI/
        title: DesktopUI
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/Dialog/
        title: Dialog
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/Docker/
        title: Docker
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/DockerCommand/
        title: DockerCommand
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/DockerDesktopClient/
        title: DockerDesktopClient
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/Exec/
        title: Exec
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/ExecProcess/
        title: ExecProcess
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/ExecResult/
        title: ExecResult
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/ExecStreamOptions/
        title: ExecStreamOptions
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/Extension/
        title: Extension
@y
  - sectiontitle: Docker Extension SDK API
    section:
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/DesktopUI/
        title: DesktopUI
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/Dialog/
        title: Dialog
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/Docker/
        title: Docker
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/DockerCommand/
        title: DockerCommand
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/DockerDesktopClient/
        title: DockerDesktopClient
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/Exec/
        title: Exec
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/ExecProcess/
        title: ExecProcess
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/ExecResult/
        title: ExecResult
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/ExecStreamOptions/
        title: ExecStreamOptions
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/Extension/
        title: Extension
@z

@x
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/ExtensionCli/
        title: ExtensionCli
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/ExtensionHost/
        title: ExtensionHost
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/ExtensionVM/
        title: ExtensionVM
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/Host/
        title: Host
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/HttpService/
        title: HttpService
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/NavigationIntents/
        title: NavigationIntents
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/OpenDialogResult/
        title: OpenDialogResult
@y
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/ExtensionCli/
        title: ExtensionCli
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/ExtensionHost/
        title: ExtensionHost
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/ExtensionVM/
        title: ExtensionVM
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/Host/
        title: Host
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/HttpService/
        title: HttpService
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/NavigationIntents/
        title: NavigationIntents
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/OpenDialogResult/
        title: OpenDialogResult
@z

@x
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/RawExecResult/
        title: RawExecResult
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/RequestConfig/
        title: RequestConfig
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/RequestConfigV0/
        title: RequestConfigV0
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/Toast/
        title: Toast
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/ExecResultV0/
        title: ExecResultV0
      - path: /desktop/extensions-sdk/dev/api/reference/interfaces/BackendV0/
        title: BackendV0
@y
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/RawExecResult/
        title: RawExecResult
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/RequestConfig/
        title: RequestConfig
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/RequestConfigV0/
        title: RequestConfigV0
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/Toast/
        title: Toast
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/ExecResultV0/
        title: ExecResultV0
      - path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/interfaces/BackendV0/
        title: BackendV0
@z

@x
- sectiontitle: Compose file reference
  section:
    - sectiontitle: Compose Specification
      section:
      - path: /compose/compose-file/
        title: Overview
      - path: /compose/compose-file/04-version-and-name/
        title: Version and name top-level element
      - path: /compose/compose-file/05-services/
        title: Services top-level element
      - path: /compose/compose-file/06-networks/
        title: Network top-level element
      - path: /compose/compose-file/07-volumes/
        title: Volumes top-level element
@y
- sectiontitle: Compose ファイルリファレンス
  section:
    - sectiontitle: Compose 仕様
      section:
      - path: __SUBDIR__/compose/compose-file/
        title: 概要
      - path: __SUBDIR__/compose/compose-file/04-version-and-name/
        title: Version and name top-level element
      - path: __SUBDIR__/compose/compose-file/05-services/
        title: Services top-level element
      - path: __SUBDIR__/compose/compose-file/06-networks/
        title: Network top-level element
      - path: __SUBDIR__/compose/compose-file/07-volumes/
        title: Volumes top-level element
@z

@x
      - path: /compose/compose-file/08-configs/
        title: Configs top-level element
      - path: /compose/compose-file/09-secrets/
        title: Secrets top-level element
      - path: /compose/compose-file/10-fragments/
        title: Fragments
      - path: /compose/compose-file/11-extension/
        title: Extensions
      - path: /compose/compose-file/12-interpolation/
        title: Interpolation
      - path: /compose/compose-file/13-merge/
        title: Merge
      - path: /compose/compose-file/14-include/
        title: Include
      - path: /compose/compose-file/15-profiles/
        title: Profiles
@y
      - path: __SUBDIR__/compose/compose-file/08-configs/
        title: Configs top-level element
      - path: __SUBDIR__/compose/compose-file/09-secrets/
        title: Secrets top-level element
      - path: __SUBDIR__/compose/compose-file/10-fragments/
        title: Fragments
      - path: __SUBDIR__/compose/compose-file/11-extension/
        title: Extensions
      - path: __SUBDIR__/compose/compose-file/12-interpolation/
        title: Interpolation
      - path: __SUBDIR__/compose/compose-file/13-merge/
        title: Merge
      - path: __SUBDIR__/compose/compose-file/14-include/
        title: Include
      - path: __SUBDIR__/compose/compose-file/15-profiles/
        title: Profiles
@z

@x
    - path: /compose/compose-file/build/
      title: Compose Build Specification
    - path: /compose/compose-file/deploy/
      title: Compose Deploy Specification
    - path: /compose/compose-file/develop/
      title: Compose Develop Specification
    - path: /compose/compose-file/legacy-versions/
      title: Legacy versions
@y
    - path: __SUBDIR__/compose/compose-file/build/
      title: Compose Build Specification
    - path: __SUBDIR__/compose/compose-file/deploy/
      title: Compose Deploy Specification
    - path: __SUBDIR__/compose/compose-file/develop/
      title: Compose Develop Specification
    - path: __SUBDIR__/compose/compose-file/legacy-versions/
      title: Legacy versions
@z

@x
- path: /glossary/
  title: Glossary
@y
- path: __SUBDIR__/glossary/
  title: 用語集
@z

@x
- sectiontitle: Samples
  section:
  - path: /samples/
    title: Overview
  - sectiontitle: Databases
    section:
      - path: /samples/mariadb/
        title: MariaDB
      - path: /samples/mongodb/
        title: MongoDB
      - path: /samples/ms-sql/
        title: MS-SQL
      - path: /samples/mysql/
        title: MySQL
      - path: /samples/postgres/
        title: PostgreSQL
      - path: /samples/redis/
        title: Redis
@y
- sectiontitle: サンプル
  section:
  - path: __SUBDIR__/samples/
    title: 概要
  - sectiontitle: データベース
    section:
      - path: __SUBDIR__/samples/mariadb/
        title: MariaDB
      - path: __SUBDIR__/samples/mongodb/
        title: MongoDB
      - path: __SUBDIR__/samples/ms-sql/
        title: MS-SQL
      - path: __SUBDIR__/samples/mysql/
        title: MySQL
      - path: __SUBDIR__/samples/postgres/
        title: PostgreSQL
      - path: __SUBDIR__/samples/redis/
        title: Redis
@z

@x
  - sectiontitle: Frameworks
    section:
      - path: /samples/dotnet/
        title: .NET
      - path: /samples/angular/
        title: Angular
      - path: /samples/django/
        title: Django
      - path: /samples/express/
        title: Express
      - path: /samples/fastapi/
        title: FastAPI
      - path: /samples/flask/
        title: Flask
      - path: /samples/nodejs/
        title: Node.js
      - path: /samples/react/
        title: React
      - path: /samples/rails/
        title: Rails
      - path: /samples/spark/
        title: Spark
      - path: /samples/spring/
        title: Spring Boot
      - path: /samples/vuejs/
        title: Vue.js
@y
  - sectiontitle: フレームワーク
    section:
      - path: __SUBDIR__/samples/dotnet/
        title: .NET
      - path: __SUBDIR__/samples/angular/
        title: Angular
      - path: __SUBDIR__/samples/django/
        title: Django
      - path: __SUBDIR__/samples/express/
        title: Express
      - path: __SUBDIR__/samples/fastapi/
        title: FastAPI
      - path: __SUBDIR__/samples/flask/
        title: Flask
      - path: __SUBDIR__/samples/nodejs/
        title: Node.js
      - path: __SUBDIR__/samples/react/
        title: React
      - path: __SUBDIR__/samples/rails/
        title: Rails
      - path: __SUBDIR__/samples/spark/
        title: Spark
      - path: __SUBDIR__/samples/spring/
        title: Spring Boot
      - path: __SUBDIR__/samples/vuejs/
        title: Vue.js
@z

@x
  - sectiontitle: Languages
    section:
      - path: /samples/go/
        title: Go
      - path: /samples/java/
        title: Java
      - path: /samples/javascript/
        title: JavaScript
      - path: /samples/php/
        title: PHP
      - path: /samples/python/
        title: Python
      - path: /samples/ruby/
        title: Ruby
      - path: /samples/rust/
        title: Rust
      - path: /samples/typescript/
        title: TypeScript
@y
  - sectiontitle: 言語
    section:
      - path: __SUBDIR__/samples/go/
        title: Go
      - path: __SUBDIR__/samples/java/
        title: Java
      - path: __SUBDIR__/samples/javascript/
        title: JavaScript
      - path: __SUBDIR__/samples/php/
        title: PHP
      - path: __SUBDIR__/samples/python/
        title: Python
      - path: __SUBDIR__/samples/ruby/
        title: Ruby
      - path: __SUBDIR__/samples/rust/
        title: Rust
      - path: __SUBDIR__/samples/typescript/
        title: TypeScript
@z

@x
  - sectiontitle: Platforms
    section:
      - path: /samples/gitea/
        title: Gitea
      - path: /samples/nextcloud/
        title: Nextcloud
      - path: /samples/portainer/
        title: Portainer
      - path: /samples/prometheus/
        title: Prometheus
      - path: /samples/wordpress/
        title: WordPress
@y
  - sectiontitle: プラットフォーム
    section:
      - path: __SUBDIR__/samples/gitea/
        title: Gitea
      - path: __SUBDIR__/samples/nextcloud/
        title: Nextcloud
      - path: __SUBDIR__/samples/portainer/
        title: Portainer
      - path: __SUBDIR__/samples/prometheus/
        title: Prometheus
      - path: __SUBDIR__/samples/wordpress/
        title: WordPress
@z

@x
  - sectiontitle: Other samples
    section:
      - path: /samples/ai-ml/
        title: AI/ML
      - path: /samples/cloudflared/
        title: Cloudflared
      - path: /samples/elasticsearch/
        title: Elasticsearch / Logstash / Kibana
      - path: /samples/minecraft/
        title: Minecraft
      - path: /samples/nginx/
        title: NGINX
      - path: /samples/pi-hole/
        title: Pi-hole
      - path: /samples/plex/
        title: Plex
      - path: /samples/traefik/
        title: Traefik
      - path: /samples/wireguard/
        title: Wireguard
@y
  - sectiontitle: その他のサンプル
    section:
      - path: __SUBDIR__/samples/ai-ml/
        title: AI/ML
      - path: __SUBDIR__/samples/cloudflared/
        title: Cloudflared
      - path: __SUBDIR__/samples/elasticsearch/
        title: Elasticsearch / Logstash / Kibana
      - path: __SUBDIR__/samples/minecraft/
        title: Minecraft
      - path: __SUBDIR__/samples/nginx/
        title: NGINX
      - path: __SUBDIR__/samples/pi-hole/
        title: Pi-hole
      - path: __SUBDIR__/samples/plex/
        title: Plex
      - path: __SUBDIR__/samples/traefik/
        title: Traefik
      - path: __SUBDIR__/samples/wireguard/
        title: Wireguard
@z

@x
Manuals:
- path: /manuals/
  title: Overview
- title: Get Docker
  path: /get-docker/
@y
マニュアル:
- path: __SUBDIR__/manuals/
  title: 概要
- title: Docker の入手
  path: __SUBDIR__/get-docker/
@z

@x
- sectiontitle: Docker Desktop
  section:
    - path: /desktop/
      title: Overview
    - sectiontitle: Install 
      section:
       - path: /desktop/install/mac-install/
         title: Mac
       - path: /desktop/mac/permission-requirements/
         title: Understand permission requirements for Mac
       - path: /desktop/install/windows-install/
         title: Windows
@y
- sectiontitle: Docker Desktop
  section:
    - path: __SUBDIR__/desktop/
      title: 概要
    - sectiontitle: インストール
      section:
       - path: __SUBDIR__/desktop/install/mac-install/
         title: Mac
       - path: __SUBDIR__/desktop/mac/permission-requirements/
         title: Mac におけるパーミッション要件への理解
       - path: __SUBDIR__/desktop/install/windows-install/
         title: Windows
@z

@x
       - sectiontitle: Use the MSI installer {{< badge color=violet text="Early Access" >}}
         section:
         - path: /desktop/install/msi/
           title: Overview
         - path: /desktop/install/msi/install-and-configure/
           title: Install and configure
         - path: /desktop/install/msi/use-intune/
           title: Use Intune
         - path: /desktop/install/msi/faq/
           title: FAQs
@y
       - sectiontitle: Use the MSI installer {{< badge color=violet text="Early Access" >}}
         section:
         - path: __SUBDIR__/desktop/install/msi/
           title: Overview
         - path: __SUBDIR__/desktop/install/msi/install-and-configure/
           title: Install and configure
         - path: __SUBDIR__/desktop/install/msi/use-intune/
           title: Use Intune
         - path: __SUBDIR__/desktop/install/msi/faq/
           title: FAQs
@z

@x
       - path: /desktop/windows/permission-requirements/
         title: Understand permission requirements for Windows
       - path: /desktop/install/linux-install/
         title: Linux
@y
       - path: __SUBDIR__/desktop/windows/permission-requirements/
         title: Windows におけるパーミッション要件への理解
       - path: __SUBDIR__/desktop/install/linux-install/
         title: Linux
@z

@x
       - sectiontitle: Installation per Linux distro
         section:
            - path: /desktop/install/ubuntu/
              title: Ubuntu
            - path: /desktop/install/debian/
              title: Debian
            - path: /desktop/install/fedora/
              title: Fedora
            - path: /desktop/install/archlinux/
              title: Arch
@y
       - sectiontitle: Linux ディストロごとのインストール
         section:
            - path: __SUBDIR__/desktop/install/ubuntu/
              title: Ubuntu
            - path: __SUBDIR__/desktop/install/debian/
              title: Debian
            - path: __SUBDIR__/desktop/install/fedora/
              title: Fedora
            - path: __SUBDIR__/desktop/install/archlinux/
              title: Arch
@z

@x
    - path: /desktop/get-started/
      title: Sign in
    - sectiontitle: Explore Docker Desktop
      section:
        - path: /desktop/use-desktop/
          title: Overview
        - path: /desktop/use-desktop/container/
          title: Explore Containers
        - path: /desktop/use-desktop/images/
          title: Explore Images
        - path: /desktop/use-desktop/volumes/
          title: Explore Volumes
        - path: /desktop/use-desktop/builds/
          title: Explore Builds 
        - path: /desktop/use-desktop/resource-saver/
          title: Resource Saver mode
        - path: /desktop/use-desktop/pause/
          title: Pause Docker Desktop
@y
    - path: __SUBDIR__/desktop/get-started/
      title: サインイン
    - sectiontitle: Docker Desktop の確認
      section:
        - path: __SUBDIR__/desktop/use-desktop/
          title: 概要
        - path: __SUBDIR__/desktop/use-desktop/container/
          title: コンテナーの確認
        - path: __SUBDIR__/desktop/use-desktop/images/
          title: イメージの確認
        - path: __SUBDIR__/desktop/use-desktop/volumes/
          title: ボリュームの確認
        - path: __SUBDIR__/desktop/use-desktop/builds/
          title: ビルドの確認
        - path: __SUBDIR__/desktop/use-desktop/resource-saver/
          title: Resource Saver mode
        - path: __SUBDIR__/desktop/use-desktop/pause/
          title: Docker Desktop の一時停止
@z

@x
    - sectiontitle: Hardened Docker Desktop
      section:
        - path: /desktop/hardened-desktop/
          title: Overview
        - sectiontitle: Settings Management
          section:
          - path: /desktop/hardened-desktop/settings-management/
            title: What is Settings Management?
          - path: /desktop/hardened-desktop/settings-management/configure/
            title: Configure Settings Management
@y
    - sectiontitle: Hardened Docker Desktop
      section:
        - path: __SUBDIR__/desktop/hardened-desktop/
          title: 概要
        - sectiontitle: Settings Management
          section:
          - path: __SUBDIR__/desktop/hardened-desktop/settings-management/
            title: What is Settings Management?
          - path: __SUBDIR__/desktop/hardened-desktop/settings-management/configure/
            title: Configure Settings Management
@z

@x
        - sectiontitle: Enhanced Container Isolation
          section:
          - path: /desktop/hardened-desktop/enhanced-container-isolation/
            title: What is Enhanced Container Isolation?
          - path: /desktop/hardened-desktop/enhanced-container-isolation/how-eci-works/
            title: How does it work?
          - path: /desktop/hardened-desktop/enhanced-container-isolation/features-benefits/
            title: Key features and benefits
          - path: /desktop/hardened-desktop/enhanced-container-isolation/config/
            title: Advanced configuration options
@y
        - sectiontitle: Enhanced Container Isolation
          section:
          - path: __SUBDIR__/desktop/hardened-desktop/enhanced-container-isolation/
            title: What is Enhanced Container Isolation?
          - path: __SUBDIR__/desktop/hardened-desktop/enhanced-container-isolation/how-eci-works/
            title: How does it work?
          - path: __SUBDIR__/desktop/hardened-desktop/enhanced-container-isolation/features-benefits/
            title: Key features and benefits
          - path: __SUBDIR__/desktop/hardened-desktop/enhanced-container-isolation/config/
            title: Advanced configuration options
@z

@x
        - path: /desktop/hardened-desktop/air-gapped-containers/
          title: Air-Gapped Containers
@y
        - path: __SUBDIR__/desktop/hardened-desktop/air-gapped-containers/
          title: Air-Gapped Containers
@z

@x
    - sectiontitle: Dev Environments (Beta)
      section:
        - path: /desktop/dev-environments/
          title: Overview
        - path: /desktop/dev-environments/create-dev-env/
          title: Launch a dev environment
        - path: /desktop/dev-environments/set-up/
          title: Set up a dev environment
        - path: /desktop/dev-environments/share/
          title: Distribute your dev environment
        - path: /desktop/dev-environments/dev-cli/
          title: Use the docker dev CLI plugin
@y
    - sectiontitle: Dev 環境 (ベータ)
      section:
        - path: __SUBDIR__/desktop/dev-environments/
          title: 概要
        - path: __SUBDIR__/desktop/dev-environments/create-dev-env/
          title: Launch a dev environment
        - path: __SUBDIR__/desktop/dev-environments/set-up/
          title: Set up a dev environment
        - path: __SUBDIR__/desktop/dev-environments/share/
          title: Distribute your dev environment
        - path: __SUBDIR__/desktop/dev-environments/dev-cli/
          title: Use the docker dev CLI plugin
@z

@x
    - path: /desktop/containerd/
      title: containerd image store
    - path: /desktop/wasm/
      title: Wasm workloads (Beta)
    - path: /desktop/synchronized-file-sharing/
      title: Synchronized file shares
@y
    - path: __SUBDIR__/desktop/containerd/
      title: containerd image store
    - path: __SUBDIR__/desktop/wasm/
      title: Wasm workloads (Beta)
    - path: __SUBDIR__/desktop/synchronized-file-sharing/
      title: Synchronized file shares
@z

@x
    - sectiontitle: WSL
      section:
        - path: /desktop/wsl/
          title: Set up WSL 2 on Docker Desktop for Windows
        - path: /desktop/wsl/use-wsl/
          title: Use WSL
        - path: /desktop/wsl/best-practices/
          title: Best practices
@y
    - sectiontitle: WSL
      section:
        - path: __SUBDIR__/desktop/wsl/
          title: Set up WSL 2 on Docker Desktop for Windows
        - path: __SUBDIR__/desktop/wsl/use-wsl/
          title: Use WSL
        - path: __SUBDIR__/desktop/wsl/best-practices/
          title: Best practices
@z

@x
    - path: /desktop/gpu/
      title: GPU support
@y
    - path: __SUBDIR__/desktop/gpu/
      title: GPU サポート
@z

@x
    - sectiontitle: Additional resources
      section:
        - path: /desktop/kubernetes/
          title: Deploy on Kubernetes
        - path: /desktop/backup-and-restore/
          title: Back up and restore data
        - path: /desktop/networking/
          title: Explore networking features
        - path: /desktop/vm-vdi/
          title: Run Docker Desktop for Windows in a VM or VDI environment
        - path: /desktop/allow-list/
          title: Allowlist for Docker Desktop
@y
    - sectiontitle: その他の情報
      section:
        - path: __SUBDIR__/desktop/kubernetes/
          title: Kubernetes へのデプロイ
        - path: __SUBDIR__/desktop/backup-and-restore/
          title: データバックアップと復元
        - path: __SUBDIR__/desktop/networking/
          title: Explore networking features
        - path: __SUBDIR__/desktop/vm-vdi/
          title: VM, VDI 環境での Docker Desktop for Windows 実行
        - path: __SUBDIR__/desktop/allow-list/
          title: Allowlist for Docker Desktop
@z

@x
    - sectiontitle: Change settings
      section:
        - path: /desktop/settings/mac/
          title: On Mac
        - path: /desktop/settings/windows/
          title: On Windows
        - path: /desktop/settings/linux/
          title: On Linux
@y
    - sectiontitle: Change settings
      section:
        - path: __SUBDIR__/desktop/settings/mac/
          title: On Mac
        - path: __SUBDIR__/desktop/settings/windows/
          title: On Windows
        - path: __SUBDIR__/desktop/settings/linux/
          title: On Linux
@z

@x
    - sectiontitle: Troubleshoot and diagnose
      section:
        - path: /desktop/troubleshoot/overview/
          title: Overview
        - path: /desktop/troubleshoot/topics/
          title: Troubleshoot topics
        - path: /desktop/troubleshoot/workarounds/
          title: Workarounds for common problems
        - path: /desktop/troubleshoot/known-issues/
          title: Known issues
@y
    - sectiontitle: Troubleshoot and diagnose
      section:
        - path: __SUBDIR__/desktop/troubleshoot/overview/
          title: Overview
        - path: __SUBDIR__/desktop/troubleshoot/topics/
          title: Troubleshoot topics
        - path: __SUBDIR__/desktop/troubleshoot/workarounds/
          title: Workarounds for common problems
        - path: __SUBDIR__/desktop/troubleshoot/known-issues/
          title: Known issues
@z

@x
    - path: /desktop/uninstall/
      title: Uninstall Docker Desktop
    - path: /desktop/feedback/
      title: Give feedback
@y
    - path: __SUBDIR__/desktop/uninstall/
      title: Uninstall Docker Desktop
    - path: __SUBDIR__/desktop/feedback/
      title: Give feedback
@z

@x
    - sectiontitle: Desktop FAQs
      section:
      - path: /desktop/faqs/general/
        title: General
      - path: /desktop/faqs/macfaqs/
        title: Mac
      - path: /desktop/faqs/windowsfaqs/
        title: Windows
      - path: /desktop/faqs/linuxfaqs/
        title: Linux
      - path: /desktop/faqs/releases/
        title: Releases
@y
    - sectiontitle: Desktop FAQs
      section:
      - path: __SUBDIR__/desktop/faqs/general/
        title: General
      - path: __SUBDIR__/desktop/faqs/macfaqs/
        title: Mac
      - path: __SUBDIR__/desktop/faqs/windowsfaqs/
        title: Windows
      - path: __SUBDIR__/desktop/faqs/linuxfaqs/
        title: Linux
      - path: __SUBDIR__/desktop/faqs/releases/
        title: Releases
@z

@x
    - path: /desktop/release-notes/
      title: Release notes
@y
    - path: __SUBDIR__/desktop/release-notes/
      title: リリースノート
@z

@x
    - sectiontitle: Previous versions
      section:
      - path: /desktop/previous-versions/3.x-windows/
        title: Desktop for Windows 3.x
      - path: /desktop/previous-versions/3.x-mac/
        title: Desktop for Mac 3.x
      - path: /desktop/previous-versions/2.x-windows/
        title: Desktop for Windows 2.x
      - path: /desktop/previous-versions/2.x-mac/
        title: Desktop for Mac 2.x
      - path: /desktop/previous-versions/edge-releases-windows/
        title: Windows edge releases
      - path: /desktop/previous-versions/edge-releases-mac/
        title: Mac edge releases
      - path: /desktop/previous-versions/archive-windows/
        title: Older versions for Windows
      - path: /desktop/previous-versions/archive-mac/
        title: Older versions for Mac
@y
    - sectiontitle: Previous versions
      section:
      - path: __SUBDIR__/desktop/previous-versions/3.x-windows/
        title: Desktop for Windows 3.x
      - path: __SUBDIR__/desktop/previous-versions/3.x-mac/
        title: Desktop for Mac 3.x
      - path: __SUBDIR__/desktop/previous-versions/2.x-windows/
        title: Desktop for Windows 2.x
      - path: __SUBDIR__/desktop/previous-versions/2.x-mac/
        title: Desktop for Mac 2.x
      - path: __SUBDIR__/desktop/previous-versions/edge-releases-windows/
        title: Windows edge releases
      - path: __SUBDIR__/desktop/previous-versions/edge-releases-mac/
        title: Mac edge releases
      - path: __SUBDIR__/desktop/previous-versions/archive-windows/
        title: Older versions for Windows
      - path: __SUBDIR__/desktop/previous-versions/archive-mac/
        title: Older versions for Mac
@z

@x
- sectiontitle: Docker Extensions
  section:
    - path: /desktop/extensions/
      title: Overview
    - sectiontitle: Extensions on Docker Desktop
      section:
        - path: /desktop/extensions/marketplace/
          title: Manage Marketplace extensions
        - path: /desktop/extensions/non-marketplace/
          title: Manage non-Marketplace extensions
        - path: /desktop/extensions/settings-feedback/
          title: Change settings and give feedback
        - path: /desktop/extensions/private-marketplace/
          title: Configure a private Marketplace (Beta)
@y
- sectiontitle: Docker Extensions
  section:
    - path: __SUBDIR__/desktop/extensions/
      title: 概要
    - sectiontitle: Extensions on Docker Desktop
      section:
        - path: __SUBDIR__/desktop/extensions/marketplace/
          title: マーケットプレースの Extensions 管理
        - path: __SUBDIR__/desktop/extensions/non-marketplace/
          title: マーケットプレース以外の Extensions 管理
        - path: __SUBDIR__/desktop/extensions/settings-feedback/
          title: Change settings and give feedback
        - path: __SUBDIR__/desktop/extensions/private-marketplace/
          title: Configure a private Marketplace (Beta)
@z

@x
    - sectiontitle: Extensions SDK
      section:
        - path: /desktop/extensions-sdk/
          title: Overview
        - path: /desktop/extensions-sdk/process/
          title: The build and publish process
        - path: /desktop/extensions-sdk/quickstart/
          title: Quickstart
@y
    - sectiontitle: Extensions SDK
      section:
        - path: __SUBDIR__/desktop/extensions-sdk/
          title: 概要
        - path: __SUBDIR__/desktop/extensions-sdk/process/
          title: The build and publish process
        - path: __SUBDIR__/desktop/extensions-sdk/quickstart/
          title: クィックスタート
@z

@x
        - sectiontitle: "Part one: Build"
          section:
            - title: Create a simple extension
              path: /desktop/extensions-sdk/build/minimal-frontend-extension/
            - title: Create an advanced frontend extension
              path: /desktop/extensions-sdk/build/frontend-extension-tutorial/
            - title: Add a backend to your extension
              path: /desktop/extensions-sdk/build/backend-extension-tutorial/
@y
        - sectiontitle: "Part one: Build"
          section:
            - title: Create a simple extension
              path: __SUBDIR__/desktop/extensions-sdk/build/minimal-frontend-extension/
            - title: Create an advanced frontend extension
              path: __SUBDIR__/desktop/extensions-sdk/build/frontend-extension-tutorial/
            - title: Add a backend to your extension
              path: __SUBDIR__/desktop/extensions-sdk/build/backend-extension-tutorial/
@z

@x
        - sectiontitle: "Part two: Publish"
          section:
            - title: Overview
              path: /desktop/extensions-sdk/extensions/
            - title: Labels
              path: /desktop/extensions-sdk/extensions/labels/
            - title: Validate
              path: /desktop/extensions-sdk/extensions/validate/
            - title: Package and release your extension
              path: /desktop/extensions-sdk/extensions/DISTRIBUTION/
            - title: Generate a share link
              path: /desktop/extensions-sdk/extensions/share/
            - title: Publish in the Marketplace
              path: /desktop/extensions-sdk/extensions/publish/
            - title: Build multi-arch extensions
              path: /desktop/extensions-sdk/extensions/multi-arch/
@y
        - sectiontitle: "Part two: Publish"
          section:
            - title: Overview
              path: __SUBDIR__/desktop/extensions-sdk/extensions/
            - title: Labels
              path: __SUBDIR__/desktop/extensions-sdk/extensions/labels/
            - title: Validate
              path: __SUBDIR__/desktop/extensions-sdk/extensions/validate/
            - title: Package and release your extension
              path: __SUBDIR__/desktop/extensions-sdk/extensions/DISTRIBUTION/
            - title: Generate a share link
              path: __SUBDIR__/desktop/extensions-sdk/extensions/share/
            - title: Publish in the Marketplace
              path: __SUBDIR__/desktop/extensions-sdk/extensions/publish/
            - title: Build multi-arch extensions
              path: __SUBDIR__/desktop/extensions-sdk/extensions/multi-arch/
@z

@x
        - sectiontitle: "Architecture"
          section:
            - title: Overview
              path: /desktop/extensions-sdk/architecture/
            - title: Metadata
              path: /desktop/extensions-sdk/architecture/metadata/
            - title: Security
              path: /desktop/extensions-sdk/architecture/security/
@y
        - sectiontitle: "Architecture"
          section:
            - title: Overview
              path: __SUBDIR__/desktop/extensions-sdk/architecture/
            - title: Metadata
              path: __SUBDIR__/desktop/extensions-sdk/architecture/metadata/
            - title: Security
              path: __SUBDIR__/desktop/extensions-sdk/architecture/security/
@z

@x
        - sectiontitle: "Design and UI styling"
          section:
             - title: UI styling guidelines
               path: /desktop/extensions-sdk/design/
             - title: Guidelines
               path: /desktop/extensions-sdk/design/design-guidelines/
             - title: Docker design principles
               path: /desktop/extensions-sdk/design/design-principles/
             - title: MUI best practices
               path: /desktop/extensions-sdk/design/mui-best-practices/
@y
        - sectiontitle: "Design and UI styling"
          section:
             - title: UI styling guidelines
               path: __SUBDIR__/desktop/extensions-sdk/design/
             - title: Guidelines
               path: __SUBDIR__/desktop/extensions-sdk/design/design-guidelines/
             - title: Docker design principles
               path: __SUBDIR__/desktop/extensions-sdk/design/design-principles/
             - title: MUI best practices
               path: __SUBDIR__/desktop/extensions-sdk/design/mui-best-practices/
@z

@x
        - sectiontitle: "Developer Guides"
          section:
            - title: Invoke host binaries
              path: /desktop/extensions-sdk/guides/invoke-host-binaries/
            - title: Use the Docker socket from the extension backend
              path: /desktop/extensions-sdk/guides/use-docker-socket-from-backend/
            - title: Interacting with Kubernetes
              path: /desktop/extensions-sdk/guides/kubernetes/
            - title: Authentication
              path: /desktop/extensions-sdk/guides/oauth2-flow/
@y
        - sectiontitle: "Developer Guides"
          section:
            - title: Invoke host binaries
              path: __SUBDIR__/desktop/extensions-sdk/guides/invoke-host-binaries/
            - title: Use the Docker socket from the extension backend
              path: __SUBDIR__/desktop/extensions-sdk/guides/use-docker-socket-from-backend/
            - title: Interacting with Kubernetes
              path: __SUBDIR__/desktop/extensions-sdk/guides/kubernetes/
            - title: Authentication
              path: __SUBDIR__/desktop/extensions-sdk/guides/oauth2-flow/
@z

@x
        - sectiontitle: Developer SDK tools
          section:
            - title: "Test and debug"
              path: /desktop/extensions-sdk/dev/test-debug/
            - title: "Continuous integration"
              path: /desktop/extensions-sdk/dev/continuous-integration/
            - title: CLI reference
              path: /desktop/extensions-sdk/dev/usage/
@y
        - sectiontitle: Developer SDK tools
          section:
            - title: "Test and debug"
              path: __SUBDIR__/desktop/extensions-sdk/dev/test-debug/
            - title: "Continuous integration"
              path: __SUBDIR__/desktop/extensions-sdk/dev/continuous-integration/
            - title: CLI reference
              path: __SUBDIR__/desktop/extensions-sdk/dev/usage/
@z

@x
            - sectiontitle: Extension APIs
              section:
                - title: Overview
                  path: /desktop/extensions-sdk/dev/api/overview/
                - title: Extension Backend
                  path: /desktop/extensions-sdk/dev/api/backend/
                - title: Docker
                  path: /desktop/extensions-sdk/dev/api/docker/
                - title: Dashboard
                  path: /desktop/extensions-sdk/dev/api/dashboard/
                - title: Navigation
                  path: /desktop/extensions-sdk/dev/api/dashboard-routes-navigation/
                - title: API Reference
                  path: /desktop/extensions-sdk/dev/api/reference/README/
@y
            - sectiontitle: Extension APIs
              section:
                - title: Overview
                  path: __SUBDIR__/desktop/extensions-sdk/dev/api/overview/
                - title: Extension Backend
                  path: __SUBDIR__/desktop/extensions-sdk/dev/api/backend/
                - title: Docker
                  path: __SUBDIR__/desktop/extensions-sdk/dev/api/docker/
                - title: Dashboard
                  path: __SUBDIR__/desktop/extensions-sdk/dev/api/dashboard/
                - title: Navigation
                  path: __SUBDIR__/desktop/extensions-sdk/dev/api/dashboard-routes-navigation/
                - title: API Reference
                  path: __SUBDIR__/desktop/extensions-sdk/dev/api/reference/README/
@z

@x
- sectiontitle: Docker Scout
  section:
    - path: /scout/
      title: Overview
    - path: /scout/quickstart/
      title: Quickstart
    - path: /scout/install/
      title: Install
    - sectiontitle: Concepts
      section:
        - path: /scout/concepts/s3c/
          title: Software supply chain security
        - path: /scout/concepts/sbom/
          title: Software Bill of Materials
@y
- sectiontitle: Docker Scout
  section:
    - path: __SUBDIR__/scout/
      title: 概要
    - path: __SUBDIR__/scout/quickstart/
      title: クィックスタート
    - path: __SUBDIR__/scout/install/
      title: Install
    - sectiontitle: 考え方
      section:
        - path: __SUBDIR__/scout/concepts/s3c/
          title: Software supply chain security
        - path: __SUBDIR__/scout/concepts/sbom/
          title: Software Bill of Materials
@z

@x
    - sectiontitle: Explore
      section:
      - path: /scout/explore/analysis/
        title: Analysis
      - path: /scout/explore/dashboard/
        title: Dashboard
      - path: /scout/explore/image-details-view/
        title: Image details view
      - path: /scout/explore/exceptions/
        title: Exceptions {{< badge color=violet text=New >}}
      - path: /scout/explore/metrics-exporter/
        title: Metrics exporter
@y
    - sectiontitle: Explore
      section:
      - path: __SUBDIR__/scout/explore/analysis/
        title: Analysis
      - path: __SUBDIR__/scout/explore/dashboard/
        title: ダッシュボード
      - path: __SUBDIR__/scout/explore/image-details-view/
        title: Image details view
      - path: __SUBDIR__/scout/explore/exceptions/
        title: Exceptions {{< badge color=violet text=New >}}
      - path: __SUBDIR__/scout/explore/metrics-exporter/
        title: Metrics exporter
@z

@x
    - sectiontitle: How-tos
      section:
      - path: /scout/how-tos/artifact-types/
        title: Specify artifact type or location
      - path: /scout/how-tos/view-create-sboms/
        title: View and create SBOMs
      - path: /scout/how-tos/configure-cli/
        title: Configure the CLI
@y
    - sectiontitle: How-tos
      section:
      - path: __SUBDIR__/scout/how-tos/artifact-types/
        title: Specify artifact type or location
      - path: __SUBDIR__/scout/how-tos/view-create-sboms/
        title: View and create SBOMs
      - path: __SUBDIR__/scout/how-tos/configure-cli/
        title: Configure the CLI
@z

@x
    - sectiontitle: Deep dive
      section:
      - path: /scout/deep-dive/advisory-db-sources/
        title: Advisory database
      - path: /scout/deep-dive/data-handling/
        title: Data handling
@y
    - sectiontitle: Deep dive
      section:
      - path: __SUBDIR__/scout/deep-dive/advisory-db-sources/
        title: Advisory database
      - path: __SUBDIR__/scout/deep-dive/data-handling/
        title: Data handling
@z

@x
    - sectiontitle: Policy Evaluation
      section:
      - path: /scout/policy/
        title: Overview
      - path: /scout/policy/scores/
        title: Health scores {{< badge color=blue text=Beta >}}
      - path: /scout/policy/view/
        title: View policy status
      - path: /scout/policy/configure/
        title: Configure policies
      - path: /scout/policy/ci/
        title: Policy Evaluation in CI
      - path: /scout/policy/remediation/
        title: Remediation
@y
    - sectiontitle: Policy Evaluation
      section:
      - path: __SUBDIR__/scout/policy/
        title: Overview
      - path: __SUBDIR__/scout/policy/scores/
        title: Health scores {{< badge color=blue text=Beta >}}
      - path: __SUBDIR__/scout/policy/view/
        title: View policy status
      - path: __SUBDIR__/scout/policy/configure/
        title: Configure policies
      - path: __SUBDIR__/scout/policy/ci/
        title: Policy Evaluation in CI
      - path: __SUBDIR__/scout/policy/remediation/
        title: Remediation
@z

@x
    - sectiontitle: Integrations
      section:
      - title: Overview
        path: /scout/integrations/
      - sectiontitle: Environment monitoring
        section:
        - title: Overview
          path: /scout/integrations/environment/
        - title: Sysdig
          path: /scout/integrations/environment/sysdig/
        - title: Generic
          path: /scout/integrations/environment/cli/
@y
    - sectiontitle: Integrations
      section:
      - title: Overview
        path: __SUBDIR__/scout/integrations/
      - sectiontitle: Environment monitoring
        section:
        - title: Overview
          path: __SUBDIR__/scout/integrations/environment/
        - title: Sysdig
          path: __SUBDIR__/scout/integrations/environment/sysdig/
        - title: Generic
          path: __SUBDIR__/scout/integrations/environment/cli/
@z

@x
      - sectiontitle: Container registries
        section:
        - title: Artifactory
          path: /scout/integrations/registry/artifactory/
        - title: Elastic Container Registry
          path: /scout/integrations/registry/ecr/
        - title: Azure Container Registry
          path: /scout/integrations/registry/acr/
@y
      - sectiontitle: Container registries
        section:
        - title: Artifactory
          path: __SUBDIR__/scout/integrations/registry/artifactory/
        - title: Elastic Container Registry
          path: __SUBDIR__/scout/integrations/registry/ecr/
        - title: Azure Container Registry
          path: __SUBDIR__/scout/integrations/registry/acr/
@z

@x
      - sectiontitle: Continuous integration
        section:
        - title: GitHub Actions
          path: /scout/integrations/ci/gha/
        - title: GitLab
          path: /scout/integrations/ci/gitlab/
        - title: Microsoft Azure DevOps Pipelines
          path: /scout/integrations/ci/azure/
        - title: Circle CI
          path: /scout/integrations/ci/circle-ci/
        - title: Jenkins
          path: /scout/integrations/ci/jenkins/
@y
      - sectiontitle: Continuous integration
        section:
        - title: GitHub Actions
          path: __SUBDIR__/scout/integrations/ci/gha/
        - title: GitLab
          path: __SUBDIR__/scout/integrations/ci/gitlab/
        - title: Microsoft Azure DevOps Pipelines
          path: __SUBDIR__/scout/integrations/ci/azure/
        - title: Circle CI
          path: __SUBDIR__/scout/integrations/ci/circle-ci/
        - title: Jenkins
          path: __SUBDIR__/scout/integrations/ci/jenkins/
@z

@x
      - sectiontitle: Code quality
        section:
        - title: SonarQube
          path: /scout/integrations/code-quality/sonarqube/
      - sectiontitle: Source code management
        section:
        - title: GitHub
          path: /scout/integrations/source-code-management/github/
@y
      - sectiontitle: Code quality
        section:
        - title: SonarQube
          path: __SUBDIR__/scout/integrations/code-quality/sonarqube/
      - sectiontitle: Source code management
        section:
        - title: GitHub
          path: __SUBDIR__/scout/integrations/source-code-management/github/
@z

@x
    - sectiontitle: Release notes
      section:
      - path: /scout/release-notes/cli/
        title: CLI and GitHub Action
      - path: /scout/release-notes/platform/
        title: Platform
@y
    - sectiontitle: リリースノート
      section:
      - path: __SUBDIR__/scout/release-notes/cli/
        title: CLI と GitHub アクション
      - path: __SUBDIR__/scout/release-notes/platform/
        title: プラットフォーム
@z

@x
- sectiontitle: Docker Engine
  section:
  - path: /engine/
    title: Overview
  - sectiontitle: Install
    section:
    - path: /engine/install/
      title: Overview
    - path: /engine/install/centos/
      title: CentOS
    - path: /engine/install/debian/
      title: Debian
    - path: /engine/install/fedora/
      title: Fedora
    - path: /engine/install/rhel/
      title: RHEL
@y
- sectiontitle: Docker Engine
  section:
  - path: __SUBDIR__/engine/
    title: 概要
  - sectiontitle: Install
    section:
    - path: __SUBDIR__/engine/install/
      title: 概要
    - path: __SUBDIR__/engine/install/centos/
      title: CentOS
    - path: __SUBDIR__/engine/install/debian/
      title: Debian
    - path: __SUBDIR__/engine/install/fedora/
      title: Fedora
    - path: __SUBDIR__/engine/install/rhel/
      title: RHEL
@z

@x
    - path: /engine/install/sles/
      title: SLES
    - path: /engine/install/ubuntu/
      title: Ubuntu
    - path: /engine/install/raspberry-pi-os/
      title: Raspberry Pi OS (32-bit)
    - path: /engine/install/binaries/
      title: Binaries
    - path: /engine/install/linux-postinstall/
      title: Post-installation steps
@y
    - path: __SUBDIR__/engine/install/sles/
      title: SLES
    - path: __SUBDIR__/engine/install/ubuntu/
      title: Ubuntu
    - path: __SUBDIR__/engine/install/raspberry-pi-os/
      title: Raspberry Pi OS (32ビット)
    - path: __SUBDIR__/engine/install/binaries/
      title: Binaries
    - path: __SUBDIR__/engine/install/linux-postinstall/
      title: インストール後の作業
@z

@x
  - sectiontitle: Storage
    section:
    - path: /storage/
      title: Overview
    - path: /storage/volumes/
      title: Volumes
    - path: /storage/bind-mounts/
      title: Bind mounts
    - path: /storage/tmpfs/
      title: tmpfs mounts
@y
  - sectiontitle: ストレージ
    section:
    - path: __SUBDIR__/storage/
      title: 概要
    - path: __SUBDIR__/storage/volumes/
      title: ボリューム
    - path: __SUBDIR__/storage/bind-mounts/
      title: バインドマウント
    - path: __SUBDIR__/storage/tmpfs/
      title: tmpfs マウント
@z

@x
    - sectiontitle: Storage drivers
      section:
      - path: /storage/storagedriver/
        title: Overview
      - path: /storage/storagedriver/select-storage-driver/
        title: Select a storage driver
      - path: /storage/storagedriver/btrfs-driver/
        title: Use the Btrfs storage driver
      - path: /storage/storagedriver/device-mapper-driver/
        title: Use the Device mapper storage driver
      - path: /storage/storagedriver/overlayfs-driver/
        title: Use the OverlayFS storage driver
      - path: /storage/storagedriver/zfs-driver/
        title: Use the ZFS storage driver
      - path: /storage/storagedriver/vfs-driver/
        title: Use the VFS storage driver
      - path: /storage/storagedriver/aufs-driver/
        title: Use the AUFS storage driver (deprecated)
      - path: /storage/containerd/
        title: containerd snapshotters
@y
    - sectiontitle: ストレージドライバー
      section:
      - path: __SUBDIR__/storage/storagedriver/
        title: 概要
      - path: __SUBDIR__/storage/storagedriver/select-storage-driver/
        title: ストレージドライバー選び
      - path: __SUBDIR__/storage/storagedriver/btrfs-driver/
        title: Btrfs ストレージドライバーの利用
      - path: __SUBDIR__/storage/storagedriver/device-mapper-driver/
        title: Device mapper ストレージドライバーの利用
      - path: __SUBDIR__/storage/storagedriver/overlayfs-driver/
        title: OverlayFS ストレージドライバーの利用
      - path: __SUBDIR__/storage/storagedriver/zfs-driver/
        title: ZFS ストレージドライバーの利用
      - path: __SUBDIR__/storage/storagedriver/vfs-driver/
        title: VFS ストレージドライバーの利用
      - path: __SUBDIR__/storage/storagedriver/aufs-driver/
        title: AUFS ストレージドライバーの利用 (非推奨)
      - path: __SUBDIR__/storage/containerd/
        title: containerd snapshotters
@z

@x
  - sectiontitle: Networking
    section:
    - path: /network/
      title: Overview
    - sectiontitle: Network drivers
      section:
      - path: /network/drivers/
        title: Overview
      - path: /network/drivers/bridge/
        title: Bridge
      - path: /network/drivers/overlay/
        title: Overlay
      - path: /network/drivers/host/
        title: Host
      - path: /network/drivers/ipvlan/
        title: IPvlan
      - path: /network/drivers/macvlan/
        title: Macvlan
      - path: /network/drivers/none/
        title: None (no networking)
@y
  - sectiontitle: ネットワーク
    section:
    - path: __SUBDIR__/network/
      title: 概要
    - sectiontitle: Network drivers
      section:
      - path: __SUBDIR__/network/drivers/
        title: 概要
      - path: __SUBDIR__/network/drivers/bridge/
        title: Bridge
      - path: __SUBDIR__/network/drivers/overlay/
        title: Overlay
      - path: __SUBDIR__/network/drivers/host/
        title: Host
      - path: __SUBDIR__/network/drivers/ipvlan/
        title: IPvlan
      - path: __SUBDIR__/network/drivers/macvlan/
        title: Macvlan
      - path: __SUBDIR__/network/drivers/none/
        title: ネットワークなし
@z

@x
    - path: /network/proxy/
      title: Configure Docker to use a proxy server
    - path: /network/packet-filtering-firewalls/
      title: Packet filtering and firewalls
    - path: /config/daemon/ipv6/
      title: Use IPv6
    - sectiontitle: Networking tutorials
      section:
      - path: /network/network-tutorial-standalone/
        title: Bridge network tutorial
      - path: /network/network-tutorial-host/
        title: Host networking tutorial
      - path: /network/network-tutorial-overlay/
        title: Overlay networking tutorial
      - path: /network/network-tutorial-macvlan/
        title: Macvlan network tutorial
    - sectiontitle: Legacy networking content
      section:
      - path: /network/links/
        title: (Legacy) Container links
@y
    - path: __SUBDIR__/network/proxy/
      title: Configure Docker to use a proxy server
    - path: __SUBDIR__/network/packet-filtering-firewalls/
      title: Packet filtering and firewalls
    - path: __SUBDIR__/config/daemon/ipv6/
      title: Use IPv6
    - sectiontitle: Networking tutorials
      section:
      - path: __SUBDIR__/network/network-tutorial-standalone/
        title: Bridge network tutorial
      - path: __SUBDIR__/network/network-tutorial-host/
        title: Host networking tutorial
      - path: __SUBDIR__/network/network-tutorial-overlay/
        title: Overlay networking tutorial
      - path: __SUBDIR__/network/network-tutorial-macvlan/
        title: Macvlan network tutorial
    - sectiontitle: Legacy networking content
      section:
      - path: __SUBDIR__/network/links/
        title: (Legacy) Container links
@z

@x
  - sectiontitle: Containers
    section:
    - path: /engine/reference/run/
      title: Running containers
    - path: /config/containers/resource_constraints/
      title: Configure resource constraints
    - path: /config/containers/multi-service_container/
      title: Run multiple processes in a container
    - path: /config/containers/start-containers-automatically/
      title: Start containers automatically
@y
  - sectiontitle: コンテナー
    section:
    - path: __SUBDIR__/engine/reference/run/
      title: コンテナーの実行
    - path: __SUBDIR__/config/containers/resource_constraints/
      title: リソース制約の設定
    - path: __SUBDIR__/config/containers/multi-service_container/
      title: コンテナーでのマルチプロセス実行
    - path: __SUBDIR__/config/containers/start-containers-automatically/
      title: コンテナーの自動実行
@z

@x
  - sectiontitle: CLI
    section:
    - path: /engine/reference/commandline/cli/
      title: Use the Docker CLI
    - path: /config/completion/
      title: Completion
    - path: /config/filter/
      title: Filter commands
    - path: /config/formatting/
      title: Format command and log output
    - path: /config/otel/
      title: OpenTelemetry
@y
  - sectiontitle: CLI
    section:
    - path: __SUBDIR__/engine/reference/commandline/cli/
      title: Docker CLI の利用
    - path: __SUBDIR__/config/completion/
      title: 補完
    - path: __SUBDIR__/config/filter/
      title: フィルターコマンド
    - path: __SUBDIR__/config/formatting/
      title: フォーマットコマンドとログ出力
    - path: __SUBDIR__/config/otel/
      title: OpenTelemetry
@z

@x
  - sectiontitle: Manage resources
    section:
    - path: /config/pruning/
      title: Prune unused objects
    - path: /config/labels-custom-metadata/
      title: Labels
    - path: /engine/context/working-with-contexts/
      title: Contexts
@y
  - sectiontitle: Manage resources
    section:
    - path: __SUBDIR__/config/pruning/
      title: Prune unused objects
    - path: __SUBDIR__/config/labels-custom-metadata/
      title: Labels
    - path: __SUBDIR__/engine/context/working-with-contexts/
      title: Contexts
@z

@x
  - sectiontitle: Daemon
    section:
    - path: /config/daemon/start/
      title: Start the daemon
    - path: /config/daemon/
      title: Configure the daemon
    - path: /config/daemon/proxy/
      title: HTTP proxy
    - path: /config/containers/live-restore/
      title: Live restore
    - path: /config/daemon/troubleshoot/
      title: Troubleshoot
    - path: /config/daemon/remote-access/
      title: Remote access
    - path: /engine/alternative-runtimes/
      title: Alternative container runtimes
@y
  - sectiontitle: Daemon
    section:
    - path: __SUBDIR__/config/daemon/start/
      title: Start the daemon
    - path: __SUBDIR__/config/daemon/
      title: Configure the daemon
    - path: __SUBDIR__/config/daemon/proxy/
      title: HTTP proxy
    - path: __SUBDIR__/config/containers/live-restore/
      title: Live restore
    - path: __SUBDIR__/config/daemon/troubleshoot/
      title: Troubleshoot
    - path: __SUBDIR__/config/daemon/remote-access/
      title: Remote access
    - path: __SUBDIR__/engine/alternative-runtimes/
      title: Alternative container runtimes
@z

@x
    - sectiontitle: Engine plugins
      section:
      - path: /engine/extend/
        title: Managed plugin system
      - path: /engine/extend/plugins_authorization/
        title: Access authorization plugin
      - path: /engine/extend/legacy_plugins/
        title: Extending Docker with plugins
      - path: /engine/extend/plugins_network/
        title: Network plugins
      - path: /engine/extend/plugins_logging/
        title: Logging plugins
      - path: /engine/extend/plugins_volume/
        title: Volume plugins
      - title: Plugin configuration
        path: /engine/extend/config/
      - path: /engine/extend/plugin_api/
        title: Plugin API
@y
    - sectiontitle: Engine plugins
      section:
      - path: __SUBDIR__/engine/extend/
        title: Managed plugin system
      - path: __SUBDIR__/engine/extend/plugins_authorization/
        title: Access authorization plugin
      - path: __SUBDIR__/engine/extend/legacy_plugins/
        title: Extending Docker with plugins
      - path: __SUBDIR__/engine/extend/plugins_network/
        title: Network plugins
      - path: __SUBDIR__/engine/extend/plugins_logging/
        title: Logging plugins
      - path: __SUBDIR__/engine/extend/plugins_volume/
        title: Volume plugins
      - title: Plugin configuration
        path: __SUBDIR__/engine/extend/config/
      - path: __SUBDIR__/engine/extend/plugin_api/
        title: Plugin API
@z

@x
  - sectiontitle: Logs and metrics
    section:
    - sectiontitle: Container logs
      section:
      - path: /config/containers/logging/
        title: View container logs
      - path: /config/containers/logging/configure/
        title: Configure logging drivers
      - path: /config/containers/logging/dual-logging/
        title: Use a remote logging driver
      - path: /config/containers/logging/plugins/
        title: Use a logging driver plugin
      - path: /config/containers/logging/log_tags/
        title: Customize log driver output
@y
  - sectiontitle: Logs and metrics
    section:
    - sectiontitle: Container logs
      section:
      - path: __SUBDIR__/config/containers/logging/
        title: View container logs
      - path: __SUBDIR__/config/containers/logging/configure/
        title: Configure logging drivers
      - path: __SUBDIR__/config/containers/logging/dual-logging/
        title: Use a remote logging driver
      - path: __SUBDIR__/config/containers/logging/plugins/
        title: Use a logging driver plugin
      - path: __SUBDIR__/config/containers/logging/log_tags/
        title: Customize log driver output
@z

@x
      - sectiontitle: Logging drivers
        section:
        - path: /config/containers/logging/local/
          title: Local file logging driver
        - path: /config/containers/logging/json-file/
          title: JSON File logging driver
        - path: /config/containers/logging/gelf/
          title: Graylog Extended Format (GELF) logging driver
        - path: /config/containers/logging/syslog/
          title: Syslog logging driver
        - path: /config/containers/logging/awslogs/
          title: Amazon CloudWatch logs logging driver
        - path: /config/containers/logging/etwlogs/
          title: ETW logging driver
        - path: /config/containers/logging/fluentd/
          title: Fluentd logging driver
        - path: /config/containers/logging/gcplogs/
          title: Google Cloud logging driver
        - path: /config/containers/logging/journald/
          title: Journald logging driver
        - path: /config/containers/logging/splunk/
          title: Splunk logging driver
@y
      - sectiontitle: Logging drivers
        section:
        - path: __SUBDIR__/config/containers/logging/local/
          title: Local file logging driver
        - path: __SUBDIR__/config/containers/logging/json-file/
          title: JSON File logging driver
        - path: __SUBDIR__/config/containers/logging/gelf/
          title: Graylog Extended Format (GELF) logging driver
        - path: __SUBDIR__/config/containers/logging/syslog/
          title: Syslog logging driver
        - path: __SUBDIR__/config/containers/logging/awslogs/
          title: Amazon CloudWatch logs logging driver
        - path: __SUBDIR__/config/containers/logging/etwlogs/
          title: ETW logging driver
        - path: __SUBDIR__/config/containers/logging/fluentd/
          title: Fluentd logging driver
        - path: __SUBDIR__/config/containers/logging/gcplogs/
          title: Google Cloud logging driver
        - path: __SUBDIR__/config/containers/logging/journald/
          title: Journald logging driver
        - path: __SUBDIR__/config/containers/logging/splunk/
          title: Splunk logging driver
@z

@x
    - path: /config/daemon/logs/
      title: Daemon logs
    - path: /config/containers/runmetrics/
      title: Runtime metrics
    - path: /config/daemon/prometheus/
      title: Collect metrics with Prometheus
@y
    - path: __SUBDIR__/config/daemon/logs/
      title: Daemon logs
    - path: __SUBDIR__/config/containers/runmetrics/
      title: Runtime metrics
    - path: __SUBDIR__/config/daemon/prometheus/
      title: Collect metrics with Prometheus
@z

@x
  - sectiontitle: Security
    section:
      - path: /engine/security/
        title: Overview
      - path: /engine/security/rootless/
        title: Rootless mode
      - path: /engine/security/non-events/
        title: Docker security non-events
      - path: /engine/security/protect-access/
        title: Protect the Docker daemon socket
      - path: /engine/security/certificates/
        title: Using certificates for repository client verification
@y
  - sectiontitle: Security
    section:
      - path: __SUBDIR__/engine/security/
        title: Overview
      - path: __SUBDIR__/engine/security/rootless/
        title: Rootless mode
      - path: __SUBDIR__/engine/security/non-events/
        title: Docker security non-events
      - path: __SUBDIR__/engine/security/protect-access/
        title: Protect the Docker daemon socket
      - path: __SUBDIR__/engine/security/certificates/
        title: Using certificates for repository client verification
@z

@x
      - sectiontitle: Use trusted images
        section:
        - path: /engine/security/trust/
          title: Overview
        - path: /engine/security/trust/trust_automation/
          title: Automation
        - path: /engine/security/trust/trust_delegation/
          title: Delegations
        - path: /engine/security/trust/deploying_notary/
          title: Deploy Notary
        - path: /engine/security/trust/trust_key_mng/
          title: Manage content trust keys
        - path: /engine/security/trust/trust_sandbox/
          title: Play in a content trust sandbox
@y
      - sectiontitle: Use trusted images
        section:
        - path: __SUBDIR__/engine/security/trust/
          title: Overview
        - path: __SUBDIR__/engine/security/trust/trust_automation/
          title: Automation
        - path: __SUBDIR__/engine/security/trust/trust_delegation/
          title: Delegations
        - path: __SUBDIR__/engine/security/trust/deploying_notary/
          title: Deploy Notary
        - path: __SUBDIR__/engine/security/trust/trust_key_mng/
          title: Manage content trust keys
        - path: __SUBDIR__/engine/security/trust/trust_sandbox/
          title: Play in a content trust sandbox
@z

@x
      - path: /engine/security/antivirus/
        title: Antivirus software
      - path: /engine/security/apparmor/
        title: AppArmor security profiles
      - path: /engine/security/seccomp/
        title: Seccomp security profiles
      - path: /engine/security/userns-remap/
        title: Isolate containers with a user namespace
@y
      - path: __SUBDIR__/engine/security/antivirus/
        title: Antivirus software
      - path: __SUBDIR__/engine/security/apparmor/
        title: AppArmor security profiles
      - path: __SUBDIR__/engine/security/seccomp/
        title: Seccomp security profiles
      - path: __SUBDIR__/engine/security/userns-remap/
        title: Isolate containers with a user namespace
@z

@x
  - sectiontitle: Swarm mode
    section:
    - path: /engine/swarm/
      title: Swarm mode overview
    - path: /engine/swarm/key-concepts/
      title: Swarm mode key concepts
@y
  - sectiontitle: Swarm mode
    section:
    - path: __SUBDIR__/engine/swarm/
      title: Swarm mode overview
    - path: __SUBDIR__/engine/swarm/key-concepts/
      title: Swarm mode key concepts
@z

@x
    - sectiontitle: Get started with swarm mode
      section:
      - path: /engine/swarm/swarm-tutorial/
        title: Swarm mode tutorial overview
      - path: /engine/swarm/swarm-tutorial/create-swarm/
        title: Create a swarm
      - path: /engine/swarm/swarm-tutorial/add-nodes/
        title: Add nodes to the swarm
      - path: /engine/swarm/swarm-tutorial/deploy-service/
        title: Deploy a service
      - path: /engine/swarm/swarm-tutorial/inspect-service/
        title: Inspect the service
      - path: /engine/swarm/swarm-tutorial/scale-service/
        title: Scale the service
      - path: /engine/swarm/swarm-tutorial/delete-service/
        title: Delete the service
      - path: /engine/swarm/swarm-tutorial/rolling-update/
        title: Apply rolling updates
      - path: /engine/swarm/swarm-tutorial/drain-node/
        title: Drain a node
      - path: /engine/swarm/ingress/
        title: Use Swarm mode routing mesh
@y
    - sectiontitle: Get started with swarm mode
      section:
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/
        title: Swarm mode tutorial overview
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/create-swarm/
        title: Create a swarm
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/add-nodes/
        title: Add nodes to the swarm
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/deploy-service/
        title: Deploy a service
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/inspect-service/
        title: Inspect the service
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/scale-service/
        title: Scale the service
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/delete-service/
        title: Delete the service
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/rolling-update/
        title: Apply rolling updates
      - path: __SUBDIR__/engine/swarm/swarm-tutorial/drain-node/
        title: Drain a node
      - path: __SUBDIR__/engine/swarm/ingress/
        title: Use Swarm mode routing mesh
@z

@x
    - sectiontitle: How Swarm mode works
      section:
      - path: /engine/swarm/how-swarm-mode-works/nodes/
        title: How nodes work
      - path: /engine/swarm/how-swarm-mode-works/services/
        title: How services work
      - path: /engine/swarm/how-swarm-mode-works/pki/
        title: Manage swarm security with PKI
      - path: /engine/swarm/how-swarm-mode-works/swarm-task-states/
        title: Swarm task states
@y
    - sectiontitle: How Swarm mode works
      section:
      - path: __SUBDIR__/engine/swarm/how-swarm-mode-works/nodes/
        title: How nodes work
      - path: __SUBDIR__/engine/swarm/how-swarm-mode-works/services/
        title: How services work
      - path: __SUBDIR__/engine/swarm/how-swarm-mode-works/pki/
        title: Manage swarm security with PKI
      - path: __SUBDIR__/engine/swarm/how-swarm-mode-works/swarm-task-states/
        title: Swarm task states
@z

@x
    - path: /engine/swarm/swarm-mode/
      title: Run Docker in Swarm mode
    - path: /engine/swarm/join-nodes/
      title: Join nodes to a swarm
    - path: /engine/swarm/manage-nodes/
      title: Manage nodes in a swarm
    - path: /engine/swarm/services/
      title: Deploy services to a swarm
    - path: /engine/swarm/stack-deploy/
      title: Deploy a stack to a swarm
    - path: /engine/swarm/configs/
      title: Store service configuration data
    - path: /engine/swarm/secrets/
      title: Manage sensitive data with Docker secrets
    - path: /engine/swarm/swarm_manager_locking/
      title: Lock your swarm
    - path: /engine/swarm/networking/
      title: Manage swarm service networks
    - path: /engine/swarm/admin_guide/
      title: Swarm administration guide
    - path: /engine/swarm/raft/
      title: Raft consensus in Swarm mode
@y
    - path: __SUBDIR__/engine/swarm/swarm-mode/
      title: Run Docker in Swarm mode
    - path: __SUBDIR__/engine/swarm/join-nodes/
      title: Join nodes to a swarm
    - path: __SUBDIR__/engine/swarm/manage-nodes/
      title: Manage nodes in a swarm
    - path: __SUBDIR__/engine/swarm/services/
      title: Deploy services to a swarm
    - path: __SUBDIR__/engine/swarm/stack-deploy/
      title: Deploy a stack to a swarm
    - path: __SUBDIR__/engine/swarm/configs/
      title: Store service configuration data
    - path: __SUBDIR__/engine/swarm/secrets/
      title: Manage sensitive data with Docker secrets
    - path: __SUBDIR__/engine/swarm/swarm_manager_locking/
      title: Lock your swarm
    - path: __SUBDIR__/engine/swarm/networking/
      title: Manage swarm service networks
    - path: __SUBDIR__/engine/swarm/admin_guide/
      title: Swarm administration guide
    - path: __SUBDIR__/engine/swarm/raft/
      title: Raft consensus in Swarm mode
@z

@x
  - path: /engine/deprecated/
    title: Deprecated features
  - sectiontitle: Release notes
    section:
    - path: /engine/release-notes/27.0/
      title: Engine 27.0
@y
  - path: __SUBDIR__/engine/deprecated/
    title: Deprecated features
  - sectiontitle: Release notes
    section:
    - path: __SUBDIR__/engine/release-notes/27.0/
      title: Engine 27.0
@z

@x
    - sectiontitle: Previous versions
      section:
      - path: /engine/release-notes/26.1/
        title: Engine 26.1
      - path: /engine/release-notes/26.0/
        title: Engine 26.0
@y
    - sectiontitle: Previous versions
      section:
      - path: __SUBDIR__/engine/release-notes/26.1/
        title: Engine 26.1
      - path: __SUBDIR__/engine/release-notes/26.0/
        title: Engine 26.0
@z

@x
      - path: /engine/release-notes/25.0/
        title: Engine 25.0
      - path: /engine/release-notes/24.0/
        title: Engine 24.0
      - path: /engine/release-notes/23.0/
        title: Engine 23.0
      - path: /engine/release-notes/20.10/
        title: Engine 20.10
      - path: /engine/release-notes/19.03/
        title: Engine 19.03
      - path: /engine/release-notes/18.09/
        title: Engine 18.09
      - path: /engine/release-notes/18.06/
        title: Engine 18.06
      - path: /engine/release-notes/18.05/
        title: Engine 18.05
      - path: /engine/release-notes/18.04/
        title: Engine 18.04
      - path: /engine/release-notes/18.03/
        title: Engine 18.03
      - path: /engine/release-notes/18.02/
        title: Engine 18.02
      - path: /engine/release-notes/18.01/
        title: Engine 18.01
@y
      - path: __SUBDIR__/engine/release-notes/25.0/
        title: Engine 25.0
      - path: __SUBDIR__/engine/release-notes/24.0/
        title: Engine 24.0
      - path: __SUBDIR__/engine/release-notes/23.0/
        title: Engine 23.0
      - path: __SUBDIR__/engine/release-notes/20.10/
        title: Engine 20.10
      - path: __SUBDIR__/engine/release-notes/19.03/
        title: Engine 19.03
      - path: __SUBDIR__/engine/release-notes/18.09/
        title: Engine 18.09
      - path: __SUBDIR__/engine/release-notes/18.06/
        title: Engine 18.06
      - path: __SUBDIR__/engine/release-notes/18.05/
        title: Engine 18.05
      - path: __SUBDIR__/engine/release-notes/18.04/
        title: Engine 18.04
      - path: __SUBDIR__/engine/release-notes/18.03/
        title: Engine 18.03
      - path: __SUBDIR__/engine/release-notes/18.02/
        title: Engine 18.02
      - path: __SUBDIR__/engine/release-notes/18.01/
        title: Engine 18.01
@z

@x
      - path: /engine/release-notes/17.12/
        title: Engine 17.12
      - path: /engine/release-notes/17.11/
        title: Engine 17.11
      - path: /engine/release-notes/17.10/
        title: Engine 17.10
      - path: /engine/release-notes/17.09/
        title: Engine 17.09
      - path: /engine/release-notes/17.07/
        title: Engine 17.07
      - path: /engine/release-notes/17.06/
        title: Engine 17.06
      - path: /engine/release-notes/17.05/
        title: Engine 17.05
      - path: /engine/release-notes/17.04/
        title: Engine 17.04
      - path: /engine/release-notes/17.03/
        title: Engine 17.03
      - path: /engine/release-notes/prior-releases/
        title: Engine 1.13 and earlier
@y
      - path: __SUBDIR__/engine/release-notes/17.12/
        title: Engine 17.12
      - path: __SUBDIR__/engine/release-notes/17.11/
        title: Engine 17.11
      - path: __SUBDIR__/engine/release-notes/17.10/
        title: Engine 17.10
      - path: __SUBDIR__/engine/release-notes/17.09/
        title: Engine 17.09
      - path: __SUBDIR__/engine/release-notes/17.07/
        title: Engine 17.07
      - path: __SUBDIR__/engine/release-notes/17.06/
        title: Engine 17.06
      - path: __SUBDIR__/engine/release-notes/17.05/
        title: Engine 17.05
      - path: __SUBDIR__/engine/release-notes/17.04/
        title: Engine 17.04
      - path: __SUBDIR__/engine/release-notes/17.03/
        title: Engine 17.03
      - path: __SUBDIR__/engine/release-notes/prior-releases/
        title: Engine 1.13 and earlier
@z

@x
- sectiontitle: Docker Build
  section:
    - path: /build/
      title: Overview
    - path: /build/architecture/
      title: Architecture
    - sectiontitle: Building images
      section:
        - path: /build/building/packaging/
          title: Packaging your software
        - path: /build/building/context/
          title: Context
        - path: /build/building/multi-stage/
          title: Multi-stage builds
@y
- sectiontitle: Docker Build
  section:
    - path: __SUBDIR__/build/
      title: 概要
    - path: __SUBDIR__/build/architecture/
      title: アーキテクチャー
    - sectiontitle: Building images
      section:
        - path: __SUBDIR__/build/building/packaging/
          title: Packaging your software
        - path: __SUBDIR__/build/building/context/
          title: コンテキスト
        - path: __SUBDIR__/build/building/multi-stage/
          title: マルチステージビルド
@z

@x
        - path: /build/building/variables/
          title: Variables
        - path: /build/building/best-practices/
          title: Best practices
        - path: /build/building/multi-platform/
          title: Multi-platform images
        - path: /build/building/secrets/
          title: Build secrets
        - path: /build/building/annotations/
          title: Annotations
        - path: /build/building/opentelemetry/
          title: OpenTelemetry support
        - path: /build/building/base-images/
          title: Base images
@y
        - path: __SUBDIR__/build/building/variables/
          title: 変数
        - path: __SUBDIR__/build/building/best-practices/
          title: ベストプラクティス
        - path: __SUBDIR__/build/building/multi-platform/
          title: マルチプラットフォームイメージ
        - path: __SUBDIR__/build/building/secrets/
          title: secrets のビルド
        - path: __SUBDIR__/build/building/annotations/
          title: アノテーション
        - path: __SUBDIR__/build/building/opentelemetry/
          title: OpenTelemetry support
        - path: __SUBDIR__/build/building/base-images/
          title: ベースイメージ
@z

@x
    - sectiontitle: Builders
      section:
        - path: /build/builders/
          title: Builders overview
        - path: /build/builders/manage/
          title: Manage builders
@y
    - sectiontitle: Builders
      section:
        - path: __SUBDIR__/build/builders/
          title: Builders 概要
        - path: __SUBDIR__/build/builders/manage/
          title: Manage builders
@z

@x
    - sectiontitle: Drivers
      section:
        - path: /build/drivers/
          title: Drivers overview
        - path: /build/drivers/docker/
          title: Docker driver
        - path: /build/drivers/docker-container/
          title: Docker container driver
        - path: /build/drivers/kubernetes/
          title: Kubernetes driver
        - path: /build/drivers/remote/
          title: Remote driver
@y
    - sectiontitle: ドライバー
      section:
        - path: __SUBDIR__/build/drivers/
          title: ドライバー概要
        - path: __SUBDIR__/build/drivers/docker/
          title: Docker ドライバー
        - path: __SUBDIR__/build/drivers/docker-container/
          title: Docker コンテナードライバー
        - path: __SUBDIR__/build/drivers/kubernetes/
          title: Kubernetes ドライバー
        - path: __SUBDIR__/build/drivers/remote/
          title: リモートドライバー
@z

@x
    - sectiontitle: Exporters
      section:
        - path: /build/exporters/
          title: Overview
        - path: /build/exporters/image-registry/
          title: Image and registry exporters
        - path: /build/exporters/local-tar/
          title: Local and tar exporters
        - path: /build/exporters/oci-docker/
          title: OCI and Docker exporters
@y
    - sectiontitle: Exporters
      section:
        - path: __SUBDIR__/build/exporters/
          title: Overview
        - path: __SUBDIR__/build/exporters/image-registry/
          title: Image and registry exporters
        - path: __SUBDIR__/build/exporters/local-tar/
          title: Local and tar exporters
        - path: __SUBDIR__/build/exporters/oci-docker/
          title: OCI and Docker exporters
@z

@x
    - sectiontitle: Cache
      section:
        - path: /build/cache/
          title: Overview
        - path: /build/cache/invalidation/
          title: Cache invalidation
        - path: /build/cache/garbage-collection/
          title: Garbage collection
@y
    - sectiontitle: Cache
      section:
        - path: __SUBDIR__/build/cache/
          title: Overview
        - path: __SUBDIR__/build/cache/invalidation/
          title: Cache invalidation
        - path: __SUBDIR__/build/cache/garbage-collection/
          title: Garbage collection
@z

@x
        - sectiontitle: Cache backends
          section:
            - path: /build/cache/backends/
              title: Overview
            - path: /build/cache/backends/inline/
              title: Inline
            - path: /build/cache/backends/local/
              title: Local
            - path: /build/cache/backends/registry/
              title: Registry
            - path: /build/cache/backends/gha/
              title: GitHub Actions
            - path: /build/cache/backends/azblob/
              title: Azure Blob Storage
            - path: /build/cache/backends/s3/
              title: Amazon S3
@y
        - sectiontitle: Cache backends
          section:
            - path: __SUBDIR__/build/cache/backends/
              title: Overview
            - path: __SUBDIR__/build/cache/backends/inline/
              title: Inline
            - path: __SUBDIR__/build/cache/backends/local/
              title: Local
            - path: __SUBDIR__/build/cache/backends/registry/
              title: Registry
            - path: __SUBDIR__/build/cache/backends/gha/
              title: GitHub Actions
            - path: __SUBDIR__/build/cache/backends/azblob/
              title: Azure Blob Storage
            - path: __SUBDIR__/build/cache/backends/s3/
              title: Amazon S3
@z

@x
    - sectiontitle: Bake
      section:
        - path: /build/bake/
          title: Overview
        - path: /build/bake/introduction/
          title: Introduction
        - path: /build/bake/targets/
          title: Targets
        - path: /build/bake/inheritance/
          title: Inheritance
        - path: /build/bake/variables/
          title: Variables
        - path: /build/bake/expressions/
          title: Expressions
@y
    - sectiontitle: Bake
      section:
        - path: __SUBDIR__/build/bake/
          title: Overview
        - path: __SUBDIR__/build/bake/introduction/
          title: Introduction
        - path: __SUBDIR__/build/bake/targets/
          title: Targets
        - path: __SUBDIR__/build/bake/inheritance/
          title: Inheritance
        - path: __SUBDIR__/build/bake/variables/
          title: Variables
        - path: __SUBDIR__/build/bake/expressions/
          title: Expressions
@z

@x
        - path: /build/bake/funcs/
          title: Functions
        - path: /build/bake/matrices/
          title: Matrices
        - path: /build/bake/contexts/
          title: Contexts
        - path: /build/bake/overrides/
          title: Overriding configuration
        - path: /build/bake/reference/
          title: Bake file reference
        - path: /build/bake/compose-file/
          title: Building from Compose file
        - path: /build/bake/remote-definition/
          title: Remote Bake file definition
@y
        - path: __SUBDIR__/build/bake/funcs/
          title: Functions
        - path: __SUBDIR__/build/bake/matrices/
          title: Matrices
        - path: __SUBDIR__/build/bake/contexts/
          title: Contexts
        - path: __SUBDIR__/build/bake/overrides/
          title: Overriding configuration
        - path: __SUBDIR__/build/bake/reference/
          title: Bake file reference
        - path: __SUBDIR__/build/bake/compose-file/
          title: Building from Compose file
        - path: __SUBDIR__/build/bake/remote-definition/
          title: Remote Bake file definition
@z

@x
    - sectiontitle: Attestations
      section:
        - path: /build/attestations/
          title: Overview
        - path: /build/attestations/sbom/
          title: SBOM
        - path: /build/attestations/slsa-provenance/
          title: Provenance
        - path: /build/attestations/slsa-definitions/
          title: SLSA definitions
        - path: /build/attestations/attestation-storage/
          title: Attestation storage
@y
    - sectiontitle: Attestations
      section:
        - path: __SUBDIR__/build/attestations/
          title: Overview
        - path: __SUBDIR__/build/attestations/sbom/
          title: SBOM
        - path: __SUBDIR__/build/attestations/slsa-provenance/
          title: Provenance
        - path: __SUBDIR__/build/attestations/slsa-definitions/
          title: SLSA definitions
        - path: __SUBDIR__/build/attestations/attestation-storage/
          title: Attestation storage
@z

@x
    - sectiontitle: Dockerfile
      section:
        - path: /build/dockerfile/frontend/
          title: Custom Dockerfile syntax
        - path: /build/dockerfile/release-notes/
          title: Release notes
    - sectiontitle: BuildKit
      section:
        - path: /build/buildkit/
          title: Overview
        - path: /build/buildkit/configure/
          title: Configure
        - path: /build/buildkit/toml-configuration/
          title: TOML configuration
@y
    - sectiontitle: Dockerfile
      section:
        - path: __SUBDIR__/build/dockerfile/frontend/
          title: カスタム Dockerfile 文法
        - path: __SUBDIR__/build/dockerfile/release-notes/
          title: リリースノート
    - sectiontitle: BuildKit
      section:
        - path: __SUBDIR__/build/buildkit/
          title: 概要
        - path: __SUBDIR__/build/buildkit/configure/
          title: 設定
        - path: __SUBDIR__/build/buildkit/toml-configuration/
          title: TOML 設定
@z

@x
    - sectiontitle: Continuous integration
      section:
        - path: /build/ci/
          title: CI with Docker
        - sectiontitle: GitHub Actions
          section:
          - path: /build/ci/github-actions/
            title: Introduction
          - path: /build/ci/github-actions/build-summary/
            title: Build summary {{< badge color=blue text=Beta >}}
          - path: /build/ci/github-actions/configure-builder/
            title: Configuring your builder
          - path: /build/ci/github-actions/multi-platform/
            title: Multi-platform image
          - path: /build/ci/github-actions/secrets/
            title: Secrets
          - path: /build/ci/github-actions/push-multi-registries/
            title: Push to multiple registries
          - path: /build/ci/github-actions/manage-tags-labels/
            title: Manage tags and labels
          - path: /build/ci/github-actions/cache/
            title: Cache management
@y
    - sectiontitle: Continuous integration
      section:
        - path: __SUBDIR__/build/ci/
          title: Docker を使った CI
        - sectiontitle: GitHub Actions
          section:
          - path: __SUBDIR__/build/ci/github-actions/
            title: はじめに
          - path: __SUBDIR__/build/ci/github-actions/build-summary/
            title: Build summary {{< badge color=blue text=Beta >}}
          - path: __SUBDIR__/build/ci/github-actions/configure-builder/
            title: Configuring your builder
          - path: __SUBDIR__/build/ci/github-actions/multi-platform/
            title: マルチプラットフォームイメージ
          - path: __SUBDIR__/build/ci/github-actions/secrets/
            title: Secrets
          - path: __SUBDIR__/build/ci/github-actions/push-multi-registries/
            title: Push to multiple registries
          - path: __SUBDIR__/build/ci/github-actions/manage-tags-labels/
            title: タグとラベルの管理
          - path: __SUBDIR__/build/ci/github-actions/cache/
            title: キャッシュ管理
@z

@x
          - path: /build/ci/github-actions/export-docker/
            title: Export to Docker
          - path: /build/ci/github-actions/test-before-push/
            title: Test before push
          - path: /build/ci/github-actions/local-registry/
            title: Local registry
          - path: /build/ci/github-actions/share-image-jobs/
            title: Share built image between jobs
@y
          - path: __SUBDIR__/build/ci/github-actions/export-docker/
            title: Export to Docker
          - path: __SUBDIR__/build/ci/github-actions/test-before-push/
            title: Test before push
          - path: __SUBDIR__/build/ci/github-actions/local-registry/
            title: Local registry
          - path: __SUBDIR__/build/ci/github-actions/share-image-jobs/
            title: Share built image between jobs
@z

@x
          - path: /build/ci/github-actions/named-contexts/
            title: Named contexts
          - path: /build/ci/github-actions/copy-image-registries/
            title: Copy image between registries
          - path: /build/ci/github-actions/update-dockerhub-desc/
            title: Update Docker Hub repo description
          - path: /build/ci/github-actions/attestations/
            title: SBOM and provenance attestations
          - path: /build/ci/github-actions/annotations/
            title: Annotations
          - path: /build/ci/github-actions/reproducible-builds/
            title: Reproducible builds
@y
          - path: __SUBDIR__/build/ci/github-actions/named-contexts/
            title: Named contexts
          - path: __SUBDIR__/build/ci/github-actions/copy-image-registries/
            title: レジストリ間でのイメージコピー
          - path: __SUBDIR__/build/ci/github-actions/update-dockerhub-desc/
            title: Update Docker Hub repo description
          - path: __SUBDIR__/build/ci/github-actions/attestations/
            title: SBOM and provenance attestations
          - path: __SUBDIR__/build/ci/github-actions/annotations/
            title: アノテーション
          - path: __SUBDIR__/build/ci/github-actions/reproducible-builds/
            title: 再現可能なビルド
@z

@x
    - path: /build/release-notes/
      title: Release notes
@y
    - path: __SUBDIR__/build/release-notes/
      title: リリースノート
@z

@x
- sectiontitle: Docker Compose
  section:
  - path: /compose/
    title: Overview
  - sectiontitle: Introduction to Compose
    section:
    - path: /compose/intro/features-uses/
      title: Why use Compose?
    - path: /compose/intro/history/
      title: History and development of Compose
@y
- sectiontitle: Docker Compose
  section:
  - path: __SUBDIR__/compose/
    title: 概要
  - sectiontitle: Compose の導入
    section:
    - path: __SUBDIR__/compose/intro/features-uses/
      title: Compose 利用はなぜ
    - path: __SUBDIR__/compose/intro/history/
      title: Compose のこれまでと開発
@z

@x
  - sectiontitle: Install
    section:
      - path: /compose/install/
        title: Overview
      - path: /compose/install/linux/
        title: Install Compose plugin
      - path: /compose/install/standalone/
        title: Install Compose standalone
      - path: /compose/install/uninstall/
        title: Uninstall Compose
@y
  - sectiontitle: インストール
    section:
      - path: __SUBDIR__/compose/install/
        title: 概要
      - path: __SUBDIR__/compose/install/linux/
        title: Compose プラグインのインストール
      - path: __SUBDIR__/compose/install/standalone/
        title: Compose のスタンドアローンインストール
      - path: __SUBDIR__/compose/install/uninstall/
        title: Compose のアンインストール
@z

@x
  - path: /compose/compose-application-model/
    title: How Compose works
  - path: /compose/gettingstarted/
    title: Quickstart
  - path: /compose/project-name/
    title: Specify a project name
@y
  - path: __SUBDIR__/compose/compose-application-model/
    title: Compose はどのように動作するか
  - path: __SUBDIR__/compose/gettingstarted/
    title: クィックスタート
  - path: __SUBDIR__/compose/project-name/
    title: プロジェクト名の指定
@z

@x
  - sectiontitle: Environment variables
    section:
    - path: /compose/environment-variables/
      title: Overview
    - path: /compose/environment-variables/set-environment-variables/
      title: Explore ways to set environment variables
    - path: /compose/environment-variables/envvars-precedence/
      title: Understand environment variables precedence
    - path: /compose/environment-variables/envvars/
      title: Set or change pre-defined environment variables
    - path: /compose/environment-variables/variable-interpolation/
      title: Interpolation
    - path: /compose/environment-variables/best-practices/
      title: Best practices
@y
  - sectiontitle: 環境変数
    section:
    - path: __SUBDIR__/compose/environment-variables/
      title: 概要
    - path: __SUBDIR__/compose/environment-variables/set-environment-variables/
      title: Explore ways to set environment variables
    - path: __SUBDIR__/compose/environment-variables/envvars-precedence/
      title: Understand environment variables precedence
    - path: __SUBDIR__/compose/environment-variables/envvars/
      title: Set or change pre-defined environment variables
    - path: __SUBDIR__/compose/environment-variables/variable-interpolation/
      title: Interpolation
    - path: __SUBDIR__/compose/environment-variables/best-practices/
      title: ベストプラクティス
@z

@x
  - path: /compose/profiles/
    title: Use service profiles
  - path: /compose/file-watch/
    title: Use Compose Watch
  - path: /compose/production/
    title: Compose in production
  - path: /compose/use-secrets/
    title: Secrets in Compose
@y
  - path: __SUBDIR__/compose/profiles/
    title: サービスプロファイルの利用
  - path: __SUBDIR__/compose/file-watch/
    title: Compose Watch の利用
  - path: __SUBDIR__/compose/production/
    title: 本番環境での Compose
  - path: __SUBDIR__/compose/use-secrets/
    title: Compose における Secrets
@z

@x
  - sectiontitle: Working with multiple Compose files
    section:
    - path: /compose/multiple-compose-files/
      title: Overview
    - path: /compose/multiple-compose-files/merge/
      title: Merge
    - path: /compose/multiple-compose-files/extends/
      title: Extend
    - path: /compose/multiple-compose-files/include/
      title: Include
@y
  - sectiontitle: 複数 Compose ファイルによる処理
    section:
    - path: __SUBDIR__/compose/multiple-compose-files/
      title: 概要
    - path: __SUBDIR__/compose/multiple-compose-files/merge/
      title: Merge
    - path: __SUBDIR__/compose/multiple-compose-files/extends/
      title: Extend
    - path: __SUBDIR__/compose/multiple-compose-files/include/
      title: Include
@z

@x
  - path: /compose/startup-order/
    title: Control startup order
  - path: /compose/gpu-support/
    title: GPU support
  - path: /compose/networking/
    title: Networking
  - path: /compose/samples-for-compose/
    title: Sample apps
  - path: /compose/feedback/
    title: Give feedback
  - path: /compose/migrate/
    title: Migrate to Compose V2
  - path: /compose/faq/
    title: Compose FAQ
  - path: /compose/release-notes/
    title: Release notes
@y
  - path: __SUBDIR__/compose/startup-order/
    title: Control startup order
  - path: __SUBDIR__/compose/gpu-support/
    title: GPU サポート
  - path: __SUBDIR__/compose/networking/
    title: ネットワーク
  - path: __SUBDIR__/compose/samples-for-compose/
    title: サンプルアプリ
  - path: __SUBDIR__/compose/feedback/
    title: フィードバック
  - path: __SUBDIR__/compose/migrate/
    title: Migrate to Compose V2
  - path: __SUBDIR__/compose/faq/
    title: 共通 FAQ
  - path: __SUBDIR__/compose/release-notes/
    title: リリースノート
@z

@x
- sectiontitle: Docker Hub
  section:
  - path: /docker-hub/
    title: Overview
  - path: /docker-hub/quickstart/
    title: Quickstart
@y
- sectiontitle: Docker Hub
  section:
  - path: __SUBDIR__/docker-hub/
    title: 概要
  - path: __SUBDIR__/docker-hub/quickstart/
    title: クィックスタート
@z

@x
  - sectiontitle: Repositories
    section:
      - path: /docker-hub/repos/create/
        title: Create
      - path: /docker-hub/repos/access/
        title: Access
      - path: /docker-hub/repos/
        title: Manage
@y
  - sectiontitle: リポジトリ
    section:
      - path: __SUBDIR__/docker-hub/repos/create/
        title: 生成
      - path: __SUBDIR__/docker-hub/repos/access/
        title: アクセス
      - path: __SUBDIR__/docker-hub/repos/
        title: 管理
@z

@x
  - path: /docker-hub/download-rate-limit/
    title: Download rate limit
  - path: /docker-hub/webhooks/
    title: Webhooks
  - path: /docker-hub/service-accounts/
    title: Service accounts
@y
  - path: __SUBDIR__/docker-hub/download-rate-limit/
    title: ダウンロードレート制限
  - path: __SUBDIR__/docker-hub/webhooks/
    title: ウェブフック
  - path: __SUBDIR__/docker-hub/service-accounts/
    title: サービスアカウント
@z

@x
  - sectiontitle: Automated builds
    section:
      - path: /docker-hub/builds/how-builds-work/
        title: How Automated builds work
      - path: /docker-hub/builds/
        title: Set up Automated builds
      - path: /docker-hub/builds/manage-builds/
        title: Manage your builds
      - path: /docker-hub/builds/troubleshoot/
        title: Troubleshoot your builds
      - path: /docker-hub/builds/automated-testing/
        title: Testing in Automated builds
      - path: /docker-hub/builds/advanced/
        title: Advanced options for builds
      - path: /docker-hub/builds/link-source/
        title: Link to GitHub and BitBucket
@y
  - sectiontitle: 自動ビルド
    section:
      - path: __SUBDIR__/docker-hub/builds/how-builds-work/
        title: 自動ビルドはどのように動作するか
      - path: __SUBDIR__/docker-hub/builds/
        title: 自動ビルドのセットアップ
      - path: __SUBDIR__/docker-hub/builds/manage-builds/
        title: ビルド管理
      - path: __SUBDIR__/docker-hub/builds/troubleshoot/
        title: ビルドのトラブルシューティング
      - path: __SUBDIR__/docker-hub/builds/automated-testing/
        title: Testing in Automated builds
      - path: __SUBDIR__/docker-hub/builds/advanced/
        title: Advanced options for builds
      - path: __SUBDIR__/docker-hub/builds/link-source/
        title: GitHub や BitBucket へのリンク
@z

@x
  - path: /docker-hub/vulnerability-scanning/
    title: Vulnerability scanning
  - path: /docker-hub/mirror/
    title: Mirroring
  - path: /registry/
    title: Registry
  - path: /docker-hub/oci-artifacts/
    title: OCI artifacts
  - path: /docker-hub/release-notes/
    title: Release notes
@y
  - path: __SUBDIR__/docker-hub/vulnerability-scanning/
    title: ぜい弱性スキャン
  - path: __SUBDIR__/docker-hub/mirror/
    title: ミラーリング
  - path: __SUBDIR__/registry/
    title: レジストリ
  - path: __SUBDIR__/docker-hub/oci-artifacts/
    title: OCI artifacts
  - path: __SUBDIR__/docker-hub/release-notes/
    title: リリースノート
@z

@x
- sectiontitle: Administration
  section:
  - path: /admin/
    title: Overview
@y
- sectiontitle: Administration
  section:
  - path: __SUBDIR__/admin/
    title: 概要
@z

@x
  - sectiontitle: Organization administration
    section:
    - path: /admin/organization/
      title: Overview
    - path: /admin/organization/orgs/
      title: Create your organization
    - path: /admin/organization/onboard/
      title: Onboard your organization
    - path: /admin/organization/members/
      title: Manage members
    - path: /admin/organization/manage-a-team/
      title: Create and manage a team
    - path: /admin/organization/activity-logs/
      title: Activity logs
    - path: /admin/organization/general-settings/
      title: Organization settings
@y
  - sectiontitle: Organization administration
    section:
    - path: __SUBDIR__/admin/organization/
      title: 概要
    - path: __SUBDIR__/admin/organization/orgs/
      title: 組織の生成
    - path: __SUBDIR__/admin/organization/onboard/
      title: Onboard your organization
    - path: __SUBDIR__/admin/organization/members/
      title: メンバー管理
    - path: __SUBDIR__/admin/organization/manage-a-team/
      title: チーム生成と管理
    - path: __SUBDIR__/admin/organization/activity-logs/
      title: アクティビティーログ
    - path: __SUBDIR__/admin/organization/general-settings/
      title: 組織の設定
@z

@x
  - sectiontitle: Company administration
    section:
    - path: /admin/company/
      title: Overview
    - path: /admin/company/new-company/
      title: Create a company
    - path: /admin/company/organizations/
      title: Manage organizations
    - path: /admin/company/users/
      title: Manage users
    - path: /admin/company/owners/
      title: Manage company owners
@y
  - sectiontitle: Company administration
    section:
    - path: __SUBDIR__/admin/company/
      title: Overview
    - path: __SUBDIR__/admin/company/new-company/
      title: Create a company
    - path: __SUBDIR__/admin/company/organizations/
      title: Manage organizations
    - path: __SUBDIR__/admin/company/users/
      title: Manage users
    - path: __SUBDIR__/admin/company/owners/
      title: Manage company owners
@z

@x
  - sectiontitle: Account and admin FAQ
    section:
    - path: /admin/faqs/general-faqs/
      title: General
    - path: /admin/faqs/organization-faqs/
      title: Organization
    - path: /admin/faqs/company-faqs/
      title: Company
@y
  - sectiontitle: Account and admin FAQ
    section:
    - path: __SUBDIR__/admin/faqs/general-faqs/
      title: General
    - path: __SUBDIR__/admin/faqs/organization-faqs/
      title: Organization
    - path: __SUBDIR__/admin/faqs/company-faqs/
      title: Company
@z

@x
  - path: /admin/convert-account/
    title: Convert an account into an organization
  - path: /admin/deactivate-account/
    title: Deactivate an organization
@y
  - path: __SUBDIR__/admin/convert-account/
    title: Convert an account into an organization
  - path: __SUBDIR__/admin/deactivate-account/
    title: Deactivate an organization
@z

@x
- sectiontitle: Security
  section:
  - path: /security/
    title: Overview
@y
- sectiontitle: Security
  section:
  - path: __SUBDIR__/security/
    title: Overview
@z

@x
  - sectiontitle: For admins
    section:
    - sectiontitle: Single Sign-on
      section:
      -  path: /security/for-admins/single-sign-on/
         title: Overview
      -  path: /security/for-admins/single-sign-on/configure/
         title: Configure Docker
      -  path: /security/for-admins/single-sign-on/configure/configure-idp/
         title: Configure your IdP
      -  path: /security/for-admins/single-sign-on/connect/
         title: Connect
      -  path: /security/for-admins/single-sign-on/manage/
         title: Manage
@y
  - sectiontitle: For admins
    section:
    - sectiontitle: Single Sign-on
      section:
      -  path: __SUBDIR__/security/for-admins/single-sign-on/
         title: Overview
      -  path: __SUBDIR__/security/for-admins/single-sign-on/configure/
         title: Configure Docker
      -  path: __SUBDIR__/security/for-admins/single-sign-on/configure/configure-idp/
         title: Configure your IdP
      -  path: __SUBDIR__/security/for-admins/single-sign-on/connect/
         title: Connect
      -  path: __SUBDIR__/security/for-admins/single-sign-on/manage/
         title: Manage
@z

@x
    - sectiontitle: Provisioning
      section:
      - path: /security/for-admins/provisioning/scim/
        title: SCIM
      - path: /security/for-admins/provisioning/just-in-time/
        title: Just-in-Time
      - path: /security/for-admins/provisioning/group-mapping/
        title: Group mapping
@y
    - sectiontitle: Provisioning
      section:
      - path: __SUBDIR__/security/for-admins/provisioning/scim/
        title: SCIM
      - path: __SUBDIR__/security/for-admins/provisioning/just-in-time/
        title: Just-in-Time
      - path: __SUBDIR__/security/for-admins/provisioning/group-mapping/
        title: Group mapping
@z

@x
    - sectiontitle: Enforce sign-in
      section:
      - path: /security/for-admins/enforce-sign-in/
        title: Overview
      - path: /security/for-admins/enforce-sign-in/methods/
        title: Methods
@y
    - sectiontitle: Enforce sign-in
      section:
      - path: __SUBDIR__/security/for-admins/enforce-sign-in/
        title: Overview
      - path: __SUBDIR__/security/for-admins/enforce-sign-in/methods/
        title: Methods
@z

@x
    - path: /security/for-admins/roles-and-permissions/
      title: Roles and permissions
    - path: /security/for-admins/domain-audit/
      title: Domain audit
    - path: /security/for-admins/image-access-management/
      title: Image Access Management
    - path: /security/for-admins/registry-access-management/
      title: Registry Access Management
@y
    - path: __SUBDIR__/security/for-admins/roles-and-permissions/
      title: Roles and permissions
    - path: __SUBDIR__/security/for-admins/domain-audit/
      title: Domain audit
    - path: __SUBDIR__/security/for-admins/image-access-management/
      title: Image Access Management
    - path: __SUBDIR__/security/for-admins/registry-access-management/
      title: Registry Access Management
@z

@x
  - sectiontitle: For developers
    section:
    - path: /security/for-developers/access-tokens/
      title: Create and manage access tokens
    - sectiontitle: Two-factor authentication
      section:
      - path: /security/for-developers/2fa/
        title: Enable two-factor authentication
      - path: /security/for-developers/2fa/disable-2fa/
        title: Disable two-factor authentication
      - path: /security/for-developers/2fa/recover-hub-account/
        title: Recover your Docker account
      - path: /security/for-developers/2fa/new-recovery-code/
        title: Generate a new recovery code
  - path: /security/security-announcements/
    title: Security announcements
@y
  - sectiontitle: For developers
    section:
    - path: __SUBDIR__/security/for-developers/access-tokens/
      title: Create and manage access tokens
    - sectiontitle: Two-factor authentication
      section:
      - path: __SUBDIR__/security/for-developers/2fa/
        title: Enable two-factor authentication
      - path: __SUBDIR__/security/for-developers/2fa/disable-2fa/
        title: Disable two-factor authentication
      - path: __SUBDIR__/security/for-developers/2fa/recover-hub-account/
        title: Recover your Docker account
      - path: __SUBDIR__/security/for-developers/2fa/new-recovery-code/
        title: Generate a new recovery code
  - path: __SUBDIR__/security/security-announcements/
    title: Security announcements
@z

@x
  - sectiontitle: Security FAQs
    section:
    - path: /security/faqs/general/
      title: General
    - path: /security/faqs/networking-and-vms/
      title: Networking and VMs
    - path: /security/faqs/containers/
      title: Containers
@y
  - sectiontitle: Security FAQs
    section:
    - path: __SUBDIR__/security/faqs/general/
      title: General
    - path: __SUBDIR__/security/faqs/networking-and-vms/
      title: Networking and VMs
    - path: __SUBDIR__/security/faqs/containers/
      title: Containers
@z

@x
    - sectiontitle: Single Sign-On
      section:
      - path: /security/faqs/single-sign-on/faqs/
        title: General
      - path: /security/faqs/single-sign-on/idp-faqs/
        title: Identity providers
      - path: /security/faqs/single-sign-on/domain-faqs/
        title: Domains
      - path: /security/faqs/single-sign-on/enforcement-faqs/
        title: Enforcement
      - path: /security/faqs/single-sign-on/users-faqs/
        title: Manage users
@y
    - sectiontitle: Single Sign-On
      section:
      - path: __SUBDIR__/security/faqs/single-sign-on/faqs/
        title: General
      - path: __SUBDIR__/security/faqs/single-sign-on/idp-faqs/
        title: Identity providers
      - path: __SUBDIR__/security/faqs/single-sign-on/domain-faqs/
        title: Domains
      - path: __SUBDIR__/security/faqs/single-sign-on/enforcement-faqs/
        title: Enforcement
      - path: __SUBDIR__/security/faqs/single-sign-on/users-faqs/
        title: Manage users
@z

@x
- sectiontitle: Billing
  section:
  - path: /billing/
    title: Overview
@y
- sectiontitle: Billing
  section:
  - path: __SUBDIR__/billing/
    title: Overview
@z

@x
  - sectiontitle: Docker Core billing
    section:
    - path: /billing/core-billing/get-started-core/
      title: Get started with Docker Core
    - path: /billing/core-billing/payment-method/
      title: Add or update a payment method
    - path: /billing/core-billing/details/
      title: Update the billing information
    - path: /billing/core-billing/history/
      title: View your billing history
    - path: /billing/core-billing/cycle/
      title: Change your billing cycle
@y
  - sectiontitle: Docker Core billing
    section:
    - path: __SUBDIR__/billing/core-billing/get-started-core/
      title: Get started with Docker Core
    - path: __SUBDIR__/billing/core-billing/payment-method/
      title: Add or update a payment method
    - path: __SUBDIR__/billing/core-billing/details/
      title: Update the billing information
    - path: __SUBDIR__/billing/core-billing/history/
      title: View your billing history
    - path: __SUBDIR__/billing/core-billing/cycle/
      title: Change your billing cycle
@z

@x
  - path: /billing/build-billing/
    title: Docker Build Cloud billing
  - path: /billing/scout-billing/
    title: Docker Scout billing
  - path: /billing/tax-certificate/
    title: Register a tax certificate
  - path: /billing/3d-secure/
    title: 3D Secure authentication
  - path: /billing/faqs/
    title: Billing FAQs
@y
  - path: __SUBDIR__/billing/build-billing/
    title: Docker Build Cloud billing
  - path: __SUBDIR__/billing/scout-billing/
    title: Docker Scout billing
  - path: __SUBDIR__/billing/tax-certificate/
    title: Register a tax certificate
  - path: __SUBDIR__/billing/3d-secure/
    title: 3D Secure authentication
  - path: __SUBDIR__/billing/faqs/
    title: 支払いに関する FAQ
@z

@x
- sectiontitle: Subscription
  section:
  - path: /subscription/
    title: Overview
@y
- sectiontitle: Subscription
  section:
  - path: __SUBDIR__/subscription/
    title: Overview
@z

@x
  - sectiontitle: Docker Core
    section:
    - path: /subscription/core-subscription/details/
      title: Subscriptions and features
    - path: /subscription/core-subscription/upgrade/
      title: Upgrade
    - path: /subscription/core-subscription/add-seats/
      title: Add seats
    - path: /subscription/core-subscription/remove-seats/
      title: Remove seats
    - path: /subscription/core-subscription/downgrade/
      title: Downgrade
@y
  - sectiontitle: Docker Core
    section:
    - path: __SUBDIR__/subscription/core-subscription/details/
      title: Subscriptions and features
    - path: __SUBDIR__/subscription/core-subscription/upgrade/
      title: Upgrade
    - path: __SUBDIR__/subscription/core-subscription/add-seats/
      title: Add seats
    - path: __SUBDIR__/subscription/core-subscription/remove-seats/
      title: Remove seats
    - path: __SUBDIR__/subscription/core-subscription/downgrade/
      title: Downgrade
@z

@x
  - sectiontitle: Docker Build Cloud
    section:
    - path: /subscription/build-cloud/build-details/
      title: Subscriptions and features
    - path: /subscription/build-cloud/manage-seats/
      title: Manage seats and invites
@y
  - sectiontitle: Docker Build Cloud
    section:
    - path: __SUBDIR__/subscription/build-cloud/build-details/
      title: Subscriptions and features
    - path: __SUBDIR__/subscription/build-cloud/manage-seats/
      title: Manage seats and invites
@z

@x
  - path: /subscription/scout-details/
    title: Docker Scout subscriptions and features
  - path: /subscription/desktop-license/
    title: Docker Desktop license agreement
  - path: /subscription/faq/
    title: Subscription FAQ
@y
  - path: __SUBDIR__/subscription/scout-details/
    title: Docker Scout subscriptions and features
  - path: __SUBDIR__/subscription/desktop-license/
    title: Docker Desktop license agreement
  - path: __SUBDIR__/subscription/faq/
    title: Subscription FAQ
@z

@x
- sectiontitle: Trusted content
  section:
  - path: /trusted-content/
    title: Overview
  - sectiontitle: Docker Official Images
    section:
    - path: /trusted-content/official-images/
      title: Overview
    - path: /trusted-content/official-images/using/
      title: Using official images
    - path: /trusted-content/official-images/contributing/
      title: Contributing
  - path: /trusted-content/dvp-program/
    title: Docker Verified Publisher Program
  - path: /trusted-content/dsos-program/
    title: Docker-Sponsored Open Source Program
  - path: /trusted-content/insights-analytics/
    title: Insights and analytics
@y
- sectiontitle: Trusted content
  section:
  - path: __SUBDIR__/trusted-content/
    title: 概要
  - sectiontitle: Docker 公式イメージ
    section:
    - path: __SUBDIR__/trusted-content/official-images/
      title: 概要
    - path: __SUBDIR__/trusted-content/official-images/using/
      title: 公式イメージの利用
    - path: __SUBDIR__/trusted-content/official-images/contributing/
      title: 貢献
  - path: __SUBDIR__/trusted-content/dvp-program/
    title: Docker Verified Publisher Program
  - path: __SUBDIR__/trusted-content/dsos-program/
    title: Docker-Sponsored Open Source Program
  - path: __SUBDIR__/trusted-content/insights-analytics/
    title: Insights and analytics
@z

@x
- path: /support/
  title: Get support
- path: /release-lifecycle/
  title: Product release lifecycle
@y
- path: __SUBDIR__/support/
  title: サポート
- path: __SUBDIR__/release-lifecycle/
  title: 製品リリースのライフサイクル
@z
