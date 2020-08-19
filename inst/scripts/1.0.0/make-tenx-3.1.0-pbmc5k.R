base.url <- "https://cf.10xgenomics.com/samples/cell-exp/3.1.0/5k_pbmc_protein_v3"

files <- c(
    `molecule information file`="5k_pbmc_protein_v3_molecule_info.h5",
    `filtered HDF5 matrix`="5k_pbmc_protein_v3_filtered_feature_bc_matrix.h5",
    `raw HDF5 matrix`="5k_pbmc_protein_v3_raw_feature_bc_matrix.h5",
    `filtered count matrix`="5k_pbmc_protein_v3_filtered_feature_bc_matrix.tar.gz",
    `raw count matrix`="5k_pbmc_protein_v3_raw_feature_bc_matrix.tar.gz"
)

prefix <- "tenx-3.1.0-pbmc5k"
version <- "1.0.0"

out <- DropletTestFiles:::download10xData(
    files=files,
    base=base.url,
    prefix=prefix,
    version=version,
    short="10X PBMC 5k",
    long="10X Genomics PBMC 5K single-cell RNA-seq with cell surface proteins (version 3 chemistry, CellRanger 3.1.0)",
    BiocVersion="3.12",
    Genome="hg38",
    SourceUrl="https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.1.0/5k_pbmc_protein_v3"
)

write.csv(out, row.names=FALSE,
    file=file.path("../../extdata", version, paste0("metadata-", prefix, ".csv")))
