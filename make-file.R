source("load-file.R")
purrr::walk(fs::dir_ls("plans", recursive = TRUE), source)
meta_plan <- build_meta_plan()
make(meta_plan)
