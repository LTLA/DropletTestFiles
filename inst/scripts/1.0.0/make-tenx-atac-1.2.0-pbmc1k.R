base.url <- "https://cf.10xgenomics.com/samples/cell-atac/1.2.0/atac_pbmc_1k_nextgem"

files <- c(
    `peak count matrix`="atac_pbmc_1k_nextgem_filtered_peak_bc_matrix.tar.gz",
    `peak HDF5 matrix`="atac_pbmc_1k_nextgem_filtered_peak_bc_matrix.h5",
    `motif count matrix`="atac_pbmc_1k_nextgem_filtered_tf_bc_matrix.tar.gz",
    `motif HDF5 matrix`="atac_pbmc_1k_nextgem_filtered_tf_bc_matrix.h5"
)

prefix <- "tenx-atac-1.2.0-pbmc1k"
version <- "1.0.0"

out <- DropletTestFiles:::download10xData(
    files=files,
    base=base.url,
    prefix=prefix,
    version=version,
    short="10X ATAC PBMC 1k",
    long="10X Genomics PBMC 1K single-cell ATAC-seq (Next GEM v1.1 chemistry, CellRanger 1.2.0)",
    BiocVersion="3.12",
    Genome="hg38",
    SourceUrl="https://support.10xgenomics.com/single-cell-atac/datasets/1.2.0/atac_pbmc_1k_nextgem"
)

write.csv(out, row.names=FALSE,
    file=file.path("../../extdata", version, paste0("metadata-", prefix, ".csv")))
