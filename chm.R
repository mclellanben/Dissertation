library(lidR)
library(terra)

# Creating the DTM
dtm_tin <- rasterize_terrain(
  las, 
  res = 0.1, 
  algorithm = tin(),
)

# Normalising the point cloud
