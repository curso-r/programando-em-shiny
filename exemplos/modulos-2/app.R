library(shiny)

ui <- fluidPage(
  dispersao_ui("mod_dispersao")
)

server <- function(input, output, session) {
  dispersao_server("mod_dispersao")
}

shinyApp(ui, server)
