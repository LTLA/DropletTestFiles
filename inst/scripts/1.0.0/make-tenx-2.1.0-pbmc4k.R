base.url <- "https://cf.10xgenomics.com/samples/cell-exp/2.1.0/pbmc4k"

files <- c(
    `raw count matrix`="pbmc4k_raw_gene_bc_matrices.tar.gz",
    `filtered count matrix`="pbmc4k_filtered_gene_bc_matrices.tar.gz",
    `raw HDF5 matrix`="pbmc4k_raw_gene_bc_matrices_h5.h5",
    `molecule information file`="pbmc4k_molecule_info.h5"
)

prefix <- "tenx-2.1.0-pbmc4k"
version <- "1.0.0"

out <- DropletTestFiles:::download10xData(
    files=files,
    base=base.url,
    prefix=prefix,
    version=version,
    short="10X PBMC 4k",
    long="10X Genomics PBMC 4K single-cell RNA-seq (version 2 chemistry, CellRanger 2.1.0)",
    BiocVersion="3.12",
    Genome="hg38",
    SourceUrl="https://support.10xgenomics.com/single-cell-gene-expression/datasets/2.1.0/pbmc4k"
)

write.csv(out, row.names=FALSE,
    file=file.path("../../extdata", version, paste0("metadata-", prefix, ".csv")))
