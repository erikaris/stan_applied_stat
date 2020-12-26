# slide 14
# expected value = weighted mean
x <- c(0, 1, 2, 3, 4)
x2 <- x^2
px <- c(0.2, 0.1, 0.3, 0.3, 0.1)

ex <- weighted.mean(x, px)
print(ex)

# computing variance
ex2 <- weighted.mean(x2, px)
varx <- ex2 - (ex^2)
print(varx)

#==========================================
# slides 16
# number of girls
girlX <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
girlPx <- c(0.001, 0.01,	0.044,	0.117,	0.205,	0.246,	0.205,	0.117,	0.044,	0.01,	0.001)

girlEx <- weighted.mean(girlX, girlPx)
print(girlEx)

# variance number of girls
girlX2 <- girlX^2
girlEx2 <- weighted.mean(girlX2, girlPx)
girlVarx <- girlEx2 - (girlEx^2)
print(girlVarx)

# ===============================
# binomial distribution
# peluang bayi lahir perempuan = 0.5
# dari 12 kelahiran, berapa peluang lahir 1 bayi perempuan. 
dbinom(1, size=12, prob=0.5)

# cumulative binomial distribution
# min. 4
1 - pbinom(3, size = 12, prob = 0.5)

#=====================================
# triola p.215
# exactly 3 out of 5
dbinom(3, size = 5, prob = 0.6)

# cumulative: min. 2
# 1 - p(<2) --> 1 - P(0) - P(1)
1 - pbinom(1, size = 5, prob = 0.6)

#====================================
# slide 23

comb_dice <- factorial(6)/(factorial(2)*factorial(1)*factorial(3))

prob_dice <- comb_dice * ((2/9)^2)*((1/6)^1)*((11/18)^3)
print(prob_dice)

#====================================
# slide 25
# poisson prob
# dpois = sebuah function. 
dpois(2, 9)

# poisson cumprob
# max. 3
ppois(3, 9)

#=======================================
# slide 27
# poisson cumprob pesawat
ppois(2, 4)

#=======================================
# slide 28: refreshing question 1
# prob 2 bayi laki-laki dari 3
dbinom(2, 3, 0.5)

#=======================================
# slide 29: refreshing question 2
dpois(6, 4)

#======================================
# slide 31: refreshing question 4
# expected value for car washer
# refreshing question no. 4
carX <- c(7, 9, 11, 13, 15, 17)
carProb <- c(1/12, 1/12, 1/4, 1/4, 1/6, 1/6)

carEx <- weighted.mean(carX, carProb)
print(carEx)

#====================
# refreshing question no. 5
miu <- 2000*0.002
ppois(4, miu)

#========================
# refreshing question no. 6
comb_voters <- factorial(10)/(factorial(4)*factorial(1)*factorial(5))

prob_voters <- comb_voters * (0.4^4)*(0.1^1)*(0.5^5)
print(prob_voters)

