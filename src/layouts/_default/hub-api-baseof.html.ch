%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
<!DOCTYPE html>
<html lang="en">
@y
<!DOCTYPE html>
<html lang="ja">
@z

@x
<head>
  <title>Docker Hub API Reference {{ .File.BaseFileName }}</title>
  <!-- needed for adaptive design -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description"
    content="Reference documentation and Swagger (OpenAPI) specification for the {{ .File.BaseFileName }} API served by Docker Hub." />
  <meta charset="utf-8" />
@y
<head>
  <title>Docker Hub API リファレンス {{ .File.BaseFileName }}</title>
  <!-- needed for adaptive design -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description"
    content="Reference documentation and Swagger (OpenAPI) specification for the {{ .File.BaseFileName }} API served by Docker Hub." />
  <meta charset="utf-8" />
@z

@x __SUBDIR__
  <!-- make the latest API version the canonical page as that's what we want users to be using mostly -->
  <link rel="canonical" href="{{ "/docker-hub/api/latest/" | relURL }}" />
@y
  <!-- make the latest API version the canonical page as that's what we want users to be using mostly -->
  <link rel="canonical" href="{{ "__SUBDIR__/docker-hub/api/latest/" | relURL }}" />
@z

@x URL 変更
<body>
  <redoc spec-url="/docker-hub/api/{{ .File.BaseFileName }}.yaml" class="hub-api"></redoc>
  <script src="https://cdn.redoc.ly/redoc/latest/bundles/redoc.standalone.js"></script>
</body>
@y
<body>
  <redoc spec-url="{{ site.BaseURL }}/docker-hub/api/{{ .File.BaseFileName }}.yaml" class="hub-api"></redoc>
  <script src="https://cdn.redoc.ly/redoc/latest/bundles/redoc.standalone.js"></script>
</body>
@z
