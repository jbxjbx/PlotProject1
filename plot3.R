plot3 <- function(){
        # load library and dataset
        library(dataplot)
        data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
        
        # clean the data set
        
        cleandata <- subset(cleandata,Date == "1/2/2007"| Date == "2/2/2007" )
        cleandata$Date <- as.Date(cleandata$Date, format = "%d/%m/%Y")
        cleandata$Time <- paste(cleanata$Date,cleandata$Time,sep = " ")
        cleandata$Time <- ymd_hms(cleandata$Time)
        
        # set the plotting device to png file
        png(filename = "./plot3.png",width = 480, height = 480)
        
        # plot graph
        with(cleandata,plot(Sub_metering_1 ~ Time,type = "l",xlab= " ",
             ylab = "Energy sub metering" ))
        lines(x=cleandata$Time,y=cleandata$Sub_metering_2,col= "red")
        lines(x=cleandata$Time,y=cleandata$Sub_metering_3,col= "blue")
        legend("topright",lty = 1,lwd= 2,col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        # close png device
        dev.off()
}
