
const N = 20

var cache2d: array[N+1, array[N+1, int]]

for i in 0..N:
  for j in 0..N:
    cache2d[i][j] = -1


proc findRoutes(x, y: int): int =
  if cache2d[x][y] > -1:
    return cache2d[x][y]

  result = 0

  if y > 0:
    result = result + findRoutes(x, y - 1)

  if x > 0:
    result = result + findRoutes(x - 1, y)

  if x == 0 and y == 0:
    result = result + 1

  cache2d[x][y] = result


proc main() =
  echo findRoutes(N, N)


when isMainModule:
  main()