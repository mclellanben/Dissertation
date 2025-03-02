# Change into working directory

# Tiling las files. 500m tiles and 30m buffer. 
C:\LAStools\bin\lastile64.exe -i .\raw\*.laz -buffer 30 -odir .\tiled_w_buffer -tile_size 500 -olas -flag_as_withheld

# Removing noise. 2mx2m windows, removing points with less than 3 neighbours. 
C:\LAStools\bin\lasnoise64.exe -i .\tiled_w_buffer\*.las -odir .\cleaned -step 2 -isolated 3 -remove_noise -olas

# Ground classification. 10m step, 20cm spike, 40cm offset. 
C:\LAStools\bin\lasground_new64.exe -i .\cleaned\*.las -odir .\ground -step 10 -spike 0.2 -offset 0.4 -olas

<<<<<<< HEAD
# LAS normalisation, replacing Z. 
C:\LAStools\bin\lasheight64.exe -i .\ground\*.las -odir .\normalised -olas -replace_z 

# CHM creation (10cm resolution)
C:\LAStools\bin\las2dem64.exe -i .\normalised\*.las -odir .\chm -otif -step 0.1 -use_tile_bb 