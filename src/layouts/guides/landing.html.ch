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
      <h2>Featured</h2>
@y
      <h2>注目の話題</h2>
@z

@x
                {{- $img := resources.Get (.Params.image | default "/images/thumbnail.webp") }}
@y
                {{- $img := resources.Get (.Params.image | default "/images/thumbnail.webp") }}
@z
