rm(list=ls(all=TRUE))
library(plyr)
library(dplyr)
## read file allowing first 2 fields as character (to be converted later)
power<-read.csv(file= "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header=TRUE, na.strings = "?",colClasses= c("character", "character", rep("numeric",7)), nrows=5)

power<-read.csv(file= "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header=FALSE, na.strings = "?",col.names=c('Date','Time','Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),colClasses= c("character", "character", rep("numeric",7)),skip= 66637, nrows=2880)
## covert Date 
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## concatenate Date and Time
power<-mutate(power, TS = paste(power$Date, power$Time))

## you have to use strptime() to convert the concatenated Date and Time columns. 
## power<-mutate(power, DTS = strptime(power$TS, format= '%Y-%m-%d %T')) ## Error: `mutate` does not support `POSIXlt` results
DTS<-strptime(power$TS, format= '%Y-%m-%d %T')
power<-cbind(power, DTS)
power<-tbl_df(power)