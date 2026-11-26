%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
          <a class="api-card" href="{{ .url }}"
@y
          <a class="api-card" href="__SUBDIR__{{ .url }}"
@z

@x
                Your daemon
@y
                Your daemon
@z

@x
                Hosted service
@y
                Hosted service
@z

@x
            <h2>{{ .title }}{{ if .experimental }}· Experimental{{ end }}</h2>
            <p>API {{ .version }} · {{ len .operations }} operations</p>
            <span>Explore reference →</span></a
@y
            <h2>{{ .title }}{{ if .experimental }}· 試験的{{ end }}</h2>
            <p>API {{ .version }} · API数 {{ len .operations }}</p>
            <span>リファレンス参照 →</span></a
@z

@x
          <a class="api-card" href="{{ .url }}">
@y
          <a class="api-card" href="__SUBDIR__{{ .url }}">
@z

@x
                Your daemon
@y
                Your daemon
@z

@x
                Hosted service
@y
                Hosted service
@z

@x
            <h2>{{ .title }}{{ if .experimental }}· Experimental{{ end }}</h2>
            <p>{{ .description }}</p>
            <span>Explore reference →</span>
@y
            <h2>{{ .title }}{{ if .experimental }}· Experimental{{ end }}</h2>
            <p>{{ .description }}</p>
            <span>リファレンス参照 →</span>
@z

@x
        <p class="api-label">Experimental</p>
        {{ if eq .Params.view "overview" }}
@y
        <p class="api-label">試験的</p>
        {{ if eq .Params.view "overview" }}
@z

@x
            This API is experimental. Features, interfaces, and behavior may
            change.
@y
            This API is experimental. Features, interfaces, and behavior may
            change.
@z

@x
          >API version
@y
          >API バージョン
@z

@x
                  value="{{ .url }}"
                  {{ if eq .id $api.id }}selected{{ end }}
@y
                  value="__SUBDIR__{{ .url }}"
                  {{ if eq .id $api.id }}selected{{ end }}
@z

@x
        ><a href="{{ ref . $api.manual }}">Product manual</a
        ><a href="{{ $api.sourceURL }}">Download OpenAPI specification</a
        ><a href="{{ partial "utils/markdown-url.html" . }}">Markdown</a>
@y
        ><a href="{{ ref . $api.manual }}">製品マニュアル</a
        ><a href="{{ $api.sourceURL }}">OpenAPI 仕様のダウンロード</a
        ><a href="{{ partial "utils/markdown-url.html" . }}">マークダウン</a>
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
          API {{ $api.version }} · {{ len $api.operations }} operations ·
          {{ len $api.schemas }} named schemas
@y
          API {{ $api.version }} · {{ len $api.operations }} operations ·
          {{ len $api.schemas }} named schemas
@z

@x
          <h2 id="api-overview-title">Overview</h2>
@y
          <h2 id="api-overview-title">Overview</h2>
@z

@x
              Connecting to
              {{ $api.title }}
@y
              Connecting to
              {{ $api.title }}
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
                <span>Deprecated</span>
@y
                <span>Deprecated</span>
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
                        <small class="api-required">Required</small>
@y
                        <small class="api-required">Required</small>
@z

@x
                      <p>Serialization: <code>{{ . }}</code></p>
@y
@z

@x
                <h2>Request and responses</h2>
@y
                <h2>Request and responses</h2>
@z

@x
                      <p>No response content is declared.</p>
@y
                      <p>No response content is declared.</p>
@z

@x
                      <h4>Stream item</h4>
@y
                      <h4>Stream item</h4>
@z

@x
                            {{ $key }}: content types and part headers
@y
                            {{ $key }}: content types and part headers
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
                      Client guidance
@y
                      Client guidance
@z

@x
                    Replace placeholders and supply the required credentials or
                    request body.
@y
                    Replace placeholders and supply the required credentials or
                    request body.
@z
