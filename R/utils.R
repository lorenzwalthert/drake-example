#' Build a meta plan
#'
#' Takes all objects in the global environment starting with "plan_" (assuming
#' they are drake plans), binds them together and adds a column "group" to the
#' plan for convenient subsetting.
build_meta_plan <- function() {
  names <- ls(envir = rlang::global_env())
  is_plan <- grepl("^plan_", names)
  is_template <- grepl("_template$", names)
  names <- names[is_plan & !is_template]
  cli::cat_line("Binding the following plans:")
  cli::cat_bullet(names)
  purrr::invoke(bind_plans, purrr::map(names, get_plan_and_add_group))
}

get_plan_and_add_group <- function(name) {
  all_obj <- get(name, envir = rlang::global_env())
  all_obj[!rlang::is_closure(all_obj)] %>%
    tibble::add_column(context = name)
}
