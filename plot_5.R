## Reading the data file
setwd("C:/Users/bdfitzgerald/Desktop/Data Science Specialist/exploratory_data_analysis/course_project_2/data/data")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Question 5: 
## How have emissions from motor vehicle sources 
## changed from 1999-2008 in Baltimore City?

## Subsetting data
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregates
MD.df <- aggregate(MD.onroad[, 'Emissions'], by = list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

## Plotting and saving data graph
library(ggplot2)
png('plot_5.png')
ggplot(data = MD.df, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity")  + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
dev.off()