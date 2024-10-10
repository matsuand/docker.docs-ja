%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Develop with containers  
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you how to develop with containers
@y
title: コンテナーを使った開発
keywords: concepts, build, images, container, docker desktop
description: This concept page will teach you how to develop with containers
@z

@x
summary: |
  Learn how to run your first container, gaining hands-on experience with
  Docker's powerful features. We'll cover making real-time changes to both
  backend and frontend code within the containerized environment, ensuring
  seamless integration and testing.
@y
summary: |
  はじめてのコンテナー実行を学び、Docker の強力な機能を実践的に体験します。
  コンテナー化された環境内でのバックエンドおよびフロントエンドの双方のコードをリアルタイムに変更します。
  そこでシームレスなインテグレーションとテスト手法を学びます。
@z

% snip youbube...

@x
## Explanation
@y
## 説明 {#explanation}
@z

@x
Now that you have Docker Desktop installed, you are ready to do some application development. Specifically, you will do the following:
@y
ここまでに Docker Desktop をインストールしたので、アプリケーション開発を進めていきます。
特に以下のことを行います。
@z

@x
1. Clone and start a development project
2. Make changes to the backend and frontend
3. See the changes immediately
@y
1. 開発プロジェクトをクローンして進めていきます。
2. バックエンド、フロントエンドにそれぞれ変更を加えます。
3. 変更が即座に反映されることを確認します。
@z

@x
## Try it out
@y
## 試してみよう {#try-it-out}
@z

@x
In this hands-on guide, you'll learn how to develop with containers.
@y
このハンズオンガイドでは、コンテナーを使った開発方法を学んでいきます。
@z

@x
## Start the project
@y
## プロジェクトの開始 {#start-the-project}
@z

@x
1. To get started, either clone or [download the project as a ZIP file](https://github.com/docker/getting-started-todo-app/archive/refs/heads/main.zip) to your local machine.
@y
1. まずはじめに、対象プロジェクトをクローンするか、あるいは [ZIP ファイルのダウンロード](https://github.com/docker/getting-started-todo-app/archive/refs/heads/main.zip) を行ってローカルマシンに保存します。
@z

% snip command...

@x
    And after the project is cloned, navigate into the new directory created by the clone:
@y
    プロジェクトのクローンを行ったら、クローンによって生成されたディレクトリに移動します。
@z

% snip command...

@x
2. Once you have the project, start the development environment using Docker Compose.
@y
2. プロジェクトが用意できたので、Docker Compose を使って開発環境を取り扱っていきます。
@z

@x
    To start the project using the CLI, run the following command:
@y
    CLI を使ってプロジェクトを起動するには、以下のコマンドを実行します。
@z

% snip command...

@x
   You will see an output that shows container images being pulled down, containers starting, and more. Don't worry if you don't understand it all at this point. But, within a moment or two, things should stabilize and finish.
@y
   コンテナーイメージがプルされていることや、コンテナーが起動する状況などが書かれたメッセージが表示されます。
   この時点で出力内容をすべて理解していなくても問題はありません。
   このメッセージは 1、2 分程度で終了します。
@z

@x
3. Open your browser to [http://localhost](http://localhost) to see the application up and running. It may take a few minutes for the app to run. The app is a simple to-do application, so feel free to add an item or two, mark some as done, or even delete an item.
@y
3. ブラウザーを開いて [http://localhost](http://localhost) にアクセスし、アプリケーションが起動していることを確認します。
   アプリの起動には数分程度要するかもしれません。
   アプリは単純な todo アプリです。
   適当に 2、3 のアイテムを追加してみたり、アイテムの削除を行ってみてください。
@z

@x
    ![Screenshot of the getting started to-do app after its first launch](images/develop-getting-started-app-first-launch.webp)
@y
    ![初回起動直後の todo アプリのスクリーンショット](images/develop-getting-started-app-first-launch.webp)
@z

@x
### What's in the environment?
@y
### この環境内にあるものは？ {#whats-in-the-environment}
@z

@x
Now that the environment is up and running, what's actually in it? At a high-level, there are several containers (or processes) that each serve a specific need for the application:
@y
環境が整い稼働したわけですが、その中身はいったいどういうものなのでしょう？
高度なことを言えば、そこにはいくつかのコンテナー (あるいはプロセス) があって、それぞれはアプリケーションが必要としている所定のサービスを提供しています。
@z

@x
- React frontend - a Node container that's running the React dev server, using [Vite](https://vitejs.dev/).
- Node backend - the backend provides an API that provides the ability to retrieve, create, and delete to-do items.
- MySQL database - a database to store the list of the items.
- phpMyAdmin - a web-based interface to interact with the database that is accessible at [http://db.localhost](http://db.localhost).
- Traefik proxy - [Traefik](https://traefik.io/traefik/) is an application proxy that routes requests to the right service. It sends all requests for `localhost/api/*` to the backend, requests for `localhost/*` to the frontend, and then requests for `db.localhost` to phpMyAdmin. This provides the ability to access all applications using port 80 (instead of different ports for each service).
@y
- React フロントエンド - Node コンテナーであり、[Vite](https://vitejs.dev/) を利用して React 開発サーバーが稼働しています。
- Node バックエンド - このバックエンドは todo アイテムの参照、生成、削除を実現する API を提供します。
- MySQL データベース - 複数のアイテムを保持するデータベースです。
- phpMyAdmin - [http://db.localhost](http://db.localhost) へのアクセスを通じてデータベースとのやり取りを行うことができる、ウェブベースのインターフェースです。
- Traefik プロキシー - [Traefik](https://traefik.io/traefik/) はアプリケーションプロキシーであり、リクエストを適切なサービスに振り分けます。
  `localhost/api/*` に対するリクエストはすべてバックエンドに、また `localhost/*` に対するリクエストはすべてフロントエンドにそれぞれ送信します。
  そして `db.localhost` へのリクエストは phpMyAdmin に送信します。
  アプリケーションへのアクセス機能はすべてポート 80 番を使って提供します (各サービスに対しては別のポートを利用します)。
@z

@x
With this environment, you as the developer don’t need to install or configure any services, populate a database schema, configure database credentials, or anything. You only need Docker Desktop. The rest just works.
@y
この環境で開発者は、サービスのインストールや設定、データベーススキーマの定義、データベースへの資格情報の設定などは行う必要がありません。
必要なのは Docker Desktop だけです。
これ以外はすべて勝手に動作してくれます。
@z

@x
## Make changes to the app
@y
## アプリへの変更作業 {#make-changes-to-the-app}
@z

@x
With this environment up and running, you’re ready to make a few changes to the application and see how Docker helps provide a fast feedback loop.
@y
この環境を稼働させたら、次はアプリケーションにちょっとした変更を加えてみます。
そこから Docker がいかにして、そのフィードバックを素早く示してくれるのかを見ていきます。
@z

@x
### Change the greeting
@y
### あいさつ文の変更 {#change-the-greeting}
@z

@x
The greeting at the top of the page is populated by an API call at `/api/greeting`. Currently, it always returns "Hello world!". You’ll now modify it to return one of three randomized messages (that you'll get to choose).
@y
ページ上部に示されるあいさつ文は、`/api/greeting` という API 呼び出しにより実現しています。
今のところ、その呼び出し結果は常に "Hello world!" を返します。
この部分を、3 つのランダムなメッセージの中から選び出される 1 つを返すように変更しましょう。
@z

@x
1. Open the `backend/src/routes/getGreeting.js` file in a text editor. This file provides the handler for the API endpoint.
@y
1. `backend/src/routes/getGreeting.js` ファイルをテキストエディターで開きます。
   このファイルは API エンドポイントへのハンドラーを提供しています。
@z

@x
2. Modify the variable at the top to an array of greetings. Feel free to use the following modifications or customize it to your own liking. Also, update the endpoint to send a random greeting from this list.
@y
2. 最上段の行にて、変数定義をあいさつ文の配列定義に変更します。
   以下に修正方法を示しますが、内容は好きなように書き換えてください。
   そして配列の中からランダムにあいさつ文が取り出されるように、API エンドポイントを修正します。
@z

% snip code...

@x
3. If you haven't done so yet, save the file. If you refresh your browser, you should see a new greeting. If you keep refreshing, you should see all of the messages appear.
@y
3. ファイルの保存がまだであれば保存します。
   ブラウザー表示を更新すると、新たなあいさつ文が表示されるはずです。
   表示更新を繰り返していけば、あいさつ文のすべてを見ることができるはずです。
@z

@x
    ![Screenshot of the to-do app with a new greeting](images/develop-app-with-greetings.webp)
@y
    ![todo アプリの新たなあいさつ文を示したスクリーンショット](images/develop-app-with-greetings.webp)
@z

@x
### Change the placeholder text
@y
### 入力欄テキストの変更 {#whats-in-the-environment}
@z

@x
When you look at the app, you'll see the placeholder text is simply "New Item". You’ll now make that a little more descriptive and fun. You’ll also make a few changes to the styling of the app too.
@y
アプリを見てみると、入力欄には単純に "New Item" が表示されています。
このテキストを変更して、もう少し説明を加えた意味のあるものにしましょう。
ついでにアプリのスタイルについても簡単な変更を加えてみます。
@z

@x
1. Open the `client/src/components/AddNewItemForm.jsx` file. This provides the component to add a new item to the to-do list.
@y
1. `client/src/components/AddNewItemForm.jsx` ファイルを開きます。
   このファイルは todo リストに新規アイテムを追加するコンポーネントを提供しています。
@z

@x
2. Modify the `placeholder` attribute of the `Form.Control` element to whatever you'd like to display.
@y
2. `Form.Control` 要素の `placeholder` 属性を修正して、表示させたい内容に変更します。
@z

% snip code...

@x
3. Save the file and go back to your browser. You should see the change already hot-reloaded into your browser. If you don't like it, feel free to tweak it until it looks just right.
@y
3. ファイルを保存してブラウザーに戻ります。
   ブラウザー上ではアプリ再起動をしなくてもホットリロード機能により変更結果が確認できます。
   変更内容が気に入らなければ、好きなように変更してください。
@z

@x
![Screenshot of the to-do app with an updated placeholder in the add item text field"](images/develop-app-with-updated-placeholder.webp)
@y
![アイテム追加テキスト欄におけるテキストを更新した todo アプリのスクリーンショット](images/develop-app-with-updated-placeholder.webp)
@z

@x
### Change the background color
@y
### 背景色の変更 {#change-the-background-color}
@z

@x
Before you consider the application finalized, you need to make the colors better.
@y
アプリケーションへの変更の最後に、色の変更を行っておきます。
@z

@x
1. Open the `client/src/index.scss` file.
@y
1. `client/src/index.scss` ファイルを開きます。
@z

@x
2. Adjust the `background-color` attribute to any color you'd like. The provided snippet is a soft blue to go along with Docker's nautical theme.
@y
2. `background-color` 属性を調整して望みの背景色を設定します。
   このスニペットでは Docker の海のテーマに合わせた薄青色としています。
@z

@x
    If you're using an IDE, you can pick a color using the integrated color pickers. Otherwise, feel free to use an online [Color Picker](https://www.w3schools.com/colors/colors_picker.asp).
@y
    IDE を利用している場合は、カラーピッカー機能を使って色設定を行うことができます。
    そうでない場合は、必要に応じて [カラーピッカー](https://www.w3schools.com/colors/colors_picker.asp) をご利用ください。
@z

% snip code...

@x
    Each save should let you see the change immediately in the browser. Keep adjusting it until it's the perfect setup for you.
@y
    ファイル保存によりブラウザー上では即座に変更を確認することができます。
    好みの色が得られていなければ調整を続けてください。
@z

@x
    ![Screenshot of the to-do app with a new placeholder and background color"](images/develop-app-with-updated-client.webp)
@y
    ![テキスト欄と背景色を変更した todo アプリのスクリーンショット](images/develop-app-with-updated-client.webp)
@z

@x
And with that, you're done. Congrats on updating your website. 
@y
こうして作業が終了しました。
ウェブサイトの更新作業、おつかれさまでした。
@z

@x
## Recap
@y
## まとめ {#recap}
@z

@x
Before you move on, take a moment and reflect on what happened here. Within a few moments, you were able to:
@y
これより先に進む前に、もう一度、ここで行った内容を思い起こしてください。
ほんの数分の中で、以下のことができるようになりました。
@z

@x
- Start a complete development project with zero installation effort. The containerized environment provided the development environment, ensuring you have everything you need. You didn't have to install Node, MySQL, or any of the other dependencies directly on your machine. All you needed was Docker Desktop and a code editor.
@y
- インストールの手間ひまをいっさいかけずに、完全な開発プロジェクトを構築しました。
  コンテナー化された環境は開発環境を提供するものです。
  その中では必要となることをすべて行うことができます。
  マシン内には Node、MySQL をはじめすべての依存パッケージを自分でインストールする必要はありません。
  必要となるのは Docker Desktop とコードエディターだけです。
@z

@x
- Make changes and see them immediately. This was made possible because 1) the processes running in each container are watching and responding to file changes and 2) the files are shared with the containerized environment.
@y
- アプリへの修正を加え、それを即座に確認しました。
  これが実現できた理由は、1) 各コンテナー内に稼働しているプロセスは、ファイル変更を常に監視しておりそれに応じた対処が可能であるからであり、2) ファイルはコンテナー化環境内において共有されているからです。
@z

@x
Docker Desktop enables all of this and so much more. Once you start thinking with containers, you can create almost any environment and easily share it with your team.
@y
上のことをすべて Docker Desktop が行っているわけですが、実現できることは他にも多々あります。
コンテナーを使うという考えを持った時点で、どのような環境であっても作成できたも同然であり、それを開発チーム内で共有することが可能です。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Now that the application has been updated, you’re ready to learn about packaging it as a container image and pushing it to a registry, specifically Docker Hub.
@y
アプリケーションの修正を行うことができたので、これをコンテナーイメージとしてパッケージングし、特に Docker Hub と呼ばれるレジストリにプッシュする方法について学んでいきます。
@z

@x
{{< button text="Build and push your first image" url="build-and-push-first-image" >}}
@y
{{< button text="初めてのイメージ作りとプッシュ" url="build-and-push-first-image" >}}
@z
