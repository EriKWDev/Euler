
proc main() =
  var sum = 0

  for i in 0..<1000:
    if i mod 3 == 0 or i mod 5 == 0:
      sum = sum + i

  echo sum

when isMainModule:
  main()
