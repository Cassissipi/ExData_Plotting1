#Reading the file
dat<-(read.table
      ("household_power_consumption.txt", 
        header=TRUE, sep=";",
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
        na.strings = "?",
        stringsAsFactors = FALSE))

#Subsetting the wanted dates
newdata<-subset(dat, Date=="2/2/2007" | Date =="1/2/2007")

#Converting dates and time to Date/Time format
newdata$Date<-as.POSIXct(paste(newdata$Date, newdata$Time), 
                         format = "%d/%m/%Y %H:%M:%S")

#Removing uneeded column 
newdata$Time<-NULL

#Plotting histogram
plot.1<-hist(newdata$Global_active_power, 
             col="red", 
             main="Global Active Power", 
             xlab = "Global Active Power (kilowatts)", 
             ylab = "Frequency")

#Saving plot
dev.copy(png, "plot1.png")
dev.off()