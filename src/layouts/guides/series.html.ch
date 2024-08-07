%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ define "left" }}
{{ partial "sidebar.html" . }}
{{ end }}
@y
{{ define "left" }}
{{ partial "sidebar.html" . }}
{{ end }}
@z

@x
{{ define "main" }}
{{ partial "breadcrumbs.html" . }}
<article class="prose max-w-none dark:prose-invert">
  <h1 data-pagefind-weight="10" class="scroll-mt-36">{{ .Title }}</h1>
  <div class="text-lg">{{ .Summary }}</div>
  <div class="not-prose">
    <div class="flex flex-col sm:flex-row w-full justify-between gap-4 p-6 m-4 bg-gray-light-200 dark:bg-gray-dark-300">
      <div class="flex flex-col">
        <span><strong>Skill level</strong></span>
        <span>{{ .Params.skill }}</span>
      </div>
      <div class="flex flex-col">
        <span><strong>Time to complete</strong></span>
        <span>{{ .Params.time }}</span>
      </div>
      <div class="flex flex-col">
        <span><strong>Prerequisites</strong></span>
        <span>{{ .Params.prereq }}</span>
      </div>
    </div>
  </div>
  {{ .Content }}
  {{ partial "heading.html" (dict "text" "Modules" "level" 2) }}
  {{ range $i, $e := .Pages }}
    {{ $open := compare.Conditional (eq $i 0) true false }}
    <div x-data="{ open: {{ $open }} }" class="border border-gray-light-200 dark:border-gray-dark-200 bg-white dark:bg-gray-dark-100 py-2">
      <button class="not-prose w-full py-2 px-4 flex justify-between" x-on:click="open = ! open">
        <span class="text-xl">{{ fmt.Printf "%d. %s" (add $i 1) .Title }}</span>
        <span :class="{ 'hidden' : !open }" class="icon-svg">{{ partialCached "icon" "expand_less" "expand_less" }}</span>
        <span :class="{ 'hidden' : open }" class="icon-svg">{{ partialCached "icon" "expand_more" "expand_more" }}</span>
      </button>
      <div x-show="open" x-collapse class="px-4">
        <div class="mb-4">
          <div class="mb-4">{{ $e.Summary }}</div>
          <div>
            <a href="{{ $e.Permalink }}"
            class="no-underline cursor-pointer py-2 px-4 rounded bg-blue-light-500 dark:bg-blue-dark-400 hover:bg-blue-light-400 dark:hover:bg-blue-dark-500 text-white"
            >Start</a>
          </div>
        </div>
      </div>
    </div>
  {{ end }}
</article>
{{ end }}
@y
{{ define "main" }}
{{ partial "breadcrumbs.html" . }}
<article class="prose max-w-none dark:prose-invert">
  <h1 data-pagefind-weight="10" class="scroll-mt-36">{{ .Title }}</h1>
  <div class="text-lg">{{ .Summary }}</div>
  <div class="not-prose">
    <div class="flex flex-col sm:flex-row w-full justify-between gap-4 p-6 m-4 bg-gray-light-200 dark:bg-gray-dark-300">
      <div class="flex flex-col">
        <span><strong>Skill level</strong></span>
        <span>{{ .Params.skill }}</span>
      </div>
      <div class="flex flex-col">
        <span><strong>Time to complete</strong></span>
        <span>{{ .Params.time }}</span>
      </div>
      <div class="flex flex-col">
        <span><strong>Prerequisites</strong></span>
        <span>{{ .Params.prereq }}</span>
      </div>
    </div>
  </div>
  {{ .Content }}
  {{ partial "heading.html" (dict "text" "Modules" "level" 2) }}
  {{ range $i, $e := .Pages }}
    {{ $open := compare.Conditional (eq $i 0) true false }}
    <div x-data="{ open: {{ $open }} }" class="border border-gray-light-200 dark:border-gray-dark-200 bg-white dark:bg-gray-dark-100 py-2">
      <button class="not-prose w-full py-2 px-4 flex justify-between" x-on:click="open = ! open">
        <span class="text-xl">{{ fmt.Printf "%d. %s" (add $i 1) .Title }}</span>
        <span :class="{ 'hidden' : !open }" class="icon-svg">{{ partialCached "icon" "expand_less" "expand_less" }}</span>
        <span :class="{ 'hidden' : open }" class="icon-svg">{{ partialCached "icon" "expand_more" "expand_more" }}</span>
      </button>
      <div x-show="open" x-collapse class="px-4">
        <div class="mb-4">
          <div class="mb-4">{{ $e.Summary }}</div>
          <div>
            <a href="{{ $e.Permalink }}"
            class="no-underline cursor-pointer py-2 px-4 rounded bg-blue-light-500 dark:bg-blue-dark-400 hover:bg-blue-light-400 dark:hover:bg-blue-dark-500 text-white"
            >Start</a>
          </div>
        </div>
      </div>
    </div>
  {{ end }}
</article>
{{ end }}
@z
