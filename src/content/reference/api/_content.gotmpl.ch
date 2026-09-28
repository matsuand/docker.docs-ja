%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{- .AddPage (dict "path" "." "kind" "section" "title" "Docker APIs" "linkTitle" "API reference" "description" "Explore Docker HTTP APIs, connection requirements, and versioned references." "layout" "api-docs" "params" (dict "view" "catalog" "keywords" (slice "API" "HTTP" "OpenAPI"))) -}}
@y
{{- .AddPage (dict "path" "." "kind" "section" "title" "Docker API" "linkTitle" "API リファレンス" "description" "Explore Docker HTTP APIs, connection requirements, and versioned references." "layout" "api-docs" "params" (dict "view" "catalog" "keywords" (slice "API" "HTTP" "OpenAPI"))) -}}
@z

@x
  {{- $path := strings.TrimPrefix "/reference/api/" $api.url | strings.TrimSuffix "/" -}}
@y
  {{- $path := strings.TrimPrefix "__SUBDIR__/reference/api/" $api.url | strings.TrimSuffix "/" -}}
@z

@x
    {{ $aliases = slice "/reference/api/hub/dvp/" }}
@y
    {{ $aliases = slice "__SUBDIR__/reference/api/hub/dvp/" }}
@z

@x
    {{ $aliases = slice "/reference/api/ai-governance/" "/ai/sandboxes/governance/api/" }}
@y
    {{ $aliases = slice "__SUBDIR__/reference/api/ai-governance/" "__SUBDIR__/ai/sandboxes/governance/api/" }}
@z

@x
    {{ $aliases = slice "/reference/api/sandboxes/" }}
@y
    {{ $aliases = slice "__SUBDIR__/reference/api/sandboxes/" }}
@z

@x
  {{- $.AddPage (dict "linkTitle" "Latest" "path" $path "url" $api.url "aliases" $aliases "kind" "section" "title" (printf "%s API %v" $api.title $api.version) "description" (printf "%s HTTP API reference, version %v." $api.title $api.version) "layout" "api-docs" "weight" 1 "params" (dict "view" "overview" "apiID" $api.id "keywords" (slice "API" $api.product))) -}}
@y
  {{- $.AddPage (dict "linkTitle" "Latest" "path" $path "url" $api.url "aliases" $aliases "kind" "section" "title" (printf "%s API %v" $api.title $api.version) "description" (printf "%s HTTP API reference, version %v." $api.title $api.version) "layout" "api-docs" "weight" 1 "params" (dict "view" "overview" "apiID" $api.id "keywords" (slice "API" $api.product))) -}}
@z
