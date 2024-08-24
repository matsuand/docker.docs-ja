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
   You will see an output that shows container images being pulled down, containers starting, and more. Don't worry if you don't understand it all at this point. But, within a moment or two, things should stabilize and finish.
@z

@x
3. Open your browser to [http://localhost](http://localhost) to see the application up and running. It may take a few minutes for the app to run. The app is a simple to-do application, so feel free to add an item or two, mark some as done, or even delete an item.
@y
3. Open your browser to [http://localhost](http://localhost) to see the application up and running. It may take a few minutes for the app to run. The app is a simple to-do application, so feel free to add an item or two, mark some as done, or even delete an item.
@z

@x
    ![Screenshot of the getting started to-do app after its first launch](images/develop-getting-started-app-first-launch.webp)
@y
    ![Screenshot of the getting started to-do app after its first launch](images/develop-getting-started-app-first-launch.webp)
@z

@x
### What's in the environment?
@y
### What's in the environment?
@z

@x
Now that the environment is up and running, what's actually in it? At a high-level, there are several containers (or processes) that each serve a specific need for the application:
@y
Now that the environment is up and running, what's actually in it? At a high-level, there are several containers (or processes) that each serve a specific need for the application:
@z

@x
- React frontend - a Node container that's running the React dev server, using [Vite](https://vitejs.dev/).
- Node backend - the backend provides an API that provides the ability to retrieve, create, and delete to-do items.
- MySQL database - a database to store the list of the items.
- phpMyAdmin - a web-based interface to interact with the database that is accessible at [http://db.localhost](http://db.localhost).
- Traefik proxy - [Traefik](https://traefik.io/traefik/) is an application proxy that routes requests to the right service. It sends all requests for `localhost/api/*` to the backend, requests for `localhost/*` to the frontend, and then requests for `db.localhost` to phpMyAdmin. This provides the ability to access all applications using port 80 (instead of different ports for each service).
@y
- React frontend - a Node container that's running the React dev server, using [Vite](https://vitejs.dev/).
- Node backend - the backend provides an API that provides the ability to retrieve, create, and delete to-do items.
- MySQL database - a database to store the list of the items.
- phpMyAdmin - a web-based interface to interact with the database that is accessible at [http://db.localhost](http://db.localhost).
- Traefik proxy - [Traefik](https://traefik.io/traefik/) is an application proxy that routes requests to the right service. It sends all requests for `localhost/api/*` to the backend, requests for `localhost/*` to the frontend, and then requests for `db.localhost` to phpMyAdmin. This provides the ability to access all applications using port 80 (instead of different ports for each service).
@z

@x
With this environment, you as the developer don’t need to install or configure any services, populate a database schema, configure database credentials, or anything. You only need Docker Desktop. The rest just works.
@y
With this environment, you as the developer don’t need to install or configure any services, populate a database schema, configure database credentials, or anything. You only need Docker Desktop. The rest just works.
@z

@x
## Make changes to the app
@y
## アプリへの変更作業 {#make-changes-to-the-app}
@z

@x
With this environment up and running, you’re ready to make a few changes to the application and see how Docker helps provide a fast feedback loop.
@y
With this environment up and running, you’re ready to make a few changes to the application and see how Docker helps provide a fast feedback loop.
@z

@x
### Change the greeting
@y
### Change the greeting {#change-the-greeting}
@z

@x
The greeting at the top of the page is populated by an API call at `/api/greeting`. Currently, it always returns "Hello world!". You’ll now modify it to return one of three randomized messages (that you'll get to choose).
@y
The greeting at the top of the page is populated by an API call at `/api/greeting`. Currently, it always returns "Hello world!". You’ll now modify it to return one of three randomized messages (that you'll get to choose).
@z

@x
1. Open the `backend/src/routes/getGreeting.js` file. This file provides the handler for the API endpoint.
@y
1. Open the `backend/src/routes/getGreeting.js` file. This file provides the handler for the API endpoint.
@z

@x
2. Modify the variable at the top to an array of greetings. Feel free to use the following modifications or customize it to your own liking.
@y
2. Modify the variable at the top to an array of greetings. Feel free to use the following modifications or customize it to your own liking.
@z

% snip code...

@x
3. Now, update the endpoint to send a random greeting from this list by making the following change:
@y
3. Now, update the endpoint to send a random greeting from this list by making the following change:
@z

% snip code...

@x
4. If you haven't done so yet, save the file. If you refresh your browser, you should see a new greeting. If you keep refreshing, you should see all of the messages appear.
@y
4. If you haven't done so yet, save the file. If you refresh your browser, you should see a new greeting. If you keep refreshing, you should see all of the messages appear.
@z

@x
    ![Screenshot of the to-do app with a new greeting](images/develop-app-with-greetings.webp)
@y
    ![Screenshot of the to-do app with a new greeting](images/develop-app-with-greetings.webp)
@z

@x
### Change the placeholder text
@y
### Change the placeholder text
@z

@x
When you look at the app, you'll see the placeholder text is simply "New Item". You’ll now make that a little more descriptive and fun. You’ll also make a few changes to the styling of the app too.
@y
When you look at the app, you'll see the placeholder text is simply "New Item". You’ll now make that a little more descriptive and fun. You’ll also make a few changes to the styling of the app too.
@z

@x
1. Open the `client/src/components/AddNewItemForm.jsx` file. This provides the component to add a new item to the to-do list.
@y
1. Open the `client/src/components/AddNewItemForm.jsx` file. This provides the component to add a new item to the to-do list.
@z

@x
2. Modify the `placeholder` attribute of the `Form.Control` element to whatever you'd like to display.
@y
2. Modify the `placeholder` attribute of the `Form.Control` element to whatever you'd like to display.
@z

% snip code...

@x
3. Save the file and go back to your browser. You should see the change already hot-reloaded into your browser. If you don't like it, feel free to tweak it until it looks just right.
@y
3. Save the file and go back to your browser. You should see the change already hot-reloaded into your browser. If you don't like it, feel free to tweak it until it looks just right.
@z

@x
![Screenshot of the to-do app with an updated placeholder in the add item text field"](images/develop-app-with-updated-placeholder.webp)
@y
![Screenshot of the to-do app with an updated placeholder in the add item text field"](images/develop-app-with-updated-placeholder.webp)
@z

@x
### Change the background color
@y
### Change the background color
@z

@x
Before you consider the application finalized, you need to make the colors better.
@y
Before you consider the application finalized, you need to make the colors better.
@z

@x
1. Open the `client/src/index.scss` file.
@y
1. Open the `client/src/index.scss` file.
@z

@x
2. Adjust the `background-color` attribute to any color you'd like. The provided snippet is a soft blue to go along with Docker's nautical theme.
@y
2. Adjust the `background-color` attribute to any color you'd like. The provided snippet is a soft blue to go along with Docker's nautical theme.
@z

@x
    If you're using an IDE, you can pick a color using the integrated color pickers. Otherwise, feel free to use an online [Color Picker](https://www.w3schools.com/colors/colors_picker.asp).
@y
    If you're using an IDE, you can pick a color using the integrated color pickers. Otherwise, feel free to use an online [Color Picker](https://www.w3schools.com/colors/colors_picker.asp).
@z

% snip code...

@x
    Each save should let you see the change immediately in the browser. Keep adjusting it until it's the perfect setup for you.
@y
    Each save should let you see the change immediately in the browser. Keep adjusting it until it's the perfect setup for you.
@z

@x
    ![Screenshot of the to-do app with a new placeholder and background color"](images/develop-app-with-updated-client.webp)
@y
    ![Screenshot of the to-do app with a new placeholder and background color"](images/develop-app-with-updated-client.webp)
@z

@x
And with that, you're done. Congrats on updating your website. 
@y
And with that, you're done. Congrats on updating your website. 
@z

@x
## Recap
@y
## Recap
@z

@x
Before you move on, take a moment and reflect on what happened here. Within a few moments, you were able to:
@y
Before you move on, take a moment and reflect on what happened here. Within a few moments, you were able to:
@z

@x
- Start a complete development project with zero installation effort. The containerized environment provided the development environment, ensuring you have everything you need. You didn't have to install Node, MySQL, or any of the other dependencies directly on your machine. All you needed was Docker Desktop and a code editor.
@y
- Start a complete development project with zero installation effort. The containerized environment provided the development environment, ensuring you have everything you need. You didn't have to install Node, MySQL, or any of the other dependencies directly on your machine. All you needed was Docker Desktop and a code editor.
@z

@x
- Make changes and see them immediately. This was made possible because 1) the processes running in each container are watching and responding to file changes and 2) the files are shared with the containerized environment.
@y
- Make changes and see them immediately. This was made possible because 1) the processes running in each container are watching and responding to file changes and 2) the files are shared with the containerized environment.
@z

@x
Docker Desktop enables all of this and so much more. Once you start thinking with containers, you can create almost any environment and easily share it with your team.
@y
Docker Desktop enables all of this and so much more. Once you start thinking with containers, you can create almost any environment and easily share it with your team.
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
Now that the application has been updated, you’re ready to learn about packaging it as a container image and pushing it to a registry, specifically Docker Hub.
@y
Now that the application has been updated, you’re ready to learn about packaging it as a container image and pushing it to a registry, specifically Docker Hub.
@z

@x
{{< button text="Build and push your first image" url="build-and-push-first-image" >}}
@y
{{< button text="Build and push your first image" url="build-and-push-first-image" >}}
@z
