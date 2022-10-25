# corrtable

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/corrtable)](https://cran.r-project.org/package=corrtable)

[![metacran downloads](https://cranlogs.r-pkg.org/badges/grand-total/corrtable)](https://cran.r-project.org/package=corrtable)


 <!-- badges: end -->
 
Publication ready correlation matrix

Work to turn code located at <https://paulvanderlaken.com/2020/07/28/publication-ready-correlation-matrix-significance-r/> into a CRAN-available R package.  
When run, the package generates a correlation matrix table with significance levels indicated by astericks, making use of the 'Hmisc' package in the 
background.  The table as printed in R is a series of strings, but once exported as a .csv2 file, is ready for insertion into a paper.

## Installation
To install the most recent CRAN version in R:
```
install.packages("corrtable")
```
Not all recent features and bugfixes may be included in the current CRAN release.

If you want to download the most recent developmental version of corrtable from Github:
```
# install.packages('devtools') # Install devtools if needed
devtools::install_github('https://github.com/lauralambert99/corrtable')
```

## Example Use (Iris dataset)
Once installed, this package can be used on any dataset, as part of the functionality is drop non-numberic/-boolean columns.  

```
library(corrtable) #call the package
correlation_matrix(iris) #generate matrix
```
The matrix as generated in R is a table of strings, hence each value being surrounded by " ":

             Sepal.Length  Sepal.Width  Petal.Length  Petal.Width 
Sepal.Length " 1.000   "   "-0.118   "  " 0.872***"   " 0.818***" 
Sepal.Width  "-0.118   "   " 1.000   "  "-0.428***"   "-0.366***" 
Petal.Length " 0.872***"   "-0.428***"  " 1.000   "   " 0.963***" 
Petal.Width  " 0.818***"   "-0.366***"  " 0.963***"   " 1.000   " 

Once you save it out using ```save_correlation_matrix() ``` the " " will not be present.

