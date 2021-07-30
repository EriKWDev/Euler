
import eutils

const N = 1024

type MyNumber = array[N, int]


proc `$`(number: MyNumber): string =
  var hasBegun = false
  for digit in number:
    if digit != 0:
      hasBegun = true

    if hasBegun:
      result &= $digit

proc newNumber(input: string): MyNumber =
  for i, character in input:
    result[high(result) - high(input) + i] = int(character) - int('0')

proc doCarry(number: MyNumber, i: int): MyNumber =
  result = number
  var
    carry = result[i] div 10
    carryDistance = 1

  result[i] = result[i] mod 10

  while carry > 0:
    let carryIndex = i - carryDistance

    result[carryIndex] += carry mod 10

    if result[carryIndex] >= 10:
      carry += result[carryIndex] - result[carryIndex] mod 10
      result[carryIndex] = result[carryIndex] mod 10

    carry = carry div 10
    inc  carryDistance

proc `+`(number: MyNumber, newNumber: int): MyNumber =
  result = number

  result[^1] += newNumber

  if result[^1] >= 10:
    result = result.doCarry(high(number))

proc `+`(a: MyNumber, b: MyNumber): MyNumber =
  for i in 0..high(b):
    result[i] = a[i] + b[i]

    if result[i] >= 10:
      result = result.doCarry(i)

proc myFibonaccinumber(i: int64): MyNumber {.memoize.} =
  if i <= 1:
    return newNumber("1")

  return myFibonaccinumber(i - 2'i64) + myFibonaccinumber(i - 1'i64)


proc main() =
  var i = 1'i64

  while true:
    let number = myFibonaccinumber(i - 1)

    if len($number) == 1000:
      break

    inc i

  echo i

when isMainModule:
  main()
