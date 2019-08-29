library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()

site <- paste("http://www.jobkorea.co.kr/")
remDr$navigate(site)

# 자바 검색
webElem <- remDr$findElement(using = "css","[name = 'stext']")
webElem$sendKeysToElement(list("자바",key="enter"))

page <- 1 
job <- NULL
cnt <- 0
repeat{
  for(i in 1:30){
    find <- paste0("#smGiList > div.list > ul > li:nth-child(",i,") > span.detailInfo > p.gibInfo > a")
    findtext <- remDr$findElements(using='css',find)
    tag <- sapply(findtext,function(x){x$getElementText()})
    print(tag)
    job <- c(job, unlist(tag))
  }
  
  page <- page+1
  if(page == 11 ){
    page <- 1
    cnt <- cnt+1
    if(cnt ==2 ){
      break
    }else{
      pageCss<- paste0("#smGiList > div.tplPagination > p > a")
    }
  }else{
    pageCss <- paste0("#smGiList > div.tplPagination > ul > li:nth-child(",page,") > a")
  }
  pageBtn <- remDr$findElements(using='css',pageCss)
  pageClick <- sapply(pageBtn,function(x){x$clickElement()})
  Sys.sleep(1)
}
job<- gsub(",","",job)
write(job,"jobwithjava.txt")


library(KoNLP)
useSejongDic()
word_data <- readLines("jobwithjava.txt")
word_data <- sapply(word_data, extractNoun, USE.NAMES = F)
undata <- unlist(word_data)
word_table <- table(undata)
word_table <- sort(word_table, decreasing = T)
write.csv(head(word_table, 15),"jobwithjava.csv",row.names=F,na="")


library(wordcloud2)
wordcloud2(word_table)
