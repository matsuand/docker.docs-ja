%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<link href="/pagefind/pagefind-component-ui.css" rel="stylesheet">
@y
<link href="__SUBDIR__/pagefind/pagefind-component-ui.css" rel="stylesheet">
@z

@x L.4: コメントアウト
{{- if hugo.IsProduction -}}
  <script
    src="https://cdn.cookielaw.org/scripttemplates/otSDKStub.js"
    type="text/javascript"
    charset="UTF-8"
    data-domain-script="{{ site.Params.analytics.onetrust }}"
  ></script>
@y
{{- if hugo.IsProduction -}}
<!--
  <script
    src="https://cdn.cookielaw.org/scripttemplates/otSDKStub.js"
    type="text/javascript"
    charset="UTF-8"
    data-domain-script="{{ site.Params.analytics.onetrust }}"
  ></script>
-->
@z

@x
  href="/assets/fonts/RobotoFlex.woff2"
@y
  href="__SUBDIR__/assets/fonts/RobotoFlex.woff2"
@z
