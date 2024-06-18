library(yaml)
library(stringr)
library(tibble)
library(dplyr)
library(purrr)
library(glue)
library(knitr)
library(kableExtra)

make_rectangular <- function(.data) {
  map_dfr(.data, ~ tibble(!!!.x))
}


ui_list <- function(vec) {
  for (x in vec) {
    cat("-", x, "\n")
  }
}

#dat <- read_yaml("_course.yml")
extract_course <- function(dat){
  out<- list()
  out$team_df <- make_rectangular(dat$team)
  out$schedule_df <- make_rectangular(dat$schedule)
  out$timetable_df <- make_rectangular(dat$timetable)
  out$timetable_fr_df <- make_rectangular(dat$timetable_fr)
  out$nlecturer <- sum(out$team_df$role == "lecturer")
  out$ntutor <- sum(out$team_df$role == "TA")
  list2env(out, globalenv())
}
