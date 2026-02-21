%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{- $data := "" }}
{{- if .Params.datafolder }}
  {{- $data = index (index site.Data .Params.datafolder) .Params.datafile }}
{{- else }}
  {{- $data = index site.Data .Params.datafile }}
{{- end -}}
# {{ .Title }}
@y
{{- $data := "" }}
{{- if .Params.datafolder }}
  {{- $data = index (index site.Data .Params.datafolder) .Params.datafile }}
{{- else }}
  {{- $data = index site.Data .Params.datafile }}
{{- end -}}
# {{ .Title }}
@z

@x
{{ with $data.short }}**Description:** {{ . }}{{ end }}
@y
{{ with $data.short }}**Description:** {{ . }}{{ end }}
@z

@x
{{ with $data.usage }}**Usage:** `{{ . }}`{{ end }}
@y
{{ with $data.usage }}**Usage:** `{{ . }}`{{ end }}
@z

@x
{{ with $data.aliases }}{{ $aliases := strings.Replace . (printf "%s, " $.Title) "" }}**Aliases:** {{ range $i, $alias := (strings.Split $aliases ", ") }}{{ if $i }}, {{ end }}`{{ $alias }}`{{ end }}{{ end }}
@y
{{ with $data.aliases }}{{ $aliases := strings.Replace . (printf "%s, " $.Title) "" }}**Aliases:** {{ range $i, $alias := (strings.Split $aliases ", ") }}{{ if $i }}, {{ end }}`{{ $alias }}`{{ end }}{{ end }}
@z

@x
{{ .Content }}
@y
{{ .Content }}
@z

@x
{{ if $data.deprecated }}> [!WARNING]
> **Deprecated**
>
> This command is deprecated. It may be removed in a future Docker version.
{{ end }}
@y
{{ if $data.deprecated }}> [!WARNING]
> **Deprecated**
>
> This command is deprecated. It may be removed in a future Docker version.
{{ end }}
@z

@x
{{ if or $data.experimental $data.experimentalcli }}> [!NOTE]
> **Experimental**
>
> This command is experimental. Experimental features are intended for testing and feedback as their functionality or design may change between releases without warning or can be removed entirely in a future release.
{{ end }}
@y
{{ if or $data.experimental $data.experimentalcli }}> [!NOTE]
> **Experimental**
>
> This command is experimental. Experimental features are intended for testing and feedback as their functionality or design may change between releases without warning or can be removed entirely in a future release.
{{ end }}
@z

@x
{{ with $data.kubernetes }}**Orchestrator:** Kubernetes{{ end }}
{{ with $data.swarm }}**Orchestrator:** Swarm{{ end }}
@y
{{ with $data.kubernetes }}**Orchestrator:** Kubernetes{{ end }}
{{ with $data.swarm }}**Orchestrator:** Swarm{{ end }}
@z

@x
{{ with $data.long }}## Description
@y
{{ with $data.long }}## Description
@z

@x
{{ . }}
{{ end }}
@y
{{ . }}
{{ end }}
@z

@x
{{ with $data.options }}{{ $opts := where . "hidden" false }}{{ with $opts }}## Options
@y
{{ with $data.options }}{{ $opts := where . "hidden" false }}{{ with $opts }}## Options
@z

@x
| Option | Default | Description |
|--------|---------|-------------|
{{ range . }}{{ $short := .shorthand }}{{ $long := .option }}| {{ with $short }}`-{{ . }}`, {{ end }}`--{{ $long }}` | {{ with .default_value }}{{ $skipDefault := `[],map[],false,0,0s,default,'',""` }}{{ cond (in $skipDefault .) "" (printf "`%s`" .) }}{{ end }} | {{ with .min_api_version }}API {{ . }}+{{ end }}{{ with .deprecated }} **Deprecated**{{ end }}{{ with .experimental }} **experimental (daemon)**{{ end }}{{ with .experimentalcli }} **experimental (CLI)**{{ end }}{{ with .kubernetes }} **Kubernetes**{{ end }}{{ with .swarm }} **Swarm**{{ end }}{{ if .description }} {{ strings.Replace .description "\n" "<br>" }}{{ end }} |
{{ end }}
{{ end }}{{ end }}
@y
| Option | Default | Description |
|--------|---------|-------------|
{{ range . }}{{ $short := .shorthand }}{{ $long := .option }}| {{ with $short }}`-{{ . }}`, {{ end }}`--{{ $long }}` | {{ with .default_value }}{{ $skipDefault := `[],map[],false,0,0s,default,'',""` }}{{ cond (in $skipDefault .) "" (printf "`%s`" .) }}{{ end }} | {{ with .min_api_version }}API {{ . }}+{{ end }}{{ with .deprecated }} **Deprecated**{{ end }}{{ with .experimental }} **experimental (daemon)**{{ end }}{{ with .experimentalcli }} **experimental (CLI)**{{ end }}{{ with .kubernetes }} **Kubernetes**{{ end }}{{ with .swarm }} **Swarm**{{ end }}{{ if .description }} {{ strings.Replace .description "\n" "<br>" }}{{ end }} |
{{ end }}
{{ end }}{{ end }}
@z

@x
{{ with $data.examples }}## Examples
@y
{{ with $data.examples }}## Examples
@z

@x
{{ . }}
{{ end }}
@y
{{ . }}
{{ end }}
@z

@x
{{ if eq .Kind "section" }}## Subcommands
@y
{{ if eq .Kind "section" }}## Subcommands
@z

@x
| Command | Description |
|---------|-------------|
{{ range .Pages }}{{ if and .Params.datafolder .Params.datafile }}{{ $subdata := index (index site.Data .Params.datafolder) .Params.datafile }}| [`{{ .Title }}`]({{ .Permalink }}) | {{ $subdata.short }} |
{{ end }}{{ end }}
{{ end }}
@y
| Command | Description |
|---------|-------------|
{{ range .Pages }}{{ if and .Params.datafolder .Params.datafile }}{{ $subdata := index (index site.Data .Params.datafolder) .Params.datafile }}| [`{{ .Title }}`]({{ .Permalink }}) | {{ $subdata.short }} |
{{ end }}{{ end }}
{{ end }}
@z
