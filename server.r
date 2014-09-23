library(shiny)
library(ggvis)
library(leaflet)
library(maps)

# load versaille stock accessions
accessions <- read.table("data/versaille_stock.csv",
                         sep="\t", header=TRUE)

shinyServer(function(input, output, session) {
  accessions$id <- c(1:nrow(accessions))

  # render leaflet map
  map <- createLeafletMap(session, 'map')
  observe({
    map$addCircle(
      accessions$Latitude,
      accessions$Longitude,
      radius=rep(100000/max(5, input$map_zoom)^2, nrow(accessions)),
      layerId=accessions$id,
      options=list(color='#4A9', fill=TRUE, wight=1)
    )
  })
})