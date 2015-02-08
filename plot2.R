plot2 <- function()
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
  png("F:/DataScience/ExploratoryAnalysis/ExData_Plotting1/plot2.png")
  
  ## Plot the histogram
  plot(samplePowerConsumption$dateTime, samplePowerConsumption$Global_active_power, 
       type = "l", ylab = "Global Active Power( kilowatts)", xlab = "")
  
  ## Turn off the device
  dev.off()

}