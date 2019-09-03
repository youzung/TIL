library("readxl")
ck <- read_excel("book/치킨집_가공.xlsx")
head(ck)

addr<-substr(ck$소재지전체주소,11,16)
head(addr)

addr_num<-gsub("[0-9]", "", addr) #숫자 제거
addr_trim <- gsub(" ", "", addr_num) #공백제거거
head(addr_trim)

library(dplyr)
#도수분포표 작성 후 데이터 프레임으로 변환
addr_count <- addr_trim %>% table() %>% data.frame()
head(addr_count)

install.packages("treemap")
library(treemap)

treemap(addr_count, index=".", vSize="Freq", title = "서대문구 동별 치킨집 분포포")

#내림차순으로 실제 데이터 확인
arrange(addr_count, desc(Freq)) %>%  head()


library(readxl)
dustdata <- read_excel("book/dustdata.xlsx")
View(dustdata)
str(dustdata)

dustdata_anal <- dustdata %>% filter(area %in% c("성북구", "중구"))
View(dustdata_anal)

#dustdata_anal 데이터 세트에 yyyymmdd에 따른 데이터 수 파악
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
#dustdata_anal 데이터 세트에 area에 따른 데이터 수 파악
count(dustdata_anal, area) %>% arrange(desc(n))

#area값이 성북구인 데이터를 dust_anal_area_sb에 할당
dust_anal_area_sb <- subset(dustdata_anal, area == "성북구")

#dust값이 중구인 데이터르 dust_anal_area_jg에 할당
dust_anal_area_jg <- subset(dustdata_anal, area=="중구")

#데이터 확인해 보삼

install.packages("psych")
library(psych)

#성북구의 미세먼지량에 대한 기초 통계량 도출
describe(dust_anal_area_sb$finedust)

#중구
describe(dust_anal_area_jg$finedust)

#성북구와 중구의 미세먼지 농도에 대해 boxplot을 통한 분포 차이 확인
boxplot(dust_anal_area_sb$finedust, dust_anal_area_jg$finedust,
        main = "finedust_compare", xlab="AREA", names = c("성북구", "중구"),
        ylab="FINEDUST_PM", col = c("blue", "green"))

#dustdata_anal데이터 세트에서 측정소명(area)에 따라 미세먼지 농도 평균에 대한 차이를 검증
t.test(data=dustdata_anal, finedust ~ area, var.equal=T)

installed.packages()

library(twitteR)
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)

keyword <- enc2utf8("월드컵")
bigdata <- searchTwitter(keyword, n=100, lang="ko")
bigdata_df <- twListToDF(bigdata)
str(bigdata_df)
bigdata_text <- bigdata_df$text
head(bigdata_text)

library(KoNLP)
useSejongDic()
library(dplyr)
bigdata_noun<- sapply(bigdata_text, extractNoun, USE.NAMES = F)
bigdata_noun <- unlist(bigdata_noun)
bigdata_noun <- Filter(function(x) { nchar(x) >=2 }, bigdata_noun)
bigdata_noun <- gsub("[A-Za-z0-9]","", bigdata_noun)
bigdata_noun <- gsub("[~!@#$%^&*()-_|+=?:]","",bigdata_noun)
bigdata_noun <- gsub("[ㄱ-ㅎ]","", bigdata_noun)
bigdata_noun <- gsub("(ㅜ|ㅠ)+","", bigdata_noun)

word_table<-table(bigdata_noun)

library(wordcloud2)

wordcloud2(word_table, fontFamily = "맑은 고딕", size =5, color ="random-light",backgroundColor="black")

#아파트 실거래가
library(ggmap)
register_google(key='AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY')

apart_data <- read.csv("book/아파트(매매)__실거래가_20180513144733.csv")
head(apart_data)
apart_data$전용면적 = round(apart_data$전용면적)
head(apart_data)

count(apart_data, 전용면적) %>% arrange(desc(n))

apart_data_85 <- subset(apart_data, 전용면적 == "85")

apart_data_85$거래금액 <- gsub(",", "", apart_data_85$거래금액)
head(apart_data_85)

apart_data_85_cost <- aggregate(as.integer(거래금액) ~ 단지명, apart_data_85, mean)
head(apart_data_85_cost)

apart_data_85_cost <- rename(apart_data_85_cost, "거래금액" = "as.integer(거래금액)")
head(apart_data_85_cost)


#tm패키지 관련 소스
install.packages("tm")
library(tm)

lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps)
tdm

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
tdm
(m <- as.matrix(tdm))

rowSums(m)
colSums(m)

com <- m %*% t(m)


install.packages("tm")
library(tm)

lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps)
tdm
as.matrix(tdm)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
tdm
(m <- as.matrix(tdm))

rowSums(m)
colSums(m)

com <- m %*% t(m)  
com

install.packages("qgraph")
library(qgraph)

qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))


install.packages("proxy")
library(proxy)
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)
cps <- Corpus(VectorSource(dd))
dtm <- DocumentTermMatrix(cps)
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)

dist(com, method = "cosine")
dist(com, method = "Euclidean")
