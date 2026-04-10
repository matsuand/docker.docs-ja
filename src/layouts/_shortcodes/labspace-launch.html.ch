%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $image := .Get "image" }}
{{ $modelDownload := .Get "model-download" | default "false" }}
{{ $browserUrl := .Get "browserUrl" | default "http://localhost:3030"}}
@y
{{ $image := .Get "image" }}
{{ $modelDownload := .Get "model-download" | default "false" }}
{{ $browserUrl := .Get "browserUrl" | default "http://localhost:3030"}}
@z

@x
{{ $step1 := printf "1. Start the labspace:\n\n   ```console\n   $ docker compose -p labspace -f oci://%s up -d\n   ```" $image }}
@y
{{ $step1 := printf "1. Start the labspace:\n\n   ```console\n   $ docker compose -p labspace -f oci://%s up -d\n   ```" $image }}
@z

@x
{{ if eq $modelDownload "true" }}
  {{ $step1 = printf "%s\n\n   > [!NOTE]\n   >\n   > The lab may take a few minutes to launch, as this lab requires an AI model that will need to be downloaded." $step1 }}
{{ end }}
@y
{{ if eq $modelDownload "true" }}
  {{ $step1 = printf "%s\n\n   > [!NOTE]\n   >\n   > The lab may take a few minutes to launch, as this lab requires an AI model that will need to be downloaded." $step1 }}
{{ end }}
@z

@x
{{ $step2 := printf "2. Open your browser to [%s](%s)." $browserUrl $browserUrl }}
@y
{{ $step2 := printf "2. Open your browser to [%s](%s)." $browserUrl $browserUrl }}
@z

@x
{{ $step3 := "3. When you're done, tear down the labspace:\n\n   ```console\n   $ docker compose -p labspace down\n   ```" }}
@y
{{ $step3 := "3. When you're done, tear down the labspace:\n\n   ```console\n   $ docker compose -p labspace down\n   ```" }}
@z

@x
{{ printf "%s\n\n%s\n\n%s" $step1 $step2 $step3 | .Page.RenderString (dict "display" "block") }}
@y
{{ printf "%s\n\n%s\n\n%s" $step1 $step2 $step3 | .Page.RenderString (dict "display" "block") }}
@z
