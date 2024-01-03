%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ define "left" }}
  {{ partial "sidebar.html" . }}
{{ end }}
@y
{{ define "left" }}
  {{ partial "sidebar.html" . }}
{{ end }}
@z

@x
{{ define "main" }}
  {{ partial "breadcrumbs.html" . }}
  <article class="DocSearch-content prose max-w-none dark:prose-invert">
    {{ with .Title }}
    <h1 class="scroll-mt-36">{{ . }}</h1>
    {{ end }}
@y
{{ define "main" }}
  {{ partial "breadcrumbs.html" . }}
  <article class="DocSearch-content prose max-w-none dark:prose-invert">
    {{ with .Title }}
    <h1 class="scroll-mt-36">{{ . }}</h1>
    {{ end }}
@z

@x
    <blockquote>
      <p><strong>Note</strong></p>
      <p>
        Samples compatible with
        <a href="{{ absURL "/desktop/dev-environments/" }}"
          >Docker Dev Environments</a
        >
        require
        <a href="{{ absURL "/get-docker/" }}">Docker Desktop</a>
        version 4.10 or later.
      </p>
    </blockquote>
@y
    <blockquote>
      <p><strong>メモ</strong></p>
      <p>
        Samples compatible with
        <a href="{{ absURL "/desktop/dev-environments/" }}"
          >Docker Dev Environments</a
        > と互換性のあるサンプルは
        <a href="{{ absURL "/get-docker/" }}">Docker Desktop</a>
        バージョン 4.10 またはそれ以降が必要です。
      </p>
    </blockquote>
@z

@x
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Description</th>
          <th>Docker Dev Environment (if compatible)</th>
        </tr>
      </thead>
@y
    <table>
      <thead>
        <tr>
          <th>名前</th>
          <th>内容説明</th>
          <th>Docker Dev 環境 (互換性有りの場合)</th>
        </tr>
      </thead>
@z

@x
      <tbody>
        {{ range site.Data.samples.samples }}
          {{ if in .services $.Params.service }}
            <tr>
              <td>{{ printf "[%s](%s)" .title .url | markdownify }}</td>
              <td>{{ .description }}</td>
              <td>
                {{ if .dev_env }}
                  {{ printf "[Open in Docker Dev Environment](https://open.docker.com/dashboard/dev-envs?url=%s)" .url | markdownify }}
                {{ end }}
              </td>
            </tr>
          {{ end }}
        {{ end }}
      </tbody>
    </table>
@y
      <tbody>
        {{ range site.Data.samples.samples }}
          {{ if in .services $.Params.service }}
            <tr>
              <td>{{ printf "[%s](%s)" .title .url | markdownify }}</td>
              <td>{{ .description }}</td>
              <td>
                {{ if .dev_env }}
                  {{ printf "[Open in Docker Dev Environment](https://open.docker.com/dashboard/dev-envs?url=%s)" .url | markdownify }}
                {{ end }}
              </td>
            </tr>
          {{ end }}
        {{ end }}
      </tbody>
    </table>
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
    <ul>
      <li>
        <p>
          {{ markdownify "[Awesome Compose](https://github.com/docker/awesome-compose)" }}:
          A curated repository containing over 30 Docker Compose samples. These
          samples offer a starting point for how to integrate different services
          using a Compose file.
        </p>
      </li>
@y
    <ul>
      <li>
        <p>
          {{ markdownify "[Awesome Compose](https://github.com/docker/awesome-compose)" }}:
          30 以上の Docker Compose サンプルを集約したリポジトリです。
          これらのサンプルからは、Compose ファイルを使ってさまざまなサービスを組み合わせる方法を学ぶことができます。
        </p>
      </li>
@z

@x
      <li>
        <p>
          {{ markdownify "[Docker Samples](https://github.com/dockersamples?q=&type=all&language=&sort=stargazers)" }}:
          A collection of over 30 repositories that offer sample containerized
          demo applications, tutorials, and labs.
        </p>
      </li>
    </ul>
  </article>
{{ end }}
@y
      <li>
        <p>
          {{ markdownify "[Docker サンプル](https://github.com/dockersamples?q=&type=all&language=&sort=stargazers)" }}:
          30 以上のリポジトリからなり、デモアプリケーション、チュートリアル、ラボなどのコンテナー化サンプルを提供しています。
        </p>
      </li>
    </ul>
  </article>
{{ end }}
@z

@x
{{ define "right" }}
  {{ partial "aside.html" . }}
{{ end }}
@y
{{ define "right" }}
  {{ partial "aside.html" . }}
{{ end }}
@z
