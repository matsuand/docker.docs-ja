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

@x
  <!-- favicon -->
  <meta name="msapplication-TileImage" content="{{ site.BaseURL }}/assets/favicons/docs@2x.ico" />
  <meta property="og:image" content="{{ site.BaseURL }}/assets/favicons/docs@2x.ico" />
  <link rel="apple-touch-icon" type="image/x-icon" href="{{ site.BaseURL }}/assets/favicons/docs@2x.ico"
    sizes="129x128" />
  <link rel="icon" type="image/x-icon" href="{{ site.BaseURL }}/assets/favicons/docs@2x.ico" sizes="129x128" />
@y
  <!-- favicon -->
  <meta name="msapplication-TileImage" content="__SUBDIR__/assets/favicons/docs@2x.ico" />
  <meta property="og:image" content="__SUBDIR__/assets/favicons/docs@2x.ico" />
  <link rel="apple-touch-icon" type="image/x-icon" href="__SUBDIR__/assets/favicons/docs@2x.ico"
    sizes="129x128" />
  <link rel="icon" type="image/x-icon" href="__SUBDIR__/assets/favicons/docs@2x.ico" sizes="129x128" />
@z

@x
  <!-- make the latest API version the canonical page as that's what we want users to be using mostly -->
  <link rel="canonical" href="{{ site.BaseURL }}/docker-hub/api/latest/" />
  <style>
    body {
      margin: 0;
      padding: 0;
    }
@y
  <!-- make the latest API version the canonical page as that's what we want users to be using mostly -->
  <link rel="canonical" href="__SUBDIR__/docker-hub/api/latest/" />
  <style>
    body {
      margin: 0;
      padding: 0;
    }
@z

@x
    .menu-content>div:first-child {
      background-color: #086dd7;
      padding: 16px;
    }
  </style>
</head>
@y
    .menu-content>div:first-child {
      background-color: #086dd7;
      padding: 16px;
    }
  </style>
</head>
@z

@x
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

@x
</html>
@y
</html>
@z
