# This tests various characteristics of the listing function.
# library(testthat); library(DropletTestFiles); source("test-list.R")

test_that("listTestFiles works under various circumstances", {
    out <- listTestFiles()
    expect_true(nrow(out) > 0)
    expect_true(all(grepl("^DropletTestFiles", out$rdatapath)))

    out2 <- listTestFiles(dataset="tenx-2.1.0-pbmc4k")
    expect_true(nrow(out2) < nrow(out))
    expect_true(all(grepl("^DropletTestFiles/tenx-2.1.0-pbmc4k", out2$rdatapath)))

    out2 <- listTestFiles(version="1.0.0")
    expect_true(nrow(out2) <= nrow(out))
    expect_true(all(grepl("/1.0.0/", out2$rdatapath)))

    out3 <- listTestFiles(latest=FALSE)
    expect_true(nrow(out3) >= nrow(out))
})

test_that("getTestFile works as expected", {
    library(ExperimentHub)
    hub <- ExperimentHub()
    out <- listTestFiles()

    expect_identical(
        hub[[rownames(out)[1]]],
        getTestFile(out$rdatapath[1])
    )
})
