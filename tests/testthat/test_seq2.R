
test_that("seq2", {
  expect_identical(seq2(1, 5), 1:5)
  expect_identical(seq2(-3, 0), -3:0)
  expect_identical(seq2(1, 0), integer())
})
test_that("non numeric input for seq2 throws an error", {
  expect_error(
    seq2("d", "t"),
    "Must be of type 'number', not 'character'"
  )
  expect_error(
    seq2("d"),
    "Must be of type 'number', not 'character'"
  )
  expect_error(
    seq2(TRUE, FALSE),
    "Must be of type 'number', not 'logical'"
  )
})
# add check for argument length
