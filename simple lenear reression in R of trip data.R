library(dplyr)
library(caTools)
library(ggplot2)

dataset <- read.csv('C:/Users/k18at/Downloads/taxi_trip_pricing.csv')

dataset <- dataset %>%
  filter(!is.na(Trip_Duration_Minutes), !is.na(Trip_Price))

set.seed(123)
split <- sample.split(dataset$Trip_Price, SplitRatio = 0.66)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

regressor <- lm(Trip_Price ~ Trip_Duration_Minutes, data = training_set)
l
summary(regressor)

ggplot() +
  geom_point(aes(x = training_set$Trip_Duration_Minutes, y = training_set$Trip_Price), colour = 'red') +
  geom_line(aes(x = training_set$Trip_Duration_Minutes, y = predict(regressor, newdata = training_set)), colour = 'blue') +
  ggtitle('Trip_Price vs Trip_Duration_Minutes (Training Set)') +
  xlab('Trip_Duration_Minutes') +
  ylab('Trip_Price')

ggplot() +
  geom_point(aes(x = test_set$Trip_Duration_Minutes, y = test_set$Trip_Price), colour = 'red') +
  geom_line(aes(x = training_set$Trip_Duration_Minutes, y = predict(regressor, newdata = training_set)), colour = 'blue') +
  ggtitle('Trip_Price vs Trip_Duration_Minutes (Test Set)') +
  xlab('Trip_Duration_Minutes') +
  ylab('Trip_Price')

                 