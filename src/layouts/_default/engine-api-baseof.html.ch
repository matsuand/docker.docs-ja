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
    <title>Docker Engine API {{ .File.BaseFileName }} Reference</title>
    <!-- needed for adaptive design -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description"
        content="Reference documentation and Swagger (OpenAPI) specification for the {{ .File.BaseFileName }} version of the API served by Docker Engine." />
    <meta charset="utf-8" />
@y
<head>
    <title>Docker Engine API {{ .File.BaseFileName }} リファレンス</title>
    <!-- needed for adaptive design -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description"
        content="Reference documentation and Swagger (OpenAPI) specification for the {{ .File.BaseFileName }} version of the API served by Docker Engine." />
    <meta charset="utf-8" />
@z

@x
    <link rel="canonical" href="{{ site.BaseURL }}/reference/api/engine/v{{ site.Params.latest_engine_api_version }}/" />
@y
    <link rel="canonical" href="__SUBDIR__/reference/api/engine/v{{ site.Params.latest_engine_api_version }}/" />
@z

@x
    <redoc spec-url="/reference/api/engine/{{ .File.BaseFileName }}.yaml" hide-hostname="true" suppress-warnings="true"
        lazy-rendering></redoc>
    <script src="https://cdn.redoc.ly/redoc/latest/bundles/redoc.standalone.js"></script>
@y
    <redoc spec-url="__SUBDIR__/reference/api/engine/{{ .File.BaseFileName }}.yaml" hide-hostname="true" suppress-warnings="true"
        lazy-rendering></redoc>
    <script src="https://cdn.redoc.ly/redoc/latest/bundles/redoc.standalone.js"></script>
@z
