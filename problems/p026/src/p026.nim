
import strformat, eutils, tables

iterator digits(n: int): int =
  var current = 10

  while true:
    yield current div n
    current = (current mod n) * 10


proc recurringLength(n: int): int =
  var seen: Table[int, int]

  var
    remainder = 10
    i = 0

  while true:
    if remainder in seen:
      return i - seen[remainder]

    seen[remainder] = i
    remainder = 10 * (remainder mod n)

    inc i


proc main() =

  var lengths: seq[tuple[a, b: int]]

  for i in 1..<1000:
    if isPrime(i):
      lengths.add((i, recurringLength(i)))

  var currentMax = -1
  var currentBest = -1
  for i in 0..high(lengths):
    if lengths[i].b > currentMax:
      currentMax = lengths[i].b
      currentBest = lengths[i].a

  echo currentBest



when isMainModule:
  main()
