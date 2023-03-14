#Point estimation
mu <- 5 # mean
sigma <- 3 #standard deviation
N <- 10 ^ 6 #population size
n <- 30 #sample size
k <- 1000 #number of repetitions

#generate the population
set.seed(123)
pop <- rnorm(N, mean = mu, sd = sigma)
hist(pop)

#for comparison sample one sample
obs <- sample(pop, n)
hist(obs)
#the two estimators
mean(obs)
sd(obs) / sqrt(n)

#now repeat k times
#result vectors
meanvec <- c()
sdvec <- c()
#loop over k reapeated smplings
for (i in 1 : k){
  obs <- sample(pop, n)
  meanvec[i] <- mean(obs)
  sdvec[i] <- sd(obs) / sqrt(n)
}

#plot from the mean estimator
hist(meanvec, breaks = 20, prob = TRUE)
curve(dnorm(x, mean = mean(meanvec), sd = sd(meanvec)), col = "blue", add = TRUE)
curve(dnorm(x, mean = mu, sd = sigma / sqrt(n)), col = "red", add = TRUE)
#what are the different curves? In blue the sampling distribution resulting from simulation,
#in red the theoretical sampling distribution.

#plot for the standard error estimator.
hist(sdvec, breaks = 20, prob = TRUE)
curve(dnorm(x, mean = mean(sdvec), sd = sd(sdvec)), col = "blue", add = TRUE)
#looks normal, but dont be fooled - it has only positive support, and what do we know about variance?
hist((n-1)*(sdvec * sqrt(n))^2 /sigma^2, breaks = 20, prob = TRUE)
curve(dchisq(x, df = n-1), col = "blue", add = TRUE)
#why? recall from the previous lecture, ther is some relationship of S^2 and the chisquared distribution!

