
seq2 <- function(from, to) {
  checkmate::assert_number(from)
  checkmate::assert_number(to)
  if (from > to) {
    integer()
  }
  else {
    seq.int(from, to)
  }
}
