
import algorithm, strutils

const roof = 1_000_000

proc main() =
  var initialState = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  var i = 0
  while nextPermutation(initialState):
    if i == roof:
      break

    inc i

  echo initialState.join("")

when isMainModule:
  main()
