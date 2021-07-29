#!/usr/bin/env nim

import strformat

proc main() =
  withDir(thisDir()):
    var files: seq[string]

    for i in 0..999:
      let
        dirNum = &"{i:03}"
        dirName = &"p{dirNum}"

      if dirExists(dirName):
        echo &"Building {dirName} ({dirNum})..."
        withDir(dirName):
          exec "nimble build -d:danger --opt:speed"

        files.add(&"'./{dirName}/build/{dirName}'")

    var benchmarkCommand = &"hyperfine --warmup 2 --ignore-failure --export-markdown TIMINGS.md "

    for file in files:
      benchmarkCommand &= file & " "

    exec benchmarkCommand

when isMainModule:
  main()