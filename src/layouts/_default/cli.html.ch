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
          <a href="https://github.com/docker/roadmap/issues/209"
            >Docker roadmap</a
          >
@y
          <a href="https://github.com/docker/roadmap/issues/209"
            >Docker ロードマップ</a
          >
@z

@x
      <blockquote class="important">
        <p><strong>This command is experimental</strong></p>
        <p>
          Experimental features are intended for testing and feedback as their
          functionality or design may change between releases without warning or
          can be removed entirely in a future release.
        </p>
      </blockquote>
@y
      <blockquote class="important">
        <p><strong>This command is experimental</strong></p>
        <p>
          Experimental features are intended for testing and feedback as their
          functionality or design may change between releases without warning or
          can be removed entirely in a future release.
        </p>
      </blockquote>
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
        <table>
          <thead>
            <tr>
              <th>Option</th>
              <th>Default</th>
              <th>Description</th>
            </tr>
          </thead>
@y
        <table>
          <thead>
            <tr>
              <th>{{ T "Option" }}</th>
              <th>{{ T "Default" }}</th>
              <th>{{ T "Description" }}</th>
            </tr>
          </thead>
@z

@x "以上"
                  {{ with .min_api_version }}
                    {{ partialCached "components/badge.html" (dict "color" "blue" "content" (printf "API %s+" .)) "api" . }}
@y
                  {{ with .min_api_version }}
                    {{ partialCached "components/badge.html" (dict "color" "blue" "content" (printf "API %s 以上" .)) "api" . }}
@z

@x (T "Examples") ／dict 第三引数追加
    {{ with $data.examples }}
      {{ $heading := dict "level" 2 "text" "Examples" }}
@y
    {{ with $data.examples }}
      {{ $heading := dict "level" 2 "text" (T "Examples") "id" "examples" }}
@z
