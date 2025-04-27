%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ .Title }}
@y
{{ .Title }}
@z

@x
{{ .RawContent }}
@y
{{ .RawContent }}
@z

@x
{{ range .Pages }}
- [{{ .Title }}](https://docs.docker.com{{ .RelPermalink }})
{{ end }}
@y
{{ range .Pages }}
- [{{ .Title }}](https://docs.docker.com{{ .RelPermalink }})
{{ end }}
@z
