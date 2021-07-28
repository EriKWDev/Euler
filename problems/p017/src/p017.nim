
import strutils

proc toEnglish(n: int): string =
  var current = n

  for (number, word) in [(1000, "thousand"), (100, "hundred")]:
    if current >= number:
      result &= toEnglish((current - current mod number) div number) & " " & word
      current = current mod number

      if current == 0:
        return
      else:
        result &= " and "


  let extra =
    case current:
      of 0: "zero"
      of 1: "one"
      of 2: "two"
      of 3: "three"
      of 4: "four"
      of 5: "five"
      of 6: "six"
      of 7: "seven"
      of 8: "eight"
      of 9: "nine"
      of 10: "ten"

      of 11: "eleven"
      of 12: "twelve"
      of 13: "thirteen"
      of 14: "fourteen"
      of 15: "fifteen"
      of 16: "sixteen"
      of 17: "seventeen"
      of 18: "eighteen"
      of 19: "nineteen"

      of 20: "twenty"
      of 30: "thirty"
      of 40: "forty"
      of 50: "fifty"
      of 60: "sixty"
      of 70: "seventy"
      of 80: "eighty"
      of 90: "ninety"

      else:
        case current:
          of 21..99: toEnglish(current - (current mod 10)) & "-" & toEnglish(current mod 10)
          else: ""

  result &= extra

proc main() =
  var total = 0

  for i in 1..1000:
    let
      word = toEnglish(i)
      l = len(word.replace(" ", "").replace("-", ""))

    total = total + l

  echo total


when isMainModule:
  main()
