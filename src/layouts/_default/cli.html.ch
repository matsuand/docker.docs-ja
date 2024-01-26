%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% {{ T "Option" }}, (T "Options")
% {{ T "Short" }}
% {{ T "Default" }}
% {{ T "Description" }}, (T "Description")
% (T "Examples")
% (T "Usage")

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
  {{ $data := "" }}
  {{ if .Params.datafolder }}
    {{ $data = index (index site.Data .Params.datafolder) .Params.datafile }}
  {{ else }}
    {{ $data = index site.Data .Params.datafile }}
  {{ end }}
  {{ .Scratch.Set "headings" slice }}
  {{ .Scratch.Set "subheadings" slice }}
  {{ partial "breadcrumbs.html" . }}
@y
{{ define "main" }}
  {{ $data := "" }}
  {{ if .Params.datafolder }}
    {{ $data = index (index site.Data .Params.datafolder) .Params.datafile }}
  {{ else }}
    {{ $data = index site.Data .Params.datafile }}
  {{ end }}
  {{ .Scratch.Set "headings" slice }}
  {{ .Scratch.Set "subheadings" slice }}
  {{ partial "breadcrumbs.html" . }}
@z

@x
  <article class="DocSearch-content prose max-w-none dark:prose-invert">
    {{ if ne .LinkTitle .Title }}
    {{/*
      we use linkTitle for surfacing popular aliases like "docker run"
      if linkTitle is set, use both alias and canonical cmd as title
    */}}
    <h1 class="scroll-mt-36">{{ .LinkTitle }}<span
      class="text-gray-light dark:text-gray-dark"> ({{ .Title }})</span>
    </h1>
    {{ else }}
    <h1 class="scroll-mt-36">{{ .Title }}</h1>
    {{ end }}
@y
  <article class="DocSearch-content prose max-w-none dark:prose-invert">
    {{ if ne .LinkTitle .Title }}
    {{/*
      we use linkTitle for surfacing popular aliases like "docker run"
      if linkTitle is set, use both alias and canonical cmd as title
    */}}
    <h1 class="scroll-mt-36">{{ .LinkTitle }}<span
      class="text-gray-light dark:text-gray-dark"> ({{ .Title }})</span>
    </h1>
    {{ else }}
    <h1 class="scroll-mt-36">{{ .Title }}</h1>
    {{ end }}
@z

@x
    {{ $data.short | .RenderString (dict "display" "block") }}
    {{ if $data.deprecated }}
      <blockquote class="warning">
        <p><strong>This command is deprecated</strong></p>
        <p>
          It may be removed in a future Docker version. For more information,
          see the
          <a href="https://github.com/docker/roadmap/issues/209"
            >Docker roadmap</a
          >
        </p>
      </blockquote>
    {{ end }}
@y
    {{ $data.short | .RenderString (dict "display" "block") }}
    {{ if $data.deprecated }}
      <blockquote class="warning">
        <p><strong>This command is deprecated</strong></p>
        <p>
          It may be removed in a future Docker version. For more information,
          see the
          <a href="https://github.com/docker/roadmap/issues/209"
            >Docker roadmap</a
          >
        </p>
      </blockquote>
    {{ end }}
@z

@x
    {{ if or $data.experimental $data.experimentalcli }}
      <blockquote class="important">
        <p><strong>This command is experimental</strong></p>
        <p>
          Experimental features are intended for testing and feedback as their
          functionality or design may change between releases without warning or
          can be removed entirely in a future release.
        </p>
      </blockquote>
    {{ end }}
@y
    {{ if or $data.experimental $data.experimentalcli }}
      <blockquote class="important">
        <p><strong>This command is experimental</strong></p>
        <p>
          Experimental features are intended for testing and feedback as their
          functionality or design may change between releases without warning or
          can be removed entirely in a future release.
        </p>
      </blockquote>
    {{ end }}
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
        This command works with the Swarm orchestrator.
      </p>
    {{ end }}
@z

@x (T "Usage")
    {{ with $data.usage }}
      {{ $heading := dict "level" 2 "text" "Usage" }}
      {{ partial "heading.html" $heading }}
      {{ $.Scratch.Add "headings" $heading }}
      {{ highlight (strings.Replace . "\t" "") "console" }}
    {{ end }}
@y
    {{ with $data.usage }}
      {{ $heading := dict "level" 2 "text" (T "Usage") }}
      {{ partial "heading.html" $heading }}
      {{ $.Scratch.Add "headings" $heading }}
      {{ highlight (strings.Replace . "\t" "") "console" }}
    {{ end }}
@z

@x
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
@z

@x (T "Description")
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
      {{ $heading := dict "level" 2 "text" (T "Description") }}
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

@x (T "Options")
    {{ with $data.options }}
      {{ $heading := dict "level" 2 "text" "Options" }}
      {{ partial "heading.html" $heading }}
      {{ $.Scratch.Add "headings" $heading }}
      <table>
        <thead>
          <tr>
            <th>Option</th>
            <th>Short</th>
            <th>Default</th>
            <th>Description</th>
          </tr>
        </thead>
@y
    {{ with $data.options }}
      {{ $heading := dict "level" 2 "text" (T "Options") }}
      {{ partial "heading.html" $heading }}
      {{ $.Scratch.Add "headings" $heading }}
      <table>
        <thead>
          <tr>
            <th>{{ T "Option" }}</th>
            <th>{{ T "Short" }}</th>
            <th>{{ T "Default" }}</th>
            <th>{{ T "Description" }}</th>
          </tr>
        </thead>
@z

@x
        <tbody>
          {{ range where . "hidden" false }}
            <tr>
              <td>{{ with .option }}<code>--{{ . }}</code>{{ end }}</td>
              <td>{{ with .shorthand }}<code>-{{ . }}</code>{{ end }}</td>
              {{ $skipDefault := `[],map[],false,0,0s,default,'',""` }}
              <td>
                {{ with .default_value }}
                  {{ cond (in $skipDefault .) "" (printf "<code>%s</code>" . | safeHTML) }}
                {{ end }}
              </td>
@y
        <tbody>
          {{ range where . "hidden" false }}
            <tr>
              <td>{{ with .option }}<code>--{{ . }}</code>{{ end }}</td>
              <td>{{ with .shorthand }}<code>-{{ . }}</code>{{ end }}</td>
              {{ $skipDefault := `[],map[],false,0,0s,default,'',""` }}
              <td>
                {{ with .default_value }}
                  {{ cond (in $skipDefault .) "" (printf "<code>%s</code>" . | safeHTML) }}
                {{ end }}
              </td>
@z

@x
              <td>
                {{ with .min_api_version }}
                  {{ partial "components/badge.html" (dict "color" "blue" "content" (printf "API %s+" .)) }}
                {{ end }}
                {{ with .deprecated }}
                  {{ partial "components/badge.html" (dict "color" "red" "content" "Deprecated") }}
                {{ end }}
                {{ with .experimental }}
                  {{ partial "components/badge.html" (dict "color" "amber" "content" "experimental (daemon)") }}
                {{ end }}
                {{ with .experimentalcli }}
                  {{ partial "components/badge.html" (dict "color" "amber" "content" "experimental (CLI)") }}
                {{ end }}
@y
              <td>
                {{ with .min_api_version }}
                  {{ partial "components/badge.html" (dict "color" "blue" "content" (printf "API %s+" .)) }}
                {{ end }}
                {{ with .deprecated }}
                  {{ partial "components/badge.html" (dict "color" "red" "content" "Deprecated") }}
                {{ end }}
                {{ with .experimental }}
                  {{ partial "components/badge.html" (dict "color" "amber" "content" "experimental (daemon)") }}
                {{ end }}
                {{ with .experimentalcli }}
                  {{ partial "components/badge.html" (dict "color" "amber" "content" "experimental (CLI)") }}
                {{ end }}
@z

@x
                {{ with .kubernetes }}
                  {{ partial "components/badge.html" (dict "color" "blue" "content" "Kubernetes") }}
                {{ end }}
                {{ with .swarm }}
                  {{ partial "components/badge.html" (dict "color" "blue" "content" "Swarm") }}
                {{ end }}
                {{ if .description }}
                  {{/* replace newlines in long desc with break tags */}}
                  {{ markdownify (strings.Replace .description "\n" "<br>") }}
                {{ end }}
              </td>
            </tr>
          {{ end }}
        </tbody>
      </table>
    {{ end }}
@y
                {{ with .kubernetes }}
                  {{ partial "components/badge.html" (dict "color" "blue" "content" "Kubernetes") }}
                {{ end }}
                {{ with .swarm }}
                  {{ partial "components/badge.html" (dict "color" "blue" "content" "Swarm") }}
                {{ end }}
                {{ if .description }}
                  {{/* replace newlines in long desc with break tags */}}
                  {{ markdownify (strings.Replace .description "\n" "<br>") }}
                {{ end }}
              </td>
            </tr>
          {{ end }}
        </tbody>
      </table>
    {{ end }}
@z

@x (T "Examples")
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
      {{ $heading := dict "level" 2 "text" (T "Examples") }}
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
