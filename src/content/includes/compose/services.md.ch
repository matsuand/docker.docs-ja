%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
A service is an abstract definition of a computing resource within an application which can be scaled or replaced
independently from other components. Services are backed by a set of containers, run by the platform
according to replication requirements and placement constraints. As services are backed by containers, they are defined
by a Docker image and set of runtime arguments. All containers within a service are identically created with these
arguments.
@y
サービスとはアプリケーション内でのコンピューターリソースを抽象化した定義のことです。
他のコンポーネントとは独立してスケール変更や置き換えが可能です。
サービスは一連のコンテナーにより構成されるものであり、レプリケーション要件や配置制約に基づくプラットフォーム上で稼働します。
サービスがコンテナーにより構成されるというのは、つまり Docker イメージと数々の実行時引数によって定義されるものであるからです。
サービスに属するコンテナーはすべて、そういった引数により一意に生成されます。
@z
