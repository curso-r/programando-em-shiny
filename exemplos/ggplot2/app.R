library(shiny)
library(ggplot2)

colunas <- names(mtcars)

ui <- fluidPage(
  titlePanel("Shiny app com um ggplot"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "varX",
        label = "Variável eixo X",
        choices = colunas
      ),
      selectInput(
        "varY",
        label = "Variável eixo Y",
        choices = colunas,
        selected = colunas[6]
      )
    ),
    mainPanel(
      plotOutput("grafico")
    )
  )
)

server <- function(input, output, session) {
  output$grafico <- renderPlot({
    ggplot(mtcars, aes(x = .data[[input$varX]], y = .data[[input$varY]])) +
      geom_point()
  })
}

shinyApp(ui, server)
