# Correlation matrix makes expected matrix - no args

    Code
      waldo::compare(correlation_matrix(df),
      format_mat_test)
    Output
      dimnames(old)[[2]] vs dimnames(new)[[2]]
      - "mtcars.mpg "
      + "mtcars.mpg"
      - "mtcars.cyl "
      + "mtcars.cyl"
      
          old         | new            
      [1] " 1.000   " - "    1.000" [1]
      [2] "-0.852***" | "-0.852***" [2]
      [3] "-0.852***" | "-0.852***" [3]
      [4] " 1.000   " - "    1.000" [4]

# Correlation matrix drops string vars

    Code
      waldo::compare(correlation_matrix(df2),
      cor(df3))
    Output
      Dropping non-numeric/-boolean column(s): Species 
      
      `old` is a character vector (' 1.000   ', '-0.118   ', ' 0.872***', ' 0.818***', '-0.118   ', ...)
      `new` is a double vector (1, -0.117569784133002, 0.871753775886583, 0.817941126271576, -0.117569784133002, ...)

