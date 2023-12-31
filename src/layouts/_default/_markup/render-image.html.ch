%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $imagePath := .Destination }}
{{ if and (eq .Page.Kind "page") (not (hasPrefix .Destination "/")) }}
  {{ $imagePath = (printf "../%s" .Destination) }}
{{ end }}
@y
{{ $imagePath := .Destination }}
{{ if and (eq .Page.Kind "page") (not (hasPrefix .Destination "/")) }}
  {{ $imagePath = (printf "../%s" .Destination) }}
{{ end }}
@z

@x
{{ $params := (urls.Parse $imagePath).Query }}
{{ $width := index $params "w" }}
{{ $height := index $params "h" }}
{{ $border := index $params "border" }}
@y
{{ $params := (urls.Parse $imagePath).Query }}
{{ $width := index $params "w" }}
{{ $height := index $params "h" }}
{{ $border := index $params "border" }}
@z

@x
<div
  x-data="{ zoom: false }"
  @click="zoom = ! zoom"
  class="cursor-pointer hover:opacity-90"
>
  <img
    src="{{ $imagePath }}"
    alt="{{ .Text }}"
    {{ with $width }}
      width="{{ index . 0 }}"
    {{ end }}
    {{ with $height }}
      height="{{ index . 0 }}"
    {{ end }}
    {{ with .Title }}title="{{ . }}"{{ end }}
    class="rounded mx-auto{{ with $border }} border border-divider-light dark:border-divider-dark{{end}}"
  />
  <template x-teleport="body">
    <div
      x-show="zoom"
      @click="zoom = false"
      x-transition.opacity.duration.250ms
      class="fixed z-20 inset-0 flex items-center justify-center bg-black/70 p-6"
    >
      <button
        class="material-symbols-rounded fixed z-30 top-6 right-8 text-white text-5xl"
      >
        close
      </button>
      <img
        class="rounded max-w-full max-h-full"
        src="{{ $imagePath }}"
        alt="{{ .Text }}"
        {{ with .Title }}title="{{ . }}"{{ end }}
      />
    </div>
  </template>
</div>
@y
<div
  x-data="{ zoom: false }"
  @click="zoom = ! zoom"
  class="cursor-pointer hover:opacity-90"
>
  <img
    src="{{ $imagePath }}"
    alt="{{ .Text }}"
    {{ with $width }}
      width="{{ index . 0 }}"
    {{ end }}
    {{ with $height }}
      height="{{ index . 0 }}"
    {{ end }}
    {{ with .Title }}title="{{ . }}"{{ end }}
    class="rounded mx-auto{{ with $border }} border border-divider-light dark:border-divider-dark{{end}}"
  />
  <template x-teleport="body">
    <div
      x-show="zoom"
      @click="zoom = false"
      x-transition.opacity.duration.250ms
      class="fixed z-20 inset-0 flex items-center justify-center bg-black/70 p-6"
    >
      <button
        class="material-symbols-rounded fixed z-30 top-6 right-8 text-white text-5xl"
      >
        close
      </button>
      <img
        class="rounded max-w-full max-h-full"
        src="{{ $imagePath }}"
        alt="{{ .Text }}"
        {{ with .Title }}title="{{ . }}"{{ end }}
      />
    </div>
  </template>
</div>
@z
