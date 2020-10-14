make_data_documentation <- function() {
    dir(uploads_dir()) %>%
    lapply(., get_documentation) %>%
    parallel_rbind() %>%
    write_documentation()
    invisible(NULL)
}
