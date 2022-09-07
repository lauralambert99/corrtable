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

