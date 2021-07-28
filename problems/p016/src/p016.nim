

proc main() =
  var numberArray: array[500, int]
  numberArray[0] = 1

  for i in 0..<1000:
    numberArray[0] = 2 * numberArray[0]

    for k in 1..<500:
      numberArray[k] = 2 * numberArray[k] + numberArray[k-1] div 10

    for j in 0..<500:
      numberArray[j] = numberArray[j] mod 10

  var sum = 0
  for number in numberArray:
    sum = sum + number

  echo sum


when isMainModule:
  main()
