add_version_number <- function() {
    current_date <-
        Sys.Date() %>%
        gsub("-", "", .)

    dir(uploads_dir()) %>%
        for(i in .) {
            paste0(uploads_dir(), i) %>% {
                file.rename(., paste0(uploads_dir(), current_date, ".", i))
            }
        }

    write_file(current_date, "./inst/extdata/versions.txt", append = TRUE)
}
