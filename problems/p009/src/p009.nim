
import
  math

proc getNumber(): int =
  for a in 1..998:
    for b in 1..998:
      for c in 1..998:
        if a + b + c == 1000 and a^2 + b^2 == c^2:
          return a * b * c


proc main() =
  echo getNumber()


when isMainModule:
  main()
