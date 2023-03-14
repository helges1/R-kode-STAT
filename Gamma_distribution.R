# Define the range of x values to evaluate the density function
#x <- seq(0, 10, 0.01)

# Define the value of k for the transformation
#k <- 2

# Set the parameters of the gamma distribution
#alpha <- c(1, 2, 3)
#beta <- c(1, 1, 2)

# Create a plot with an appropriate x-axis label, y-axis label, and title
#plot(x, dgamma(x, shape = alpha[1], rate = beta[1]), type = "l", xlab = "x", ylab = "Density", main = "Gamma Density Function")

# Add lines for the gamma density function for each combination of alpha and beta
#for (i in 2:length(alpha)) {
#  lines(x, dgamma(x, shape = alpha[i], rate = beta[i]), col = i)
#}

# Apply the transformation k * x to the x variable
#x_transformed <- k * x

# Simulate data from the transformed distribution
#set.seed(123)  # Set the seed for reproducibility
#data <- rgamma(10000, shape = alpha[1], rate = beta[1])
#data_transformed <- k * data

# Create a histogram of the simulated data from the transformed distribution
#hist(data_transformed, freq = FALSE, add = TRUE, col = "gray")

# Add a legend to the plot
#legend("topright", legend = c(paste("alpha =", alpha, ", beta =", beta), paste0("k * x, k =", k)), col = c(1:length(alpha), "gray"), lty = c(rep(1, length(alpha)), NA))



#_____________________________________________
#first mu = 0, check with Wikipedia
curve(dgamma(x, shape = 1, scale = 1), from = 0, to = 5, ylim = c(0,1), n = 500)
curve(dgamma(x, shape = 1, scale = 3), col = "blue", add = TRUE, n = 500)
curve(dgamma(x, shape = 2, scale = 1), col = "red", add = TRUE, n = 500)
curve(dgamma(x, shape = 3, scale = 1), col = "green", add = TRUE, n = 500)

#multiplicate with a constant
x <- 5 * rgamma(10^5, shape = 2, scale = 3)
hist(x, prob = TRUE, breaks = 30, ylim = c(0, 0.13), xlim = c(0,120))
curve(dgamma(x, shape = 2, scale = 15), col = "blue", add = TRUE, n = 500, lwd = 2)
curve(dgamma(x, shape = 2, scale = 3), col = "red", add = TRUE, n = 500, lwd = 2)
#to get from the red curve to the blue curve: strech with factor k (here 5) in x-direction
#(so f(x) becomes f(x/5)), then re-scale i y direction (here f(x/5) becomes 1/5 * f(x/5))
abline(v = c(3.0, 5*3.0))
abline(h = c(0.123, 0.123 / 5))








