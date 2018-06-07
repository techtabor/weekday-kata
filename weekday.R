weekdayOfDate <- function(year, month, day) {
    index_of_a_last_day_of_week <- 3
    nameOfDayWithIndex((day - index_of_a_last_day_of_week) %% 7)
}

nameOfDayWithIndex <- function(index_in_week) {
    weekday_names <- c(
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
        "Saturday", "Sunday"
    )
    weekday_names[index_in_week]
}

stopifnot(weekdayOfDate(2018, 6, 7) == "Thursday")

stopifnot(weekdayOfDate(2018, 6, 4) == "Monday")
stopifnot(weekdayOfDate(2018, 6, 5) == "Tuesday")
stopifnot(weekdayOfDate(2018, 6, 6) == "Wednesday")
stopifnot(weekdayOfDate(2018, 6, 8) == "Friday")
stopifnot(weekdayOfDate(2018, 6, 9) == "Saturday")
stopifnot(weekdayOfDate(2018, 6, 10) == "Sunday")

stopifnot(weekdayOfDate(2018, 6, 1) == "Friday")
stopifnot(weekdayOfDate(2018, 6, 30) == "Saturday")


