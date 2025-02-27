%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
{{ $featureName := .Get "feature_name" }}
{{ $feature := index site.Data.summary $featureName }}
{{ if not $feature }}
  {{ errorf "[summary-bar] invalid feature: %s %v" $featureName .Position }}
{{ end }}
{{ if $feature }}
{{ $subscriptionIcons := dict
  "Business" "domain"
  "Team" "groups"
  "Pro" "person_add"
  "Personal" "person"
  "Available to all" "public"
}}
{{ $availabilityIcons := dict
  "Experimental" "science"
  "Beta" "bolt"
  "Early Access" "rocket_launch"
  "GA" "check_circle"
  "Retired" "package_2"
}}
{{ $requiresIcon := "browser_updated" }}
{{ $forIcon := "admin_panel_settings" }}
@y
{{ $featureName := .Get "feature_name" }}
{{ $feature := index site.Data.summary $featureName }}
{{ if not $feature }}
  {{ errorf "[summary-bar] invalid feature: %s %v" $featureName .Position }}
{{ end }}
{{ if $feature }}
{{ $subscriptionIcons := dict
  "Business" "domain"
  "Team" "groups"
  "Pro" "person_add"
  "Personal" "person"
  "Available to all" "public"
}}
{{ $availabilityIcons := dict
  "Experimental" "science"
  "Beta" "bolt"
  "Early Access" "rocket_launch"
  "GA" "check_circle"
  "Retired" "package_2"
}}
{{ $requiresIcon := "browser_updated" }}
{{ $forIcon := "admin_panel_settings" }}
@z

@x
<div class="flex flex-col bg-gray-light-200 bg-opacity-75 dark:bg-gray-dark-300 dark:bg-opacity-75 border-l-4 border-gray-light-200 px-4 py-1 my-1 not-prose">
  {{ with $feature.subscription }}
  <div class="flex items-center gap-1">
      <span class="font-bold">Subscription:</span>
      {{ range . }}
      <span>{{ . }}</span>
      <span class="icon-svg">
          {{ $icon := index $subscriptionIcons . }}
          {{ if $icon }}
            {{ partial "icon" $icon }}
          {{ else }}
            {{ partial "icon" "default_icon" }}
          {{ end }}
      </span>
      {{ end }}
  </div>
  {{ end }}
@y
<div class="flex flex-col bg-gray-light-200 bg-opacity-75 dark:bg-gray-dark-300 dark:bg-opacity-75 border-l-4 border-gray-light-200 px-4 py-1 my-1 not-prose">
  {{ with $feature.subscription }}
  <div class="flex items-center gap-1">
      <span class="font-bold">Subscription:</span>
      {{ range . }}
      <span>{{ . }}</span>
      <span class="icon-svg">
          {{ $icon := index $subscriptionIcons . }}
          {{ if $icon }}
            {{ partial "icon" $icon }}
          {{ else }}
            {{ partial "icon" "default_icon" }}
          {{ end }}
      </span>
      {{ end }}
  </div>
  {{ end }}
@z

@x
  {{ with $feature.availability }}
  {{ $availabilityText := . }}
  <div class="flex items-center gap-1">
      <span class="font-bold">Availability:</span>
      <span>
          {{ $availabilityText }}
          {{ range $key, $icon := $availabilityIcons }}
            {{ if in $availabilityText $key }}
              <span class="icon-svg">{{ partial "icon" $icon }}</span>
            {{ end }}
          {{ end }}
      </span>
  </div>
{{ end }}
@y
  {{ with $feature.availability }}
  {{ $availabilityText := . }}
  <div class="flex items-center gap-1">
      <span class="font-bold">Availability:</span>
      <span>
          {{ $availabilityText }}
          {{ range $key, $icon := $availabilityIcons }}
            {{ if in $availabilityText $key }}
              <span class="icon-svg">{{ partial "icon" $icon }}</span>
            {{ end }}
          {{ end }}
      </span>
  </div>
{{ end }}
@z

@x
  {{ with $feature.requires }}
  <div class="flex items-center gap-1">
      <span class="font-bold">Requires:</span>
      <span>{{ . | markdownify }}</span>
      <span class="icon-svg">
          {{ partial "icon" $requiresIcon }}
      </span>
  </div>
  {{ end }}
@y
  {{ with $feature.requires }}
  <div class="flex items-center gap-1">
      <span class="font-bold">Requires:</span>
      <span>{{ . | markdownify }}</span>
      <span class="icon-svg">
          {{ partial "icon" $requiresIcon }}
      </span>
  </div>
  {{ end }}
@z

@x
  {{ with $feature.for }}
  <div class="flex items-center gap-1">
      <span class="font-bold">For:</span>
      <span>{{ . }}</span>
      <span class="icon-svg">
          {{ partial "icon" $forIcon }}
      </span>
  </div>
  {{ end }}
</div>
{{ end }}
@y
  {{ with $feature.for }}
  <div class="flex items-center gap-1">
      <span class="font-bold">For:</span>
      <span>{{ . }}</span>
      <span class="icon-svg">
          {{ partial "icon" $forIcon }}
      </span>
  </div>
  {{ end }}
</div>
{{ end }}
@z
