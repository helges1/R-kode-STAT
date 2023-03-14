library(ggplot2)

data.large <- read.csv2("Sannsynlighetsfordelinger_large.csv")[, 2]
data.small <- read.csv("Sannsynlighetsfordelinger obs small.csv")[, 1]

#large dataset:
hist(data.large, breaks = 20, prob = TRUE)

curve(dnorm(x, mean = mean(data.large), sd = sd(data.large)), add = TRUE, col = "blue", lwd = 2)
abline(v = 11, col = "blue", lty = 2, lwd = 2)
pnorm(11, mean = mean(data.large), sd = sd(data.large), lower.tail = FALSE)

#small dataset:
hist(data.small, breaks = 10, prob = TRUE)
  #tegne grafen
curve(dnorm(x, mean = mean(data.small), sd = sd(data.small)), add = TRUE, col = "blue", lwd = 2)
abline(v = 11, col = "blue", lty = 2, lwd = 2)
pnorm(11, mean = mean(data.small), sd = sd(data.small), lower.tail = FALSE)

#plotting log-normal - curve

curve(dlnorm(x, meanlog = 0, sdlog = 1), from = 0, to = 5, ylim = c(0, 2), n = 500, col = "blue", lwd = 2)
curve(dlnorm(x, mean = 0, sd = 0.5), col = "blue", add = TRUE, n = 500)

#Link of mean/ varians / lognormal
mu <- 1
sigma <- 3
x <- rnorm(10^7, mean = mu, sd = sigma)
mean(x)
sd(x)

y <- exp(x)
#or
y <- rlnorm(10^7, mean = mu, sd = sigma)
mean(y)
exp(mu + sigma^2 / 2)
sd(y)
sqrt((exp(sigma^2) - 1) * exp(2 * mu + sigma^2))

#beta distribution
curve(dbnorm(x, meanlog = 0, sdlog = 1), from = 0, to = 5, ylim = c(0, 2), n = 500, col = "blue", lwd = 2)

