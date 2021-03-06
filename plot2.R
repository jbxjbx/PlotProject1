plot2 <- function(){
        # begin with library
        library(dataplot)
        
        # retrieve data
        data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
        
        cleandata <- subset(cleandata,Date == "1/2/2007"| Date == "2/2/2007" )
        cleandata$Date <- as.Date(cleandata$Date, format = "%d/%m/%Y")
        cleandata$Time <- paste(cleandata$Date,cleandata$Time,sep = " ")
        cleandata$Time <- ymd_hms(cleandata$Time)
        
        # set the plotting device to png file
        png(filename = "./plot2.png",width = 480, height = 480)
        
        # plot graph
        with(cleandata,plot(Global_active_power ~ Time,type = "l",xlab= " ",
             ylab = "Global Active Power (kilowatts)" ))
        
        # close png device
        dev.off()
}
