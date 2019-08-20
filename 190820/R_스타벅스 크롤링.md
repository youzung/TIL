## 스타벅스 서울 매장 웹 크롤링

```R
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()

site <- paste("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
remDr$navigate(site)

#서울 클릭
seoul<-remDr$findElements(using='css',  "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1)")
sapply(seoul,function(x){x$clickElement()})  

#전체 클릭
listAll<-remDr$findElements(using='css',  "#mCSB_2_container > ul > li:nth-child(1)")
sapply(listAll,function(x){x$clickElement()})   

store<-NULL
page<-0
total <- sapply(remDr$findElements(using='css',"#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span"),function(x){x$getElementText()})

repeat{
  page<-page+1
  
  AllStoresCSS <- paste('#mCSB_3_container > ul > li:nth-child(',page,')', sep='')
  AllStores<-remDr$findElements(using='css', AllStoresCSS)
  #print(AllStores)
  if(length(AllStores)==0)
    break
  storeInfo <-sapply(AllStores,function(x){x$getElementText()})    
  #print(storeInfo)

   #정보 추출
  storeInfoList <-strsplit(unlist(storeInfo),split="\n")
  info <- unlist(storeInfoList)
  storeName <- info[1]
  storeAddr <- info[2]
  storePhone <- info[3]
  
  lat_v <- sapply(AllStores,function(x){x$getElementAttribute("data-lat")})
  lng_v <- sapply(AllStores,function(x){x$getElementAttribute("data-long")})
  
  lat <- unlist(lat_v)
  lng <- unlist(lng_v)
  
  result <- data.frame(storeName, storeAddr, storePhone, lat, lng)
  store <- rbind(store, result)
  
    #스크롤 다운
  if(page %% 3 == 0 && page != total ){
    remDr$executeScript("var dom=document.querySelectorAll('#mCSB_3_container > ul > li')[arguments[0]]; dom.scrollIntoView();", list(page))
  }
  
}

print(store)
write.csv(store, "starbucks.csv")

```

