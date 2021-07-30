
import eutils

proc main() =
  var i = 0'i64

  while true:
    let number = fibonacciNumber(i)

    echo len($number)

    inc i

when isMainModule:
  main()
