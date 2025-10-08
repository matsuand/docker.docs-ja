%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

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
  data-modal-disclaimer="This is a custom LLM for answering questions about Docker. Answers are based on the contents of the documentation. Rate the answers to let us know what you think!"
@y
  data-modal-disclaimer="This is a custom LLM for answering questions about Docker. Answers are based on the contents of the documentation. Rate the answers to let us know what you think!"
@z

@x
  data-modal-ask-ai-input-placeholder="Ask me a question about Docker…"
@y
  data-modal-ask-ai-input-placeholder="Docker に関する質問をどうぞ…"
@z

@x
  data-project-logo="/assets/images/logo-icon-white.svg"
@y
  data-project-logo="__SUBDIR__/assets/images/logo-icon-white.svg"
@z

@x
  href="/assets/fonts/RobotoFlex.woff2"
@y
  href="__SUBDIR__/assets/fonts/RobotoFlex.woff2"
@z
