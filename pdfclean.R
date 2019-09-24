getwd()
setwd("C:\\Users\\MOLAP\\Desktop\\Crime2\\Crimedatatemp")
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_201')
#install.packages("C:\\Users\\MOLAP\\AppData\\Local\\Temp\\Rtmp2V1K7O\\rJAVA",repos=NULL,type="win.binary")


library(pdftools)
library(tidyverse)
library(rJava)
library(tabulizer)
#prisondata <- pdf_text("C:\\Users\\MOLAP\\Desktop\\Crime2\\Northern Ireland Prison Population 2017_18.pdf")
prisondata <- c(data_frame())
for (i in 20){
  out <- as.data.frame(extract_tables("C:\\Users\\MOLAP\\Desktop\\Crime2\\Northern Ireland Prison Population 2017_18.pdf", page = i, method = 'stream',skip = 2), stringsAsFactors = FALSE)
  prisondata[[i]] <- out
}
out = out[-1:-3,]
out
out1<-separate(out, X2, into = c("V9", "V10"), sep = " ")
out2<-separate(out1, X3, into = c("V11", "V12"), sep = " ")
out3<-separate(out2, X4, into = c("V13", "V14"), sep = " ")
out3

out3$year20152016custody <- as.numeric(out3$V9) + as.numeric(out3$V10)
out3$year20162017custody <- as.numeric(out3$V11) + as.numeric(out3$V12)
out3$year20172018custody <- as.numeric(out3$V13) + as.numeric(out3$V14)
out3
out3 = subset(out3,select=-c(V9,V10,V11,V12,V13,V14))
out3

data<-t(as.matrix(out3[,2:4]))
#build the data.frame cbinding the needed columns
resout3<-cbind(out3[rep(1:nrow(out3),each=3),1],  #this repeats the first 4 columns 12 times each
               #Month=month.abb, #the month column
               Year <- c("2015-16","2016-17","2017-18"),
               #Year= as.vector(data[,]),# the R column, obtained from the first 12 rows of data
               out3_VAlue = as.vector(data[1:3, ]))

resout3 = resout3[-97:-102,]
resout3 = resout3[-43:-51,]

write.csv(resout3, "C:\\Users\\MOLAP\\Desktop\\Crime2\\Crimedatatemp\\prisondata.csv",na = " ", row.names = FALSE)

prisondata <- data.frame(read.csv(file="C:/Users/MOLAP/Desktop/Crime2/Crimedatatemp/prisondata123.csv"))
prisondata = prisondata[-76:-87,]
prisondata = prisondata[-64:-72,]
prisondata = prisondata[-55:-57,]
prisondata = prisondata[-49:-51,]
prisondata = prisondata[-34:-42,]
prisondata = prisondata[-22:-30,]
prisondata = prisondata[-13:-15,]
prisondata = prisondata[-7:-9,]
#prisondata$X <- NULL
#prisondata$X.1 <- ""
prisondata$PrisonID <- 501:536
str(prisondata)
prisondata$Years <- 2016:2018
prisondata$Crime_Type <- as.character(prisondata$Crime_Type)
write.csv(prisondata, "C:\\Users\\MOLAP\\Desktop\\Crime2\\Crimedatatemp\\prisondatafinal.csv",na = " ", row.names = FALSE)
