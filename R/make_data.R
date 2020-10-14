#' create a 'globally usable' temporary folder with name 'uploads'
#' @param path character(1) path to a temporary folder
#' @export
uploads_dir = function(path=cmg_tmpdir()) paste(path, "/uploads/", sep="") 

#' create a 'globally usable' temporary folder
#' @param path character(1) path to a temporary folder
#' @export
cmg_tmpdir = function(path=tempdir()) path

#' revise make_data program to behave in a conventional way
#' @param tar_gz_file character(1)
#' @param tmpdir character(1) path to folder where tgz file is extracted
#' @export
make_data <- function(tar_gz_file, tmpdir=cmg_tmpdir() ) {
    dir.create(uploads_dir(path=tmpdir))
    dsname = gsub(".tar.gz", "", basename(tar_gz_file))
    untar(tar_gz_file, exdir = tmpdir)
    dataset_dir <- paste(tmpdir, "/", dsname, "/", sep="") # get_dataset_dir(tar_gz_file)
    metadata <- format_metadata(dataset_dir)
    pheno_data <- format_pheno_data(metadata)
    experiment_data <- format_experiment_data(metadata)
# the next command writes out ExpressionSets
    genefamilies_relab(pheno_data, experiment_data, dataset_dir)
    marker_abundance(pheno_data, experiment_data, dataset_dir)
    marker_presence(pheno_data, experiment_data, dataset_dir)
    metaphlan_bugs_list(pheno_data, experiment_data, dataset_dir)
    pathabundance_relab(pheno_data, experiment_data, dataset_dir)
    pathcoverage(pheno_data, experiment_data, dataset_dir)
    combine_metadata(tar_gz_file, metadata)
}
