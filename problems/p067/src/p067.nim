const data = staticRead("data.txt")

import strutils, strformat


const N = len(data.splitLines())

type
  ValueGrid* = array[N, array[N, int]]


proc `$`(grid: ValueGrid): string =
  for y, row in grid:
    for x, value in row:
      result &= &"{value: ^5}"
    result &= "\n"

proc main() =
  var grid: ValueGrid

  var y = 0
  for line in data.splitLines():
    var x = 0
    for value in line.splitWhitespace():
      grid[y][x] = parseInt(value)

      inc x
    inc y

  for y in countdown(high(grid) - 1, 0):
    for x, value in grid[y]:
      let
        left = grid[y+1][x]
        right = grid[y+1][x+1]
      grid[y][x] = max(value + left, value +  right)

  echo grid[0][0]

when isMainModule:
  main()