#chi-squared
#curve(dchisq(x, df = 3), col = "purple", add = TRUE, n = 500)
#curve(dchisq(x, df = 2), from = 0, to = 10, ylim = c(0,1), n = 500)
#curve(dchisq(x, df = 5), col = "blue", add = TRUE, n = 500)
curve(dchisq(x, df = 1), col = "red", add = TRUE, n = 500)
#gamma
curve(dgamma(x, shape = 1 / 2, scale = 2), col = "cyan", lwd = 2, lty = 2, add = TRUE, n = 500)

#ch-squared
k <- 15
curve(dchisq(x, df = k), col = "red", lwd = 2, from = 0, to = 50)
curve(dgamma(x, shape = k / 2, scale = 2), col = "cyan", lwd = 2, lty = 2, add = TRUE)
