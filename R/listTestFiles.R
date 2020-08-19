#' List available test files 
#'
#' List all test files managed by \pkg{DropletTestFiles} on \pkg{ExperimentHub}.
#' 
#' @param hub An \linkS4class{ExperimentHub} object.
#' @param path String containing the \code{RDataPath} of the resource of interest.
#' @param prefix Logical scalar indicating whether \code{path} should be prefixed with \code{"DropletTestFiles/"}.
#' 
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
listTestFiles <- function(hub=ExperimentHub()) {
    out <- mcols(query(hub, "DropletTestFiles"))
    out[grepl("^DropletTestFiles/", out$rdatapath),]
}

#' @export
#' @rdname listTestFiles
getTestFile <- function(path, hub=ExperimentHub(), prefix=FALSE) {
    if (prefix) {
        path <- paste0("DropletTestFiles/", path)
    }
    hub[hub$rdatapath==path][[1]]
}
