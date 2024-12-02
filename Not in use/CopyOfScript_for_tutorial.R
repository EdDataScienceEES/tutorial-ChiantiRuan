library(ggplot2)
library(reshape2)


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
# Compare Sepal.Length between "setosa" and "versicolor"
iris_subset <- subset(iris, Species %in% c("setosa", "versicolor"))
t.test(Sepal.Length ~ Species, data = iris_subset)

# 3.3 Paired t-test
# Compare Sepal.Length and Petal.Length within the same species ("setosa")
setosa_data <- subset(iris, Species == "setosa")
t.test(setosa_data$Sepal.Length, setosa_data$Petal.Length, paired = TRUE)

# 4. Chi-squared Test
# Test for Independence
# Discretize Sepal.Length into categories
iris$Sepal.Length.Group <- cut(iris$Sepal.Length, breaks = 3, labels = c("Short", "Medium", "Long"))
# Create a contingency table
contingency_table <- table(iris$Species, iris$Sepal.Length.Group)
print(contingency_table)
# Perform chi-squared test
chisq.test(contingency_table)

# 5. Visualizing Results
# 5.1 Boxplot for t-tests
# Visualize Sepal.Length by Species
ggplot(iris_subset, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Sepal Length by Species", x = "Species", y = "Sepal Length") +
  theme_minimal()

# 5.2 Bar Plot for Chi-squared Test
# Melt contingency table for plotting
contingency_melted <- melt(as.table(contingency_table))
ggplot(contingency_melted, aes(x = Var2, y = value, fill = Var1)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Sepal Length Group by Species", x = "Sepal Length Group", y = "Frequency") +
  theme_minimal()

# 6. Reporting Results (no specific code)

# 7. Practice Exercises
# 7.1 One-sample t-test
# Test if the mean Petal.Length is significantly different from 3
t.test(iris$Petal.Length, mu = 3)

# 7.2 Independent t-test
# Compare Petal.Width between "virginica" and "versicolor"
iris_subset <- subset(iris, Species %in% c("virginica", "versicolor"))
t.test(Petal.Width ~ Species, data = iris_subset)

# 7.3 Chi-squared Test
# Discretize Petal.Length into categories
iris$Petal.Length.Group <- cut(iris$Petal.Length, breaks = 3, labels = c("Short", "Medium", "Long"))
# Create a contingency table
contingency_table2 <- table(iris$Species, iris$Petal.Length.Group)
print(contingency_table2)
# Perform chi-squared test
chisq.test(contingency_table2)

# 8. Export to HTML (handled in R Markdown, no specific R code here)
