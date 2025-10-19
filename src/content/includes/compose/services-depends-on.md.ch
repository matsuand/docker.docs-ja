%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
With the `depends_on` attribute, you can control the order of service startup and shutdown. It is useful if services are closely coupled, and the startup sequence impacts the application's functionality.
@y
`depends_on` 属性を用いれば、サービスの起動終了の順を制御できます。
複数サービスが互いに密接に結びついていて、起動順序がアプリケーション機能に影響を及ぼすような場合に、この属性が必要になってきます。
@z
