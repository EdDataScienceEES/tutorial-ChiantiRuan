library(ggplot2)
library(reshape2)
library(dplyr)


# 1. Load the iris dataset
data(iris)
head(iris)  # View the first few rows
summary(iris)  # Summary of the dataset

# 2. Basics of Hypothesis Testing (no specific code)

# 3. t-Test
# 3.1 One-sample t-test
# Test if the mean Sepal.Length is significantly different from 5.8
t.test(iris$Sepal.Length, mu = 5.8)

# 3.2 Independent t-test
# Filter the data for two species
setosa <- subset(iris, Species == "setosa")
versicolor <- subset(iris, Species == "versicolor")

# Perform an independent t-test
t.test(setosa$Sepal.Length, versicolor$Sepal.Length)


# 4. Visualizing Results
# barplot
q51 <- ggplot(iris, aes(x = Sepal.Length)) +
    geom_histogram(aes(y = ..density..), bins = 30, fill = "skyblue", alpha = 0.7, color = "black") +
    geom_density(color = "blue", size = 1) +
    geom_vline(xintercept = 5.8, linetype = "dashed", color = "red", size = 1) +
    labs(title = "Sepal Length Distribution with Hypothesized Mean",
         x = "Sepal Length",
         y = "Density") +
    theme_minimal()

ggsave("picture/sepal_length_distribution.png", plot = q51, width = 8, height = 6, dpi = 300)

#Q42
q52 <- ggplot(iris %>% filter(Species %in% c("setosa", "versicolor")), 
       aes(x = Species, y = Sepal.Length, fill = Species)) +
    geom_boxplot(alpha = 0.7) +
    stat_summary(fun = mean, geom = "point", shape = 23, size = 3, color = "black", fill = "white") +
    theme_minimal() +
    labs(title = "Comparison of Sepal Length between Setosa and Versicolor",
         x = "Species",
         y = "Sepal Length")

ggsave("picture/q52.png", plot = q52, width = 8, height = 6, dpi = 300)


# Q43
q53 <- ggplot(iris %>% filter(Species %in% c("setosa", "versicolor")), 
              aes(x = Sepal.Length, fill = Species)) +
    geom_density(alpha = 0.5) +
    geom_vline(data = iris %>% filter(Species %in% c("setosa", "versicolor")) %>%
                 group_by(Species) %>%
                 summarise(mean = mean(Sepal.Length)),
               aes(xintercept = mean, color = Species),
               linetype = "dashed", size = 1) +
    theme_minimal() +
    labs(title = "Density Plot of Sepal Length by Species",
         x = "Sepal Length",
         y = "Density")

ggsave("picture/q53.png", plot = q52, width = 8, height = 6, dpi = 300)



