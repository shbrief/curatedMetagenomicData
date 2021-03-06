get_experiment_data <- function(resource_object, slot_name) {
    experimentData(resource_object) %>%
        slot(., slot_name) %>% {
            ifelse(nchar(.) > 1, ., NA)
        }
}
