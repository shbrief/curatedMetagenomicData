metadata_cols <- function(metadata_tsv) {
    template_csv <- read_csv(paste0(cmg_extdata_dir(), "/template.csv"))
    read_lines(metadata_tsv, n_max = 1) %>%
    strsplit("\t") %>%
    unlist() %>%
    match(template_csv$col.name) %>%
    template_csv$var.class[.] %>%
    strtrim(1) %>%
    ifelse(is.na(.), "?", .) %>%
    paste0(collapse = "")
}
