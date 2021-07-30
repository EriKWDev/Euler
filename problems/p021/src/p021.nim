
import eutils, math

proc isAmicable(n: int): bool =
  let
    a = sum(factors(n, false))
    b = sum(factors(a, false))

  return a != b and b == n

proc main() =
  var amicables: seq[int]

  for n in 2..<10000:
    if isAmicable(n):
      amicables.add(n)

  echo sum(amicables)


when isMainModule:
  main()
