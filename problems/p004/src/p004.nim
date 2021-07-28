import
  eutils,
  intsets

proc main() =
  var palindromes: seq[int]

  var done: IntSet

  for a in 100..999:
    for b in 100..999:
      let n = a * b

      if n notin done:
        done.incl(n)
        if isPalindrome(n):
          palindromes.add(n)

  echo max(palindromes)


when isMainModule:
  main()
