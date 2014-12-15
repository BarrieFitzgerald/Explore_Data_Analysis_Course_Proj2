## Reading the data file
SCC <- readRDS("data/Source_Classification_Code.rds")
NEI <- readRDS("data/summarySCC_PM25.rds")

## Question 2: 
## Of the four types of sources indicated by the type 
## (point, nonpoint, onroad, nonroad) variable, which 
## of these four sources have seen decreases in emissions
## from 1999-2008 for Baltimore City? Which have seen 
## increases in emissions from 1999-2008? Use the 
## ggplot2 plotting system to make a plot answer 
## this question.

## Sample Data of NEI
NEI_sample <- NEI[sample(nrow(NEI), size = 100, replace = FALSE),]

## Subsetting the data
MD <- subset(NEI, fips == '24510')
MD$year <- as.factor(MD$year)

## Plotting and saving the data graph
png('plot_3.png', width = 800, height = 500, units = 'px')
ggplot(data = MD, aes(x = year, y = log(Emissions))) + 
        facet_grid(. ~ type) + guides(fill = F) + 
        geom_boxplot(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + 
        ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + 
        xlab('Year') + ggtitle('Emissions per Type in Baltimore City, Maryland') + 
        geom_jitter(alpha = 0.10)
dev.off()