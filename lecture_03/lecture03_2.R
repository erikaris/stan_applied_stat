library(readr)
library(dplyr)
library(ggplot2)
library(plotly)

## calculation from simple random data ####

# calculating weigted mean
score <- c(80, 75, 65, 70, 60, 70)
wt <- c(3, 3, 2, 3, 3, 1)

score_avgw <- weighted.mean(score, wt)
print(score_avgw)

# weighted mean of grade
score2 <- c(89, 93, 100, 80, 96, 80)
wt2 <- c(0.35, 0.35, 0.03, 0.06, 0.105, 0.105)

grade <- weighted.mean(score2, wt2)
print(grade)

######### calculate median #######
median (score)

## calculation from covid data ##

covid11oct <- read_csv('corona_indonesia.csv')

names(covid11oct)

# preprocessing the data
covid11oct_mod <- covid11oct %>% 
                    rename(date = Date, total_kasus = 'Total Kasus', meninggal = Meninggal, sembuh = Sembuh, aktif = Aktif, kasus_baru = 'Kasus Baru') %>% 
                    mutate(month = factor(substr(date, 1, 3), levels = month.abb), dr_ratio = meninggal/sembuh, date = as.Date(date, "%b %d, %Y")) 

# mean of daily total_kasus
mean(covid11oct_mod$total_kasus)

# weighted mean of daily total_kasus with weight is the ratio between death and recover
weighted.mean(covid11oct_mod$total_kasus, covid11oct_mod$dr_ratio)

# boxplot of the total_kasus for each month
boxplot(total_kasus ~ month, covid11oct_mod)

# boxplot with ggplot of total_kasus
p <- ggplot(covid11oct_mod, aes(x = month, y = total_kasus, fill = month)) +   
      geom_boxplot(outlier.color = 'black', outlier.shape = 16, outlier.size = 2) +
      stat_boxplot(geom ='errorbar') +
      labs(title = "Boxplot of Covid-19 Total Cases in Indonesia 
           from March - October 11, 2020") +
      theme_minimal()

ggplotly(p)


################# boxplot with ggplot of kasus_baru
p <- ggplot(covid11oct_mod, aes(x = month, y = kasus_baru, fill = month)) +   
  geom_boxplot(outlier.color = 'black', outlier.shape = 16, outlier.size = 2) +
  stat_boxplot(geom ='errorbar') +
  labs(title = "Boxplot of Covid-19 New Cases in Indonesia 
           from March - October 11, 2020") +
  theme_minimal()

ggplotly(p)


################## calculate median for total_kasus
cov_med <- median(covid11oct_mod$total_kasus)
print(cov_med)


################ 5-number summary
summary(covid11oct_mod)


############ line plot
p2 <- ggplot(covid11oct_mod, aes(x = date, y = kasus_baru)) +
        geom_line() +
        labs(title = "Trend perkembangan kasus baru covid19 di Indonesia Maret - Oktober 2020")

ggplotly(p2)

