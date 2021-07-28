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

const N = data.splitLines()[^1].splitWhitespace().len() * 2

type
  PyramidGrid* = array[N div 2, array[N + 1, int]]

  PyramidNode* = ref object of RootObj
    value*: int
    left*: PyramidNode
    right*: PyramidNode


proc newPyramidGrid*(data: string): PyramidGrid =
  for y, row in result:
    for x, value in row:
      result[y][x] = -1

  var y = 0
  for line in data.splitLines():
    let valueStrings = line.splitWhitespace()
    var x = 0

    for valueString in valueStrings:
      result[y][x*2 + N div 2 - y] = parseInt(valueString)

      inc x
    inc y

proc `$`*(grid: PyramidGrid): string =
  for y, row in grid:
    for x, value in row:
      let p =
        if value > -1:
          $value
        else:
          " "

      result &= &"{p:^3}"
    result &= "\n"

proc getStartingPosition*(grid: PyramidGrid): tuple[x, y: int] =
  result.x = -1
  result.y = 0

  for x, value in grid[0]:
    if value > -1:
      result.x = x
      break


proc newPyramidNode*(grid: PyramidGrid, x, y: int = 0): PyramidNode =
  new(result)
  result.value = grid[y][x]

  # echo &"x: {x}, y: {y}, value: {result.value}"
  if y + 2 > N div 2:
    result.left = nil
    result.right = nil
    return

  result.left = newPyramidNode(grid, x - 1, y + 1)
  result.right = newPyramidNode(grid, x + 1, y + 1)

proc `$`*(pyramid: PyramidNode): string = $pyramid.value


proc toSum*(nodes: seq[PyramidNode]): int =
  for node in nodes:
    result = result + node.value

proc findBestPath(self: PyramidNode): seq[PyramidNode] =
  if self.left == nil or self.right == nil:
    result.add(self)
  else:
    let
      r = self.right.findBestPath()
      l = self.left.findBestPath()
      rs = r.toSum()
      ls = l.toSum()

    if ls > rs:
      result &= self & l
    elif rs >= ls:
      result &= self & r

proc main() =
  let numberGrid = newPyramidGrid(data)
  echo numberGrid

  let
    startingPos = numberGrid.getStartingPosition()
    pyramid = newPyramidNode(numberGrid, startingPos.x, startingPos.y)

  let bestPath = pyramid.findBestPath()
  echo bestPath, " => ", bestPath.toSum()



when isMainModule:
  main()
