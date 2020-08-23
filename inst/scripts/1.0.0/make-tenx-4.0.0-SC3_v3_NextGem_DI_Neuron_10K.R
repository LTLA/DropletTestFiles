base.url <- "https://cf.10xgenomics.com/samples/cell-exp/4.0.0/SC3_v3_NextGem_DI_Neuron_10K"

files <- read.csv(text="name,description,output
SC3_v3_NextGem_DI_Neuron_10K_molecule_info.h5,molecule information file,mol_info.h5
SC3_v3_NextGem_DI_Neuron_10K_filtered_feature_bc_matrix.h5,filtered HDF5 matrix,filtered.h5
SC3_v3_NextGem_DI_Neuron_10K_raw_feature_bc_matrix.h5,raw HDF5 matrix,raw.h5
SC3_v3_NextGem_DI_Neuron_10K_filtered_feature_bc_matrix.tar.gz,filtered count matrix,filtered.tar.gz
SC3_v3_NextGem_DI_Neuron_10K_raw_feature_bc_matrix.tar.gz,raw count matrix,raw.tar.gz")

prefix <- "tenx-4.0.0-SC3_v3_NextGem_DI_Neuron_10K"
version <- "1.0.0"

out <- DropletTestFiles:::download10xData(
    files=files,
    base=base.url,
    prefix=prefix,
    version=version,
    short="10X neuron 10k",
    long="10X Genomics single-cell RNA-seq for 10K neurons from an E18 mouse (3' v3.1 chemistry with dual indexing, CellRanger 4.0.0)",
    BiocVersion="3.12",
    Genome="mm10",
    SourceUrl="https://support.10xgenomics.com/single-cell-gene-expression/datasets/4.0.0/SC3_v3_NextGem_DI_Neuron_10K"
)

write.csv(out, row.names=FALSE,
    file=file.path("../../extdata", version, paste0("metadata-", prefix, ".csv")))
