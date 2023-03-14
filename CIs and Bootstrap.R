# Some parameters
n <- 30 # sample size
df <- 8 # df of Chisq. distrib
B <- 1000 # no. of BS samples

# Generate one sample
set.seed(123)
obs <- rchisq (n, df = df)
hist(obs)
mean(obs)
median(obs)

# result vectors
bs.theta <- c()
# loop over B BS samples
for (i in 1 : B) {
  bs.obs <- sample(obs, n, replace = TRUE)
  bs.theta[i] <- median(bs.obs)
  
}

# resulting bs distribution
hist(bs.theta, prob = TRUE)

# bs standard error
sd.theta <- sd(bs.theta)
sd.theta

# bias
median(obs) - mean(bs.theta)

# derive 5% CIs
ci.bs.t <- mean(bs.theta) + c(-1, 1) * qt(0.975, df = 29) * sd.theta
abline(v = ci.bs.t, col = "blue")
ci.bs.prec <- quantile(bs.theta, c(0.025, 0.975))
abline(v = ci.bs.prec, col = "red")