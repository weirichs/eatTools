
seq2 <- function(from, to) {
  checkmate::assert_numeric(from, len = 1)
  checkmate::assert_numeric(to, len = 1)
  if (from > to) {
    integer()
  }
  else {
    seq.int(from, to)
  }
}
