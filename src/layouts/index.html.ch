%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!DOCTYPE html>
<html lang="en">
@y
<!DOCTYPE html>
<html lang="en">
@z

@x
<head>
  {{ partial "head.html" . }}
</head>
@y
<head>
  {{ partial "head.html" . }}
</head>
@z

@x
<body
  class="flex h-max flex-col divide-y divide-divider-light bg-background-light text-base dark:divide-divider-dark dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="flex w-full min-h-screen flex-col gap-4 items-stretch self-center">
    <div id="sidebar"
      class="hidden z-10 top-16 h-full md:fixed md:w-screen md:hidden bg-gray-light-100 dark:bg-gray-dark-100">
      {{ partial "sidebar.html" . }}
    </div>
    <div class="flex w-[1200px] flex-col gap-4 items-stretch self-center py-6 lg:w-full">
      <div class="flex flex-col items-center p-6">
        <h1 class="py-2 text-center text-3xl md:text-2xl">
          What can we help you find?
        </h1>
      </div>
@y
<body
  class="flex h-max flex-col divide-y divide-divider-light bg-background-light text-base dark:divide-divider-dark dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="flex w-full min-h-screen flex-col gap-4 items-stretch self-center">
    <div id="sidebar"
      class="hidden z-10 top-16 h-full md:fixed md:w-screen md:hidden bg-gray-light-100 dark:bg-gray-dark-100">
      {{ partial "sidebar.html" . }}
    </div>
    <div class="flex w-[1200px] flex-col gap-4 items-stretch self-center py-6 lg:w-full">
      <div class="flex flex-col items-center p-6">
        <h1 class="py-2 text-center text-3xl md:text-2xl">
          お探しのものは何ですか？
        </h1><br/>
        <div align="center">暫定公開中 __THISDATE__<br/>(<a href="https://github.com/docker/docs/commit/__COMMITHASH__">github.com/docker/docs@__COMMITHASH__ 対応, __COMMITDATE__</a>)</div>
      </div>
@z

@x
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        {{ range .Params.grid }}
        <div>
          <a class="h-full" href="{{ .link }}">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <img class="hidden w-[64px] dark:block" src="{{ .image.dark }}" />
                <img class="w-[64px] dark:hidden" src="{{ .image.light }}" />
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    {{ .title }}
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                {{ .description | markdownify }}
              </div>
            </div>
          </a>
        </div>
        {{ end }}
      </div>
@y
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        {{ range .Params.grid }}
        <div>
          <a class="h-full" href="{{ .link }}">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <img class="hidden w-[64px] dark:block" src="{{ .image.dark }}" />
                <img class="w-[64px] dark:hidden" src="{{ .image.light }}" />
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    {{ .title }}
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                {{ .description | markdownify }}
              </div>
            </div>
          </a>
        </div>
        {{ end }}
      </div>
@z

@x
      <div class="mx-6 bg-gradient-to-b from-black to-green-light-800 shadow-xl p-12 text-white grid gap-6 grid-cols-2 sm:grid-cols-1 items-center border border-green-light">
        <div>
          <svg class="max-w-[500px]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1612.62 198.34">
            <title>Docker Scout</title>
            <defs>
              <style>
                .cls-1,
                .cls-2 {
                  fill: #2e7f74;
                }
@y
      <div class="mx-6 bg-gradient-to-b from-black to-green-light-800 shadow-xl p-12 text-white grid gap-6 grid-cols-2 sm:grid-cols-1 items-center border border-green-light">
        <div>
          <svg class="max-w-[500px]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1612.62 198.34">
            <title>Docker Scout</title>
            <defs>
              <style>
                .cls-1,
                .cls-2 {
                  fill: #2e7f74;
                }
@z

@x
                .cls-2 {
                  opacity: .5;
                }
              </style>
            </defs>
            <g>
              <path class="cls-1"
                d="m1128.74,117.39c-6.68-3.61-15.77-6.41-27.29-8.4-8.44-1.53-14.93-3.26-19.46-5.18-4.53-1.92-7.68-4.1-9.44-6.56-1.77-2.45-2.65-5.37-2.65-8.75,0-4.91,2.45-8.94,7.37-12.09,4.91-3.14,11.36-4.72,19.34-4.72,6.29,0,11.89.96,16.81,2.88,4.91,1.92,9.29,4.95,13.12,9.09,1.84,2,4.1,3.22,6.79,3.68,2.68.46,5.03,0,7.02-1.38,2.3-1.38,3.57-3.26,3.8-5.64.23-2.38-.5-4.64-2.19-6.79-4.6-5.83-10.67-10.48-18.19-13.93-7.52-3.45-16.43-5.18-26.71-5.18-8.14,0-15.7,1.31-22.68,3.92-6.99,2.61-12.63,6.53-16.92,11.74-4.3,5.22-6.45,11.74-6.45,19.57,0,8.6,3.57,15.97,10.71,22.1,7.14,6.14,18.46,10.52,33.96,13.12,11.97,2,20.45,4.76,25.44,8.29,4.99,3.53,7.48,7.91,7.48,13.12-.15,5.38-2.73,9.87-7.71,13.47-4.99,3.61-12.78,5.41-23.37,5.41-7.22,0-13.82-1.19-19.8-3.57-5.99-2.38-10.67-5.56-14.05-9.56-1.69-1.84-3.8-2.91-6.33-3.22-2.53-.31-5.03.46-7.48,2.3-2.15,1.69-3.38,3.84-3.68,6.45-.31,2.61.46,4.92,2.3,6.91,5.37,5.84,12.55,10.33,21.53,13.47,8.98,3.15,18.23,4.72,27.75,4.72,10.13,0,18.88-1.61,26.25-4.84,7.37-3.22,13.08-7.56,17.15-13.01,4.07-5.45,6.1-11.78,6.1-19,0-5.83-1.42-11.13-4.26-15.89-2.84-4.76-7.6-8.94-14.28-12.55Z" />
              <path class="cls-1"
                d="m1238.23,59.83c-7.83-3.6-16.35-5.41-25.56-5.41-11.97,0-22.53,2.8-31.66,8.41-9.13,5.6-16.35,13.24-21.64,22.91-5.3,9.67-7.94,20.65-7.94,32.93s2.72,23.03,8.17,32.7c5.45,9.67,12.93,17.31,22.45,22.91,9.52,5.61,20.34,8.4,32.47,8.4,16.73,0,30.7-5.14,41.91-15.43,1.84-1.84,2.61-3.91,2.3-6.22-.31-2.3-1.46-4.38-3.45-6.22-1.84-1.38-3.84-1.99-5.99-1.84-2.15.15-4.3,1.08-6.45,2.76-3.68,3.22-7.87,5.61-12.55,7.14-4.68,1.54-9.94,2.3-15.77,2.3-8.6,0-16.23-2.03-22.91-6.1-6.68-4.07-11.9-9.59-15.66-16.58-3.76-6.98-5.64-14.93-5.64-23.83s1.76-17.31,5.3-24.29c3.53-6.98,8.48-12.47,14.85-16.46,6.37-3.99,13.78-5.99,22.22-5.99,12.74,0,23.33,4.76,31.78,14.28,1.84,2,3.88,3.19,6.1,3.57,2.22.39,4.26-.04,6.1-1.27,2.3-1.69,3.72-3.64,4.26-5.87.54-2.22-.12-4.41-1.96-6.56-5.99-7.21-12.89-12.62-20.72-16.23Z" />
              <path class="cls-1"
                d="m1366.02,62.71c-9.52-5.53-20.42-8.29-32.7-8.29s-23.45,2.76-33.04,8.29c-9.6,5.53-17.15,13.12-22.68,22.79s-8.29,20.72-8.29,33.16,2.76,23.26,8.29,32.93,13.08,17.27,22.68,22.8c9.59,5.53,20.61,8.29,33.04,8.29s23.22-2.76,32.81-8.29c9.59-5.53,17.15-13.12,22.68-22.8,5.53-9.67,8.29-20.64,8.29-32.93-.16-12.43-2.99-23.49-8.52-33.16s-13.05-17.27-22.57-22.79Zm6.22,79.78c-3.84,6.99-9.13,12.51-15.89,16.58-6.76,4.07-14.43,6.1-23.03,6.1s-16.31-2.03-23.14-6.1c-6.83-4.07-12.2-9.59-16.12-16.58-3.91-6.98-5.87-14.93-5.87-23.83s1.96-16.88,5.87-23.95c3.91-7.06,9.29-12.62,16.12-16.69,6.83-4.07,14.54-6.1,23.14-6.1s16.27,2.04,23.03,6.1c6.75,4.07,12.05,9.64,15.89,16.69,3.83,7.06,5.76,15.05,5.76,23.95s-1.92,16.85-5.76,23.83Z" />
              <path class="cls-1"
                d="m1517.07,55.57c-2.92,0-5.26.89-7.02,2.65-1.77,1.77-2.65,4.11-2.65,7.02v67.01c0,6.3-1.69,11.86-5.07,16.69-3.38,4.84-7.98,8.67-13.82,11.51-5.84,2.84-12.36,4.26-19.57,4.26s-14.28-1.5-20.26-4.49c-5.99-2.99-10.75-7.44-14.28-13.36-3.53-5.91-5.3-13.55-5.3-22.91v-58.72c0-2.76-.92-5.07-2.76-6.91-1.84-1.84-4.14-2.76-6.91-2.76s-5.07.92-6.91,2.76-2.76,4.14-2.76,6.91v58.72c0,12.74,2.45,23.49,7.37,32.24,4.91,8.75,11.63,15.39,20.15,19.92,8.52,4.53,18.23,6.79,29.13,6.79,9.98,0,19.03-2.22,27.17-6.68,5.34-2.92,9.93-6.53,13.82-10.8v6.2c0,3.07.88,5.49,2.65,7.25,1.76,1.77,4.11,2.65,7.02,2.65s5.3-.88,7.14-2.65c1.84-1.76,2.76-4.18,2.76-7.25v-106.38c0-2.91-.92-5.26-2.76-7.02-1.84-1.76-4.22-2.65-7.14-2.65Z" />
              <path class="cls-1"
                d="m1610.09,164.94c-1.69-1.84-3.76-2.76-6.22-2.76h-6.91c-6.45,0-11.78-2.38-16-7.14-4.22-4.76-6.33-10.74-6.33-17.96v-60.1h23.95c2.61,0,4.76-.81,6.45-2.42,1.69-1.61,2.53-3.57,2.53-5.87,0-2.45-.85-4.49-2.53-6.1-1.69-1.61-3.84-2.42-6.45-2.42h-23.95V25.18c0-2.76-.92-5.07-2.76-6.91-1.84-1.84-4.14-2.76-6.91-2.76-2.92,0-5.26.92-7.02,2.76-1.77,1.84-2.65,4.14-2.65,6.91v35h-13.59c-2.61,0-4.76.81-6.45,2.42-1.69,1.61-2.53,3.65-2.53,6.1,0,2.3.84,4.26,2.53,5.87,1.69,1.61,3.84,2.42,6.45,2.42h13.59v60.1c0,8.44,1.8,16.04,5.41,22.8,3.6,6.76,8.56,12.05,14.85,15.89,6.29,3.84,13.43,5.76,21.41,5.76h4.61c3.22,0,5.87-.88,7.94-2.65,2.07-1.76,3.11-4.1,3.11-7.02,0-2.76-.84-5.07-2.53-6.91Z" />
            </g>
            <path class="cls-1"
              d="m379.9.04c-3.34,0-6.06,1.13-8.24,3.34-2.18,2.21-3.26,5.05-3.26,8.43v56.47c-11.21-9.26-24.14-13.94-38.85-13.94-17.1,0-31.73,6.18-43.84,18.57-12.11,12.35-18.13,27.3-18.13,44.82s6.06,32.43,18.13,44.82c12.11,12.35,26.7,18.57,43.84,18.57s31.56-6.18,43.84-18.57c12.11-12.23,18.13-27.17,18.13-44.82V11.81c0-3.38-1.11-6.22-3.38-8.43-2.27-2.21-4.99-3.34-8.24-3.34Zm-14.54,133.06c-2.02,4.8-4.78,9.02-8.28,12.61-3.5,3.63-7.62,6.47-12.32,8.6-4.74,2.13-9.76,3.17-15.16,3.17s-10.55-1.04-15.29-3.17c-4.74-2.13-8.82-4.97-12.28-8.56-3.46-3.59-6.22-7.8-8.24-12.6-2.02-4.84-3.05-9.98-3.05-15.4s1.03-10.56,3.05-15.4c2.02-4.84,4.78-9.01,8.24-12.6,3.46-3.59,7.58-6.43,12.28-8.56,4.74-2.13,9.81-3.17,15.29-3.17s10.42,1.04,15.16,3.17c4.74,2.13,8.82,4.97,12.32,8.6s6.26,7.85,8.28,12.6c2.02,4.8,3.05,9.89,3.05,15.32s-1.03,10.56-3.05,15.32v.08Zm521.1-60.14c-12.24-12.35-26.87-18.57-43.84-18.57s-31.73,6.18-43.84,18.57c-12.11,12.35-18.13,27.3-18.13,44.83s6.06,32.43,18.13,44.82c12.11,12.35,26.7,18.57,43.84,18.57,15.57,0,29.04-5.13,40.5-15.4,2.22-2.34,3.34-5.18,3.34-8.47s-1.07-6.22-3.26-8.43c-2.18-2.21-4.94-3.34-8.24-3.34-2.88.08-5.44,1.04-7.62,2.96-3.46,3.01-7.21,5.3-11.29,6.8-4.08,1.5-8.53,2.25-13.39,2.25-4.29,0-8.41-.67-12.32-2.04-3.92-1.38-7.58-3.26-10.84-5.72-3.3-2.46-6.14-5.38-8.57-8.85-2.43-3.42-4.28-7.22-5.52-11.39h87.64c3.25,0,5.97-1.13,8.24-3.34,2.27-2.21,3.38-5.05,3.38-8.43,0-8.76-1.53-16.9-4.53-24.37-3.01-7.51-7.59-14.32-13.6-20.41l-.08-.04Zm-81.13,33.06c1.2-4.13,3.01-7.93,5.44-11.39,2.43-3.42,5.31-6.39,8.61-8.85,3.34-2.46,6.96-4.34,10.96-5.72,3.99-1.38,8.07-2.04,12.28-2.04s8.28.67,12.23,2.04c3.96,1.38,7.59,3.26,10.84,5.72,3.3,2.46,6.18,5.38,8.61,8.85,2.47,3.42,4.33,7.22,5.61,11.39h-74.58Zm202.51-43.7c-2.06-2.04-4.66-3.63-7.79-4.8-3.13-1.17-6.55-1.96-10.3-2.42-3.71-.46-7.21-.67-10.46-.67-7.38,0-14.3,1.21-20.81,3.63-6.51,2.42-12.53,5.88-18.05,10.39v-2.25c0-3.26-1.11-6.01-3.38-8.31-2.26-2.29-4.94-3.46-8.11-3.46s-5.98,1.17-8.24,3.46c-2.27,2.3-3.38,5.09-3.38,8.31v103.21c0,3.26,1.11,6.01,3.38,8.3,2.26,2.3,4.98,3.46,8.24,3.46s5.89-1.17,8.11-3.46c2.27-2.29,3.38-5.09,3.38-8.3v-51.63c0-5.51,1.03-10.69,3.05-15.53,2.02-4.84,4.78-9.01,8.28-12.6,3.51-3.59,7.63-6.43,12.32-8.47,4.74-2.09,9.77-3.13,15.17-3.13s10.5.96,15.16,2.84c1.85.83,3.46,1.25,4.86,1.25,1.61,0,3.13-.29,4.53-.92,1.4-.63,2.64-1.46,3.67-2.55,1.03-1.08,1.85-2.34,2.47-3.8.62-1.42.95-2.96.95-4.63,0-3.25-1.03-5.88-3.09-7.93h.04Zm-497.36,10.64c-12.24-12.35-26.86-18.57-43.84-18.57s-31.73,6.18-43.84,18.57c-12.11,12.35-18.13,27.3-18.13,44.83s6.06,32.43,18.13,44.82c12.11,12.35,26.7,18.57,43.84,18.57s31.56-6.18,43.84-18.57c12.11-12.23,18.13-27.17,18.13-44.82-.08-8.76-1.61-16.86-4.57-24.33-3.01-7.47-7.5-14.32-13.56-20.49Zm-8.03,60.14c-2.02,4.8-4.78,9.02-8.28,12.61-3.5,3.63-7.62,6.47-12.32,8.6-4.7,2.13-9.77,3.17-15.16,3.17s-10.55-1.04-15.29-3.17c-4.74-2.13-8.82-4.97-12.28-8.56-3.46-3.59-6.22-7.8-8.24-12.6-2.02-4.84-3.05-9.98-3.05-15.4s1.03-10.56,3.05-15.4c2.02-4.84,4.78-9.01,8.24-12.6,3.46-3.59,7.58-6.43,12.28-8.56,4.74-2.13,9.81-3.17,15.29-3.17s10.42,1.04,15.16,3.17c4.74,2.13,8.82,4.97,12.32,8.6s6.26,7.85,8.28,12.6c2.02,4.8,3.05,9.89,3.05,15.32s-1.03,10.56-3.05,15.32v.08Zm265.68-66.94c0-1.59-.33-3.09-.95-4.51-.62-1.42-1.44-2.71-2.47-3.8-1.03-1.09-2.27-1.96-3.67-2.55-1.4-.58-2.92-.92-4.53-.92-2.31,0-4.37.59-6.18,1.79l-66.17,44.03V11.9c0-3.34-1.11-6.14-3.38-8.43s-4.94-3.46-8.12-3.46-5.97,1.17-8.24,3.46c-2.27,2.3-3.38,5.09-3.38,8.43v157.35c0,3.26,1.11,6.05,3.38,8.39,2.27,2.34,4.99,3.51,8.24,3.51s5.89-1.17,8.12-3.51c2.27-2.34,3.38-5.13,3.38-8.39v-40.86l13.51-9.06,51.13,58.72c2.06,2.04,4.66,3.05,7.75,3.05,1.61,0,3.13-.29,4.53-.92,1.4-.58,2.64-1.46,3.67-2.55,1.03-1.09,1.85-2.34,2.47-3.8.62-1.42.95-2.96.95-4.51,0-3.09-1.07-5.84-3.21-8.26l-47.59-54.8,46.35-30.8c2.97-2.04,4.41-5.17,4.41-9.39v.08Zm-192.13,23.5c3.54-3.59,7.66-6.43,12.4-8.47,4.74-2.09,9.77-3.13,15.16-3.13,4.86,0,9.35.83,13.52,2.5,4.12,1.67,8.08,4.13,11.83,7.35,2.22,1.79,4.74,2.71,7.54,2.71,3.34,0,6.06-1.13,8.24-3.38,2.18-2.25,3.26-5.09,3.26-8.47s-1.32-6.51-4-8.93c-11.37-10.27-24.85-15.4-40.38-15.4-17.1,0-31.73,6.18-43.84,18.57-12.11,12.35-18.13,27.29-18.13,44.82s6.06,32.43,18.13,44.82c12.11,12.35,26.7,18.57,43.84,18.57,15.49,0,28.97-5.13,40.38-15.4,2.43-2.5,3.67-5.38,3.67-8.72s-1.07-6.22-3.26-8.43c-2.18-2.21-4.94-3.34-8.24-3.34-2.8.08-5.23.92-7.29,2.5-3.71,3.26-7.58,5.68-11.74,7.3-4.12,1.63-8.61,2.42-13.52,2.42-5.4,0-10.42-1.04-15.16-3.13-4.74-2.09-8.86-4.92-12.4-8.47-3.54-3.55-6.34-7.81-8.36-12.6-2.02-4.84-3.05-10.02-3.05-15.53s1.03-10.68,3.05-15.53c2.02-4.84,4.82-9.01,8.36-12.6v-.04Z" />
            <path class="cls-1"
              d="m987.34,171.54c0,5.27-4.14,9.41-9.52,9.41s-9.58-4.14-9.58-9.41,4.25-9.29,9.58-9.29,9.52,4.14,9.52,9.29Zm-16.72,0c0,4.14,3.06,7.42,7.25,7.42s7.08-3.29,7.08-7.37-3.01-7.48-7.14-7.48-7.2,3.35-7.2,7.42Zm5.73,4.87h-2.15v-9.29c.85-.17,2.04-.29,3.57-.29,1.76,0,2.55.29,3.23.68.51.4.91,1.13.91,2.04,0,1.02-.79,1.81-1.92,2.15v.11c.9.34,1.41,1.02,1.7,2.26.28,1.42.45,1.98.68,2.32h-2.32c-.29-.34-.46-1.19-.74-2.27-.17-1.02-.74-1.47-1.93-1.47h-1.02v3.74Zm.06-5.27h1.02c1.19,0,2.15-.4,2.15-1.36,0-.85-.62-1.42-1.98-1.42-.57,0-.96.06-1.19.12v2.66Z" />
            <g>
              <path class="cls-1"
                d="m161.11,91.56c19.53-39.81,22.79-77.13,22.79-77.13,0,0-37.33,3.27-77.15,22.8,27.13,5.79,48.55,27.2,54.36,54.32Z" />
              <path class="cls-2"
                d="m161.1,121.26c-5.91,27.5-27.88,49.11-55.57,54.51l2.03,2.03c7.6,7.6,17.56,11.4,27.52,11.4s19.92-3.8,27.52-11.4c15.2-15.2,15.2-39.84,0-55.04l-1.51-1.51Z" />
              <path class="cls-1"
                d="m134.7,106.38c0-4.83-.8-9.48-2.29-13.81-4.27-12.47-14.15-22.35-26.62-26.62-4.34-1.49-8.98-2.29-13.81-2.29-23.56,0-42.73,19.17-42.73,42.72,0,5.79,1.16,11.32,3.26,16.37,4.34,10.41,12.68,18.76,23.09,23.09,5.05,2.1,10.57,3.26,16.37,3.26,23.56,0,42.72-19.17,42.72-42.72Z" />
              <path class="cls-2"
                d="m22.59,92.83c5.39-27.69,27.01-49.65,54.51-55.57l-1.43-1.43c-15.2-15.2-39.84-15.2-55.04,0-15.2,15.2-15.2,39.84,0,55.04l1.96,1.96Z" />
              <path class="cls-1"
                d="m22.83,121.14C3.27,160.98,0,198.34,0,198.34c0,0,37.36-3.27,77.19-22.82-27.15-5.8-48.57-27.23-54.36-54.38Z" />
            </g>
          </svg>
        </div>
        <div class="flex flex-col gap-4">
          <p>
            Docker Scout secures the complete software supply chain by providing image
            analysis, real-time vulnerability identification, contextual remediation
            recommendations, and more. Now generally available.
          </p>
          <div class="flex gap-4">
            <a href="/scout/"
              class="transition cursor-pointer duration-300 py-2 px-4 rounded bg-green-dark hover:bg-green-light-600 text-white">Docs</a>
            <a href="/scout/release-notes/"
              class="transition cursor-pointer duration-300 py-2 px-4 rounded bg-green-dark hover:bg-green-light-600 text-white">Release notes</a>
          </div>
        </div>
      </div>
    </div>
@y
                .cls-2 {
                  opacity: .5;
                }
              </style>
            </defs>
            <g>
              <path class="cls-1"
                d="m1128.74,117.39c-6.68-3.61-15.77-6.41-27.29-8.4-8.44-1.53-14.93-3.26-19.46-5.18-4.53-1.92-7.68-4.1-9.44-6.56-1.77-2.45-2.65-5.37-2.65-8.75,0-4.91,2.45-8.94,7.37-12.09,4.91-3.14,11.36-4.72,19.34-4.72,6.29,0,11.89.96,16.81,2.88,4.91,1.92,9.29,4.95,13.12,9.09,1.84,2,4.1,3.22,6.79,3.68,2.68.46,5.03,0,7.02-1.38,2.3-1.38,3.57-3.26,3.8-5.64.23-2.38-.5-4.64-2.19-6.79-4.6-5.83-10.67-10.48-18.19-13.93-7.52-3.45-16.43-5.18-26.71-5.18-8.14,0-15.7,1.31-22.68,3.92-6.99,2.61-12.63,6.53-16.92,11.74-4.3,5.22-6.45,11.74-6.45,19.57,0,8.6,3.57,15.97,10.71,22.1,7.14,6.14,18.46,10.52,33.96,13.12,11.97,2,20.45,4.76,25.44,8.29,4.99,3.53,7.48,7.91,7.48,13.12-.15,5.38-2.73,9.87-7.71,13.47-4.99,3.61-12.78,5.41-23.37,5.41-7.22,0-13.82-1.19-19.8-3.57-5.99-2.38-10.67-5.56-14.05-9.56-1.69-1.84-3.8-2.91-6.33-3.22-2.53-.31-5.03.46-7.48,2.3-2.15,1.69-3.38,3.84-3.68,6.45-.31,2.61.46,4.92,2.3,6.91,5.37,5.84,12.55,10.33,21.53,13.47,8.98,3.15,18.23,4.72,27.75,4.72,10.13,0,18.88-1.61,26.25-4.84,7.37-3.22,13.08-7.56,17.15-13.01,4.07-5.45,6.1-11.78,6.1-19,0-5.83-1.42-11.13-4.26-15.89-2.84-4.76-7.6-8.94-14.28-12.55Z" />
              <path class="cls-1"
                d="m1238.23,59.83c-7.83-3.6-16.35-5.41-25.56-5.41-11.97,0-22.53,2.8-31.66,8.41-9.13,5.6-16.35,13.24-21.64,22.91-5.3,9.67-7.94,20.65-7.94,32.93s2.72,23.03,8.17,32.7c5.45,9.67,12.93,17.31,22.45,22.91,9.52,5.61,20.34,8.4,32.47,8.4,16.73,0,30.7-5.14,41.91-15.43,1.84-1.84,2.61-3.91,2.3-6.22-.31-2.3-1.46-4.38-3.45-6.22-1.84-1.38-3.84-1.99-5.99-1.84-2.15.15-4.3,1.08-6.45,2.76-3.68,3.22-7.87,5.61-12.55,7.14-4.68,1.54-9.94,2.3-15.77,2.3-8.6,0-16.23-2.03-22.91-6.1-6.68-4.07-11.9-9.59-15.66-16.58-3.76-6.98-5.64-14.93-5.64-23.83s1.76-17.31,5.3-24.29c3.53-6.98,8.48-12.47,14.85-16.46,6.37-3.99,13.78-5.99,22.22-5.99,12.74,0,23.33,4.76,31.78,14.28,1.84,2,3.88,3.19,6.1,3.57,2.22.39,4.26-.04,6.1-1.27,2.3-1.69,3.72-3.64,4.26-5.87.54-2.22-.12-4.41-1.96-6.56-5.99-7.21-12.89-12.62-20.72-16.23Z" />
              <path class="cls-1"
                d="m1366.02,62.71c-9.52-5.53-20.42-8.29-32.7-8.29s-23.45,2.76-33.04,8.29c-9.6,5.53-17.15,13.12-22.68,22.79s-8.29,20.72-8.29,33.16,2.76,23.26,8.29,32.93,13.08,17.27,22.68,22.8c9.59,5.53,20.61,8.29,33.04,8.29s23.22-2.76,32.81-8.29c9.59-5.53,17.15-13.12,22.68-22.8,5.53-9.67,8.29-20.64,8.29-32.93-.16-12.43-2.99-23.49-8.52-33.16s-13.05-17.27-22.57-22.79Zm6.22,79.78c-3.84,6.99-9.13,12.51-15.89,16.58-6.76,4.07-14.43,6.1-23.03,6.1s-16.31-2.03-23.14-6.1c-6.83-4.07-12.2-9.59-16.12-16.58-3.91-6.98-5.87-14.93-5.87-23.83s1.96-16.88,5.87-23.95c3.91-7.06,9.29-12.62,16.12-16.69,6.83-4.07,14.54-6.1,23.14-6.1s16.27,2.04,23.03,6.1c6.75,4.07,12.05,9.64,15.89,16.69,3.83,7.06,5.76,15.05,5.76,23.95s-1.92,16.85-5.76,23.83Z" />
              <path class="cls-1"
                d="m1517.07,55.57c-2.92,0-5.26.89-7.02,2.65-1.77,1.77-2.65,4.11-2.65,7.02v67.01c0,6.3-1.69,11.86-5.07,16.69-3.38,4.84-7.98,8.67-13.82,11.51-5.84,2.84-12.36,4.26-19.57,4.26s-14.28-1.5-20.26-4.49c-5.99-2.99-10.75-7.44-14.28-13.36-3.53-5.91-5.3-13.55-5.3-22.91v-58.72c0-2.76-.92-5.07-2.76-6.91-1.84-1.84-4.14-2.76-6.91-2.76s-5.07.92-6.91,2.76-2.76,4.14-2.76,6.91v58.72c0,12.74,2.45,23.49,7.37,32.24,4.91,8.75,11.63,15.39,20.15,19.92,8.52,4.53,18.23,6.79,29.13,6.79,9.98,0,19.03-2.22,27.17-6.68,5.34-2.92,9.93-6.53,13.82-10.8v6.2c0,3.07.88,5.49,2.65,7.25,1.76,1.77,4.11,2.65,7.02,2.65s5.3-.88,7.14-2.65c1.84-1.76,2.76-4.18,2.76-7.25v-106.38c0-2.91-.92-5.26-2.76-7.02-1.84-1.76-4.22-2.65-7.14-2.65Z" />
              <path class="cls-1"
                d="m1610.09,164.94c-1.69-1.84-3.76-2.76-6.22-2.76h-6.91c-6.45,0-11.78-2.38-16-7.14-4.22-4.76-6.33-10.74-6.33-17.96v-60.1h23.95c2.61,0,4.76-.81,6.45-2.42,1.69-1.61,2.53-3.57,2.53-5.87,0-2.45-.85-4.49-2.53-6.1-1.69-1.61-3.84-2.42-6.45-2.42h-23.95V25.18c0-2.76-.92-5.07-2.76-6.91-1.84-1.84-4.14-2.76-6.91-2.76-2.92,0-5.26.92-7.02,2.76-1.77,1.84-2.65,4.14-2.65,6.91v35h-13.59c-2.61,0-4.76.81-6.45,2.42-1.69,1.61-2.53,3.65-2.53,6.1,0,2.3.84,4.26,2.53,5.87,1.69,1.61,3.84,2.42,6.45,2.42h13.59v60.1c0,8.44,1.8,16.04,5.41,22.8,3.6,6.76,8.56,12.05,14.85,15.89,6.29,3.84,13.43,5.76,21.41,5.76h4.61c3.22,0,5.87-.88,7.94-2.65,2.07-1.76,3.11-4.1,3.11-7.02,0-2.76-.84-5.07-2.53-6.91Z" />
            </g>
            <path class="cls-1"
              d="m379.9.04c-3.34,0-6.06,1.13-8.24,3.34-2.18,2.21-3.26,5.05-3.26,8.43v56.47c-11.21-9.26-24.14-13.94-38.85-13.94-17.1,0-31.73,6.18-43.84,18.57-12.11,12.35-18.13,27.3-18.13,44.82s6.06,32.43,18.13,44.82c12.11,12.35,26.7,18.57,43.84,18.57s31.56-6.18,43.84-18.57c12.11-12.23,18.13-27.17,18.13-44.82V11.81c0-3.38-1.11-6.22-3.38-8.43-2.27-2.21-4.99-3.34-8.24-3.34Zm-14.54,133.06c-2.02,4.8-4.78,9.02-8.28,12.61-3.5,3.63-7.62,6.47-12.32,8.6-4.74,2.13-9.76,3.17-15.16,3.17s-10.55-1.04-15.29-3.17c-4.74-2.13-8.82-4.97-12.28-8.56-3.46-3.59-6.22-7.8-8.24-12.6-2.02-4.84-3.05-9.98-3.05-15.4s1.03-10.56,3.05-15.4c2.02-4.84,4.78-9.01,8.24-12.6,3.46-3.59,7.58-6.43,12.28-8.56,4.74-2.13,9.81-3.17,15.29-3.17s10.42,1.04,15.16,3.17c4.74,2.13,8.82,4.97,12.32,8.6s6.26,7.85,8.28,12.6c2.02,4.8,3.05,9.89,3.05,15.32s-1.03,10.56-3.05,15.32v.08Zm521.1-60.14c-12.24-12.35-26.87-18.57-43.84-18.57s-31.73,6.18-43.84,18.57c-12.11,12.35-18.13,27.3-18.13,44.83s6.06,32.43,18.13,44.82c12.11,12.35,26.7,18.57,43.84,18.57,15.57,0,29.04-5.13,40.5-15.4,2.22-2.34,3.34-5.18,3.34-8.47s-1.07-6.22-3.26-8.43c-2.18-2.21-4.94-3.34-8.24-3.34-2.88.08-5.44,1.04-7.62,2.96-3.46,3.01-7.21,5.3-11.29,6.8-4.08,1.5-8.53,2.25-13.39,2.25-4.29,0-8.41-.67-12.32-2.04-3.92-1.38-7.58-3.26-10.84-5.72-3.3-2.46-6.14-5.38-8.57-8.85-2.43-3.42-4.28-7.22-5.52-11.39h87.64c3.25,0,5.97-1.13,8.24-3.34,2.27-2.21,3.38-5.05,3.38-8.43,0-8.76-1.53-16.9-4.53-24.37-3.01-7.51-7.59-14.32-13.6-20.41l-.08-.04Zm-81.13,33.06c1.2-4.13,3.01-7.93,5.44-11.39,2.43-3.42,5.31-6.39,8.61-8.85,3.34-2.46,6.96-4.34,10.96-5.72,3.99-1.38,8.07-2.04,12.28-2.04s8.28.67,12.23,2.04c3.96,1.38,7.59,3.26,10.84,5.72,3.3,2.46,6.18,5.38,8.61,8.85,2.47,3.42,4.33,7.22,5.61,11.39h-74.58Zm202.51-43.7c-2.06-2.04-4.66-3.63-7.79-4.8-3.13-1.17-6.55-1.96-10.3-2.42-3.71-.46-7.21-.67-10.46-.67-7.38,0-14.3,1.21-20.81,3.63-6.51,2.42-12.53,5.88-18.05,10.39v-2.25c0-3.26-1.11-6.01-3.38-8.31-2.26-2.29-4.94-3.46-8.11-3.46s-5.98,1.17-8.24,3.46c-2.27,2.3-3.38,5.09-3.38,8.31v103.21c0,3.26,1.11,6.01,3.38,8.3,2.26,2.3,4.98,3.46,8.24,3.46s5.89-1.17,8.11-3.46c2.27-2.29,3.38-5.09,3.38-8.3v-51.63c0-5.51,1.03-10.69,3.05-15.53,2.02-4.84,4.78-9.01,8.28-12.6,3.51-3.59,7.63-6.43,12.32-8.47,4.74-2.09,9.77-3.13,15.17-3.13s10.5.96,15.16,2.84c1.85.83,3.46,1.25,4.86,1.25,1.61,0,3.13-.29,4.53-.92,1.4-.63,2.64-1.46,3.67-2.55,1.03-1.08,1.85-2.34,2.47-3.8.62-1.42.95-2.96.95-4.63,0-3.25-1.03-5.88-3.09-7.93h.04Zm-497.36,10.64c-12.24-12.35-26.86-18.57-43.84-18.57s-31.73,6.18-43.84,18.57c-12.11,12.35-18.13,27.3-18.13,44.83s6.06,32.43,18.13,44.82c12.11,12.35,26.7,18.57,43.84,18.57s31.56-6.18,43.84-18.57c12.11-12.23,18.13-27.17,18.13-44.82-.08-8.76-1.61-16.86-4.57-24.33-3.01-7.47-7.5-14.32-13.56-20.49Zm-8.03,60.14c-2.02,4.8-4.78,9.02-8.28,12.61-3.5,3.63-7.62,6.47-12.32,8.6-4.7,2.13-9.77,3.17-15.16,3.17s-10.55-1.04-15.29-3.17c-4.74-2.13-8.82-4.97-12.28-8.56-3.46-3.59-6.22-7.8-8.24-12.6-2.02-4.84-3.05-9.98-3.05-15.4s1.03-10.56,3.05-15.4c2.02-4.84,4.78-9.01,8.24-12.6,3.46-3.59,7.58-6.43,12.28-8.56,4.74-2.13,9.81-3.17,15.29-3.17s10.42,1.04,15.16,3.17c4.74,2.13,8.82,4.97,12.32,8.6s6.26,7.85,8.28,12.6c2.02,4.8,3.05,9.89,3.05,15.32s-1.03,10.56-3.05,15.32v.08Zm265.68-66.94c0-1.59-.33-3.09-.95-4.51-.62-1.42-1.44-2.71-2.47-3.8-1.03-1.09-2.27-1.96-3.67-2.55-1.4-.58-2.92-.92-4.53-.92-2.31,0-4.37.59-6.18,1.79l-66.17,44.03V11.9c0-3.34-1.11-6.14-3.38-8.43s-4.94-3.46-8.12-3.46-5.97,1.17-8.24,3.46c-2.27,2.3-3.38,5.09-3.38,8.43v157.35c0,3.26,1.11,6.05,3.38,8.39,2.27,2.34,4.99,3.51,8.24,3.51s5.89-1.17,8.12-3.51c2.27-2.34,3.38-5.13,3.38-8.39v-40.86l13.51-9.06,51.13,58.72c2.06,2.04,4.66,3.05,7.75,3.05,1.61,0,3.13-.29,4.53-.92,1.4-.58,2.64-1.46,3.67-2.55,1.03-1.09,1.85-2.34,2.47-3.8.62-1.42.95-2.96.95-4.51,0-3.09-1.07-5.84-3.21-8.26l-47.59-54.8,46.35-30.8c2.97-2.04,4.41-5.17,4.41-9.39v.08Zm-192.13,23.5c3.54-3.59,7.66-6.43,12.4-8.47,4.74-2.09,9.77-3.13,15.16-3.13,4.86,0,9.35.83,13.52,2.5,4.12,1.67,8.08,4.13,11.83,7.35,2.22,1.79,4.74,2.71,7.54,2.71,3.34,0,6.06-1.13,8.24-3.38,2.18-2.25,3.26-5.09,3.26-8.47s-1.32-6.51-4-8.93c-11.37-10.27-24.85-15.4-40.38-15.4-17.1,0-31.73,6.18-43.84,18.57-12.11,12.35-18.13,27.29-18.13,44.82s6.06,32.43,18.13,44.82c12.11,12.35,26.7,18.57,43.84,18.57,15.49,0,28.97-5.13,40.38-15.4,2.43-2.5,3.67-5.38,3.67-8.72s-1.07-6.22-3.26-8.43c-2.18-2.21-4.94-3.34-8.24-3.34-2.8.08-5.23.92-7.29,2.5-3.71,3.26-7.58,5.68-11.74,7.3-4.12,1.63-8.61,2.42-13.52,2.42-5.4,0-10.42-1.04-15.16-3.13-4.74-2.09-8.86-4.92-12.4-8.47-3.54-3.55-6.34-7.81-8.36-12.6-2.02-4.84-3.05-10.02-3.05-15.53s1.03-10.68,3.05-15.53c2.02-4.84,4.82-9.01,8.36-12.6v-.04Z" />
            <path class="cls-1"
              d="m987.34,171.54c0,5.27-4.14,9.41-9.52,9.41s-9.58-4.14-9.58-9.41,4.25-9.29,9.58-9.29,9.52,4.14,9.52,9.29Zm-16.72,0c0,4.14,3.06,7.42,7.25,7.42s7.08-3.29,7.08-7.37-3.01-7.48-7.14-7.48-7.2,3.35-7.2,7.42Zm5.73,4.87h-2.15v-9.29c.85-.17,2.04-.29,3.57-.29,1.76,0,2.55.29,3.23.68.51.4.91,1.13.91,2.04,0,1.02-.79,1.81-1.92,2.15v.11c.9.34,1.41,1.02,1.7,2.26.28,1.42.45,1.98.68,2.32h-2.32c-.29-.34-.46-1.19-.74-2.27-.17-1.02-.74-1.47-1.93-1.47h-1.02v3.74Zm.06-5.27h1.02c1.19,0,2.15-.4,2.15-1.36,0-.85-.62-1.42-1.98-1.42-.57,0-.96.06-1.19.12v2.66Z" />
            <g>
              <path class="cls-1"
                d="m161.11,91.56c19.53-39.81,22.79-77.13,22.79-77.13,0,0-37.33,3.27-77.15,22.8,27.13,5.79,48.55,27.2,54.36,54.32Z" />
              <path class="cls-2"
                d="m161.1,121.26c-5.91,27.5-27.88,49.11-55.57,54.51l2.03,2.03c7.6,7.6,17.56,11.4,27.52,11.4s19.92-3.8,27.52-11.4c15.2-15.2,15.2-39.84,0-55.04l-1.51-1.51Z" />
              <path class="cls-1"
                d="m134.7,106.38c0-4.83-.8-9.48-2.29-13.81-4.27-12.47-14.15-22.35-26.62-26.62-4.34-1.49-8.98-2.29-13.81-2.29-23.56,0-42.73,19.17-42.73,42.72,0,5.79,1.16,11.32,3.26,16.37,4.34,10.41,12.68,18.76,23.09,23.09,5.05,2.1,10.57,3.26,16.37,3.26,23.56,0,42.72-19.17,42.72-42.72Z" />
              <path class="cls-2"
                d="m22.59,92.83c5.39-27.69,27.01-49.65,54.51-55.57l-1.43-1.43c-15.2-15.2-39.84-15.2-55.04,0-15.2,15.2-15.2,39.84,0,55.04l1.96,1.96Z" />
              <path class="cls-1"
                d="m22.83,121.14C3.27,160.98,0,198.34,0,198.34c0,0,37.36-3.27,77.19-22.82-27.15-5.8-48.57-27.23-54.36-54.38Z" />
            </g>
          </svg>
        </div>
        <div class="flex flex-col gap-4">
          <p>
            Docker Scout secures the complete software supply chain by providing image
            analysis, real-time vulnerability identification, contextual remediation
            recommendations, and more. Now generally available.
          </p>
          <div class="flex gap-4">
            <a href="/scout/"
              class="transition cursor-pointer duration-300 py-2 px-4 rounded bg-green-dark hover:bg-green-light-600 text-white">Docs</a>
            <a href="/scout/release-notes/"
              class="transition cursor-pointer duration-300 py-2 px-4 rounded bg-green-dark hover:bg-green-light-600 text-white">Release notes</a>
          </div>
        </div>
      </div>
    </div>
@z

@x
    <div class="flex mx-auto w-[1200px] flex-col gap-4 p-6 lg:w-full">
      <div class="grid grid-cols-3 gap-4 sm:flex sm:flex-col xl:grid-cols-2">
        <div class="col-start-1 col-end-3 bg-white p-6 dark:bg-gray-dark-200">
          <div x-data="{ selected: 'explore' }" aria-role="tabpanel">
            <div aria-role="tablist" class="space-x-2">
              <button class="p-1" :class="selected === 'explore' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'explore'">
                Explore Docker
              </button>
              <button class="p-1" :class="selected === 'faq' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'faq'">
                Browse FAQs
              </button>
              <button class="p-1" :class="selected === 'support' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'support'">
                Get support
              </button>
            </div>
            <hr />
            <div>
              <div class="flex justify-items-center py-4 sm:flex-col" aria-role="tab"
                :class="selected !== 'explore' && 'hidden'">
                <ul class="w-full space-y-3">
                  <li>
                    <a class="link" href="/engine/reference/builder/">Write a Dockerfile</a>
                  </li>
                  <li>
                    <a class="link" href="/network/">Manage container networking</a>
                  </li>
                  <li>
                    <a class="link" href="/compose/compose-file/">Write a Docker Compose file</a>
                  </li>
                  <li>
                    <a class="link" href="/storage/">Work with volumes and mounts</a>
                  </li>
                  <li>
                    <a class="link" href="/get-started/04_sharing_app/">Share images on Docker Hub</a>
                  </li>
                </ul>
                <ul class="w-full space-y-3">
                  <li>
                    <a class="link" href="/config/daemon/">Configure the Docker daemon</a>
                  </li>
                  <li>
                    <a class="link" href="/get-started/02_our_app/">Build and run an image</a>
                  </li>
                  <li>
                    <a class="link" href="/config/labels-custom-metadata/">Manage Docker objects</a>
                  </li>
                  <li>
                    <a class="link" href="/build/building/multi-stage/">Multi-stage builds</a>
                  </li>
                </ul>
              </div>
              <div class="flex justify-items-center py-4 sm:flex-col" aria-role="tab"
                :class="selected !== 'faq' && 'hidden'">
                <div class="w-full">
                  <h2 class="text-lg mb-2">Common FAQs</h6>
                    <ul class="space-y-3">
                      <li>
                        <a class="link"
                          href="/desktop/faqs/general/#what-are-the-system-requirements-for-docker-desktop">What are the
                          system requirements for Docker Desktop?</a>
                      </li>
                      <li>
                        <a class="link" href="https://github.com/docker/awesome-compose" target="_blank"
                          rel="noopener">Where can I find example Compose files?</a>
                      </li>
                      <li>
                        <a class="link"
                          href="/desktop/faqs/general/#how-do-i-connect-from-a-container-to-a-service-on-the-host">How
                          do I connect from a container to a service?</a>
                      </li>
                      <li>
                        <a class="link" href="/get-started/04_sharing_app/">How do I share images on Docker Hub?</a>
                      </li>
                    </ul>
                </div>
                <div class="w-full">
                  <h2 class="text-lg mb-2">Products</h6>
                    <ul class="space-y-3">
                      <li>
                        <a class="link" href="/desktop/faqs/general/">Docker Desktop</a>
                      </li>
                      <li>
                        <a href="/desktop/faqs/macfaqs/" class="link">Docker Desktop for Mac</a>
                      </li>
                      <li>
                        <a class="link" href="/desktop/faqs/windowsfaqs/">Docker Desktop for Windows</a>
                      </li>
                      <li>
                        <a class="link" href="/desktop/faqs/linuxfaqs/">Docker Desktop for Linux</a>
                      </li>
                      <li>
                        <a class="link" href="/faq/security/single-sign-on/faqs/">Docker Single Sign-on</a>
                      </li>
                    </ul>
                </div>
              </div>
              <div class="flex" aria-role="tab" :class="selected !== 'support' && 'hidden'">
                <div class="w-full">
                  <ul class="py-4 space-y-3">
                    <li>
                      <a class="link" href="/support/">Get support</a>
                    </li>
                    <li>
                      <a class="link" href="https://dockercommunity.slack.com/" target="_blank" rel="noopener">Docker
                        community Slack</a>
                    </li>
                    <li>
                      <a class="link" href="https://docker.com/company/contact/" target="_blank" rel="noopener">Contact
                        Docker</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="bg-white p-6 space-y-3 dark:bg-gray-dark-200">
          <h2 class="text-xl mb-2">Popular videos</h2>
          <p>Watch the most popular videos from DockerCon.</p>
          <a class="link flex gap-4 items-center" href="https://youtu.be/gAGEar5HQoU">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>How to get started with Docker</p>
          </a>
          <a class="link flex gap-4 items-center" href="https://youtu.be/xmLVNpyJ530?t=30">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>How to to build and test your Docker images in the Cloud</p>
          </a>
          <a class="link flex gap-4 items-center" href="https://youtu.be/QeQ2MH5f_BE?t=31">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>Simplify all the things with Docker Compose</p>
          </a>
        </div>
      </div>
      <div class="bg-white p-6 dark:bg-gray-dark-200">
        <div x-data="{ selected: 'desktop' }" aria-role="tabpanel">
          <div aria-role="tablist" class="space-x-2">
            <button class="p-1" :class="selected === 'desktop' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'desktop'">
              Desktop
            </button>
            <button class="p-1" :class="selected === 'engine' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'engine'">
              Engine
            </button>
            <button class="p-1" :class="selected === 'build' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'build'">
              Build
            </button>
            <button class="p-1" :class="selected === 'compose' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'compose'">
              Compose
            </button>
            <button class="p-1" :class="selected === 'hub' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'hub'">
              Hub
            </button>
          </div>
          <hr />
          <div>
            <div x-data="{os: 'windows'}" class="flex gap-6 py-8 md:flex-col" aria-role="tab"
              :class="selected !== 'desktop' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/laptop.svg">
                <h2 class="text-xl">Docker Desktop</h2>
                <select class="p-2 rounded-sm bg-gray-light-100 dark:bg-gray-dark-100"
                  x-on:change="os = $event.target.value">
                  <option value="windows">Windows</option>
                  <option value="mac">Mac</option>
                  <option value="linux">Linux</option>
                </select>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Desktop</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3" x-show="os === 'windows'">
                  <li><a class="link" href="/desktop/windows/wsl/">Docker Desktop WSL 2 backend</a></li>
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                  <li><a class="link" href="/desktop/vm-vdi/">VM and VDI support</a></li>
                  <li><a class="link" href="/desktop/windows/release-notes/">Release notes</a></li>
                  <li><a class="link" href="/desktop/containerd/">containerd image store</a></li>
                </ul>
                <ul class="space-y-3" x-show="os === 'mac'">
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                  <li><a class="link" href="/desktop/install/mac-install/">Install Docker Desktop on Mac</a></li>
                  <li><a class="link" href="/desktop/release-notes/">Release notes</a></li>
                  <li><a class="link" href="/desktop/mac/permission-requirements/">Understand permission requirements</a></li>
                </ul>
                <ul class="space-y-3" x-show="os === 'linux'">
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                <li><a class="link" href="/desktop/install/linux-install/">Install Docker Desktop on Linux</a></li>
                <li><a class="link" href="/desktop/release-notes/">Release notes</a></li>
              </ul>
              </div>
            </div>
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'engine' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/engine.svg">
                <h2 class="text-xl">Docker Engine</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Engine</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/engine/install/ubuntu/">Install Docker Engine on
                      Ubuntu</a></li>
                  <li><a class="link" href="/engine/reference/commandline/run/">Run a command in
                      a container</a></li>
                  <li><a class="link" href="/engine/reference/builder/">Dockerfile reference</a>
                  </li>
                  <li><a class="link" href="/engine/reference/commandline/dockerd/#description">Docker daemon
                      reference</a></li>
                  <li><a class="link" href="/engine/reference/commandline/build/">Docker build
                      reference</a></li>
                </ul>
              </div>
            </div>
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'build' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/whale-car.png">
                <h2 class="text-xl">Docker Build</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Build</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/build/">Overview of Docker Build</a></li>
                  <li><a class="link" href="/engine/reference/builder/">Dockerfile reference</a>
                  </li>
                  <li><a class="link" href="/build/building/packaging/">Packaging your
                      software</a></li>
                  <li><a class="link" href="/build/building/multi-stage/">Multi-stage builds</a>
                  </li>
                  <li><a class="link" href="/build/building/multi-platform/">Multi-platform
                      images</a></li>
                </ul>
              </div>
            </div>
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'compose' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/Compose.png">
                <h2 class="text-xl">Docker Compose</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Compose</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/compose/install/">Install Docker Compose</a></li>
                  <li><a class="link" href="/compose/gettingstarted/">Getting started with Docker
                      Compose</a></li>
                  <li><a class="link" href="/compose/environment-variables/">Environment
                      variables in Compose</a>
                  </li>
                  <li><a class="link" href="/compose/networking/">Networking in Compose</a></li>
                  <li><a class="link" href="/compose/file-watch/">Use Compose Watch</a></li>
                </ul>
              </div>
            </div>
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'hub' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/hub.svg">
                <h2 class="text-xl">Docker Hub</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Hub</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/docker-hub/official_images/">Docker Hub official
                      images</a></li>
                  <li><a class="link" href="/docker-hub/repos/">Create Docker Hub
                      repositories</a></li>
                  <li><a class="link" href="/docker-hub/builds/">Set up automated builds</a>
                  </li>
                  <li><a class="link" href="/docker-hub/access-tokens/">Manage access tokens</a>
                  </li>
                  <li><a class="link" href="/docker-hub/webhooks/">Docker Hub webhooks</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex gap-4 mx-auto w-[1200px] lg:w-full p-6 sm:flex-col">
      <div class="w-full">
        <h2 class="text-3xl">Best practices</h2>
        <ul class="w-full space-y-3">
          <li>
            <a class="link" href="/develop/develop-images/dockerfile_best-practices/">Best
              practices for writing a Dockerfile</a>
          </li>
          <li>
            <a class="link" href="/develop/develop-images/dockerfile_best-practices/">Best
              practices for writing a Docker Compose file</a>
          </li>
          <li>
            <a class="link" href="/develop/dev-best-practices/">Docker development best
              practices</a>
          </li>
          <li>
            <a class="link" href="/engine/security/">Docker security best practices</a>
          </li>
        </ul>
      </div>
      <div class="w-full">
        <h2 class="text-3xl">Develop with Docker</h2>
        <ul class="w-full space-y-3">
          <li>
            <a class="link" href="/language/nodejs/">Containerize a Node.js app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/python/">Containerize a Python app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/java/">Containerize a Java app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/golang/">Containerize a Go app using Docker</a>
          </li>
          <li>
            <a class="link" href="/samples/">View more languages and frameworks in Docker
              samples</a>
          </li>
        </ul>
      </div>
    </div>
    <div class="flex mx-auto w-[1200px] flex-col p-6 lg:w-full">
      <h2 class="text-3xl">Play with Docker</h2>
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        <div>
          <a class="h-full" href="/get-started/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Tutorial
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Self-paced tutorials to increase your Docker knowledge.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://labs.play-with-docker.com/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Lab environment
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Complete a workshop without installing anything using this Docker playground.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="/get-started/resources/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Community training
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Free and paid learning materials from Docker captains.
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
    <div class="flex mx-auto w-[1200px] flex-col p-6 lg:w-full">
      <h2 class="text-3xl">Community resources</h2>
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        <div>
          <a class="h-full" href="https://www.meetup.com/pro/docker/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Find a local meetup
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Attend one of the 200+ Docker Meetups around the globe.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://www.docker.com/events/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Upcoming events
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Learn from experts and get to know Docker.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://www.meetup.com/pro/docker/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Tune in monthly
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Join the Virtual Docker Meetup Group and online meetups every month.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://www.docker.com/newsletter-subscription">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Community news
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                The Docker Weekly is an email newsletter with the latest content on DOcker and the event agenda for
                the
                upcoming weeks.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://www.docker.com/docker-captains">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Meet the captains
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Select members of the community that are both experts in their field and are passionate about sharing
                their Docker knowledge with others.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="/get-started/resources/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Educational resources
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Expand your understanding of Docker with these additional resources.
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </main>
  <footer>{{ partial "footer.html" . }}</footer>
</body>
@y
    <div class="flex mx-auto w-[1200px] flex-col gap-4 p-6 lg:w-full">
      <div class="grid grid-cols-3 gap-4 sm:flex sm:flex-col xl:grid-cols-2">
        <div class="col-start-1 col-end-3 bg-white p-6 dark:bg-gray-dark-200">
          <div x-data="{ selected: 'explore' }" aria-role="tabpanel">
            <div aria-role="tablist" class="space-x-2">
              <button class="p-1" :class="selected === 'explore' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'explore'">
                Explore Docker
              </button>
              <button class="p-1" :class="selected === 'faq' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'faq'">
                Browse FAQs
              </button>
              <button class="p-1" :class="selected === 'support' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'support'">
                Get support
              </button>
            </div>
            <hr />
            <div>
              <div class="flex justify-items-center py-4 sm:flex-col" aria-role="tab"
                :class="selected !== 'explore' && 'hidden'">
                <ul class="w-full space-y-3">
                  <li>
                    <a class="link" href="/engine/reference/builder/">Write a Dockerfile</a>
                  </li>
                  <li>
                    <a class="link" href="/network/">Manage container networking</a>
                  </li>
                  <li>
                    <a class="link" href="/compose/compose-file/">Write a Docker Compose file</a>
                  </li>
                  <li>
                    <a class="link" href="/storage/">Work with volumes and mounts</a>
                  </li>
                  <li>
                    <a class="link" href="/get-started/04_sharing_app/">Share images on Docker Hub</a>
                  </li>
                </ul>
                <ul class="w-full space-y-3">
                  <li>
                    <a class="link" href="/config/daemon/">Configure the Docker daemon</a>
                  </li>
                  <li>
                    <a class="link" href="/get-started/02_our_app/">Build and run an image</a>
                  </li>
                  <li>
                    <a class="link" href="/config/labels-custom-metadata/">Manage Docker objects</a>
                  </li>
                  <li>
                    <a class="link" href="/build/building/multi-stage/">Multi-stage builds</a>
                  </li>
                </ul>
              </div>
              <div class="flex justify-items-center py-4 sm:flex-col" aria-role="tab"
                :class="selected !== 'faq' && 'hidden'">
                <div class="w-full">
                  <h2 class="text-lg mb-2">Common FAQs</h6>
                    <ul class="space-y-3">
                      <li>
                        <a class="link"
                          href="/desktop/faqs/general/#what-are-the-system-requirements-for-docker-desktop">What are the
                          system requirements for Docker Desktop?</a>
                      </li>
                      <li>
                        <a class="link" href="https://github.com/docker/awesome-compose" target="_blank"
                          rel="noopener">Where can I find example Compose files?</a>
                      </li>
                      <li>
                        <a class="link"
                          href="/desktop/faqs/general/#how-do-i-connect-from-a-container-to-a-service-on-the-host">How
                          do I connect from a container to a service?</a>
                      </li>
                      <li>
                        <a class="link" href="/get-started/04_sharing_app/">How do I share images on Docker Hub?</a>
                      </li>
                    </ul>
                </div>
                <div class="w-full">
                  <h2 class="text-lg mb-2">Products</h6>
                    <ul class="space-y-3">
                      <li>
                        <a class="link" href="/desktop/faqs/general/">Docker Desktop</a>
                      </li>
                      <li>
                        <a href="/desktop/faqs/macfaqs/" class="link">Docker Desktop for Mac</a>
                      </li>
                      <li>
                        <a class="link" href="/desktop/faqs/windowsfaqs/">Docker Desktop for Windows</a>
                      </li>
                      <li>
                        <a class="link" href="/desktop/faqs/linuxfaqs/">Docker Desktop for Linux</a>
                      </li>
                      <li>
                        <a class="link" href="/faq/security/single-sign-on/faqs/">Docker Single Sign-on</a>
                      </li>
                    </ul>
                </div>
              </div>
              <div class="flex" aria-role="tab" :class="selected !== 'support' && 'hidden'">
                <div class="w-full">
                  <ul class="py-4 space-y-3">
                    <li>
                      <a class="link" href="/support/">Get support</a>
                    </li>
                    <li>
                      <a class="link" href="https://dockercommunity.slack.com/" target="_blank" rel="noopener">Docker
                        community Slack</a>
                    </li>
                    <li>
                      <a class="link" href="https://docker.com/company/contact/" target="_blank" rel="noopener">Contact
                        Docker</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="bg-white p-6 space-y-3 dark:bg-gray-dark-200">
          <h2 class="text-xl mb-2">Popular videos</h2>
          <p>Watch the most popular videos from DockerCon.</p>
          <a class="link flex gap-4 items-center" href="https://youtu.be/gAGEar5HQoU">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>How to get started with Docker</p>
          </a>
          <a class="link flex gap-4 items-center" href="https://youtu.be/xmLVNpyJ530?t=30">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>How to to build and test your Docker images in the Cloud</p>
          </a>
          <a class="link flex gap-4 items-center" href="https://youtu.be/QeQ2MH5f_BE?t=31">
            <img src="/assets/images/video.svg" width="65" height="44" />
            <p>Simplify all the things with Docker Compose</p>
          </a>
        </div>
      </div>
      <div class="bg-white p-6 dark:bg-gray-dark-200">
        <div x-data="{ selected: 'desktop' }" aria-role="tabpanel">
          <div aria-role="tablist" class="space-x-2">
            <button class="p-1" :class="selected === 'desktop' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'desktop'">
              Desktop
            </button>
            <button class="p-1" :class="selected === 'engine' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'engine'">
              Engine
            </button>
            <button class="p-1" :class="selected === 'build' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'build'">
              Build
            </button>
            <button class="p-1" :class="selected === 'compose' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'compose'">
              Compose
            </button>
            <button class="p-1" :class="selected === 'hub' &&
          'border-blue-light-500 border-b-4 dark:border-b-blue-dark-600'" @click="selected = 'hub'">
              Hub
            </button>
          </div>
          <hr />
          <div>
            <div x-data="{os: 'windows'}" class="flex gap-6 py-8 md:flex-col" aria-role="tab"
              :class="selected !== 'desktop' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/laptop.svg">
                <h2 class="text-xl">Docker Desktop</h2>
                <select class="p-2 rounded-sm bg-gray-light-100 dark:bg-gray-dark-100"
                  x-on:change="os = $event.target.value">
                  <option value="windows">Windows</option>
                  <option value="mac">Mac</option>
                  <option value="linux">Linux</option>
                </select>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Desktop</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3" x-show="os === 'windows'">
                  <li><a class="link" href="/desktop/windows/wsl/">Docker Desktop WSL 2 backend</a></li>
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                  <li><a class="link" href="/desktop/vm-vdi/">VM and VDI support</a></li>
                  <li><a class="link" href="/desktop/windows/release-notes/">Release notes</a></li>
                  <li><a class="link" href="/desktop/containerd/">containerd image store</a></li>
                </ul>
                <ul class="space-y-3" x-show="os === 'mac'">
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                  <li><a class="link" href="/desktop/install/mac-install/">Install Docker Desktop on Mac</a></li>
                  <li><a class="link" href="/desktop/release-notes/">Release notes</a></li>
                  <li><a class="link" href="/desktop/mac/permission-requirements/">Understand permission requirements</a></li>
                </ul>
                <ul class="space-y-3" x-show="os === 'linux'">
                  <li><a class="link" href="/desktop/use-desktop/">Explore Docker Desktop</a></li>
                <li><a class="link" href="/desktop/install/linux-install/">Install Docker Desktop on Linux</a></li>
                <li><a class="link" href="/desktop/release-notes/">Release notes</a></li>
              </ul>
              </div>
            </div>
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'engine' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/engine.svg">
                <h2 class="text-xl">Docker Engine</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Engine</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/engine/install/ubuntu/">Install Docker Engine on
                      Ubuntu</a></li>
                  <li><a class="link" href="/engine/reference/commandline/run/">Run a command in
                      a container</a></li>
                  <li><a class="link" href="/engine/reference/builder/">Dockerfile reference</a>
                  </li>
                  <li><a class="link" href="/engine/reference/commandline/dockerd/#description">Docker daemon
                      reference</a></li>
                  <li><a class="link" href="/engine/reference/commandline/build/">Docker build
                      reference</a></li>
                </ul>
              </div>
            </div>
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'build' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/whale-car.png">
                <h2 class="text-xl">Docker Build</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Build</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/build/">Overview of Docker Build</a></li>
                  <li><a class="link" href="/engine/reference/builder/">Dockerfile reference</a>
                  </li>
                  <li><a class="link" href="/build/building/packaging/">Packaging your
                      software</a></li>
                  <li><a class="link" href="/build/building/multi-stage/">Multi-stage builds</a>
                  </li>
                  <li><a class="link" href="/build/building/multi-platform/">Multi-platform
                      images</a></li>
                </ul>
              </div>
            </div>
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'compose' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/Compose.png">
                <h2 class="text-xl">Docker Compose</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Compose</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/compose/install/">Install Docker Compose</a></li>
                  <li><a class="link" href="/compose/gettingstarted/">Getting started with Docker
                      Compose</a></li>
                  <li><a class="link" href="/compose/environment-variables/">Environment
                      variables in Compose</a>
                  </li>
                  <li><a class="link" href="/compose/networking/">Networking in Compose</a></li>
                  <li><a class="link" href="/compose/file-watch/">Use Compose Watch</a></li>
                </ul>
              </div>
            </div>
            <div class="flex justify-items-center gap-6 py-8 sm:flex-col" aria-role="tab"
              :class="selected !== 'hub' && 'hidden'">
              <div class="w-1/4 md:w-full flex flex-col gap-4 self-center items-center">
                <img class="h-[130px]" src="/assets/images/hub.svg">
                <h2 class="text-xl">Docker Hub</h2>
              </div>
              <div class="w-2/4 md:w-full flex flex-col gap-4">
                <h2 class="text-xl">Getting started with Docker Hub</h2>
                <p>Take a walkthrough that covers writing your first app, data storage, networking, and swarms, and ends
                  with your app running on production servers in the cloud.</p>
                <a class="link" href="/get-started/">Learn Docker</a>
              </div>
              <div class="w-1/4 md:w-full ">
                <h2 class="text-xl">Popular articles</h2>
                <ul class="space-y-3">
                  <li><a class="link" href="/docker-hub/official_images/">Docker Hub official
                      images</a></li>
                  <li><a class="link" href="/docker-hub/repos/">Create Docker Hub
                      repositories</a></li>
                  <li><a class="link" href="/docker-hub/builds/">Set up automated builds</a>
                  </li>
                  <li><a class="link" href="/docker-hub/access-tokens/">Manage access tokens</a>
                  </li>
                  <li><a class="link" href="/docker-hub/webhooks/">Docker Hub webhooks</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex gap-4 mx-auto w-[1200px] lg:w-full p-6 sm:flex-col">
      <div class="w-full">
        <h2 class="text-3xl">Best practices</h2>
        <ul class="w-full space-y-3">
          <li>
            <a class="link" href="/develop/develop-images/dockerfile_best-practices/">Best
              practices for writing a Dockerfile</a>
          </li>
          <li>
            <a class="link" href="/develop/develop-images/dockerfile_best-practices/">Best
              practices for writing a Docker Compose file</a>
          </li>
          <li>
            <a class="link" href="/develop/dev-best-practices/">Docker development best
              practices</a>
          </li>
          <li>
            <a class="link" href="/engine/security/">Docker security best practices</a>
          </li>
        </ul>
      </div>
      <div class="w-full">
        <h2 class="text-3xl">Develop with Docker</h2>
        <ul class="w-full space-y-3">
          <li>
            <a class="link" href="/language/nodejs/">Containerize a Node.js app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/python/">Containerize a Python app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/java/">Containerize a Java app using Docker</a>
          </li>
          <li>
            <a class="link" href="/language/golang/">Containerize a Go app using Docker</a>
          </li>
          <li>
            <a class="link" href="/samples/">View more languages and frameworks in Docker
              samples</a>
          </li>
        </ul>
      </div>
    </div>
    <div class="flex mx-auto w-[1200px] flex-col p-6 lg:w-full">
      <h2 class="text-3xl">Play with Docker</h2>
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        <div>
          <a class="h-full" href="/get-started/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Tutorial
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Self-paced tutorials to increase your Docker knowledge.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://labs.play-with-docker.com/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Lab environment
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Complete a workshop without installing anything using this Docker playground.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="/get-started/resources/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Community training
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Free and paid learning materials from Docker captains.
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
    <div class="flex mx-auto w-[1200px] flex-col p-6 lg:w-full">
      <h2 class="text-3xl">Community resources</h2>
      <div class="grid grid-cols-3 gap-4 p-6 sm:flex sm:flex-col xl:grid-cols-2">
        <div>
          <a class="h-full" href="https://www.meetup.com/pro/docker/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Find a local meetup
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Attend one of the 200+ Docker Meetups around the globe.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://www.docker.com/events/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Upcoming events
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Learn from experts and get to know Docker.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://www.meetup.com/pro/docker/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Tune in monthly
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Join the Virtual Docker Meetup Group and online meetups every month.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://www.docker.com/newsletter-subscription">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Community news
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                The Docker Weekly is an email newsletter with the latest content on DOcker and the event agenda for
                the
                upcoming weeks.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="https://www.docker.com/docker-captains">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Meet the captains
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Select members of the community that are both experts in their field and are passionate about sharing
                their Docker knowledge with others.
              </div>
            </div>
          </a>
        </div>
        <div>
          <a class="h-full" href="/get-started/resources/">
            <div
              class="flex h-full flex-col gap-2 rounded border border-gray-light-100 bg-white p-4 drop-shadow-sm hover:border-gray-light-200 hover:drop-shadow-lg dark:border-gray-dark-400 dark:bg-gray-dark-200 hover:dark:border-gray-dark">
              <div class="flex items-center gap-4">
                <div>
                  <div class="text-xl leading-snug text-gray-light-800 dark:text-white">
                    Educational resources
                  </div>
                </div>
              </div>
              <div class="leading-snug text-gray-light-500 dark:text-gray-dark-700">
                Expand your understanding of Docker with these additional resources.
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </main>
  <footer>{{ partial "footer.html" . }}</footer>
</body>
@z

@x
</html>
@y
</html>
@z
