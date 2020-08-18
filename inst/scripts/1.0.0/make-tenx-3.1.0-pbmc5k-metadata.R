files <- c(
    "pbmc5k_raw_gene_bc_matrices.tar.gz",
    "pbmc5k_filtered_gene_bc_matrices.tar.gz",
    "pbmc5k_filtered_gene_bc_matrices_h5.h5",
    "pbmc5k_molecule_info.h5")

write.csv(file="../../extdata/1.0.0/metadata-tenx-3.1.0-pbmc5k.csv",
    data.frame(
        Title = sprintf("10X PBMC 5k %s", c(
            "raw count matrix", 
            "filtered count matrix", 
            "filtered HDF5 matrix", 
            "molecule information file")),
        Description = sprintf("%s for 10X Genomics PBMC 4K single-cell RNA-seq dataset (version 3 chemistry, CellRanger 3.1.0)", c(
            "Raw count matrix", 
            "Filtered count matrix", 
            "Filtered HDF5 matrix", 
            "Molecule information file")),
        RDataPath = file.path("DropletTestFiles", "tenx-3.1.0-pbmc5k", "1.0.0", files),
        BiocVersion="3.12",
        Genome="hg38",
        SourceType=c("TAR", "TAR", "HDF5", "HDF5"),
        SourceUrl="https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.1.0/5k_pbmc_protein_v3",
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
