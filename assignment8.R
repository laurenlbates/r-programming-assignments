#import data
# choose file interactively
student6 <- read.table(file.choose(), sep = ",", header = TRUE, stringsAsFactors = FALSE)
head(student6)

library(plyr)
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

#filter names containing "i"
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

#export filtered dataset
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)


