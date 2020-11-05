# thermemeter case
pnorm(1.27, mean=0, sd=1, lower.tail=TRUE) 

# P (z > –1.23)
# cara 1:
1 - pnorm(-1.23)
# cara 2:
pnorm(-1.23, lower.tail = FALSE)

# given prob, what's the z?
qnorm(0.95)

# men's weight
# without standardizing
pnorm(174, mean = 172, sd = 29)
# with standardizing
z <- (174-172)/29
pnorm(z, mean = 0, sd = 1)

# what weight separates the lightest 99.5% from the heaviest 0.5%?
z_0995 <- qnorm(0.995)
print(z_0995)
x_0995 <- 172 + (z_0995 * 29)
print(x_0995)

# normal food packing machine
pnorm(125, 120, 4)
# with standardizing
zfood <- (125-120)/4
print(zfood)
pnorm(zfood)

# test score
ztest <- qnorm(1-0.12)
print(ztest)
xtest <- 74 + (ztest * 7)
print(xtest)