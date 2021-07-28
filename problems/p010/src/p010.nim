
import
  math,
  eutils

const roof = 2 * 10^6


proc main() =
  var
    sum = 0
    i = 0

  while true:
    let prime = primeNumber(i)

    if prime >= roof:
      break

    sum = sum + prime
    inc i

  echo sum


when isMainModule:
  main()
