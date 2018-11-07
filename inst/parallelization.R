# install.packages("checkpoint")
checkpoint::checkpoint("2018-07-24")
# install.packages(c("future", "doFuture", "foreach"))
# devtools::install()

stopifnot(packageVersion("future") >= "1.9.0")

future::plan("sequential")
test1::f()
test1::f2()

future::plan("multisession")
test1::f()
test1::f2()
