base.url <- "https://cf.10xgenomics.com/samples/cell-exp/3.1.0/5k_pbmc_protein_v3"

files <- read.csv(text="name,description,output
5k_pbmc_protein_v3_molecule_info.h5,molecule information file,mol_info.h5
5k_pbmc_protein_v3_filtered_feature_bc_matrix.h5,filtered HDF5 matrix,filtered.h5
5k_pbmc_protein_v3_raw_feature_bc_matrix.h5,raw HDF5 matrix,raw.h5
5k_pbmc_protein_v3_filtered_feature_bc_matrix.tar.gz,filtered count matrix,filtered.tar.gz
5k_pbmc_protein_v3_raw_feature_bc_matrix.tar.gz,raw count matrix,raw.tar.gz")

prefix <- "tenx-3.1.0-5k_pbmc_protein_v3"
version <- "1.0.0"

out <- DropletTestFiles:::download10xData(
    files=files,
    base=base.url,
    prefix=prefix,
    version=version,
    short="10X PBMC 5k with proteins",
    long="10X Genomics single-cell RNA-seq with cell surface proteins for 5K PBMCs from a healthy donor (3' v3 chemistry, CellRanger 3.1.0)",
    BiocVersion="3.12",
    Genome="hg38",
    SourceUrl="https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.1.0/5k_pbmc_protein_v3"
)

write.csv(out, row.names=FALSE,
    file=file.path("../../extdata", version, paste0("metadata-", prefix, ".csv")))
