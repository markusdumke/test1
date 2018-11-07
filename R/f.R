#' @export
f <- function() {
  `%dopar%` <- foreach::`%dopar%`
  doFuture::registerDoFuture()
  libs <- .libPaths()

  res <- foreach::foreach(x = 1:2) %dopar% {

    cat(sprintf("Initial Library paths used by worker (PID %d):\n", Sys.getpid()))
    cat(sprintf(" - %s\n", sQuote(.libPaths()[1])))

    ## Use the same library paths as the master R session
    .libPaths(libs)

    cat(sprintf("Library paths used by worker (PID %d):\n", Sys.getpid()))
    cat(sprintf(" - %s\n", sQuote(.libPaths()[1])))

    x + g()
  }

  res
}

#' @export
f2 <- function() {
  `%dopar%` <- foreach::`%dopar%`
  doFuture::registerDoFuture()
  libs <- .libPaths()

  res <- foreach::foreach(x = 1:2) %dopar% {

    cat(sprintf("Initial Library paths used by worker (PID %d):\n", Sys.getpid()))
    cat(sprintf(" - %s\n", sQuote(.libPaths()[1])))

    ## Use the same library paths as the master R session
    .libPaths(libs)

    cat(sprintf("Library paths used by worker (PID %d):\n", Sys.getpid()))
    cat(sprintf(" - %s\n", sQuote(.libPaths()[1])))

    x + test1:::g()
  }

  res
}


g <- function() {
  h()
}

h <- function() {
  runif(1)
}
