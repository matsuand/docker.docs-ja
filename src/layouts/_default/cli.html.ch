%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% {{ T "Option" }}, (T "Options")
% {{ T "Short" }}
% {{ T "Default" }}
% {{ T "Description" }}, (T "Description")
% (T "Examples")
% (T "Usage")
% (T "Aliases")
% heading.html に受け渡す dict の第三引数追加

@x
          <a href="https://github.com/docker/roadmap/issues/209"
            >Docker roadmap</a
          >
@y
          <a href="https://github.com/docker/roadmap/issues/209"
            >Docker ロードマップ</a
          >
@z

@x
      <blockquote class="important">
        <p><strong>This command is experimental</strong></p>
        <p>
          Experimental features are intended for testing and feedback as their
          functionality or design may change between releases without warning or
          can be removed entirely in a future release.
        </p>
      </blockquote>
@y
      <blockquote class="important">
        <p><strong>This command is experimental</strong></p>
        <p>
          Experimental features are intended for testing and feedback as their
          functionality or design may change between releases without warning or
          can be removed entirely in a future release.
        </p>
      </blockquote>
@z

@x
    {{ with $data.kubernetes }}
      <p>
        {{ partial "components/badge.html" (dict "color" "blue" "content" "Kubernetes") }}
        This command works with the Kubernetes orchestrator.
      </p>
    {{ end }}
@y
    {{ with $data.kubernetes }}
      <p>
        {{ partial "components/badge.html" (dict "color" "blue" "content" "Kubernetes") }}
        This command works with the Kubernetes orchestrator.
      </p>
    {{ end }}
@z

@x
    {{ with $data.swarm }}
      <p>
        {{ partial "components/badge.html" (dict "color" "blue" "content" "Swarm") }}
        This command works with the Swarm orchestrator.
      </p>
    {{ end }}
@y
    {{ with $data.swarm }}
      <p>
        {{ partial "components/badge.html" (dict "color" "blue" "content" "Swarm") }}
        このコマンドは Swarm オーケストレーターにおいて動作します。
      </p>
    {{ end }}
@z

@x (T "Usage") ／dict 第三引数追加
    {{ with $data.usage }}
      {{ $heading := dict "level" 2 "text" "Usage" }}
      {{ partial "heading.html" $heading }}
      {{ $.Scratch.Add "headings" $heading }}
      {{ highlight (strings.Replace . "\t" "") "console" }}
    {{ end }}
@y
    {{ with $data.usage }}
      {{ $heading := dict "level" 2 "text" (T "Usage") "id" "usage" }}
      {{ partial "heading.html" $heading }}
      {{ $.Scratch.Add "headings" $heading }}
      {{ highlight (strings.Replace . "\t" "") "console" }}
    {{ end }}
@z

@x (T "Aliases") ／dict 第三引数追加
    {{ with $data.aliases }}
      {{ $heading := dict "level" 2 "text" "Aliases" }}
      {{ partial "heading.html" $heading }}
      {{ $aliases := strings.Split . ", " }}
      <p>The following commands are equivalent and redirect here:</p>
      <ul>
      {{ range $aliases }}
        <li><code>{{ . }}</code></li>
      {{ end }}
      </ul>
    {{ end }}
@y
    {{ with $data.aliases }}
      {{ $heading := dict "level" 2 "text" (T "Aliases") "id" "aliases" }}
      {{ partial "heading.html" $heading }}
      {{ $aliases := strings.Split . ", " }}
      <p>The following commands are equivalent and redirect here:</p>
      <ul>
      {{ range $aliases }}
        <li><code>{{ . }}</code></li>
      {{ end }}
      </ul>
    {{ end }}
@z

@x (T "Description") ／dict 第三引数追加
    {{ with $data.long }}
      {{ $heading := dict "level" 2 "text" "Description" }}
      {{ partial "heading.html" $heading }}
      {{ $subHeadings := (strings.FindRE `(?m:#{3,4} .*)` .) }}
      {{ $.Scratch.Add "headings" $heading }}
      {{ range $subHeadings }}
        {{ $lvl := strings.Count "#" . }}
        {{ $txt := strings.TrimLeft "# " . }}
        {{ $.Scratch.Add "headings" (dict "level" $lvl "text" $txt) }}
      {{ end }}
      {{ . | $.RenderString (dict "display" "block") }}
    {{ end }}
@y
    {{ with $data.long }}
      {{ $heading := dict "level" 2 "text" (T "Description") "id" "description" }}
      {{ partial "heading.html" $heading }}
      {{ $subHeadings := (strings.FindRE `(?m:#{3,4} .*)` .) }}
      {{ $.Scratch.Add "headings" $heading }}
      {{ range $subHeadings }}
        {{ $lvl := strings.Count "#" . }}
        {{ $txt := strings.TrimLeft "# " . }}
        {{ $.Scratch.Add "headings" (dict "level" $lvl "text" $txt) }}
      {{ end }}
      {{ . | $.RenderString (dict "display" "block") }}
    {{ end }}
@z

@x (T "Options") ／dict 第三引数追加
    {{ with $data.options }}
      {{ $heading := dict "level" 2 "text" "Options" }}
      {{ partial "heading.html" $heading }}
      {{ $.Scratch.Add "headings" $heading }}
      <table>
        <thead>
          <tr>
            <th>Option</th>
            <th>Default</th>
            <th>Description</th>
          </tr>
        </thead>
@y
    {{ with $data.options }}
      {{ $heading := dict "level" 2 "text" (T "Options") "id" "options" }}
      {{ partial "heading.html" $heading }}
      {{ $.Scratch.Add "headings" $heading }}
      <table>
        <thead>
          <tr>
            <th>{{ T "Option" }}</th>
            <th>{{ T "Default" }}</th>
            <th>{{ T "Description" }}</th>
          </tr>
        </thead>
@z

@x
                {{ with .min_api_version }}
                  {{ partial "components/badge.html" (dict "color" "blue" "content" (printf "API %s+" .)) }}
@y
                {{ with .min_api_version }}
                  {{ partial "components/badge.html" (dict "color" "blue" "content" (printf "API %s 以上" .)) }}
@z

@x (T "Examples") ／dict 第三引数追加
    {{ with $data.examples }}
      {{ $heading := dict "level" 2 "text" "Examples" }}
      {{ partial "heading.html" $heading }}
      {{ $subHeadings := (strings.FindRE `(?m:#{3,4} .*)` .) }}
      {{ $.Scratch.Add "headings" $heading }}
      {{ range $subHeadings }}
        {{ $lvl := strings.Count "#" . }}
        {{ $txt := strings.TrimLeft "# " . }}
        {{ $.Scratch.Add "headings" (dict "level" $lvl "text" $txt) }}
      {{ end }}
      {{ $.RenderString (dict "display" "block") . }}
    {{ end }}
    {{ .Content }}
  </article>
{{ end }}
@y
    {{ with $data.examples }}
      {{ $heading := dict "level" 2 "text" (T "Examples") "id" "examples" }}
      {{ partial "heading.html" $heading }}
      {{ $subHeadings := (strings.FindRE `(?m:#{3,4} .*)` .) }}
      {{ $.Scratch.Add "headings" $heading }}
      {{ range $subHeadings }}
        {{ $lvl := strings.Count "#" . }}
        {{ $txt := strings.TrimLeft "# " . }}
        {{ $.Scratch.Add "headings" (dict "level" $lvl "text" $txt) }}
      {{ end }}
      {{ $.RenderString (dict "display" "block") . }}
    {{ end }}
    {{ .Content }}
  </article>
{{ end }}
@z

@x
{{ define "right" }}
  {{ partial "cli-aside.html" . }}
{{ end }}
@y
{{ define "right" }}
  {{ partial "cli-aside.html" . }}
{{ end }}
@z
