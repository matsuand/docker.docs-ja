%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<html lang="en">
@y
<html lang="ja">
@z

@x
    {{ $specURL := urls.Parse (printf "/%s%s.yaml" .File.Dir .File.ContentBaseName) }}
@y
    {{ $specURL := urls.Parse (printf "__SUBDIR__/%s%s.yaml" .File.Dir .File.ContentBaseName) }}
@z

@x
        {{ if or (strings.HasPrefix .RelPermalink "/reference/api/hub/") (strings.HasPrefix .RelPermalink "/reference/api/registry/") }}
@y
        {{ if or (strings.HasPrefix .RelPermalink "__SUBDIR__/reference/api/hub/") (strings.HasPrefix .RelPermalink "__SUBDIR__/reference/api/registry/") }}
@z
