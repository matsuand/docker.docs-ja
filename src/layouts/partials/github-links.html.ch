%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% Add suffix .ch and subdir src to github edit page

@x
{{ if hugo.IsProduction }}
{{ with .File }}
{{ if not (in .Filename "/_vendor/") }}
@y
{{ if hugo.IsProduction }}
{{ with .File }}
{{ if not (in .Filename "/_vendor/") }}
@z

@x Add suffix .ch to github edit page
<p class="flex items-center gap-2">
  <span class="icon-svg">{{ partial "icon" "edit" }}</span>
  <a class="link external-link" target="_blank" rel="noopener"
    href="{{ site.Params.repo }}/edit/main/content/{{ .Path }}">{{ T "editPage" }}
    <span class="icon-svg">
      {{- partial "icon" "open_in_new" -}}
    </span></a>
</p>
{{ end }}
{{ end }}
@y
<p class="flex items-center gap-2">
  <span class="icon-svg">{{ partial "icon" "edit" }}</span>
  <a class="link external-link" target="_blank" rel="noopener"
    href="{{ site.Params.repo }}/edit/main/src/content/{{ .Path }}.ch">{{ T "editPage" }}
    <span class="icon-svg">
      {{- partial "icon" "open_in_new" -}}
    </span></a>
</p>
{{ end }}
{{ end }}
@z

@x
<p class="flex items-center gap-2">
  <span class="icon-svg">{{ partial "icon" "done" }}</span>
  <a class="link external-link" target="_blank" rel="noopener"
    href="{{ site.Params.repo }}/issues/new?template=doc_issue.yml&location={{ .Permalink }}&labels=status%2Ftriage">{{ T "requestChanges" }}
    <span class="icon-svg">
      {{- partial "icon" "open_in_new" -}}
    </span></a>
  </a>
</p>
{{ end }}
@y
<p class="flex items-center gap-2">
  <span class="icon-svg">{{ partial "icon" "done" }}</span>
  <a class="link external-link" target="_blank" rel="noopener"
    href="{{ site.Params.repo }}/issues/new?template=doc_issue.yml&location={{ .Permalink }}&labels=status%2Ftriage">{{ T "requestChanges" }}
    <span class="icon-svg">
      {{- partial "icon" "open_in_new" -}}
    </span></a>
  </a>
</p>
{{ end }}
@z
