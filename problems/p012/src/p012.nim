import eutils


proc main() =
  var
    i = 0
    t = -1

  while true:
    t = triangleNumber(i)

    let f = factors(t)

    if len(f) >= 500:
      break

    inc i


  echo t


when isMainModule:
  main()
