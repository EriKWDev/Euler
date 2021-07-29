
import times

proc main() =
  let
    startDate = initDateTime(1, mJan, 1901, 00, 00, 00, 00, utc())
    endDate = initDateTime(31, mDec, 2000, 00, 00, 00, 00, utc())
    dayDuration = initDuration(days=1)

  var
    currentDate = startDate.deepCopy()
    numberOfSundays = 0

  while currentDate <= endDate:
    if currentDate.weekday == dSun and currentDate.monthday == 1:
      inc numberOfSundays

    currentDate = currentDate + dayDuration

  echo numberOfSundays

when isMainModule:
  main()
