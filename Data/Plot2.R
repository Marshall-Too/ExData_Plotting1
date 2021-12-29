library(dplyr)
setwd("~/R/ExData_Plotting1/Data")

df  <-  read.csv('household_power_consumption.txt', sep=';', stringsAsFactors = FALSE) %>%  #stop reading values as factors
  filter(Date %in% c("1/2/2007","2/2/2007")) %>% # take only values in feb-1, feb-2
  mutate(Global_active_power = as.numeric(Global_active_power)) # change to numeric values for plot to work %>%

df$Date2 = strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S") #Format Dates into Date Time to show period of time

png("plot2.png")
plot(df$Date2, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()