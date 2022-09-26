library(shiny)

ui <- fluidPage(
  "Histograma da variável mpg",
  plotOutput(outputId = "histograma")
)

server <- function(input, output, session) {

  output$histograma <- renderPlot({
    hist(mtcars$mpg)
  })

}

shinyApp(ui, server)
