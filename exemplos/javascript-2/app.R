library(shiny)

ui <- fluidPage(
  tags$p("Parágrafo 1", class = "vermelho"),
  tags$p("Parágrafo 2"),
  tags$p("Parágrafo 3", class = "vermelho"),
  tags$p("Parágrafo 4"),
  tags$p("Parágrafo 5", class = "vermelho"),
  tags$script(
    'document.getElementsByClassName("vermelho").forEach(
      function(paragrafo) {
        paragrafo.style = "color: red"
      }
    )'
  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
