
import
  math,
  eutils

const roof = 10^6


proc main() =
  var
    largestI = -1
    largest = -1

  for i in 0..roof:
    let n = collatz(i)

    if n > largest:
      largest = n
      largestI = i

  echo largestI


when isMainModule:
  main()
