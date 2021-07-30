
import
  math,
  eutils

const N = int('0')

func nextChainNumber(n: int): int {.memoize, inline.} =
  for digit in $n:
    result += (int(digit) - N)^2


proc endsAt89(startingNumber: int): bool {.memoize.} =
  if startingNumber == 89:
    return true
  elif startingNumber <= 1:
    return false

  return endsAt89(nextChainNumber(startingNumber))


proc main() =
  var total = 0

  for startingNumber in 0..1000:
    discard endsAt89(startingNumber)

  for startingNumber in countdown(10_000_000, 1, 1):
    if endsAt89(startingNumber):
      inc total

  echo total

when isMainModule:
  main()
