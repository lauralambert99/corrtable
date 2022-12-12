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


             Sepal.Length  Sepal.Width  Petal.Length  Petal.Width 
Sepal.Length " 1.000   "   "-0.118   "  " 0.872***"   " 0.818***"  
Sepal.Width  "-0.118   "   " 1.000   "  "-0.428***"   "-0.366***" 
Petal.Length " 0.872***"   "-0.428***"  " 1.000   "   " 0.963***" 
Petal.Width  " 0.818***"   "-0.366***"  " 0.963***"   " 1.000   " 
```

Other customization options include just using the upper or lower diagonal:

```
correlation_matrix(iris, use = "lower")

             Sepal.Length  Sepal.Width  Petal.Length  Petal.Width 
Sepal.Length " 1.000   "   ""           ""            ""          
Sepal.Width  "-0.118   "   " 1.000   "  ""            ""          
Petal.Length " 0.872***"   "-0.428***"  " 1.000   "   ""          
Petal.Width  " 0.818***"   "-0.366***"  " 0.963***"   " 1.000   " 
```

Or, restricting the decimal place to a number other than three:

```
correlation_matrix(iris, digits = 2, use = "upper")

             Sepal.Length  Sepal.Width  Petal.Length  Petal.Width 
Sepal.Length " 1.00   "    "-0.12   "   " 0.87***"    " 0.82***"  
Sepal.Width  ""            " 1.00   "   "-0.43***"    "-0.37***"  
Petal.Length ""            ""           " 1.00   "    " 0.96***"  
Petal.Width  ""            ""           ""            " 1.00   "  
```

The matrix as generated in R is a table of strings, hence each value being surrounded by " ".
Once you save it out using ```save_correlation_matrix() ```  and then pull into Excel, the " " will not be present.

On a PC and using Excel via Office 365, the csv file is pulled in via Data -> "From Text/CSV".  From there, select the correctly named file.  If you try to just open the file in Excel, it will not look as you may have hoped, with all rows being contained in a single cell, and only one column.

## Development

This package is still under development, with enhancements being planned.  If you see any bugs or have suggestions for potential improvements, please raise an issue or submit a pull request.

Planned developments at the moment:
 - Function to visualize correlation table as well
   - Option to include significance levels
 - Have graphic exportable as .png or .svg, color and/or black and white
