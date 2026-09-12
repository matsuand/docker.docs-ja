%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{- $data := index hugo.Data "whats-new" -}}
{{- with $data.items }}
@y
{{- $data := index hugo.Data "whats-new" -}}
{{- with $data.items }}
@z

@x
## What's new
@y
## 更新情報 {#whats-new}
@z

@x
{{ range . }}
{{ printf "- [%s: %s](%s): %s (%s)\n" .product .title .url .description (.published | time.Format "Jan 2, 2006") -}}
{{ end }}
{{- end }}
@y
{{ range . }}
{{ printf "- [%s: %s](%s): %s (%s)\n" .product .title .url .description (.published | time.Format "2026/01/02") -}}
{{ end }}
{{- end }}
@z
