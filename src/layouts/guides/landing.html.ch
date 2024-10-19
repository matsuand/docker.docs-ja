%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
    <span>Filters</span>
@y
    <span>検索フィルター</span>
@z

@x
  <div>{{ humanize $taxonomy }}</div>
@y
  <div>{{ humanize (T $taxonomy) }}</div>
@z

@x
              <div class="text-xs font-semibold text-gray-light dark:text-gray-dark tracking-wider uppercase">Featured</div>
@y
              <div class="text-xs font-semibold text-gray-light dark:text-gray-dark tracking-wider uppercase">注目の話題</div>
@z

@x
                {{- $img := resources.Get (.Params.image | default "/images/thumbnail.webp") }}
@y
                {{- $img := resources.Get (.Params.image | default "/images/thumbnail.webp") }}
@z
