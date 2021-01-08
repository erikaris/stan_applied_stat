#install.packages(c('readr', 'ggplot2', 'ggpubr'))
library(readr) # for reading csv
library(ggplot2) # for creating plot
library(ggpubr) # for adding equation to the plot

# check the list of datasets available in RStudio
data()

# load the data
pizza <- read_csv('pizza.csv')
foot_height <- read_csv('foot_height.csv')
choco <- read_csv('choco.csv')
height <- read_csv('height.csv')

# calculating correlation for pizza
cor(pizza$cost_of_pizza, pizza$subway_fare)
cor.test(pizza$cost_of_pizza, pizza$subway_fare)

# correlation for foot height
cor(foot_height$foot, foot_height$height)
cor.test(foot_height$foot, foot_height$height)

# correlation for choco
cor(choco$chocolate, choco$nobel)
cor.test(choco$chocolate, choco$nobel)

# Pearson's critical value
critical.r <- function( n, alpha = .05 ) {
  df <- n - 2
  critical.t <- qt(alpha/2, df, lower.tail = F)
  critical.r <- sqrt( (critical.t^2) / ( (critical.t^2) + df ) )
  return(critical.r)
}
# Example usage: Critical correlation coefficient at sample size of n = 100
critical.r(23, 0.05)


#### REGRESSION #########

# generate the regression coefficient
pizza_lm <- lm(subway_fare ~ cost_of_pizza, data = pizza)
print(pizza_lm)
summary(pizza_lm) # get more details bout the model, including the se

# plot it
ggplot(pizza, aes(x = cost_of_pizza, y = subway_fare)) + 
  geom_point() +
  geom_smooth(method = "lm", col = "blue", se = F) + # add regression line
  stat_regline_equation(label.x = 0.2, label.y = 2) # add equation to the plot


#=============== infuential points =====================

pizza2 <- read_csv('pizza2.csv')

# generate the regression coefficient
pizza_lm2 <- lm(subway_fare ~ cost_of_pizza, data = pizza2)
print(pizza_lm2)

# plot it
ggplot(pizza2, aes(x = cost_of_pizza, y = subway_fare)) + 
  geom_point() +
  geom_smooth(method = "lm", col = "blue", se = F) + # add regression line
  stat_regline_equation(label.x = 0.5, label.y = 2) # add equation to the plot


#=============== residual plot ==========================

pizza_res <- resid(pizza_lm)   # check residual
print(pizza_res)

plot(fitted(pizza_lm), pizza_res) # plot the residual
abline(0, 0) # add a horizontal line at 0. 

# =========== standard error =====================

# method 1
summary(pizza_lm)

# method 2
sqrt(deviance(pizza_lm)/df.residual(pizza_lm))

# method 3: the longest one (step-by-step)
k=length(pizza_lm$coefficients)-1 #calculate the number of model parameters - 1
SSE=sum(pizza_lm$residuals**2)   #calculate sum of squared residuals
n=length(pizza_lm$residuals)        #calculate total observations in dataset
sqrt(SSE/(n-(1+k)))              #calculate residual standard error

#============= make a prediction & CI ============

# https://www.rdocumentation.org/packages/car/versions/3.0-10/topics/Predict

predict(pizza_lm, newdata= data.frame(cost_of_pizza = 2.25), interval = "confidence", level = 0.95) # CI for one particular prediction
predict(pizza_lm, newdata= data.frame(cost_of_pizza = 2.25), interval = "prediction", level = 0.95) # CI for the whole prediction. 


#========= Multiple Regression ================

daughter_lm <- lm(daughter ~ mother + father, data = height)
print(daughter_lm)
summary(daughter_lm)