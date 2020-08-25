#!/bin/R
system2("curl", paste(
    "https://jmlab-gitlab.cruk.cam.ac.uk/Jonny/BarcodeSwapping2017Data/raw/master/bcswap_data.tar.gz",
    " > bcswap_data.tar.gz"))
system2("tar", "-xzf bcswap_data.tar.gz")

target <- file.path("DropletTestFiles", "bach", "1.0.0")
dir.create(target, recursive=TRUE)
system2("mv", paste("data/molecule_info/*", target))

orig_files <- dir(target, recursive = TRUE)

#name tweaks for consistency
files <- dir(file.path(target, "hiseq_2500_run2"), full.names = TRUE)
system2("mv", c(file.path(target, "hiseq_2500_run2"),
                file.path(target, "hiseq_2500_exp2")))
files <- dir(file.path(target, "hiseq_2500_exp2"), full.names = TRUE)
file.rename(
    files,
    file.path(dirname(files), paste0("mol_info_", basename(files)))
)
files <- dir(target, recursive = TRUE, full.names = TRUE)
file.rename(files, gsub("molecule", "mol", files))


#metadata
files <- dir(target, recursive = TRUE, full.names = TRUE)
sequencer <- ifelse(grepl("4000", files), "HiSeq 4000", "HiSeq 2500")
experiment <- ifelse(grepl("exp2", files), 2, 1)
barcode <- regmatches(files, regexpr("[A-Z][1-9]", files))
title <- paste0(sequencer, "-sequenced mammary epithelial cells (expt. ", experiment, " barcode ", barcode, ")")
desc <- paste0("Molecule information file for ", sequencer, "-sequenced single-cell RNA-seq data (experiment ", experiment, ", using 10x barcode ", barcode, "; 10x 3' v2 kit)")
meta <- data.frame(
    Title = title,
    Description = desc,
    RDataPath = files,
    BiocVersion=3.12,
    Genome="mm10",
    SourceType="HDF5",
    SourceUrl="https://jmlab-gitlab.cruk.cam.ac.uk/Jonny/BarcodeSwapping2017Data/raw/master/bcswap_data.tar.gz",
    SourceVersion=orig_files,
    Species="Mus musculus",
    TaxonomyId=10090,
    Coordinate_1_based=NA,
    DataProvider="Jonathan Griffiths",
    Maintainer="Aaron Lun <infinite.monkeys.with.keyboards@gmail.com>",
    RDataClass="character",
    DispatchClass="FilePath",
    stringsAsFactors = FALSE
)
write.csv(meta, row.names=FALSE,
    file="../../extdata/1.0.0/metadata-bach.csv")