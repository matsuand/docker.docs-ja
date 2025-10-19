%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Models
description: Learn about the models top-level element
keywords: compose, compose specification, models, compose file reference
@y
title: models
description: Learn about the models top-level element
keywords: compose, compose specification, models, compose file reference
@z

@x
{{< summary-bar feature_name="Compose models" >}}
@y
{{< summary-bar feature_name="Compose models" >}}
@z

@x
The top-level `models` section declares AI models that are used by your Compose application. These models are typically pulled as OCI artifacts, run by a model runner, and exposed as an API that your service containers can consume.
@y
トップレベルの `models` セクションは AI モデルを宣言するものであり、Compose アプリケーションにおいて利用されます。
このモデルは通常 ACI アーティファクトとしてプルされて、モデルランナーによって実行されます。
またサービスコンテナーとして利用できる API として公開されます。
@z

@x
Services can only access models when explicitly granted by a [`models` attribute](services.md#models) within the `services` top-level element.
@y
サービスがモデルにアクセスできるのは、トップレベル要素 `services` 内の [`models` 属性](services.md#models) によって明示的に許可された場合のみです。
@z

@x
## Examples
@y
## 例 {#examples}
@z

@x
### Example 1
@y
## 例１ {#example-1}
@z

% snip code...

@x
In this basic example:
@y
この基本的な例は以下を示しています。
@z

@x
 - The app service uses the `ai_model`.
 - The `ai_model` is defined as an OCI artifact (`ai/model`) that is pulled and served by the model runner.
 - Docker Compose injects connection info, for example `AI_MODEL_URL`, into the container. 
@y
 - app サービスが `ai_model` を利用します。
 - `ai_model` は OCI アーティファクト (`ai/model`) として定義されます。
   これはモデルランナーによってプルされて提供されます。
 - Docker Compose は `AI_MODEL_URL` といった接続情報をコンテナーに設定します。
@z

@x
### Example 2
@y
## 例２ {#example-2}
@z

% snip code...

% snip code...

@x
In this advanced setup:
@y
この応用的な設定は以下を示しています。
@z

@x
 - The service app references `my_model` using the long syntax.
 - Compose injects the model runner's URL as the environment variable `MODEL_URL`.
@y
 - サービス app は長い文法形式を使って `my_model` を参照しています。
 - Compose は環境変数 `MODEL_URL` に示されるモデルランナーの URL を設定しています。
@z

@x
## Attributes
@y
## 属性 {#attributes}
@z

@x
- `model` (required): The OCI artifact identifier for the model. This is what Compose pulls and runs via the model runner. 
- `context_size`: Defines the maximum token context size for the model.
- `runtime_flags`: A list of raw command-line flags passed to the inference engine when the model is started.
@y
- `model` (必須): モデルに対する OCI アーティファクト識別子。
  これにより Compose がモデルランナーを通じてプルと実行を行います。
- `context_size`: モデル用のトークンコンテキストの最大サイズを定義します。
- `runtime_flags`: モデルが起動した際に推論エンジンに受け渡されるコマンドラインフラグのリストです。
@z

@x
## Additional resources
@y
## さらなる情報 {#additional-resources}
@z

@x
For more examples and information on using `model`, see [Use AI models in Compose](/manuals/ai/compose/models-and-compose.md)
@y
`model` の利用例や詳しい情報については [Compose における AI モデルの利用](manuals/ai/compose/models-and-compose.md) を参照してください。
@z
