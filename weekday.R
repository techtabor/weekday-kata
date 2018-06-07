weekdayOfDate <- function(year, month, day) {
    nameOfDayWithIndex(day - 3)
}

nameOfDayWithIndex <- function(index_in_week) {
    weekdays <- c(
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
        "Saturday", "Sunday"
    )
    weekdays[index_in_week]
}

stopifnot(weekdayOfDate(2018, 6, 7) == "Thursday")

stopifnot(weekdayOfDate(2018, 6, 4) == "Monday")
stopifnot(weekdayOfDate(2018, 6, 5) == "Tuesday")
stopifnot(weekdayOfDate(2018, 6, 6) == "Wednesday")
stopifnot(weekdayOfDate(2018, 6, 8) == "Friday")
stopifnot(weekdayOfDate(2018, 6, 9) == "Saturday")
stopifnot(weekdayOfDate(2018, 6, 10) == "Sunday")
