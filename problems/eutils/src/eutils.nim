
import
  tables,
  math,
  macros,
  algorithm,
  intsets

macro memoize*(e) =
  template memo(n, nT, returnT, procName, procBody) =
    var cache = initTable[nT, returnT]()
    when not declared(procName):
      proc procName*(n: nT): returnT
    proc fun*(n: nT): returnT {.gensym.} = procBody
    proc procName*(n: nT): returnT =
      if not cache.hasKey(n): cache[n] = fun(n)
      return cache[n]
  let
    returnT = e.params()[0]
    param   = e.params()[1]
    (n, nT) = (param[0], param[1])
  getAst(memo(n, nT, returnT, e.name(), e.body()))


proc fibonacciNumber*(n: int64): int64 {.memoize.} =
  if n <= 1:
    return 1'i64

  return fibonacciNumber(n - 2'i64) + fibonacciNumber(n - 1'i64)

iterator fibonacciNumbers*(range: Slice[int]): int64 =
  for i in range:
    yield fibonacciNumber(i)


proc isPrime*(n: int64): bool {.memoize.}  =
  if n <= 3:
    return n > 1

  if n mod 2 == 0 or n mod 3 == 0:
    return false

  var i = 5
  while i^2 <= n:
    if n mod i == 0 or n mod (i + 2) == 0:
      return false

    i = i + 6

  return true

proc isPrime*(n: SomeInteger): bool = isPrime(n.int64)


proc primeNumber*(n: int): int {.memoize.}  =
  if n <= 0:
    return 2

  var current = primeNumber(n - 1) + 1

  while true:
    if isPrime(current):
      return current

    inc current

iterator primeNumbers*(range: Slice[int]): int =
  for i in range:
    yield primeNumber(i)

iterator primeNumbersInRange*(range: Slice[int]): int =
  for i in range:
    if isPrime(i):
      yield i

iterator primeNumbers*(): int =
  yield 2
  yield 3
  yield 5

  var i = 7
  while true:
    if isPrime(i):
      yield i

    i += 2

proc triangleNumber*(n: int): int {.memoize.}  =
  for i in 0..n:
    result = result + i

iterator triangleNumbers*(range: Slice[int]): int =
  for i in range:
    yield triangleNumber(i)


proc primeFactors*(n: int64): seq[int] {.memoize.}  =
  var current = n

  var i = 0
  while current > 1:
    let prime = primeNumber(i)

    while current mod prime == 0 and current > 1:
      result.add(prime)
      current = current div prime

    inc i

proc primeFactors*(n: SomeInteger): seq[int] = primeFactors(n.int64)


iterator choose*[T](a: openarray[T], num_choose: int): seq[T] =
  var
    chosen = newSeqOfCap[T](num_choose)
    i = 0
    iStack = newSeqOfCap[int](num_choose)

  while true:
    if len(chosen) == num_choose:
      yield chosen
      discard chosen.pop()
      i = iStack.pop() + 1

    elif i != len(a):
      chosen.add(a[i])
      iStack.add(i)
      inc i

    elif len(i_stack) > 0:
      discard chosen.pop()
      i = iStack.pop() + 1

    else:
      break


proc factors*(n: int32, includeSelf = true): seq[int] =
  let pfs = primeFactors(n)

  var resultSet: IntSet

  resultSet.incl(1)
  resultSet.incl(n)

  for i in 1..len(pfs):
    for p in choose(pfs, i):
      var prod = 1
      for num in p:
        prod *= num

      resultSet.incl(prod)

  for f in resultSet.items():
    if f == n:
      if includeSelf:
        result.add(f)
      continue

    result.add(f)

proc factors*(n: SomeInteger, includeSelf = true): seq[int] =
  return factors(n.int32, includeSelf)


proc isPalindrome*(word: string): bool {.memoize.} =
  let mid = len(word) div 2
  for i in 0..mid:
    if word[i] != word[high(word) - i]:
      return false

  return true

proc isPalindrome*[T](n: T): bool = isPalindrome($n)


proc collatz*(n: int): int {.memoize.} =
  if n <= 1:
    return 0

  if n mod 2 == 0:
    result = 1 + collatz(n div 2)
  else:
    result = 1 + collatz(3 * n + 1)


proc factorial*(n: int64): int64 {.memoize.} =
  result = 1
  for i in 2..n:
    result *= i

proc factorial*(n: SomeInteger): int64 = factorial(n.int64)
