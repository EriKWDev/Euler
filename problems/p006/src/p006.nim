

proc main() =
  var sumOfSquares = 0
  var sum = 0

  for i in 0..100:
    sum = sum + i
    sumOfSquares = sumOfSquares + i * i

  echo sum * sum - sumOfSquares


when isMainModule:
  main()