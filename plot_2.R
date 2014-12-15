## Reading the data file

SCC <- readRDS("data/Source_Classification_Code.rds")
NEI <- readRDS("data/summarySCC_PM25.rds")

## Question 2: 


## Sample Data of NEI
NEI_sample <- NEI[sample(nrow(NEI), size = 100, replace = FALSE),]

