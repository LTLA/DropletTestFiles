base.url <- "https://cf.10xgenomics.com/samples/cell-atac/1.2.0/atac_pbmc_1k_nextgem"

files <- c(
    "atac_pbmc_1k_nextgem_filtered_peak_bc_matrix.tar.gz",
    "atac_pbmc_1k_nextgem_filtered_peak_bc_matrix.h5",
    "atac_pbmc_1k_nextgem_filtered_tf_bc_matrix.tar.gz",
    "atac_pbmc_1k_nextgem_filtered_tf_bc_matrix.h5"
)

prefix <- "tenx-atac-1.2.0-pbmc1k"
version <- "1.0.0"

target <- file.path("DropletTestFiles", prefix, version)
dir.create(target, recursive=TRUE)
for (f in files) {
    dest <- file.path(target, f)
    if (!file.exists(dest)) {
        download.file(file.path(base.url, f), dest)
    }
}

write.csv(file=file.path("../../extdata", version, paste0("metadata-", prefix, ".csv")),
    data.frame(
        Title = sprintf("10X PBMC 5k %s", c(
            "peak count matrix", 
            "peak HDF5 matrix", 
            "motif count matrix", 
            "motif HDF5 matrix")),
        Description = sprintf("%s for 10X Genomics PBMC 1K single-cell ATAC-seq dataset (Next GEM v1.1 chemistry, CellRanger ATAC 1.2.0)", c(
            "Peak count matrix", 
            "Peak HDF5 matrix", 
            "Motif count matrix", 
            "Motif HDF5 file")),
        RDataPath = file.path(target, files),
        BiocVersion="3.12",
        Genome="hg38",
        SourceType=c("tar.gz", "HDF5", "tar.gz", "HDF5"),
        SourceUrl="https://support.10xgenomics.com/single-cell-atac/datasets/1.2.0/atac_pbmc_1k_nextgem",
        SourceVersion=files,
        Species="Homo sapiens",
        TaxonomyId="9606",
        Coordinate_1_based=NA,
        DataProvider="10X Genomics",
        Maintainer="Aaron Lun <infinite.monkeys.with.keyboards@gmail.com>",
        RDataClass="character",
        DispatchClass="character",
        stringsAsFactors = FALSE
    ),
    row.names=FALSE)
