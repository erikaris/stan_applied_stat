# load the required libraries
library(readr)  # for reading csv
library(tidyr)  # for manipulating table
library(ggplot2) # for graph
library(readxl)

### anova example 1 ###########
data1 <- data.frame("sample1" = c(7,3,6,6), "sample2" = c(6,5,5,8), "sample3" = c(4,7,6,7))
# modify data1 for anova test
data1mod <- pivot_longer(data1, cols = c("sample1", "sample2", "sample3"), names_to = "sample_group")
data1mod_aov <- aov(value ~ sample_group, data = data1mod)
summary(data1mod_aov)

ggplot(data1mod, aes(x=sample_group, y = value, fill = sample_group)) + geom_boxplot() 

boxplot(value ~ sample_group, data = data1mod)
#bypass
# summary(aov(value ~ sample_group, data = data1mod))


#### anova example 2 #####
# try it for sample_group 2


#### anova example with chest data

# load the data
chest <- read_csv('chest.csv')

# take a look at the data
chest

# the data needs to be manipulated a bit. 
gathercols <- c('small_cars', 'medium_cars', 'large_cars')

chest2 <- chest %>% 
            gather(gathercols)

# do anova test on chest2
chest_aov <- aov(value ~ gathercols, data = chest2)
summary(chest_aov)


######## rank correlation for university data #########
uni <- read_csv('uni.csv')
# syntax: cor.test(x, y, method = "spearman")
uni_corrank <- cor.test(uni$overall, uni$selectivity, method = "spearman")
uni_corrank2 <- cor(uni$overall, uni$selectivity, method = "spearman")


######### rank correlation for cigarette #############
cigar <- read_excel('cigar.xlsx')
cor.test(cigar$tar, cigar$nicotine, method = 'spearman')

#### cari p-value
#pf(test_statistics, df1, df2, lower.tail = FALSE)
pf(0.1428, 2, 9, lower.tail = FALSE)



