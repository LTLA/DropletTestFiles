base.url <- "https://cf.10xgenomics.com/samples/cell-exp/2.0.1/nuclei_900"

files <- read.csv(text="name,description,output
nuclei_900_molecule_info.h5,molecule information file,mol_info.h5
nuclei_900_filtered_gene_bc_matrices_h5.h5,filtered HDF5 matrix,filtered.h5
nuclei_900_raw_gene_bc_matrices_h5.h5,raw HDF5 matrix,raw.h5
nuclei_900_filtered_gene_bc_matrices.tar.gz,filtered count matrix,filtered.tar.gz
nuclei_900_raw_gene_bc_matrices.tar.gz,raw count matrix,raw.tar.gz")

prefix <- "tenx-nuclei-2.0.1-brain1k"
version <- "1.0.0"

out <- DropletTestFiles:::download10xData(
    files=files,
    base=base.url,
    prefix=prefix,
    version=version,
    short="10X brain nuclei 1k",
    long="10X Genomics 1K brain nuclei from an E18 mouse (version 2 chemistry, CellRanger 2.0.1)",
    BiocVersion="3.12",
    Genome="mm10",
    SourceUrl="https://support.10xgenomics.com/single-cell-gene-expression/datasets/2.0.1/nuclei_900"
)

write.csv(out, row.names=FALSE,
    file=file.path("../../extdata", version, paste0("metadata-", prefix, ".csv")))
