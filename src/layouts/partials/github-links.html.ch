%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ if hugo.IsProduction }}
{{ with .File }}
{{ if not (in .Filename "/_vendor/") }}
@y
{{ if hugo.IsProduction }}
{{ with .File }}
{{ if not (in .Filename "/_vendor/") }}
@z

@x Add suffix ".ch to github edit page
<p class="flex items-center gap-2">
  <span class="material-symbols-rounded">edit</span>
  <a class="link" target="_blank" rel="noopener"
    href="{{ site.Params.repo }}/edit/main/content/{{ .Path }}">{{ T "editPage" }}
    <span aria-hidden class="material-symbols-rounded select-none align-middle text-base">open_in_new</span>
  </a>
</p>
{{ end }}
{{ end }}
@y
<p class="flex items-center gap-2">
  <span class="material-symbols-rounded">edit</span>
  <a class="link" target="_blank" rel="noopener"
    href="{{ site.Params.repo }}/edit/main/src/content/{{ .Path }}.ch">{{ T "editPage" }}
    <span aria-hidden class="material-symbols-rounded select-none align-middle text-base">open_in_new</span>
  </a>
</p>
{{ end }}
{{ end }}
@z

@x
<p class="flex items-center gap-2">
  <span class="material-symbols-rounded">done</span>
  <a class="link" target="_blank" rel="noopener"
    href="{{ site.Params.repo }}/issues/new?template=doc_issue.yml&location={{ .Permalink }}&labels=status%2Ftriage">{{ T "requestChanges" }}
    <span aria-hidden class="material-symbols-rounded select-none align-middle text-base">open_in_new</span>
  </a>
</p>
{{ end }}
@y
<p class="flex items-center gap-2">
  <span class="material-symbols-rounded">done</span>
  <a class="link" target="_blank" rel="noopener"
    href="{{ site.Params.repo }}/issues/new?template=doc_issue.yml&location={{ .Permalink }}&labels=status%2Ftriage">{{ T "requestChanges" }}
    <span aria-hidden class="material-symbols-rounded select-none align-middle text-base">open_in_new</span>
  </a>
</p>
{{ end }}
@z
