

proc check(n: int): bool =
  if n < 2:
    return false

  for i in 2..20:
    if n mod i != 0:
      return false

  return true


proc main() =
  var current = 0

  while not check(current):
    inc current

  echo current


when isMainModule:
  main()
