%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ if and .ReadingTime (ne .Params.skip_read_time true) }}
  <p class="flex items-center gap-2">
    <span class="material-symbols-rounded">schedule</span>
    <span>{{ T "readingTime" .ReadingTime }}</span>
  </p>
{{ end }}
@y
{{ if and .ReadingTime (ne .Params.skip_read_time true) }}
  <p class="flex items-center gap-2">
    <span class="material-symbols-rounded">schedule</span>
    <span>{{ T "readingTime" .ReadingTime }}</span>
  </p>
{{ end }}
@z
