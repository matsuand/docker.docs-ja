%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $url := .Destination }}
{{- if (strings.HasPrefix $url "http") -}}
  {{/* external link, add icon */}}
  <a
    class="link"
    href="{{ $url | safeURL }}"
    target="_blank"
    rel="noopener"
    >{{ .Text | safeHTML }}<span
      aria-hidden
      class="select-none ml-1 align-top text-[1em] material-symbols-rounded"
      >open_in_new</span
    ></a
  >
@y
{{ $url := .Destination }}
{{- if (strings.HasPrefix $url "http") -}}
  {{/* external link, add icon */}}
  <a
    class="link"
    href="{{ $url | safeURL }}"
    target="_blank"
    rel="noopener"
    >{{ .Text | safeHTML }}<span
      aria-hidden
      class="select-none ml-1 align-top text-[1em] material-symbols-rounded"
      >open_in_new</span
    ></a
  >
@z

@x
{{- else if (strings.HasPrefix $url "/") -}}
  {{/* absolute link, use url as-is */}}
  <a class="link" href="{{ $url }}">{{ .Text | safeHTML }}</a>
@y
{{- else if (strings.HasPrefix $url "/") -}}
  {{/* absolute link, use url as-is */}}
  <a class="link" href="{{ $url }}">{{ .Text | safeHTML }}</a>
@z

@x
{{- else -}}
  {{/* check if the file links to index.md */}}
  {{- if (strings.FindRE `([^_]|^)index.md` $url 1) -}}
    <a
      class="link"
      href="{{ ref .Page (strings.Replace $url "index.md" "_index.md") }}"
      >{{ .Text | safeHTML }}</a
    >
@y
{{- else -}}
  {{/* check if the file links to index.md */}}
  {{- if (strings.FindRE `([^_]|^)index.md` $url 1) -}}
    <a
      class="link"
      href="{{ ref .Page (strings.Replace $url "index.md" "_index.md") }}"
      >{{ .Text | safeHTML }}</a
    >
@z

@x
  {{- else -}}
    {{/* relative link, use ref */}}
    <a class="link" href="{{ ref .Page $url }}"
      >{{ .Text | safeHTML }}</a
    >
  {{- end -}}
{{- end -}}
@y
  {{- else -}}
    {{/* relative link, use ref */}}
    <a class="link" href="{{ ref .Page $url }}"
      >{{ .Text | safeHTML }}</a
    >
  {{- end -}}
{{- end -}}
@z
