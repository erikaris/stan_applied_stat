# lecture 11: goodness of fit test
# lecturer: Erika Siregar (@erikaris)

library(readr) 
library(mvt)

# loading the data
weight <- read_csv('weight.csv')
internet <- read_csv('internet.csv')
failure <- read_csv('failure.csv')

#########################################

# goodness-of-fit test
?chisq.test  # help for chisq.test()
# method 1: using default probability
weight_gof <- chisq.test(weight$obs_freq) #gof = goodness of fit
# method 2: define the probability
weight_gof2 <- chisq.test(weight$obs_freq, p = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1)) #gof = goodness of fit
weight_gof  # take a look at the test result. 
summary(weight_gof)  # explore the weight_gof
weight_gof$expected  # see the expected values. ensure that no E < 5

#########################################

# independency test 
echinaceae <- matrix(c(88, 15, 48, 4, 42, 10), ncol = 3)
colnames(echinaceae) <- c('placebo', 'echi20', 'echi60')
rownames(echinaceae) <- c('infected', 'not_infected')

echi_test <- chisq.test(echinaceae)
echi_test  # see the result of the test
summary(echi_test) # check the details of result
echi_test$expected   # check the expected value. ensure there's not cell has E < 5

#########################################

# homogeneity
## create 2-way table
abortion <- matrix(c(560, 240, 308, 92), ncol = 2)
colnames(abortion) <- c('man', 'woman')
rownames(abortion) <- c('agree', 'disagree')
abortion
## chi square test for homogeneity
abortion_chisq <- chisq.test(abortion)
# check the expected count
abortion_chisq$expected

#########################################

# mcnemar test
hip <- matrix(c(309, 15, 10, 2), ncol = 2,  
              dimnames = list("Hip_protector_worn" = c("no_hip_fracture", "hip_fracture"),
                              "     no_hip_protector_worn     " = c("   no_hip_fracture", "   hip_fracture")))

mcnemar.test(hip)



