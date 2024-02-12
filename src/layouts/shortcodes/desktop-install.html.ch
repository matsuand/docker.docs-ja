%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x 日本語化
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

@x 日本語化
    {{- if or $all $mac }}
    <a target="_blank" rel="noopener" href="https://desktop.docker.com/mac/main/arm64{{ $build_path }}Docker.dmg">Mac
      with Apple chip</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/mac/main/arm64{{ $build_path }}checksums.txt">checksum</a>) |
    <a target="_blank" rel="noopener" href="https://desktop.docker.com/mac/main/amd64{{ $build_path }}Docker.dmg">Mac
      with Intel chip</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/mac/main/amd64{{ $build_path }}checksums.txt">checksum</a>)
    {{ end -}}
@y
    {{- if or $all $mac }}
    <a target="_blank" rel="noopener" href="https://desktop.docker.com/mac/main/arm64{{ $build_path }}Docker.dmg">Apple チップの Mac</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/mac/main/arm64{{ $build_path }}checksums.txt">checksum</a>) |
    <a target="_blank" rel="noopener" href="https://desktop.docker.com/mac/main/amd64{{ $build_path }}Docker.dmg">Intel チップの Mac</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/mac/main/amd64{{ $build_path }}checksums.txt">チェックサム</a>)
    {{ end -}}
@z

@x 日本語化
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}docker-desktop-{{ $version }}-x86_64.pkg.tar.zst">Arch</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}checksums.txt">checksum</a>)
@y
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}docker-desktop-{{ $version }}-x86_64.pkg.tar.zst">Arch</a>
    (<a target="_blank" rel="noopener"
      href="https://desktop.docker.com/linux/main/amd64{{ $build_path }}checksums.txt">チェックサム</a>)
@z
