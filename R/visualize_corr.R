x <- y <- correlation <- NULL

#Set parameters
break_interval = function() {
  return(0.2)
}


correlation_breaks = function() {
  return(seq(-1, 1))
}

theme_corrtable = function(){
  ggplot2::theme_minimal() +
    ggplot2::theme(
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      NULL
    )
}


#' Visualize the correlation matrix with a heatmap
#'
#' @param color_value_positive color used for upper limit of gradient (high positive correlation)
#' @param color_value_negative color used for lower limit of gradient (high negative correlation)
#' @param color_text color used for text.  A high contrast with \code{color_value_high}
#' @param include_missings bool, whether or not to include the variables without correlation values in the plot
#'
#' @return a ggplot object; a heatmap visualization
#' @export
#'
#' @examples
#' visualize_corr(iris)


#Get correlation
corr_score = function(df, ...) {
  isCorrelationColumn = vapply(df, function(x) is.numeric(x) | is.logical(x), logical(1))
  cnames = names(df)[isCorrelationColumn]
  cmat = stats::cor(df[, cnames], ...)
  correlation = as.vector(cmat)
  correlation = round(correlation, 2)
  y = rep(rownames(cmat), each = ncol(cmat))
  x = rep(colnames(cmat), times = nrow(cmat))
  return(data.frame(x, y, correlation))
}

#Make the heatmap

visualize_corr = function(df,
                          color_value_positive = '#08306B',
                          color_value_negative = '#8b0000',
                          color_text = '#FFFFFF',
                          include_missings = FALSE,
                          type = "pearson",
                          show_significance = TRUE,
                          ...) {
  df_correlations = corr_score(df, ...)

  if (show_significance) {
    sig <- as.matrix(df)
    # run correlation analysis using Hmisc package
    cm <- Hmisc::rcorr(sig, type = type)
    p <- cm$P # Matrix of p-value
    # define notions for significance levels; spacing is important.
    stars <- ifelse(is.na(p), "   ", ifelse(p < .001, "***", ifelse(p < .01, "** ", ifelse(p < .05, "*  ", "   "))))
    c = as.character(df_correlations$correlation)
    df_correlations$correlation_sig = paste0(c, stars)
  } else {
    df_correlations$correlation_sig = df_correlations$correlation
  }

  if (include_missings) {
    cnames = colnames(df)
  } else {
    cnames = unique(df_correlations[['x']])
  }

  # TODO standardize in heatmap function
  p = ggplot2::ggplot(df_correlations, ggplot2::aes(x = x, y = y)) +
    ggplot2::geom_tile(ggplot2::aes(fill = correlation)) +
    ggplot2::geom_text(ggplot2::aes(label = correlation_sig), col = color_text) +
    ggplot2::scale_x_discrete(limits = cnames) +
    ggplot2::scale_y_discrete(limits = rev(cnames)) +
    ggplot2::scale_fill_gradient2(low = color_value_negative,
                                  mid = '#FFFFFF',
                                  high = color_value_positive,
                                  limits = range(correlation_breaks()),
                                  breaks = correlation_breaks()) +
    ggplot2::expand_limits(fill = range(correlation_breaks())) +
    theme_corrtable()
  return(p)
}


library(devtools)
library(corrtable)
library(Hmisc)
#Checks
correlation_matrix(mtcars)
visualize_corr(mtcars)
visualize_corr(mtcars, show_significance = FALSE)

#Sorting out what's going on under the hood - working to get stars added
z <- as.matrix(mtcars)
cm <- rcorr(z)
p <- cm$P
stars <- ifelse(is.na(p), "   ", ifelse(p < .001, "***", ifelse(p < .01, "** ", ifelse(p < .05, "*  ", "   "))))

c <- as.character(df_correlations$correlation)
cs <- paste0(c, stars)

#Try adding this to get stars:

#Add significance levels if desired
if (show_significance) {
  sig <- as.matrix(df) #Needs to be a matrix before can put through Hmisc
  #Run correlation using Hmisc - want just the p-values to do stars
  cm <- Hmisc::rcorr(sig, type = type)
  p <- cm$P # Matrix of p-value
  #Define notions for significance levels; pulled from correlation_matrix.
  stars <- ifelse(is.na(p), "   ", ifelse(p < .001, "***", ifelse(p < .01, "** ", ifelse(p < .05, "*  ", "   "))))
  c = as.character(df_correlations$correlation) #Needs to be a character to combine
  df_correlations$correlation_sig = paste0(c, stars) #Combine in new column just for labels
} else {
  df_correlations$correlation_sig = df_correlations$correlation #Respecifying what to use if don't want stars
}

