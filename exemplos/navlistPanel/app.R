library(shiny)

ui <- fluidPage(
  titlePanel("App com navlistPanel"),
  navlistPanel(
    widths = c(2, 10),
    tabPanel(
      title = "Página 1",
      "Conteúdo da página 1"
    ),
    tabPanel(
      title = "Página 2",
      "Conteúdo da página 2"
    ),
    tabPanel(
      title = "Página 3",
      "Conteúdo da página 3"
    )
  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
