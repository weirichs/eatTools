### data frame 1, variable 'y' with variable.label 'test participation'
df1 <- data.frame ( id = 1:3, sex = factor ( c("male", "male", "female")),
                    happy = c("low", "low", "medium"))
attr(df1[,"happy"], "variable.label") <- "happieness in the workplace"

### data frame 2 without labels
df2 <- data.frame ( id = as.factor(c(2,2,4)), status = factor ( c("married", "married", "single")),
                    convicted = c(FALSE, FALSE, TRUE))



test_that("maintain label", {
  messages <- capture.output(out <- mergeAttr(df1, df2, all = TRUE, onlyVarValLabs = FALSE))

  expect_equal(attr(out[,"happy"], "variable.label"), "happieness in the workplace")
  expect_equal(length(messages), 5)
  expect_equal(messages[1], "1 of 2 unit(s) of merging variable 'id' from data set 'y' not included in data set 'x'.")
  expect_equal(messages[2], "2 of 3 unit(s) of merging variable 'id' from data set 'x' not included in data set 'y'.")
  expect_equal(messages[3], "Merging levels are not unique in data set 'y'.")
  expect_equal(messages[4], "   Merging variable pair 'id'<==>'id' has different classes: 'integer'<==>'factor'. Classes will be homogenized to 'character'.")
  expect_equal(messages[5], "   Use 'homoClass = FALSE' to suppress this behavior.")
})

test_that("adapt messages", {
  messages <- capture.output(out <- mergeAttr(df1, df2, all = TRUE, onlyVarValLabs = FALSE, unitName = "student",
                   xName = "student questionnaire", yName = "school questionnaire",
                   verbose = c("match", "unique")))
  expect_equal(attr(out[,"happy"], "variable.label"), "happieness in the workplace")
  expect_equal(length(messages), 3)
  expect_equal(messages[1], "1 of 2 student(s) of merging variable 'id' from data set 'school questionnaire' not included in data set 'student questionnaire'.")
  expect_equal(messages[2], "2 of 3 student(s) of merging variable 'id' from data set 'student questionnaire' not included in data set 'school questionnaire'.")
  expect_equal(messages[3], "Merging levels are not unique in data set 'school questionnaire'.")
})


test_that("messages2", {
  df2[,"happy"] <- c(FALSE, FALSE, TRUE)
  messages <- capture.output(out <- mergeAttr(df1, df2, all = TRUE,
     setAttr=FALSE, by="id", verbose="common", suffixes = c("_first", "_second")))
  expect_equal(messages, "Additional common variables (beyond the 'by'-variables) found: 'happy'. Add suffixes '_first', '_second' to these variables in the result data.frame.")
})