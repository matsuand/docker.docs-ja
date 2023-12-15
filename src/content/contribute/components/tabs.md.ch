%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: components and formatting examples used in Docker's docs
title: Tabs
toc_max: 3
---
@y
---
description: components and formatting examples used in Docker's docs
title: Tabs
toc_max: 3
---
@z

@x
The tabs component consists of two shortcodes:
@y
The tabs component consists of two shortcodes:
@z

@x
- `{{</* tabs */>}}`
- `{{</* tab name="name of the tab" */>}}`
@y
- `{{</* tabs */>}}`
- `{{</* tab name="name of the tab" */>}}`
@z

@x
The `{{</* tabs */>}}` shortcode is a parent, component, wrapping a number of `tabs`.
Each `{{</* tab */>}}` is given a name using the `name` attribute.
@y
The `{{</* tabs */>}}` shortcode is a parent, component, wrapping a number of `tabs`.
Each `{{</* tab */>}}` is given a name using the `name` attribute.
@z

@x
You can optionally specify a `group` attribute for the `tabs` wrapper to indicate
that a tab section should belong to a group of tabs. See [Groups](#groups).
@y
You can optionally specify a `group` attribute for the `tabs` wrapper to indicate
that a tab section should belong to a group of tabs. See [Groups](#groups).
@z

@x
## Example
@y
## Example
@z

@x
{{< tabs >}}
{{< tab name="JavaScript">}}
@y
{{< tabs >}}
{{< tab name="JavaScript">}}
@z

@x
```js
console.log("hello world")
```
@y
```js
console.log("hello world")
```
@z

@x
{{< /tab >}}
{{< tab name="Go">}}
@y
{{< /tab >}}
{{< tab name="Go">}}
@z

@x
```go
fmt.Println("hello world")
```
@y
```go
fmt.Println("hello world")
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Markup
@y
## Markup
@z

@x
````markdown
{{</* tabs */>}}
{{</* tab name="JavaScript" */>}}
@y
````markdown
{{</* tabs */>}}
{{</* tab name="JavaScript" */>}}
@z

@x
```js
console.log("hello world")
```
@y
```js
console.log("hello world")
```
@z

@x
{{</* /tab */>}}
{{</* tab name="Go" */>}}
@y
{{</* /tab */>}}
{{</* tab name="Go" */>}}
@z

@x
```go
fmt.Println("hello world")
```
@y
```go
fmt.Println("hello world")
```
@z

@x
{{</* /tab */>}}
{{</* /tabs */>}}
````
@y
{{</* /tab */>}}
{{</* /tabs */>}}
````
@z

@x
## Groups
@y
## Groups
@z

@x
You can optionally specify a tab group on the `tabs` shortcode.
Doing so will synchronize the tab selection for all of the tabs that belong to the same group.
@y
You can optionally specify a tab group on the `tabs` shortcode.
Doing so will synchronize the tab selection for all of the tabs that belong to the same group.
@z

@x
### Tab group example
@y
### Tab group example
@z

@x
The following example shows two tab sections belonging to the same group.
@y
The following example shows two tab sections belonging to the same group.
@z

@x
{{< tabs group="code" >}}
{{< tab name="JavaScript">}}
@y
{{< tabs group="code" >}}
{{< tab name="JavaScript">}}
@z

@x
```js
console.log("hello world")
```
@y
```js
console.log("hello world")
```
@z

@x
{{< /tab >}}
{{< tab name="Go">}}
@y
{{< /tab >}}
{{< tab name="Go">}}
@z

@x
```go
fmt.Println("hello world")
```
@y
```go
fmt.Println("hello world")
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
{{< tabs group="code" >}}
{{< tab name="JavaScript">}}
@y
{{< tabs group="code" >}}
{{< tab name="JavaScript">}}
@z

@x
```js
const res = await fetch("/users/1")
```
@y
```js
const res = await fetch("/users/1")
```
@z

@x
{{< /tab >}}
{{< tab name="Go">}}
@y
{{< /tab >}}
{{< tab name="Go">}}
@z

@x
```go
resp, err := http.Get("/users/1")
```
@y
```go
resp, err := http.Get("/users/1")
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
