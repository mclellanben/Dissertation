library(lidR)
library(terra)

# Creating the DTM (tin)

dtm_tin <- rasterize_terrain(
  las, 
  res = 0.25, 
  algorithm = tin(),
)

# Normalising the point cloud
nlas <- las - dtm_tin
