plot4 <- function() {
  ##  Set working directory
  setwd("C:/MyDoc/Reference/Coursera/004 Exploratory Data Analysis/Keep/Assignment/exdata_data_household_power_consumption")
  
  ## Extract Household Power Consumption text file
  hpc_data1 <- read.csv2(file="./household_power_consumption.txt",header=TRUE,as.is=TRUE) 
  
  ## Covert Date column into Date format under FormatDate
  hpc_data1$FormatDate <- as.Date(hpc_data1$Date,"%d/%m/%Y")
  
  ## Subset dataset where FormatDate between 2007-02-01 and 2007-02-02
  good = as.Date(c("1feb2007","2feb2007"), "%d%b%Y")
  hpc_data2 <- hpc_data1[hpc_data1$FormatDate %in% good, ]

  ## Convert Time column into Date Time format under FormatTime
  hpc_data2$FormatTime <- strptime(paste(hpc_data2$Date, hpc_data2$Time), "%d/%m/%Y %H:%M:%S")
  
  ## Set columns as numeric
  hpc_data2$Global_active_power <- as.numeric(hpc_data2$Global_active_power)
  hpc_data2$Sub_metering_1 <- as.numeric(hpc_data2$Sub_metering_1)
  hpc_data2$Sub_metering_2 <- as.numeric(hpc_data2$Sub_metering_2)
  hpc_data2$Sub_metering_3 <- as.numeric(hpc_data2$Sub_metering_3)
  hpc_data2$Voltage <- as.numeric(hpc_data2$Voltage)
  hpc_data2$Global_reactive_power <- as.numeric(hpc_data2$Global_reactive_power)
  
  ## Create Plot 4
  ## Style: 2x2 plots

  ## Set 2x2 graphs
  par(mfcol = c(2,2), mar = c(4,4,1,1))
  
  ## graph 1-1
  with(hpc_data2, plot(FormatTime,Global_active_power, type="l",
       xlab="",ylab="Global Active Power"))
  
  ## graph 1-2
  with(hpc_data2, plot(FormatTime,Sub_metering_1,type="l",col="grey",lwd=2,
       xlab="", ylab="Energy sub metering"))
  with(hpc_data2, lines(FormatTime,Sub_metering_2,col="red",lwd=2))
  with(hpc_data2, lines(FormatTime,Sub_metering_3,col="blue",lwd=2))
  legend("topright",lty=1,col=c("grey","blue","red"),bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## graph 2-1
  with(hpc_data2, plot(FormatTime,Voltage, type="l",xlab="datetime",ylab="Voltage"))
  
  ## graph 2-2
  with(hpc_data2, plot(FormatTime,Global_reactive_power,type="l",xlab="datetime"))
  
  ## Copy from screen device
  dev.copy(png, width = 480, height = 480, file = "plot4.png")

  ## Save the PNG file
  dev.off()
  
}


