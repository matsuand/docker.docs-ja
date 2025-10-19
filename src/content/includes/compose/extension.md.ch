%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
Extensions can be used to make your Compose file more efficient and easier to maintain. 
@y
エクステンションは Compose ファイルをより適切かつ効率的に構築するために利用できます。
@z

@x
Use the prefix `x-` as a top-level element to modularize configurations that you want to reuse. 
Compose ignores any fields that start with `x-`, this is the sole exception where Compose silently ignores unrecognized fields.
@y
トップレベル要素として `x-` をプリフィックスとする要素を記述します。
これによって設定内容がモジュール化され、再利用できるようになります。
Compose は `x-` で始まるフィールドをすべて無視します。
認識不能なフィールドであっても Compose がエラー扱いとせずに無視するという、唯一の例外的処理です。
@z
