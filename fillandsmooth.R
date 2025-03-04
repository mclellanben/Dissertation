# Filling NA pixels with mean of surrounding pixels
fill.na <- function(x, i = 5) { 
  if (is.na(x)[i]) { 
    return(mean(x, na.rm = TRUE)) 
  } else { 
    return(x[i]) 
  } 
}

# Defining the window for terra::focal operation
w <- matrix(1, 3, 3)

filled <- terra::focal(chm, w, fun = fill.na)
smoothed <- terra::focal(chm, w, fun = mean, na.rm = TRUE)

chms <- c(chm, filled, smoothed)
names(chms) <- c("Base", "Filled", "Smoothed")
plot(chms, col = col)
