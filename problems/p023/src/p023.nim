
import
  eutils,
  tables,
  intsets

var cache: Table[int, bool]

proc isAbundant(n: int): bool =
  if n in cache:
    return cache[n]

  var sum = 0

  for d in factors(n):
    if d != n:
      sum += d

  result = sum > n

  if result == true:
    for i in 2..10:
      cache[n * i * i] = true


proc main() =
  const roof = 28123

  var abundants: seq[int]

  for i in 1..roof:
    if isAbundant(i):
      abundants.add(i)

  var sums: IntSet

  for i, a in abundants:
    for b in abundants[i..^1]:
      sums.incl(a + b)

  var total = 0
  for i in 0..roof:
    if i notin sums:
      total += i

  echo total

when isMainModule:
  main()
