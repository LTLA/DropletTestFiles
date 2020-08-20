#' List available test files 
#'
#' List all test files managed by \pkg{DropletTestFiles} on \pkg{ExperimentHub}.
#' 
#' @param hub An \linkS4class{ExperimentHub} object.
#' @param path String containing the \code{RDataPath} of the resource of interest.
#' @param prefix Logical scalar indicating whether \code{path} should be prefixed with \code{"DropletTestFiles/"}.
#' @param dataset String specifying the dataset to search for, e.g., \code{"tenx-2.1.0-pbmc4k"}.
#' By default, files are listed for all datasets.
#' @param version String specifying the version of the datasets to search for.
#' By default, files are listed for all versions.
#' 
#' @details
#' Versions refer to those of the \pkg{DropletTestFiles} package itself,
#' and refer to the state of the dataset at that version of the package.

#' @return A \linkS4class{DataFrame} containing information on all relevant test files.
#' 
#' @author Aaron Lun
#'
#' @examples
#' out <- listTestFiles()
#' out
#'
#' \dontrun{
#' # Downloading a resource to a local file, using an EH number:
#' ExperimentHub()[[rownames(out)[1]]]
#'
#' # Downloading a resource to a local file, using an RDataPath:
#' getTestFile(out$rdatapath[1])
#' }
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
#' @importFrom AnnotationHub query
#' @importFrom S4Vectors mcols
listTestFiles <- function(hub=ExperimentHub(), dataset=NULL, version=NULL) {
    q <- "^DropletTestFiles"

    if (!is.null(dataset)) {
        dataset <- "[^/]+"
    }
    q <- paste(q, "/", dataset)

    if (!is.null(version)) {
        version <- "[^/]+"
    }
    q <- paste(q, "/", version)

    mcols(query(hub, q))
}

#' @export
#' @rdname listTestFiles
getTestFile <- function(path, hub=ExperimentHub(), prefix=FALSE) {
    if (prefix) {
        path <- paste0("DropletTestFiles/", path)
    }
    hub[hub$rdatapath==path][[1]]
}
