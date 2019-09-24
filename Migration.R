library(readxl) 
library(plyr)
library(tibble)
library(dplyr)
library(sqldf)
Migration <- data.frame(read_excel("C:/Users/MOLAP/Desktop/Crime2/Crimedatatemp/MigrationNI.xlsx", sheet="northern-ireland-net-migration-"))
Migration$Geo_Name <- NULL
Migration$Geo_Code <- NULL
Migration$Gender <- NULL
Migration$Age <- NULL
Migration$Mid_Year_to_Mid_Year <-NULL
Migration$Net_Migration <- NULL
Migration = Migration[-18:-1456,]
Migration$MigrationID <- 301:317
str(Migration)
Migration$Years <- 2002:2018
write.csv(Migration, "C:\\Users\\MOLAP\\Desktop\\Crime2\\Crimedatatemp\\Migrations.csv", row.names = FALSE)
