#ANOVA-datasets

# Set path to data
setwd("~/Data")


#read data
obs.all <- read.csv("ANOVA_obs_all.csv")
obs.small <- read.csv("ANOVA_obs_small.csv")

#plot
attach(obs.small)
boxplot(bp ~ treatment, notch = TRUE)
abline(h = mean(bp), col = "blue")
detach(obs.small)
attach(obs.all)
boxplot(bp ~ treatment, notch = TRUE)
abline(h = mean(bp), col = "blue")
detach(obs.all)

#anova
summary(aov(bp ~ treatment, data = obs.small))
sum((obs.small$bp - mean(obs.small$bp))^2) #SST (sum squared total)
summary(aov(bp ~ treatment, data = obs.all))
sum((obs.all$bp - mean(obs.all$bp))^2) #SST (sum squared total)

#KAP: principle steps of anova (one factor, balanced design <- num obs in each group is the same) 

#1) Assumtions: the random variable X_ij are independently distributed normal with E(X_ij) = mu_i
# and Var(X_ij) = sigma^2. the i is the sample/ treatmeant number, and the j is the position of each sample.

#2) Then we fomulate our Hypotesis: H_0: mu_1 = mu_2 = ... = mu_I. H_a: at least two of the mu_i's are different.
# when we use anova, we want to prove that there exists an difference somewhere, so that we can continue to try to locate.

#3) Sums of squares: SST_r and SSE are independant random values. SSE / sigma^2 ~ chi-squared(I * J - I)
# If H_0 is true: SST_r / sigma^2 ~ chi-squared(I - 1)

#4) Mean squared: Let MST_r = SST_r / I - 1, MSE = SSE / (I * J - I). E(MSE) = sigma^2 (unbiased estimator for sigma^2)
# H_0 true? => E(MST_r) = sigma^2. If H_0 is false => E(MST_r) > sigma^2. MST = mean-square-treatment

#5) F - test (t-test^2 = f-test): H_0 is true => F = MST_r / MSE ~ F_(I-1, I*J-I). (F=statitic of F-tot)
# ANOVA table (se opp i koden): Shows the Sum of squares, mean of squares, f-statistic, p-value

#KAP: Regression and Correlation: The consepts of ANOVA is not linear dependent of regression.
# Idea: model the (linear) relationship of a response variable Y and a predictor ("explainatory", "independent") variable x.
# Example 12.1 in the book: x it the velocity in m/s of a 7.62 mm round (kule). y is the penetration area (mm^2) in a body armour.
# Here we can see that the cause and effect is clear, this is however, the exeption. AltsC% er som regel ikke like klart.

#data
dat <- read.csv("Linear regresjon body armor.csv")
x <- dat$x #velocity
y <- dat$y #armour piercing

#plot
boxplot(x, y)
par(mgp = c(2.5, 1, 0))
plot(x,y, #predictor on axis, response on y axis
     xlab = "x - speed [m/s]",
     ylab = expression(paste('y - damage [', mm ^ 2, ']'
                             , sep='')),
     pch = 19) #labels are important

#fit linear regression model
mod <- lm(y ~ x) #lm() function does the job
abline(mod, col="blue") #add line to plot
summary(mod) #but what about this?

# Simple linear regression model: given by the model equation: Y = B_0 + B_1*X + E 
# (the B is the true coefficients, epsilon is iid N(0, sigma^2) 


