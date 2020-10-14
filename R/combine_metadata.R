cmg_data_dir = function(tmpdir=cmg_tmpdir()) paste(tmpdir, "/data/", sep="")

combine_metadata <- function(tar_gz_file, metadata, md_target_folder=cmg_data_dir()) {
    dataset_name <- format_dataset_name(tar_gz_file)
    metadata$dataset_name <- dataset_name
    metadata <- select(metadata, dataset_name, everything())
    if (!dir.exists(md_target_folder)) dir.create(md_target_folder)
    md_target_path = paste(md_target_folder, "/combined_metadata.rda", sep="")
    if(file.exists(md_target_path)) {
        load(md_target_path)
        combined_metadata <- full_join(as.data.frame(combined_metadata), metadata)
    } else {
        combined_metadata <- metadata
    }
    save(combined_metadata, file = md_target_path,
         compress = "xz")
}
