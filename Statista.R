library(readxl) 
library(plyr)
library(tibble)
library(dplyr)

Statista <- data.frame(read_excel("C:/Users/MOLAP/Desktop/Crime2/Crimedatatemp/statistic_id915961_number-of-police-recorded-crimes-in-northern-ireland-2002-2018.xlsx", sheet="Data"))
#Number_of_police_recorded_crimes_in_Northern_Ireland_2002_2018 <- Statista[-1:-2, 1] 
#Number_of_offences <- Statista[-1:-2, 2]
Statista = Statista[-1:-2,]
#Statista <- data.frame(Number_of_police_recorded_crimes_in_Northern_Ireland_2002_2018,Number_of_offences)
colnames(Statista) = c("Years","Number_of_offences") 
Statista$StatistaID <- 1:16
Statista$Years <- 2003:2018
str(Statista)
Statista$Number_of_offences <- as.numeric(Statista$Number_of_offences)
write.csv(Statista, "C:\\Users\\MOLAP\\Desktop\\Crime2\\Crimedatatemp\\statistadata.csv", row.names = FALSE)
