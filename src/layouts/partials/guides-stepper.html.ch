%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ if or .NextInSection .PrevInSection }}
  <a
    class="no-underline my-8 flex justify-center text-xs text-white"
    href="{{ .CurrentSection.Permalink }}">
    <span class="rounded-l bg-blue-light-400 px-2 dark:bg-blue-dark-500">SERIES</span>
    <span class="rounded-r bg-blue-light-500 px-2 dark:bg-blue-dark-400">{{ .CurrentSection.Title }}</span>
  </a>
  <div x-data class="mb-8 flex w-full items-center justify-center gap-1 px-8 text-center text-sm md:px-20">
    {{ page.Store.Set "stepper_seen" false }}
    {{ range $i, $e := .CurrentSection.Pages }}
      {{ if $i }}
        {{ if (page.Store.Get "stepper_seen") }}
          <div class="flex-grow border-b-2 border-b-gray-light-400 dark:border-b-gray-dark-400"></div>
        {{ else }}
          <div class="flex-grow border-b-2 border-b-green-light-400 dark:border-b-green-dark-400"></div>
        {{ end }}
      {{ end }}
      <a href="{{ .Permalink }}" class="no-underline text-white flex items-center justify-center w-8 h-8 rounded-full
        {{ if (page.Store.Get "stepper_seen") }}
          bg-gray-light-400 dark:bg-gray-dark-400
        {{ else if (eq . page) }}
          {{ .Store.Set "stepper_seen" true }}
          bg-blue-light-400 dark:bg-blue-dark-400
        {{ else }}
          bg-green-light-400 dark:bg-green-dark-400
        {{ end }}">
        {{ add $i 1 }}</a>
    {{ end }}
  </div>
{{ end }}
@y
{{ if or .NextInSection .PrevInSection }}
  <a
    class="no-underline my-8 flex justify-center text-xs text-white"
    href="{{ .CurrentSection.Permalink }}">
    <span class="rounded-l bg-blue-light-400 px-2 dark:bg-blue-dark-500">SERIES</span>
    <span class="rounded-r bg-blue-light-500 px-2 dark:bg-blue-dark-400">{{ .CurrentSection.Title }}</span>
  </a>
  <div x-data class="mb-8 flex w-full items-center justify-center gap-1 px-8 text-center text-sm md:px-20">
    {{ page.Store.Set "stepper_seen" false }}
    {{ range $i, $e := .CurrentSection.Pages }}
      {{ if $i }}
        {{ if (page.Store.Get "stepper_seen") }}
          <div class="flex-grow border-b-2 border-b-gray-light-400 dark:border-b-gray-dark-400"></div>
        {{ else }}
          <div class="flex-grow border-b-2 border-b-green-light-400 dark:border-b-green-dark-400"></div>
        {{ end }}
      {{ end }}
      <a href="{{ .Permalink }}" class="no-underline text-white flex items-center justify-center w-8 h-8 rounded-full
        {{ if (page.Store.Get "stepper_seen") }}
          bg-gray-light-400 dark:bg-gray-dark-400
        {{ else if (eq . page) }}
          {{ .Store.Set "stepper_seen" true }}
          bg-blue-light-400 dark:bg-blue-dark-400
        {{ else }}
          bg-green-light-400 dark:bg-green-dark-400
        {{ end }}">
        {{ add $i 1 }}</a>
    {{ end }}
  </div>
{{ end }}
@z
