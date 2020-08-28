#' The \pkg{DropletTestFiles} package
#'
#' The \pkg{DropletTestFiles} package stores files for droplet-based single-cell protocols,
#' such as those generated from 10X Genomics' CellRanger software.
#' These files are primarily intended for testing of utilities (e.g., in \pkg{DropletUtils})
#' to handle raw pipeline output and are not (immediately) analysis-ready, 
#' unlike the SingleCellExperiment objects offered by \pkg{scRNAseq} and related packages.
#' (After all, without these files, how else would we test the functions that are required to \emph{make} such datasets analysis-ready?)
#' We store these files on ExperimentHub as this has better long-term availability guarantees than sourcing them from the origin. 
#' 
#' @author Aaron Lun
#'
#' @name DropletTestFiles
#' @rdname DropletTestFiles-package
NULL
