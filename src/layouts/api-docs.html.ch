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
      <p class="api-eyebrow">Developer reference</p>
      <h1>Docker APIs</h1>
      <p class="api-lead">
        Build with Docker, from your local daemon to hosted services.
      </p>
      <p>
        Choose an API to find connection guidance, operations, and data models.
      </p>
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
            <p>API {{ .version }} · {{ len .operations }} operations</p>
            <span>Explore reference →</span></a
@y
            <p>API {{ .version }} · {{ len .operations }} operations</p>
            <span>Explore reference →</span></a
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
            <span>Explore reference →</span>
@y
            <span>Explore reference →</span>
@z
@x
        <a href="/reference/api/">APIs</a> /
@y
        <a href="/reference/api/">APIs</a> /
@z
@x
          >API version
@y
          >API version
@z
@x
        ><a href="{{ ref . $api.manual }}">Product manual</a
        ><a href="{{ $api.sourceURL }}">Download OpenAPI specification</a
        ><a href="{{ partial "utils/markdown-url.html" . }}">Markdown</a>
@y
        ><a href="{{ ref . $api.manual }}">Product manual</a
        ><a href="{{ $api.sourceURL }}">Download OpenAPI specification</a
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
