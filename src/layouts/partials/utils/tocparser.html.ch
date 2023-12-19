%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $ctx := . }}
{{ $scratch := newScratch }}
{{ $toc := site.Data.toc }}
@y
{{ $ctx := . }}
{{ $scratch := newScratch }}
{{ $toc := site.Data.toc }}
@z

@x
{{ range $root, $section := $toc }}
  {{ if ne ($scratch.Get "match") true }}
    {{ $scratch.Set "depth" 1 }}
    {{ $rootSectionLink := "" }}
    {{ with (index $section 0) }}
      {{ if .path }}
        {{ $rootSectionLink = .path }}
      {{ else }}
        {{ $rootSectionLink = (index .section 0).path }}
      {{ end }}
    {{ end }}
    {{ $scratch.SetInMap "sections" "1" (dict "title" $root "path" $rootSectionLink) }}
    {{ template "tocWalk" (dict "scratch" $scratch "section" $section "ctx" $ctx) }}
  {{ end }}
{{ end }}
@y
{{ range $root, $section := $toc }}
  {{ if ne ($scratch.Get "match") true }}
    {{ $scratch.Set "depth" 1 }}
    {{ $rootSectionLink := "" }}
    {{ with (index $section 0) }}
      {{ if .path }}
        {{ $rootSectionLink = .path }}
      {{ else }}
        {{ $rootSectionLink = (index .section 0).path }}
      {{ end }}
    {{ end }}
    {{ $scratch.SetInMap "sections" "1" (dict "title" $root "path" $rootSectionLink) }}
    {{ template "tocWalk" (dict "scratch" $scratch "section" $section "ctx" $ctx) }}
  {{ end }}
{{ end }}
@z

@x
{{ define "tocWalk" }}
  {{ $ctx := .ctx }}
  {{ $scratch := .scratch }}
  {{ $scratch.Set "depth" (add ($scratch.Get "depth") 1) }}
  {{ range .section }}
    {{ if ne ($scratch.Get "match") true }}
      {{ if .path }}
        {{ $match := eq (urls.Parse .path).Path (urls.Parse $ctx.Permalink).Path }}
        {{ if $match }}
          {{ $scratch.Set "match" true }}
          {{ $scratch.Set "maxdepth" ($scratch.Get "depth") }}
          {{ $scratch.Set "lastsection" (dict "title" .title "path" .path) }}
        {{ end }}
      {{ else }}
        {{ $sectionLink := (index .section 0).path }}
        {{ $scratch.SetInMap "sections" (string ($scratch.Get "depth")) (dict "title" .sectiontitle "path" $sectionLink) }}
        {{ template "tocWalk" (dict "scratch" $scratch "section" .section "ctx" $ctx) }}
      {{ end }}
    {{ end }}
  {{ end }}
  {{ $scratch.Set "depth" (sub ($scratch.Get "depth") 1) }}
{{ end }}
@y
{{ define "tocWalk" }}
  {{ $ctx := .ctx }}
  {{ $scratch := .scratch }}
  {{ $scratch.Set "depth" (add ($scratch.Get "depth") 1) }}
  {{ range .section }}
    {{ if ne ($scratch.Get "match") true }}
      {{ if .path }}
        {{ $match := eq (urls.Parse .path).Path (urls.Parse $ctx.Permalink).Path }}
        {{ if $match }}
          {{ $scratch.Set "match" true }}
          {{ $scratch.Set "maxdepth" ($scratch.Get "depth") }}
          {{ $scratch.Set "lastsection" (dict "title" .title "path" .path) }}
        {{ end }}
      {{ else }}
        {{ $sectionLink := (index .section 0).path }}
        {{ $scratch.SetInMap "sections" (string ($scratch.Get "depth")) (dict "title" .sectiontitle "path" $sectionLink) }}
        {{ template "tocWalk" (dict "scratch" $scratch "section" .section "ctx" $ctx) }}
      {{ end }}
    {{ end }}
  {{ end }}
  {{ $scratch.Set "depth" (sub ($scratch.Get "depth") 1) }}
{{ end }}
@z

@x
{{ range $depth, $e := ($scratch.Get "sections") }}
  {{ if ge $depth ($scratch.Get "maxdepth") }}
    {{ $scratch.DeleteInMap "sections" $depth }}
  {{ end }}
{{ end }}
@y
{{ range $depth, $e := ($scratch.Get "sections") }}
  {{ if ge $depth ($scratch.Get "maxdepth") }}
    {{ $scratch.DeleteInMap "sections" $depth }}
  {{ end }}
{{ end }}
@z

@x
{{ return $scratch }}
@y
{{ return $scratch }}
@z
