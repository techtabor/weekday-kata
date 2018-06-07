weekdayOfDate <- function(year, month, day) {
    weekdays <- c(
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
        "Saturday", "Sunday"
    )
    weekdays[day - 3]
}

stopifnot(weekdayOfDate(2018, 6, 7) == "Thursday")

stopifnot(weekdayOfDate(2018, 6, 4) == "Monday")
stopifnot(weekdayOfDate(2018, 6, 5) == "Tuesday")
stopifnot(weekdayOfDate(2018, 6, 6) == "Wednesday")
stopifnot(weekdayOfDate(2018, 6, 8) == "Friday")
stopifnot(weekdayOfDate(2018, 6, 9) == "Saturday")
stopifnot(weekdayOfDate(2018, 6, 10) == "Sunday")
