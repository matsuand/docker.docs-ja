%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
      <p><strong>Note</strong></p>
@y
      <p><strong>メモ</strong></p>
@z

@x
        Samples compatible with
        <a href="{{ absURL "/desktop/dev-environments/" }}"
          >Docker Dev Environments</a
        >
        require
        <a href="{{ absURL "/get-docker/" }}">Docker Desktop</a>
        version 4.10 or later.
@y
        <a href="{{ absURL "/desktop/dev-environments/" }}"
          >Docker Dev Environments</a
        > と互換性のあるサンプルは
        <a href="{{ absURL "/get-docker/" }}">Docker Desktop</a>
        バージョン 4.10 またはそれ以降が必要です。
@z

@x
          <th>Name</th>
          <th>Description</th>
          <th>Docker Dev Environment (if compatible)</th>
@y
          <th>名前</th>
          <th>内容説明</th>
          <th>Docker Dev 環境 (互換性有りの場合)</th>
@z

@x
                  {{ printf "[Open in Docker Dev Environment](https://open.docker.com/dashboard/dev-envs?url=%s)" .url | markdownify }}
@y
                  {{ printf "[Open in Docker Dev Environment](https://open.docker.com/dashboard/dev-envs?url=%s)" .url | markdownify }}
@z

@x
    <h2>Looking for more samples?</h2>
@y
    <h2 id="looking-for-more-samples">さらなるサンプルを探しますか？</h2>
@z

@x
    <p>Visit the following GitHub repositories for more Docker samples.</p>
@y
    <p>以下の GitHub リポジトリから、さらなる Docker サンプルを確認してください。</p>
@z

@x
          {{ markdownify "[Awesome Compose](https://github.com/docker/awesome-compose)" }}:
          A curated repository containing over 30 Docker Compose samples. These
          samples offer a starting point for how to integrate different services
          using a Compose file.
@y
          {{ markdownify "[Awesome Compose](https://github.com/docker/awesome-compose)" }}:
          30 以上の Docker Compose サンプルを集約したリポジトリです。
          これらのサンプルからは、Compose ファイルを使ってさまざまなサービスを組み合わせる方法を学ぶことができます。
@z

@x
          {{ markdownify "[Docker Samples](https://github.com/dockersamples?q=&type=all&language=&sort=stargazers)" }}:
          A collection of over 30 repositories that offer sample containerized
          demo applications, tutorials, and labs.
@y
          {{ markdownify "[Docker サンプル](https://github.com/dockersamples?q=&type=all&language=&sort=stargazers)" }}:
          30 以上のリポジトリからなり、デモアプリケーション、チュートリアル、ラボなどのコンテナー化サンプルを提供しています。
@z
