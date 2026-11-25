%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{- $url := .Params.sidebar.goto | default .RelPermalink -}}
@y
{{- $rawUrl := .Params.sidebar.goto | default .RelPermalink -}}
{{- $url := printf "__SUBDIR__/%s" (strings.TrimPrefix "/" $rawUrl) -}}
{{/*
{{- $lenSub := len "__SUBDIR__" -}}
{{- $lenSubSub := (mul $lenSub 2) -}}
{{- $lenUrl := len $url -}}
{{- if ge $lenUrl $lenSubSub -}}
  {{- if strings.HasPrefix $url "__SUBDIR____SUBDIR__" -}}
    {{- $url := strings.Substr $url $lenSub -}}
    {{- warnf "url: %s" $url -}}
  {{- end -}}
{{- end -}}
*/}}
@z
