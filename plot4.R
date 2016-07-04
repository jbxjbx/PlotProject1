plot4 <- function(){
        # set library and dataset
        library(dataplot)
        data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
        
        # data clean
        cleandata <- subset(tidydata,Date == "1/2/2007"| Date == "2/2/2007" )
        cleandata$Date <- as.Date(cleandata$Date, format = "%d/%m/%Y")
        cleandata$Time <- paste(cleandata$Date,cleandata$Time,sep = " ")
        cleandata$Time <- ymd_hms(cleandata$Time)
        
        # set the plotting device to png file
        png(filename = "./plot4.png",width = 480, height = 480)
        
        # plot the graph
        par(mfrow=c(2,2)) 

           with(cleandata,plot(Global_active_power ~ Time,type = "l",xlab= " ",
                           ylab = "Global Active Power (kilowatts)" ))
           with(cleandata,plot(Voltage ~ Time,type = "l",xlab= "datatime",
                              ylab = "Global Active Power (kilowatts)" ))
           with(cleandata,plot(Sub_metering_1 ~ Time,type = "l",xlab= " ",
                           ylab = "Energy sub metering" ))
          lines(x=cleandata$Time,y=cleandata$Sub_metering_2,col= "red")
          lines(x=cleandata$Time,y=cleandata$Sub_metering_3,col= "blue")
          legend("topright",lty = 1,lwd= 2,col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
          with(cleandata,plot(Global_reactive_power ~ Time,type = "l",xlab= "datetime" ))
        
        dev.off()
}
