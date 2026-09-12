%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
          What's new
@y
          更新情報
@z

@x
              >{{ .published | time.Format "Jan 2" }}</time
@y
              >{{ .published | time.Format "01/02" }}</time
@z

@x
              href="{{ .url }}"
@y
              href="{{ add "__SUBDIR__" .url }} "
@z

@x
                  >{{ .published | time.Format "Jan 2" }}</time
@y
                  >{{ .published | time.Format "01/02" }}</time
@z

@x
          <span x-text="expanded ? 'Show less' : 'Show more'">Show more</span>
@y
          <span x-text="expanded ? '一部を表示' : 'すべてを表示'">すべてを表示</span>
@z
