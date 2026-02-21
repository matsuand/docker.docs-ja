%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% {{ T "Option" }}, (T "Options")
% {{ T "Short" }}
% {{ T "Default" }}
% {{ T "Description" }}, (T "Description")
% (T "Examples")
% (T "Usage")
% (T "Aliases")
% heading.html に受け渡す dict の第三引数追加

@x {{ T "Description" }}
            <th class="text-left w-32">Description</th>
@y
            <th class="text-left w-32">{{ T "Description" }}</th>
@z

@x {{ T "Usage" }}
            <th class="text-left w-32">Usage</th>
@y
            <th class="text-left w-32">{{ T "Usage" }}</th>
@z

@x {{ T "Aliases" }}
              <span>Aliases</span>
              {{ partialCached "tooltip.html" "An alias is a short or memorable alternative for a longer command." "cli-alias" }}
@y
              <span>{{ T "Aliases" }}</span>
              {{ partialCached "tooltip.html" "エイリアスとは長いコマンドに代わって覚えておくべき短めのコマンドのことです。" "cli-alias" }}
@z

@x
> [!WARNING]
> This command is deprecated
>
> It may be removed in a future Docker version. For more information, see the
> [Docker roadmap](https://github.com/docker/roadmap/issues/209)`
@y
> [!WARNING]
> This command is deprecated
>
> It may be removed in a future Docker version. For more information, see the
> [Docker roadmap](https://github.com/docker/roadmap/issues/209)`
@z

@x
**This command is experimental.**

Experimental features are intended for testing and feedback as their
functionality or design may change between releases without warning or
can be removed entirely in a future release.
@y
**このコマンドは試験的なものです。**

試験的機能はテスト向けに意図されたものであり、その機能に関してのフィードバックを得る目的があります。
この機能はリリース時に予告なく変更される場合があり、また今後のリリースに向けて削除されることがあります。
@z

@x
    {{ with $data.kubernetes }}
      <p>
        {{ partialCached "components/badge.html" (dict "color" "blue" "content" "Kubernetes") "k8s" }}
        This command works with the Kubernetes orchestrator.
      </p>
    {{ end }}
@y
    {{ with $data.kubernetes }}
      <p>
        {{ partialCached "components/badge.html" (dict "color" "blue" "content" "Kubernetes") "k8s" }}
        This command works with the Kubernetes orchestrator.
      </p>
    {{ end }}
@z

@x
    {{ with $data.swarm }}
      <p>
        {{ partialCached "components/badge.html" (dict "color" "blue" "content" "Swarm") "swarm" }}
        This command works with the Swarm orchestrator.
      </p>
    {{ end }}
@y
    {{ with $data.swarm }}
      <p>
        {{ partialCached "components/badge.html" (dict "color" "blue" "content" "Swarm") "swarm" }}
        このコマンドは Swarm オーケストレーターにおいて動作します。
      </p>
    {{ end }}
@z

@x (T "Description") ／dict 第三引数追加
    {{ with $data.long }}
      {{ $heading := dict "level" 2 "text" "Description" }}
@y
    {{ with $data.long }}
      {{ $heading := dict "level" 2 "text" (T "Description") "id" "description" }}
@z

@x (T "Options") ／dict 第三引数追加
    {{ with $data.options }}
      {{ $opts := where . "hidden" false }}
      {{ with $opts }}
        {{ $heading := dict "level" 2 "text" "Options" }}
@y
    {{ with $data.options }}
      {{ $opts := where . "hidden" false }}
      {{ with $opts }}
        {{ $heading := dict "level" 2 "text" (T "Options") "id" "options" }}
@z

@x
                <th class="p-2">Option</th>
                <th class="p-2">Default</th>
                <th class="p-2">Description</th>
@y
                <th class="p-2">{{ T "Option" }}</th>
                <th class="p-2">{{ T "Default" }}</th>
                <th class="p-2">{{ T "Description" }}</th>
@z

@x "以上"
                    {{ with .min_api_version }}
                      {{ partialCached "components/badge.html" (dict "color" "blue" "content" (printf "API %s+" .)) "api" . }}
@y
                    {{ with .min_api_version }}
                      {{ partialCached "components/badge.html" (dict "color" "blue" "content" (printf "API %s 以上" .)) "api" . }}
@z

@x "非推奨"
                    {{ with .deprecated }}
                      {{ partialCached "components/badge.html" (dict "color" "red" "content" "Deprecated") "deprecated" }}
@y
                    {{ with .deprecated }}
                      {{ partialCached "components/badge.html" (dict "color" "red" "content" "非推奨") "deprecated" }}
@z

@x "試験的"
                    {{ with .experimental }}
                      {{ partialCached "components/badge.html" (dict "color" "amber" "content" "experimental (daemon)") "exp" }}
@y
                    {{ with .experimental }}
                      {{ partialCached "components/badge.html" (dict "color" "amber" "content" "試験的 (デーモン)") "exp" }}
@z

@x "試験的"
                    {{ with .experimentalcli }}
                      {{ partialCached "components/badge.html" (dict "color" "amber" "content" "experimental (CLI)") "exp-cli" }}
@y
                    {{ with .experimentalcli }}
                      {{ partialCached "components/badge.html" (dict "color" "amber" "content" "試験的 (CLI)") "exp-cli" }}
@z

@x (T "Examples") ／dict 第三引数追加
    {{ with $data.examples }}
      {{ $heading := dict "level" 2 "text" "Examples" }}
@y
    {{ with $data.examples }}
      {{ $heading := dict "level" 2 "text" (T "Examples") "id" "examples" }}
@z

@x (T "Subcommands")
      {{ $heading := dict "level" 2 "text" "Subcommands" }}
@y
      {{ $heading := dict "level" 2 "text" (T "Subcommands") }}
@z
@x
            <th class="text-left">Command</th>
            <th class="text-left">Description</th>
@y
            <th class="text-left">{{ T "Command" }}</th>
            <th class="text-left">{{ T "Description" }}</th>
@z
