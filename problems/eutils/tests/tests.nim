
import
  unittest,
  eutils

suite "Euler Utils Test Suite":
  test "Fibonacci Number Generator":
    let correct = @[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

    for i, n in correct:
      check fibonacciNumber(i) == n

    var i = 8
    for fibNumber in fibonacciNumbers(i..i+2):
      check fibNumber == correct[i]
      inc i

    i = 0
    for fibNumber in fibonacciNumbers(i..<len(correct)):
      check fibNumber == correct[i]
      inc i

  test "Is Prime":
    let somePrimes: seq[int64] = @[2'i64, 3'i64, 5'i64, 7'i64, 11'i64, 3847'i64, 7919'i64, 999331'i64, 181081'i64, 3337333'i64, 44560482149'i64]

    for prime in somePrimes:
      check isPrime(prime) == true

    let someNonePrimes = @[0, 1, 4, 8, 12, 9]

    for nonPrime in someNonePrimes:
      check isPrime(nonPrime) == false

  test "Prime Number Generator":
    let correct = @[2, 3, 5, 7, 11]

    for i, n in correct:
      check primeNumber(i) == n

    var i = 2
    for prime in primeNumbers(i..i+2):
      check prime == correct[i]
      inc i

    i = 0
    for prime in primeNumbers(0..<len(correct)):
      check prime == correct[i]
      inc i

  test "Prime Factors":
    check primeFactors(2) == @[2]
    check primeFactors(3) == @[3]
    check primeFactors(6) == @[2, 3]
    check primeFactors(12) == @[2, 2, 3]
    check primeFactors(13195) == @[5, 7, 13, 29]

  test "Is Palindrome":
    check isPalindrome(9009) == true

    for i in 0..9:
      check isPalindrome(i) == true

    check isPalindrome(9008) == false
    check isPalindrome(10002300001) == false
    check isPalindrome("worddrow") == true
    check isPalindrome("1234554321") == true
    check isPalindrome("123454321") == true
