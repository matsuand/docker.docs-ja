%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
      <p class="api-eyebrow">Developer reference</p>
      <h1>Docker APIs</h1>
      <p class="api-lead">
        Build with Docker, from your local daemon to hosted services.
      </p>
      <p>
        Choose an API to find connection guidance, operations, and data models.
      </p>
@y
      <p class="api-eyebrow">開発者リファレンス</p>
      <h1>Docker API</h1>
      <p class="api-lead">
        ローカルデーモンからホストサービスに向けて Docker 開発
      </p>
      <p>
        接続ガイド、操作、データモデルに従って API を検索
      </p>
@z

@x
          <a class="api-card" href="{{ .url }}"
@y
          <a class="api-card" href="__SUBDIR__{{ .url }}"
@z

@x
                Your daemon
@y
                デーモン
@z
@x
                Hosted service
@y
                ホストサービス
@z
@x
            <p>API {{ .version }} · {{ len .operations }} operations</p>
            <span>Explore reference →</span></a
@y
            <p>API {{ .version }} · {{ len .operations }} オペレーション</p>
            <span>リファレンス詳細 →</span></a
@z
@x
          <a class="api-card" href="{{ .url }}">
@y
          <a class="api-card" href="__SUBDIR__{{ .url }}">
@z
@x
                Your daemon
@y
                デーモン
@z
@x
                Hosted service
@y
                ホストサービス
@z
@x
            <h2>{{ .title }}{{ if .experimental }}· Experimental{{ end }}</h2>
@y
            <h2>{{ .title }}{{ if .experimental }}· 試験的{{ end }}</h2>
@z
@x
            <span>Explore reference →</span>
@y
            <span>リファレンス詳細 →</span>
@z
@x
        <a href="/reference/api/">APIs</a> /
        <a href="{{ $api.url }}">{{ $api.title }}</a> /
@y
        <a href="__SUBDIR__/reference/api/">API</a> /
        <a href="__SUBDIR__{{ $api.url }}">{{ $api.title }}</a> /
@z
@x
          >API version
@y
          >API バージョン
@z
@x
                  value="{{ .url }}"
@y
                  value="__SUBDIR__{{ .url }}"
@z
@x
        ><a href="{{ ref . $api.manual }}">Product manual</a
        ><a href="{{ $api.sourceURL }}">Download OpenAPI specification</a
        ><a href="{{ partial "utils/markdown-url.html" . }}">Markdown</a>
@y
        ><a href="{{ ref . $api.manual }}">製品マニュアル</a
        ><a href="{{ $api.sourceURL }}">OpenAPI 仕様のダウンロード</a
        ><a href="{{ partial "utils/markdown-url.html" . }}">Markdown</a>
@z
@x
            User-operated API
@y
            User-operated API
@z
@x
            Hosted API
@y
            Hosted API
@z
@x
          <h2 id="api-overview-title">Overview</h2>
@y
          <h2 id="api-overview-title">Overview</h2>
@z
@x
              Connecting to
@y
              Connecting to
@z
@x
              Connecting to the {{ $api.title }} API
@y
              Connecting to the {{ $api.title }} API
@z

@x
        <h2>Operations</h2>
@y
        <h2>Operations</h2>
@z
@x
                <h2>Connection and access</h2>
@y
                <h2>Connection and access</h2>
@z
@x
                    >API connection and authentication guidance</a
@y
                    >API connection and authentication guidance</a
@z
@x
                    <code>X-Registry-Auth</code> delegates registry credentials
                    and does not authenticate the daemon caller.
@y
                    <code>X-Registry-Auth</code> delegates registry credentials
                    and does not authenticate the daemon caller.
@z
@x
                    No HTTP authentication requirement is declared for this
                    operation. Transport access controls can still apply.
@y
                    No HTTP authentication requirement is declared for this
                    operation. Transport access controls can still apply.
@z
@x
                    Use one of these alternatives. Requirements within an
                    alternative apply together.
@y
                    Use one of these alternatives. Requirements within an
                    alternative apply together.
@z
@x
                            AND
@y
                            AND
@z
@x
                        {{ end }}{{ if $first }}Anonymous access{{ end }}
@y
                        {{ end }}{{ if $first }}Anonymous access{{ end }}
@z
@x
                <h2>Parameters</h2>
@y
                <h2>Parameters</h2>
@z
@x
                  <p>No parameters are declared.</p>
@y
                  <p>No parameters are declared.</p>
@z
@x
                <h2>Request and responses</h2>
@y
                <h2>Request and responses</h2>
@z
@x
                      <h4>Headers</h4>
@y
                      <h4>Headers</h4>
@z
@x
                            >Example
@y
                            >Example
@z
@x
                <h2>Referenced schemas</h2>
@y
                <h2>Referenced schemas</h2>
@z
@x
                  <summary>Complete operation contract</summary>
@y
                  <summary>Complete operation contract</summary>
@z
@x
                      Example request
@y
                      Example request
@z
@x
                      WebSocket client
@y
                      WebSocket client
@z
@x
                    Replace placeholders and supply the required credentials or
                    request body.
@y
                    Replace placeholders and supply the required credentials or
                    request body.
@z
