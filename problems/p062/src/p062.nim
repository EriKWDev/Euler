
import math, tables, algorithm, strutils

proc main() =
  var cache: Table[string, seq[int]]

  const roof = 10 ^ 5

  for i in 1..roof:
    let cube = i ^ 3

    var digits: seq[char]

    for digit in $cube:
      digits.add(digit)

    digits.sort(Descending)
    let digitsHash = join(digits, "")

    if digitsHash notin cache:
      cache[digitsHash] = @[]

    cache[digitsHash].add(cube)

    if len(cache[digitsHash]) == 5:
      echo min(cache[digitsHash])
      break

when isMainModule:
  main()