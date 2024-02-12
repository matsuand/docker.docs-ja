%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% id の扱いを大幅に変更
%    #{{ $id }} による URL 上の id 属性が日本語になることを避けるため、
%    受け渡される dict に第三要素 .id を付け加える。ref. layouts/_default/cli.html

@x
{{ $id := .id | default (anchorize (plainify .text)) }}
<h{{ .level }} class="{{ .class }} scroll-mt-20" id="{{ $id }}">
  <a class="text-black dark:text-white no-underline hover:underline" href="#{{ $id }}">
    {{ .text }}
  </a>
</h{{ .level }}>
@y
{{ $id := .id }}
<h{{ .level }} class="{{ .class }} scroll-mt-20" id="{{ $id }}">
  <a class="text-black dark:text-white no-underline hover:underline" href="#{{ $id }}">
    {{ .text }}
  </a>
</h{{ .level }}>
@z
