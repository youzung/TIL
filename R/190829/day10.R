install.packages("reshape2")
library(reshape2)

tail(airquality)
str(airquality)
View(airquality)
head(airquality)
names(airquality)
dim(airquality)

names(airquality) <- tolower(names(airquality))

melt_test <- melt(airquality)
head(melt_test)
tail(melt_test)

melt_test2 <- melt(airquality, id.vars = c("month", "wind"), measure.vars = "ozone" )
head(melt_test2)

install.packages("KoNLP")
install.packages("wordcloud2")
install.packages("wordcloud")

library(KoNLP)

word_data <- readLines("book/애국가(가사).txt")
word_data


useSejongDic()

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

add_words <- c("백두산", "남산", "철갑", "가을", "하늘", "달")
buildDictionary(user_dic = data.frame(add_words, rep("ncn",length(add_words))),replace_usr_dic = T)

