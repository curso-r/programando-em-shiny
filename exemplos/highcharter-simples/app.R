library(shiny)

vars <- names(mtcars)

ui <- fluidPage(
  titlePanel("Highcharts"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "x",
        "Eixo x",
        choices = vars
      ),
      selectInput(
        "y",
        "Eixo y",
        choices = vars,
        selected = vars[2]
      )
    ),
    mainPanel(
      highcharter::highchartOutput("grafico")
    )
  )
)

server <- function(input, output, session) {
  output$grafico <- highcharter::renderHighchart({
    highcharter::highchart() |>
      highcharter::hc_add_series(
        data = highcharter::list_parse2(mtcars[, c(input$x, input$y)]),
        type = "scatter"
      )
  })
}

shinyApp(ui, server)
