library(DescTools)
library(ggplot2)

# the low lead data
iq_low <- c(70, 85, 86, 76, 84, 96, 94, 56, 115, 97, 77, 128, 99, 80, 118, 86, 141, 88, 96, 96, 107, 86, 80, 107, 101, 91, 125, 96, 99, 99, 115, 106, 105, 96, 50, 99, 85, 88, 120, 93, 87, 98, 78, 100, 105, 87, 94, 89, 80, 111, 104, 85, 94, 75, 73, 76, 107, 88, 89, 96, 72, 97, 76, 107, 104, 85, 76, 95, 86, 89, 76, 96, 101, 108, 102, 77, 74, 92)

iq_high <- c(82, 93, 85, 75, 85, 80, 101, 89, 80, 94, 88, 104, 88, 88, 83, 104, 96, 76, 80, 79, 75)

iqdf <- data.frame(iq)

# minimum value of iq_low
min(iq_low)

# maximum value of iq_low
max(iq_low)

# create the frequency table of 5 classes
Freq(iq, breaks = 5)

# create the frequency table by defining lower and upper class limits
# similar to that of the slide. 
Freq(iq, breaks = c(50, 69, 89, 109, 129, 149))

# histogram basic R
hist(iq, xlim = c(49.5, 149.5), ylim = c(0, 40), breaks = 5, border = 'Green', col = "Red")

# histogram with ggplot
ggplot(iqdf, aes(iq)) + 
    geom_histogram(breaks=seq(49.5, 149.5, by = 20), col = 'green', fill = 'red') +
    labs(x = "iq score", y = "frequency") +
    xlim(c(49.5, 149.5))


# mtcars data
head(mtcars)
help(mtcars)

# scatterplot of mtcars
ggplot(mtcars, aes(x = wt, y = mpg)) + 
    geom_point(col = 'red') + 
    geom_line(col = 'blue')
