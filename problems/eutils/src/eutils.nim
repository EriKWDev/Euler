
import
  tables,
  math,
  macros

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


proc fibonacciNumber*(n: int): int {.memoize.} =
  if n <= 1:
    return 1

  return fibonacciNumber(n - 2) + fibonacciNumber(n - 1)

iterator fibonacciNumbers*(range: Slice[int]): int =
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
