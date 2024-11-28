---
title: "Introduction to T-test and Chi-squared Test"
output:
  html_document: default
  pdf_document: default
---

<center><img src="{{ site.baseurl }}/tutheaderbl.png" alt="Img"/></center>

### Introduction of T-test and CHi-squared test in R

#### <a href="#section1"> 1. What are t-test and Chi-squared test, and why are they important?</a>

-   Understand their statistical relevance.
-   Learn appropriate scenarios for their use.

#### <a href="#section2"> 2. Basics of Hypothesis Testing</a>

-   Understanding null and alternative hypotheses.
-   Explaining p-value and significance level.
-   Introducing types of errors (Type I and Type II).

#### <a href="#section3"> 3. t-Test</a>

-   **3.1 One-sample t-test**: Test if a mean differs from a hypothetical value.
-   **3.2 Independent t-test**: Compare means between two independent groups.
-   **3.3 Paired t-test**: Compare means of paired data (e.g., repeated measures).

#### <a href="#section4"> 4. Chi-squared Test</a>

-   Assess independence between categorical variables.
-   Create contingency tables to summarize relationships.
-   Perform the test to determine significance.

#### <a href="#section5"> 5. Visualizing Results</a>

-   Create boxplots for t-tests to visualize group comparisons.
-   Use bar plots for chi-squared tests to display frequency distributions.

#### <a href="#section6"> 6. Reporting Results</a>

-   Guidelines for interpreting and writing up results.
-   Use of APA-style examples for statistical reporting.

#### <a href="#section7"> 7. Practice Exercises</a>

-   One-sample t-test on `Petal.Length`.
-   Independent t-test on `Petal.Width` between two species.
-   Chi-squared test for independence using `Petal.Length` groups.

This tutorial introduces two fundamental statistical tests: the t-test and the Chi-squared test. You will learn their purposes, how to apply them, and how to interpret their results using R. These skills are crucial for analyzing data in various fields, including environmental and ecological sciences.

You can get all of the resources for this tutorial from <a href="https://github.com/ourcodingclub/CC-EAB-tut-ideas" target="_blank">this GitHub repository</a>. Clone and download the repo as a zip file, then unzip it.


## R set up

It’s completely okay if you’ve never used R before—you can walk through everything step by step with us! Everyone starts as a beginner, and we’re here to guide you through the process and make it as smooth as possible. Together, we’ll cover the basics and get you comfortable with using R in no time. A great resource to guide you through this process is the Coding Club tutorial Getting Started with R and RStudio. While you’re at it, take a look at their Troubleshooting and How to Find Help tutorial—it’s a lifesaver—and the Coding Etiquette guide, which offers excellent tips for navigating the coding community.

Now, let's get started.

First, open `RStudio`, create a new *script* by clicking on `File/New File/R Script`. A Script in R is a file where you can write and save code to run, edit, and reuse later. Name your script appropriately, so that it clearly reflects its purpose and makes it easy to identify later. It is always a good idea the write a header to your script with your name, data and purpose as shown below.

```r
# Title: Intro of T-test and Chi-squared test in R
# Script purpose: Use T-test and Chi-squared test to investigate questions on dataset iris
# Author - contact details
# Date
```

Next, set your working directory to the folder containing the unzipped files on your computer.

```r
# Set the working directory
setwd("your_filepath")
getwd()  # Run this to check where your working directory is
```

Then, load the required packages and dataset, installing them first if they are not already available.

``` r
# load packages
library(ggplot2)
library(reshape2)

# Load the iris dataset
data(iris)
head(iris)  # View the first few rows
summary(iris)  # Summary of the dataset
```


### <a name="section1">1. What are t-test and Chi-squared test, and why are they important? </a>

#### Understand their statistical relevance

T-tests and Chi-squared tests are two foundational tools in statistical inference. They help answer critical questions in science and social research. For instance:

-   **t-test**: Are two sample means statistically different? Example: "Do students in online classes score higher than those in traditional classes?"
-   **Chi-squared test**: Is there an association between two categorical variables? Example: "Is there a link between diet type and health outcomes?"

These tests provide robust frameworks to evaluate hypotheses and are widely applied across various fields, including biology, psychology, and business analytics.

In science, many questions revolve around identifying differences or associations. For example, we might ask, "Are the differences in exam scores between male and female students significant?" or "Is there a link between smoking and lung cancer?" These types of questions can be addressed using statistical methods like t-tests and Chi-squared tests. Whether you're just starting with R or looking to enhance your knowledge of these tests, this tutorial will walk you through their application and interpretation step by step.

We define t-test and Chi-squared test as follows: 

-   **t-test**: The t-test is a  statistical analysis that assists in deciding whether there is a significant difference between the means of two groups. This analysis assumes that the data collected follows a normal distribution. It is often used when the data sets are related to each other.

-   **Chi-squared test**: The chi-square test is a statistical analysis used to check if a significant relationship exists between two categorical variables in a sample. It does this by comparing the observed frequencies in each category of a cross-tabulation to the frequencies we expect by chance.

Here are the differences of t-test and Chi-squared test: 

- The t-test determines if the means of two groups are significantly different.

- The chi-square test checks if a relationship exists between two categorical variables.

- T-test requires data to meet assumptions: normal distribution, homogeneity of variance, and interval or ratio level of measurement.

- The chi-square test assumes that variables are categorical, the data is a random sample, and the expected frequency for each cell is 5 or more.


#### Learn appropriate scenarios for their use

For **t-tests** and **chi-squared tests**, appropriate scenarios depend on the type of data and the research question being addressed:

##### **t-Tests**
t-tests are appropriate in the following scenarios:

1. **Numerical Data**: When the data is continuous (e.g., height, weight, or length measurements).

2. **Comparing Means**: When the goal is to compare the means of one or more groups.
   - **One-sample t-test**: Used to check if the sample mean differs from a known or hypothetical value.
   - **Independent t-test**: Used to compare the means of two independent groups (e.g., two species).
   - **Paired t-test**: Used to compare measurements from the same group under different conditions or at different times (e.g., before-and-after studies).

#### **Chi-squared Tests**
Chi-squared tests are appropriate in the following scenarios:

1. **Categorical Data**: When the data consists of categories or frequencies (e.g., species types, groups).

2. **Testing Independence**: Used to assess if two categorical variables are related (e.g., species and sepal length groups).

3. **Goodness-of-Fit**: Used to test if observed categorical data matches expected proportions.

By understanding these scenarios, it becomes easier to select the appropriate test for the analysis, ensuring valid and interpretable results.






### <a name="section2">2. Basics of Hypothesis Testing</a>

#### Hypothesis Testing

Hypothesis testing is a basic idea in statistics that helps us decide if we have enough evidence to support a claim about a group or population. It has a few important parts:

##### Null and Alternative Hypotheses
- **Null Hypothesis (\(H_0\))**: This is like the default assumption, saying nothing special is happening. For example, "There’s no difference between two groups."
- **Alternative Hypothesis (\(H_a\))**: This is the claim we’re testing, suggesting something *is* happening, like "The two groups are different."

##### p-value and Significance Level
- The **p-value** tells us how likely it is to see our results (or something even more surprising) if the null hypothesis is true.
- The **significance level (\(\alpha\))** is a cutoff point we choose (often 0.05). If the p-value is smaller than \(\alpha\), it means the results are unlikely under the null hypothesis, so we reject it.

##### Type I and Type II Errors
- **Type I Error**: This happens when we think something is happening (reject \(H_0\)) but actually, nothing is (false alarm).
- **Type II Error**: This happens when we don’t notice something is happening (fail to reject \(H_0\)) even though it is (missed signal).

Hypothesis testing is useful because it helps us figure out whether the patterns we see in data are real or just random chance.

This might seems a lot to understand. Don't worry, we will go through this together step by step in latter sections. 




Before we dive in, we need to first understand what dataset we are using. 

### **What is the `iris` Dataset?**
The `iris` dataset is a collection of flower measurements from three types of iris flowers: `setosa`, `versicolor`, and `virginica`. There are 150 rows in total (50 flowers of each species). The dataset has these columns:

- **Sepal.Length**: How long the sepal is (in cm).  
- **Sepal.Width**: How wide the sepal is (in cm).  
- **Petal.Length**: How long the petal is (in cm).  
- **Petal.Width**: How wide the petal is (in cm).  
- **Species**: Which species the flower belongs to (`setosa`, `versicolor`, or `virginica`).





### <a name="section3">3. T-test</a>

Now, let's apply what we have learned into application! 


#### **3.1 One-sample t-test**
This tests if the mean of a single group is different from a specific value. 

**Hypotheses:**

- **Null Hypothesis (\(H_0\))**: The mean sepal length is equal to 5.8.

- **Alternative Hypothesis (\(H_a\))**: The mean sepal length is not equal to 5.8.

In our example, we could write our hypothesis as: 

Let’s check if the average sepal length of all flowers in the `iris` dataset is significantly different from 5.8 (a hypothetical value).

```r
# Test if the mean Sepal.Length is significantly different from 5.8
t.test(iris$Sepal.Length, mu = 5.8)
```

The output shows that: 

- **p-value**: \( p = 0.5226 \)  

  This is much greater than 0.05, so we *fail to reject* the null hypothesis.

Then, we get the **conclusion**: 

The average sepal length in the `iris` dataset is not significantly different from 5.8. Any small difference is likely due to random chance.

Does that build you some confidence? Now, let's look at the next test. 


#### **3.2 Independent t-test**

This test compares the averages of two separate groups to see if they’re different.

In our example, we could write our hypothesis as: 

**Hypotheses:**

- **Null Hypothesis (\(H_0\))**: The mean sepal lengths of `setosa` and `versicolor` are equal.

- **Alternative Hypothesis (\(H_a\))**: The mean sepal lengths of `setosa` and `versicolor` are not equal.

```r
# Filter the data for two species
setosa <- subset(iris, Species == "setosa")
versicolor <- subset(iris, Species == "versicolor")

# Perform an independent t-test
t.test(setosa$Sepal.Length, versicolor$Sepal.Length)
```
The output shows that: 

- **p-value**: \( p < 2.2e-16 \)  

  This is much smaller than 0.05, so we *reject* the null hypothesis. 

Then, we can conclude from our result that, the mean sepal length of `setosa` and `versicolor` are not equal. 

Now, let's learn one more method. 

#### **3.3 Paired t-test**

This test is used to compare two related sets of measurements, like "before and after" scenarios.

In our example, we could write our hypothesis as: 

**Hypotheses:**

- **Null Hypothesis (\(H_0\))**: The mean of `Sepal.Length` is equal to the mean of `Petal.Length` for `setosa`.  
  (Or, we could also say that there is no significant difference between the two measurements.)
  
- **Alternative Hypothesis (\(H_a\))**: The mean of `Sepal.Length` is not equal to the mean of `Petal.Length` for `setosa`.  
  (Or, we could also say that there is a significant difference between the two measurements.)

```r
# Compare Sepal.Length and Petal.Length within the same species ("setosa")
setosa_data <- subset(iris, Species == "setosa")
t.test(setosa_data$Sepal.Length, setosa_data$Petal.Length, paired = TRUE)
```
The output shows that: 

- **p-value**: \( p < 2.2e-16 \)  

  This is much smaller than 0.05, so we *reject* the null hypothesis. 
  
Therefore, we can conclude from our result that, the mean of `Sepal.Length` is not equal to the mean of `Petal.Length` for `setosa`. 



``` r
# Create fake data
x_dat <- rnorm(n = 100, mean = 5, sd = 2)  # x data
y_dat <- rnorm(n = 100, mean = 10, sd = 0.2)  # y data
xy <- data.frame(x_dat, y_dat)  # combine into data frame
```

Here you can add some more text if you wish.

``` r
xy_fil <- xy %>%  # Create object with the contents of `xy`
    filter(x_dat < 7.5)  # Keep rows where `x_dat` is less than 7.5
```

And finally, plot the data:

``` r
ggplot(data = xy_fil, aes(x = x_dat, y = y_dat)) +  # Select the data to use
    geom_point() +  # Draw scatter points
    geom_smooth(method = "loess")  # Draw a loess curve
```

At this point it would be a good idea to include an image of what the plot is meant to look like so students can check they've done it right. Replace `IMAGE_NAME.png` with your own image file:

<center><img src="{{ site.baseurl }}/IMAGE_NAME.png" alt="Img" style="width: 800px;"/></center>



More text, code and images.

This is the end of the tutorial. Summarise what the student has learned, possibly even with a list of learning outcomes. In this tutorial we learned:

##### - how to generate fake bivariate data

##### - how to create a scatterplot in ggplot2

##### - some of the different plot methods in ggplot2

We can also provide some useful links, include a contact form and a way to send feedback.

For more on `ggplot2`, read the official <a href="https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf" target="_blank">ggplot2 cheatsheet</a>.

Everything below this is footer material - text and links that appears at the end of all of your tutorials.

<hr>

<hr>

#### Check out our <a href="https://ourcodingclub.github.io/links/" target="_blank">Useful links</a> page where you can find loads of guides and cheatsheets.

#### If you have any questions about completing this tutorial, please contact us on [ourcodingclub\@gmail.com](mailto:ourcodingclub@gmail.com){.email}

#### <a href="INSERT_SURVEY_LINK" target="_blank">We would love to hear your feedback on the tutorial, whether you did it in the classroom or online!</a>

<ul class="social-icons">

<li>

<h3><a href="https://twitter.com/our_codingclub" target="_blank"> Follow our coding adventures on Twitter! <i class="fa fa-twitter"></i></a></h3>

</li>

</ul>

###   Subscribe to our mailing list:

::: container
```         
<div class="block">
    <!-- subscribe form start -->
    <div class="form-group">
        <form action="https://getsimpleform.com/messages?form_api_token=de1ba2f2f947822946fb6e835437ec78" method="post">
        <div class="form-group">
            <input type='text' class="form-control" name='Email' placeholder="Email" required/>
        </div>
        <div>
                        <button class="btn btn-default" type='submit'>Subscribe</button>
                    </div>
                </form>
    </div>
</div>
```
:::
