%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
% snip 対応

@x
title: Local models with Docker Model Runner
linkTitle: Local models
description: Run AI models locally using Docker Model Runner - no API keys required
keywords: [cagent, docker model runner, dmr, local models, embeddings, offline]
@y
title: Docker Model Runner でのローカルモデル利用
linkTitle: ローカルモデル
description: Run AI models locally using Docker Model Runner - no API keys required
keywords: [cagent, docker model runner, dmr, local models, embeddings, offline]
@z

@x
Docker Model Runner lets you run AI models locally on your machine. No API
keys, no recurring costs, and your data stays private.
@y
Docker Model Runner では、ローカルマシン上における AI モデルを実行することができます。
API キーや定期的コストは不要であり、データをプライベートに保つことができます。
@z

@x
## Why use local models
@y
## ローカルモデルをなぜ使うのか {#why-use-local-models}
@z

@x
Docker Model Runner lets you run models locally without API keys or recurring
costs. Your data stays on your machine, and you can work offline once models
are downloaded. This is an alternative to [cloud model
providers](model-providers.md).
@y
Docker Model Runner を利用すると、API キーや定期的コストがなくても、ローカル環境においてモデルを実行できます。
データはローカルマシン内に保持します。
モデルをダウンロードしていれば、オフラインにより作動させることができます。
これは [クラウドモデルプロバイダー](model-providers.md) に代わるものです。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
You need Docker Model Runner installed and running:
@y
Docker Model Runner をインストールしており、さらに以下を起動しておくことが必要です。
@z

@x
- Docker Desktop (macOS/Windows) - Enable Docker Model Runner in
  **Settings > AI > Enable Docker Model Runner**. See [Get started with
  DMR](/manuals/ai/model-runner/get-started.md#enable-docker-model-runner) for
  detailed instructions.
- Docker Engine (Linux) - Install with `sudo apt-get install
docker-model-plugin` or `sudo dnf install docker-model-plugin`. See [Get
  started with DMR](/manuals/ai/model-runner/get-started.md#docker-engine).
@y
- Docker Desktop (macOS/Windows) - **Settings > AI > Enable Docker Model Runner** により Docker Model Runner を有効にします。
 具体的な手順については [DMR をはじめよう](manuals/ai/model-runner/get-started.md#enable-docker-model-runner) を参照してください。
- Docker Engine (Linux) - `sudo apt-get install docker-model-plugin` または `sudo dnf install docker-model-plugin` によりインストールします。
  詳しくは [DMR をはじめよう](manuals/ai/model-runner/get-started.md#docker-engine) を参照してください。
@z

@x
Verify Docker Model Runner is available:
@y
Docker Model Runner が利用可能かどうかを確認します。
@z

% snip command...

@x
If the command returns version information, you're ready to use local models.
@y
上のコマンドによりバージョン情報が返ってくれば、ローカルモデルを利用することができます。
@z

@x
## Using models with DMR
@y
## DMR によるモデルの利用 {#using-models-with-dmr}
@z

@x
Docker Model Runner can run any compatible model. Models can come from:
@y
Docker Model Runner は互換性のあるモデルであれば何であっても動作します。
モデルは以下から入手可能です。
@z

@x
- Docker Hub repositories (`docker.io/namespace/model-name`)
- Your own OCI artifacts packaged and pushed to any registry
- HuggingFace models directly (`hf.co/org/model-name`)
- The Docker Model catalog in Docker Desktop
@y
- Docker Hub リポジトリ (`docker.io/namespace/model-name`)
- 独自のレジストリにプッシュしパッケージ化した OCI 成果物
- HuggingFace モデルへの直接アクセス (`hf.co/org/model-name`)
- Docker Desktop 内の Docker Model カタログ
@z

@x
To see models available to the local Docker catalog, run:
@y
ローカルの Docker カタログにおいてモデルが利用可能かどうかを確認するには、以下を実行します。
@z

% snip command...

@x
To use a model, reference it in your configuration. DMR automatically pulls
models on first use if they're not already local.
@y
モデルを利用する場合は、それを参照するように設定します。
ローカルにまだモデルがプルされていない場合は、DMR がその利用の初回に自動的にプルを行います。
@z

@x
## Configuration
@y
## 設定 {#configuration}
@z

@x
Configure your agent to use Docker Model Runner with the `dmr` provider:
@y
agent においては Docker Model Runner の利用にあたって `dmr` プロバイダーを指定します。
@z

% snip code...

@x
When you first run your agent, cagent prompts you to pull the model if it's
not already available locally:
@y
agent を初めて実行する際に、ローカル環境にモデルがプルされていない場合には、cagent がモデルのプルをプロンプトにより促してきます。
@z

% snip command...

@x
## How it works
@y
## どうやって動作するのか {#how-it-works}
@z

@x
When you configure an agent to use DMR, cagent automatically connects to your
local Docker Model Runner and routes inference requests to it. If a model isn't
available locally, cagent prompts you to pull it on first use. No API keys or
authentication are required.
@y
DMR の利用にあたってモデルを指定した場合、cagent は自動的にローカル環境にある Docker Model Runner への接続を行い、指示を行うためのインターフェースを確立します。
ローカル環境にモデルがまだ存在せず、それが初めての利用であるとき、cagent がモデルのプルをプロンプトにより促します。
この場合に API キーや認証は不要です。
@z

@x
## Advanced configuration
@y
## さらなる設定 {#advanced-configuration}
@z

@x
For more control over model behavior, define a model configuration:
@y
モデルの動作をさらに細かく指定する場合は、モデル設定を定義します。
@z

% snip code...

@x
### Faster inference with speculative decoding
@y
### Faster inference with speculative decoding {#faster-inference-with-speculative-decoding}
@z

@x
Speed up model responses using speculative decoding with a smaller draft model:
@y
Speed up model responses using speculative decoding with a smaller draft model:
@z

% snip code...

@x
The draft model generates token candidates, and the main model validates them.
This can significantly improve throughput for longer responses.
@y
The draft model generates token candidates, and the main model validates them.
This can significantly improve throughput for longer responses.
@z

@x
### Runtime flags
@y
### Runtime flags {#runtime-flags}
@z

@x
Pass engine-specific flags to optimize performance:
@y
Pass engine-specific flags to optimize performance:
@z

% snip code...

@x
Common flags:
@y
Common flags:
@z

@x
- `--ngl` - Number of GPU layers
- `--threads` - CPU thread count
- `--repeat-penalty` - Repetition penalty
@y
- `--ngl` - Number of GPU layers
- `--threads` - CPU thread count
- `--repeat-penalty` - Repetition penalty
@z

@x
## Using DMR for RAG
@y
## Using DMR for RAG
@z

@x
Docker Model Runner supports both embeddings and reranking for RAG workflows.
@y
Docker Model Runner supports both embeddings and reranking for RAG workflows.
@z

@x
### Embedding with DMR
@y
### Embedding with DMR
@z

@x
Use local embeddings for indexing your knowledge base:
@y
Use local embeddings for indexing your knowledge base:
@z

% snip code...

@x
### Reranking with DMR
@y
### Reranking with DMR
@z

@x
DMR provides native reranking for improved RAG results:
@y
DMR provides native reranking for improved RAG results:
@z

% snip code...

@x
Native DMR reranking is the fastest option for reranking RAG results.
@y
Native DMR reranking is the fastest option for reranking RAG results.
@z

@x
## Troubleshooting
@y
## Troubleshooting
@z

@x
If cagent can't find Docker Model Runner:
@y
If cagent can't find Docker Model Runner:
@z

@x
1. Verify Docker Model Runner status:
@y
1. Verify Docker Model Runner status:
@z

% snip command...

@x
2. Check available models:
@y
2. Check available models:
@z

% snip command...

@x
3. Check model logs for errors:
@y
3. Check model logs for errors:
@z

% snip command...

@x
4. Ensure Docker Desktop has Model Runner enabled in settings (macOS/Windows)
@y
4. Ensure Docker Desktop has Model Runner enabled in settings (macOS/Windows)
@z

@x
## What's next
@y
## What's next
@z

@x
- Follow the [tutorial](tutorial.md) to build your first agent with local
  models
- Learn about [RAG](rag.md) to give your agents access to codebases and
  documentation
- See the [configuration reference](reference/config.md#docker-model-runner-dmr)
  for all DMR options
@y
- Follow the [tutorial](tutorial.md) to build your first agent with local
  models
- Learn about [RAG](rag.md) to give your agents access to codebases and
  documentation
- See the [configuration reference](reference/config.md#docker-model-runner-dmr)
  for all DMR options
@z
