##Unemployment data

library(readxl) 
library(plyr)
library(tibble)
library(dplyr)
library(sqldf)
#C:\\Users\\MOLAP\\Desktop\\
CrimeUnemp1 <- data.frame(read.csv(file="C:/Users/MOLAP/Desktop/Crime2/Crimedatatemp/series-040319.csv"),stringsAsFactors = FALSE)

CrimeUnemp1

CrimeUnemp1 = CrimeUnemp1[-1:-17,]
CrimeUnemp1 = CrimeUnemp1[-17:-461,]
##CrimeUnemp1 = CrimeUnemp1[-35:-41,]
##CrimeUnemp1 = CrimeUnemp1[-7]
CrimeUnemp1$UnempID <- 101:116
CrimeUnemp1$Years <- 2003:2018
str(CrimeUnemp1)
write.csv(CrimeUnemp1, "C:\\Users\\MOLAP\\Desktop\\Crime2\\Crimedatatemp\\unemp.csv", row.names = FALSE)
