plan_import <- drake_plan(
  raw = readr::read_csv(file_in("data/mtcars.csv")),
  means = raw %>%
    purrr::keep(is.numeric) %>%
    dplyr::summarize_all(dplyr::funs("mean"))
)

