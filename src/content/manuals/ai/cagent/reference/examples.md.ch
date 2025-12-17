%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Examples
description: Get inspiration from agent examples
keywords: [ai, agent, cagent]
@y
title: Examples
description: Get inspiration from agent examples
keywords: [ai, agent, cagent]
@z

@x
Get inspiration from the following agent examples.
See more examples in the [cagent GitHub repository](https://github.com/docker/cagent/tree/main/examples).
@y
Get inspiration from the following agent examples.
See more examples in the [cagent GitHub repository](https://github.com/docker/cagent/tree/main/examples).
@z

@x
## Development team
@y
## Development team
@z

@x
{{% cagent-example.inline "dev-team.yaml" %}}
{{- $example := .Get 0 }}
{{- $baseUrl := "https://raw.githubusercontent.com/docker/cagent/refs/heads/main/examples" }}
{{- $url := fmt.Printf "%s/%s" $baseUrl $example }}
{{- with resources.GetRemote $url }}
{{ $data := .Content | transform.Unmarshal }}
@y
{{% cagent-example.inline "dev-team.yaml" %}}
{{- $example := .Get 0 }}
{{- $baseUrl := "https://raw.githubusercontent.com/docker/cagent/refs/heads/main/examples" }}
{{- $url := fmt.Printf "%s/%s" $baseUrl $example }}
{{- with resources.GetRemote $url }}
{{ $data := .Content | transform.Unmarshal }}
@z

@x
```yaml {collapse=true}
{{ .Content }}
```
@y
```yaml {collapse=true}
{{ .Content }}
```
@z

@x
{{ end }}
{{% /cagent-example.inline %}}
@y
{{ end }}
{{% /cagent-example.inline %}}
@z

@x
## Go developer
@y
## Go developer
@z

@x
{{% cagent-example.inline "gopher.yaml" /%}}
@y
{{% cagent-example.inline "gopher.yaml" /%}}
@z

@x
## Technical blog writer
@y
## Technical blog writer
@z

@x
{{% cagent-example.inline "blog.yaml" /%}}
@y
{{% cagent-example.inline "blog.yaml" /%}}
@z
