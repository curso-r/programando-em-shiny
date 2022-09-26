library(shiny)
library(dplyr)

ui <- fluidPage(
  titlePanel("Exemplo reactValues"),
  sidebarLayout(
    sidebarPanel(
      h3("Remover uma linha"),
      numericInput(
        "linha",
        label = "Escolha uma linha para remover",
        value = 1,
        min = 1,
        max = nrow(mtcars)
      ),
      actionButton("remover", label = "Clique para remover"),
    ),
    mainPanel(
      reactable::reactableOutput("tabela")
    )
  )
)

server <- function(input, output, session) {

  rv_mtcars <- reactiveVal(value = mtcars)

  observeEvent(input$remover, {
    nova_mtcars <- rv_mtcars() |>
      slice(-input$linha)
    rv_mtcars(nova_mtcars)
  })

  output$tabela <- reactable::renderReactable({
    rv_mtcars() |>
      reactable::reactable(width = 600)
  })

}

shinyApp(ui, server)
