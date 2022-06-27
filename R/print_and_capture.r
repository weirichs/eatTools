print_and_capture <- function(x, spaces = 0) {
 str1 <- capture.output(print(x))
 if ( spaces > 0) {
      str2 <- paste(rep(" ", spaces), collapse="")
      str1 <- paste(str2, str1)
 }
 paste(str1, collapse="\n")}
