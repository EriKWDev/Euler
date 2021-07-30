#!/usr/bin/env nim

import strformat

proc main() =
  withDir(thisDir()):
    var files: seq[string]

    for i in 0..999:
      let
        dirNum = &"{i:03}"
        dirName = &"p{dirNum}/build"

      if dirExists(dirName):
        echo &"Removing {dirName} ({dirNum})..."
        rmDir(dirName)

  echo "All build directories have been cleaned!"

when isMainModule:
  main()