library(dplyr)
library(drake)
purrr::walk(fs::dir_ls("R", recursive = TRUE), source)