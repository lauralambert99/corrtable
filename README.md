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
