
test_that("seq2", {
  expect_identical(seq2(1, 5), 1:5)
  expect_identical(seq2(-3, 0), -3:0)
  expect_identical(seq2(1, 0), integer())
})
