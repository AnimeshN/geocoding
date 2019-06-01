install.packages('devtools')
library(devtools)
devtools::install_github("dkahle/ggmap")
library(ggmap)
register_google(key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
addresses <- read.csv("input.csv", header=TRUE, stringsAsFactors = FALSE)
address_list <- unique(addresses$address)

###CREATING A DATA FRAME TO APPEND VALUES TO ###
address <- c()
lat <- c()
long <- c()

###GEOCODE###
for (i in 1:length(address_list)) {
  coord <- geocode(address_list[i])
  address <- c(address,address_list[i])
  lat <- c(lat,coord[2])
  long <- c(long,coord[1])
}

address_with_lat_long <- data.frame(address,lat,long)
