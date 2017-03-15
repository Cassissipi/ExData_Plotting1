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

#Creating line graph
plot.2<-plot(newdata$Date, 
     newdata$Global_active_power, 
     type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

#Saving plot
dev.copy(png, "plot2.png")
dev.off()