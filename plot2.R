plot2 <- function() {
  ##  Set working directory
  setwd("C:/MyDoc/Reference/Coursera/004 Exploratory Data Analysis/Keep/Assignment/exdata_data_household_power_consumption")
  
  ## Extract Household Power Consumption text file
  hpc_data1 <- read.csv2(file="./household_power_consumption.txt",header=TRUE,as.is=TRUE) 
  
  ## Covert Date column into Date format under FormatDate
  hpc_data1$FormatDate <- as.Date(hpc_data1$Date,"%d/%m/%Y")
  
  ## Subset dataset where FormatDate between 2007-02-01 and 2007-02-02
  good = as.Date(c("1feb2007","2feb2007"), "%d%b%Y")
  hpc_data2 <- hpc_data1[hpc_data1$FormatDate %in% good, ]

  ## Convert Time column into Time format under FormatTime, create Weekday column
  hpc_data2$FormatTime <- strptime(paste(hpc_data2$Date, hpc_data2$Time), "%d/%m/%Y %H:%M:%S")
  hpc_data2$Weekday <- weekdays(hpc_data2$FormatDate)
  
  ## Set Global_active_power as numeric
  hpc_data2$Global_active_power <- as.numeric(hpc_data2$Global_active_power)
  
  ## Create Plot 2
  ##   Style: Scatterplot; without title
  ##   x-axis: Weekday; without title
  ##   y-axis: Global_active_power; with title "Global Active Power (kilowatts)"
  with(hpc_data2, plot(FormatTime,Global_active_power, type="l",
      xlab="",ylab="Global Active Power (kilowatts)"))
  
  ## Another option is to copy from screen device
  dev.copy(png, width = 480, height = 480, file = "plot2.png")

  ## Save the PNG file
  dev.off()
  }


