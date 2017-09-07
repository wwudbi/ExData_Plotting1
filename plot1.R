plot1 <- function() {
  ##  Set working directory
  setwd("C:/MyDoc/Reference/Coursera/004 Exploratory Data Analysis/Keep/Assignment/exdata_data_household_power_consumption")
  
  ## Extract Household Power Consumption text file
  hpc_data1 <- read.csv2(file="./household_power_consumption.txt",header=TRUE,as.is=TRUE) 
  
  ## Covert Date column into Date format under FormatDate
  hpc_data1$FormatDate <- as.Date(hpc_data1$Date,"%d/%m/%Y")
  
  ## Subset dataset where FormatDate between 2007-02-01 and 2007-02-02
  good = as.Date(c("1feb2007","2feb2007"), "%d%b%Y")
  hpc_data2 <- hpc_data1[hpc_data1$FormatDate %in% good, ]

  ## Convert Time column into Time format under FormatTime  
  hpc_data2$FormatTime <- strptime(paste(hpc_data2$Date, hpc_data2$Time), "%d/%m/%Y %H:%M:%S")
  
  ## Set Global_active_power as numeric
  hpc_data2$Global_active_power <- as.numeric(hpc_data2$Global_active_power)
  
  ## Open PNG file
  png("plot1.png", width = 480, height = 480)

  ## Create Plot 1
  ##   Style: Histogram; with title "Global Active Power"
  ##   x-axis: Global_active_power; with title "Global Active Power (kilowatts)"
  hist(hpc_data2$Global_active_power, col="red", ylab = "Frequency", 
       xlab="Global Active Power (kilowatts)",main="Global Active Power")

  ## Another option is to copy from screen device
  ##dev.copy(png, width = 480, height = 480, file = "plot1.png")

  ## Save the PNG file
  dev.off()
  

  }


