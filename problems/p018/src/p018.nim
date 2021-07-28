const data = """
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"""

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