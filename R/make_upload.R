#' make an exec dir in a temporary space
#' @export
exec_dir = function() paste0(cmg_tmpdir(), "/exec")

make_upload <- function() {
    create_dir(exec_dir()) # NO!
    append <- file.exists(paste0(exec_dir(), "/upload2AWS.sh"))
    aws_prefix <- sprintf("aws s3 cp %s/", uploads_dir())
    aws_suffix <- " s3://experimenthub/curatedMetagenomicData/ --acl public-read"
    dir(uploads_dir()) %>%
    paste0(aws_prefix, ., aws_suffix) %>%
    cat(., file = "./exec/upload2AWS.sh", fill = TRUE, append = append)
}
