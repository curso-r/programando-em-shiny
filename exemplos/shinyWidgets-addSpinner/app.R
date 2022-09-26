library(shiny)

ui <- fluidPage(
  titlePanel("Exemplo shinyWidgets::addSpinner"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "variavel",
        label = "Escolha uma variável",
        choices = names(mtcars)
      )
    ),
    mainPanel(
      shinyWidgets::addSpinner(
        plotOutput(outputId = "histograma"),
        spin = "cube",
        color = "purple"
      )
    )
  )
)

server <- function(input, output, session) {

  output$histograma <- renderPlot({
    Sys.sleep(5)
    hist(mtcars[[input$variavel]])
  })


}

shinyApp(ui, server)
