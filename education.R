##education data####
library(readxl) 
library(plyr)
library(tibble)
library(dplyr)
library(sqldf)

edudata <- data.frame(read_excel("C:/Users/MOLAP/Desktop/Crime2/Crimedatatemp/HE-Enrolments-17-18-tables.xls", sheet="Table1"))
str(edudata)
edudata$...18 <- NULL
edudata$...3 <- NULL
edudata$...4 <- NULL
edudata$...5 <- NULL
edudata$...7 <- NULL
edudata$...8 <- NULL
edudata$...9 <- NULL
edudata$...11 <- NULL
edudata$...12 <- NULL
edudata$...13 <- NULL
edudata$...15 <- NULL
edudata$...16 <- NULL
edudata$...17 <- NULL
edudata$...18 <- NULL
edudata$...19 <- NULL
edudata = edudata[-38:-43,]
edudata = edudata[-3:-26,]
edudata 
edudata = edudata[-1,]
edudata = edudata[-2,]
colnames(edudata)[which(names(edudata) == "Table.1..Northern.Ireland.domiciled.students.enrolled.at.UK.HEIs.by.level.of.study..mode.of.study.and.location.of.institution....2008.09.to.2017.18")] <- "Years"
colnames(edudata)[which(names(edudata) == "...2")] <- "FirstDegree"
colnames(edudata)[which(names(edudata) == "...6")] <- "OtherUndergraduate"
colnames(edudata)[which(names(edudata) == "...10")] <- "Postgraduate"
colnames(edudata)[which(names(edudata) == "...14")] <- "Total"
edudata = edudata[-1,]

edudata$EduDataID <- 201:210
str(edudata)
edudata$Years <- 2009:2018

edudata$FirstDegree <- as.numeric(edudata$FirstDegree)
edudata$OtherUndergraduate <- as.numeric(edudata$OtherUndergraduate)
edudata$Postgraduate <- as.numeric(edudata$Postgraduate)
edudata$Total <- as.numeric(edudata$Total)
str(edudata)
write.csv(edudata, "C:\\Users\\MOLAP\\Desktop\\Crime2\\Crimedatatemp\\edudata.csv", row.names = FALSE)
