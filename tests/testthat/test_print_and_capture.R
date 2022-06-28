
print_and_capture(mtcars[1:2, 1:2])


test_that("vector", {
  expect_equal(print_and_capture("This is a test."),
               "[1] \"This is a test.\"")
  expect_equal(print_and_capture(c("a", "b", "c"), spaces = 1),
               "  [1] \"a\" \"b\" \"c\"")
})


test_that("data.frame", {
  expect_equal(print_and_capture(mtcars[1:2, 1:2]),
               "              mpg cyl\nMazda RX4      21   6\nMazda RX4 Wag  21   6")
})

