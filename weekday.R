weekdayOfDate <- function(year, month, day) {
    a_sunday <- c("year" = 2018, "month" = 6, "day" = 3)
    num_days_from_a_sunday <- numDaysBetween(month, day, a_sunday)
    nameOfDayWithIndex(num_days_from_a_sunday %% 7)
}

numDaysBetween <- function(month, day, reference_date) {
    month_distance <- getMonthDistanceInDays(month, reference_date)
    day_distance <- getDayDistanceInDays(day, reference_date)
    month_distance + day_distance
}

getMonthDistanceInDays <- function(month, reference_date) {
    reference_month <- reference_date[["month"]]
    if (month == reference_month) {
        return(0)
    } else if (month > reference_month) {
        totalDaysBetweenMonths(reference_month, month)
    } else {
        - totalDaysBetweenMonths(month, reference_month)
    }
}

getDayDistanceInDays <- function(day, reference_date) {
    day - reference_date[["day"]]
}

totalDaysBetweenMonths <- function(start_index, end_index) {
    month_lengths <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
    sum(month_lengths[start_index : (end_index - 1)])
}

nameOfDayWithIndex <- function(index_in_week) {
    weekday_names <- c(
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
        "Saturday", "Sunday"
    )
    weekday_names[index_in_week]
}

# today
stopifnot(weekdayOfDate(2018, 6, 7) == "Thursday")

# this week
stopifnot(weekdayOfDate(2018, 6, 4) == "Monday")
stopifnot(weekdayOfDate(2018, 6, 5) == "Tuesday")
stopifnot(weekdayOfDate(2018, 6, 6) == "Wednesday")
stopifnot(weekdayOfDate(2018, 6, 8) == "Friday")
stopifnot(weekdayOfDate(2018, 6, 9) == "Saturday")
stopifnot(weekdayOfDate(2018, 6, 10) == "Sunday")

# this month
stopifnot(weekdayOfDate(2018, 6, 1) == "Friday")
stopifnot(weekdayOfDate(2018, 6, 30) == "Saturday")

# this summer
stopifnot(weekdayOfDate(2018, 7, 1) == "Sunday")
stopifnot(weekdayOfDate(2018, 7, 18) == "Wednesday")

# this year
stopifnot(weekdayOfDate(2018, 12, 31) == "Monday")
stopifnot(weekdayOfDate(2018, 1, 1) == "Monday")
stopifnot(weekdayOfDate(2018, 12, 1) == "Saturday")
stopifnot(weekdayOfDate(2018, 1, 6) == "Saturday")

