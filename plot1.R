plot1 <- function()
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
  samplePowerConsumption = subset(powerConsumption, powerConsumption$Date >= StartDate & powerConsumption$Date <= EndDate)

  ## Open the PNG file for graph creation
  png("F:/DataScience/ExploratoryAnalysis/ExData_Plotting1/plot1.png")
  
  ## Plot the histogram
  hist(as.numeric(samplePowerConsumption$Global_active_power),
       main = "Global Active Power", col = "red",
       xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  
  ## Turn off the device
  dev.off()

}