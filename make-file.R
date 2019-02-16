drogger::flog_start()
source("load-file.R")
purrr::walk(fs::dir_ls("plans", recursive = TRUE), source)
meta_plan <- build_meta_plan()
make(meta_plan)
cli::cat_rule()
file_path <- drogger::flog_stop()

message("The log for this run is\n")
drogger::parse_log(file_path) %>%
  mutate(message = substr(.data$message, 1, 30))
message("\nopen the last log with drogger::open_log()")