
data("CigarettesSW", package = "AER")
head(CigarettesSW)

# Scatter plot
plot(CigarettesSW$state, CigarettesSW$price,
     main   = "State vs. Price",
     xlab   = "State",
     ylab   = "Price")

# Histogram
hist(CigarettesSW$packs,
     main   = "Distribution of Packs",
     xlab   = "packs")

library(lattice)

# Conditional scatter plot (small multiples)
xyplot(packs ~ price | factor(year),
       data = CigarettesSW,
       main = "Price vs. Packs by Year")

# Box-and-whisker plot
bwplot(income ~ factor(year),
       data = CigarettesSW,
       main = "Income by Year")

library(ggplot2)

# Scatter plot with smoothing
ggplot(CigarettesSW, aes(x = state, y = price, color = factor(year))) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "State vs. Price with trend by Year")

# Faceted histogram
ggplot(CigarettesSW, aes(price)) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~ year) +
  labs(title = "Price distribution by Year")
