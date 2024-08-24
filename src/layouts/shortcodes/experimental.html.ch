%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<div class="px-4 border-l-2 border-l-magenta-light dark:border-l-magenta-dark">
  <p class="not-prose flex gap-2 items-center text-magenta-light dark:text-magenta-dark">
    <span class="icon-svg pb-1">
      {{ partialCached "icon.html" "science" "science" }}
    </span>
    <strong>{{ .Get "title" | default "Experimental" }}</strong>
  </p>
  {{ .InnerDeindent | safe.HTML }}
</div>
@y
<div class="px-4 border-l-2 border-l-magenta-light dark:border-l-magenta-dark">
  <p class="not-prose flex gap-2 items-center text-magenta-light dark:text-magenta-dark">
    <span class="icon-svg pb-1">
      {{ partialCached "icon.html" "science" "science" }}
    </span>
    <strong>{{ .Get "title" | default "Experimental" }}</strong>
  </p>
  {{ .InnerDeindent | safe.HTML }}
</div>
@z
