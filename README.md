# corrtable
Publication ready correlation matric - packaging up for CRAN

Work to turn code located at <https://paulvanderlaken.com/2020/07/28/publication-ready-correlation-matrix-significance-r/> into a CRAN-available R package.  
When run, the package generates a correlation matrix table with significance levels indicated by astericks, making use of the 'Hmisc' package in the 
background.  The table as printed in R is a series of strings, but once exported as a .csv2 file, is ready for insertion into a paper.
