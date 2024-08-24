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
<article class="prose max-w-none dark:prose-invert">
  <h1 data-pagefind-weight="10" class="scroll-mt-36">{{ .Title }}</h1>
  <div class="text-lg">{{ .Summary }}</div>
  {{ partial "components/guide-summary.html" . }}
  {{ .Content }}
  {{ partial "heading.html" (dict "text" "Modules" "level" 2) }}
  {{ range $i, $e := .Pages }}
    {{ $o := compare.Conditional (eq $i 0) true false }}
    {{ $t := fmt.Printf "%d. %s" (add $i 1) $e.Title }}
    {{ $b := fmt.Printf "%s\n\n{{< button url=`%s` text=`%s` >}}" $e.Summary $e.Permalink "Start" }}
    {{ partial "components/accordion.html" (dict "large" true "open" $o "title" $t "body" $b) }}
  {{ end }}
</article>
{{ end }}
@y
{{ define "main" }}
{{ partial "breadcrumbs.html" . }}
<article class="prose max-w-none dark:prose-invert">
  <h1 data-pagefind-weight="10" class="scroll-mt-36">{{ .Title }}</h1>
  <div class="text-lg">{{ .Summary }}</div>
  {{ partial "components/guide-summary.html" . }}
  {{ .Content }}
  {{ partial "heading.html" (dict "text" "Modules" "level" 2) }}
  {{ range $i, $e := .Pages }}
    {{ $o := compare.Conditional (eq $i 0) true false }}
    {{ $t := fmt.Printf "%d. %s" (add $i 1) $e.Title }}
    {{ $b := fmt.Printf "%s\n\n{{< button url=`%s` text=`%s` >}}" $e.Summary $e.Permalink "Start" }}
    {{ partial "components/accordion.html" (dict "large" true "open" $o "title" $t "body" $b) }}
  {{ end }}
</article>
{{ end }}
@z
