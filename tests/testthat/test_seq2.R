
test_that("seq2", {
  expect_identical(seq2(1, 5), 1:5)
  expect_identical(seq2(-3, 0), -3:0)
  expect_identical(seq2(1, 0), integer())
})
test_that("non numeric input for seq2 throws an error", {
  expect_error(
    seq2("d", "t"),
    "Assertion on 'from' failed: Must be of type 'numeric', not 'character'."
  )
  expect_error(
    seq2("d"),
    "Assertion on 'from' failed: Must be of type 'numeric', not 'character'."
  )
  expect_error(
    seq2(1, FALSE),
    "Assertion on 'to' failed: Must be of type 'numeric', not 'logical'."
  )
})
test_that("non-scalar input for either 'to' or 'from' argument for seq2 throws an error", {
  expect_error(
    seq2(1:3, 9),
    "Assertion on 'from' failed: Must have length 1, but has length 3."
  )
  expect_error(
    seq2(1, 3:9),
    "Assertion on 'to' failed: Must have length 1, but has length 7."
  )
})
