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

# result bs distribution
hist(bs.theta, prob = TRUE)

# bs standard error
sd.theta <- sd(bs.theta)
sd.theta


