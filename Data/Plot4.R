library(dplyr)
setwd("~/R/ExData_Plotting1/Data")

df  <-  read.csv('household_power_consumption.txt', sep=';', stringsAsFactors = FALSE) %>%  #stop reading values as factors
  filter(Date %in% c("1/2/2007","2/2/2007")) %>%  # take only values in feb-1, feb-2
  mutate(Global_active_power = as.numeric(Global_active_power))  # change to numeric values for plot to work 

df[,grep("Sub", colnames(df))] <- df %>% select(contains("Sub")) %>% mutate_if(is.character,as.numeric) #select columns matching str change to numeric

datetime = strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S") #Format Dates into Date Time to show period of time

png("Plot4.png")
par(mfrow = c(2, 2)) 


plot(datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, df$Sub_metering_2, type="l", col="red")
lines(datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()