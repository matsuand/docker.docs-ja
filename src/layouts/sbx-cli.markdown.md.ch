%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ with $data.synopsis }}**Description:** {{ strings.TrimSpace . }}{{ end }}
@y
{{ with $data.synopsis }}**内容説明** {{ strings.TrimSpace . }}{{ end }}
@z

@x
{{ with $data.usage }}**Usage:** `{{ . }}`{{ end }}
@y
{{ with $data.usage }}**利用方法** `{{ . }}`{{ end }}
@z

@x
{{ if $data.experimental }}> [!NOTE]
> **Experimental**
>
> This command is experimental. Experimental features are intended for testing and feedback as their functionality or design may change between releases without warning or can be removed entirely in a future release.
{{ end }}
@y
{{ if $data.experimental }}> [!NOTE]
> **試験的**
>
> This command is experimental. Experimental features are intended for testing and feedback as their functionality or design may change between releases without warning or can be removed entirely in a future release.
{{ end }}
@z

@x
{{ with $data.description }}## Description
@y
{{ with $data.description }}## 内容説明 {#description}
@z

@x
{{ if eq .Kind "section" }}## Commands
@y
{{ if eq .Kind "section" }}## コマンド {#commands}
@z

@x
| Command | Description |
|---------|-------------|
{{ range .Pages }}{{ if .Params.datafile }}{{ $child := index hugo.Data.sbx_cli .Params.datafile }}| [`{{ .Title }}`]({{ .Permalink }}) | {{ if $child.experimental }}**experimental** {{ end }}{{ strings.TrimSpace $child.synopsis }} |
{{ end }}{{ end }}
{{ end }}
@y
| コマンド | 内容説明 |
|----------|----------|
{{ range .Pages }}{{ if .Params.datafile }}{{ $child := index hugo.Data.sbx_cli .Params.datafile }}| [`{{ .Title }}`]({{ .Permalink }}) | {{ if $child.experimental }}**試験的** {{ end }}{{ strings.TrimSpace $child.synopsis }} |
{{ end }}{{ end }}
{{ end }}
@z

@x
{{ with $data.options }}{{ $opts := where . "name" "ne" "help" }}{{ with $opts }}## Options
@y
{{ with $data.options }}{{ $opts := where . "name" "ne" "help" }}{{ with $opts }}## オプション {#options}
@z

@x
| Option | Default | Description |
|--------|---------|-------------|
{{ range . }}| {{ with .shorthand }}`-{{ . }}`, {{ end }}`--{{ .name }}` | {{ with .default_value }}{{ $skipDefault := `[],false,` }}{{ cond (in $skipDefault .) "" (printf "`%s`" .) }}{{ end }} | {{ if .experimental }}**experimental** {{ end }}{{ with .usage }}{{ strings.Replace (strings.Replace (strings.TrimSpace .) "\n" "<br>") "|" "\\|" }}{{ end }} |
{{ end }}
{{ end }}{{ end }}
@y
| オプション | デフォルト | 内容説明 |
|--------|---------|-------------|
{{ range . }}| {{ with .shorthand }}`-{{ . }}`, {{ end }}`--{{ .name }}` | {{ with .default_value }}{{ $skipDefault := `[],false,` }}{{ cond (in $skipDefault .) "" (printf "`%s`" .) }}{{ end }} | {{ if .experimental }}**試験的** {{ end }}{{ with .usage }}{{ strings.Replace (strings.Replace (strings.TrimSpace .) "\n" "<br>") "|" "\\|" }}{{ end }} |
{{ end }}
{{ end }}{{ end }}
@z

@x
{{ with $data.inherited_options }}{{ $opts := where . "name" "ne" "help" }}{{ with $opts }}## Global options
@y
{{ with $data.inherited_options }}{{ $opts := where . "name" "ne" "help" }}{{ with $opts }}## グローバルオプション {#global-options}
@z

@x
| Option | Default | Description |
|--------|---------|-------------|
{{ range . }}| {{ with .shorthand }}`-{{ . }}`, {{ end }}`--{{ .name }}` | {{ with .default_value }}{{ $skipDefault := `[],false,` }}{{ cond (in $skipDefault .) "" (printf "`%s`" .) }}{{ end }} | {{ if .experimental }}**experimental** {{ end }}{{ with .usage }}{{ strings.Replace (strings.Replace (strings.TrimSpace .) "\n" "<br>") "|" "\\|" }}{{ end }} |
{{ end }}
{{ end }}{{ end }}
@y
| オプション | デフォルト | 内容説明 |
|--------|---------|-------------|
{{ range . }}| {{ with .shorthand }}`-{{ . }}`, {{ end }}`--{{ .name }}` | {{ with .default_value }}{{ $skipDefault := `[],false,` }}{{ cond (in $skipDefault .) "" (printf "`%s`" .) }}{{ end }} | {{ if .experimental }}**試験的** {{ end }}{{ with .usage }}{{ strings.Replace (strings.Replace (strings.TrimSpace .) "\n" "<br>") "|" "\\|" }}{{ end }} |
{{ end }}
{{ end }}{{ end }}
@z

@x
{{ with $data.example }}## Examples
@y
{{ with $data.example }}## 利用例 {#examples}
@z

@x
{{ $dedented := replaceRE `(?m)^ {2,6}` "" . }}{{ printf "```console\n%s\n```" (strings.TrimSpace $dedented) }}
{{ end }}
@y
{{ $dedented := replaceRE `(?m)^ {2,6}` "" . }}{{ printf "```console\n%s\n```" (strings.TrimSpace $dedented) }}
{{ end }}
@z
