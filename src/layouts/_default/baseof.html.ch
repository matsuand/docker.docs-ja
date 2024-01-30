%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!DOCTYPE html>
<html lang="en">
@y
<!DOCTYPE html>
<html lang="ja">
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
<body class="bg-background-light text-base dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="flex">
    <div id="sidebar"
      class="sticky top-16 flex h-screen shrink-0 grow flex-row-reverse overflow-y-scroll bg-background-light dark:bg-gray-dark-100 md:fixed md:z-10 md:hidden md:h-screen md:w-screen lg:grow-0">
      {{ block "left" . }}
      {{ end }}
    </div>
    <div class="w-[840px] flex-initial overflow-clip p-6 pt-0 md:w-lvw">
      {{ block "main" . }}
      {{ end }}
    </div>
    <div class="sticky top-16 h-screen w-[300px] shrink grow overflow-y-scroll lg:hidden">
      {{ block "right" . }}
      {{ end }}
    </div>
  </main>
  <footer>{{ partialCached "footer.html" . }}</footer>
</body>
@y
<body class="bg-background-light text-base dark:bg-background-dark dark:text-white">
  {{ partial "header.html" . }}
  <main class="flex">
    <div id="sidebar"
      class="sticky top-16 flex h-screen shrink-0 grow flex-row-reverse overflow-y-scroll bg-background-light dark:bg-gray-dark-100 md:fixed md:z-10 md:hidden md:h-screen md:w-screen lg:grow-0">
      {{ block "left" . }}
      {{ end }}
    </div>
    <div class="w-[840px] flex-initial overflow-clip p-6 pt-0 md:w-lvw">
      {{ block "main" . }}
      {{ end }}
    </div>
    <div class="sticky top-16 h-screen w-[300px] shrink grow overflow-y-scroll lg:hidden">
      {{ block "right" . }}
      {{ end }}
    </div>
  </main>
  <footer>{{ partialCached "footer.html" . }}</footer>
</body>
@z

@x
</html>
@y
</html>
@z
