#' @importFrom utils download.file
download10xData <- function(files, base, prefix, version, short, long, BiocVersion, Genome, SourceUrl) {
    target <- file.path("DropletTestFiles", prefix, version)
    dir.create(target, recursive=TRUE)
    for (f in files) {
        dest <- file.path(target, f)
        if (!file.exists(dest)) {
            download.file(file.path(base, f), dest)
        }
    }

    plain <- names(files)
    plain2 <- sprintf("%s%s", toupper(substr(plain, 1,1)), substr(plain, 2, nchar(plain)))

    Species <- c(hg38="Homo sapiens", mm10="Mus musculus")[Genome]
    TaxonomyId <- c(`Homo sapiens`="9606", `Mus musculus`="10090")[Species]
    SourceType <- rep(NA_character_, length(files))
    SourceType[grep("\\.tar\\.gz$", files)] <- "tar.gz"
    SourceType[grep("\\.h5$", files)] <- "HDF5"

    data.frame(
        Title = sprintf("%s %s", short, plain),
        Description = sprintf("%s for %s", plain2, long),
        RDataPath = file.path(target, files),
        BiocVersion=BiocVersion,
        Genome=Genome,
        SourceType=SourceType,
        SourceUrl=SourceUrl,
        SourceVersion=files,
        Species=Species,
        TaxonomyId=TaxonomyId,
        Coordinate_1_based=NA,
        DataProvider="10X Genomics",
        Maintainer="Aaron Lun <infinite.monkeys.with.keyboards@gmail.com>",
        RDataClass="character",
        DispatchClass="character",
        stringsAsFactors = FALSE
    )
}
