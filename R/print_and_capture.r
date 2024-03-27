print_and_capture <- function(x, spaces = 0) {
  checkmate::assert_vector(x)
  checkmate::assert_numeric(spaces, lower = 0, len = 1)
 str1 <- utils::capture.output(print(x))
 if ( spaces > 0) {
      str2 <- paste(rep(" ", spaces), collapse="")
      str1 <- paste(str2, str1)
 }
 paste(str1, collapse="\n")}
