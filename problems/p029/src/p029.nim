
import
  sets,
  bigints

proc main() =
  var numbers: HashSet[BigInt]

  for aInt in 2..100:
    for bInt in 2..100:
      let
        a = initBigInt($aInt)
        b = initBigInt($bInt)
        value = pow(a, b)

      numbers.incl(value)

  echo(len(numbers))

when isMainModule:
  main()
