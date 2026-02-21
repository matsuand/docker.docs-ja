%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{- $specURL := urls.Parse (printf "/%s%s.yaml" .File.Dir .File.ContentBaseName) -}}
# {{ .Title }}
@y
{{- $specURL := urls.Parse (printf "/%s%s.yaml" .File.Dir .File.ContentBaseName) -}}
# {{ .Title }}
@z

@x
{{ .Content }}
@y
{{ .Content }}
@z

@x
**OpenAPI Specification:** [{{ .Title }} API Spec]({{ $specURL.String | absURL }})
@y
**OpenAPI Specification:** [{{ .Title }} API Spec]({{ $specURL.String | absURL }})
@z

@x
This page provides interactive API documentation. For the machine-readable OpenAPI specification, see the link above.
@y
This page provides interactive API documentation. For the machine-readable OpenAPI specification, see the link above.
@z
