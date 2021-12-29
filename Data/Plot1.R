
library(dplyr)
setwd("~/R/ExData_Plotting1/Data")

df  <-  read.csv('household_power_consumption.txt', sep=';', stringsAsFactors = FALSE) %>%  #stop reading values as factors
        filter(Date %in% c("1/2/2007","2/2/2007")) %>% # take only values in feb-1, feb-2
        mutate(Global_active_power = as.numeric(Global_active_power)) # change to numeric values for plto to work

head(df)

#Plot1- Histogram over time
options(scipen=100)
png("plottest.pdf") #create plot first
hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
