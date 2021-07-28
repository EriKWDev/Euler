
import
  math,
  eutils

const roof = 4 * 10^6

proc main() =
  var
    sum = 0
    i = 1

  while true:
    let n = fibonacciNumber(i)

    if n > roof:
      break

    if n mod 2 == 0:
      sum = sum + n

    inc i

  echo sum

when isMainModule:
  main()
