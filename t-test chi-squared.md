---
output:
  html_document: default
  pdf_document: default
---

<center><img src="{{ site.baseurl }}/tutheaderbl.png" alt="Img"/></center>

To add images, replace `tutheaderbl1.png` with the file name of any image you upload to your GitHub repository.

### Tutorial Aims

#### <a href="#section1"> 1. Why are t-test and Chi-squared test important?</a>
- Understand their statistical relevance.
- Learn appropriate scenarios for their use.

#### <a href="#section2"> 2. Preparing for the analysis</a>
- Defining research questions and hypotheses.
-  Cleaning and formatting data for analysis.

#### <a href="#section3"> 3. Executing the tests</a>
- Conducting a t-test for mean comparisons.
- Running a Chi-squared test to assess variable associations.

#### <a href="#section3"> 4. Presenting results visually</a>
- Using histograms and boxplots for distributions.
- Communicating Chi-squared results with bar plots.

#### <a href="#section3"> 5. BONUS</a>
- Annotating graphs with statistical significance.
- Combining plots into panels using `patchwork`.

## You can read this text, then delete it and replace it with your text about your tutorial: what are the aims, what code do you need to achieve them?

This tutorial introduces two fundamental statistical tests: the t-test and the Chi-squared test. You will learn their purposes, how to apply them, and how to interpret their results using R. These skills are crucial for analyzing data in various fields, including environmental and ecological sciences.

# Subheading 1

In science, many questions revolve around identifying differences or associations. For example, we might ask, "Are the differences in exam scores between male and female students significant?" or "Is there a link between smoking and lung cancer?" These types of questions can be addressed using statistical methods like t-tests and Chi-squared tests. Whether you're just starting with R or looking to enhance your knowledge of these tests, this tutorial will walk you through their application and interpretation step by step.

This is some introductory text for your tutorial. Explain the skills that will be learned and why they are important. Set the tutorial in context.

You can get all of the resources for this tutorial from <a href="https://github.com/ourcodingclub/CC-EAB-tut-ideas" target="_blank">this GitHub repository</a>. Clone and download the repo as a zip file, then unzip it.

<a name="section1"></a>

## 1. The first section

At the beginning of your tutorial you can ask people to open `RStudio`, create a new script by clicking on `File/ New File/ R Script` set the working directory and load some packages, for example `ggplot2` and `dplyr`. You can surround package names, functions, actions ("File/ New...") and small chunks of code with backticks, which defines them as inline code blocks and makes them stand out among the text, e.g. `ggplot2`.

When you have a larger chunk of code, you can paste the whole code in the `Markdown` document and add three backticks on the line before the code chunks starts and on the line after the code chunks ends. After the three backticks that go before your code chunk starts, you can specify in which language the code is written, in our case `R`.

To find the backticks on your keyboard, look towards the top left corner on a Windows computer, perhaps just above `Tab` and before the number one key. On a Mac, look around the left `Shift` key. You can also just copy the backticks from below.

``` r
# Set the working directory
setwd("your_filepath")

# Load packages
library(ggplot2)
library(dplyr)
```

<a name="section2"></a>

## 2. The second section

You can add more text and code, e.g.

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

<a name="section1"></a>

## 3. The third section

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