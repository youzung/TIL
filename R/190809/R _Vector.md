## R _Vector

LETTERS : Capital Letter ('A' ~'Z')

letters : Small Letter('a' ~'z')

month.name = "January" ~ "December"

month.abb = "Jan " ~ "Dec"

pi = 3.141593

![캡처](C:\Users\student\Desktop\캡처.PNG)



(z<-1:10);
(z1<-10:1)
(z2<- -5:5)
(z3<- seq(1,20,2))
(z4<- seq(20))
(z5<-seq(from=1, to=20, by=2))
(z6<- seq(to=20, by=2, from=1))

![캡처](C:\Users\student\Desktop\캡처.PNG)



rep(9,5)
rep(1:5,3) #rep(1:5, times=3)
rep(1:5, each=3)
sample(1:20,3) #1~20 사이 3개의 random값
sample(1:45,6)
sample(1:10,7, replace=T) #replace = 중복값 허용(기본값:F)

![캡처](C:\Users\student\Desktop\캡처.PNG)





c(T,T,F,F) & c(T,F,T,F)
c(T,T,F,F) | c(T,F,T,F)
c(T,T,F,F) && c(T,F,T,F) #첫번째 값끼리만 비교
c(T,T,F,F) || c(T,F,T,F)

![캡처](C:\Users\student\Desktop\캡처.PNG)



ls()
rm(num2)
class(x)
class(LETTERS)
summary(LETTERS)

![캡처](C:\Users\student\Desktop\캡처.PNG)



rainfall <-c(21.6, 23.6,45.8,
             77.0,102.2,133.3,
             327.9,348.0,137.6,
             49.3,53.0,24.9)
rainfall > 100
rainfall[rainfall > 100]
month.name[which(rainfall>100)]
month.abb[which(rainfall>100)]
month.korname<-c("1월","2월","3월","4월",
                 "5월","6월","7월","8월",
                 "9월","10월","11월","12월")
month.korname[which(rainfall>100)]
which.max(rainfall)
which.min(rainfall)

![캡처](C:\Users\student\Desktop\캡처.PNG)



