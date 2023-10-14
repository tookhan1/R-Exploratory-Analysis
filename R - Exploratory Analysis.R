
#########################
# This project helps demonstrate my skill and knowledge of R as well as my own analysis

# This data is about certain flowers and comparing their length and width

# Here are various ways through R we can create visualizations to help analyze the data 
#########################


#########################
# Loading Iris data set
#########################

library(datasets)
data(iris)

iris2 <- datasets::iris

# View the data

View(iris2)

#############################
# Display summary statistics
#############################

# head() / tail()
head(iris, 5)
tail(iris, 5)


# summary()
summary(iris)
summary(iris$Sepal.Length)


# Check to see if there are missing data?
sum(is.na(iris))

# skimr() - expands on summary() by providing larger set of statistics

install.packages("skimr")

library(skimr)

# Perform skim to display summary statistics

skim(iris)

# Group data by Species then perform skim

iris %>% 
  dplyr::group_by(Species) %>% 
  skim() 

#############################
# Data Visualization
#
# R base plot()
#############################


# Panel plots

plot(iris, col = "blue")

# Scatter plot

plot(iris$Sepal.Width, iris$Sepal.Length, col = "red",     
     xlab = "Sepal width", ylab = "Sepal length")

# Histogram

hist(iris$Sepal.Width, col = "red", title("Sepal Width"),     
     xlab = "Sepal Width", ylab = "Frequency")

# Feature plots

install.packages("caret")

library(caret)

featurePlot(x = iris[,1:4], 
            y = iris$Species, 
            plot = "box",
            strip=strip.custom(par.strip.text=list(cex=.7)),
            scales = list(x = list(relation="free"), 
                          y = list(relation="free")))

