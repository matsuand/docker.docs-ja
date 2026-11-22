%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
    <h2 id="whats-new-title">What's new</h2>
@y
    <h2 id="whats-new-title">最新情報</h2>
@z

@x
            <h3><a href="{{ .url }}">{{ .title }}</a></h3>
@y
            <h3><a href="__SUBDIR__{{ .url }}">{{ .title }}</a></h3>
@z

@x
        <span x-text="expanded ? 'Show less' : 'Show more'">Show more</span>
@y
        <span x-text="expanded ? '元に戻す' : 'さらに表示'">さらに表示</span>
@z
