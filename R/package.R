#' The \pkg{DropletTestFiles} package
#'
#' The \pkg{DropletTestFiles} package stores files for droplet-based single-cell protocols, such as those generated from 10X Genomics' CellRanger software.
#' These files are primarily intended for testing of utilities (e.g., in \pkg{DropletUtils}) to handle raw pipeline output and are not (immediately) analysis-ready, unlike the SingleCellExperiment objects offered by \pkg{scRNAseq} and related packages.
#' (After all, without these files, how else would we test the functions that are required to \emph{make} such datasets analysis-ready?)
#' We store these files on ExperimentHub as this has better long-term availability guarantees than sourcing them from the origin. 
#'
#' @section 10X Genomics public datasets:
#' A number of public datasets are taken from the 10X Genomics website (\url{https://www.10xgenomics.com/resources/datasets/}):
#' \itemize{
#' \item \code{"tenx-2.0.1-nuclei_900"}, 
#' 1k brain nuclei from an E18 mouse,
#' single cell gene expression dataset by CellRanger 2.0.1.
#' \url{https://support.10xgenomics.com/single-cell-gene-expression/datasets/2.0.1/nuclei_900}.
#' \item \code{"tenx-2.1.0-pbmc4k"},
#' 4k PBMCs from a healthy donor,
#' single cell gene expression dataset by CellRanger 2.1.0.
#' \url{https://support.10xgenomics.com/single-cell-gene-expression/datasets/2.1.0/pbmc4k}.
#' \item \code{"tenx-3.0.0-pbmc_10k_protein_v3"},
#' 10k PBMCs from a healthy donor - gene expression and cell surface protein,
#' single cell gene expression dataset by CellRanger 3.0.0.
#' \url{https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.0.0/pbmc_10k_protein_v3}.
#' \item \code{"tenx-3.1.0-5k_pbmc_protein_v3"},
#' 5k Peripheral blood mononuclear cells (PBMCs) from a healthy donor with cell surface proteins (v3 chemistry),
#' single cell gene expression dataset by CellRanger 3.1.0.
#' \url{https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.1.0/5k_pbmc_protein_v3}.
#' \item \code{"tenx-4.0.0-SC3_v3_NextGem_DI_Neuron_10K"},
#' 10k mouse E18 combined cortex, hippocampus and subventricular zone cells, dual indexed,
#' single cell gene expression dataset by CellRanger 4.0.0.
#' \url{https://support.10xgenomics.com/single-cell-gene-expression/datasets/4.0.0/SC3_v3_NextGem_DI_Neuron_10K}.
#' \item \code{"tenx-atac-1.2.0-atac_pbmc_1k_nextgem"},
#' 1k peripheral blood mononuclear cells (PBMCs) from a healthy donor (Next GEM v1.1),
#' single cell ATAC dataset by CellRanger ATAC 1.2.0.
#' \url{https://support.10xgenomics.com/single-cell-atac/datasets/1.2.0/atac_pbmc_1k_nextgem}.
#' }
#'
#' @section Griffiths \emph{et al.} barcode swapping files:
#' The \code{"bach-mammary-swapping"} dataset provide the raw molecule information files from Griffiths et al. (2018).
#' This contains 10X Genomics data from eight samples of the mouse mammary gland that were multiplexed for sequencing on either the HiSeq 2500 (\code{"hiseq_2500/*"} files) or the HiSeq 4000 (\code{"hiseq_4000/*"} files, where the swapping takes effect).
#' Each sample is defined by its 10X library barcode (A1 - H1).
#' In addition, a replicate experiment was performed with a different set of 8 replicate samples (A7 - H7) on the HiSeq 2500; these are represented by the \code{"hiseq_2500_exp2/*"} files.
#' 
#' @references
#' Griffiths JA, Lun ATL, Richard AC, Bach K, Marioni JC (2018).
#' Detection and removal of barcode swapping in single-cell RNA-seq data.
#' \emph{Nat. Commun.} 9, 1:2667.
#'
#' Zheng GX, Terry JM, Belgrader P, and others (2017). 
#' Massively parallel digital transcriptional profiling of single cells.
#' \emph{Nat. Commun.} 8:14049.
#'
#' @seealso
#' \code{\link{listTestFiles}}, to see all files available for a particular dataset name.
#' 
#' @author Aaron Lun
#'
#' @name DropletTestFiles
#' @rdname DropletTestFiles-package
NULL
