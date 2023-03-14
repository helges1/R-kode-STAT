# How does the failure time of a single component look like?

lambdac <- 0.01
obs <- rexp(10 ^ 5, rate = lambdac)
hist(obs, breaks = 70, prob = TRUE, xlim = c(0, 700))
curve(dexp(x, rate = 0.01), add = TRUE,
      col = "blue", n = 500, lwd = 2)
abline(v = mean(obs), lwd = 2, lty = 2)
mean(obs)

# Number of components in a machine / system
n <- 5

# Number of repetitions / sample
m <- 10 ^ 4

# Simulate m samples of n independent component failures

x <- matrix(data = rexp(n * m, rate = lambdac),
            nrow = m, ncol = n)
head(x)

# Sort the n elements of each line of the matrix
y <- t(apply(x, 1, function(x) sort(x)))
head(y)

# For parallel components, Y_5 is the variable of interest
obs  <- y[, 5]
hist(obs, breaks = 30, prob = TRUE, xlim = c(0, 700))
curve (5 * pexp(x, rate = lambdac) ^ 4 * dexp(x, rate = lambdac),
       add = TRUE, col = "blue", n = 500, lwd = 2)
abline(v = mean(obs), lwd = 2, lty = 2)
mean(obs)

# For serial components, Y_1 is the variable of interest 
obs <- y[, 1]
hist(obs, breaks = 30, prob = TRUE, xlim = c(0, 200))
curve(dexp(x, rate = 5 * lambdac),
      add = TRUE, col="blue", n = 500, lwd = 2)
abline(v = mean(obs), lwd = 2, lty = 2)
mean(obs)
