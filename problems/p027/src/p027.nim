
import eutils


proc consecutivePrimes(a, b: int): int =
  func f(n: int): int = n * n + a * n + b

  var
    wasPrime = true
    n = 0

  while wasPrime:
    let x = f(n)
    inc n

    wasPrime = isPrime(x)

  return n

proc main() =
  var all: seq[tuple[a, b, n: int]]

  for a in -999..999:
    for b in primeNumbersInRange(0..1000):
      all.add((a, b, consecutivePrimes(a, b)))

  var
    currentMax = -1
    currentBestA = -1
    currentBestB = -1

  for (a, b, n) in all:
    if n > currentMax:
      currentMax = n
      currentBestA = a
      currentBestB = b

  echo currentBestA * currentBestB

when isMainModule:
  main()
