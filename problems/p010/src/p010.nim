
import math

const roof = 2 * 10^6


proc main() =
  var sieve: array[roof + 1, bool]
  let crossLimit = sqrt(roof.float).ceil().int

  for n in countup(4, crossLimit, 2):
    sieve[n] = true

  for n in countup(3, crossLimit, 2):
    if not sieve[n]:
      for m in countup(n * n, roof, 2 * n):
        sieve[m] = true

  var sum = 0

  for n in 2..roof:
    if not sieve[n]:
      sum += n

  echo sum


when isMainModule:
  main()
