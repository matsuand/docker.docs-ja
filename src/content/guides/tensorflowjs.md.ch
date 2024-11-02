%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
description: Learn how to deploy pre-trained models in a TensorFlow.js web applications to perform face detection.
keywords: tensorflow.js, machine learning, ml, mediapipe, blazeface, face detection
title: Face detection with TensorFlow.js
summary: |
  This guide explains how to run TensorFlow.js in Docker containers.
@y
description: Learn how to deploy pre-trained models in a TensorFlow.js web applications to perform face detection.
keywords: tensorflow.js, machine learning, ml, mediapipe, blazeface, face detection
title: TensorFlow.js を使った顔認識
summary: |
  Docker コンテナー内にて TensorFlow.js を実行する方法について説明します。
@z

@x
tags: [ai]
languages: [js]
@y
tags: [ai]
languages: [js]
@z

% params:
@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
This guide introduces the seamless integration of TensorFlow.js with Docker to
perform face detection. In this guide, you'll explore how to:
@y
This guide introduces the seamless integration of TensorFlow.js with Docker to
perform face detection. In this guide, you'll explore how to:
@z

@x
- Run a containerized TensorFlow.js application using Docker.
- Implement face detection in a web application with TensorFlow.js.
- Construct a Dockerfile for a TensorFlow.js web application.
- Use Docker Compose for real-time application development and updates.
- Share your Docker image on Docker Hub to facilitate deployment and extend
  reach.
@y
- Run a containerized TensorFlow.js application using Docker.
- Implement face detection in a web application with TensorFlow.js.
- Construct a Dockerfile for a TensorFlow.js web application.
- Use Docker Compose for real-time application development and updates.
- Share your Docker image on Docker Hub to facilitate deployment and extend
  reach.
@z

@x
> **Acknowledgment**
>
> Docker would like to thank [Harsh Manvar](https://github.com/harsh4870) for
> his contribution to this guide.
@y
> **Acknowledgment**
>
> Docker would like to thank [Harsh Manvar](https://github.com/harsh4870) for
> his contribution to this guide.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have installed the latest version of
  [Docker Desktop](/get-started/get-docker.md).
- You have a [Git client](https://git-scm.com/downloads). The examples in this
  guide use a command-line based Git client, but you can use any client.
@y
- You have installed the latest version of
  [Docker Desktop](get-started/get-docker.md).
- You have a [Git client](https://git-scm.com/downloads). The examples in this
  guide use a command-line based Git client, but you can use any client.
@z

@x
## What is TensorFlow.js?
@y
## What is TensorFlow.js?
@z

@x
[TensorFlow.js](https://www.tensorflow.org/js) is an open-source JavaScript
library for machine learning that enables you to train and deploy ML models in
the browser or on Node.js. It supports creating new models from scratch or using
pre-trained models, facilitating a wide range of ML applications directly in web
environments. TensorFlow.js offers efficient computation, making sophisticated
ML tasks accessible to web developers without deep ML expertise.
@y
[TensorFlow.js](https://www.tensorflow.org/js) is an open-source JavaScript
library for machine learning that enables you to train and deploy ML models in
the browser or on Node.js. It supports creating new models from scratch or using
pre-trained models, facilitating a wide range of ML applications directly in web
environments. TensorFlow.js offers efficient computation, making sophisticated
ML tasks accessible to web developers without deep ML expertise.
@z

@x
## Why Use TensorFlow.js and Docker together?
@y
## Why Use TensorFlow.js and Docker together?
@z

@x
- Environment consistency and simplified deployment: Docker packages
  TensorFlow.js applications and their dependencies into containers, ensuring
  consistent runs across all environments and simplifying deployment.
- Efficient development and easy scaling: Docker enhances development efficiency
  with features like hot reloading and facilitates easy scaling of -
  TensorFlow.js applications using orchestration tools like Kubernetes.
- Isolation and enhanced security: Docker isolates TensorFlow.js applications in
  secure environments, minimizing conflicts and security vulnerabilities while
  running applications with limited permissions.
@y
- Environment consistency and simplified deployment: Docker packages
  TensorFlow.js applications and their dependencies into containers, ensuring
  consistent runs across all environments and simplifying deployment.
- Efficient development and easy scaling: Docker enhances development efficiency
  with features like hot reloading and facilitates easy scaling of -
  TensorFlow.js applications using orchestration tools like Kubernetes.
- Isolation and enhanced security: Docker isolates TensorFlow.js applications in
  secure environments, minimizing conflicts and security vulnerabilities while
  running applications with limited permissions.
@z

@x
## Get and run the sample application
@y
## Get and run the sample application
@z

@x
In a terminal, clone the sample application using the following command.
@y
In a terminal, clone the sample application using the following command.
@z

@x
```console
$ git clone https://github.com/harsh4870/TensorJS-Face-Detection
```
@y
```console
$ git clone https://github.com/harsh4870/TensorJS-Face-Detection
```
@z

@x
After cloning the application, you'll notice the application has a `Dockerfile`.
This Dockerfile lets you build and run the application locally with nothing more
than Docker.
@y
After cloning the application, you'll notice the application has a `Dockerfile`.
This Dockerfile lets you build and run the application locally with nothing more
than Docker.
@z

@x
Before you run the application as a container, you must build it into an image.
Run the following command inside the `TensorJS-Face-Detection` directory to
build an image named `face-detection-tensorjs`.
@y
Before you run the application as a container, you must build it into an image.
Run the following command inside the `TensorJS-Face-Detection` directory to
build an image named `face-detection-tensorjs`.
@z

@x
```console
$ docker build -t face-detection-tensorjs .
```
@y
```console
$ docker build -t face-detection-tensorjs .
```
@z

@x
The command builds the application into an image. Depending on your network
connection, it can take several minutes to download the necessary components the
first time you run the command.
@y
The command builds the application into an image. Depending on your network
connection, it can take several minutes to download the necessary components the
first time you run the command.
@z

@x
To run the image as a container, run the following command in a terminal.
@y
To run the image as a container, run the following command in a terminal.
@z

@x
```console
$ docker run -p 80:80 face-detection-tensorjs
```
@y
```console
$ docker run -p 80:80 face-detection-tensorjs
```
@z

@x
The command runs the container and maps port 80 in the container to port 80 on
your system.
@y
The command runs the container and maps port 80 in the container to port 80 on
your system.
@z

@x
Once the application is running, open a web browser and access the application
at [http://localhost:80](http://localhost:80). You may need to grant access to
your webcam for the application.
@y
Once the application is running, open a web browser and access the application
at [http://localhost:80](http://localhost:80). You may need to grant access to
your webcam for the application.
@z

@x
In the web application, you can change the backend to use one of the following:
@y
In the web application, you can change the backend to use one of the following:
@z

@x
- WASM
- WebGL
- CPU
@y
- WASM
- WebGL
- CPU
@z

@x
To stop the application, press `ctrl`+`c` in the terminal.
@y
To stop the application, press `ctrl`+`c` in the terminal.
@z

@x
## About the application
@y
## About the application
@z

@x
The sample application performs real-time face detection using
[MediaPipe](https://developers.google.com/mediapipe/), a comprehensive framework
for building multimodal machine learning pipelines. It's specifically using the
BlazeFace model, a lightweight model for detecting faces in images.
@y
The sample application performs real-time face detection using
[MediaPipe](https://developers.google.com/mediapipe/), a comprehensive framework
for building multimodal machine learning pipelines. It's specifically using the
BlazeFace model, a lightweight model for detecting faces in images.
@z

@x
In the context of TensorFlow.js or similar web-based machine learning
frameworks, the WASM, WebGL, and CPU backends can be used to
execute operations. Each of these backends utilizes different resources and
technologies available in modern browsers and has its strengths and limitations.
The following sections are a brief breakdown of the different backends.
@y
In the context of TensorFlow.js or similar web-based machine learning
frameworks, the WASM, WebGL, and CPU backends can be used to
execute operations. Each of these backends utilizes different resources and
technologies available in modern browsers and has its strengths and limitations.
The following sections are a brief breakdown of the different backends.
@z

@x
### WASM
@y
### WASM
@z

@x
WebAssembly (WASM) is a low-level, assembly-like language with a compact binary
format that runs at near-native speed in web browsers. It allows code written in
languages like C/C++ to be compiled into a binary that can be executed in the
browser.
@y
WebAssembly (WASM) is a low-level, assembly-like language with a compact binary
format that runs at near-native speed in web browsers. It allows code written in
languages like C/C++ to be compiled into a binary that can be executed in the
browser.
@z

@x
It's a good choice when high performance is required, and either the WebGL
backend is not supported or you want consistent performance across all devices
without relying on the GPU.
@y
It's a good choice when high performance is required, and either the WebGL
backend is not supported or you want consistent performance across all devices
without relying on the GPU.
@z

@x
### WebGL
@y
### WebGL
@z

@x
WebGL is a browser API that allows for GPU-accelerated usage of physics and
image processing and effects as part of the web page canvas.
@y
WebGL is a browser API that allows for GPU-accelerated usage of physics and
image processing and effects as part of the web page canvas.
@z

@x
WebGL is well-suited for operations that are parallelizable and can
significantly benefit from GPU acceleration, such as matrix multiplications and
convolutions commonly found in deep learning models.
@y
WebGL is well-suited for operations that are parallelizable and can
significantly benefit from GPU acceleration, such as matrix multiplications and
convolutions commonly found in deep learning models.
@z

@x
### CPU
@y
### CPU
@z

@x
The CPU backend uses pure JavaScript execution, utilizing the device's central
processing unit (CPU). This backend is the most universally compatible and
serves as a fallback when neither WebGL nor WASM backends are available or
suitable.
@y
The CPU backend uses pure JavaScript execution, utilizing the device's central
processing unit (CPU). This backend is the most universally compatible and
serves as a fallback when neither WebGL nor WASM backends are available or
suitable.
@z

@x
## Explore the application's code
@y
## Explore the application's code
@z

@x
Explore the purpose of each file and their contents in the following sections.
@y
Explore the purpose of each file and their contents in the following sections.
@z

@x
### The index.html file
@y
### The index.html file
@z

@x
The `index.html` file serves as the frontend for the web application that
utilizes TensorFlow.js for real-time face detection from the webcam video feed.
It incorporates several technologies and libraries to facilitate machine
learning directly in the browser. It uses several TensorFlow.js libraries,
including:
@y
The `index.html` file serves as the frontend for the web application that
utilizes TensorFlow.js for real-time face detection from the webcam video feed.
It incorporates several technologies and libraries to facilitate machine
learning directly in the browser. It uses several TensorFlow.js libraries,
including:
@z

@x
- tfjs-core and tfjs-converter for core TensorFlow.js functionality and model
  conversion.
- tfjs-backend-webgl, tfjs-backend-cpu, and the tf-backend-wasm script
  for different computational backend options that TensorFlow.js can use for
  processing. These backends allow the application to perform machine learning
  tasks efficiently by leveraging the user's hardware capabilities.
- The BlazeFace library, a TensorFlow model for face detection.
@y
- tfjs-core and tfjs-converter for core TensorFlow.js functionality and model
  conversion.
- tfjs-backend-webgl, tfjs-backend-cpu, and the tf-backend-wasm script
  for different computational backend options that TensorFlow.js can use for
  processing. These backends allow the application to perform machine learning
  tasks efficiently by leveraging the user's hardware capabilities.
- The BlazeFace library, a TensorFlow model for face detection.
@z

@x
It also uses the following additional libraries:
@y
It also uses the following additional libraries:
@z

@x
- dat.GUI for creating a graphical interface to interact with the application's
  settings in real-time, such as switching between TensorFlow.js backends.
- Stats.min.js for displaying performance metrics (like FPS) to monitor the
  application's efficiency during operation.
@y
- dat.GUI for creating a graphical interface to interact with the application's
  settings in real-time, such as switching between TensorFlow.js backends.
- Stats.min.js for displaying performance metrics (like FPS) to monitor the
  application's efficiency during operation.
@z

@x
{{< accordion title="index.html" >}}
@y
{{< accordion title="index.html" >}}
@z

@x
```html
<style>
  body {
    margin: 25px;
  }
@y
```html
<style>
  body {
    margin: 25px;
  }
@z

@x
  .true {
    color: green;
  }
@y
  .true {
    color: green;
  }
@z

@x
  .false {
    color: red;
  }
@y
  .false {
    color: red;
  }
@z

@x
  #main {
    position: relative;
    margin: 50px 0;
  }
@y
  #main {
    position: relative;
    margin: 50px 0;
  }
@z

@x
  canvas {
    position: absolute;
    top: 0;
    left: 0;
  }
@y
  canvas {
    position: absolute;
    top: 0;
    left: 0;
  }
@z

@x
  #description {
    margin-top: 20px;
    width: 600px;
  }
@y
  #description {
    margin-top: 20px;
    width: 600px;
  }
@z

@x
  #description-title {
    font-weight: bold;
    font-size: 18px;
  }
</style>
@y
  #description-title {
    font-weight: bold;
    font-size: 18px;
  }
</style>
@z

@x
<body>
  <div id="main">
    <video
      id="video"
      playsinline
      style="
      -webkit-transform: scaleX(-1);
      transform: scaleX(-1);
      width: auto;
      height: auto;
      "
    ></video>
    <canvas id="output"></canvas>
    <video
      id="video"
      playsinline
      style="
      -webkit-transform: scaleX(-1);
      transform: scaleX(-1);
      visibility: hidden;
      width: auto;
      height: auto;
      "
    ></video>
  </div>
</body>
<script src="https://unpkg.com/@tensorflow/tfjs-core@2.1.0/dist/tf-core.js"></script>
<script src="https://unpkg.com/@tensorflow/tfjs-converter@2.1.0/dist/tf-converter.js"></script>
@y
<body>
  <div id="main">
    <video
      id="video"
      playsinline
      style="
      -webkit-transform: scaleX(-1);
      transform: scaleX(-1);
      width: auto;
      height: auto;
      "
    ></video>
    <canvas id="output"></canvas>
    <video
      id="video"
      playsinline
      style="
      -webkit-transform: scaleX(-1);
      transform: scaleX(-1);
      visibility: hidden;
      width: auto;
      height: auto;
      "
    ></video>
  </div>
</body>
<script src="https://unpkg.com/@tensorflow/tfjs-core@2.1.0/dist/tf-core.js"></script>
<script src="https://unpkg.com/@tensorflow/tfjs-converter@2.1.0/dist/tf-converter.js"></script>
@z

@x
<script src="https://unpkg.com/@tensorflow/tfjs-backend-webgl@2.1.0/dist/tf-backend-webgl.js"></script>
<script src="https://unpkg.com/@tensorflow/tfjs-backend-cpu@2.1.0/dist/tf-backend-cpu.js"></script>
<script src="./tf-backend-wasm.js"></script>
@y
<script src="https://unpkg.com/@tensorflow/tfjs-backend-webgl@2.1.0/dist/tf-backend-webgl.js"></script>
<script src="https://unpkg.com/@tensorflow/tfjs-backend-cpu@2.1.0/dist/tf-backend-cpu.js"></script>
<script src="./tf-backend-wasm.js"></script>
@z

@x
<script src="https://unpkg.com/@tensorflow-models/blazeface@0.0.5/dist/blazeface.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dat-gui/0.7.6/dat.gui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stats.js/r16/Stats.min.js"></script>
<script src="./index.js"></script>
```
@y
<script src="https://unpkg.com/@tensorflow-models/blazeface@0.0.5/dist/blazeface.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dat-gui/0.7.6/dat.gui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stats.js/r16/Stats.min.js"></script>
<script src="./index.js"></script>
```
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
### The index.js file
@y
### The index.js file
@z

@x
The `index.js` file conducts the facial detection logic. It demonstrates several
advanced concepts in web development and machine learning integration. Here's a
breakdown of some of its key components and functionalities:
@y
The `index.js` file conducts the facial detection logic. It demonstrates several
advanced concepts in web development and machine learning integration. Here's a
breakdown of some of its key components and functionalities:
@z

@x
- Stats.js: The script starts by creating a Stats instance to monitor and
  display the frame rate (FPS) of the application in real time. This is helpful
  for performance analysis, especially when testing the impact of different
  TensorFlow.js backends on the application's speed.
- TensorFlow.js: The application allows users to switch between different
  computation backends (wasm, webgl, and cpu) for TensorFlow.js through a
  graphical interface provided by dat.GUI. Changing the backend can affect
  performance and compatibility depending on the device and browser. The
  addFlagLabels function dynamically checks and displays whether SIMD (Single
  Instruction, Multiple Data) and multithreading are supported, which are
  relevant for performance optimization in the wasm backend.
- setupCamera function: Initializes the user's webcam using the MediaDevices Web
  API. It configures the video stream to not include audio and to use the
  front-facing camera (facingMode: 'user'). Once the video metadata is loaded,
  it resolves a promise with the video element, which is then used for face
  detection.
- BlazeFace: The core of this application is the renderPrediction function,
  which performs real-time face detection using the BlazeFace model, a
  lightweight model for detecting faces in images. The function calls
  model.estimateFaces on each animation frame to detect faces from the video
  feed. For each detected face, it draws a red rectangle around the face and
  blue dots for facial landmarks on a canvas overlaying the video.
@y
- Stats.js: The script starts by creating a Stats instance to monitor and
  display the frame rate (FPS) of the application in real time. This is helpful
  for performance analysis, especially when testing the impact of different
  TensorFlow.js backends on the application's speed.
- TensorFlow.js: The application allows users to switch between different
  computation backends (wasm, webgl, and cpu) for TensorFlow.js through a
  graphical interface provided by dat.GUI. Changing the backend can affect
  performance and compatibility depending on the device and browser. The
  addFlagLabels function dynamically checks and displays whether SIMD (Single
  Instruction, Multiple Data) and multithreading are supported, which are
  relevant for performance optimization in the wasm backend.
- setupCamera function: Initializes the user's webcam using the MediaDevices Web
  API. It configures the video stream to not include audio and to use the
  front-facing camera (facingMode: 'user'). Once the video metadata is loaded,
  it resolves a promise with the video element, which is then used for face
  detection.
- BlazeFace: The core of this application is the renderPrediction function,
  which performs real-time face detection using the BlazeFace model, a
  lightweight model for detecting faces in images. The function calls
  model.estimateFaces on each animation frame to detect faces from the video
  feed. For each detected face, it draws a red rectangle around the face and
  blue dots for facial landmarks on a canvas overlaying the video.
@z

@x
{{< accordion title="index.js" >}}
@y
{{< accordion title="index.js" >}}
@z

@x
```javascript
const stats = new Stats();
stats.showPanel(0);
document.body.prepend(stats.domElement);
@y
```javascript
const stats = new Stats();
stats.showPanel(0);
document.body.prepend(stats.domElement);
@z

@x
let model, ctx, videoWidth, videoHeight, video, canvas;
@y
let model, ctx, videoWidth, videoHeight, video, canvas;
@z

@x
const state = {
  backend: "wasm",
};
@y
const state = {
  backend: "wasm",
};
@z

@x
const gui = new dat.GUI();
gui
  .add(state, "backend", ["wasm", "webgl", "cpu"])
  .onChange(async (backend) => {
    await tf.setBackend(backend);
    addFlagLables();
  });
@y
const gui = new dat.GUI();
gui
  .add(state, "backend", ["wasm", "webgl", "cpu"])
  .onChange(async (backend) => {
    await tf.setBackend(backend);
    addFlagLables();
  });
@z

@x
async function addFlagLables() {
  if (!document.querySelector("#simd_supported")) {
    const simdSupportLabel = document.createElement("div");
    simdSupportLabel.id = "simd_supported";
    simdSupportLabel.style = "font-weight: bold";
    const simdSupported = await tf.env().getAsync("WASM_HAS_SIMD_SUPPORT");
    simdSupportLabel.innerHTML = `SIMD supported: <span class=${simdSupported}>${simdSupported}<span>`;
    document.querySelector("#description").appendChild(simdSupportLabel);
  }
@y
async function addFlagLables() {
  if (!document.querySelector("#simd_supported")) {
    const simdSupportLabel = document.createElement("div");
    simdSupportLabel.id = "simd_supported";
    simdSupportLabel.style = "font-weight: bold";
    const simdSupported = await tf.env().getAsync("WASM_HAS_SIMD_SUPPORT");
    simdSupportLabel.innerHTML = `SIMD supported: <span class=${simdSupported}>${simdSupported}<span>`;
    document.querySelector("#description").appendChild(simdSupportLabel);
  }
@z

@x
  if (!document.querySelector("#threads_supported")) {
    const threadSupportLabel = document.createElement("div");
    threadSupportLabel.id = "threads_supported";
    threadSupportLabel.style = "font-weight: bold";
    const threadsSupported = await tf
      .env()
      .getAsync("WASM_HAS_MULTITHREAD_SUPPORT");
    threadSupportLabel.innerHTML = `Threads supported: <span class=${threadsSupported}>${threadsSupported}</span>`;
    document.querySelector("#description").appendChild(threadSupportLabel);
  }
}
@y
  if (!document.querySelector("#threads_supported")) {
    const threadSupportLabel = document.createElement("div");
    threadSupportLabel.id = "threads_supported";
    threadSupportLabel.style = "font-weight: bold";
    const threadsSupported = await tf
      .env()
      .getAsync("WASM_HAS_MULTITHREAD_SUPPORT");
    threadSupportLabel.innerHTML = `Threads supported: <span class=${threadsSupported}>${threadsSupported}</span>`;
    document.querySelector("#description").appendChild(threadSupportLabel);
  }
}
@z

@x
async function setupCamera() {
  video = document.getElementById("video");
@y
async function setupCamera() {
  video = document.getElementById("video");
@z

@x
  const stream = await navigator.mediaDevices.getUserMedia({
    audio: false,
    video: { facingMode: "user" },
  });
  video.srcObject = stream;
@y
  const stream = await navigator.mediaDevices.getUserMedia({
    audio: false,
    video: { facingMode: "user" },
  });
  video.srcObject = stream;
@z

@x
  return new Promise((resolve) => {
    video.onloadedmetadata = () => {
      resolve(video);
    };
  });
}
@y
  return new Promise((resolve) => {
    video.onloadedmetadata = () => {
      resolve(video);
    };
  });
}
@z

@x
const renderPrediction = async () => {
  stats.begin();
@y
const renderPrediction = async () => {
  stats.begin();
@z

@x
  const returnTensors = false;
  const flipHorizontal = true;
  const annotateBoxes = true;
  const predictions = await model.estimateFaces(
    video,
    returnTensors,
    flipHorizontal,
    annotateBoxes,
  );
@y
  const returnTensors = false;
  const flipHorizontal = true;
  const annotateBoxes = true;
  const predictions = await model.estimateFaces(
    video,
    returnTensors,
    flipHorizontal,
    annotateBoxes,
  );
@z

@x
  if (predictions.length > 0) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
@y
  if (predictions.length > 0) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
@z

@x
    for (let i = 0; i < predictions.length; i++) {
      if (returnTensors) {
        predictions[i].topLeft = predictions[i].topLeft.arraySync();
        predictions[i].bottomRight = predictions[i].bottomRight.arraySync();
        if (annotateBoxes) {
          predictions[i].landmarks = predictions[i].landmarks.arraySync();
        }
      }
@y
    for (let i = 0; i < predictions.length; i++) {
      if (returnTensors) {
        predictions[i].topLeft = predictions[i].topLeft.arraySync();
        predictions[i].bottomRight = predictions[i].bottomRight.arraySync();
        if (annotateBoxes) {
          predictions[i].landmarks = predictions[i].landmarks.arraySync();
        }
      }
@z

@x
      const start = predictions[i].topLeft;
      const end = predictions[i].bottomRight;
      const size = [end[0] - start[0], end[1] - start[1]];
      ctx.fillStyle = "rgba(255, 0, 0, 0.5)";
      ctx.fillRect(start[0], start[1], size[0], size[1]);
@y
      const start = predictions[i].topLeft;
      const end = predictions[i].bottomRight;
      const size = [end[0] - start[0], end[1] - start[1]];
      ctx.fillStyle = "rgba(255, 0, 0, 0.5)";
      ctx.fillRect(start[0], start[1], size[0], size[1]);
@z

@x
      if (annotateBoxes) {
        const landmarks = predictions[i].landmarks;
@y
      if (annotateBoxes) {
        const landmarks = predictions[i].landmarks;
@z

@x
        ctx.fillStyle = "blue";
        for (let j = 0; j < landmarks.length; j++) {
          const x = landmarks[j][0];
          const y = landmarks[j][1];
          ctx.fillRect(x, y, 5, 5);
        }
      }
    }
  }
@y
        ctx.fillStyle = "blue";
        for (let j = 0; j < landmarks.length; j++) {
          const x = landmarks[j][0];
          const y = landmarks[j][1];
          ctx.fillRect(x, y, 5, 5);
        }
      }
    }
  }
@z

@x
  stats.end();
@y
  stats.end();
@z

@x
  requestAnimationFrame(renderPrediction);
};
@y
  requestAnimationFrame(renderPrediction);
};
@z

@x
const setupPage = async () => {
  await tf.setBackend(state.backend);
  addFlagLables();
  await setupCamera();
  video.play();
@y
const setupPage = async () => {
  await tf.setBackend(state.backend);
  addFlagLables();
  await setupCamera();
  video.play();
@z

@x
  videoWidth = video.videoWidth;
  videoHeight = video.videoHeight;
  video.width = videoWidth;
  video.height = videoHeight;
@y
  videoWidth = video.videoWidth;
  videoHeight = video.videoHeight;
  video.width = videoWidth;
  video.height = videoHeight;
@z

@x
  canvas = document.getElementById("output");
  canvas.width = videoWidth;
  canvas.height = videoHeight;
  ctx = canvas.getContext("2d");
  ctx.fillStyle = "rgba(255, 0, 0, 0.5)";
@y
  canvas = document.getElementById("output");
  canvas.width = videoWidth;
  canvas.height = videoHeight;
  ctx = canvas.getContext("2d");
  ctx.fillStyle = "rgba(255, 0, 0, 0.5)";
@z

@x
  model = await blazeface.load();
@y
  model = await blazeface.load();
@z

@x
  renderPrediction();
};
@y
  renderPrediction();
};
@z

@x
setupPage();
```
@y
setupPage();
```
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
### The tf-backend-wasm.js file
@y
### The tf-backend-wasm.js file
@z

@x
The `tf-backend-wasm.js` file is part of the
[TensorFlow.js library](https://github.com/tensorflow/tfjs/tree/master/tfjs-backend-wasm).
It contains initialization logic for the TensorFlow.js WASM backend, some
utilities for interacting with the WASM binaries, and functions to set custom
paths for the WASM binaries.
@y
The `tf-backend-wasm.js` file is part of the
[TensorFlow.js library](https://github.com/tensorflow/tfjs/tree/master/tfjs-backend-wasm).
It contains initialization logic for the TensorFlow.js WASM backend, some
utilities for interacting with the WASM binaries, and functions to set custom
paths for the WASM binaries.
@z

@x
### The tfjs-backend-wasm-simd.wasm file
@y
### The tfjs-backend-wasm-simd.wasm file
@z

@x
The `tfjs-backend-wasm-simd.wasm` file is part of the
[TensorFlow.js library](https://github.com/tensorflow/tfjs/tree/master/tfjs-backend-wasm).
It's a WASM binary that's used for the WebAssembly
backend, specifically optimized to utilize SIMD (Single Instruction, Multiple
Data) instructions.
@y
The `tfjs-backend-wasm-simd.wasm` file is part of the
[TensorFlow.js library](https://github.com/tensorflow/tfjs/tree/master/tfjs-backend-wasm).
It's a WASM binary that's used for the WebAssembly
backend, specifically optimized to utilize SIMD (Single Instruction, Multiple
Data) instructions.
@z

@x
## Explore the Dockerfile
@y
## Explore the Dockerfile
@z

@x
In a Docker-based project, the Dockerfile serves as the foundational
asset for building your application's environment.
@y
In a Docker-based project, the Dockerfile serves as the foundational
asset for building your application's environment.
@z

@x
A Dockerfile is a text file that instructs Docker how to create an image of your
application's environment. An image contains everything you want and
need when running application, such as files, packages, and tools.
@y
A Dockerfile is a text file that instructs Docker how to create an image of your
application's environment. An image contains everything you want and
need when running application, such as files, packages, and tools.
@z

@x
The following is the Dockerfile for this project.
@y
The following is the Dockerfile for this project.
@z

@x
```dockerfile
FROM nginx:stable-alpine3.17-slim
WORKDIR /usr/share/nginx/html
COPY . .
```
@y
```dockerfile
FROM nginx:stable-alpine3.17-slim
WORKDIR /usr/share/nginx/html
COPY . .
```
@z

@x
This Dockerfile defines an image that serves static content using Nginx from an
Alpine Linux base image.
@y
This Dockerfile defines an image that serves static content using Nginx from an
Alpine Linux base image.
@z

@x
## Develop with Compose
@y
## Develop with Compose
@z

@x
Docker Compose is a tool for defining and running multi-container Docker
applications. With Compose, you use a YAML file to configure your application's
services, networks, and volumes. In this case, the application isn't a
multi-container application, but Docker Compose has other useful features for
development, like [Compose Watch](/manuals/compose/how-tos/file-watch.md).
@y
Docker Compose is a tool for defining and running multi-container Docker
applications. With Compose, you use a YAML file to configure your application's
services, networks, and volumes. In this case, the application isn't a
multi-container application, but Docker Compose has other useful features for
development, like [Compose Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
The sample application doesn't have a Compose file yet. To create a Compose
file, in the `TensorJS-Face-Detection` directory, create a text file named
`compose.yaml` and then add the following contents.
@y
The sample application doesn't have a Compose file yet. To create a Compose
file, in the `TensorJS-Face-Detection` directory, create a text file named
`compose.yaml` and then add the following contents.
@z

@x
```yaml
services:
  server:
    build:
      context: .
    ports:
      - 80:80
    develop:
      watch:
        - action: sync
          path: .
          target: /usr/share/nginx/html
```
@y
```yaml
services:
  server:
    build:
      context: .
    ports:
      - 80:80
    develop:
      watch:
        - action: sync
          path: .
          target: /usr/share/nginx/html
```
@z

@x
This Compose file defines a service that is built using the Dockerfile in the
same directory. It maps port 80 on the host to port 80 in the container. It also
has a `develop` subsection with the `watch` attribute that defines a list of
rules that control automatic service updates based on local file changes. For
more details about the Compose instructions, see the
[Compose file reference](/reference/compose-file/_index.md).
@y
This Compose file defines a service that is built using the Dockerfile in the
same directory. It maps port 80 on the host to port 80 in the container. It also
has a `develop` subsection with the `watch` attribute that defines a list of
rules that control automatic service updates based on local file changes. For
more details about the Compose instructions, see the
[Compose file reference](reference/compose-file/_index.md).
@z

@x
Save the changes to your `compose.yaml` file and then run the following command to run the application.
@y
Save the changes to your `compose.yaml` file and then run the following command to run the application.
@z

@x
```console
$ docker compose watch
```
@y
```console
$ docker compose watch
```
@z

@x
Once the application is running, open a web browser and access the application
at [http://localhost:80](http://localhost:80). You may need to grant access to
your webcam for the application.
@y
Once the application is running, open a web browser and access the application
at [http://localhost:80](http://localhost:80). You may need to grant access to
your webcam for the application.
@z

@x
Now you can make changes to the source code and see the changes automatically
reflected in the container without having to rebuild and rerun the container.
@y
Now you can make changes to the source code and see the changes automatically
reflected in the container without having to rebuild and rerun the container.
@z

@x
Open the `index.js` file and update the landmark points to be green instead of
blue on line 83.
@y
Open the `index.js` file and update the landmark points to be green instead of
blue on line 83.
@z

@x
```diff
-        ctx.fillStyle = "blue";
+        ctx.fillStyle = "green";
```
@y
```diff
-        ctx.fillStyle = "blue";
+        ctx.fillStyle = "green";
```
@z

@x
Save the changes to the `index.js` file and then refresh the browser page. The
landmark points should now appear green.
@y
Save the changes to the `index.js` file and then refresh the browser page. The
landmark points should now appear green.
@z

@x
To stop the application, press `ctrl`+`c` in the terminal.
@y
To stop the application, press `ctrl`+`c` in the terminal.
@z

@x
## Share your image
@y
## Share your image
@z

@x
Publishing your Docker image on Docker Hub streamlines deployment processes for
others, enabling seamless integration into diverse projects. It also promotes
the adoption of your containerized solutions, broadening their impact across the
developer ecosystem. To share your image:
@y
Publishing your Docker image on Docker Hub streamlines deployment processes for
others, enabling seamless integration into diverse projects. It also promotes
the adoption of your containerized solutions, broadening their impact across the
developer ecosystem. To share your image:
@z

@x
1. [Sign up](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade) or sign in to [Docker Hub](https://hub.docker.com).
@y
1. [Sign up](https://www.docker.com/pricing?utm_source=docker&utm_medium=webreferral&utm_campaign=docs_driven_upgrade) or sign in to [Docker Hub](https://hub.docker.com).
@z

@x
2. Rebuild your image to include the changes to your application. This time,
   prefix the image name with your Docker ID. Docker uses the name to determine
   which repository to push it to. Open a terminal and run the following
   command in the `TensorJS-Face-Detection` directory. Replace `YOUR-USER-NAME`
   with your Docker ID.
@y
2. Rebuild your image to include the changes to your application. This time,
   prefix the image name with your Docker ID. Docker uses the name to determine
   which repository to push it to. Open a terminal and run the following
   command in the `TensorJS-Face-Detection` directory. Replace `YOUR-USER-NAME`
   with your Docker ID.
@z

@x
   ```console
   $ docker build -t YOUR-USER-NAME/face-detection-tensorjs .
   ```
@y
   ```console
   $ docker build -t YOUR-USER-NAME/face-detection-tensorjs .
   ```
@z

@x
3. Run the following `docker push` command to push the image to Docker Hub.
   Replace `YOUR-USER-NAME` with your Docker ID.
@y
3. Run the following `docker push` command to push the image to Docker Hub.
   Replace `YOUR-USER-NAME` with your Docker ID.
@z

@x
   ```console
   $ docker push YOUR-USER-NAME/face-detection-tensorjs
   ```
@y
   ```console
   $ docker push YOUR-USER-NAME/face-detection-tensorjs
   ```
@z

@x
4. Verify that you pushed the image to Docker Hub.
   1. Go to [Docker Hub](https://hub.docker.com).
   2. Select **Repositories**.
   3. View the **Last pushed** time for your repository.
@y
4. Verify that you pushed the image to Docker Hub.
   1. Go to [Docker Hub](https://hub.docker.com).
   2. Select **Repositories**.
   3. View the **Last pushed** time for your repository.
@z

@x
Other users can now download and run your image using the `docker run` command. They need to replace `YOUR-USER-NAME` with your Docker ID.
@y
Other users can now download and run your image using the `docker run` command. They need to replace `YOUR-USER-NAME` with your Docker ID.
@z

@x
```console
$ docker run -p 80:80 YOUR-USER-NAME/face-detection-tensorjs
```
@y
```console
$ docker run -p 80:80 YOUR-USER-NAME/face-detection-tensorjs
```
@z

@x
## Summary
@y
## Summary
@z

@x
This guide demonstrated leveraging TensorFlow.js and Docker for face detection
in web applications. It highlighted the ease of running containerized
TensorFlow.js applications, and developing with Docker Compose for real-time
code changes. Additionally, it covered how sharing your Docker image on Docker
Hub can streamline deployment for others, enhancing the application's reach
within the developer community.
@y
This guide demonstrated leveraging TensorFlow.js and Docker for face detection
in web applications. It highlighted the ease of running containerized
TensorFlow.js applications, and developing with Docker Compose for real-time
code changes. Additionally, it covered how sharing your Docker image on Docker
Hub can streamline deployment for others, enhancing the application's reach
within the developer community.
@z

@x
Related information:
@y
Related information:
@z

@x
- [TensorFlow.js website](https://www.tensorflow.org/js)
- [MediaPipe website](https://developers.google.com/mediapipe/)
- [Dockerfile reference](/reference/dockerfile/)
- [Compose file reference](/reference/compose-file/_index.md)
- [Docker CLI reference](/reference/cli/docker/)
- [Docker Blog: Accelerating Machine Learning with TensorFlow.js](https://www.docker.com/blog/accelerating-machine-learning-with-tensorflow-js-using-pretrained-models-and-docker/)
@y
- [TensorFlow.js website](https://www.tensorflow.org/js)
- [MediaPipe website](https://developers.google.com/mediapipe/)
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/)
- [Compose file reference](reference/compose-file/_index.md)
- [Docker CLI reference](__SUBDIR__/reference/cli/docker/)
- [Docker Blog: Accelerating Machine Learning with TensorFlow.js](https://www.docker.com/blog/accelerating-machine-learning-with-tensorflow-js-using-pretrained-models-and-docker/)
@z
