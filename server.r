library(shiny)
library(ggvis)
library(leaflet)
library(maps)

# load versaille stock accessions
accessions <- read.table("data/versaille_stock.csv", sep="\t")

shinyServer(function(input, output, session) {
  accessions$id <- c(1:nrow(accessions))

  map <- createLeafletMap(session, 'map')
})