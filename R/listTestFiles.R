#' List available test files 
#'
#' List all test files managed by \pkg{DropletTestFiles} on \pkg{ExperimentHub}.
#' 
#' @param hub An \linkS4class{ExperimentHub} object.
#' @param path String containing the \code{RDataPath} of the resource of interest.
#' @param prefix Logical scalar indicating whether \code{path} should be prefixed with \code{"DropletTestFiles/"}.
#' @param dataset String specifying the dataset to search for, e.g., \code{"tenx-2.1.0-pbmc4k"}.
#' By default, files are listed for all datasets.
#' @param version String specifying the version of the files to search for.
#' @param latest Logical scalar indicating whether the latest version of each file should be presented.
#' Only used if \code{version=NULL}; if \code{FALSE}, entries are returned for all versions.
#' 
#' @details
#' Versions refer to those of the \pkg{DropletTestFiles} package itself,
#' and refer to the version of the package in which a particular dataset was added.
#'
#' @return A \linkS4class{DataFrame} containing information on all relevant test files (one per row).
#' Of particular interest are the columns \code{file.dataset}, \code{file.version} and \code{file.name},
#' containing the dataset, version and name of each test file.
#' 
#' @author Aaron Lun
#'
#' @examples
#' # Getting everything:
#' listTestFiles()
#'
#' # Getting all files for a particular dataset.
#' out <- listTestFiles(dataset="tenx-3.1.0-5k_pbmc_protein_v3")
#' out
#'
#' # Downloading a resource to a local file, using an EH number:
#' library(ExperimentHub)
#' hub <- ExperimentHub()
#' hub[[rownames(out)[1]]]
#'
#' # Downloading the same resource using an RDataPath:
#' getTestFile(out$rdatapath[1], prefix=FALSE)
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
#' @importFrom AnnotationHub query
#' @importFrom S4Vectors mcols
#' @importFrom utils tail
listTestFiles <- function(hub=ExperimentHub(), dataset=NULL, version=NULL, latest=TRUE) {
    q <- "^DropletTestFiles"

    if (is.null(dataset)) {
        dataset <- "[^/]+"
    }
    q <- paste0(q, "/", dataset)

    if (!is.null(version)) {
        q <- paste0(q, "/", version)
    }

    candidates <- mcols(hub[grepl(q, hub$rdatapath)])

    fragments <- strsplit(candidates$rdatapath, "/")
    candidates$file.dataset <- datasets <- vapply(fragments, "[", i=2, "")
    candidates$file.version <- versions <- vapply(fragments, "[", i=3, "")
    candidates$file.name <- fname <- vapply(fragments, function(x) paste(tail(x, -3), collapse="/"), "")

    # Finding the latest version of each file.
    if (is.null(version) && latest) {
        V <- package_version(versions)
        sans.version <- paste0(datasets, "/", fname)
        X <- split(V, sans.version)
        maxed <- lapply(X, max)
        keep <- V == do.call(c, maxed[sans.version])
        candidates <- candidates[keep,]
    }

    candidates
}

#' @export
#' @rdname listTestFiles
getTestFile <- function(path, hub=ExperimentHub(), prefix=TRUE) {
    if (prefix) {
        path <- paste0("DropletTestFiles/", path)
    }
    hub[hub$rdatapath==path][[1]]
}
