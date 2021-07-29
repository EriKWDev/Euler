
const N = 162

type MyNumber = array[N, int]


proc `$`(number: MyNumber): string =
  for digit in number:
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

proc `*`(number: MyNumber, factor: int): MyNumber =
  for i, integer in number:
    result[i] = integer * factor

    if result[i] > 10:
      result = result.doCarry(i)

proc `+`(number: MyNumber, newNumber: int): MyNumber =
  result = number

  result[^1] += newNumber

  if result[^1] > 10:
    result = result.doCarry(high(number))


proc main() =
  var numberArray = newNumber("100")

  for i in 2..100:
    numberArray = numberArray * i

  var digitSum = 0
  for digit in numberArray:
    digitSum += digit

  echo digitSum


when isMainModule:
  main()
