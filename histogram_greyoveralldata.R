# ------------------------------------------------------------------------
# Grey is your best friend
# Show subset of data with grey distribution of overall data set
# Link: https://data-se.netlify.com/2017/11/20/great-dataviz-examples-in-rstats
#
# Location: /Users/raymondtse/Dropbox/Analysis/R packages/ggplot2/histogram_greyoveralldata.r
# First created: 18:10 - Saturday 27 January 2018
# Last modified: 18:10 - Saturday 27 January 2018
# ------------------------------------------------------------------------

# ------------------------------------------------------------------------
# System time 
# ------------------------------------------------------------------------
format(Sys.time(), "%a %b %d %H:%M:%S %Y")

# ------------------------------------------------------------------------
# Libraries
# ------------------------------------------------------------------------
library(dplyr)
library(ggplot2)

# ------------------------------------------------------------------------
# Plots
# ------------------------------------------------------------------------
greyHistogramFacet <- function(dataSet, xVar, facetVar) {
  backgroundData <- select(dataSet, -one_of(facetVar))
  ggplot(dataSet, aes_string(x = xVar)) +
    geom_histogram(data = backgroundData, fill = "grey", alpha = .5) +
    geom_histogram(colour = "black", fill = "green") +
    facet_wrap(as.formula(paste("~", facetVar))) +
    guides(fill = FALSE) +  # to remove the legend
    theme_bw()              # for clean look overall
  
}

# ------------------------------------------------------------------------
# Test cases commented out
# ------------------------------------------------------------------------
#greyHistogramFacet(iris, "Sepal.Width", "Species")
#greyHistogramFacet(iris, "Sepal.Length", "Species")
