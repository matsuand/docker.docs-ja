%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Mocking API services in development and testing with WireMock
description: &desc Mocking API services in development and testing with WireMock
keywords: WireMock, container-supported development
linktitle: Mocking API services with WireMock
@y
title: Mocking API services in development and testing with WireMock
description: &desc Mocking API services in development and testing with WireMock
keywords: WireMock, container-supported development
linktitle: Mocking API services with WireMock
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
During local development and testing, it's quite common to encounter situations where your app is dependent on the remote APIs. Network issues, rate limits, or even downtime of the API provider can halt your progress. This can significantly hinder your productivity and make testing more challenging. This is where WireMock comes into play. 
@y
During local development and testing, it's quite common to encounter situations where your app is dependent on the remote APIs. Network issues, rate limits, or even downtime of the API provider can halt your progress. This can significantly hinder your productivity and make testing more challenging. This is where WireMock comes into play. 
@z

@x
WireMock is an open-source tool that helps developers to create a mock server that simulates the behavior of real APIs, providing a controlled environment for development and testing.
@y
WireMock is an open-source tool that helps developers to create a mock server that simulates the behavior of real APIs, providing a controlled environment for development and testing.
@z

@x
Imagine you have both an API and a frontend app, and you want to test how the frontend interacts with the API. Using WireMock, you can set up a mock server to simulate the API's responses, allowing you to test the frontend behavior without relying on the actual API. This can be particularly helpful when the API is still under development or when you want to test different scenarios without affecting the actual API. WireMock supports both HTTP and HTTPS protocols and can simulate various response scenarios, including delays, errors, and different HTTP status codes.
@y
Imagine you have both an API and a frontend app, and you want to test how the frontend interacts with the API. Using WireMock, you can set up a mock server to simulate the API's responses, allowing you to test the frontend behavior without relying on the actual API. This can be particularly helpful when the API is still under development or when you want to test different scenarios without affecting the actual API. WireMock supports both HTTP and HTTPS protocols and can simulate various response scenarios, including delays, errors, and different HTTP status codes.
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Use Docker to launch up a WireMock container.
- Use mock data in the local development without relying on an external API
- Use a Live API in production to fetch real-time weather data from AccuWeather. 
@y
- Use Docker to launch up a WireMock container.
- Use mock data in the local development without relying on an external API
- Use a Live API in production to fetch real-time weather data from AccuWeather. 
@z

@x
## Using WireMock with Docker
@y
## Using WireMock with Docker
@z

@x
The official [Docker image for WireMock](https://hub.docker.com/r/wiremock/wiremock) provides a convenient way to deploy and manage WireMock instances. WireMock is available for various CPU architectures, including amd64, armv7, and armv8, ensuring compatibility with different devices and platforms. You can learn more about WireMock standalone on the [WireMock docs site](https://wiremock.org/docs/standalone/docker/).
@y
The official [Docker image for WireMock](https://hub.docker.com/r/wiremock/wiremock) provides a convenient way to deploy and manage WireMock instances. WireMock is available for various CPU architectures, including amd64, armv7, and armv8, ensuring compatibility with different devices and platforms. You can learn more about WireMock standalone on the [WireMock docs site](https://wiremock.org/docs/standalone/docker/).
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
The following prerequisites are required to follow along with this how-to guide:
@y
The following prerequisites are required to follow along with this how-to guide:
@z

@x
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
@y
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
@z

@x
### Launching WireMock
@y
### Launching WireMock
@z

@x
Launch a quick demo of WireMock by using the following steps:
@y
Launch a quick demo of WireMock by using the following steps:
@z

@x
 1. Clone the [GitHub repository](https://github.com/dockersamples/wiremock-node-docker) locally.
@y
 1. Clone the [GitHub repository](https://github.com/dockersamples/wiremock-node-docker) locally.
@z

@x
    ```console
    $ git clone https://github.com/dockersamples/wiremock-node-docker
    ```
@y
    ```console
    $ git clone https://github.com/dockersamples/wiremock-node-docker
    ```
@z

@x
 2. Navigate to the `wiremock-endpoint` directory
@y
 2. Navigate to the `wiremock-endpoint` directory
@z

@x
    ```console
    $ cd wiremock-node-docker/
    ```
@y
    ```console
    $ cd wiremock-node-docker/
    ```
@z

@x
    WireMock acts as the mock API that your backend will communicate with to retrieve data. The mock API responses have already been created for you in the mappings directory. 
@y
    WireMock acts as the mock API that your backend will communicate with to retrieve data. The mock API responses have already been created for you in the mappings directory. 
@z

@x
 3. Start the Compose stack by running the following command at the root of the cloned project directory
@y
 3. Start the Compose stack by running the following command at the root of the cloned project directory
@z

@x
    ```console
    $ docker compose up -d
    ```
@y
    ```console
    $ docker compose up -d
    ```
@z

@x
    After a moment, the application will be up and running. 
@y
    After a moment, the application will be up and running. 
@z

@x
    ![Diagram showing the WireMock container running on Docker Desktop ](./images/wiremock-using-docker.webp)
@y
    ![Diagram showing the WireMock container running on Docker Desktop ](./images/wiremock-using-docker.webp)
@z

@x
    You can check the logs by selecting the `wiremock-node-docker` container:
@y
    You can check the logs by selecting the `wiremock-node-docker` container:
@z

@x
    ![Diagram showing the logs of WireMock container running on Docker Desktop ](./images/wiremock-logs-docker-desktop.webp)
@y
    ![Diagram showing the logs of WireMock container running on Docker Desktop ](./images/wiremock-logs-docker-desktop.webp)
@z

@x
 4. Test the Mock API.
@y
 4. Test the Mock API.
@z

@x
    ```console
    $ curl http://localhost:8080/api/v1/getWeather\?city\=Bengaluru
    ```
@y
    ```console
    $ curl http://localhost:8080/api/v1/getWeather\?city\=Bengaluru
    ```
@z

@x
    It will return the following canned response with mock data:
@y
    It will return the following canned response with mock data:
@z

@x
    ```plaintext
    {"city":"Bengaluru","temperature":27.1,"conditions":"Mostly cloudy","forecasts":[{"date":"2024-09-02T07:00:00+05:30","temperature":83,"conditions":"Partly sunny w/ t-storms"},{"date":"2024-09-03T07:00:00+05:30","temperature":83,"conditions":"Thunderstorms"},{"date":"2024-09-04T07:00:00+05:30","temperature":83,"conditions":"Intermittent clouds"},{"date":"2024-09-05T07:00:00+05:30","temperature":82,"conditions":"Dreary"},{"date":"2024-09-06T07:00:00+05:30","temperature":82,"conditions":"Dreary"}]}
    ```
@y
    ```plaintext
    {"city":"Bengaluru","temperature":27.1,"conditions":"Mostly cloudy","forecasts":[{"date":"2024-09-02T07:00:00+05:30","temperature":83,"conditions":"Partly sunny w/ t-storms"},{"date":"2024-09-03T07:00:00+05:30","temperature":83,"conditions":"Thunderstorms"},{"date":"2024-09-04T07:00:00+05:30","temperature":83,"conditions":"Intermittent clouds"},{"date":"2024-09-05T07:00:00+05:30","temperature":82,"conditions":"Dreary"},{"date":"2024-09-06T07:00:00+05:30","temperature":82,"conditions":"Dreary"}]}
    ```
@z

@x
    With WireMock, you define canned responses using mapping files.
    For this request, the mock data is defined in the JSON file at
    `wiremock-endpoint/mappings/getWeather/getWeatherBengaluru.json`.
@y
    With WireMock, you define canned responses using mapping files.
    For this request, the mock data is defined in the JSON file at
    `wiremock-endpoint/mappings/getWeather/getWeatherBengaluru.json`.
@z

@x
    For more information about stubbing canned responses, refer to the
    [WireMock documentation](https://wiremock.org/docs/stubbing/).
@y
    For more information about stubbing canned responses, refer to the
    [WireMock documentation](https://wiremock.org/docs/stubbing/).
@z

@x
## Using WireMock in development
@y
## Using WireMock in development
@z

@x
Now that you have tried WireMock, let’s use it in development and testing. In this example, you will use a sample application that has a Node.js backend. This app stack has the following configuration:
@y
Now that you have tried WireMock, let’s use it in development and testing. In this example, you will use a sample application that has a Node.js backend. This app stack has the following configuration:
@z

@x
  - Local Development Environment: The context in which the Node.js backend and WireMock are running.
  - Node.js Backend: Represents the backend application that handles HTTP requests.
  - External AccuWeather API: The real API from which live weather data is fetched.
  - WireMock: The mock server that simulates the API responses during testing. It runs as a Docker container.
@y
  - Local Development Environment: The context in which the Node.js backend and WireMock are running.
  - Node.js Backend: Represents the backend application that handles HTTP requests.
  - External AccuWeather API: The real API from which live weather data is fetched.
  - WireMock: The mock server that simulates the API responses during testing. It runs as a Docker container.
@z

@x
  ![Diagram showing the architecture of WireMock in development ](./images/wiremock-arch.webp)
@y
  ![Diagram showing the architecture of WireMock in development ](./images/wiremock-arch.webp)
@z

@x
  - In development, the Node.js backend sends a request to WireMock instead of the actual AccuWeather API.
  - In production, it connects directly to the live AccuWeather API for real data.
@y
  - In development, the Node.js backend sends a request to WireMock instead of the actual AccuWeather API.
  - In production, it connects directly to the live AccuWeather API for real data.
@z

@x
## Use mock data in local development
@y
## Use mock data in local development
@z

@x
Let’s set up a Node app to send requests to the WireMock container instead of the actual AccuWeather API.
@y
Let’s set up a Node app to send requests to the WireMock container instead of the actual AccuWeather API.
@z

@x
### Prerequisite
@y
### Prerequisite
@z

@x
- Install [Node.js and npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- Ensure that WireMock container is up and running (see [Launching Wiremock](#launching-wiremock)
@y
- Install [Node.js and npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- Ensure that WireMock container is up and running (see [Launching Wiremock](#launching-wiremock)
@z

@x
Follow the steps to setup a non-containerized Node application:
@y
Follow the steps to setup a non-containerized Node application:
@z

@x
1. Navigate to the `accuweather-api` directory
@y
1. Navigate to the `accuweather-api` directory
@z

@x
   Make sure you're in the directory where your `package.json` file is located.
@y
   Make sure you're in the directory where your `package.json` file is located.
@z

@x
2. Set the environment variable.
@y
2. Set the environment variable.
@z

@x
   Open `.env` file placed under `accuweather-api/` directory. Remove the old entries and ensure that it just contains the following single line.
@y
   Open `.env` file placed under `accuweather-api/` directory. Remove the old entries and ensure that it just contains the following single line.
@z

@x
   ```plaintext
   API_ENDPOINT_BASE=http://localhost:8080
   ```
@y
   ```plaintext
   API_ENDPOINT_BASE=http://localhost:8080
   ```
@z

@x
   This will tell your Node.js application to use the WireMock server for API calls. 
@y
   This will tell your Node.js application to use the WireMock server for API calls. 
@z

@x
3. Examine the Application Entry Point
@y
3. Examine the Application Entry Point
@z

@x
   - The main file for the application is `index.js`, located in the `accuweather-api/src/api` directory.
   - This file starts the `getWeather.js` module, which is essential for your Node.js application. It uses the `dotenv` package to load environment variables from the`.env` file.
   - Based on the value of `API_ENDPOINT_BASE`, the application routes requests either to the WireMock server (`http://localhost:8080`) or the AccuWeather API. In this setup, it uses the WireMock server.
   - The code ensures that the `ACCUWEATHER_API_KEY` is required only if the application is not using WireMock, enhancing efficiency and avoiding errors.
@y
   - The main file for the application is `index.js`, located in the `accuweather-api/src/api` directory.
   - This file starts the `getWeather.js` module, which is essential for your Node.js application. It uses the `dotenv` package to load environment variables from the`.env` file.
   - Based on the value of `API_ENDPOINT_BASE`, the application routes requests either to the WireMock server (`http://localhost:8080`) or the AccuWeather API. In this setup, it uses the WireMock server.
   - The code ensures that the `ACCUWEATHER_API_KEY` is required only if the application is not using WireMock, enhancing efficiency and avoiding errors.
@z

@x
    ```javascript
    require("dotenv").config();
@y
    ```javascript
    require("dotenv").config();
@z

@x
    const express = require("express");
    const axios = require("axios");
@y
    const express = require("express");
    const axios = require("axios");
@z

@x
    const router = express.Router();
    const API_ENDPOINT_BASE = process.env.API_ENDPOINT_BASE;
    const API_KEY = process.env.ACCUWEATHER_API_KEY;
@y
    const router = express.Router();
    const API_ENDPOINT_BASE = process.env.API_ENDPOINT_BASE;
    const API_KEY = process.env.ACCUWEATHER_API_KEY;
@z

@x
    console.log('API_ENDPOINT_BASE:', API_ENDPOINT_BASE);  // Log after it's defined
    console.log('ACCUWEATHER_API_KEY is set:', !!API_KEY); // Log boolean instead of actual key
@y
    console.log('API_ENDPOINT_BASE:', API_ENDPOINT_BASE);  // Log after it's defined
    console.log('ACCUWEATHER_API_KEY is set:', !!API_KEY); // Log boolean instead of actual key
@z

@x
    if (!API_ENDPOINT_BASE) {
      throw new Error("API_ENDPOINT_BASE is not defined in environment variables");
    }
@y
    if (!API_ENDPOINT_BASE) {
      throw new Error("API_ENDPOINT_BASE is not defined in environment variables");
    }
@z

@x
    // Only check for API key if not using WireMock
    if (API_ENDPOINT_BASE !== 'http://localhost:8080' && !API_KEY) {
      throw new Error("ACCUWEATHER_API_KEY is not defined in environment variables");
    }
    // Function to fetch the location key for the city
    async function fetchLocationKey(townName) {
      const { data: locationData } = await
    axios.get(`${API_ENDPOINT_BASE}/locations/v1/cities/search`, {
        params: { q: townName, details: false, apikey: API_KEY },
      });
      return locationData[0]?.Key;
    }
    ```  
@y
    // Only check for API key if not using WireMock
    if (API_ENDPOINT_BASE !== 'http://localhost:8080' && !API_KEY) {
      throw new Error("ACCUWEATHER_API_KEY is not defined in environment variables");
    }
    // Function to fetch the location key for the city
    async function fetchLocationKey(townName) {
      const { data: locationData } = await
    axios.get(`${API_ENDPOINT_BASE}/locations/v1/cities/search`, {
        params: { q: townName, details: false, apikey: API_KEY },
      });
      return locationData[0]?.Key;
    }
    ```  
@z

@x
4. Start the Node server
@y
4. Start the Node server
@z

@x
   Before you start the Node server, ensure that you have already installed the node packages listed in the package.json file by running `npm install`. 
@y
   Before you start the Node server, ensure that you have already installed the node packages listed in the package.json file by running `npm install`. 
@z

@x
   ```console
   npm install 
   npm run start
   ```
@y
   ```console
   npm install 
   npm run start
   ```
@z

@x
   You should see the following output:
@y
   You should see the following output:
@z

@x
    ```plaintext
    > express-api-starter@1.2.0 start
    > node src/index.js
@y
    ```plaintext
    > express-api-starter@1.2.0 start
    > node src/index.js
@z

@x
    API_ENDPOINT_BASE: http://localhost:8080
    ..
    Listening: http://localhost:5001
    ```
@y
    API_ENDPOINT_BASE: http://localhost:8080
    ..
    Listening: http://localhost:5001
    ```
@z

@x
   The output indicates that your Node application has successfully started. 
   Keep this terminal window open. 
@y
   The output indicates that your Node application has successfully started. 
   Keep this terminal window open. 
@z

@x
5. Test the Mocked API
@y
5. Test the Mocked API
@z

@x
   Open a new terminal window and run the following command to test the mocked API:
@y
   Open a new terminal window and run the following command to test the mocked API:
@z

@x
   ```console
   $ curl "http://localhost:5001/api/v1/getWeather?city=Bengaluru"
   ```
@y
   ```console
   $ curl "http://localhost:5001/api/v1/getWeather?city=Bengaluru"
   ```
@z

@x
   You should see the following output:
@y
   You should see the following output:
@z

@x
   ```plaintext
   {"city":"Bengaluru","temperature":27.1,"conditions":"Mostly cloudy","forecasts":[{"date":"2024-09-02T07:00:00+05:30","temperature":83,"conditions":"Partly sunny w/ t-storms"},{"date":"2024-09-03T07:00:00+05:30","temperature":83,"conditions":"Thunderstorms"},{"date":"2024-09-04T07:00:00+05:30","temperature":83,"conditions":"Intermittent clouds"},{"date":"2024-09-05T07:00:00+05:30","temperature":82,"conditions":"Dreary"},{"date":"2024-09-06T07:00:00+05:30","temperature":82,"conditions":"Dreary"}]}%
   ```
@y
   ```plaintext
   {"city":"Bengaluru","temperature":27.1,"conditions":"Mostly cloudy","forecasts":[{"date":"2024-09-02T07:00:00+05:30","temperature":83,"conditions":"Partly sunny w/ t-storms"},{"date":"2024-09-03T07:00:00+05:30","temperature":83,"conditions":"Thunderstorms"},{"date":"2024-09-04T07:00:00+05:30","temperature":83,"conditions":"Intermittent clouds"},{"date":"2024-09-05T07:00:00+05:30","temperature":82,"conditions":"Dreary"},{"date":"2024-09-06T07:00:00+05:30","temperature":82,"conditions":"Dreary"}]}%
   ```
@z

@x
   This indicates that your Node.js application is now successfully routing requests to the WireMock container and receiving the mocked responses
@y
   This indicates that your Node.js application is now successfully routing requests to the WireMock container and receiving the mocked responses
@z

@x
   You might have noticed that you’re trying to use `http://localhost:5001` as the URL instead of port `8080`. This is because your Node.js application is running on port `5001`, and it's routing requests to the WireMock container that's listening on port `8080`.
@y
   You might have noticed that you’re trying to use `http://localhost:5001` as the URL instead of port `8080`. This is because your Node.js application is running on port `5001`, and it's routing requests to the WireMock container that's listening on port `8080`.
@z

@x
   > [!TIP]
   > Before you proceed to the next step, ensure that you stop the node application service.
@y
   > [!TIP]
   > Before you proceed to the next step, ensure that you stop the node application service.
@z

@x
## Use a Live API in production to fetch real-time weather data from AccuWeather
@y
## Use a Live API in production to fetch real-time weather data from AccuWeather
@z

@x
   To enhance your Node.js application with real-time weather data, you can seamlessly integrate the AccuWeather API. This section of the guide will walk you through the steps involved in setting up a non-containerized Node.js application and fetching weather information directly from the AccuWeather API.
@y
   To enhance your Node.js application with real-time weather data, you can seamlessly integrate the AccuWeather API. This section of the guide will walk you through the steps involved in setting up a non-containerized Node.js application and fetching weather information directly from the AccuWeather API.
@z

@x
1. Create an AccuWeather API Key
@y
1. Create an AccuWeather API Key
@z

@x
   Sign up for a free AccuWeather developer account at[https://developer.accuweather.com/](https://developer.accuweather.com/). Within your account, create a new app by selecting `MY APPS` on the top navigation menu to get your unique API key.
@y
   Sign up for a free AccuWeather developer account at[https://developer.accuweather.com/](https://developer.accuweather.com/). Within your account, create a new app by selecting `MY APPS` on the top navigation menu to get your unique API key.
@z

@x
   ![Diagram showing the AccuWeather Dashboard](images/wiremock-accuweatherapi.webp)
@y
   ![Diagram showing the AccuWeather Dashboard](images/wiremock-accuweatherapi.webp)
@z

@x
    [AccuWeather API](https://developer.accuweather.com/) is a web API that provides real-time weather data and forecasts. Developers can use this API to integrate weather information into their applications, websites, or other projects.
@y
    [AccuWeather API](https://developer.accuweather.com/) is a web API that provides real-time weather data and forecasts. Developers can use this API to integrate weather information into their applications, websites, or other projects.
@z

@x
2. Change directory to `accuweather-api`
@y
2. Change directory to `accuweather-api`
@z

@x
   ```console
   $ cd accuweather-api
   ```
@y
   ```console
   $ cd accuweather-api
   ```
@z

@x
3. Set your AccuWeather API key using the `.env` file:
@y
3. Set your AccuWeather API key using the `.env` file:
@z

@x
   > [!TIP]
   >  To prevent conflicts, ensure that any existing environment variables named `API_ENDPOINT_BASE` or `ACCUWEATHER_API_KEY` are removed before modifying the `.env` file.
@y
   > [!TIP]
   >  To prevent conflicts, ensure that any existing environment variables named `API_ENDPOINT_BASE` or `ACCUWEATHER_API_KEY` are removed before modifying the `.env` file.
@z

@x
   Run the following command on your terminal:
@y
   Run the following command on your terminal:
@z

@x
   ```console
   unset API_ENDPOINT_BASE
   unset ACCUWEATHER_API_KEY
   ```
@y
   ```console
   unset API_ENDPOINT_BASE
   unset ACCUWEATHER_API_KEY
   ```
@z

@x
   It’s time to set the environment variables in the `.env` file:
@y
   It’s time to set the environment variables in the `.env` file:
@z

@x
   ```plaintext
   ACCUWEATHER_API_KEY=XXXXXX
   API_ENDPOINT_BASE=http://dataservice.accuweather.com
   ``` 
@y
   ```plaintext
   ACCUWEATHER_API_KEY=XXXXXX
   API_ENDPOINT_BASE=http://dataservice.accuweather.com
   ``` 
@z

@x
   Make sure to populate `ACCUWEATHER_API_KEY` with the correct value.
@y
   Make sure to populate `ACCUWEATHER_API_KEY` with the correct value.
@z

@x
4. Install the dependencies
@y
4. Install the dependencies
@z

@x
   Run the following command to install the required packages:
@y
   Run the following command to install the required packages:
@z

@x
   ```console
   $ npm install
   ```
@y
   ```console
   $ npm install
   ```
@z

@x
   This will install all the packages listed in your `package.json` file. These packages are essential for the project to function correctly.
@y
   This will install all the packages listed in your `package.json` file. These packages are essential for the project to function correctly.
@z

@x
   If you encounter any warnings related to deprecated packages, you can ignore them for now for this demonstration.
@y
   If you encounter any warnings related to deprecated packages, you can ignore them for now for this demonstration.
@z

@x
5. Assuming that you don’t have a pre-existing Node server running on your system, go ahead and start the Node server by running the following command:
@y
5. Assuming that you don’t have a pre-existing Node server running on your system, go ahead and start the Node server by running the following command:
@z

@x
   ```console
   $ npm run start
   ```
@y
   ```console
   $ npm run start
   ```
@z

@x
   You should see the following output:
@y
   You should see the following output:
@z

@x
   ```plaintext
   > express-api-starter@1.2.0 start
   > node src/index.js
@y
   ```plaintext
   > express-api-starter@1.2.0 start
   > node src/index.js
@z

@x
   API_ENDPOINT_BASE: http://dataservice.accuweather.com
   ACCUWEATHER_API_KEY is set: true 
   Listening: http://localhost:5001
   ``` 
@y
   API_ENDPOINT_BASE: http://dataservice.accuweather.com
   ACCUWEATHER_API_KEY is set: true 
   Listening: http://localhost:5001
   ``` 
@z

@x
   Keep this terminal window open.
@y
   Keep this terminal window open.
@z

@x
6. Run the curl command to send a GET request to the server URL.
@y
6. Run the curl command to send a GET request to the server URL.
@z

@x
   In the new terminal window, enter the following command:
@y
   In the new terminal window, enter the following command:
@z

@x
   ```console
   $ curl "http://localhost:5000/api/v1/getWeather?city=Bengaluru"
   ``` 
@y
   ```console
   $ curl "http://localhost:5000/api/v1/getWeather?city=Bengaluru"
   ``` 
@z

@x
   By running the command, you're essentially telling your local server to provide you with weather data for a city named `Bengaluru`. The request is specifically targeting the `/api/v1/getWeather` endpoint, and you're providing the query parameter `city=Bengaluru`. Once you execute the command, the server processes this request, fetches the data and returns it as a response, which `curl` will display in your terminal.
@y
   By running the command, you're essentially telling your local server to provide you with weather data for a city named `Bengaluru`. The request is specifically targeting the `/api/v1/getWeather` endpoint, and you're providing the query parameter `city=Bengaluru`. Once you execute the command, the server processes this request, fetches the data and returns it as a response, which `curl` will display in your terminal.
@z

@x
   When fetching data from the external AccuWeather API, you're interacting with live data that reflects the latest weather conditions. 
@y
   When fetching data from the external AccuWeather API, you're interacting with live data that reflects the latest weather conditions. 
@z

@x
## Recap
@y
## Recap
@z

@x
This guide has walked you through setting up WireMock using Docker. You’ve learned how to create stubs to simulate API endpoints, allowing you to develop and test your application without relying on external services. By using WireMock, you can create reliable and consistent test environments, reproduce edge cases, and speed up your development workflow.
@y
This guide has walked you through setting up WireMock using Docker. You’ve learned how to create stubs to simulate API endpoints, allowing you to develop and test your application without relying on external services. By using WireMock, you can create reliable and consistent test environments, reproduce edge cases, and speed up your development workflow.
@z
