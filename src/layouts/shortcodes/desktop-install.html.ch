%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{- $all := .Get "all" -}}
{{- $win := .Get "win" -}}
{{- $mac := .Get "mac" -}}
{{- $linux := .Get "linux" -}}
{{- $version := .Get "version" -}}
{{- $build_path := .Get "build_path" -}}
@y
{{- $all := .Get "all" -}}
{{- $win := .Get "win" -}}
{{- $mac := .Get "mac" -}}
{{- $linux := .Get "linux" -}}
{{- $version := .Get "version" -}}
{{- $build_path := .Get "build_path" -}}
@z

@x
<blockquote {{ if eq $build_path "/" }} class="tip" {{ end }}>
  <p>Download Docker Desktop</p>
  <p>
    {{- if or $all $win }}
    <a target="_blank" rel="noopener"
      href="https://desktop.docker.com/win/main/amd64{{ $build_path }}Docker%20Desktop%20Installer.exe">Windows</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/win/main/amd64{{ $build_path }}checksums.txt">checksum</a>) | 
    {{ end }}
@y
<blockquote {{ if eq $build_path "/" }} class="tip" {{ end }}>
  <p>Docker Desktop のダウンロード</p>
  <p>
    {{- if or $all $win }}
    <a target="_blank" rel="noopener"
      href="https://desktop.docker.com/win/main/amd64{{ $build_path }}Docker%20Desktop%20Installer.exe">Windows</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/win/main/amd64{{ $build_path }}checksums.txt">チェックサム</a>) | 
    {{ end }}
@z

@x
    {{- if or $all $mac }}
    <a target="_blank" rel="noopener" href="https://desktop.docker.com/mac/main/arm64{{ $build_path }}Docker.dmg">Mac
      with Apple chip</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/mac/main/arm64{{ $build_path }}checksums.txt">checksum</a>)
    <a target="_blank" rel="noopener" href="https://desktop.docker.com/mac/main/amd64{{ $build_path }}Docker.dmg">Mac
      with Intel chip</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/mac/main/amd64{{ $build_path }}checksums.txt">checksum</a>) |
    {{ end -}}
@y
    {{- if or $all $mac }}
    <a target="_blank" rel="noopener" href="https://desktop.docker.com/mac/main/arm64{{ $build_path }}Docker.dmg">Apple チップの Mac</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/mac/main/arm64{{ $build_path }}checksums.txt">checksum</a>)
    <a target="_blank" rel="noopener" href="https://desktop.docker.com/mac/main/amd64{{ $build_path }}Docker.dmg">Intel チップの Mac</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/mac/main/amd64{{ $build_path }}checksums.txt">チェックサム</a>) |
    {{ end -}}
@z

@x
    {{- if or $all $linux }}
    |
    <a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}docker-desktop-{{ $version }}-amd64.deb">Debian</a>
    -
@y
    {{- if or $all $linux }}
    |
    <a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}docker-desktop-{{ $version }}-amd64.deb">Debian</a>
    -
@z

@x
    <a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}docker-desktop-{{ $version }}-x86_64.rpm">RPM</a>
    -
@y
    <a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}docker-desktop-{{ $version }}-x86_64.rpm">RPM</a>
    -
@z

@x
    <a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}docker-desktop-{{ $version }}-x86_64.pkg.tar.zst">Arch</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}checksums.txt">checksum</a>)
    {{- end -}}
  </p>
</blockquote>
@y
    <a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}docker-desktop-{{ $version }}-x86_64.pkg.tar.zst">Arch</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}checksums.txt">チェックサム</a>)
    {{- end -}}
  </p>
</blockquote>
@z
