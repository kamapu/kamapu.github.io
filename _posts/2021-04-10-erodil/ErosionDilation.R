# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(devtools)
install_github("kamapu/spatialist")

library(spatialist)
library(raster)

r <- raster(file.path(path.package("spatialist"), "binras.tif"))
plot(r)

plot(stack(list(original=r,
						eroded=erodil_raster(r, dilation=FALSE),
						dilated=erodil_raster(r, erosion=FALSE))))

plot(stack(list(original=r,
						eroded_first=erodil_raster(r),
						dilated_first=erodil_raster(r, erosion_first=FALSE),
						both=erodil_raster(erodil_raster(r, erosion_first=FALSE)))))

Gingko <- raster("_posts/2021-04-10-erodil/images/Gingko.tif")

Gingko2 <- aggregate(Gingko, fact = 4,
		filename = "_posts/2021-04-10-erodil/images/Gingko2.tif",
		progress = "window")

Gingko2 <- raster("_posts/2021-04-10-erodil/images/Gingko2.tif")
plot(Ging)


Gingko2 <- erodil_raster(Gingko, erosion_first = TRUE)

writeRaster(Gingko2, "_posts/2021-04-10-erodil/images/Gingko.tif",
		overwrite = TRUE)


Gingko3 <- erodil_raster(Gingko2, erosion = FALSE, nt = 1)

plot(Gingko3, breaks = c(0, 0.5, 1), col = c("white", "black"))

writeRaster(Gingko3, "_posts/2021-04-10-erodil/images/Gingko3.tif")

plot(Gingko, breaks = c(0, 0.5, 1), col = c("white", "black"))
plot(Gingko2, breaks = c(0, 0.5, 1), col = c("white", "black"))




Gingko <- stack("_posts/2021-04-10-erodil/images/Gingko_leaf.tif")
plot(Gingko)

Gingko2 <- overlay(Gingko[[c("Gingko_leaf.1", "Gingko_leaf.2")]],
		fun = function(x, y) (x + y)/2)

plot(Gingko[[c("Gingko_leaf.1", "Gingko_leaf.2")]])

