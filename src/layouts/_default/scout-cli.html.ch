%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
              <span>Aliases</span>
@y
              <span>Aliases</span>
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
@y
**This command is experimental.**
@z

@x
Experimental features are intended for testing and feedback as their
functionality or design may change between releases without warning or
can be removed entirely in a future release.
@y
Experimental features are intended for testing and feedback as their
functionality or design may change between releases without warning or
can be removed entirely in a future release.
@z

@x
        This command works with the Kubernetes orchestrator.
@y
        This command works with the Kubernetes orchestrator.
@z

@x
        This command works with the Swarm orchestrator.
@y
        This command works with the Swarm orchestrator.
@z

@x
                <th class="p-2">Option</th>
                <th class="p-2">Default</th>
                <th class="p-2">Description</th>
@y
                <th class="p-2">Option</th>
                <th class="p-2">Default</th>
                <th class="p-2">Description</th>
@z

@x
                      {{ partialCached "components/badge.html" (dict "color" "blue" "content" (printf "API %s+" .)) "api" . }}
                    {{ end }}
                    {{ with .deprecated }}
                      {{ partialCached "components/badge.html" (dict "color" "red" "content" "Deprecated") "deprecated" }}
                    {{ end }}
                    {{ with .experimental }}
                      {{ partialCached "components/badge.html" (dict "color" "amber" "content" "experimental (daemon)") "exp" }}
                    {{ end }}
                    {{ with .experimentalcli }}
                      {{ partialCached "components/badge.html" (dict "color" "amber" "content" "experimental (CLI)") "exp-cli" }}
                    {{ end }}
                    {{ with .kubernetes }}
                      {{ partialCached "components/badge.html" (dict "color" "blue" "content" "Kubernetes") "k8s" }}
                    {{ end }}
                    {{ with .swarm }}
                      {{ partialCached "components/badge.html" (dict "color" "blue" "content" "Swarm") "swarm" }}
                    {{ end }}
@y
                      {{ partialCached "components/badge.html" (dict "color" "blue" "content" (printf "API %s+" .)) "api" . }}
                    {{ end }}
                    {{ with .deprecated }}
                      {{ partialCached "components/badge.html" (dict "color" "red" "content" "Deprecated") "deprecated" }}
                    {{ end }}
                    {{ with .experimental }}
                      {{ partialCached "components/badge.html" (dict "color" "amber" "content" "experimental (daemon)") "exp" }}
                    {{ end }}
                    {{ with .experimentalcli }}
                      {{ partialCached "components/badge.html" (dict "color" "amber" "content" "experimental (CLI)") "exp-cli" }}
                    {{ end }}
                    {{ with .kubernetes }}
                      {{ partialCached "components/badge.html" (dict "color" "blue" "content" "Kubernetes") "k8s" }}
                    {{ end }}
                    {{ with .swarm }}
                      {{ partialCached "components/badge.html" (dict "color" "blue" "content" "Swarm") "swarm" }}
                    {{ end }}
@z

@x
            <th class="text-left">Command</th>
            <th class="text-left">Description</th>
@y
            <th class="text-left">Command</th>
            <th class="text-left">Description</th>
@z
