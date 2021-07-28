#!/usr/bin/env nim

import os, strformat

proc showHelp() =
  echo ""
  echo "./run.nims <problemNumber> [parameters]"

proc main() =
  if paramCount() < 2:
    echo "Error: Please specify a problem number to run"
    showHelp()
    return

  let
    problemNumber = paramStr(2)
    extraParams = commandLineParams()[2..^1]
    dirPath = &"{thisDir()}/p{problemNumber}"

  if not dirExists(dirPath):
    echo &"Error: '{problemNumber}' doesn't seem to have been created yet. Looked  in '{dirPath}'"
    showHelp()
    return

  withDir dirPath:
    var runCommand = &"./build/p{problemNumber}"
    for param in extraParams:
      runCommand &= " " & param

    exec "nimble build"
    exec runCommand


when isMainModule:
  main()
