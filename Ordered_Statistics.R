#Exercise - parralel and sequental components
#Exponential component failure time

lamdac <- 0.01
obs <- rexp(10^5, rate = lamdac)
hist(obs, breaks = 70, prob = TRUE, xlim = c(0,700))
curve(dexp(x, rate = lamdac), add = TRUE, col = "blue", n = 500, lwd = 2)
abline(v = mean(obs), lwd = 2, lty = 2)
mean(obs) #alomost 100 = E(x) where x-exp(lambda = 0.01)

#number of components in a machine / system
n <- 5

#number of repetition / samples
m <- 10^4

#Simulate m samples of n independent component failures. The failure times follow and exponential distrib. with lambda = 0.01
x <- matrix(data = rexp(n * m, rate = lamdac), nrow = m, ncol = n)
head(x)

#Sort the n elements of each line of the matrix x.
#The output is the original elements of each row, but in ascending order.
#Thus, the k'th column of the resulting matrix y.
y <- t(apply(x, 1, function(x) sort(x)))
head(y)

#For the paralell components, the column of Y_5 is the variable of interest
obs <- y[, 5]
hist(obs, breaks = 30, prob = TRUE, xlim = c(0,700))
curve(5 * pexp(x, rate = lamdac) ^ 4 *dexp(x, rate = lamdac), add = TRUE, col = "blue", n = 500, lwd = 2)
abline(v = mean(obs), lwd = 2, lty = 2)
mean(obs)

#For serial components Y_1 is the column of interest.
obs <- y[, 1]
hist(obs, breaks = 30, prob = TRUE, xlim = c(0, 200))
curve(dexp(x, rate = 5 * lamdac), add = TRUE, col = "blue", n = 500, lwd = 2)
abline(v = mean(obs), lwd = 2, lty = 2)
mean(obs) #close to 20 = E(Y_1)