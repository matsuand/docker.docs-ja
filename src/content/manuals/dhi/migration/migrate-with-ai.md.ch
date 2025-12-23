%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Migrate using Docker's AI-powered assistant
linktitle: AI-assisted migration
description: Use Docker's AI-powered assistant to automatically migrate your Dockerfile to Docker Hardened Images
@y
title: Docker AI アシスタントを使った移行
linktitle: AI アシスタントによる移行
description: Use Docker's AI-powered assistant to automatically migrate your Dockerfile to Docker Hardened Images
@z

@x
keywords: ai assistant, migrate dockerfile, docker hardened images, automated migration
@y
keywords: ai assistant, migrate dockerfile, docker hardened images, automated migration
@z

@x
      text: Experimental
@y
      text: 試験的
@z

@x
{{< summary-bar feature_name="Ask Gordon DHI migration" >}}
@y
{{< summary-bar feature_name="Ask Gordon DHI migration" >}}
@z

@x
You can use Docker's AI-powered assistant to automatically migrate your
Dockerfile to use Docker Hardened Images (DHI).
@y
Docker の AI アシスタントを用いると、手元の Dockerfile を自動的に Docker Hardened イメージ (DHI) 利用のものに移行させることができます。
@z

@x
1. Ensure Docker's AI-powered assistant is [enabled](/manuals/ai/gordon.md#enable-ask-gordon).
2. In the terminal, navigate to the directory containing your Dockerfile.
3. Start a conversation with the assistant:
@y
1. Docker の AI アシスタントが [有効](manuals/ai/gordon.md#enable-ask-gordon) であることを確認します。
2. 端末において Dockerfile があるディレクトリに移動します。
3. アシスタントとの対話を起動します。
@z

% snip command...

@x
4. Type:
@y
4. 以下を入力します。
@z

% snip command...

@x
5. Follow the conversation with the assistant. The assistant will edit your Dockerfile, so when
   it requests access to the filesystem and more, type `yes` to allow the assistant to proceed.
@y
5. アシスタントとの対話に従います。
   アシスタントは Dockerfile の編集を行っていきます。
   ファイルシステムなどへのアクセスを要求してきたときには、`yes` と入力してアシスタントとの対話を続けます。
@z

@x
When the migration is complete, you see a success message:
@y
移行が完了したら、成功を表すメッセージが表示されます。
@z

@x
```text
The migration to Docker Hardened Images (DHI) is complete. The updated Dockerfile
successfully builds the image, and no vulnerabilities were detected in the final image.
The functionality and optimizations of the original Dockerfile have been preserved.
```
@y
```text
The migration to Docker Hardened Images (DHI) is complete. The updated Dockerfile
successfully builds the image, and no vulnerabilities were detected in the final image.
The functionality and optimizations of the original Dockerfile have been preserved.
```

```text
(日本語訳)
Docker Hardened イメージ (DHI) への移行が完了しました。更新済みの Dockerfile からは
正常にイメージをビルドできます。最終イメージ内にはぜい弱性は検出されませんでした。
元々の Dockerfile における機能や最適化は保持されています。
```
@z

@x
> [!IMPORTANT]
>
> As with any AI tool, you must verify the assistant's edits and test your image.
@y
> [!IMPORTANT]
>
> どの AI ツールであっても同じことですが、アシスタントの編集結果を確認してイメージのテストを行ってください。
@z
