library(shiny)
library(ggplot2)

vars <- names(mtcars)

ui <- fluidPage(
  titlePanel("Plotly"),
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
      plotly::plotlyOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  output$plot <- plotly::renderPlotly({
    p <- mtcars |>
      tibble::rownames_to_column() |>
      ggplot(aes(
        x = .data[[input$x]],
        y = .data[[input$y]],
        text = rowname
      )) +
      geom_point() +
      theme_minimal()

    plotly::ggplotly(p)
  })
}

shinyApp(ui, server)
