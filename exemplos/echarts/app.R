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
      echarts4r::echarts4rOutput("grafico")
    )
  )
)

server <- function(input, output, session) {
  output$grafico <- echarts4r::renderEcharts4r({
    mtcars |>
      echarts4r::e_charts_(x = input$x) |>
      echarts4r::e_scatter_(serie = input$y)
  })
}

shinyApp(ui, server)
