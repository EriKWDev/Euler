
import strutils, algorithm

const words = staticRead("names.txt").replace("\"", "").split(",").sorted()

func computeWordScore(name: string, index: int): int =
  for letter in name:
    result += int(letter) - 64

  result *= (index + 1)


proc main() =

  var score = 0
  for i, word in words:
    score += computeWordScore(word, i)

  echo score


when isMainModule:
  main()
