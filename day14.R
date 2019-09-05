install.packages("DBI");
library(DBI)
install.packages("RJDBC");
library(RJDBC)

#DB 서버 접속
drv <- JDBC("oracle.jdbc.driver.OracleDriver","C:/unico/ojdbc6.jar")
conn <- dbConnect(drv, "jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest")

# 테이블 리스트 추출     
dbListTables(conn)

# 테이블에 저장된 데이터 읽기
result1 <- dbReadTable(conn, "VISITOR")
result2 <- dbGetQuery(conn, "SELECT * FROM VISITOR")
mode(result)

rs <- dbSendQuery(conn, "SELECT * FROM VISITOR")

ret1 <- dbFetch(rs)
ret2  <- dbFetch(rs,1)

# 테이블에 데이터 저장하기 
dbWriteTable(conn,"book",
             data.frame(bookname=c("자바의 정석","하둡 완벽 입문","이것이 리눅스다"),
                        price=c(30000,25000,32000)))
dbWriteTable(conn, "cars", head(cars,3))

dbSendUpdate(conn,"INSERT INTO VISITOR VALUES('R 언어', sysdate,'R 언어로 데이터를 입력해요')")

#강사님이 visitor_seq 값 줘야한다했는데 주면 에러남 
#dbSendUpdate(conn,"INSERT INTO VISITOR VALUES('R 언어', sysdate,'R 언어로 데이터를 입력해요', visitor_seq.nextval)")

dbSendUpdate(conn,"INSERT INTO VISITOR VALUES('하둡', sysdate,'대용량 데이터 분산저장& 처리기술')")

# 데이터 수정 
dbSendUpdate(conn, "INSERT INTO cars (speed, dist) VALUES (1,1)")

dbSendUpdate(conn, "INSERT INTO cars (speed, dist) VALUES (2,2)")
dbReadTable(conn,"CARS")

dbSendUpdate(conn, "UPDATE CARS SET DIST = DIST * 100 WHERE SPEED = 1")
dbReadTable(conn, "CARS")

dbSendUpdate(conn, "UPDATE CARS SET DIST = DIST * 3 WHERE SPEED = 1")
dbReadTable(conn,"CARS")

# 테이블 삭제 
dbRemoveTable(conn, "CARS")

# 예제1
df <- read.table("product_click.log", stringsAsFactors = F)
names(df) <- c("click_time", "pid")
df$click_time <- as.character(df$click_time)
dbWriteTable(conn, "productlog",df)
result4 <- dbReadTable(conn, "PRODUCTLOG")
result4

#예제2
dbWriteTable(conn, "mtcars", mtcars)
rs <- dbSendQuery(conn, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(rs)
dbClearResult(rs)

rs <- dbSendQuery(conn, "SELECT * FROM mtcars")
ret1 <- dbFetch(rs,10)
ret1
ret2 <- dbFetch(rs)
ret2
dbClearResult(rs)

nrow(ret1)
nrow(ret2)

# Java 와 R 연동
install.packages("Rserve")

#Rserve 기동 
#Rserve(args="--RS-encoding utf8")

