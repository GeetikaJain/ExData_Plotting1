plot3 <- function()
{
  
  ## Set working directory to path of the file
  setwd("F:/DataScience/ExploratoryAnalysis/exdata-data-household_power_consumption")

  ## Read the file into powerConsumption
  powerConsumption = read.table("household_power_consumption.txt", header = TRUE, sep = ";",colClasses = "character")

  ## Convert Date to correct format
  powerConsumption$Date = as.Date(powerConsumption$Date, "%d/%m/%y%y")

  ## Start and End date for period of observation
  StartDate = as.Date("2007-02-01")
  EndDate = as.Date("2007-02-02")

  ## Take sample from 2007-02-01 to 2007-02-02
  samplePowerConsumption = subset(powerConsumption, 
                                  powerConsumption$Date >= StartDate & powerConsumption$Date <= EndDate)

  samplePowerConsumption$dateTime = as.POSIXct(paste(samplePowerConsumption$Date, samplePowerConsumption$Time), 
                                               format="%Y-%m-%d %H:%M:%S")
  
  ## Open the PNG file for graph creation
  png("F:/DataScience/ExploratoryAnalysis/ExData_Plotting1/plot3.png")
  
 
  plot(samplePowerConsumption$dateTime, samplePowerConsumption$Sub_metering_1, type = "l", ylab = " Energy Sub Metering", xlab = "")
  lines(samplePowerConsumption$dateTime, samplePowerConsumption$Sub_metering_2, col = "red")
  lines(samplePowerConsumption$dateTime, samplePowerConsumption$Sub_metering_3, col = "blue")
  legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
  
 
  ## Turn off the device
  dev.off()

}