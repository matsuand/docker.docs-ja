%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker mcp secret set
@y
# docker mcp secret set
@z

@x
<!---MARKER_GEN_START-->
Set a secret in Docker Desktop's secret store
@y
<!---MARKER_GEN_START-->
Set a secret in Docker Desktop's secret store
@z

@x
### Options
@y
### Options
@z

@x
| Name         | Type     | Default | Description                            |
|:-------------|:---------|:--------|:---------------------------------------|
| `--provider` | `string` |         | Supported: credstore, oauth/<provider> |
@y
| Name         | Type     | Default | Description                            |
|:-------------|:---------|:--------|:---------------------------------------|
| `--provider` | `string` |         | Supported: credstore, oauth/<provider> |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Examples
@y
## Examples
@z

@x
### Use secrets for postgres password with default policy
@y
### Use secrets for postgres password with default policy
@z

@x
```console
docker mcp secret set POSTGRES_PASSWORD=my-secret-password
docker run -d -l x-secret:POSTGRES_PASSWORD=/pwd.txt -e POSTGRES_PASSWORD_FILE=/pwd.txt -p 5432 postgres
```
@y
```console
docker mcp secret set POSTGRES_PASSWORD=my-secret-password
docker run -d -l x-secret:POSTGRES_PASSWORD=/pwd.txt -e POSTGRES_PASSWORD_FILE=/pwd.txt -p 5432 postgres
```
@z

@x
### Pass the secret via STDIN
@y
### Pass the secret via STDIN
@z

@x
```console
echo my-secret-password > pwd.txt
cat pwd.txt | docker mcp secret set POSTGRES_PASSWORD
```
@y
```console
echo my-secret-password > pwd.txt
cat pwd.txt | docker mcp secret set POSTGRES_PASSWORD
```
@z
