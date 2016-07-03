plot1 <- function(){
        # begin with loading library
        library(dataplot)
        
        # retrieve the data
        data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
        
        # get the clean data
        
        cleandata <- subset(data,Date == "1/2/2007"| Date == "2/2/2007" )
        cleandata$Date <- as.Date(tidydata$Date, format = "%d/%m/%Y")
        cleandata$Time <- paste(tidydata$Date,tidydata$Time,sep = " ")
        cleandata$Time <- ymd_hms(tidydata$Time)
        
        # set the plotting device to png file
        png(filename = "./plot1.png",width = 480, height = 480)
        
        # plot the figure
        hist(cleandata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
             ylab= "Frequency", main = "Global Active Power",ylim = range(c(0,200,400,600,800,1000,1200)))
             
        dev.off()
}
