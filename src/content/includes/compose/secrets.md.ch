%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
Docker Compose provides a way for you to use secrets without having to use environment variables to store information. If you’re injecting passwords and API keys as environment variables, you risk unintentional information exposure. Services can only access secrets when explicitly granted by a `secrets` attribute within the `services` top-level element.
@y
Docker Compose では機密情報を保存する先として環境変数を用いることなく、別の方法を提供しています。
パスワードや API キーを環境変数に設定すると、意図しない情報漏洩のリスクにさらされるからです。
サービスが機密情報にアクセスできるのは、トップレベルの `services` 内において `secrets` 属性によって明示的に許可された場合のみです。
@z
