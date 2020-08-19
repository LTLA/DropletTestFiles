#' @importFrom utils download.file
download10xData <- function(files, base, prefix, version, short, long, BiocVersion, Genome, SourceUrl) {
    target <- file.path("DropletTestFiles", prefix, version)
    dir.create(target, recursive=TRUE)

    for (f in seq_len(nrow(files))) {
        dest <- file.path(target, files$output[f])
        if (!file.exists(dest)) {
            download.file(file.path(base, files$name[f]), dest)
        }
    }

    plain <- files$description
    plain2 <- sprintf("%s%s", toupper(substr(plain, 1,1)), substr(plain, 2, nchar(plain)))

    Species <- c(hg38="Homo sapiens", mm10="Mus musculus")[[Genome]]
    TaxonomyId <- c(`Homo sapiens`="9606", `Mus musculus`="10090")[[Species]]
    SourceType <- rep(NA_character_, nrow(files))
    SourceType[grep("\\.tar\\.gz$", files$name)] <- "tar.gz"
    SourceType[grep("\\.h5$", files$name)] <- "HDF5"

    data.frame(
        Title = sprintf("%s %s", short, plain),
        Description = sprintf("%s for %s", plain2, long),
        RDataPath = file.path(target, files$output),
        BiocVersion=BiocVersion,
        Genome=Genome,
        SourceType=SourceType,
        SourceUrl=SourceUrl,
        SourceVersion=files$name,
        Species=Species,
        TaxonomyId=TaxonomyId,
        Coordinate_1_based=NA,
        DataProvider="10X Genomics",
        Maintainer="Aaron Lun <infinite.monkeys.with.keyboards@gmail.com>",
        RDataClass="character",
        DispatchClass="FilePath",
        stringsAsFactors = FALSE
    )
}
