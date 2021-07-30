
proc main() =
  var total = 1

  for i in countup(3, 1002, 2):
    let square = i * i

    for k in 0..3:
      total += square - (i-1) * k

  echo(total)

when isMainModule:
  main()
