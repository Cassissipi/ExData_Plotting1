#Reading the file
dat<-(read.table
      ("household_power_consumption.txt", 
        header=TRUE, sep=";",
        colClasses = c("character", 
                       "character", 
                       "numeric", 
                       "numeric", 
                       "numeric", 
                       "numeric", 
                       "numeric", 
                       "numeric", 
                       "numeric"),
        na.strings = "?",
        stringsAsFactors = FALSE))

#Subsetting the wanted dates
newdata<-subset(dat, Date=="2/2/2007" | Date =="1/2/2007")

#Converting dates and time to Date/Time format
newdata$Date<-as.POSIXct(paste(newdata$Date, newdata$Time), 
                         format = "%d/%m/%Y %H:%M:%S")

#Removing uneeded column 
newdata$Time<-NULL

#Creating framework for multiple plots 
par(mfrow=c(2,2))

#Creating plots
plot(newdata$Date, 
     newdata$Global_active_power, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

plot(newdata$Date, 
     newdata$Voltage, 
     type="l", 
     ylab="Voltage", 
     xlab="datetime")

plot(newdata$Date, 
     newdata$Sub_metering_1, 
     type="l", 
     ylab="Energy sub meeting", 
     xlab="")
lines(newdata$Date, 
      newdata$Sub_metering_3, 
      col="blue")
lines(newdata$Date, 
      newdata$Sub_metering_2, 
      col="red")

plot(newdata$Date, 
      newdata$Global_reactive_power, 
      type="l", 
      ylab="Global_reactive_power", 
      xlab="datetime")

#Saving Plot
dev.copy(png, "plot4.png")
dev.off()

)