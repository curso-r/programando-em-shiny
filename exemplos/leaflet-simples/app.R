library(shiny)

vars <- names(mtcars)

ui <- fluidPage(
  titlePanel("Leaflet"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "mag",
        "Magnitude",
        min = min(quakes$mag),
        max = max(quakes$mag),
        value = c(5, 6)
      ),
    ),
    mainPanel(
      leaflet::leafletOutput("mapa")
    )
  )
)

server <- function(input, output, session) {

  output$mapa <- leaflet::renderLeaflet({

    quakes |>
      dplyr::filter(mag >= input$mag[1], mag <= input$mag[2]) |>
      leaflet::leaflet() |>
      leaflet::addTiles() |>
      leaflet::addMarkers(
        lng = ~long,
        lat = ~lat
      )

  })

}

shinyApp(ui, server)
