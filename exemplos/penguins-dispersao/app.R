library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Palmer penguins 🐧🐧🐧"),
  sidebarLayout(
    sidebarPanel = sidebarPanel(
      selectInput(
        inputId = "var_x",
        label = "Variável eixo x",
        choices = names(palmerpenguins::penguins),
        selected = "bill_depth_mm"
      ),
      selectInput(
        inputId = "var_y",
        label = "Variável eixo y",
        choices = names(palmerpenguins::penguins),
        selected = "bill_length_mm"
      )
    ),
    mainPanel = mainPanel(
      plotOutput("grafico")
    )
  )
)

server <- function(input, output, session) {
  output$grafico <- renderPlot({
    palmerpenguins::penguins |>
      ggplot(aes(x = .data[[input$var_x]], y = .data[[input$var_y]])) +
      geom_point()
  })
}

shinyApp(ui, server)
